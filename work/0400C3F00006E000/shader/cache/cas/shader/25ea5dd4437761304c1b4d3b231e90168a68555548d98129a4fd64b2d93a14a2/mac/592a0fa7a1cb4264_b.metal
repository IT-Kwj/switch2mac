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
int _59(thread const int& _827, thread const int& _828, thread const int& _829, thread int& _830, thread uint& gl_SubgroupInvocationID)
{
    int _833 = _829 & 31;
    uint _835 = uint(int(uint(_829) >> uint(8)));
    int _837 = int(_835) & 31;
    float _839 = as_type<float>(gl_SubgroupInvocationID);
    int _841 = as_type<int>(_839) & _837;
    int _843 = ~_837;
    int _845 = _833 & _843;
    int _847 = _845 | _841;
    int _849 = as_type<int>(_839) ^ _828;
    bool _851 = uint(_849) <= uint(_847);
    _830 = _851 ? (-1) : 0;
    float _853 = spvSubgroupShuffle(as_type<float>(_827), uint(_849));
    uint _855 = uint(_851 ? as_type<int>(_853) : _827);
    return int(_855);
}

static inline __attribute__((always_inline))
int _60(thread const int& _903, thread const int& _904, thread const int& _905, thread int& _906, thread uint& gl_SubgroupInvocationID)
{
    int _909 = _905 & 31;
    uint _911 = uint(int(uint(_905) >> uint(8)));
    int _913 = int(_911) & 31;
    float _915 = as_type<float>(gl_SubgroupInvocationID);
    int _917 = as_type<int>(_915) & _913;
    int _919 = ~_913;
    int _921 = _909 & _919;
    int _923 = _921 | _917;
    int _925 = ~_913;
    int _927 = _904 & _925;
    int _929 = _927 | _917;
    bool _931 = uint(_929) <= uint(_923);
    _906 = _931 ? (-1) : 0;
    float _933 = spvSubgroupShuffle(as_type<float>(_903), uint(_929));
    uint _935 = uint(_931 ? as_type<int>(_933) : _903);
    return int(_935);
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
    float2 _419 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419)), int2(0), component::x).xyzw;
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
        int _493 = _59(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _493;
        float _138 = precise::max(_126, as_type<float>(_136));
        int _140 = as_type<int>(_138);
        int _142 = 2;
        int _144 = 31;
        int _146;
        int _501 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _501;
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
        int _590 = _60(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _590;
        int _212 = int(_200);
        int _214 = int(_200);
        int _216 = 30;
        int _218;
        int _596 = _60(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _596;
        float _222 = precise::max(_126, as_type<float>(_210));
        int _224 = as_type<int>(_222);
        int _226 = _220;
        int _228 = 31;
        int _230;
        int _604 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _604;
        float _234 = precise::max(_222, as_type<float>(_232));
        int _236 = as_type<int>(_234);
        int _238 = _198;
        int _240 = 31;
        int _242;
        int _612 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _612;
        _152 = as_type<float>(_244);
    }
    _154 = false;
    float _246 = _152;
    float _248 = precise::min(_87, _89);
    int _250 = _120 * 2;
    float _252 = precise::min(_91, _93);
    float _254 = -_126;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _258 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _260 = precise::min(_248, _252);
    float _262 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _264 = 1.0 / _256;
    float _266 = _80 * _258;
    float _268 = -_260;
    float _270 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _272 = as_type<float>(gl_SubgroupInvocationID);
    float _274 = _82 * _262;
    bool _276 = _126 >= 1.0;
    bool _278 = isnan(_126);
    bool _280 = _276 || _278;
    bool _282 = isnan(1.0);
    bool _284 = _280 || _282;
    float _286 = 1.0 / _270;
    float _288 = trunc(_266);
    int _290 = int(_288);
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].w, _292);
    float _296 = _294 * 16777215.0;
    int _298 = _116 & 1;
    float _300 = trunc(_274);
    int _302 = int(_300);
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _304);
    bool _308 = !_284;
    float _310 = _308 ? _296 : 16777215.0;
    int _312 = 2 & _250;
    int _314 = (-3) & _298;
    int _316 = _312 | _314;
    float _318 = _306 * 16777215.0;
    bool _320 = _260 >= 1.0;
    bool _322 = isnan(_260);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    float _330 = trunc(_310);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    bool _336 = !_328;
    float _338 = _336 ? _318 : 16777215.0;
    int _340 = as_type<int>(_272) & 3;
    bool _342 = _340 != 0;
    int _344 = _302 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _346 = _344 + _290;
    float _348 = trunc(_338);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    int _354 = _346 * 4;
    int _356 = _354 + _316;
    int _358 = _356 * 4;
    int _360 = _358 + 9728;
    if (!_342)
    {
        int _362 = _116 >> 31;
        int _364 = _120 >> 31;
        int _366 = _362 & 1;
        int _368 = _364 & 1;
        int _370 = _116 + _366;
        int _372 = _120 + _368;
        int _374 = _370 >> 1;
        int _376 = _372 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_246, _246, _246, _246), uint2(int2(_374, _376)));
    }
    uint _378 = uint(int(uint(_358) >> uint(2)));
    uint _809 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_378)], _352, memory_order_relaxed);
    uint _380 = _809;
    uint _382 = uint(int(uint(_360) >> uint(2)));
    uint _817 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_382)], _334, memory_order_relaxed);
    uint _384 = _817;
    out.gl_FragDepth = _93;
    out.m_53.x = _93;
    out.m_53.y = _93;
    out.m_53.z = _93;
    out.m_53.w = _93;
    return out;
}

