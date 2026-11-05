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
    float4 m_35 [[color(0)]];
    float4 m_37 [[color(1)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0)]];
    float4 m_28 [[user(locn1)]];
    float4 m_24 [[user(locn2), flat]];
    float4 m_30 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_28.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_30.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_32.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    int _67 = as_type<int>(_44) * 48;
    float _69 = 1.0 / _46;
    int _71 = _67 + 32;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.fp_c4)._m0[int(_76)][_78];
    float _82 = _69 * _52;
    float _84 = _69 * _58;
    float _86 = _69 * _64;
    int _88 = as_type<int>(_44) * 48;
    int _90 = _88 + 16;
    int _92 = _90 + (-4);
    uint _94 = uint(int(uint(_92) >> uint(2)));
    uint _96 = uint(int(uint(int(_94)) >> uint(2)));
    int _98 = int(_94) & 3;
    float _100 = (*spvDescriptorSet0.fp_c4)._m0[int(_96)][_98];
    bool _104 = _82 >= _80;
    bool _106 = isnan(_82);
    bool _108 = _104 || _106;
    bool _110 = isnan(_80);
    bool _112 = _108 || _110;
    int _114 = _90 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.fp_c4)._m0[int(_118)][_120];
    uint _124 = as_type<uint>(_44);
    float _126 = _86;
    float _128 = _82;
    if (!_112)
    {
        int _130 = as_type<int>(_44) * 48;
        int _132 = _130 + 36;
        _124 = uint(_132);
    }
    uint _134 = _124;
    uint _136 = uint(int(uint(_90) >> uint(2)));
    uint _138 = uint(int(uint(int(_136)) >> uint(2)));
    int _140 = int(_136) & 3;
    float _142 = (*spvDescriptorSet0.fp_c4)._m0[int(_138)][_140];
    int _144 = int(_136) + 1;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    int _148 = _144 & 3;
    float _150 = (*spvDescriptorSet0.fp_c4)._m0[int(_146)][_148];
    float _152 = _100 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = 0.0;
    if (!_112)
    {
        uint _158 = uint(int(uint(int(_134)) >> uint(2)));
        uint _160 = uint(int(uint(int(_158)) >> uint(2)));
        int _162 = int(_158) & 3;
        float _164 = (*spvDescriptorSet0.fp_c4)._m0[int(_160)][_162];
        _156 = _164;
    }
    float _166 = _156;
    float _168 = _154 * _84;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _172 = _86 + _170;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _176 = _86 + _174;
    if (_112)
    {
        _126 = 1.0;
    }
    float _178 = _126;
    float _180 = _172 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = _176 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = _182 * _168;
    float _190 = _186 * _168;
    float _192 = _178;
    if (!_112)
    {
        float _194 = _82 * _166;
        _128 = _194;
    }
    float _196 = _128;
    if (!_112)
    {
        float _198 = _196 * _196;
        _192 = _198;
    }
    float _200 = _192;
    float _202 = _188 * _200;
    float _204 = _190 * _200;
    float _206 = _202 * _142;
    float _208 = _202 * _150;
    float _210 = _204 * _142;
    float _212 = _204 * _150;
    float _214 = _202 * _122;
    float _216 = _204 * _122;
    out.m_35.x = _206;
    out.m_35.y = _208;
    out.m_35.z = _214;
    out.m_35.w = 1.0;
    out.m_37.x = _210;
    out.m_37.y = _212;
    out.m_37.z = _216;
    out.m_37.w = 1.0;
    return out;
}

