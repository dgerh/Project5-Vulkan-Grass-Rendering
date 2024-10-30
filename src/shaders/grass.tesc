#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare tessellation control shader inputs and outputs
layout(location = 0) in vec4 ctrl_v0[];
layout(location = 1) in vec4 ctrl_v1[];
layout(location = 2) in vec4 ctrl_v2[];
layout(location = 3) in vec4 ctrl_up[];

layout(location = 0) out vec4 eval_v1[];
layout(location = 1) out vec4 eval_v2[];
layout(location = 2) out vec4 eval_up[];

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = ctrl_v0[gl_InvocationID];

	// DONE: Write any shader outputs
    eval_v1[gl_InvocationID] = ctrl_v1[gl_InvocationID];
    eval_v2[gl_InvocationID] = ctrl_v2[gl_InvocationID];
    eval_up[gl_InvocationID] = ctrl_up[gl_InvocationID];

	// DONE: Set level of tesselation
    float level = 12;
    gl_TessLevelInner[0] = level;
    gl_TessLevelInner[1] = level;
    gl_TessLevelOuter[0] = level;
    gl_TessLevelOuter[1] = level;
    gl_TessLevelOuter[2] = level;
    gl_TessLevelOuter[3] = level;
}
