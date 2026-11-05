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
    float4 m_44 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _50(thread const int& _502, thread const int& _503, thread const int& _504, thread int& _505, thread uint& gl_SubgroupInvocationID)
{
    int _508 = _504 & 31;
    uint _510 = uint(int(uint(_504) >> uint(8)));
    int _512 = int(_510) & 31;
    float _514 = as_type<float>(gl_SubgroupInvocationID);
    int _516 = as_type<int>(_514) & _512;
    int _518 = ~_512;
    int _520 = _508 & _518;
    int _522 = _520 | _516;
    int _524 = as_type<int>(_514) ^ _503;
    bool _526 = uint(_524) <= uint(_522);
    _505 = _526 ? (-1) : 0;
    float _528 = spvSubgroupShuffle(as_type<float>(_502), uint(_524));
    uint _530 = uint(_526 ? as_type<int>(_528) : _502);
    return int(_530);
}

static inline __attribute__((always_inline))
int _51(thread const int& _578, thread const int& _579, thread const int& _580, thread int& _581, thread uint& gl_SubgroupInvocationID)
{
    int _584 = _580 & 31;
    uint _586 = uint(int(uint(_580) >> uint(8)));
    int _588 = int(_586) & 31;
    float _590 = as_type<float>(gl_SubgroupInvocationID);
    int _592 = as_type<int>(_590) & _588;
    int _594 = ~_588;
    int _596 = _584 & _594;
    int _598 = _596 | _592;
    int _600 = ~_588;
    int _602 = _579 & _600;
    int _604 = _602 | _592;
    bool _606 = uint(_604) <= uint(_598);
    _581 = _606 ? (-1) : 0;
    float _608 = spvSubgroupShuffle(as_type<float>(_578), uint(_604));
    uint _610 = uint(_606 ? as_type<int>(_608) : _578);
    return int(_610);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _147 = false;
    float _55 = gl_FragCoord.w;
    float _57 = in.m_29.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_29.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _280 = float2(_71, _73);
    float4 _76 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280)), int2(0), component::x).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = gl_FragCoord.y;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = trunc(_90);
    int _100 = int(_98);
    float _102 = trunc(_96);
    int _104 = int(_102);
    float _106 = precise::max(_78, _80);
    float _108 = precise::max(_82, _84);
    uint _111 = spvSubgroupBallot(true).x;
    float _113 = precise::max(_106, _108);
    bool _117 = int(_111) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_113, _113, _113, _113), uint2(int2(_100, _104)));
    int _119 = _100;
    float _145;
    if (!_117)
    {
        int _121 = as_type<int>(_113);
        int _123 = 1;
        int _125 = 31;
        int _127;
        int _355 = _50(_121, _123, _125, _127, gl_SubgroupInvocationID);
        int _129 = _355;
        float _131 = precise::max(_113, as_type<float>(_129));
        int _133 = as_type<int>(_131);
        int _135 = 2;
        int _137 = 31;
        int _139;
        int _363 = _50(_133, _135, _137, _139, gl_SubgroupInvocationID);
        int _141 = _363;
        float _143 = precise::max(_131, as_type<float>(_141));
        _145 = _143;
        _147 = true;
    }
    else
    {
        float _149 = as_type<float>(gl_SubgroupInvocationID);
        uint _151 = spvSubgroupBallot(true).x;
        float _153 = as_type<float>(gl_SubgroupLtMask.x);
        int _155 = as_type<int>(_149) & (-4);
        uint _157 = min(uint(_155), 32u);
        bool _159 = _157 < 32u;
        int _161 = 15 << int(_157);
        int _163 = _159 ? _161 : 0;
        int _165 = int(_151) & as_type<int>(_153);
        int _167 = _163 & _165;
        int _169 = _163 & int(_151);
        int _171 = int(spvFindUMSB(uint(_167)));
        int _173 = int(spvFindUMSB(uint(_169)));
        uint _175 = min(uint(_171), as_type<uint>(_149));
        int _177 = as_type<int>(_113);
        int _179 = int(_175);
        int _181 = 31;
        int _183;
        int _423 = _51(_177, _179, _181, _183, gl_SubgroupInvocationID);
        int _185 = _423;
        int _187 = int(_175);
        int _189 = int(_175);
        int _191 = 30;
        int _193;
        int _429 = _51(_187, _189, _191, _193, gl_SubgroupInvocationID);
        int _195 = _429;
        float _197 = precise::max(_113, as_type<float>(_185));
        int _199 = as_type<int>(_197);
        int _201 = _195;
        int _203 = 31;
        int _205;
        int _437 = _51(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _437;
        float _209 = precise::max(_197, as_type<float>(_207));
        int _211 = as_type<int>(_209);
        int _213 = _173;
        int _215 = 31;
        int _217;
        int _445 = _51(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _445;
        _145 = as_type<float>(_219);
    }
    _147 = false;
    float _221 = _145;
    float _223 = as_type<float>(gl_SubgroupInvocationID);
    int _225 = as_type<int>(_223) & 3;
    bool _227 = _225 != 0;
    if (!_227)
    {
        int _229 = _100 >> 31;
        int _231 = _104 >> 31;
        int _233 = _229 & 1;
        int _235 = _231 & 1;
        int _237 = _100 + _233;
        int _239 = _104 + _235;
        int _241 = _237 >> 1;
        int _243 = _239 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_221, _221, _221, _221), uint2(int2(_241, _243)));
        _119 = _241;
    }
    int _245 = _119;
    out.gl_FragDepth = as_type<float>(_245);
    out.m_42.x = _84;
    out.m_42.y = _84;
    out.m_42.z = _84;
    out.m_42.w = _84;
    out.m_44.x = _113;
    return out;
}

