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
    texture2d<float> fp_t_tcb_A [[id(0)]];
    sampler fp_t_tcb_ASmplr [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_ASmplr_w [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_25.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_25.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _150 = float2(_51, _53);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_150, float2(0.0), isnan(_150))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _167 = float2(_51, _53);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _61 * 0.58700001239776611328125;
    float _75 = _69 * 0.58700001239776611328125;
    float _77 = fma(_59, 0.2989999949932098388671875, _73);
    float _79 = fma(_67, 0.2989999949932098388671875, _75);
    float _81 = fma(_63, 0.114000000059604644775390625, _77);
    float _83 = fma(_71, 0.114000000059604644775390625, _79);
    float _85 = _81 * 0.0625;
    float _87 = -_81;
    float _89 = _83 + _87;
    float _91 = precise::max(_85, 0.02500000037252902984619140625);
    bool _95 = _89 >= _91;
    bool _97 = isnan(_89);
    bool _99 = _95 || _97;
    bool _101 = isnan(_91);
    bool _103 = _99 || _101;
    int _106 = as_type<int>(_67);
    int _108 = as_type<int>(_69);
    int _110 = as_type<int>(_71);
    if (_103)
    {
        _106 = as_type<int>(_59);
    }
    int _112 = _106;
    if (_103)
    {
        _108 = as_type<int>(_61);
    }
    int _114 = _108;
    if (_103)
    {
        _110 = as_type<int>(_63);
    }
    int _116 = _110;
    out.m_28.x = as_type<float>(_112);
    out.m_28.y = as_type<float>(_114);
    out.m_28.z = as_type<float>(_116);
    out.m_28.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_28 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_25.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_25.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _150 = float2(_51, _53);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_150, float2(0.0), isnan(_150))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _167 = float2(_51, _53);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _61 * 0.58700001239776611328125;
    float _75 = _69 * 0.58700001239776611328125;
    float _77 = fma(_59, 0.2989999949932098388671875, _73);
    float _79 = fma(_67, 0.2989999949932098388671875, _75);
    float _81 = fma(_63, 0.114000000059604644775390625, _77);
    float _83 = fma(_71, 0.114000000059604644775390625, _79);
    float _85 = _81 * 0.0625;
    float _87 = -_81;
    float _89 = _83 + _87;
    float _91 = precise::max(_85, 0.02500000037252902984619140625);
    bool _95 = _89 >= _91;
    bool _97 = isnan(_89);
    bool _99 = _95 || _97;
    bool _101 = isnan(_91);
    bool _103 = _99 || _101;
    int _106 = as_type<int>(_67);
    int _108 = as_type<int>(_69);
    int _110 = as_type<int>(_71);
    if (_103)
    {
        _106 = as_type<int>(_59);
    }
    int _112 = _106;
    if (_103)
    {
        _108 = as_type<int>(_61);
    }
    int _114 = _108;
    if (_103)
    {
        _110 = as_type<int>(_63);
    }
    int _116 = _110;
    out.m_28.x = as_type<float>(_112);
    out.m_28.y = as_type<float>(_114);
    out.m_28.z = as_type<float>(_116);
    out.m_28.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_28)};
}

