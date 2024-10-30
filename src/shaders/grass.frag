#version 450
#extension GL_ARB_separate_shader_objects : enable

#define LIGHT_DIR vec3(1.f, 2.f, 1.f)

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
    // DONE: Compute fragment color

    vec3 baseColor = vec3(0.2, 0.6, 0.2);
    
    float variation = 0.1 * sin(fs_v1.x * 10.f) * sin(fs_v1.z * 10.f);
    
    vec3 finalColor = baseColor * (0.8 + variation);
    //change the max term for lighting shenanigans
    finalColor *= max(0.7, abs(dot(LIGHT_DIR, fs_v2)));
    
    outColor = vec4(finalColor, 1.f);
}
