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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_29.x;
    float _43 = in.m_29.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _47 = _43 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float2 _127 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_127, float2(0.0), isnan(_127))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_127, float2(0.0), isnan(_127))).x;
    float _51 = in.m_31.y;
    float _53 = in.m_31.x;
    float _55 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _57 = -_55;
    float _59 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _61 = fma(_57, _51, _59);
    float _63 = -_55;
    float _65 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _67 = fma(_63, _53, _65);
    float _69 = -_55;
    float _71 = -(*spvDescriptorSet0.fp_c4)._m0[4].z;
    float _73 = _69 + _71;
    float _75 = _61 * _61;
    float _77 = fma(_67, _67, _75);
    float _79 = fma(_73, _73, _77);
    float _81 = sqrt(_79);
    float _83 = _81 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = abs(_85);
    float _89 = log2(_87);
    float _91 = _89 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _93 = exp2(_91);
    float _95 = -_93;
    float _97 = _95 + 1.0;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _99 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _103 = _99 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _105 = _99 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    out.m_34.x = _101;
    out.m_34.y = _103;
    out.m_34.z = _105;
    out.m_34.w = (*spvDescriptorSet0.fp_c4)._m0[5].w;
    return out;
}

