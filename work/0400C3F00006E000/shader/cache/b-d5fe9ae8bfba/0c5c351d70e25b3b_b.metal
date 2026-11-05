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
    float4 m_29 [[user(locn0), center_no_perspective]];
    float4 m_27 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.x;
    float _41 = in.m_27.y;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _43 + _39;
    float _49 = _45 + _41;
    float _51 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].x, _47);
    float _53 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].x, _49);
    float _55 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].y, _47);
    float _57 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].y, _49);
    float _59 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].z, _47);
    float _61 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].z, _49);
    float2 _140 = float2(_51, _53);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_140, float2(0.0), isnan(_140))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_140, float2(0.0), isnan(_140))).x;
    float2 _152 = float2(_39, _41);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_152, float2(0.0), isnan(_152))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_152, float2(0.0), isnan(_152))).x;
    float2 _160 = float2(_55, _57);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_160, float2(0.0), isnan(_160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_160, float2(0.0), isnan(_160))).y;
    float2 _168 = float2(_39, _41);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_168, float2(0.0), isnan(_168))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_168, float2(0.0), isnan(_168))).y;
    float2 _176 = float2(_39, _41);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).z;
    float2 _184 = float2(_59, _61);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_184, float2(0.0), isnan(_184))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_184, float2(0.0), isnan(_184))).z;
    float _75 = _63 + _65;
    float _77 = _67 + _69;
    float _79 = _73 + _71;
    float _81 = _75 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _83 = _77 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _85 = _79 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _81;
    out.m_32.y = _83;
    out.m_32.z = _85;
    return out;
}

