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
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _46(thread const int& _447, thread const int& _448, thread const int& _449, thread int& _450, thread uint& gl_SubgroupInvocationID)
{
    int _453 = _449 & 31;
    uint _455 = uint(int(uint(_449) >> uint(8)));
    int _457 = int(_455) & 31;
    float _459 = as_type<float>(gl_SubgroupInvocationID);
    int _461 = as_type<int>(_459) & _457;
    int _463 = ~_457;
    int _465 = _453 & _463;
    int _467 = _465 | _461;
    int _469 = as_type<int>(_459) ^ _448;
    bool _471 = uint(_469) <= uint(_467);
    _450 = _471 ? (-1) : 0;
    float _473 = spvSubgroupShuffle(as_type<float>(_447), uint(_469));
    uint _475 = uint(_471 ? as_type<int>(_473) : _447);
    return int(_475);
}

static inline __attribute__((always_inline))
int _47(thread const int& _523, thread const int& _524, thread const int& _525, thread int& _526, thread uint& gl_SubgroupInvocationID)
{
    int _529 = _525 & 31;
    uint _531 = uint(int(uint(_525) >> uint(8)));
    int _533 = int(_531) & 31;
    float _535 = as_type<float>(gl_SubgroupInvocationID);
    int _537 = as_type<int>(_535) & _533;
    int _539 = ~_533;
    int _541 = _529 & _539;
    int _543 = _541 | _537;
    int _545 = ~_533;
    int _547 = _524 & _545;
    int _549 = _547 | _537;
    bool _551 = uint(_549) <= uint(_543);
    _526 = _551 ? (-1) : 0;
    float _553 = spvSubgroupShuffle(as_type<float>(_523), uint(_549));
    uint _555 = uint(_551 ? as_type<int>(_553) : _523);
    return int(_555);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _106 = false;
    float _51 = gl_FragCoord.w;
    float _53 = in.m_27.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_27.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _257 = float2(_67, _69);
    float _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257)), int2(0), component::x).w;
    uint _74 = spvSubgroupBallot(true).x;
    bool _78 = int(_74) != (-1);
    float _104;
    if (!_78)
    {
        int _80 = as_type<int>(_71);
        int _82 = 1;
        int _84 = 31;
        int _86;
        int _279 = _46(_80, _82, _84, _86, gl_SubgroupInvocationID);
        int _88 = _279;
        float _90 = precise::max(_71, as_type<float>(_88));
        int _92 = as_type<int>(_90);
        int _94 = 2;
        int _96 = 31;
        int _98;
        int _288 = _46(_92, _94, _96, _98, gl_SubgroupInvocationID);
        int _100 = _288;
        float _102 = precise::max(_90, as_type<float>(_100));
        _104 = _102;
        _106 = true;
    }
    else
    {
        float _108 = as_type<float>(gl_SubgroupInvocationID);
        uint _110 = spvSubgroupBallot(true).x;
        float _112 = as_type<float>(gl_SubgroupLtMask.x);
        int _114 = as_type<int>(_108) & (-4);
        uint _116 = min(uint(_114), 32u);
        bool _118 = _116 < 32u;
        int _120 = 15 << int(_116);
        int _122 = _118 ? _120 : 0;
        int _124 = int(_110) & as_type<int>(_112);
        int _126 = _122 & _124;
        int _128 = _122 & int(_110);
        int _130 = int(spvFindUMSB(uint(_126)));
        int _132 = int(spvFindUMSB(uint(_128)));
        uint _134 = min(uint(_130), as_type<uint>(_108));
        int _136 = as_type<int>(_71);
        int _138 = int(_134);
        int _140 = 31;
        int _142;
        int _348 = _47(_136, _138, _140, _142, gl_SubgroupInvocationID);
        int _144 = _348;
        int _146 = int(_134);
        int _148 = int(_134);
        int _150 = 30;
        int _152;
        int _354 = _47(_146, _148, _150, _152, gl_SubgroupInvocationID);
        int _154 = _354;
        float _156 = precise::max(_71, as_type<float>(_144));
        int _158 = as_type<int>(_156);
        int _160 = _154;
        int _162 = 31;
        int _164;
        int _362 = _47(_158, _160, _162, _164, gl_SubgroupInvocationID);
        int _166 = _362;
        float _168 = precise::max(_156, as_type<float>(_166));
        int _170 = as_type<int>(_168);
        int _172 = _132;
        int _174 = 31;
        int _176;
        int _370 = _47(_170, _172, _174, _176, gl_SubgroupInvocationID);
        int _178 = _370;
        _104 = as_type<float>(_178);
    }
    _106 = false;
    float _180 = _104;
    float _182 = as_type<float>(gl_SubgroupInvocationID);
    int _184 = as_type<int>(_182) & 3;
    bool _186 = _184 != 0;
    if (!_186)
    {
        float _188 = gl_FragCoord.x;
        float _190 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _192 = _188 / _190;
        float _194 = gl_FragCoord.y;
        float _196 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _198 = _194 / _196;
        float _200 = trunc(_192);
        int _202 = int(_200);
        float _204 = trunc(_198);
        int _206 = int(_204);
        int _208 = _202 >> 31;
        int _210 = _208 & 1;
        int _212 = _206 >> 31;
        int _214 = _202 + _210;
        int _216 = _212 & 1;
        int _218 = _214 >> 1;
        int _220 = _206 + _216;
        int _222 = _220 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_180, _180, _180, _180), uint2(int2(_218, _222)));
    }
    out.gl_FragDepth = _71;
    out.m_40.x = _71;
    out.m_40.y = _71;
    out.m_40.z = _71;
    out.m_40.w = _71;
    return out;
}

