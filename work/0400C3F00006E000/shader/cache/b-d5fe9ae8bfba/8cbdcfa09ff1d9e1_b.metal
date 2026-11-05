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
    float4 m_53 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _834, thread const int& _835, thread const int& _836, thread int& _837, thread uint& gl_SubgroupInvocationID)
{
    int _840 = _836 & 31;
    uint _842 = uint(int(uint(_836) >> uint(8)));
    int _844 = int(_842) & 31;
    float _846 = as_type<float>(gl_SubgroupInvocationID);
    int _848 = as_type<int>(_846) & _844;
    int _850 = ~_844;
    int _852 = _840 & _850;
    int _854 = _852 | _848;
    int _856 = as_type<int>(_846) ^ _835;
    bool _858 = uint(_856) <= uint(_854);
    _837 = _858 ? (-1) : 0;
    float _860 = spvSubgroupShuffle(as_type<float>(_834), uint(_856));
    uint _862 = uint(_858 ? as_type<int>(_860) : _834);
    return int(_862);
}

static inline __attribute__((always_inline))
int _60(thread const int& _910, thread const int& _911, thread const int& _912, thread int& _913, thread uint& gl_SubgroupInvocationID)
{
    int _916 = _912 & 31;
    uint _918 = uint(int(uint(_912) >> uint(8)));
    int _920 = int(_918) & 31;
    float _922 = as_type<float>(gl_SubgroupInvocationID);
    int _924 = as_type<int>(_922) & _920;
    int _926 = ~_920;
    int _928 = _916 & _926;
    int _930 = _928 | _924;
    int _932 = ~_920;
    int _934 = _911 & _932;
    int _936 = _934 | _924;
    bool _938 = uint(_936) <= uint(_930);
    _913 = _938 ? (-1) : 0;
    float _940 = spvSubgroupShuffle(as_type<float>(_910), uint(_936));
    uint _942 = uint(_938 ? as_type<int>(_940) : _910);
    return int(_942);
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
    float2 _423 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423)), int2(0), component::x).xyzw;
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
        int _497 = _59(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _497;
        float _138 = precise::max(_126, as_type<float>(_136));
        int _140 = as_type<int>(_138);
        int _142 = 2;
        int _144 = 31;
        int _146;
        int _505 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _505;
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
        int _594 = _60(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _594;
        int _212 = int(_200);
        int _214 = int(_200);
        int _216 = 30;
        int _218;
        int _600 = _60(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _600;
        float _222 = precise::max(_126, as_type<float>(_210));
        int _224 = as_type<int>(_222);
        int _226 = _220;
        int _228 = 31;
        int _230;
        int _608 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _608;
        float _234 = precise::max(_222, as_type<float>(_232));
        int _236 = as_type<int>(_234);
        int _238 = _198;
        int _240 = 31;
        int _242;
        int _616 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _616;
        _152 = as_type<float>(_244);
    }
    _154 = false;
    float _246 = _152;
    float _248 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _250 = precise::min(_87, _89);
    float _252 = as_type<float>(gl_SubgroupInvocationID);
    float _254 = precise::min(_91, _93);
    float _256 = _80 * _248;
    float _258 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _260 = -_126;
    float _262 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _264 = precise::min(_250, _254);
    int _266 = _116 & 1;
    float _268 = _82 * _258;
    float _270 = trunc(_256);
    int _272 = int(_270);
    float _274 = -_264;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _278 = _120 * 2;
    bool _280 = _264 >= 1.0;
    bool _282 = isnan(_264);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = _126 >= 1.0;
    bool _292 = isnan(_126);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    int _300 = 2 & _278;
    int _302 = (-3) & _266;
    int _304 = _300 | _302;
    float _306 = trunc(_268);
    int _308 = int(_306);
    float _310 = 1.0 / _276;
    float _312 = 1.0 / _262;
    int _314 = _308 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _316 = _314 + _272;
    int _318 = _316 * 4;
    int _320 = _318 + _304;
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[1].w, _322);
    int _326 = _320 * 4;
    float _328 = _324 * 16777215.0;
    int _330 = _326 + 9728;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _334 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[1].w, _332);
    bool _336 = !_288;
    float _338 = _336 ? _328 : 16777215.0;
    int _340 = as_type<int>(_252) & 3;
    bool _342 = _340 != 0;
    float _344 = _334 * 16777215.0;
    float _346 = trunc(_338);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    bool _352 = !_298;
    float _354 = _352 ? _344 : 16777215.0;
    float _356 = trunc(_354);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
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
    uint _378 = uint(int(uint(_326) >> uint(2)));
    uint _813 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_378)], _350, memory_order_relaxed);
    uint _380 = _813;
    bool _382 = !_298;
    int _384 = _382 ? as_type<int>(_334) : 1065353216;
    uint _386 = uint(int(uint(_330) >> uint(2)));
    uint _828 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_386)], _360, memory_order_relaxed);
    uint _388 = _828;
    out.gl_FragDepth = as_type<float>(_360);
    out.m_53.x = as_type<float>(_384);
    return out;
}


struct main0_out_u
{
    uint4 m_53 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
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
    float2 _423 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423)), int2(0), component::x).xyzw;
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
        int _497 = _59(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _497;
        float _138 = precise::max(_126, as_type<float>(_136));
        int _140 = as_type<int>(_138);
        int _142 = 2;
        int _144 = 31;
        int _146;
        int _505 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _505;
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
        int _594 = _60(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _594;
        int _212 = int(_200);
        int _214 = int(_200);
        int _216 = 30;
        int _218;
        int _600 = _60(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _600;
        float _222 = precise::max(_126, as_type<float>(_210));
        int _224 = as_type<int>(_222);
        int _226 = _220;
        int _228 = 31;
        int _230;
        int _608 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _608;
        float _234 = precise::max(_222, as_type<float>(_232));
        int _236 = as_type<int>(_234);
        int _238 = _198;
        int _240 = 31;
        int _242;
        int _616 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _616;
        _152 = as_type<float>(_244);
    }
    _154 = false;
    float _246 = _152;
    float _248 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _250 = precise::min(_87, _89);
    float _252 = as_type<float>(gl_SubgroupInvocationID);
    float _254 = precise::min(_91, _93);
    float _256 = _80 * _248;
    float _258 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _260 = -_126;
    float _262 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _264 = precise::min(_250, _254);
    int _266 = _116 & 1;
    float _268 = _82 * _258;
    float _270 = trunc(_256);
    int _272 = int(_270);
    float _274 = -_264;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _278 = _120 * 2;
    bool _280 = _264 >= 1.0;
    bool _282 = isnan(_264);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = _126 >= 1.0;
    bool _292 = isnan(_126);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    int _300 = 2 & _278;
    int _302 = (-3) & _266;
    int _304 = _300 | _302;
    float _306 = trunc(_268);
    int _308 = int(_306);
    float _310 = 1.0 / _276;
    float _312 = 1.0 / _262;
    int _314 = _308 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _316 = _314 + _272;
    int _318 = _316 * 4;
    int _320 = _318 + _304;
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[1].w, _322);
    int _326 = _320 * 4;
    float _328 = _324 * 16777215.0;
    int _330 = _326 + 9728;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _334 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[1].w, _332);
    bool _336 = !_288;
    float _338 = _336 ? _328 : 16777215.0;
    int _340 = as_type<int>(_252) & 3;
    bool _342 = _340 != 0;
    float _344 = _334 * 16777215.0;
    float _346 = trunc(_338);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    bool _352 = !_298;
    float _354 = _352 ? _344 : 16777215.0;
    float _356 = trunc(_354);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
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
    uint _378 = uint(int(uint(_326) >> uint(2)));
    uint _813 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_378)], _350, memory_order_relaxed);
    uint _380 = _813;
    bool _382 = !_298;
    int _384 = _382 ? as_type<int>(_334) : 1065353216;
    uint _386 = uint(int(uint(_330) >> uint(2)));
    uint _828 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_386)], _360, memory_order_relaxed);
    uint _388 = _828;
    out.gl_FragDepth = as_type<float>(_360);
    out.m_53.x = as_type<float>(_384);
    return main0_out_u{as_type<uint4>(out.m_53), out.gl_FragDepth};
}

