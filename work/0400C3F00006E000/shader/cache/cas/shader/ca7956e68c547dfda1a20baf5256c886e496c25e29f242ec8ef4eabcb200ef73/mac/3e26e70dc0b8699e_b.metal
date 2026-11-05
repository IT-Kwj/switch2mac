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
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _48(thread const int& _496, thread const int& _497, thread const int& _498, thread int& _499, thread uint& gl_SubgroupInvocationID)
{
    int _502 = _498 & 31;
    uint _504 = uint(int(uint(_498) >> uint(8)));
    int _506 = int(_504) & 31;
    float _508 = as_type<float>(gl_SubgroupInvocationID);
    int _510 = as_type<int>(_508) & _506;
    int _512 = ~_506;
    int _514 = _502 & _512;
    int _516 = _514 | _510;
    int _518 = as_type<int>(_508) ^ _497;
    bool _520 = uint(_518) <= uint(_516);
    _499 = _520 ? (-1) : 0;
    float _522 = spvSubgroupShuffle(as_type<float>(_496), uint(_518));
    uint _524 = uint(_520 ? as_type<int>(_522) : _496);
    return int(_524);
}

static inline __attribute__((always_inline))
int _49(thread const int& _572, thread const int& _573, thread const int& _574, thread int& _575, thread uint& gl_SubgroupInvocationID)
{
    int _578 = _574 & 31;
    uint _580 = uint(int(uint(_574) >> uint(8)));
    int _582 = int(_580) & 31;
    float _584 = as_type<float>(gl_SubgroupInvocationID);
    int _586 = as_type<int>(_584) & _582;
    int _588 = ~_582;
    int _590 = _578 & _588;
    int _592 = _590 | _586;
    int _594 = ~_582;
    int _596 = _573 & _594;
    int _598 = _596 | _586;
    bool _600 = uint(_598) <= uint(_592);
    _575 = _600 ? (-1) : 0;
    float _602 = spvSubgroupShuffle(as_type<float>(_572), uint(_598));
    uint _604 = uint(_600 ? as_type<int>(_602) : _572);
    return int(_604);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _145 = false;
    float _53 = gl_FragCoord.w;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _278 = float2(_69, _71);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_278, float2(0.0), isnan(_278)), int2(0), component::x).xyzw;
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
    float _106 = precise::max(_80, _82);
    uint _109 = spvSubgroupBallot(true).x;
    float _111 = precise::max(_104, _106);
    bool _115 = int(_109) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_111, _111, _111, _111), uint2(int2(_98, _102)));
    int _117 = as_type<int>(_111);
    float _143;
    if (!_115)
    {
        int _119 = as_type<int>(_111);
        int _121 = 1;
        int _123 = 31;
        int _125;
        int _354 = _48(_119, _121, _123, _125, gl_SubgroupInvocationID);
        int _127 = _354;
        float _129 = precise::max(_111, as_type<float>(_127));
        int _131 = as_type<int>(_129);
        int _133 = 2;
        int _135 = 31;
        int _137;
        int _362 = _48(_131, _133, _135, _137, gl_SubgroupInvocationID);
        int _139 = _362;
        float _141 = precise::max(_129, as_type<float>(_139));
        _143 = _141;
        _145 = true;
    }
    else
    {
        float _147 = as_type<float>(gl_SubgroupInvocationID);
        uint _149 = spvSubgroupBallot(true).x;
        float _151 = as_type<float>(gl_SubgroupLtMask.x);
        int _153 = as_type<int>(_147) & (-4);
        uint _155 = min(uint(_153), 32u);
        bool _157 = _155 < 32u;
        int _159 = 15 << int(_155);
        int _161 = _157 ? _159 : 0;
        int _163 = int(_149) & as_type<int>(_151);
        int _165 = _161 & _163;
        int _167 = _161 & int(_149);
        int _169 = int(spvFindUMSB(uint(_165)));
        int _171 = int(spvFindUMSB(uint(_167)));
        uint _173 = min(uint(_169), as_type<uint>(_147));
        int _175 = as_type<int>(_111);
        int _177 = int(_173);
        int _179 = 31;
        int _181;
        int _422 = _49(_175, _177, _179, _181, gl_SubgroupInvocationID);
        int _183 = _422;
        int _185 = int(_173);
        int _187 = int(_173);
        int _189 = 30;
        int _191;
        int _428 = _49(_185, _187, _189, _191, gl_SubgroupInvocationID);
        int _193 = _428;
        float _195 = precise::max(_111, as_type<float>(_183));
        int _197 = as_type<int>(_195);
        int _199 = _193;
        int _201 = 31;
        int _203;
        int _436 = _49(_197, _199, _201, _203, gl_SubgroupInvocationID);
        int _205 = _436;
        float _207 = precise::max(_195, as_type<float>(_205));
        int _209 = as_type<int>(_207);
        int _211 = _171;
        int _213 = 31;
        int _215;
        int _444 = _49(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _444;
        _117 = _169;
        _143 = as_type<float>(_217);
    }
    _145 = false;
    int _219 = _117;
    float _221 = _143;
    float _223 = as_type<float>(gl_SubgroupInvocationID);
    int _225 = as_type<int>(_223) & 3;
    bool _227 = _225 != 0;
    if (_227)
    {
        out.gl_FragDepth = as_type<float>(_219);
        out.m_42.x = _111;
        return out;
    }
    int _229 = _98 >> 31;
    int _231 = _102 >> 31;
    int _233 = _229 & 1;
    int _235 = _231 & 1;
    int _237 = _98 + _233;
    int _239 = _102 + _235;
    int _241 = _237 >> 1;
    int _243 = _239 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_221, _221, _221, _221), uint2(int2(_241, _243)));
    out.gl_FragDepth = as_type<float>(_241);
    out.m_42.x = _111;
    return out;
}

