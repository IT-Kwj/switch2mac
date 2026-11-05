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
    float _41 = in.m_29.w;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.z;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = _55 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _61 = _57 + (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float2 _144 = float2(_61, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_144, float2(0.0), isnan(_144)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_144, float2(0.0), isnan(_144)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _157 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_157, float2(0.0), isnan(_157)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_157, float2(0.0), isnan(_157)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _167 = float2(_57, _55);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _177 = float2(_61, _59);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_177, float2(0.0), isnan(_177)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_177, float2(0.0), isnan(_177)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float _71 = precise::max(_63, _65);
    float _73 = precise::max(_67, _69);
    float _75 = precise::max(_71, _73);
    bool _79 = _75 != 1.0;
    bool _81 = isnan(_75);
    bool _83 = _79 || _81;
    bool _85 = isnan(1.0);
    bool _87 = _83 || _85;
    float _89 = -_75;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _93 = 1.0 / _91;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _97 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, _95);
    int _100 = _87 ? as_type<int>(_97) : 1065353216;
    out.m_32.x = as_type<float>(_100);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.w;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.z;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = _55 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _61 = _57 + (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float2 _144 = float2(_61, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_144, float2(0.0), isnan(_144)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_144, float2(0.0), isnan(_144)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _157 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_157, float2(0.0), isnan(_157)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_157, float2(0.0), isnan(_157)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _167 = float2(_57, _55);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float2 _177 = float2(_61, _59);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_177, float2(0.0), isnan(_177)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_177, float2(0.0), isnan(_177)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float _71 = precise::max(_63, _65);
    float _73 = precise::max(_67, _69);
    float _75 = precise::max(_71, _73);
    bool _79 = _75 != 1.0;
    bool _81 = isnan(_75);
    bool _83 = _79 || _81;
    bool _85 = isnan(1.0);
    bool _87 = _83 || _85;
    float _89 = -_75;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _93 = 1.0 / _91;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _97 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, _95);
    int _100 = _87 ? as_type<int>(_97) : 1065353216;
    out.m_32.x = as_type<float>(_100);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

