#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(5)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(6)]];
};

struct main0_out
{
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _734, thread const int& _735, thread const int& _736, thread int& _737, thread uint& gl_SubgroupInvocationID)
{
    int _740 = _736 & 31;
    uint _742 = uint(int(uint(_736) >> uint(8)));
    int _744 = int(_742) & 31;
    float _746 = as_type<float>(gl_SubgroupInvocationID);
    int _748 = as_type<int>(_746) & _744;
    int _750 = ~_744;
    int _752 = _740 & _750;
    int _754 = _752 | _748;
    int _756 = as_type<int>(_746) ^ _735;
    bool _758 = uint(_756) <= uint(_754);
    _737 = _758 ? (-1) : 0;
    float _760 = spvSubgroupShuffle(as_type<float>(_734), uint(_756));
    uint _762 = uint(_758 ? as_type<int>(_760) : _734);
    return int(_762);
}

static inline __attribute__((always_inline))
int _57(thread const int& _810, thread const int& _811, thread const int& _812, thread int& _813, thread uint& gl_SubgroupInvocationID)
{
    int _816 = _812 & 31;
    uint _818 = uint(int(uint(_812) >> uint(8)));
    int _820 = int(_818) & 31;
    float _822 = as_type<float>(gl_SubgroupInvocationID);
    int _824 = as_type<int>(_822) & _820;
    int _826 = ~_820;
    int _828 = _816 & _826;
    int _830 = _828 | _824;
    int _832 = ~_820;
    int _834 = _811 & _832;
    int _836 = _834 | _824;
    bool _838 = uint(_836) <= uint(_830);
    _813 = _838 ? (-1) : 0;
    float _840 = spvSubgroupShuffle(as_type<float>(_810), uint(_836));
    uint _842 = uint(_838 ? as_type<int>(_840) : _810);
    return int(_842);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _153 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_40.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_40.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _380 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    uint _105 = spvSubgroupBallot(true).x;
    bool _109 = int(_105) != (-1);
    float _111 = trunc(_96);
    int _113 = int(_111);
    float _115 = trunc(_102);
    int _117 = int(_115);
    float _119 = precise::max(_84, _86);
    float _121 = _90 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _123 = precise::max(_88, _90);
    float _125 = precise::max(_119, _123);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_125, _125, _125, _125), uint2(int2(_113, _117)));
    float _151;
    if (!_109)
    {
        int _127 = as_type<int>(_125);
        int _129 = 1;
        int _131 = 31;
        int _133;
        int _458 = _56(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _458;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _466 = _56(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _466;
        float _149 = precise::max(_137, as_type<float>(_147));
        _151 = _149;
        _153 = true;
    }
    else
    {
        float _155 = as_type<float>(gl_SubgroupInvocationID);
        uint _157 = spvSubgroupBallot(true).x;
        float _159 = as_type<float>(gl_SubgroupLtMask.x);
        int _161 = as_type<int>(_155) & (-4);
        uint _163 = min(uint(_161), 32u);
        bool _165 = int(_163) == 0;
        bool _167 = _163 < 32u;
        int _169 = 32 - int(_163);
        int _171 = int(_163) - 32;
        int _173 = 15 << int(_163);
        uint _175 = uint(int(uint(0) >> uint(_169)));
        int _177 = _173 | int(_175);
        int _179 = _165 ? 15 : _177;
        bool _181 = uint(_171) < 32u;
        int _183 = 0 << _171;
        int _185 = _181 ? _183 : 0;
        int _187 = _167 ? _179 : _185;
        int _189 = int(_157) & as_type<int>(_159);
        int _191 = _187 & _189;
        int _193 = _187 & int(_157);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_155));
        int _201 = as_type<int>(_125);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _555 = _57(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _555;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _561 = _57(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _561;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _569 = _57(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _569;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _577 = _57(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _577;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _253 = _113 & 1;
    float _255 = _77 * _247;
    int _257 = _117 * 2;
    float _259 = _79 * _251;
    float _261 = precise::min(_84, _86);
    float _263 = _125 * 16777215.0;
    float _265 = precise::min(_88, _90);
    float _267 = trunc(_255);
    int _269 = int(_267);
    int _271 = 2 & _257;
    int _273 = (-3) & _253;
    int _275 = _271 | _273;
    float _277 = precise::min(_261, _265);
    float _279 = trunc(_259);
    int _281 = int(_279);
    float _283 = _277 * 16777215.0;
    int _285 = as_type<int>(_249) & 3;
    bool _287 = _285 != 0;
    float _289 = trunc(_263);
    float _291 = precise::max(_289, 0.0);
    uint _293 = uint(_291);
    int _295 = _281 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _297 = _295 + _269;
    int _299 = _297 * 4;
    int _301 = _299 + _275;
    int _303 = _301 * 4;
    float _305 = trunc(_283);
    float _307 = precise::max(_305, 0.0);
    uint _309 = uint(_307);
    int _311 = _303 + 9728;
    if (!_287)
    {
        int _313 = _113 >> 31;
        int _315 = _117 >> 31;
        int _317 = _313 & 1;
        int _319 = _315 & 1;
        int _321 = _113 + _317;
        int _323 = _117 + _319;
        int _325 = _321 >> 1;
        int _327 = _323 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_325, _327)));
    }
    float _329 = -_90;
    float _331 = _329 + 1.0;
    uint _333 = uint(int(uint(_303) >> uint(2)));
    uint _714 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_333)], _309, memory_order_relaxed);
    uint _335 = _714;
    float _337 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[0].x, _121);
    uint _339 = uint(int(uint(_311) >> uint(2)));
    uint _727 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_339)], _293, memory_order_relaxed);
    uint _341 = _727;
    float _343 = 1.0 / _337;
    float _345 = _121 * _343;
    out.gl_FragDepth = _345;
    return out;
}

