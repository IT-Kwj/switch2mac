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
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _159 = float2(_57, _59);
    float4 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_159, float2(0.0), isnan(_159)), int2(0), component::x).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::max(_64, _66);
    float _74 = -_70;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _78 = precise::max(_68, _70);
    float _80 = precise::max(_72, _78);
    float _82 = 1.0 / _76;
    bool _86 = _70 != 1.0;
    bool _88 = isnan(_70);
    bool _90 = _86 || _88;
    bool _92 = isnan(1.0);
    bool _94 = _90 || _92;
    float _96 = -_80;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _100 = 1.0 / _98;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].w, _102);
    int _107 = _94 ? as_type<int>(_104) : 1065353216;
    bool _109 = _80 >= 1.0;
    bool _111 = isnan(_80);
    bool _113 = _109 || _111;
    bool _115 = isnan(1.0);
    bool _117 = _113 || _115;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _121 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[1].w, _119);
    bool _123 = !_117;
    int _125 = _123 ? as_type<int>(_121) : 1065353216;
    out.m_32.x = as_type<float>(_107);
    out.m_32.y = as_type<float>(_107);
    out.m_32.z = as_type<float>(_107);
    out.m_32.w = as_type<float>(_107);
    out.m_34.x = as_type<float>(_125);
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
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _159 = float2(_57, _59);
    float4 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_159, float2(0.0), isnan(_159)), int2(0), component::x).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::max(_64, _66);
    float _74 = -_70;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _78 = precise::max(_68, _70);
    float _80 = precise::max(_72, _78);
    float _82 = 1.0 / _76;
    bool _86 = _70 != 1.0;
    bool _88 = isnan(_70);
    bool _90 = _86 || _88;
    bool _92 = isnan(1.0);
    bool _94 = _90 || _92;
    float _96 = -_80;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _100 = 1.0 / _98;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].w, _102);
    int _107 = _94 ? as_type<int>(_104) : 1065353216;
    bool _109 = _80 >= 1.0;
    bool _111 = isnan(_80);
    bool _113 = _109 || _111;
    bool _115 = isnan(1.0);
    bool _117 = _113 || _115;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _121 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[1].w, _119);
    bool _123 = !_117;
    int _125 = _123 ? as_type<int>(_121) : 1065353216;
    out.m_32.x = as_type<float>(_107);
    out.m_32.y = as_type<float>(_107);
    out.m_32.z = as_type<float>(_107);
    out.m_32.w = as_type<float>(_107);
    out.m_34.x = as_type<float>(_125);
    return main0_out_u{as_type<uint4>(out.m_32), as_type<uint4>(out.m_34)};
}

