#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 tc_v1[];
layout(location = 1) in vec4 tc_v2[];
layout(location = 2) in vec4 tc_up[];

layout(location = 0) out vec3 fs_pos;
layout(location = 1) out vec3 fs_nor;
layout(location = 2) out vec2 fs_uv;

float interp_tri_tip(float u, float v, float tau) {
    return 0.5 + (u - 0.5) * ((1 - max(v - tau, 0)) / (1 - tau));
}

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

	// DONE: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    //params
    vec3 v0 = gl_in[0].gl_Position.xyz;
    float theta = gl_in[0].gl_Position.w;
    vec3 v1 = tc_v1[0].xyz;
    vec3 v2 = tc_v2[0].xyz;
    vec3 up = tc_up[0].xyz;
    float width = tc_v2[0].w;
    vec3 t1 = vec3(cos(theta), 0, sin(theta));

    //interp values
    vec3 a = v0 + v * (v1 - v0);
    vec3 b = v1 + v * (v2 - v1);
    vec3 c = a + v * (b - a);
    vec3 c0 = c - width * t1;
    vec3 c1 = c + width * t1;
    vec3 t0 = normalize(b - a);
    vec3 nor = normalize(cross(t0, t1));

    float t = interp_tri_tip(u, v, 0.05);
    vec3 pos = (1.f - t) * c0 + t * c1;

    //outputs
    gl_Position = camera.proj * camera.view * vec4(pos, 1.0);
    fs_pos = pos;
    fs_nor = nor;
    fs_uv = vec2(u, v);
}
