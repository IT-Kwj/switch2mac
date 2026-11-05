#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_35 [[color(0)]];
    float4 m_37 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.y;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _140 = float2(_62, _60);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_140, float2(0.0), isnan(_140)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = precise::max(_67, _69);
    float _77 = precise::max(_71, _73);
    float _79 = precise::max(_75, _77);
    bool _83 = _79 >= 1.0;
    bool _85 = isnan(_79);
    bool _87 = _83 || _85;
    bool _89 = isnan(1.0);
    bool _91 = _87 || _89;
    float _93 = -_79;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _97 = 1.0 / _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _99);
    bool _103 = !_91;
    int _106 = _103 ? as_type<int>(_101) : 1065353216;
    out.gl_FragDepth = _75;
    out.m_35.x = _73;
    out.m_35.y = _73;
    out.m_35.z = _73;
    out.m_35.w = _73;
    out.m_37.x = as_type<float>(_106);
    return out;
}


struct main0_out_u
{
    uint4 m_35 [[color(0)]];
    uint4 m_37 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.y;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _140 = float2(_62, _60);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_140, float2(0.0), isnan(_140)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = precise::max(_67, _69);
    float _77 = precise::max(_71, _73);
    float _79 = precise::max(_75, _77);
    bool _83 = _79 >= 1.0;
    bool _85 = isnan(_79);
    bool _87 = _83 || _85;
    bool _89 = isnan(1.0);
    bool _91 = _87 || _89;
    float _93 = -_79;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _97 = 1.0 / _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _99);
    bool _103 = !_91;
    int _106 = _103 ? as_type<int>(_101) : 1065353216;
    out.gl_FragDepth = _75;
    out.m_35.x = _73;
    out.m_35.y = _73;
    out.m_35.z = _73;
    out.m_35.w = _73;
    out.m_37.x = as_type<float>(_106);
    return main0_out_u{as_type<uint4>(out.m_35), as_type<uint4>(out.m_37), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_35 [[color(0)]];
    uint4 m_37 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.y;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _140 = float2(_62, _60);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_140, float2(0.0), isnan(_140)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = precise::max(_67, _69);
    float _77 = precise::max(_71, _73);
    float _79 = precise::max(_75, _77);
    bool _83 = _79 >= 1.0;
    bool _85 = isnan(_79);
    bool _87 = _83 || _85;
    bool _89 = isnan(1.0);
    bool _91 = _87 || _89;
    float _93 = -_79;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _97 = 1.0 / _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _99);
    bool _103 = !_91;
    int _106 = _103 ? as_type<int>(_101) : 1065353216;
    out.gl_FragDepth = _75;
    out.m_35.x = _73;
    out.m_35.y = _73;
    out.m_35.z = _73;
    out.m_35.w = _73;
    out.m_37.x = as_type<float>(_106);
    return main0_out_m{out.m_35, as_type<uint4>(out.m_37), out.gl_FragDepth};
}

