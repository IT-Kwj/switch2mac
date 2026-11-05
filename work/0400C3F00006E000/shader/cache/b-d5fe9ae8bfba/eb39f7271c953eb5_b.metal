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
    float _46 = in.m_29.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _162 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_162, float2(0.0), isnan(_162)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = precise::max(_67, _69);
    float _77 = -_73;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _81 = precise::max(_71, _73);
    bool _85 = _73 != 1.0;
    bool _87 = isnan(_73);
    bool _89 = _85 || _87;
    bool _91 = isnan(1.0);
    bool _93 = _89 || _91;
    float _95 = precise::max(_75, _81);
    float _97 = 1.0 / _79;
    float _99 = -_95;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _103 = 1.0 / _101;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _105);
    int _110 = _93 ? as_type<int>(_107) : 1065353216;
    bool _112 = _95 >= 1.0;
    bool _114 = isnan(_95);
    bool _116 = _112 || _114;
    bool _118 = isnan(1.0);
    bool _120 = _116 || _118;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[1].w, _122);
    bool _126 = !_120;
    int _128 = _126 ? as_type<int>(_124) : 1065353216;
    out.gl_FragDepth = _62;
    out.m_35.x = as_type<float>(_110);
    out.m_35.y = as_type<float>(_110);
    out.m_35.z = as_type<float>(_110);
    out.m_35.w = as_type<float>(_110);
    out.m_37.x = as_type<float>(_128);
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
    float _46 = in.m_29.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _162 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_162, float2(0.0), isnan(_162)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = precise::max(_67, _69);
    float _77 = -_73;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _81 = precise::max(_71, _73);
    bool _85 = _73 != 1.0;
    bool _87 = isnan(_73);
    bool _89 = _85 || _87;
    bool _91 = isnan(1.0);
    bool _93 = _89 || _91;
    float _95 = precise::max(_75, _81);
    float _97 = 1.0 / _79;
    float _99 = -_95;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _103 = 1.0 / _101;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _105);
    int _110 = _93 ? as_type<int>(_107) : 1065353216;
    bool _112 = _95 >= 1.0;
    bool _114 = isnan(_95);
    bool _116 = _112 || _114;
    bool _118 = isnan(1.0);
    bool _120 = _116 || _118;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[1].w, _122);
    bool _126 = !_120;
    int _128 = _126 ? as_type<int>(_124) : 1065353216;
    out.gl_FragDepth = _62;
    out.m_35.x = as_type<float>(_110);
    out.m_35.y = as_type<float>(_110);
    out.m_35.z = as_type<float>(_110);
    out.m_35.w = as_type<float>(_110);
    out.m_37.x = as_type<float>(_128);
    return main0_out_u{as_type<uint4>(out.m_35), as_type<uint4>(out.m_37), out.gl_FragDepth};
}

