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
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_27.x;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * _39;
    float _49 = fma(_41, _41, _47);
    float _51 = rsqrt(_49);
    float _53 = _51 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _55 = _41 * _53;
    float _57 = _39 * _53;
    float _59 = _55 + _43;
    float _61 = _57 + _45;
    float _63 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _65 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _67 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _69 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _71 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _73 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float2 _166 = float2(_63, _65);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_166, float2(0.0), isnan(_166))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_166, float2(0.0), isnan(_166))).x;
    float2 _178 = float2(_67, _69);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_178, float2(0.0), isnan(_178))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_178, float2(0.0), isnan(_178))).y;
    float2 _186 = float2(_71, _73);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_186, float2(0.0), isnan(_186))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_186, float2(0.0), isnan(_186))).z;
    float _81 = _75 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _83 = _77 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _85 = _79 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _87 = _81 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _89 = _83 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _91 = _85 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _87;
    out.m_32.y = _89;
    out.m_32.z = _91;
    return out;
}

