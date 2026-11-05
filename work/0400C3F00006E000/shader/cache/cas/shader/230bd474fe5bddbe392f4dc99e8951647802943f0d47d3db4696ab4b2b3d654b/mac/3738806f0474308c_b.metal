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
    float4 m_35 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _138 = float2(_58, _60);
    float4 _63 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_138, float2(0.0), isnan(_138)), int2(0), component::x).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = precise::max(_65, _67);
    float _75 = precise::max(_69, _71);
    float _77 = precise::max(_73, _75);
    bool _81 = _77 >= 1.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(1.0);
    bool _89 = _85 || _87;
    float _91 = -_77;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _95 = 1.0 / _93;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _99 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[1].w, _97);
    bool _101 = !_89;
    int _104 = _101 ? as_type<int>(_99) : 1065353216;
    out.gl_FragDepth = _95;
    out.m_35.x = as_type<float>(_104);
    return out;
}


struct main0_out_u
{
    uint4 m_35 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _138 = float2(_58, _60);
    float4 _63 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_138, float2(0.0), isnan(_138)), int2(0), component::x).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = precise::max(_65, _67);
    float _75 = precise::max(_69, _71);
    float _77 = precise::max(_73, _75);
    bool _81 = _77 >= 1.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(1.0);
    bool _89 = _85 || _87;
    float _91 = -_77;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _95 = 1.0 / _93;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _99 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[1].w, _97);
    bool _101 = !_89;
    int _104 = _101 ? as_type<int>(_99) : 1065353216;
    out.gl_FragDepth = _95;
    out.m_35.x = as_type<float>(_104);
    return main0_out_u{as_type<uint4>(out.m_35), out.gl_FragDepth};
}

