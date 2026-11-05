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
    float _48 = in.m_24.z;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = 1.0 / _34;
    float _56 = _54 * _40;
    float _58 = _54 * _46;
    float _60 = _54 * _52;
    float _62 = _56 * _56;
    float _64 = _58 + _56;
    float _66 = fma(_58, _58, _62);
    float _68 = _60 + _64;
    float _70 = fma(_60, _60, _66);
    float _72 = rsqrt(_70);
    float _74 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _76 = _72 * _68;
    float _78 = fma(_76, -0.288675129413604736328125, 0.5);
    float _80 = precise::clamp(_78, 0.0, 1.0);
    float _82 = -_80;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _86 = -_80;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _90 = -_80;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _94 = _84 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    out.m_27.x = _94;
    out.m_27.y = _96;
    out.m_27.z = _98;
    out.m_27.w = _74;
    return out;
}

