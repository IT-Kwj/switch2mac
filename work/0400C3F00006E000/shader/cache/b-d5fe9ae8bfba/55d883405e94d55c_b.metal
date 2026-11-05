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
    float2 _146 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_146, float2(0.0), isnan(_146))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_146, float2(0.0), isnan(_146))).x;
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
    float _83 = _55 * _77;
    float _85 = precise::max(_81, _83);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    int _98 = 0;
    if (_95)
    {
        _98 = as_type<int>(_85);
    }
    int _100 = _98;
    int _102 = 0;
    if (_95)
    {
        _102 = 0;
    }
    int _104 = _102;
    int _106 = 0;
    if (_95)
    {
        _106 = 0;
    }
    int _108 = _106;
    int _110 = 0;
    if (_95)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (_95)
    {
        out.m_32.x = as_type<float>(_100);
        out.m_32.y = as_type<float>(_104);
        out.m_32.z = as_type<float>(_108);
        out.m_32.w = as_type<float>(_112);
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
    float2 _146 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_146, float2(0.0), isnan(_146))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_146, float2(0.0), isnan(_146))).x;
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
    float _83 = _55 * _77;
    float _85 = precise::max(_81, _83);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    int _98 = 0;
    if (_95)
    {
        _98 = as_type<int>(_85);
    }
    int _100 = _98;
    int _102 = 0;
    if (_95)
    {
        _102 = 0;
    }
    int _104 = _102;
    int _106 = 0;
    if (_95)
    {
        _106 = 0;
    }
    int _108 = _106;
    int _110 = 0;
    if (_95)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (_95)
    {
        out.m_32.x = as_type<float>(_100);
        out.m_32.y = as_type<float>(_104);
        out.m_32.z = as_type<float>(_108);
        out.m_32.w = as_type<float>(_112);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_32)};
}

