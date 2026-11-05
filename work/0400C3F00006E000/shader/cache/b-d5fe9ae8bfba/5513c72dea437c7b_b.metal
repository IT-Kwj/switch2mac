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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(4)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(5)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _534, thread const int& _535, thread const int& _536, thread int& _537, thread uint& gl_SubgroupInvocationID)
{
    int _540 = _536 & 31;
    uint _542 = uint(int(uint(_536) >> uint(8)));
    int _544 = int(_542) & 31;
    float _546 = as_type<float>(gl_SubgroupInvocationID);
    int _548 = as_type<int>(_546) & _544;
    int _550 = ~_544;
    int _552 = _540 & _550;
    int _554 = _552 | _548;
    int _556 = as_type<int>(_546) ^ _535;
    bool _558 = uint(_556) <= uint(_554);
    _537 = _558 ? (-1) : 0;
    float _560 = spvSubgroupShuffle(as_type<float>(_534), uint(_556));
    uint _562 = uint(_558 ? as_type<int>(_560) : _534);
    return int(_562);
}

static inline __attribute__((always_inline))
int _55(thread const int& _610, thread const int& _611, thread const int& _612, thread int& _613, thread uint& gl_SubgroupInvocationID)
{
    int _616 = _612 & 31;
    uint _618 = uint(int(uint(_612) >> uint(8)));
    int _620 = int(_618) & 31;
    float _622 = as_type<float>(gl_SubgroupInvocationID);
    int _624 = as_type<int>(_622) & _620;
    int _626 = ~_620;
    int _628 = _616 & _626;
    int _630 = _628 | _624;
    int _632 = ~_620;
    int _634 = _611 & _632;
    int _636 = _634 | _624;
    bool _638 = uint(_636) <= uint(_630);
    _613 = _638 ? (-1) : 0;
    float _640 = spvSubgroupShuffle(as_type<float>(_610), uint(_636));
    uint _642 = uint(_638 ? as_type<int>(_640) : _610);
    return int(_642);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _161 = false;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _292 = float2(_75, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = gl_FragCoord.x;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = gl_FragCoord.y;
    float _98 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _100 = _96 / _98;
    float _102 = trunc(_94);
    int _104 = int(_102);
    float _106 = trunc(_100);
    int _108 = int(_106);
    float _110 = precise::max(_82, _84);
    float _112 = _88 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _114 = precise::max(_86, _88);
    uint _117 = spvSubgroupBallot(true).x;
    float _119 = precise::max(_110, _114);
    float _121 = -_88;
    float _123 = _121 + 1.0;
    bool _127 = int(_117) != (-1);
    float _129 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
    float _131 = 1.0 / _129;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_119, _119, _119, _119), uint2(int2(_104, _108)));
    float _133 = _112 * _131;
    float _159;
    if (!_127)
    {
        int _135 = as_type<int>(_119);
        int _137 = 1;
        int _139 = 31;
        int _141;
        int _384 = _54(_135, _137, _139, _141, gl_SubgroupInvocationID);
        int _143 = _384;
        float _145 = precise::max(_119, as_type<float>(_143));
        int _147 = as_type<int>(_145);
        int _149 = 2;
        int _151 = 31;
        int _153;
        int _392 = _54(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _392;
        float _157 = precise::max(_145, as_type<float>(_155));
        _159 = _157;
        _161 = true;
    }
    else
    {
        float _163 = as_type<float>(gl_SubgroupInvocationID);
        uint _165 = spvSubgroupBallot(true).x;
        float _167 = as_type<float>(gl_SubgroupLtMask.x);
        int _169 = as_type<int>(_163) & (-4);
        uint _171 = min(uint(_169), 32u);
        bool _173 = _171 < 32u;
        int _175 = 15 << int(_171);
        int _177 = _173 ? _175 : 0;
        int _179 = int(_165) & as_type<int>(_167);
        int _181 = _177 & _179;
        int _183 = _177 & int(_165);
        int _185 = int(spvFindUMSB(uint(_181)));
        int _187 = int(spvFindUMSB(uint(_183)));
        uint _189 = min(uint(_185), as_type<uint>(_163));
        int _191 = as_type<int>(_119);
        int _193 = int(_189);
        int _195 = 31;
        int _197;
        int _452 = _55(_191, _193, _195, _197, gl_SubgroupInvocationID);
        int _199 = _452;
        int _201 = int(_189);
        int _203 = int(_189);
        int _205 = 30;
        int _207;
        int _458 = _55(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _458;
        float _211 = precise::max(_119, as_type<float>(_199));
        int _213 = as_type<int>(_211);
        int _215 = _209;
        int _217 = 31;
        int _219;
        int _466 = _55(_213, _215, _217, _219, gl_SubgroupInvocationID);
        int _221 = _466;
        float _223 = precise::max(_211, as_type<float>(_221));
        int _225 = as_type<int>(_223);
        int _227 = _187;
        int _229 = 31;
        int _231;
        int _474 = _55(_225, _227, _229, _231, gl_SubgroupInvocationID);
        int _233 = _474;
        _159 = as_type<float>(_233);
    }
    _161 = false;
    float _235 = _159;
    float _237 = as_type<float>(gl_SubgroupInvocationID);
    int _239 = as_type<int>(_237) & 3;
    bool _241 = _239 != 0;
    if (_241)
    {
        out.gl_FragDepth = _133;
        out.m_48.x = _88;
        out.m_48.y = _88;
        out.m_48.z = _88;
        out.m_48.w = _88;
        return out;
    }
    int _243 = _104 >> 31;
    int _245 = _108 >> 31;
    int _247 = _243 & 1;
    int _249 = _245 & 1;
    int _251 = _104 + _247;
    int _253 = _108 + _249;
    int _255 = _251 >> 1;
    int _257 = _253 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_235, _235, _235, _235), uint2(int2(_255, _257)));
    out.gl_FragDepth = _133;
    out.m_48.x = _88;
    out.m_48.y = _88;
    out.m_48.z = _88;
    out.m_48.w = _88;
    return out;
}

