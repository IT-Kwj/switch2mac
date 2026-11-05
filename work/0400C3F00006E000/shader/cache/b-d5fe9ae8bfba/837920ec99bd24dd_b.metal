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
    float4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _61(thread const int& _843, thread const int& _844, thread const int& _845, thread int& _846, thread uint& gl_SubgroupInvocationID)
{
    int _849 = _845 & 31;
    uint _851 = uint(int(uint(_845) >> uint(8)));
    int _853 = int(_851) & 31;
    float _855 = as_type<float>(gl_SubgroupInvocationID);
    int _857 = as_type<int>(_855) & _853;
    int _859 = ~_853;
    int _861 = _849 & _859;
    int _863 = _861 | _857;
    int _865 = as_type<int>(_855) ^ _844;
    bool _867 = uint(_865) <= uint(_863);
    _846 = _867 ? (-1) : 0;
    float _869 = spvSubgroupShuffle(as_type<float>(_843), uint(_865));
    uint _871 = uint(_867 ? as_type<int>(_869) : _843);
    return int(_871);
}

static inline __attribute__((always_inline))
int _62(thread const int& _919, thread const int& _920, thread const int& _921, thread int& _922, thread uint& gl_SubgroupInvocationID)
{
    int _925 = _921 & 31;
    uint _927 = uint(int(uint(_921) >> uint(8)));
    int _929 = int(_927) & 31;
    float _931 = as_type<float>(gl_SubgroupInvocationID);
    int _933 = as_type<int>(_931) & _929;
    int _935 = ~_929;
    int _937 = _925 & _935;
    int _939 = _937 | _933;
    int _941 = ~_929;
    int _943 = _920 & _941;
    int _945 = _943 | _933;
    bool _947 = uint(_945) <= uint(_939);
    _922 = _947 ? (-1) : 0;
    float _949 = spvSubgroupShuffle(as_type<float>(_919), uint(_945));
    uint _951 = uint(_947 ? as_type<int>(_949) : _919);
    return int(_951);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _425 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    uint _110 = spvSubgroupBallot(true).x;
    bool _114 = int(_110) != (-1);
    float _116 = trunc(_101);
    int _118 = int(_116);
    float _120 = trunc(_107);
    int _122 = int(_120);
    float _124 = precise::max(_89, _91);
    float _126 = precise::max(_93, _95);
    float _128 = precise::max(_124, _126);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_128, _128, _128, _128), uint2(int2(_118, _122)));
    float _154;
    if (!_114)
    {
        int _130 = as_type<int>(_128);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _499 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _499;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _507 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _507;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_128);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _596 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _596;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _602 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _602;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _610 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _610;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _618 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _618;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _258 = -_128;
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _262 = precise::min(_250, _252);
    float _264 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _266 = _84 * _256;
    bool _268 = _128 >= 1.0;
    bool _270 = isnan(_128);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    float _278 = -_262;
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _282 = 1.0 / _260;
    float _284 = _82 * _264;
    int _286 = _122 * 2;
    bool _288 = _262 >= 1.0;
    bool _290 = isnan(_262);
    bool _292 = _288 || _290;
    bool _294 = isnan(1.0);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _280;
    float _300 = trunc(_284);
    int _302 = int(_300);
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].w, _304);
    int _308 = _118 & 1;
    float _310 = _306 * 16777215.0;
    int _312 = 2 & _286;
    int _314 = (-3) & _308;
    int _316 = _312 | _314;
    float _318 = trunc(_266);
    int _320 = int(_318);
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].w, _322);
    bool _326 = !_276;
    float _328 = _326 ? _310 : 16777215.0;
    float _330 = _324 * 16777215.0;
    float _332 = trunc(_328);
    float _334 = precise::max(_332, 0.0);
    uint _336 = uint(_334);
    bool _338 = !_296;
    float _340 = _338 ? _330 : 16777215.0;
    int _342 = as_type<int>(_254) & 3;
    bool _344 = _342 != 0;
    int _346 = _320 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _348 = _346 + _302;
    float _350 = trunc(_340);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _348 * 4;
    int _358 = _356 + _316;
    int _360 = _358 * 4;
    int _362 = _360 + 9728;
    if (!_344)
    {
        int _364 = _118 >> 31;
        int _366 = _122 >> 31;
        int _368 = _364 & 1;
        int _370 = _366 & 1;
        int _372 = _118 + _368;
        int _374 = _122 + _370;
        int _376 = _372 >> 1;
        int _378 = _374 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_376, _378)));
    }
    uint _380 = uint(int(uint(_360) >> uint(2)));
    uint _815 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_380)], _354, memory_order_relaxed);
    uint _382 = _815;
    uint _384 = uint(int(uint(_362) >> uint(2)));
    uint _823 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_384)], _336, memory_order_relaxed);
    uint _386 = _823;
    bool _388 = !_276;
    int _390 = _388 ? as_type<int>(_306) : 1065353216;
    out.gl_FragDepth = _306;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_390);
    return out;
}


struct main0_out_u
{
    uint4 m_53 [[color(0)]];
    uint4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _425 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    uint _110 = spvSubgroupBallot(true).x;
    bool _114 = int(_110) != (-1);
    float _116 = trunc(_101);
    int _118 = int(_116);
    float _120 = trunc(_107);
    int _122 = int(_120);
    float _124 = precise::max(_89, _91);
    float _126 = precise::max(_93, _95);
    float _128 = precise::max(_124, _126);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_128, _128, _128, _128), uint2(int2(_118, _122)));
    float _154;
    if (!_114)
    {
        int _130 = as_type<int>(_128);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _499 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _499;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _507 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _507;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_128);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _596 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _596;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _602 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _602;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _610 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _610;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _618 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _618;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _258 = -_128;
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _262 = precise::min(_250, _252);
    float _264 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _266 = _84 * _256;
    bool _268 = _128 >= 1.0;
    bool _270 = isnan(_128);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    float _278 = -_262;
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _282 = 1.0 / _260;
    float _284 = _82 * _264;
    int _286 = _122 * 2;
    bool _288 = _262 >= 1.0;
    bool _290 = isnan(_262);
    bool _292 = _288 || _290;
    bool _294 = isnan(1.0);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _280;
    float _300 = trunc(_284);
    int _302 = int(_300);
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].w, _304);
    int _308 = _118 & 1;
    float _310 = _306 * 16777215.0;
    int _312 = 2 & _286;
    int _314 = (-3) & _308;
    int _316 = _312 | _314;
    float _318 = trunc(_266);
    int _320 = int(_318);
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].w, _322);
    bool _326 = !_276;
    float _328 = _326 ? _310 : 16777215.0;
    float _330 = _324 * 16777215.0;
    float _332 = trunc(_328);
    float _334 = precise::max(_332, 0.0);
    uint _336 = uint(_334);
    bool _338 = !_296;
    float _340 = _338 ? _330 : 16777215.0;
    int _342 = as_type<int>(_254) & 3;
    bool _344 = _342 != 0;
    int _346 = _320 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _348 = _346 + _302;
    float _350 = trunc(_340);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _348 * 4;
    int _358 = _356 + _316;
    int _360 = _358 * 4;
    int _362 = _360 + 9728;
    if (!_344)
    {
        int _364 = _118 >> 31;
        int _366 = _122 >> 31;
        int _368 = _364 & 1;
        int _370 = _366 & 1;
        int _372 = _118 + _368;
        int _374 = _122 + _370;
        int _376 = _372 >> 1;
        int _378 = _374 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_376, _378)));
    }
    uint _380 = uint(int(uint(_360) >> uint(2)));
    uint _815 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_380)], _354, memory_order_relaxed);
    uint _382 = _815;
    uint _384 = uint(int(uint(_362) >> uint(2)));
    uint _823 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_384)], _336, memory_order_relaxed);
    uint _386 = _823;
    bool _388 = !_276;
    int _390 = _388 ? as_type<int>(_306) : 1065353216;
    out.gl_FragDepth = _306;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_390);
    return main0_out_u{as_type<uint4>(out.m_53), as_type<uint4>(out.m_55), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_53 [[color(0)]];
    uint4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _425 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    uint _110 = spvSubgroupBallot(true).x;
    bool _114 = int(_110) != (-1);
    float _116 = trunc(_101);
    int _118 = int(_116);
    float _120 = trunc(_107);
    int _122 = int(_120);
    float _124 = precise::max(_89, _91);
    float _126 = precise::max(_93, _95);
    float _128 = precise::max(_124, _126);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_128, _128, _128, _128), uint2(int2(_118, _122)));
    float _154;
    if (!_114)
    {
        int _130 = as_type<int>(_128);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _499 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _499;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _507 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _507;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_128);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _596 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _596;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _602 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _602;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _610 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _610;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _618 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _618;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _258 = -_128;
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _262 = precise::min(_250, _252);
    float _264 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _266 = _84 * _256;
    bool _268 = _128 >= 1.0;
    bool _270 = isnan(_128);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    float _278 = -_262;
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _282 = 1.0 / _260;
    float _284 = _82 * _264;
    int _286 = _122 * 2;
    bool _288 = _262 >= 1.0;
    bool _290 = isnan(_262);
    bool _292 = _288 || _290;
    bool _294 = isnan(1.0);
    bool _296 = _292 || _294;
    float _298 = 1.0 / _280;
    float _300 = trunc(_284);
    int _302 = int(_300);
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].w, _304);
    int _308 = _118 & 1;
    float _310 = _306 * 16777215.0;
    int _312 = 2 & _286;
    int _314 = (-3) & _308;
    int _316 = _312 | _314;
    float _318 = trunc(_266);
    int _320 = int(_318);
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].w, _322);
    bool _326 = !_276;
    float _328 = _326 ? _310 : 16777215.0;
    float _330 = _324 * 16777215.0;
    float _332 = trunc(_328);
    float _334 = precise::max(_332, 0.0);
    uint _336 = uint(_334);
    bool _338 = !_296;
    float _340 = _338 ? _330 : 16777215.0;
    int _342 = as_type<int>(_254) & 3;
    bool _344 = _342 != 0;
    int _346 = _320 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _348 = _346 + _302;
    float _350 = trunc(_340);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _348 * 4;
    int _358 = _356 + _316;
    int _360 = _358 * 4;
    int _362 = _360 + 9728;
    if (!_344)
    {
        int _364 = _118 >> 31;
        int _366 = _122 >> 31;
        int _368 = _364 & 1;
        int _370 = _366 & 1;
        int _372 = _118 + _368;
        int _374 = _122 + _370;
        int _376 = _372 >> 1;
        int _378 = _374 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_376, _378)));
    }
    uint _380 = uint(int(uint(_360) >> uint(2)));
    uint _815 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_380)], _354, memory_order_relaxed);
    uint _382 = _815;
    uint _384 = uint(int(uint(_362) >> uint(2)));
    uint _823 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_384)], _336, memory_order_relaxed);
    uint _386 = _823;
    bool _388 = !_276;
    int _390 = _388 ? as_type<int>(_306) : 1065353216;
    out.gl_FragDepth = _306;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_390);
    return main0_out_m{out.m_53, as_type<uint4>(out.m_55), out.gl_FragDepth};
}

