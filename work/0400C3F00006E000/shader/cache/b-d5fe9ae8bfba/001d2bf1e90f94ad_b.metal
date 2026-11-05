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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _61 = _55 + _59;
    float _63 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _67 = _55 + _65;
    float _69 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _73 = _55 + _71;
    float _75 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _79 = _55 + _77;
    float _81 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _193 = float2(_55, _57);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_193, float2(0.0), isnan(_193))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_193, float2(0.0), isnan(_193))).x;
    float2 _205 = float2(_61, _57);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_205, float2(0.0), isnan(_205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_205, float2(0.0), isnan(_205))).x;
    float2 _213 = float2(_63, _57);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_213, float2(0.0), isnan(_213))).x;
    float2 _221 = float2(_67, _57);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_221, float2(0.0), isnan(_221))).x;
    float2 _229 = float2(_69, _57);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_229, float2(0.0), isnan(_229))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_229, float2(0.0), isnan(_229))).x;
    float2 _237 = float2(_73, _57);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_237, float2(0.0), isnan(_237))).x;
    float2 _245 = float2(_75, _57);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245))).x;
    float2 _253 = float2(_79, _57);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_253, float2(0.0), isnan(_253))).x;
    float2 _261 = float2(_81, _57);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_261, float2(0.0), isnan(_261))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_261, float2(0.0), isnan(_261))).x;
    float _101 = _83 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _103 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].x, _101);
    float _105 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].x, _103);
    float _107 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].y, _105);
    float _109 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[18].y, _107);
    float _111 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _109);
    float _113 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _111);
    float _115 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[18].w, _113);
    float _117 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[18].w, _115);
    out.m_32.x = _117;
    return out;
}

