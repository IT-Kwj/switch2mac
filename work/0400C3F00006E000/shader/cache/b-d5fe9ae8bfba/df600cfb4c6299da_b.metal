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
int _56(thread const int& _701, thread const int& _702, thread const int& _703, thread int& _704, thread uint& gl_SubgroupInvocationID)
{
    int _707 = _703 & 31;
    uint _709 = uint(int(uint(_703) >> uint(8)));
    int _711 = int(_709) & 31;
    float _713 = as_type<float>(gl_SubgroupInvocationID);
    int _715 = as_type<int>(_713) & _711;
    int _717 = ~_711;
    int _719 = _707 & _717;
    int _721 = _719 | _715;
    int _723 = as_type<int>(_713) ^ _702;
    bool _725 = uint(_723) <= uint(_721);
    _704 = _725 ? (-1) : 0;
    float _727 = spvSubgroupShuffle(as_type<float>(_701), uint(_723));
    uint _729 = uint(_725 ? as_type<int>(_727) : _701);
    return int(_729);
}

static inline __attribute__((always_inline))
int _57(thread const int& _777, thread const int& _778, thread const int& _779, thread int& _780, thread uint& gl_SubgroupInvocationID)
{
    int _783 = _779 & 31;
    uint _785 = uint(int(uint(_779) >> uint(8)));
    int _787 = int(_785) & 31;
    float _789 = as_type<float>(gl_SubgroupInvocationID);
    int _791 = as_type<int>(_789) & _787;
    int _793 = ~_787;
    int _795 = _783 & _793;
    int _797 = _795 | _791;
    int _799 = ~_787;
    int _801 = _778 & _799;
    int _803 = _801 | _791;
    bool _805 = uint(_803) <= uint(_797);
    _780 = _805 ? (-1) : 0;
    float _807 = spvSubgroupShuffle(as_type<float>(_777), uint(_803));
    uint _809 = uint(_805 ? as_type<int>(_807) : _777);
    return int(_809);
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
    float2 _366 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366)), int2(0), component::x).xyzw;
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
        int _444 = _56(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _444;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _452 = _56(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _452;
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
        int _541 = _57(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _541;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _547 = _57(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _547;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _555 = _57(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _555;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _563 = _57(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _563;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _249 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _251 = precise::min(_84, _86);
    float _253 = _79 * _247;
    int _255 = _117 * 2;
    float _257 = _77 * _249;
    float _259 = as_type<float>(gl_SubgroupInvocationID);
    float _261 = trunc(_253);
    int _263 = int(_261);
    float _265 = precise::min(_88, _90);
    int _267 = _113 & 1;
    float _269 = precise::min(_251, _265);
    float _271 = trunc(_257);
    int _273 = int(_271);
    int _275 = as_type<int>(_259) & 3;
    bool _277 = _275 != 0;
    int _279 = _263 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _281 = _279 + _273;
    float _283 = _269 * 16777215.0;
    int _285 = 2 & _255;
    int _287 = (-3) & _267;
    int _289 = _285 | _287;
    float _291 = trunc(_283);
    float _293 = precise::max(_291, 0.0);
    uint _295 = uint(_293);
    int _297 = _281 * 4;
    int _299 = _297 + _289;
    int _301 = _299 << 2;
    if (!_277)
    {
        int _303 = _113 >> 31;
        int _305 = _117 >> 31;
        int _307 = _303 & 1;
        int _309 = _305 & 1;
        int _311 = _113 + _307;
        int _313 = _117 + _309;
        int _315 = _311 >> 1;
        int _317 = _313 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_315, _317)));
    }
    float _319 = -_90;
    float _321 = _319 + 1.0;
    uint _323 = uint(int(uint(_301) >> uint(2)));
    uint _689 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_323)], _295, memory_order_relaxed);
    uint _325 = _689;
    float _327 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[0].x, _121);
    float _329 = 1.0 / _327;
    float _331 = _121 * _329;
    out.gl_FragDepth = _331;
    return out;
}

