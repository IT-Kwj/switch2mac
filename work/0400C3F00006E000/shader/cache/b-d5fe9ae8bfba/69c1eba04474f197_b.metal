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
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _43(thread const int& _436, thread const int& _437, thread const int& _438, thread int& _439, thread uint& gl_SubgroupInvocationID)
{
    int _442 = _438 & 31;
    uint _444 = uint(int(uint(_438) >> uint(8)));
    int _446 = int(_444) & 31;
    float _448 = as_type<float>(gl_SubgroupInvocationID);
    int _450 = as_type<int>(_448) & _446;
    int _452 = ~_446;
    int _454 = _442 & _452;
    int _456 = _454 | _450;
    int _458 = as_type<int>(_448) ^ _437;
    bool _460 = uint(_458) <= uint(_456);
    _439 = _460 ? (-1) : 0;
    float _462 = spvSubgroupShuffle(as_type<float>(_436), uint(_458));
    uint _464 = uint(_460 ? as_type<int>(_462) : _436);
    return int(_464);
}

static inline __attribute__((always_inline))
int _44(thread const int& _512, thread const int& _513, thread const int& _514, thread int& _515, thread uint& gl_SubgroupInvocationID)
{
    int _518 = _514 & 31;
    uint _520 = uint(int(uint(_514) >> uint(8)));
    int _522 = int(_520) & 31;
    float _524 = as_type<float>(gl_SubgroupInvocationID);
    int _526 = as_type<int>(_524) & _522;
    int _528 = ~_522;
    int _530 = _518 & _528;
    int _532 = _530 | _526;
    int _534 = ~_522;
    int _536 = _513 & _534;
    int _538 = _536 | _526;
    bool _540 = uint(_538) <= uint(_532);
    _515 = _540 ? (-1) : 0;
    float _542 = spvSubgroupShuffle(as_type<float>(_512), uint(_538));
    uint _544 = uint(_540 ? as_type<int>(_542) : _512);
    return int(_544);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _103 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_27.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_27.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _254 = float2(_64, _66);
    float _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_254, float2(0.0), isnan(_254)), int2(0), component::x).w;
    uint _71 = spvSubgroupBallot(true).x;
    bool _75 = int(_71) != (-1);
    float _101;
    if (!_75)
    {
        int _77 = as_type<int>(_68);
        int _79 = 1;
        int _81 = 31;
        int _83;
        int _276 = _43(_77, _79, _81, _83, gl_SubgroupInvocationID);
        int _85 = _276;
        float _87 = precise::max(_68, as_type<float>(_85));
        int _89 = as_type<int>(_87);
        int _91 = 2;
        int _93 = 31;
        int _95;
        int _285 = _43(_89, _91, _93, _95, gl_SubgroupInvocationID);
        int _97 = _285;
        float _99 = precise::max(_87, as_type<float>(_97));
        _101 = _99;
        _103 = true;
    }
    else
    {
        float _105 = as_type<float>(gl_SubgroupInvocationID);
        uint _107 = spvSubgroupBallot(true).x;
        float _109 = as_type<float>(gl_SubgroupLtMask.x);
        int _111 = as_type<int>(_105) & (-4);
        uint _113 = min(uint(_111), 32u);
        bool _115 = _113 < 32u;
        int _117 = 15 << int(_113);
        int _119 = _115 ? _117 : 0;
        int _121 = int(_107) & as_type<int>(_109);
        int _123 = _119 & _121;
        int _125 = _119 & int(_107);
        int _127 = int(spvFindUMSB(uint(_123)));
        uint _129 = min(uint(_127), as_type<uint>(_105));
        int _131 = int(spvFindUMSB(uint(_125)));
        int _133 = as_type<int>(_68);
        int _135 = int(_129);
        int _137 = 31;
        int _139;
        int _345 = _44(_133, _135, _137, _139, gl_SubgroupInvocationID);
        int _141 = _345;
        int _143 = int(_129);
        int _145 = int(_129);
        int _147 = 30;
        int _149;
        int _351 = _44(_143, _145, _147, _149, gl_SubgroupInvocationID);
        int _151 = _351;
        float _153 = precise::max(_68, as_type<float>(_141));
        int _155 = as_type<int>(_153);
        int _157 = _151;
        int _159 = 31;
        int _161;
        int _359 = _44(_155, _157, _159, _161, gl_SubgroupInvocationID);
        int _163 = _359;
        float _165 = precise::max(_153, as_type<float>(_163));
        int _167 = as_type<int>(_165);
        int _169 = _131;
        int _171 = 31;
        int _173;
        int _367 = _44(_167, _169, _171, _173, gl_SubgroupInvocationID);
        int _175 = _367;
        _101 = as_type<float>(_175);
    }
    _103 = false;
    float _177 = _101;
    float _179 = as_type<float>(gl_SubgroupInvocationID);
    int _181 = as_type<int>(_179) & 3;
    bool _183 = _181 != 0;
    if (_183)
    {
        out.gl_FragDepth = _68;
        return out;
    }
    float _185 = gl_FragCoord.x;
    float _187 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _189 = _185 / _187;
    float _191 = gl_FragCoord.y;
    float _193 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _195 = _191 / _193;
    float _197 = trunc(_189);
    int _199 = int(_197);
    float _201 = trunc(_195);
    int _203 = int(_201);
    int _205 = _199 >> 31;
    int _207 = _205 & 1;
    int _209 = _203 >> 31;
    int _211 = _199 + _207;
    int _213 = _209 & 1;
    int _215 = _211 >> 1;
    int _217 = _203 + _213;
    int _219 = _217 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_177, _177, _177, _177), uint2(int2(_215, _219)));
    out.gl_FragDepth = _68;
    return out;
}

