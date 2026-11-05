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
    texture2d<float> fp_t_tcb_C [[id(0)]];
    sampler fp_t_tcb_CSmplr [[id(1)]];
    sampler fp_t_tcb_CSmplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _116 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_116, float2(0.0), isnan(_116))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_116, float2(0.0), isnan(_116))).x;
    bool _57 = _53 != 0.0;
    bool _59 = isnan(_53);
    bool _61 = _57 || _59;
    bool _63 = isnan(0.0);
    bool _65 = _61 || _63;
    int _68 = 0;
    if (_65)
    {
        _68 = as_type<int>(_53);
    }
    int _70 = _68;
    int _72 = 0;
    if (_65)
    {
        _72 = as_type<int>(_53);
    }
    int _74 = _72;
    int _76 = 0;
    if (_65)
    {
        _76 = 0;
    }
    int _78 = _76;
    int _80 = 0;
    if (_65)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    if (_65)
    {
        out.m_26.x = as_type<float>(_70);
        out.m_26.y = as_type<float>(_74);
        out.m_26.z = as_type<float>(_78);
        out.m_26.w = as_type<float>(_82);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_26 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _116 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_116, float2(0.0), isnan(_116))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_116, float2(0.0), isnan(_116))).x;
    bool _57 = _53 != 0.0;
    bool _59 = isnan(_53);
    bool _61 = _57 || _59;
    bool _63 = isnan(0.0);
    bool _65 = _61 || _63;
    int _68 = 0;
    if (_65)
    {
        _68 = as_type<int>(_53);
    }
    int _70 = _68;
    int _72 = 0;
    if (_65)
    {
        _72 = as_type<int>(_53);
    }
    int _74 = _72;
    int _76 = 0;
    if (_65)
    {
        _76 = 0;
    }
    int _78 = _76;
    int _80 = 0;
    if (_65)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    if (_65)
    {
        out.m_26.x = as_type<float>(_70);
        out.m_26.y = as_type<float>(_74);
        out.m_26.z = as_type<float>(_78);
        out.m_26.w = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_26)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_26)};
}

