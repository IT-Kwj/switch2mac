#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_25 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_FragCoord.x;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.y;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _46 = _36 + (-0.5);
    float _48 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 2.0;
    float _50 = _42 + (-0.5);
    float _52 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _54 = (*spvDescriptorSet0.fp_c3)._m0[0].y + _52;
    float _56 = _48 * _46;
    float _58 = _48 * _50;
    float _60 = _56 + _54;
    float _62 = _58 + _54;
    bool _66 = _56 != 0.0;
    bool _68 = isnan(_56);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    float _76 = _60 * _44;
    float _78 = _44 * _62;
    bool _80 = _58 != 0.0;
    bool _82 = isnan(_58);
    bool _84 = _80 || _82;
    bool _86 = isnan(0.0);
    bool _88 = _84 || _86;
    float _90 = rint(_76);
    float _92 = precise::max(_90, 0.0);
    uint _95 = uint(_92);
    float _97 = rint(_78);
    float _99 = precise::max(_97, 0.0);
    uint _101 = uint(_99);
    int _104 = int(_95) << 13;
    int _106 = _104 + 939524096;
    float _108 = as_type<float>(_106);
    if (!_74)
    {
        _108 = 0.0;
    }
    float _110 = _108;
    float _112 = precise::min(_110, 1.0);
    int _114 = int(_101) << 13;
    int _116 = _114 + 939524096;
    float _118 = as_type<float>(_116);
    if (!_88)
    {
        _118 = 0.0;
    }
    float _120 = _118;
    float _122 = precise::min(_120, 1.0);
    out.m_25.x = _112;
    out.m_25.y = _122;
    return out;
}

