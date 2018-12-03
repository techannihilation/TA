
--[[ engine death messages as of 13/09/13:
    "Player %i (%s) resigned and is now spectating!"     -- when a player resigns (note: these ones don't get parsed by messages.lua anyway)
	"Team %i is no more" ]								 -- when a team dies because all its players resigned (note: can't use %s when replacing these)
	"Team %i (lead by %s) is no more" 					 -- when a team dies because it was killed
--]]
	
--[[ 
How TA death messages work:
1. Check /luarules/game_death_messages.lua
--]]

return {}