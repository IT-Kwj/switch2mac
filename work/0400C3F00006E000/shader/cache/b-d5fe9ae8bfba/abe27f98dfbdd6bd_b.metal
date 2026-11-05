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
    float4 m_34 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _152 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_152, float2(0.0), isnan(_152))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_152, float2(0.0), isnan(_152))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_71)
    {
        discard_fragment();
    }
    if (_71)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _73 = in.m_34.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = _55 * _77;
    float _91 = precise::max(_87, _89);
    bool _93 = _91 != 0.0;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    int _104 = 0;
    if (_101)
    {
        _104 = as_type<int>(_91);
    }
    int _106 = _104;
    int _108 = 0;
    if (_101)
    {
        _108 = as_type<int>(_85);
    }
    int _110 = _108;
    int _112 = 0;
    if (_101)
    {
        _112 = 0;
    }
    int _114 = _112;
    int _116 = 0;
    if (_101)
    {
        _116 = 1065353216;
    }
    int _118 = _116;
    if (_101)
    {
        out.m_32.x = as_type<float>(_106);
        out.m_32.y = as_type<float>(_110);
        out.m_32.z = as_type<float>(_114);
        out.m_32.w = as_type<float>(_118);
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
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _152 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_152, float2(0.0), isnan(_152))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_152, float2(0.0), isnan(_152))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_71)
    {
        discard_fragment();
    }
    if (_71)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _73 = in.m_34.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = _55 * _77;
    float _91 = precise::max(_87, _89);
    bool _93 = _91 != 0.0;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    int _104 = 0;
    if (_101)
    {
        _104 = as_type<int>(_91);
    }
    int _106 = _104;
    int _108 = 0;
    if (_101)
    {
        _108 = as_type<int>(_85);
    }
    int _110 = _108;
    int _112 = 0;
    if (_101)
    {
        _112 = 0;
    }
    int _114 = _112;
    int _116 = 0;
    if (_101)
    {
        _116 = 1065353216;
    }
    int _118 = _116;
    if (_101)
    {
        out.m_32.x = as_type<float>(_106);
        out.m_32.y = as_type<float>(_110);
        out.m_32.z = as_type<float>(_114);
        out.m_32.w = as_type<float>(_118);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_32)};
}

