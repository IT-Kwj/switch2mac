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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _180 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_180, float2(0.0), isnan(_180))).x;
    float _65 = in.m_31.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_33.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _57 * _69;
    float _91 = _57 * _75;
    float _93 = _57 * _81;
    float _95 = _57 * _87;
    float _97 = -_63;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _101 = 1.0 / _99;
    float _103 = fma(_89, _101, _91);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    bool _109 = _101 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _111 = fma(_93, _101, _95);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    bool _115 = !_109;
    float _117 = _115 ? _105 : 0.0;
    float _119 = precise::max(_117, _113);
    bool _121 = _119 != 0.0;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan(0.0);
    bool _129 = _125 || _127;
    int _132 = 0;
    if (_129)
    {
        _132 = as_type<int>(_119);
    }
    int _134 = _132;
    int _136 = 0;
    if (_129)
    {
        _136 = as_type<int>(_113);
    }
    int _138 = _136;
    int _140 = 0;
    if (_129)
    {
        _140 = 0;
    }
    int _142 = _140;
    int _144 = 0;
    if (_129)
    {
        _144 = 1065353216;
    }
    int _146 = _144;
    if (_129)
    {
        out.m_36.x = as_type<float>(_134);
        out.m_36.y = as_type<float>(_138);
        out.m_36.z = as_type<float>(_142);
        out.m_36.w = as_type<float>(_146);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _180 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_180, float2(0.0), isnan(_180))).x;
    float _65 = in.m_31.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_33.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _57 * _69;
    float _91 = _57 * _75;
    float _93 = _57 * _81;
    float _95 = _57 * _87;
    float _97 = -_63;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _101 = 1.0 / _99;
    float _103 = fma(_89, _101, _91);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    bool _109 = _101 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _111 = fma(_93, _101, _95);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    bool _115 = !_109;
    float _117 = _115 ? _105 : 0.0;
    float _119 = precise::max(_117, _113);
    bool _121 = _119 != 0.0;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan(0.0);
    bool _129 = _125 || _127;
    int _132 = 0;
    if (_129)
    {
        _132 = as_type<int>(_119);
    }
    int _134 = _132;
    int _136 = 0;
    if (_129)
    {
        _136 = as_type<int>(_113);
    }
    int _138 = _136;
    int _140 = 0;
    if (_129)
    {
        _140 = 0;
    }
    int _142 = _140;
    int _144 = 0;
    if (_129)
    {
        _144 = 1065353216;
    }
    int _146 = _144;
    if (_129)
    {
        out.m_36.x = as_type<float>(_134);
        out.m_36.y = as_type<float>(_138);
        out.m_36.z = as_type<float>(_142);
        out.m_36.w = as_type<float>(_146);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

