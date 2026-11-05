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
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _45(thread const int& _494, thread const int& _495, thread const int& _496, thread int& _497, thread uint& gl_SubgroupInvocationID)
{
    int _500 = _496 & 31;
    uint _502 = uint(int(uint(_496) >> uint(8)));
    int _504 = int(_502) & 31;
    float _506 = as_type<float>(gl_SubgroupInvocationID);
    int _508 = as_type<int>(_506) & _504;
    int _510 = ~_504;
    int _512 = _500 & _510;
    int _514 = _512 | _508;
    int _516 = as_type<int>(_506) ^ _495;
    bool _518 = uint(_516) <= uint(_514);
    _497 = _518 ? (-1) : 0;
    float _520 = spvSubgroupShuffle(as_type<float>(_494), uint(_516));
    uint _522 = uint(_518 ? as_type<int>(_520) : _494);
    return int(_522);
}

static inline __attribute__((always_inline))
int _46(thread const int& _570, thread const int& _571, thread const int& _572, thread int& _573, thread uint& gl_SubgroupInvocationID)
{
    int _576 = _572 & 31;
    uint _578 = uint(int(uint(_572) >> uint(8)));
    int _580 = int(_578) & 31;
    float _582 = as_type<float>(gl_SubgroupInvocationID);
    int _584 = as_type<int>(_582) & _580;
    int _586 = ~_580;
    int _588 = _576 & _586;
    int _590 = _588 | _584;
    int _592 = ~_580;
    int _594 = _571 & _592;
    int _596 = _594 | _584;
    bool _598 = uint(_596) <= uint(_590);
    _573 = _598 ? (-1) : 0;
    float _600 = spvSubgroupShuffle(as_type<float>(_570), uint(_596));
    uint _602 = uint(_598 ? as_type<int>(_600) : _570);
    return int(_602);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _140 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_29.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_29.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _271 = float2(_68, _66);
    float4 _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271)), int2(0), component::x).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = gl_FragCoord.x;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = gl_FragCoord.y;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = trunc(_85);
    int _95 = int(_93);
    float _97 = trunc(_91);
    int _99 = int(_97);
    float _101 = precise::max(_73, _75);
    uint _104 = spvSubgroupBallot(true).x;
    float _106 = precise::max(_77, _79);
    bool _110 = int(_104) != (-1);
    float _112 = precise::max(_101, _106);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_112, _112, _112, _112), uint2(int2(_95, _99)));
    float _138;
    if (!_110)
    {
        int _114 = as_type<int>(_112);
        int _116 = 1;
        int _118 = 31;
        int _120;
        int _345 = _45(_114, _116, _118, _120, gl_SubgroupInvocationID);
        int _122 = _345;
        float _124 = precise::max(_112, as_type<float>(_122));
        int _126 = as_type<int>(_124);
        int _128 = 2;
        int _130 = 31;
        int _132;
        int _353 = _45(_126, _128, _130, _132, gl_SubgroupInvocationID);
        int _134 = _353;
        float _136 = precise::max(_124, as_type<float>(_134));
        _138 = _136;
        _140 = true;
    }
    else
    {
        float _142 = as_type<float>(gl_SubgroupInvocationID);
        uint _144 = spvSubgroupBallot(true).x;
        float _146 = as_type<float>(gl_SubgroupLtMask.x);
        int _148 = as_type<int>(_142) & (-4);
        uint _150 = min(uint(_148), 32u);
        bool _152 = _150 < 32u;
        int _154 = 15 << int(_150);
        int _156 = _152 ? _154 : 0;
        int _158 = int(_144) & as_type<int>(_146);
        int _160 = _156 & _158;
        int _162 = _156 & int(_144);
        int _164 = int(spvFindUMSB(uint(_160)));
        int _166 = int(spvFindUMSB(uint(_162)));
        uint _168 = min(uint(_164), as_type<uint>(_142));
        int _170 = as_type<int>(_112);
        int _172 = int(_168);
        int _174 = 31;
        int _176;
        int _413 = _46(_170, _172, _174, _176, gl_SubgroupInvocationID);
        int _178 = _413;
        int _180 = int(_168);
        int _182 = int(_168);
        int _184 = 30;
        int _186;
        int _419 = _46(_180, _182, _184, _186, gl_SubgroupInvocationID);
        int _188 = _419;
        float _190 = precise::max(_112, as_type<float>(_178));
        int _192 = as_type<int>(_190);
        int _194 = _188;
        int _196 = 31;
        int _198;
        int _427 = _46(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _427;
        float _202 = precise::max(_190, as_type<float>(_200));
        int _204 = as_type<int>(_202);
        int _206 = _166;
        int _208 = 31;
        int _210;
        int _435 = _46(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _435;
        _138 = as_type<float>(_212);
    }
    _140 = false;
    float _214 = _138;
    float _216 = as_type<float>(gl_SubgroupInvocationID);
    int _218 = as_type<int>(_216) & 3;
    bool _220 = _218 != 0;
    if (_220)
    {
        out.m_39.x = _79;
        out.m_39.y = _79;
        out.m_39.z = _79;
        out.m_39.w = _79;
        return out;
    }
    int _222 = _95 >> 31;
    int _224 = _99 >> 31;
    int _226 = _222 & 1;
    int _228 = _224 & 1;
    int _230 = _95 + _226;
    int _232 = _99 + _228;
    int _234 = _230 >> 1;
    int _236 = _232 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_214, _214, _214, _214), uint2(int2(_234, _236)));
    out.m_39.x = _79;
    out.m_39.y = _79;
    out.m_39.z = _79;
    out.m_39.w = _79;
    return out;
}

