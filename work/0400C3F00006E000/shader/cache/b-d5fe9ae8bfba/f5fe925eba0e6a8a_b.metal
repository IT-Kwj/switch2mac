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
    float2 _182 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_182, float2(0.0), isnan(_182))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_182, float2(0.0), isnan(_182))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = precise::max(_63, _65);
    float _71 = precise::min(_63, _65);
    float _73 = precise::max(_67, _69);
    float _75 = precise::min(_67, _71);
    bool _79 = _73 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _81 = _75 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _83 = isnan(_75);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _89 = _85 || _87;
    bool _91 = _75 <= (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _93 = _91 && _79;
    int _96 = as_type<int>(_63);
    int _98 = as_type<int>(_67);
    float _100 = _55;
    float _102 = _57;
    float _104 = _75;
    int _106 = as_type<int>(_65);
    if (!_89)
    {
        _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _108 = _96;
    int _110 = _108;
    if (!_89)
    {
        _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _112 = _98;
    int _114 = _112;
    if (_93)
    {
        _100 = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    }
    float _116 = _100;
    if (_93)
    {
        _102 = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    }
    float _118 = _102;
    if (_93)
    {
        _104 = (*spvDescriptorSet0.fp_c3)._m0[1].z;
    }
    float _120 = _104;
    if (_79)
    {
        _110 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].x);
    }
    int _122 = _110;
    int _124 = _122;
    if (!_89)
    {
        _106 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _126 = _106;
    int _128 = _126;
    if (_79)
    {
        _114 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].z);
    }
    int _130 = _114;
    int _132 = _130;
    if (_79)
    {
        _128 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].y);
    }
    int _134 = _128;
    int _136 = _134;
    if (_93)
    {
        float _138 = _116 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _124 = as_type<int>(_138);
    }
    int _140 = _124;
    if (_93)
    {
        float _142 = _118 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
        _136 = as_type<int>(_142);
    }
    int _144 = _136;
    if (_93)
    {
        float _146 = _120 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
        _132 = as_type<int>(_146);
    }
    int _148 = _132;
    out.m_32.x = as_type<float>(_140);
    out.m_32.y = as_type<float>(_144);
    out.m_32.z = as_type<float>(_148);
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[3].x;
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
    float2 _182 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_182, float2(0.0), isnan(_182))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_182, float2(0.0), isnan(_182))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = precise::max(_63, _65);
    float _71 = precise::min(_63, _65);
    float _73 = precise::max(_67, _69);
    float _75 = precise::min(_67, _71);
    bool _79 = _73 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _81 = _75 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _83 = isnan(_75);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _89 = _85 || _87;
    bool _91 = _75 <= (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _93 = _91 && _79;
    int _96 = as_type<int>(_63);
    int _98 = as_type<int>(_67);
    float _100 = _55;
    float _102 = _57;
    float _104 = _75;
    int _106 = as_type<int>(_65);
    if (!_89)
    {
        _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _108 = _96;
    int _110 = _108;
    if (!_89)
    {
        _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _112 = _98;
    int _114 = _112;
    if (_93)
    {
        _100 = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    }
    float _116 = _100;
    if (_93)
    {
        _102 = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    }
    float _118 = _102;
    if (_93)
    {
        _104 = (*spvDescriptorSet0.fp_c3)._m0[1].z;
    }
    float _120 = _104;
    if (_79)
    {
        _110 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].x);
    }
    int _122 = _110;
    int _124 = _122;
    if (!_89)
    {
        _106 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _126 = _106;
    int _128 = _126;
    if (_79)
    {
        _114 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].z);
    }
    int _130 = _114;
    int _132 = _130;
    if (_79)
    {
        _128 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[2].y);
    }
    int _134 = _128;
    int _136 = _134;
    if (_93)
    {
        float _138 = _116 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _124 = as_type<int>(_138);
    }
    int _140 = _124;
    if (_93)
    {
        float _142 = _118 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
        _136 = as_type<int>(_142);
    }
    int _144 = _136;
    if (_93)
    {
        float _146 = _120 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
        _132 = as_type<int>(_146);
    }
    int _148 = _132;
    out.m_32.x = as_type<float>(_140);
    out.m_32.y = as_type<float>(_144);
    out.m_32.z = as_type<float>(_148);
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[3].x;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

