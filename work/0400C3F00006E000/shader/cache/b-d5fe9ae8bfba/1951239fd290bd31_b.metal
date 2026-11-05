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

struct spvDescriptorSetBuffer0
{
    texture2d_array<float> vp_t_tcb_8 [[id(0)]];
    sampler vp_t_tcb_8Smplr [[id(1)]];
    sampler vp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_24 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
    float4 m_28 [[user(locn2)]];
    float4 m_30 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_21 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _108 = float3(0.5, 0.5, float(0));
    float3 _113 = select(_108, float3(0.0), isnan(_108));
    float4 _44 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _113.xy, uint(rint(_113.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _113.xy, uint(rint(_113.z)), level(0.0)).xyzw;
    float _47 = _44.x;
    float _49 = _44.y;
    float _51 = _44.z;
    float _53 = _44.w;
    float3 _126 = float3(0.5, 0.5, float(1));
    float3 _128 = select(_126, float3(0.0), isnan(_126));
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _128.xy, uint(rint(_128.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _128.xy, uint(rint(_128.z)), level(0.0)).xyzw;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float _63 = _55.w;
    float3 _141 = float3(0.5, 0.5, float(2));
    float3 _143 = select(_141, float3(0.0), isnan(_141));
    float4 _65 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _143.xy, uint(rint(_143.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _143.xy, uint(rint(_143.z)), level(0.0)).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float3 _156 = float3(0.5, 0.5, float(3));
    float3 _158 = select(_156, float3(0.0), isnan(_156));
    float4 _75 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _158.xy, uint(rint(_158.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _158.xy, uint(rint(_158.z)), level(0.0)).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = in.m_21.x;
    float _87 = in.m_21.y;
    float _89 = _85 * 2.0;
    float _91 = _87 * 2.0;
    out.gl_Position.x = _89;
    out.gl_Position.y = _91;
    out.m_24.x = _47;
    out.m_24.y = _49;
    out.m_24.z = _51;
    out.m_24.w = _53;
    out.m_26.x = _57;
    out.m_26.y = _59;
    out.m_26.z = _61;
    out.m_26.w = _63;
    out.m_28.x = _67;
    out.m_28.y = _69;
    out.m_28.z = _71;
    out.m_28.w = _73;
    out.m_30.x = _77;
    out.m_30.y = _79;
    out.m_30.z = _81;
    out.m_30.w = _83;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _108 = float3(0.5, 0.5, float(0));
    float3 _113 = select(_108, float3(0.0), isnan(_108));
    float4 _44 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _113.xy, uint(rint(_113.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _113.xy, uint(rint(_113.z)), level(0.0)).xyzw;
    float _47 = _44.x;
    float _49 = _44.y;
    float _51 = _44.z;
    float _53 = _44.w;
    float3 _126 = float3(0.5, 0.5, float(1));
    float3 _128 = select(_126, float3(0.0), isnan(_126));
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _128.xy, uint(rint(_128.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _128.xy, uint(rint(_128.z)), level(0.0)).xyzw;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float _63 = _55.w;
    float3 _141 = float3(0.5, 0.5, float(2));
    float3 _143 = select(_141, float3(0.0), isnan(_141));
    float4 _65 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _143.xy, uint(rint(_143.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _143.xy, uint(rint(_143.z)), level(0.0)).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float3 _156 = float3(0.5, 0.5, float(3));
    float3 _158 = select(_156, float3(0.0), isnan(_156));
    float4 _75 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _158.xy, uint(rint(_158.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _158.xy, uint(rint(_158.z)), level(0.0)).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = in.m_21.x;
    float _87 = in.m_21.y;
    float _89 = _85 * 2.0;
    float _91 = _87 * 2.0;
    out.gl_Position.x = _89;
    out.gl_Position.y = _91;
    out.m_24.x = _47;
    out.m_24.y = _49;
    out.m_24.z = _51;
    out.m_24.w = _53;
    out.m_26.x = _57;
    out.m_26.y = _59;
    out.m_26.z = _61;
    out.m_26.w = _63;
    out.m_28.x = _67;
    out.m_28.y = _69;
    out.m_28.z = _71;
    out.m_28.w = _73;
    out.m_30.x = _77;
    out.m_30.y = _79;
    out.m_30.z = _81;
    out.m_30.w = _83;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float3 _108 = float3(0.5, 0.5, float(0));
    float3 _113 = select(_108, float3(0.0), isnan(_108));
    float4 _44 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _113.xy, uint(rint(_113.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _113.xy, uint(rint(_113.z)), level(0.0)).xyzw;
    float _47 = _44.x;
    float _49 = _44.y;
    float _51 = _44.z;
    float _53 = _44.w;
    float3 _126 = float3(0.5, 0.5, float(1));
    float3 _128 = select(_126, float3(0.0), isnan(_126));
    float4 _55 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _128.xy, uint(rint(_128.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _128.xy, uint(rint(_128.z)), level(0.0)).xyzw;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float _63 = _55.w;
    float3 _141 = float3(0.5, 0.5, float(2));
    float3 _143 = select(_141, float3(0.0), isnan(_141));
    float4 _65 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _143.xy, uint(rint(_143.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _143.xy, uint(rint(_143.z)), level(0.0)).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float3 _156 = float3(0.5, 0.5, float(3));
    float3 _158 = select(_156, float3(0.0), isnan(_156));
    float4 _75 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _158.xy, uint(rint(_158.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _158.xy, uint(rint(_158.z)), level(0.0)).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = in.m_21.x;
    float _87 = in.m_21.y;
    float _89 = _85 * 2.0;
    float _91 = _87 * 2.0;
    out.gl_Position.x = _89;
    out.gl_Position.y = _91;
    out.m_24.x = _47;
    out.m_24.y = _49;
    out.m_24.z = _51;
    out.m_24.w = _53;
    out.m_26.x = _57;
    out.m_26.y = _59;
    out.m_26.z = _61;
    out.m_26.w = _63;
    out.m_28.x = _67;
    out.m_28.y = _69;
    out.m_28.z = _71;
    out.m_28.w = _73;
    out.m_30.x = _77;
    out.m_30.y = _79;
    out.m_30.z = _81;
    out.m_30.w = _83;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_24.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_24.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_24.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_24.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

