#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare fragment shader inputs

layout(location = 0) in vec3 fs_v1;
layout(location = 1) in vec3 fs_v2;
layout(location = 2) in vec2 fs_up;

layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color

    float length = isnan(length(fs_v2)) ? 0.f : length(fs_v2);
    length += 0.7;
    outColor = vec4(0.2, mix(0.3, 0.7, length), 0.2, 1.f);
}
