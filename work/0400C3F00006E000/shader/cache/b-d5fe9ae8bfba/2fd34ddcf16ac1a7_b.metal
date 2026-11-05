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
    float _36 = in.m_24.w;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_24.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_24.z;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _34;
    float _62 = _60 * _40;
    float _64 = _60 * _46;
    float _66 = _60 * _52;
    float _68 = _60 * _58;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _82 = _72 != 0.0;
    bool _84 = isnan(_72);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.0);
    bool _90 = _86 || _88;
    if (_90)
    {
        out.m_27.x = _74;
        out.m_27.y = _76;
        out.m_27.z = _78;
        out.m_27.w = _72;
        return out;
    }
    discard_fragment();
    return out;
}

