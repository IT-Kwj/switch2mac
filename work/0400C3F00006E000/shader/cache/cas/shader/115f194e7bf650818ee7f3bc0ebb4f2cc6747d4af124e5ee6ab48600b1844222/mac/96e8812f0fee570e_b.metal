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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
};

struct main0_out
{
    float4 m_24 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _34 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _36 = _34 & 31;
    uint _39 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_36)));
    bool _43 = uint(_36) < 32u;
    int _45 = _43 ? int(_39) : 0;
    int _47 = _45 & 255;
    bool _49 = _47 != 255;
    bool _51 = !_49;
    if (!_51)
    {
        bool _53 = _47 != 0;
        if (!_53)
        {
            discard_fragment();
        }
        if (!_53)
        {
            out.m_24.x = 0.0;
            out.m_24.y = 0.0;
            out.m_24.z = 0.0;
            out.m_24.w = 0.0;
            return out;
        }
        float _56 = gl_FragCoord.x;
        float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _60 = _56 / _58;
        float _62 = gl_FragCoord.y;
        float _64 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _66 = _62 / _64;
        float _68 = trunc(_60);
        float _70 = precise::max(_68, 0.0);
        uint _72 = uint(_70);
        float _74 = trunc(_66);
        float _76 = precise::max(_74, 0.0);
        uint _78 = uint(_76);
        int _80 = int(_72) + 2;
        uint _82 = uint(int(uint(_80) >> uint(1)));
        uint _84 = uint(int(uint(int(_78)) >> uint(1)));
        int _86 = int(_82) ^ int(_84);
        int _88 = _86 * 65536;
        int _90 = _88 ^ int(_82);
        int _92 = 983055 & _90;
        int _94 = _92 * 64;
        int _96 = _94 + _92;
        int _98 = _96 & 13369548;
        uint _100 = uint(int(uint(_98) >> uint(3)));
        int _102 = _98 | int(_100);
        int _104 = _102 & 5570560;
        int _106 = _102 & 85;
        uint _108 = uint(int(uint(_104) >> uint(15)));
        int _110 = int(_108) + _106;
        bool _112 = uint(_47) >= uint(_110);
        if (!_112)
        {
            discard_fragment();
        }
        if (!_112)
        {
            out.m_24.x = 0.0;
            out.m_24.y = 0.0;
            out.m_24.z = 0.0;
            out.m_24.w = 0.0;
            return out;
        }
    }
    out.m_24.x = 1.0;
    out.m_24.y = 1.0;
    out.m_24.z = 1.0;
    out.m_24.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_24 [[color(0)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _34 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _36 = _34 & 31;
    uint _39 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_36)));
    bool _43 = uint(_36) < 32u;
    int _45 = _43 ? int(_39) : 0;
    int _47 = _45 & 255;
    bool _49 = _47 != 255;
    bool _51 = !_49;
    if (!_51)
    {
        bool _53 = _47 != 0;
        if (!_53)
        {
            discard_fragment();
        }
        if (!_53)
        {
            out.m_24.x = 0.0;
            out.m_24.y = 0.0;
            out.m_24.z = 0.0;
            out.m_24.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_24)};
        }
        float _56 = gl_FragCoord.x;
        float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _60 = _56 / _58;
        float _62 = gl_FragCoord.y;
        float _64 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _66 = _62 / _64;
        float _68 = trunc(_60);
        float _70 = precise::max(_68, 0.0);
        uint _72 = uint(_70);
        float _74 = trunc(_66);
        float _76 = precise::max(_74, 0.0);
        uint _78 = uint(_76);
        int _80 = int(_72) + 2;
        uint _82 = uint(int(uint(_80) >> uint(1)));
        uint _84 = uint(int(uint(int(_78)) >> uint(1)));
        int _86 = int(_82) ^ int(_84);
        int _88 = _86 * 65536;
        int _90 = _88 ^ int(_82);
        int _92 = 983055 & _90;
        int _94 = _92 * 64;
        int _96 = _94 + _92;
        int _98 = _96 & 13369548;
        uint _100 = uint(int(uint(_98) >> uint(3)));
        int _102 = _98 | int(_100);
        int _104 = _102 & 5570560;
        int _106 = _102 & 85;
        uint _108 = uint(int(uint(_104) >> uint(15)));
        int _110 = int(_108) + _106;
        bool _112 = uint(_47) >= uint(_110);
        if (!_112)
        {
            discard_fragment();
        }
        if (!_112)
        {
            out.m_24.x = 0.0;
            out.m_24.y = 0.0;
            out.m_24.z = 0.0;
            out.m_24.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_24)};
        }
    }
    out.m_24.x = 1.0;
    out.m_24.y = 1.0;
    out.m_24.z = 1.0;
    out.m_24.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_24)};
}

