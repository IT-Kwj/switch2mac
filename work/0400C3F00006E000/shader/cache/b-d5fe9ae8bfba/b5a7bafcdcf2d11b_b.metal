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
    float4 m_32 [[color(0)]];
    float4 m_34 [[color(2)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _137 = float2(_59, _57);
    float4 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_137, float2(0.0), isnan(_137)), int2(0), component::x).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::max(_64, _66);
    float _74 = precise::max(_68, _70);
    float _76 = precise::max(_72, _74);
    bool _80 = _76 >= 1.0;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan(1.0);
    bool _88 = _84 || _86;
    float _90 = -_76;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _94 = 1.0 / _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[1].w, _96);
    bool _100 = !_88;
    int _103 = _100 ? as_type<int>(_98) : 1065353216;
    out.m_32.x = _70;
    out.m_32.y = _70;
    out.m_32.z = _70;
    out.m_32.w = _70;
    out.m_34.x = as_type<float>(_103);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
    uint4 m_34 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _137 = float2(_59, _57);
    float4 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_137, float2(0.0), isnan(_137)), int2(0), component::x).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::max(_64, _66);
    float _74 = precise::max(_68, _70);
    float _76 = precise::max(_72, _74);
    bool _80 = _76 >= 1.0;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan(1.0);
    bool _88 = _84 || _86;
    float _90 = -_76;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _94 = 1.0 / _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[1].w, _96);
    bool _100 = !_88;
    int _103 = _100 ? as_type<int>(_98) : 1065353216;
    out.m_32.x = _70;
    out.m_32.y = _70;
    out.m_32.z = _70;
    out.m_32.w = _70;
    out.m_34.x = as_type<float>(_103);
    return main0_out_u{as_type<uint4>(out.m_32), as_type<uint4>(out.m_34)};
}


struct main0_out_m
{
    float4 m_32 [[color(0)]];
    uint4 m_34 [[color(2)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _137 = float2(_59, _57);
    float4 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_137, float2(0.0), isnan(_137)), int2(0), component::x).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::max(_64, _66);
    float _74 = precise::max(_68, _70);
    float _76 = precise::max(_72, _74);
    bool _80 = _76 >= 1.0;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan(1.0);
    bool _88 = _84 || _86;
    float _90 = -_76;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _94 = 1.0 / _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[1].w, _96);
    bool _100 = !_88;
    int _103 = _100 ? as_type<int>(_98) : 1065353216;
    out.m_32.x = _70;
    out.m_32.y = _70;
    out.m_32.z = _70;
    out.m_32.w = _70;
    out.m_34.x = as_type<float>(_103);
    return main0_out_m{out.m_32, as_type<uint4>(out.m_34)};
}

