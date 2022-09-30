#if (GL_FRAGMENT_PRECISION_HIGH == 1)
// ancient GL3 ATI drivers confuse GLSL for GLSL-ES and require this
precision highp float;
#else
precision mediump float;
#endif

uniform vec4 shadowParams;

void main() {
	vec3 offsetVec = vec3(0.0, 0.0, 0.0);
	vec4 vertexPos = gl_Vertex + vec4(offsetVec, 0.0);
	vec4 vertexShadowPos = gl_ModelViewMatrix * vertexPos;
	vertexShadowPos.xy *= (inversesqrt(abs(vertexShadowPos.xy) + shadowParams.zz) + shadowParams.ww);
	vertexShadowPos.xy += shadowParams.xy;
	gl_Position = gl_ProjectionMatrix * vertexShadowPos;
}
