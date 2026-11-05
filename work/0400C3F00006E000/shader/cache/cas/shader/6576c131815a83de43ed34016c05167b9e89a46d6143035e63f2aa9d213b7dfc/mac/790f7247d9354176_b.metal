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
    float4 m_53 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _728, thread const int& _729, thread const int& _730, thread int& _731, thread uint& gl_SubgroupInvocationID)
{
    int _734 = _730 & 31;
    uint _736 = uint(int(uint(_730) >> uint(8)));
    int _738 = int(_736) & 31;
    float _740 = as_type<float>(gl_SubgroupInvocationID);
    int _742 = as_type<int>(_740) & _738;
    int _744 = ~_738;
    int _746 = _734 & _744;
    int _748 = _746 | _742;
    int _750 = as_type<int>(_740) ^ _729;
    bool _752 = uint(_750) <= uint(_748);
    _731 = _752 ? (-1) : 0;
    float _754 = spvSubgroupShuffle(as_type<float>(_728), uint(_750));
    uint _756 = uint(_752 ? as_type<int>(_754) : _728);
    return int(_756);
}

static inline __attribute__((always_inline))
int _60(thread const int& _804, thread const int& _805, thread const int& _806, thread int& _807, thread uint& gl_SubgroupInvocationID)
{
    int _810 = _806 & 31;
    uint _812 = uint(int(uint(_806) >> uint(8)));
    int _814 = int(_812) & 31;
    float _816 = as_type<float>(gl_SubgroupInvocationID);
    int _818 = as_type<int>(_816) & _814;
    int _820 = ~_814;
    int _822 = _810 & _820;
    int _824 = _822 | _818;
    int _826 = ~_814;
    int _828 = _805 & _826;
    int _830 = _828 | _818;
    bool _832 = uint(_830) <= uint(_824);
    _807 = _832 ? (-1) : 0;
    float _834 = spvSubgroupShuffle(as_type<float>(_804), uint(_830));
    uint _836 = uint(_832 ? as_type<int>(_834) : _804);
    return int(_836);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _154 = false;
    float _64 = gl_FragCoord.w;
    float _66 = in.m_40.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_40.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _377 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), int2(0), component::x).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = gl_FragCoord.x;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = gl_FragCoord.y;
    float _103 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _105 = _101 / _103;
    uint _108 = spvSubgroupBallot(true).x;
    bool _112 = int(_108) != (-1);
    float _114 = trunc(_99);
    int _116 = int(_114);
    float _118 = trunc(_105);
    int _120 = int(_118);
    float _122 = precise::max(_87, _89);
    float _124 = precise::max(_91, _93);
    float _126 = precise::max(_122, _124);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_126, _126, _126, _126), uint2(int2(_116, _120)));
    float _152;
    if (!_112)
    {
        int _128 = as_type<int>(_126);
        int _130 = 1;
        int _132 = 31;
        int _134;
        int _451 = _59(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _451;
        float _138 = precise::max(_126, as_type<float>(_136));
        int _140 = as_type<int>(_138);
        int _142 = 2;
        int _144 = 31;
        int _146;
        int _459 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _459;
        float _150 = precise::max(_138, as_type<float>(_148));
        _152 = _150;
        _154 = true;
    }
    else
    {
        float _156 = as_type<float>(gl_SubgroupInvocationID);
        uint _158 = spvSubgroupBallot(true).x;
        float _160 = as_type<float>(gl_SubgroupLtMask.x);
        int _162 = as_type<int>(_156) & (-4);
        uint _164 = min(uint(_162), 32u);
        bool _166 = int(_164) == 0;
        bool _168 = _164 < 32u;
        int _170 = 32 - int(_164);
        int _172 = int(_164) - 32;
        int _174 = 15 << int(_164);
        uint _176 = uint(int(uint(0) >> uint(_170)));
        int _178 = _174 | int(_176);
        int _180 = _166 ? 15 : _178;
        bool _182 = uint(_172) < 32u;
        int _184 = 0 << _172;
        int _186 = _182 ? _184 : 0;
        int _188 = _168 ? _180 : _186;
        int _190 = int(_158) & as_type<int>(_160);
        int _192 = _188 & _190;
        int _194 = _188 & int(_158);
        int _196 = int(spvFindUMSB(uint(_192)));
        int _198 = int(spvFindUMSB(uint(_194)));
        uint _200 = min(uint(_196), as_type<uint>(_156));
        int _202 = as_type<int>(_126);
        int _204 = int(_200);
        int _206 = 31;
        int _208;
        int _548 = _60(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _548;
        int _212 = int(_200);
        int _214 = int(_200);
        int _216 = 30;
        int _218;
        int _554 = _60(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _554;
        float _222 = precise::max(_126, as_type<float>(_210));
        int _224 = as_type<int>(_222);
        int _226 = _220;
        int _228 = 31;
        int _230;
        int _562 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _562;
        float _234 = precise::max(_222, as_type<float>(_232));
        int _236 = as_type<int>(_234);
        int _238 = _198;
        int _240 = 31;
        int _242;
        int _570 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _570;
        _152 = as_type<float>(_244);
    }
    _154 = false;
    float _246 = _152;
    float _248 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _250 = as_type<float>(gl_SubgroupInvocationID);
    float _252 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _254 = _120 * 2;
    int _256 = _116 & 1;
    float _258 = _80 * _248;
    float _260 = _82 * _252;
    bool _262 = _126 >= 1.0;
    bool _264 = isnan(_126);
    bool _266 = _262 || _264;
    bool _268 = isnan(1.0);
    bool _270 = _266 || _268;
    float _272 = -_126;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _276 = trunc(_258);
    int _278 = int(_276);
    int _280 = 2 & _254;
    int _282 = (-3) & _256;
    int _284 = _280 | _282;
    float _286 = 1.0 / _274;
    float _288 = trunc(_260);
    int _290 = int(_288);
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _292);
    float _296 = _294 * 16777215.0;
    int _298 = _290 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _300 = _298 + _278;
    bool _302 = !_270;
    float _304 = _302 ? _296 : 16777215.0;
    int _306 = as_type<int>(_250) & 3;
    bool _308 = _306 != 0;
    int _310 = _300 * 4;
    int _312 = _310 + _284;
    float _314 = trunc(_304);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    int _320 = _312 << 2;
    int _322 = _320 + 9728;
    if (!_308)
    {
        int _324 = _116 >> 31;
        int _326 = _120 >> 31;
        int _328 = _324 & 1;
        int _330 = _326 & 1;
        int _332 = _116 + _328;
        int _334 = _120 + _330;
        int _336 = _332 >> 1;
        int _338 = _334 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_246, _246, _246, _246), uint2(int2(_336, _338)));
    }
    uint _340 = uint(int(uint(_322) >> uint(2)));
    uint _718 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_340)], _318, memory_order_relaxed);
    uint _342 = _718;
    out.gl_FragDepth = _93;
    out.m_53.x = _93;
    out.m_53.y = _93;
    out.m_53.z = _93;
    out.m_53.w = _93;
    return out;
}

