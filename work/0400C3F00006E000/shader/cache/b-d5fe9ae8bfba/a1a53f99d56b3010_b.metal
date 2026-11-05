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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    const device _23* vp_s0 [[id(1)]];
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    sampler vp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_36 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _149 = float2(0.5);
    float _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_149, float2(0.0), isnan(_149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_149, float2(0.0), isnan(_149)), level(0.0)).x;
    float2 _157 = float2(0.5);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_157, float2(0.0), isnan(_157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_157, float2(0.0), isnan(_157)), level(0.0)).y;
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _67 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _69 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _71 = in.m_36.y;
    float _73 = in.m_36.x;
    float _75 = _67 * _61;
    float _77 = _69 * _63;
    float _79 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _83 = -_79;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].w, _83);
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].w, _81);
    float _89 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _91 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.gl_Position.x = _91;
    out.gl_Position.y = _89;
    out.m_39.y = _71;
    out.m_39.x = _73;
    float _93 = _57 * _59;
    float _95 = float(as_type<int>(_65));
    float _97 = _95 * (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _99 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _101 = _71 + _99;
    float _103 = _93 * _97;
    float _105 = _101 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _107 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _109 = _73 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _105);
    float _117 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _111);
    bool _121 = _113 > 0.0;
    bool _123 = isnan(_113);
    bool _125 = _121 || _123;
    bool _127 = isnan(0.0);
    bool _129 = _125 || _127;
    float _131 = _115 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _133 = _117 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    out.m_41.x = _113;
    out.m_43.x = _131;
    out.m_43.y = _133;
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _149 = float2(0.5);
    float _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_149, float2(0.0), isnan(_149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_149, float2(0.0), isnan(_149)), level(0.0)).x;
    float2 _157 = float2(0.5);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_157, float2(0.0), isnan(_157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_157, float2(0.0), isnan(_157)), level(0.0)).y;
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _67 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _69 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _71 = in.m_36.y;
    float _73 = in.m_36.x;
    float _75 = _67 * _61;
    float _77 = _69 * _63;
    float _79 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _83 = -_79;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].w, _83);
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].w, _81);
    float _89 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _91 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.gl_Position.x = _91;
    out.gl_Position.y = _89;
    out.m_39.y = _71;
    out.m_39.x = _73;
    float _93 = _57 * _59;
    float _95 = float(as_type<int>(_65));
    float _97 = _95 * (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _99 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _101 = _71 + _99;
    float _103 = _93 * _97;
    float _105 = _101 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _107 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _109 = _73 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _105);
    float _117 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _111);
    bool _121 = _113 > 0.0;
    bool _123 = isnan(_113);
    bool _125 = _121 || _123;
    bool _127 = isnan(0.0);
    bool _129 = _125 || _127;
    float _131 = _115 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _133 = _117 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    out.m_41.x = _113;
    out.m_43.x = _131;
    out.m_43.y = _133;
    if (_129)
    {
        return out;
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _149 = float2(0.5);
    float _57 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_149, float2(0.0), isnan(_149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_149, float2(0.0), isnan(_149)), level(0.0)).x;
    float2 _157 = float2(0.5);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_157, float2(0.0), isnan(_157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_157, float2(0.0), isnan(_157)), level(0.0)).y;
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _67 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _69 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _71 = in.m_36.y;
    float _73 = in.m_36.x;
    float _75 = _67 * _61;
    float _77 = _69 * _63;
    float _79 = _75 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _83 = -_79;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].w, _83);
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].w, _81);
    float _89 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _91 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.gl_Position.x = _91;
    out.gl_Position.y = _89;
    out.m_39.y = _71;
    out.m_39.x = _73;
    float _93 = _57 * _59;
    float _95 = float(as_type<int>(_65));
    float _97 = _95 * (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _99 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _101 = _71 + _99;
    float _103 = _93 * _97;
    float _105 = _101 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _107 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _109 = _73 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _105);
    float _117 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _111);
    bool _121 = _113 > 0.0;
    bool _123 = isnan(_113);
    bool _125 = _121 || _123;
    bool _127 = isnan(0.0);
    bool _129 = _125 || _127;
    float _131 = _115 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _133 = _117 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    out.m_41.x = _113;
    out.m_43.x = _131;
    out.m_43.y = _133;
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

