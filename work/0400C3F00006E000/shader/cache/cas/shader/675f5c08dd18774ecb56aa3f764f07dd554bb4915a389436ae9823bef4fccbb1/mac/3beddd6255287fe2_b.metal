#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    texture2d_array<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(int(gl_InstanceIndex));
    float _51 = as_type<float>(int(gl_BaseInstance));
    int _54 = as_type<int>(_49) - as_type<int>(_51);
    float _56 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _58 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    float _60 = rint(_56);
    float _62 = precise::max(_60, 0.0);
    uint _65 = uint(_62);
    uint _67 = clamp(_65, 0u, 65535u);
    float _69 = _58 + 0.5;
    float _71 = _69 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _73 = float(_54);
    float _75 = _73 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.vp_c3)._m0[5].x;
    float3 _197 = float3(_77, _71, float(int(_67)));
    float3 _202 = select(_197, float3(0.0), isnan(_197));
    float _79 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _202.xy, uint(rint(_202.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _202.xy, uint(rint(_202.z)), level(0.0)).x;
    float _81 = in.m_32.x;
    float _83 = in.m_32.y;
    float _85 = in.m_32.z;
    float _87 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[5].y, _71);
    float _89 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[5].x, _77);
    float _91 = _87 * 0.5;
    float _93 = _89 * 0.5;
    float _95 = _91 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _97 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _99 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].x, _97);
    float _101 = fma(_79, -0.5, 0.5);
    float _103 = fma(_79, 0.25, 0.25);
    out.m_35.x = _79;
    float _105 = fma(_101, _85, _103);
    float _107 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[0].x, _95);
    float _113 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _99);
    float _115 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].x, _107);
    float _117 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].x, _109);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[0].z, _111);
    float _121 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _115);
    float _123 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _117);
    float _125 = _119 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _127 = _113 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _129 = _121 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _131 = _123 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _125;
    out.gl_Position.y = _127;
    out.gl_Position.z = _129;
    out.gl_Position.w = _131;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(int(gl_InstanceIndex));
    float _51 = as_type<float>(int(gl_BaseInstance));
    int _54 = as_type<int>(_49) - as_type<int>(_51);
    float _56 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _58 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    float _60 = rint(_56);
    float _62 = precise::max(_60, 0.0);
    uint _65 = uint(_62);
    uint _67 = clamp(_65, 0u, 65535u);
    float _69 = _58 + 0.5;
    float _71 = _69 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _73 = float(_54);
    float _75 = _73 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.vp_c3)._m0[5].x;
    float3 _197 = float3(_77, _71, float(int(_67)));
    float3 _202 = select(_197, float3(0.0), isnan(_197));
    float _79 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _202.xy, uint(rint(_202.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _202.xy, uint(rint(_202.z)), level(0.0)).x;
    float _81 = in.m_32.x;
    float _83 = in.m_32.y;
    float _85 = in.m_32.z;
    float _87 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[5].y, _71);
    float _89 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[5].x, _77);
    float _91 = _87 * 0.5;
    float _93 = _89 * 0.5;
    float _95 = _91 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _97 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _99 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].x, _97);
    float _101 = fma(_79, -0.5, 0.5);
    float _103 = fma(_79, 0.25, 0.25);
    out.m_35.x = _79;
    float _105 = fma(_101, _85, _103);
    float _107 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[0].x, _95);
    float _113 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _99);
    float _115 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].x, _107);
    float _117 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].x, _109);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[0].z, _111);
    float _121 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _115);
    float _123 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _117);
    float _125 = _119 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _127 = _113 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _129 = _121 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _131 = _123 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _125;
    out.gl_Position.y = _127;
    out.gl_Position.z = _129;
    out.gl_Position.w = _131;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(int(gl_InstanceIndex));
    float _51 = as_type<float>(int(gl_BaseInstance));
    int _54 = as_type<int>(_49) - as_type<int>(_51);
    float _56 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _58 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    float _60 = rint(_56);
    float _62 = precise::max(_60, 0.0);
    uint _65 = uint(_62);
    uint _67 = clamp(_65, 0u, 65535u);
    float _69 = _58 + 0.5;
    float _71 = _69 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _73 = float(_54);
    float _75 = _73 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.vp_c3)._m0[5].x;
    float3 _197 = float3(_77, _71, float(int(_67)));
    float3 _202 = select(_197, float3(0.0), isnan(_197));
    float _79 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _202.xy, uint(rint(_202.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _202.xy, uint(rint(_202.z)), level(0.0)).x;
    float _81 = in.m_32.x;
    float _83 = in.m_32.y;
    float _85 = in.m_32.z;
    float _87 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[5].y, _71);
    float _89 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[5].x, _77);
    float _91 = _87 * 0.5;
    float _93 = _89 * 0.5;
    float _95 = _91 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _97 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _99 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].x, _97);
    float _101 = fma(_79, -0.5, 0.5);
    float _103 = fma(_79, 0.25, 0.25);
    out.m_35.x = _79;
    float _105 = fma(_101, _85, _103);
    float _107 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[0].x, _95);
    float _113 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _99);
    float _115 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].x, _107);
    float _117 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].x, _109);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[0].z, _111);
    float _121 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _115);
    float _123 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _117);
    float _125 = _119 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _127 = _113 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _129 = _121 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _131 = _123 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _125;
    out.gl_Position.y = _127;
    out.gl_Position.z = _129;
    out.gl_Position.w = _131;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

