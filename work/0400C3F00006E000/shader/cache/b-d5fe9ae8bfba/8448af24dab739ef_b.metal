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
    float2 _126 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_126, float2(0.0), isnan(_126))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_126, float2(0.0), isnan(_126))).x;
    float _61 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 != 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    int _78 = 0;
    if (_75)
    {
        _78 = as_type<int>(_63);
    }
    int _80 = _78;
    int _82 = 0;
    if (_75)
    {
        _82 = as_type<int>(_63);
    }
    int _84 = _82;
    int _86 = 0;
    if (_75)
    {
        _86 = 0;
    }
    int _88 = _86;
    int _90 = 0;
    if (_75)
    {
        _90 = 1065353216;
    }
    int _92 = _90;
    if (_75)
    {
        out.m_32.x = as_type<float>(_80);
        out.m_32.y = as_type<float>(_84);
        out.m_32.z = as_type<float>(_88);
        out.m_32.w = as_type<float>(_92);
        return out;
    }
    discard_fragment();
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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _126 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_126, float2(0.0), isnan(_126))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_126, float2(0.0), isnan(_126))).x;
    float _61 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 != 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    int _78 = 0;
    if (_75)
    {
        _78 = as_type<int>(_63);
    }
    int _80 = _78;
    int _82 = 0;
    if (_75)
    {
        _82 = as_type<int>(_63);
    }
    int _84 = _82;
    int _86 = 0;
    if (_75)
    {
        _86 = 0;
    }
    int _88 = _86;
    int _90 = 0;
    if (_75)
    {
        _90 = 1065353216;
    }
    int _92 = _90;
    if (_75)
    {
        out.m_32.x = as_type<float>(_80);
        out.m_32.y = as_type<float>(_84);
        out.m_32.z = as_type<float>(_88);
        out.m_32.w = as_type<float>(_92);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_32)};
}

