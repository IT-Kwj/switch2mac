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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _164 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_164, float2(0.0), isnan(_164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_164, float2(0.0), isnan(_164))).x;
    float2 _175 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_175, float2(0.0), isnan(_175))).x;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = -_65;
    float _87 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _89 = 1.0 / _87;
    float _91 = fma(_81, _89, _83);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    bool _97 = _89 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _99 = !_97;
    float _101 = _99 ? _93 : 0.0;
    float _103 = precise::max(_67, _101);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    int _116 = 0;
    if (_113)
    {
        _116 = as_type<int>(_103);
    }
    int _118 = _116;
    int _120 = 0;
    if (_113)
    {
        _120 = as_type<int>(_67);
    }
    int _122 = _120;
    int _124 = 0;
    if (_113)
    {
        _124 = 0;
    }
    int _126 = _124;
    int _128 = 0;
    if (_113)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (_113)
    {
        out.m_38.x = as_type<float>(_118);
        out.m_38.y = as_type<float>(_122);
        out.m_38.z = as_type<float>(_126);
        out.m_38.w = as_type<float>(_130);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _164 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_164, float2(0.0), isnan(_164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_164, float2(0.0), isnan(_164))).x;
    float2 _175 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_175, float2(0.0), isnan(_175))).x;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = -_65;
    float _87 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _89 = 1.0 / _87;
    float _91 = fma(_81, _89, _83);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    bool _97 = _89 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _99 = !_97;
    float _101 = _99 ? _93 : 0.0;
    float _103 = precise::max(_67, _101);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    int _116 = 0;
    if (_113)
    {
        _116 = as_type<int>(_103);
    }
    int _118 = _116;
    int _120 = 0;
    if (_113)
    {
        _120 = as_type<int>(_67);
    }
    int _122 = _120;
    int _124 = 0;
    if (_113)
    {
        _124 = 0;
    }
    int _126 = _124;
    int _128 = 0;
    if (_113)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (_113)
    {
        out.m_38.x = as_type<float>(_118);
        out.m_38.y = as_type<float>(_122);
        out.m_38.z = as_type<float>(_126);
        out.m_38.w = as_type<float>(_130);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_38)};
}

