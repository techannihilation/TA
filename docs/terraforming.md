# Terraform balancing

Terraforming measures displacement against `Spring.GetGroundOrigHeight(x, z)`
at every affected heightmap vertex, including the edge slopes. Completed jobs,
queued jobs and other players' terraform cannot reset this baseline.

## Cost and hard limit

Moving further from the original height has marginal work cost
`2^(displacement / doublingHeight)`. The work charged for a height interval
is the integral of that curve, rather than the interval's height difference
multiplied by its final cost. Splitting one dig into several small orders
therefore has the same deformation work cost. The existing one-second minimum
job duration still applies to each order.

The hard displacement limit is the inverse of that same curve:

```
maximumDisplacement = doublingHeight * log2(maximumMultiplier)
```

Default marginal cost multipliers:

| Displacement above or below original terrain | Multiplier |
| --- | --- |
| 0 | 1 |
| 10 | 2 |
| 20 | 4 |
| 30 | 8 |
| 40 | 16 |
| 50 | 32 |
| More than 50 | Rejected |

For example, moving a single vertex from its original height to a displacement
of 50 requires about 447.24 units of work, compared with the previous 50. Moving
it from displacement 40 to 50 requires about 230.83 work. Returning toward the
original height costs one unit of work per height unit. Crossing the original
height first incurs ordinary restoration work, then exponential work on the
other side. Restoration never refunds resources.

The limit is enforced when preparing a job and again before writing its entire
terrain grid. Invalid targets are rejected as a whole, with a team message;
they are not silently clipped into a different shape. Level, ramp, extend,
smooth and restore all use this path. The existing absolute height and slope
checks also apply.

Explosions and map scripts can leave terrain outside the terraform limit.
Terraform can restore that terrain, including partial restoration on the same
side of the baseline, but cannot deepen it or move it to an out-of-bounds
height on the other side. Application rechecks the current terrain so a stale
restoration job cannot create a new out-of-bounds deformation.

## Lobby options

All options appear in **Tech Annihilation - Terraforming**.

| Mod-option key | Default | Meaning |
| --- | --- | --- |
| `mo_terraform_cost_doubling` | `10` | Height units required to double marginal work cost. |
| `mo_terraform_max_multiplier` | `32` | Maximum marginal multiplier; together with the doubling height this sets the hard cap. |
| `mo_terraform_metal_cost` | `0` | Metal per unit of deformation work; zero disables metal spending. |
| `mo_terraform_energy_cost` | `1` | Energy per unit of deformation work; zero disables energy spending. |

The first two defaults produce a cap of **50 height units above or below each
vertex's original map height**, regardless of the team's economy. For example,
keeping the doubling height at 10 and setting the maximum multiplier to 16
produces a 40-unit cap; setting it to 64 produces a 60-unit cap. A multiplier
of 1 permits restoration only.

For metal balance experiments, `mo_terraform_metal_cost = 0.01` is a starting
point to test, not a settled balance recommendation. A 0-to-50 deformation at
one vertex then costs about 4.47 metal; add the work at every affected vertex,
including edge slopes, for the full job cost. The default energy rate of 1
charges about 447.24 energy for that same vertex. Energy and metal rates can
be tuned independently; these initial rates need in-game balance testing.
Setting both resource rates to zero leaves only the builder time cost.

Build time scales with the same exponential work, using the existing builder
speed and terraform speed multiplier of 40:

```
durationSeconds = max(1, work / (builderBuildSpeed * 40))
```

Duration is rounded up to whole simulation frames. The one-second minimum
means very small jobs may still take the same time despite different work costs.

Metal and energy are spent together evenly over the job's work frames, using
the engine's atomic `Spring.UseTeamResource(teamID, {m = ..., e = ...})` call.
If either required resource is unavailable, neither is spent and work pauses.
The final payment accounts for floating-point remainder. Walking, being stunned
and waiting for resources do not progress the job or spend resources. The
existing job preview displays both remaining resources and a waiting-for-resources
status. Canceling a job does not refund performed work and does not charge for
the unfinished portion; as before, terrain changes are applied only when the
job completes.

## Validation

From the repository root:

```sh
lua5.1 tests/terraform/run.lua
luajit tests/terraform/run.lua
```

The regression suite runs real geometry, command parsing, frozen-grid checks
and synced task updates with a stubbed Spring API. It covers repeated digs,
local baselines, both signs of displacement, edge slopes, all five tools,
external terrain restoration, mod-option tuning, independent energy and metal
costs, atomic payment stalls, pauses, canceling, exact total payment and build
time scaling. A small existing Extend command-selection
crash is also fixed: its profile sample count was used as the number of
geometry endpoints.

These checks do not replace an in-engine balance/play test. In particular,
the 50-unit cap, growth rate, metal/energy rates and preview readability should be
evaluated on representative flat, cliff and water maps before settling defaults.
