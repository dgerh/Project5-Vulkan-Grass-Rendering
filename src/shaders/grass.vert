
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// DONE: Declare vertex shader inputs and outputs

layout(location = 0) in vec4 vs_v0;
layout(location = 1) in vec4 vs_v1;
layout(location = 2) in vec4 vs_v2;
layout(location = 3) in vec4 vs_up;

layout(location = 0) out vec4 tc_v0;
layout(location = 1) out vec4 tc_v1;
layout(location = 2) out vec4 tc_v2;
layout(location = 3) out vec4 tc_up;

void main() {
	// DONE: Write gl_Position and any other shader outputs
    vec4 model_v0_H = model * vec4(vs_v0.xyz, 1.0);
    tc_v0 = vec4((model_v0_H / model_v0_H.w).xyz, vs_v0.w);

    vec4 model_v1_H = model * vec4(vs_v1.xyz, 1.0);
    tc_v1 = vec4((model_v1_H / model_v1_H.w).xyz, vs_v1.w);

    vec4 model_v2_H = model * vec4(vs_v2.xyz, 1.0);
    tc_v2 = vec4((model_v2_H / model_v2_H.w).xyz, vs_v2.w);

    vec4 model_up_H = model * vec4(vs_up.xyz, 0.0);
    tc_up = vec4((model_up_H / model_up_H.w).xyz, vs_up.w);
}
