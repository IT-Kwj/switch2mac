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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_26.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_26.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_26.z;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _36;
    float _58 = _56 * _42;
    float _60 = _56 * _48;
    float _62 = _56 * _54;
    float _64 = -(*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _66 = _58 * _64;
    float _68 = -(*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _70 = fma(_60, _68, _66);
    float _72 = -(*spvDescriptorSet0.fp_c4)._m0[7].z;
    float _74 = fma(_62, _72, _70);
    float _76 = _74 * 2.0;
    float _78 = precise::max(0.0, _74);
    float _80 = fma(_58, _76, (*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _82 = fma(_60, _76, (*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _84 = _58 * _80;
    float _86 = fma(_62, _76, (*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _88 = fma(_60, _82, _84);
    float _90 = fma(_62, _86, _88);
    float _92 = _78 + 0.300000011920928955078125;
    float _94 = precise::max(0.0, _90);
    float _96 = _94 * _94;
    float _98 = _96 * _96;
    float _100 = fma(_94, _98, _92);
    float _102 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _104 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_29.x = _102;
    out.m_29.y = _104;
    out.m_29.z = _106;
    out.m_29.w = 1.0;
    return out;
}

