#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the unsigned GLSL findMSB() function
template<typename T>
inline T spvFindUMSB(T x)
{
    return select(clz(T(0)) - (clz(x) + T(1)), T(-1), x == T(0));
}

inline uint4 spvSubgroupBallot(bool value)
{
    simd_vote vote = simd_ballot(value);
    // simd_ballot() returns a 64-bit integer-like object, but
    // SPIR-V callers expect a uint4. We must convert.
    // FIXME: This won't include higher bits if Apple ever supports
    // 128 lanes in an SIMD-group.
    return uint4(as_type<uint2>((simd_vote::vote_t)vote), 0, 0);
}

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(3)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(4)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
    float4 m_41 [[color(2)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _491, thread const int& _492, thread const int& _493, thread int& _494, thread uint& gl_SubgroupInvocationID)
{
    int _497 = _493 & 31;
    uint _499 = uint(int(uint(_493) >> uint(8)));
    int _501 = int(_499) & 31;
    float _503 = as_type<float>(gl_SubgroupInvocationID);
    int _505 = as_type<int>(_503) & _501;
    int _507 = ~_501;
    int _509 = _497 & _507;
    int _511 = _509 | _505;
    int _513 = as_type<int>(_503) ^ _492;
    bool _515 = uint(_513) <= uint(_511);
    _494 = _515 ? (-1) : 0;
    float _517 = spvSubgroupShuffle(as_type<float>(_491), uint(_513));
    uint _519 = uint(_515 ? as_type<int>(_517) : _491);
    return int(_519);
}

static inline __attribute__((always_inline))
int _48(thread const int& _567, thread const int& _568, thread const int& _569, thread int& _570, thread uint& gl_SubgroupInvocationID)
{
    int _573 = _569 & 31;
    uint _575 = uint(int(uint(_569) >> uint(8)));
    int _577 = int(_575) & 31;
    float _579 = as_type<float>(gl_SubgroupInvocationID);
    int _581 = as_type<int>(_579) & _577;
    int _583 = ~_577;
    int _585 = _573 & _583;
    int _587 = _585 | _581;
    int _589 = ~_577;
    int _591 = _568 & _589;
    int _593 = _591 | _581;
    bool _595 = uint(_593) <= uint(_587);
    _570 = _595 ? (-1) : 0;
    float _597 = spvSubgroupShuffle(as_type<float>(_567), uint(_593));
    uint _599 = uint(_595 ? as_type<int>(_597) : _567);
    return int(_599);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _142 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_29.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_29.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float2 _273 = float2(_70, _68);
    float4 _73 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_273, float2(0.0), isnan(_273)), int2(0), component::x).xyzw;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = _73.w;
    float _83 = gl_FragCoord.x;
    float _85 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _87 = _83 / _85;
    float _89 = gl_FragCoord.y;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = trunc(_87);
    int _97 = int(_95);
    float _99 = trunc(_93);
    int _101 = int(_99);
    float _103 = precise::max(_75, _77);
    uint _106 = spvSubgroupBallot(true).x;
    float _108 = precise::max(_79, _81);
    bool _112 = int(_106) != (-1);
    float _114 = precise::max(_103, _108);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_114, _114, _114, _114), uint2(int2(_97, _101)));
    float _140;
    if (!_112)
    {
        int _116 = as_type<int>(_114);
        int _118 = 1;
        int _120 = 31;
        int _122;
        int _347 = _47(_116, _118, _120, _122, gl_SubgroupInvocationID);
        int _124 = _347;
        float _126 = precise::max(_114, as_type<float>(_124));
        int _128 = as_type<int>(_126);
        int _130 = 2;
        int _132 = 31;
        int _134;
        int _355 = _47(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _355;
        float _138 = precise::max(_126, as_type<float>(_136));
        _140 = _138;
        _142 = true;
    }
    else
    {
        float _144 = as_type<float>(gl_SubgroupInvocationID);
        uint _146 = spvSubgroupBallot(true).x;
        float _148 = as_type<float>(gl_SubgroupLtMask.x);
        int _150 = as_type<int>(_144) & (-4);
        uint _152 = min(uint(_150), 32u);
        bool _154 = _152 < 32u;
        int _156 = 15 << int(_152);
        int _158 = _154 ? _156 : 0;
        int _160 = int(_146) & as_type<int>(_148);
        int _162 = _158 & _160;
        int _164 = _158 & int(_146);
        int _166 = int(spvFindUMSB(uint(_162)));
        int _168 = int(spvFindUMSB(uint(_164)));
        uint _170 = min(uint(_166), as_type<uint>(_144));
        int _172 = as_type<int>(_114);
        int _174 = int(_170);
        int _176 = 31;
        int _178;
        int _415 = _48(_172, _174, _176, _178, gl_SubgroupInvocationID);
        int _180 = _415;
        int _182 = int(_170);
        int _184 = int(_170);
        int _186 = 30;
        int _188;
        int _421 = _48(_182, _184, _186, _188, gl_SubgroupInvocationID);
        int _190 = _421;
        float _192 = precise::max(_114, as_type<float>(_180));
        int _194 = as_type<int>(_192);
        int _196 = _190;
        int _198 = 31;
        int _200;
        int _429 = _48(_194, _196, _198, _200, gl_SubgroupInvocationID);
        int _202 = _429;
        float _204 = precise::max(_192, as_type<float>(_202));
        int _206 = as_type<int>(_204);
        int _208 = _168;
        int _210 = 31;
        int _212;
        int _437 = _48(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _437;
        _140 = as_type<float>(_214);
    }
    _142 = false;
    float _216 = _140;
    float _218 = as_type<float>(gl_SubgroupInvocationID);
    int _220 = as_type<int>(_218) & 3;
    bool _222 = _220 != 0;
    if (!_222)
    {
        int _224 = _97 >> 31;
        int _226 = _101 >> 31;
        int _228 = _224 & 1;
        int _230 = _226 & 1;
        int _232 = _97 + _228;
        int _234 = _101 + _230;
        int _236 = _232 >> 1;
        int _238 = _234 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_216, _216, _216, _216), uint2(int2(_236, _238)));
    }
    out.m_39.x = _81;
    out.m_39.y = _81;
    out.m_39.z = _81;
    out.m_39.w = _81;
    out.m_41.x = _114;
    return out;
}

