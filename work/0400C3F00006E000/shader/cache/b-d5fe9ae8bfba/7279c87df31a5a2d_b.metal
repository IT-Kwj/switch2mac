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
    float2 _143 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_143, float2(0.0), isnan(_143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_143, float2(0.0), isnan(_143))).x;
    float _61 = _55 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _63 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _65 = 0.0 + _61;
    float _67 = precise::clamp(_65, 0.0, 1.0);
    float _69 = -_61;
    float _71 = _69 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _73 = precise::clamp(_71, 0.0, 1.0);
    float _75 = _67 * _73;
    float _77 = 0.0 + _63;
    float _79 = precise::clamp(_77, 0.0, 1.0);
    float _81 = _75 * _79;
    float _83 = -_63;
    float _85 = _83 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _91 = fma(_81, _87, _89);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = -_59;
    float _97 = _95 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _101 = _97 + _99;
    float _103 = precise::max(0.0, _101);
    float _105 = precise::min(_103, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _107 = -_105;
    float _109 = fma(_107, _93, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    out.m_32.x = _109;
    out.m_32.y = _109;
    out.m_32.z = _109;
    out.m_32.w = _109;
    return out;
}

