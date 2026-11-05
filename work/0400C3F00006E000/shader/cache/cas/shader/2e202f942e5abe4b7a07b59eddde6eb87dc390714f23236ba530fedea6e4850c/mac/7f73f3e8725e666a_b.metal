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
    float2 _142 = float2(_55, _57);
    float4 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142)), int2(0), component::x).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = precise::min(_62, _64);
    float _72 = precise::min(_66, _68);
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _76 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _74;
    float _78 = precise::min(_70, _72);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _82 = -_80;
    float _84 = fma(_78, _76, _82);
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
    float _88 = _86 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _90 = 1.0 / _84;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _94 = fma(_88, _90, _92);
    float _96 = precise::max(0.0, _94);
    float _98 = _96 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _100 = _98 * (-1.44269502162933349609375);
    float _102 = exp2(_100);
    float _104 = _102 + (-0.5);
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    float _108 = precise::max(_106, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    out.m_32.x = _108;
    return out;
}

