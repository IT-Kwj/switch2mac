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
    float4 m_42 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _48(thread const int& _490, thread const int& _491, thread const int& _492, thread int& _493, thread uint& gl_SubgroupInvocationID)
{
    int _496 = _492 & 31;
    uint _498 = uint(int(uint(_492) >> uint(8)));
    int _500 = int(_498) & 31;
    float _502 = as_type<float>(gl_SubgroupInvocationID);
    int _504 = as_type<int>(_502) & _500;
    int _506 = ~_500;
    int _508 = _496 & _506;
    int _510 = _508 | _504;
    int _512 = as_type<int>(_502) ^ _491;
    bool _514 = uint(_512) <= uint(_510);
    _493 = _514 ? (-1) : 0;
    float _516 = spvSubgroupShuffle(as_type<float>(_490), uint(_512));
    uint _518 = uint(_514 ? as_type<int>(_516) : _490);
    return int(_518);
}

static inline __attribute__((always_inline))
int _49(thread const int& _566, thread const int& _567, thread const int& _568, thread int& _569, thread uint& gl_SubgroupInvocationID)
{
    int _572 = _568 & 31;
    uint _574 = uint(int(uint(_568) >> uint(8)));
    int _576 = int(_574) & 31;
    float _578 = as_type<float>(gl_SubgroupInvocationID);
    int _580 = as_type<int>(_578) & _576;
    int _582 = ~_576;
    int _584 = _572 & _582;
    int _586 = _584 | _580;
    int _588 = ~_576;
    int _590 = _567 & _588;
    int _592 = _590 | _580;
    bool _594 = uint(_592) <= uint(_586);
    _569 = _594 ? (-1) : 0;
    float _596 = spvSubgroupShuffle(as_type<float>(_566), uint(_592));
    uint _598 = uint(_594 ? as_type<int>(_596) : _566);
    return int(_598);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _143 = false;
    float _53 = gl_FragCoord.w;
    float _55 = in.m_29.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _274 = float2(_71, _69);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_274, float2(0.0), isnan(_274)), int2(0), component::x).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = gl_FragCoord.x;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = gl_FragCoord.y;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = trunc(_88);
    int _98 = int(_96);
    float _100 = trunc(_94);
    int _102 = int(_100);
    float _104 = precise::max(_76, _78);
    uint _107 = spvSubgroupBallot(true).x;
    float _109 = precise::max(_80, _82);
    bool _113 = int(_107) != (-1);
    float _115 = precise::max(_104, _109);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_115, _115, _115, _115), uint2(int2(_98, _102)));
    float _141;
    if (!_113)
    {
        int _117 = as_type<int>(_115);
        int _119 = 1;
        int _121 = 31;
        int _123;
        int _348 = _48(_117, _119, _121, _123, gl_SubgroupInvocationID);
        int _125 = _348;
        float _127 = precise::max(_115, as_type<float>(_125));
        int _129 = as_type<int>(_127);
        int _131 = 2;
        int _133 = 31;
        int _135;
        int _356 = _48(_129, _131, _133, _135, gl_SubgroupInvocationID);
        int _137 = _356;
        float _139 = precise::max(_127, as_type<float>(_137));
        _141 = _139;
        _143 = true;
    }
    else
    {
        float _145 = as_type<float>(gl_SubgroupInvocationID);
        uint _147 = spvSubgroupBallot(true).x;
        float _149 = as_type<float>(gl_SubgroupLtMask.x);
        int _151 = as_type<int>(_145) & (-4);
        uint _153 = min(uint(_151), 32u);
        bool _155 = _153 < 32u;
        int _157 = 15 << int(_153);
        int _159 = _155 ? _157 : 0;
        int _161 = int(_147) & as_type<int>(_149);
        int _163 = _159 & _161;
        int _165 = _159 & int(_147);
        int _167 = int(spvFindUMSB(uint(_163)));
        int _169 = int(spvFindUMSB(uint(_165)));
        uint _171 = min(uint(_167), as_type<uint>(_145));
        int _173 = as_type<int>(_115);
        int _175 = int(_171);
        int _177 = 31;
        int _179;
        int _416 = _49(_173, _175, _177, _179, gl_SubgroupInvocationID);
        int _181 = _416;
        int _183 = int(_171);
        int _185 = int(_171);
        int _187 = 30;
        int _189;
        int _422 = _49(_183, _185, _187, _189, gl_SubgroupInvocationID);
        int _191 = _422;
        float _193 = precise::max(_115, as_type<float>(_181));
        int _195 = as_type<int>(_193);
        int _197 = _191;
        int _199 = 31;
        int _201;
        int _430 = _49(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _430;
        float _205 = precise::max(_193, as_type<float>(_203));
        int _207 = as_type<int>(_205);
        int _209 = _169;
        int _211 = 31;
        int _213;
        int _438 = _49(_207, _209, _211, _213, gl_SubgroupInvocationID);
        int _215 = _438;
        _141 = as_type<float>(_215);
    }
    _143 = false;
    float _217 = _141;
    float _219 = as_type<float>(gl_SubgroupInvocationID);
    int _221 = as_type<int>(_219) & 3;
    bool _223 = _221 != 0;
    if (!_223)
    {
        int _225 = _98 >> 31;
        int _227 = _102 >> 31;
        int _229 = _225 & 1;
        int _231 = _227 & 1;
        int _233 = _98 + _229;
        int _235 = _102 + _231;
        int _237 = _233 >> 1;
        int _239 = _235 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_217, _217, _217, _217), uint2(int2(_237, _239)));
    }
    out.gl_FragDepth = _82;
    out.m_42.x = _82;
    out.m_42.y = _82;
    out.m_42.z = _82;
    out.m_42.w = _82;
    return out;
}

