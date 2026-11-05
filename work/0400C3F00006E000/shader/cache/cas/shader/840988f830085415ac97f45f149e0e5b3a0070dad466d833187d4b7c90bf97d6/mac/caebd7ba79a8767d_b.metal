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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c0 [[id(2)]];
    device _23* fp_s0 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(6)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(7)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
    float4 m_57 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _63(thread const int& _730, thread const int& _731, thread const int& _732, thread int& _733, thread uint& gl_SubgroupInvocationID)
{
    int _736 = _732 & 31;
    uint _738 = uint(int(uint(_732) >> uint(8)));
    int _740 = int(_738) & 31;
    float _742 = as_type<float>(gl_SubgroupInvocationID);
    int _744 = as_type<int>(_742) & _740;
    int _746 = ~_740;
    int _748 = _736 & _746;
    int _750 = _748 | _744;
    int _752 = as_type<int>(_742) ^ _731;
    bool _754 = uint(_752) <= uint(_750);
    _733 = _754 ? (-1) : 0;
    float _756 = spvSubgroupShuffle(as_type<float>(_730), uint(_752));
    uint _758 = uint(_754 ? as_type<int>(_756) : _730);
    return int(_758);
}

static inline __attribute__((always_inline))
int _64(thread const int& _806, thread const int& _807, thread const int& _808, thread int& _809, thread uint& gl_SubgroupInvocationID)
{
    int _812 = _808 & 31;
    uint _814 = uint(int(uint(_808) >> uint(8)));
    int _816 = int(_814) & 31;
    float _818 = as_type<float>(gl_SubgroupInvocationID);
    int _820 = as_type<int>(_818) & _816;
    int _822 = ~_816;
    int _824 = _812 & _822;
    int _826 = _824 | _820;
    int _828 = ~_816;
    int _830 = _807 & _828;
    int _832 = _830 | _820;
    bool _834 = uint(_832) <= uint(_826);
    _809 = _834 ? (-1) : 0;
    float _836 = spvSubgroupShuffle(as_type<float>(_806), uint(_832));
    uint _838 = uint(_834 ? as_type<int>(_836) : _806);
    return int(_838);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _158 = false;
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _377 = float2(_84, _86);
    float4 _89 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), int2(0), component::x).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = gl_FragCoord.x;
    float _101 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _103 = _99 / _101;
    float _105 = gl_FragCoord.y;
    float _107 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _109 = _105 / _107;
    uint _112 = spvSubgroupBallot(true).x;
    bool _116 = int(_112) != (-1);
    float _118 = trunc(_103);
    int _120 = int(_118);
    float _122 = trunc(_109);
    int _124 = int(_122);
    float _126 = precise::max(_91, _93);
    float _128 = precise::max(_95, _97);
    float _130 = precise::max(_126, _128);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_130, _130, _130, _130), uint2(int2(_120, _124)));
    float _156;
    if (!_116)
    {
        int _132 = as_type<int>(_130);
        int _134 = 1;
        int _136 = 31;
        int _138;
        int _451 = _63(_132, _134, _136, _138, gl_SubgroupInvocationID);
        int _140 = _451;
        float _142 = precise::max(_130, as_type<float>(_140));
        int _144 = as_type<int>(_142);
        int _146 = 2;
        int _148 = 31;
        int _150;
        int _459 = _63(_144, _146, _148, _150, gl_SubgroupInvocationID);
        int _152 = _459;
        float _154 = precise::max(_142, as_type<float>(_152));
        _156 = _154;
        _158 = true;
    }
    else
    {
        float _160 = as_type<float>(gl_SubgroupInvocationID);
        uint _162 = spvSubgroupBallot(true).x;
        float _164 = as_type<float>(gl_SubgroupLtMask.x);
        int _166 = as_type<int>(_160) & (-4);
        uint _168 = min(uint(_166), 32u);
        bool _170 = int(_168) == 0;
        bool _172 = _168 < 32u;
        int _174 = 32 - int(_168);
        int _176 = int(_168) - 32;
        int _178 = 15 << int(_168);
        uint _180 = uint(int(uint(0) >> uint(_174)));
        int _182 = _178 | int(_180);
        int _184 = _170 ? 15 : _182;
        bool _186 = uint(_176) < 32u;
        int _188 = 0 << _176;
        int _190 = _186 ? _188 : 0;
        int _192 = _172 ? _184 : _190;
        int _194 = int(_162) & as_type<int>(_164);
        int _196 = _192 & _194;
        int _198 = _192 & int(_162);
        int _200 = int(spvFindUMSB(uint(_196)));
        int _202 = int(spvFindUMSB(uint(_198)));
        uint _204 = min(uint(_200), as_type<uint>(_160));
        int _206 = as_type<int>(_130);
        int _208 = int(_204);
        int _210 = 31;
        int _212;
        int _548 = _64(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _548;
        int _216 = int(_204);
        int _218 = int(_204);
        int _220 = 30;
        int _222;
        int _554 = _64(_216, _218, _220, _222, gl_SubgroupInvocationID);
        int _224 = _554;
        float _226 = precise::max(_130, as_type<float>(_214));
        int _228 = as_type<int>(_226);
        int _230 = _224;
        int _232 = 31;
        int _234;
        int _562 = _64(_228, _230, _232, _234, gl_SubgroupInvocationID);
        int _236 = _562;
        float _238 = precise::max(_226, as_type<float>(_236));
        int _240 = as_type<int>(_238);
        int _242 = _202;
        int _244 = 31;
        int _246;
        int _570 = _64(_240, _242, _244, _246, gl_SubgroupInvocationID);
        int _248 = _570;
        _156 = as_type<float>(_248);
    }
    _158 = false;
    float _250 = _156;
    float _252 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _254 = _124 * 2;
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _258 = _130 * 16777215.0;
    float _260 = precise::min(_91, _93);
    float _262 = _84 * _252;
    int _264 = _120 & 1;
    float _266 = _86 * _256;
    float _268 = as_type<float>(gl_SubgroupInvocationID);
    int _270 = 2 & _254;
    int _272 = (-3) & _264;
    int _274 = _270 | _272;
    float _276 = trunc(_262);
    int _278 = int(_276);
    float _280 = trunc(_266);
    int _282 = int(_280);
    float _284 = trunc(_258);
    float _286 = precise::max(_284, 0.0);
    uint _288 = uint(_286);
    int _290 = as_type<int>(_268) & 3;
    bool _292 = _290 != 0;
    int _294 = _282 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _296 = _294 + _278;
    float _298 = precise::min(_95, _97);
    int _300 = _296 * 4;
    int _302 = _300 + _274;
    float _304 = precise::min(_260, _298);
    int _306 = _302 * 4;
    float _308 = _304 * 16777215.0;
    int _310 = _306 + 9728;
    int _312 = _306 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    float _314 = trunc(_308);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    if (!_292)
    {
        int _320 = _120 >> 31;
        int _322 = _124 >> 31;
        int _324 = _320 & 1;
        int _326 = _322 & 1;
        int _328 = _120 + _324;
        int _330 = _124 + _326;
        int _332 = _328 >> 1;
        int _334 = _330 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_250, _250, _250, _250), uint2(int2(_332, _334)));
    }
    uint _336 = uint(int(uint(_306) >> uint(2)));
    uint _709 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_336)], _318, memory_order_relaxed);
    uint _338 = _709;
    uint _340 = uint(int(uint(_310) >> uint(2)));
    uint _717 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_340)], _288, memory_order_relaxed);
    uint _342 = _717;
    out.gl_FragDepth = as_type<float>(_312);
    out.m_55.x = _97;
    out.m_55.y = _97;
    out.m_55.z = _97;
    out.m_55.w = _97;
    out.m_57.x = _130;
    return out;
}

