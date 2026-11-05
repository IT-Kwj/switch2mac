#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
};

struct main0_out
{
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_24.y;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[0].z, -0.5);
    float _50 = fma((*spvDescriptorSet0.fp_c3)._m0[0].x, 0.5, 0.5);
    float _52 = 1.0 / _34;
    float _54 = _52 * _40;
    float _56 = _52 * _46;
    float _58 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _60 = _54 + _48;
    float _62 = -_50;
    float _64 = _62 + _56;
    float _66 = _60 * _60;
    float _68 = 1.0 / _58;
    float _70 = fma(_64, _64, _66);
    float _72 = sqrt(_70);
    float _74 = _72 * _68;
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = -_76;
    float _80 = _78 + 1.0;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _84 = _80 + _82;
    float _86 = _84 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _88 = _86 * (-1.44269502162933349609375);
    float _90 = exp2(_88);
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[1].x + _92;
    float _96 = spvFAdd(_90, 1.0);
    float _98 = 1.0 / _96;
    float _100 = _94 * _98;
    out.m_27.x = _100;
    return out;
}

