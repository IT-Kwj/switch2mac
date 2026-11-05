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
int _59(thread const int& _885, thread const int& _886, thread const int& _887, thread int& _888, thread uint& gl_SubgroupInvocationID)
{
    int _891 = _887 & 31;
    uint _893 = uint(int(uint(_887) >> uint(8)));
    int _895 = int(_893) & 31;
    float _897 = as_type<float>(gl_SubgroupInvocationID);
    int _899 = as_type<int>(_897) & _895;
    int _901 = ~_895;
    int _903 = _891 & _901;
    int _905 = _903 | _899;
    int _907 = as_type<int>(_897) ^ _886;
    bool _909 = uint(_907) <= uint(_905);
    _888 = _909 ? (-1) : 0;
    float _911 = spvSubgroupShuffle(as_type<float>(_885), uint(_907));
    uint _913 = uint(_909 ? as_type<int>(_911) : _885);
    return int(_913);
}

static inline __attribute__((always_inline))
int _60(thread const int& _961, thread const int& _962, thread const int& _963, thread int& _964, thread uint& gl_SubgroupInvocationID)
{
    int _967 = _963 & 31;
    uint _969 = uint(int(uint(_963) >> uint(8)));
    int _971 = int(_969) & 31;
    float _973 = as_type<float>(gl_SubgroupInvocationID);
    int _975 = as_type<int>(_973) & _971;
    int _977 = ~_971;
    int _979 = _967 & _977;
    int _981 = _979 | _975;
    int _983 = ~_971;
    int _985 = _962 & _983;
    int _987 = _985 | _975;
    bool _989 = uint(_987) <= uint(_981);
    _964 = _989 ? (-1) : 0;
    float _991 = spvSubgroupShuffle(as_type<float>(_961), uint(_987));
    uint _993 = uint(_989 ? as_type<int>(_991) : _961);
    return int(_993);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _176 = false;
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
    float2 _441 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), int2(0), component::x).xyzw;
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
    float _107 = trunc(_99);
    int _109 = int(_107);
    float _111 = trunc(_105);
    int _113 = int(_111);
    float _115 = precise::max(_87, _89);
    float _117 = -_93;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _121 = precise::max(_91, _93);
    bool _125 = _93 != 1.0;
    bool _127 = isnan(_93);
    bool _129 = _125 || _127;
    bool _131 = isnan(1.0);
    bool _133 = _129 || _131;
    float _135 = 1.0 / _119;
    float _137 = precise::max(_115, _121);
    uint _140 = spvSubgroupBallot(true).x;
    bool _142 = int(_140) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_137, _137, _137, _137), uint2(int2(_109, _113)));
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _146 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].w, _144);
    int _148 = _133 ? as_type<int>(_146) : 1065353216;
    float _174;
    if (!_142)
    {
        int _150 = as_type<int>(_137);
        int _152 = 1;
        int _154 = 31;
        int _156;
        int _547 = _59(_150, _152, _154, _156, gl_SubgroupInvocationID);
        int _158 = _547;
        float _160 = precise::max(_137, as_type<float>(_158));
        int _162 = as_type<int>(_160);
        int _164 = 2;
        int _166 = 31;
        int _168;
        int _555 = _59(_162, _164, _166, _168, gl_SubgroupInvocationID);
        int _170 = _555;
        float _172 = precise::max(_160, as_type<float>(_170));
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = as_type<float>(gl_SubgroupInvocationID);
        uint _180 = spvSubgroupBallot(true).x;
        float _182 = as_type<float>(gl_SubgroupLtMask.x);
        int _184 = as_type<int>(_178) & (-4);
        uint _186 = min(uint(_184), 32u);
        bool _188 = int(_186) == 0;
        bool _190 = _186 < 32u;
        int _192 = 32 - int(_186);
        int _194 = int(_186) - 32;
        int _196 = 15 << int(_186);
        uint _198 = uint(int(uint(0) >> uint(_192)));
        int _200 = _196 | int(_198);
        int _202 = _188 ? 15 : _200;
        bool _204 = uint(_194) < 32u;
        int _206 = 0 << _194;
        int _208 = _204 ? _206 : 0;
        int _210 = _190 ? _202 : _208;
        int _212 = int(_180) & as_type<int>(_182);
        int _214 = _210 & _212;
        int _216 = _210 & int(_180);
        int _218 = int(spvFindUMSB(uint(_214)));
        int _220 = int(spvFindUMSB(uint(_216)));
        uint _222 = min(uint(_218), as_type<uint>(_178));
        int _224 = as_type<int>(_137);
        int _226 = int(_222);
        int _228 = 31;
        int _230;
        int _644 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _644;
        int _234 = int(_222);
        int _236 = int(_222);
        int _238 = 30;
        int _240;
        int _650 = _60(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _650;
        float _244 = precise::max(_137, as_type<float>(_232));
        int _246 = as_type<int>(_244);
        int _248 = _242;
        int _250 = 31;
        int _252;
        int _658 = _60(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _658;
        float _256 = precise::max(_244, as_type<float>(_254));
        int _258 = as_type<int>(_256);
        int _260 = _220;
        int _262 = 31;
        int _264;
        int _666 = _60(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _666;
        _174 = as_type<float>(_266);
    }
    _176 = false;
    float _268 = _174;
    float _270 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _272 = -_137;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _276 = precise::min(_87, _89);
    float _278 = as_type<float>(gl_SubgroupInvocationID);
    float _280 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _282 = _80 * _270;
    float _284 = precise::min(_91, _93);
    float _286 = 1.0 / _274;
    bool _288 = _137 >= 1.0;
    bool _290 = isnan(_137);
    bool _292 = _288 || _290;
    bool _294 = isnan(1.0);
    bool _296 = _292 || _294;
    float _298 = _82 * _280;
    float _300 = precise::min(_276, _284);
    int _302 = _113 * 2;
    float _304 = -_300;
    float _306 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _308 = trunc(_282);
    int _310 = int(_308);
    float _312 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _312);
    float _316 = 1.0 / _306;
    float _318 = _314 * 16777215.0;
    int _320 = _109 & 1;
    float _322 = trunc(_298);
    int _324 = int(_322);
    bool _326 = !_296;
    float _328 = _326 ? _318 : 16777215.0;
    int _330 = 2 & _302;
    int _332 = (-3) & _320;
    int _334 = _330 | _332;
    bool _336 = _300 >= 1.0;
    bool _338 = isnan(_300);
    bool _340 = _336 || _338;
    bool _342 = isnan(1.0);
    bool _344 = _340 || _342;
    float _346 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _348 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[1].w, _346);
    float _350 = trunc(_328);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    float _356 = _348 * 16777215.0;
    int _358 = _324 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _360 = _358 + _310;
    bool _362 = !_344;
    float _364 = _362 ? _356 : 16777215.0;
    int _366 = as_type<int>(_278) & 3;
    bool _368 = _366 != 0;
    int _370 = _360 * 4;
    int _372 = _370 + _334;
    float _374 = trunc(_364);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = _372 * 4;
    int _382 = _380 + 9728;
    if (!_368)
    {
        int _384 = _109 >> 31;
        int _386 = _113 >> 31;
        int _388 = _384 & 1;
        int _390 = _386 & 1;
        int _392 = _109 + _388;
        int _394 = _113 + _390;
        int _396 = _392 >> 1;
        int _398 = _394 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_268, _268, _268, _268), uint2(int2(_396, _398)));
    }
    uint _400 = uint(int(uint(_380) >> uint(2)));
    uint _863 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_400)], _378, memory_order_relaxed);
    uint _402 = _863;
    uint _404 = uint(int(uint(_382) >> uint(2)));
    uint _871 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_404)], _354, memory_order_relaxed);
    uint _406 = _871;
    out.gl_FragDepth = _93;
    out.m_53.x = as_type<float>(_148);
    out.m_53.y = as_type<float>(_148);
    out.m_53.z = as_type<float>(_148);
    out.m_53.w = as_type<float>(_148);
    return out;
}


struct main0_out_u
{
    uint4 m_53 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _176 = false;
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
    float2 _441 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), int2(0), component::x).xyzw;
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
    float _107 = trunc(_99);
    int _109 = int(_107);
    float _111 = trunc(_105);
    int _113 = int(_111);
    float _115 = precise::max(_87, _89);
    float _117 = -_93;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _121 = precise::max(_91, _93);
    bool _125 = _93 != 1.0;
    bool _127 = isnan(_93);
    bool _129 = _125 || _127;
    bool _131 = isnan(1.0);
    bool _133 = _129 || _131;
    float _135 = 1.0 / _119;
    float _137 = precise::max(_115, _121);
    uint _140 = spvSubgroupBallot(true).x;
    bool _142 = int(_140) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_137, _137, _137, _137), uint2(int2(_109, _113)));
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _146 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].w, _144);
    int _148 = _133 ? as_type<int>(_146) : 1065353216;
    float _174;
    if (!_142)
    {
        int _150 = as_type<int>(_137);
        int _152 = 1;
        int _154 = 31;
        int _156;
        int _547 = _59(_150, _152, _154, _156, gl_SubgroupInvocationID);
        int _158 = _547;
        float _160 = precise::max(_137, as_type<float>(_158));
        int _162 = as_type<int>(_160);
        int _164 = 2;
        int _166 = 31;
        int _168;
        int _555 = _59(_162, _164, _166, _168, gl_SubgroupInvocationID);
        int _170 = _555;
        float _172 = precise::max(_160, as_type<float>(_170));
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = as_type<float>(gl_SubgroupInvocationID);
        uint _180 = spvSubgroupBallot(true).x;
        float _182 = as_type<float>(gl_SubgroupLtMask.x);
        int _184 = as_type<int>(_178) & (-4);
        uint _186 = min(uint(_184), 32u);
        bool _188 = int(_186) == 0;
        bool _190 = _186 < 32u;
        int _192 = 32 - int(_186);
        int _194 = int(_186) - 32;
        int _196 = 15 << int(_186);
        uint _198 = uint(int(uint(0) >> uint(_192)));
        int _200 = _196 | int(_198);
        int _202 = _188 ? 15 : _200;
        bool _204 = uint(_194) < 32u;
        int _206 = 0 << _194;
        int _208 = _204 ? _206 : 0;
        int _210 = _190 ? _202 : _208;
        int _212 = int(_180) & as_type<int>(_182);
        int _214 = _210 & _212;
        int _216 = _210 & int(_180);
        int _218 = int(spvFindUMSB(uint(_214)));
        int _220 = int(spvFindUMSB(uint(_216)));
        uint _222 = min(uint(_218), as_type<uint>(_178));
        int _224 = as_type<int>(_137);
        int _226 = int(_222);
        int _228 = 31;
        int _230;
        int _644 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _644;
        int _234 = int(_222);
        int _236 = int(_222);
        int _238 = 30;
        int _240;
        int _650 = _60(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _650;
        float _244 = precise::max(_137, as_type<float>(_232));
        int _246 = as_type<int>(_244);
        int _248 = _242;
        int _250 = 31;
        int _252;
        int _658 = _60(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _658;
        float _256 = precise::max(_244, as_type<float>(_254));
        int _258 = as_type<int>(_256);
        int _260 = _220;
        int _262 = 31;
        int _264;
        int _666 = _60(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _666;
        _174 = as_type<float>(_266);
    }
    _176 = false;
    float _268 = _174;
    float _270 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _272 = -_137;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _276 = precise::min(_87, _89);
    float _278 = as_type<float>(gl_SubgroupInvocationID);
    float _280 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _282 = _80 * _270;
    float _284 = precise::min(_91, _93);
    float _286 = 1.0 / _274;
    bool _288 = _137 >= 1.0;
    bool _290 = isnan(_137);
    bool _292 = _288 || _290;
    bool _294 = isnan(1.0);
    bool _296 = _292 || _294;
    float _298 = _82 * _280;
    float _300 = precise::min(_276, _284);
    int _302 = _113 * 2;
    float _304 = -_300;
    float _306 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _308 = trunc(_282);
    int _310 = int(_308);
    float _312 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _312);
    float _316 = 1.0 / _306;
    float _318 = _314 * 16777215.0;
    int _320 = _109 & 1;
    float _322 = trunc(_298);
    int _324 = int(_322);
    bool _326 = !_296;
    float _328 = _326 ? _318 : 16777215.0;
    int _330 = 2 & _302;
    int _332 = (-3) & _320;
    int _334 = _330 | _332;
    bool _336 = _300 >= 1.0;
    bool _338 = isnan(_300);
    bool _340 = _336 || _338;
    bool _342 = isnan(1.0);
    bool _344 = _340 || _342;
    float _346 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _348 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[1].w, _346);
    float _350 = trunc(_328);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    float _356 = _348 * 16777215.0;
    int _358 = _324 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _360 = _358 + _310;
    bool _362 = !_344;
    float _364 = _362 ? _356 : 16777215.0;
    int _366 = as_type<int>(_278) & 3;
    bool _368 = _366 != 0;
    int _370 = _360 * 4;
    int _372 = _370 + _334;
    float _374 = trunc(_364);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = _372 * 4;
    int _382 = _380 + 9728;
    if (!_368)
    {
        int _384 = _109 >> 31;
        int _386 = _113 >> 31;
        int _388 = _384 & 1;
        int _390 = _386 & 1;
        int _392 = _109 + _388;
        int _394 = _113 + _390;
        int _396 = _392 >> 1;
        int _398 = _394 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_268, _268, _268, _268), uint2(int2(_396, _398)));
    }
    uint _400 = uint(int(uint(_380) >> uint(2)));
    uint _863 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_400)], _378, memory_order_relaxed);
    uint _402 = _863;
    uint _404 = uint(int(uint(_382) >> uint(2)));
    uint _871 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_404)], _354, memory_order_relaxed);
    uint _406 = _871;
    out.gl_FragDepth = _93;
    out.m_53.x = as_type<float>(_148);
    out.m_53.y = as_type<float>(_148);
    out.m_53.z = as_type<float>(_148);
    out.m_53.w = as_type<float>(_148);
    return main0_out_u{as_type<uint4>(out.m_53), out.gl_FragDepth};
}

