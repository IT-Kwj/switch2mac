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
int _61(thread const int& _900, thread const int& _901, thread const int& _902, thread int& _903, thread uint& gl_SubgroupInvocationID)
{
    int _906 = _902 & 31;
    uint _908 = uint(int(uint(_902) >> uint(8)));
    int _910 = int(_908) & 31;
    float _912 = as_type<float>(gl_SubgroupInvocationID);
    int _914 = as_type<int>(_912) & _910;
    int _916 = ~_910;
    int _918 = _906 & _916;
    int _920 = _918 | _914;
    int _922 = as_type<int>(_912) ^ _901;
    bool _924 = uint(_922) <= uint(_920);
    _903 = _924 ? (-1) : 0;
    float _926 = spvSubgroupShuffle(as_type<float>(_900), uint(_922));
    uint _928 = uint(_924 ? as_type<int>(_926) : _900);
    return int(_928);
}

static inline __attribute__((always_inline))
int _62(thread const int& _976, thread const int& _977, thread const int& _978, thread int& _979, thread uint& gl_SubgroupInvocationID)
{
    int _982 = _978 & 31;
    uint _984 = uint(int(uint(_978) >> uint(8)));
    int _986 = int(_984) & 31;
    float _988 = as_type<float>(gl_SubgroupInvocationID);
    int _990 = as_type<int>(_988) & _986;
    int _992 = ~_986;
    int _994 = _982 & _992;
    int _996 = _994 | _990;
    int _998 = ~_986;
    int _1000 = _977 & _998;
    int _1002 = _1000 | _990;
    bool _1004 = uint(_1002) <= uint(_996);
    _979 = _1004 ? (-1) : 0;
    float _1006 = spvSubgroupShuffle(as_type<float>(_976), uint(_1002));
    uint _1008 = uint(_1004 ? as_type<int>(_1006) : _976);
    return int(_1008);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _178 = false;
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
    float2 _447 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447)), int2(0), component::x).xyzw;
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
    float _109 = trunc(_101);
    int _111 = int(_109);
    float _113 = trunc(_107);
    int _115 = int(_113);
    float _117 = precise::max(_89, _91);
    float _119 = -_95;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _123 = precise::max(_93, _95);
    bool _127 = _95 != 1.0;
    bool _129 = isnan(_95);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = 1.0 / _121;
    float _139 = precise::max(_117, _123);
    uint _142 = spvSubgroupBallot(true).x;
    bool _144 = int(_142) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_139, _139, _139, _139), uint2(int2(_111, _115)));
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _148 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].w, _146);
    int _150 = _135 ? as_type<int>(_148) : 1065353216;
    float _176;
    if (!_144)
    {
        int _152 = as_type<int>(_139);
        int _154 = 1;
        int _156 = 31;
        int _158;
        int _553 = _61(_152, _154, _156, _158, gl_SubgroupInvocationID);
        int _160 = _553;
        float _162 = precise::max(_139, as_type<float>(_160));
        int _164 = as_type<int>(_162);
        int _166 = 2;
        int _168 = 31;
        int _170;
        int _561 = _61(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _561;
        float _174 = precise::max(_162, as_type<float>(_172));
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = as_type<float>(gl_SubgroupInvocationID);
        uint _182 = spvSubgroupBallot(true).x;
        float _184 = as_type<float>(gl_SubgroupLtMask.x);
        int _186 = as_type<int>(_180) & (-4);
        uint _188 = min(uint(_186), 32u);
        bool _190 = int(_188) == 0;
        bool _192 = _188 < 32u;
        int _194 = 32 - int(_188);
        int _196 = int(_188) - 32;
        int _198 = 15 << int(_188);
        uint _200 = uint(int(uint(0) >> uint(_194)));
        int _202 = _198 | int(_200);
        int _204 = _190 ? 15 : _202;
        bool _206 = uint(_196) < 32u;
        int _208 = 0 << _196;
        int _210 = _206 ? _208 : 0;
        int _212 = _192 ? _204 : _210;
        int _214 = int(_182) & as_type<int>(_184);
        int _216 = _212 & _214;
        int _218 = _212 & int(_182);
        int _220 = int(spvFindUMSB(uint(_216)));
        int _222 = int(spvFindUMSB(uint(_218)));
        uint _224 = min(uint(_220), as_type<uint>(_180));
        int _226 = as_type<int>(_139);
        int _228 = int(_224);
        int _230 = 31;
        int _232;
        int _650 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _650;
        int _236 = int(_224);
        int _238 = int(_224);
        int _240 = 30;
        int _242;
        int _656 = _62(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _656;
        float _246 = precise::max(_139, as_type<float>(_234));
        int _248 = as_type<int>(_246);
        int _250 = _244;
        int _252 = 31;
        int _254;
        int _664 = _62(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _664;
        float _258 = precise::max(_246, as_type<float>(_256));
        int _260 = as_type<int>(_258);
        int _262 = _222;
        int _264 = 31;
        int _266;
        int _672 = _62(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _672;
        _176 = as_type<float>(_268);
    }
    _178 = false;
    float _270 = _176;
    float _272 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _274 = -_139;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _278 = precise::min(_89, _91);
    float _280 = as_type<float>(gl_SubgroupInvocationID);
    float _282 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _284 = _82 * _272;
    float _286 = precise::min(_93, _95);
    float _288 = 1.0 / _276;
    bool _290 = _139 >= 1.0;
    bool _292 = isnan(_139);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    float _300 = _84 * _282;
    float _302 = precise::min(_278, _286);
    int _304 = _115 * 2;
    int _306 = _111 & 1;
    bool _308 = _302 >= 1.0;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.0);
    bool _316 = _312 || _314;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _322 = trunc(_284);
    int _324 = int(_322);
    int _326 = 2 & _304;
    int _328 = (-3) & _306;
    int _330 = _326 | _328;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _334 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].w, _332);
    float _336 = 1.0 / _320;
    float _338 = _334 * 16777215.0;
    float _340 = trunc(_300);
    int _342 = int(_340);
    bool _344 = !_298;
    float _346 = _344 ? _338 : 16777215.0;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _350 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[1].w, _348);
    float _352 = trunc(_346);
    float _354 = precise::max(_352, 0.0);
    uint _356 = uint(_354);
    float _358 = _350 * 16777215.0;
    int _360 = _342 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _362 = _360 + _324;
    bool _364 = !_316;
    float _366 = _364 ? _358 : 16777215.0;
    int _368 = as_type<int>(_280) & 3;
    bool _370 = _368 != 0;
    int _372 = _362 * 4;
    int _374 = _372 + _330;
    int _376 = _374 * 4;
    float _378 = trunc(_366);
    float _380 = precise::max(_378, 0.0);
    uint _382 = uint(_380);
    int _384 = _376 + 9728;
    if (!_370)
    {
        int _386 = _111 >> 31;
        int _388 = _115 >> 31;
        int _390 = _386 & 1;
        int _392 = _388 & 1;
        int _394 = _111 + _390;
        int _396 = _115 + _392;
        int _398 = _394 >> 1;
        int _400 = _396 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_270, _270, _270, _270), uint2(int2(_398, _400)));
    }
    uint _402 = uint(int(uint(_376) >> uint(2)));
    uint _869 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_402)], _382, memory_order_relaxed);
    uint _404 = _869;
    bool _406 = !_298;
    int _408 = _406 ? as_type<int>(_334) : 1065353216;
    uint _410 = uint(int(uint(_384) >> uint(2)));
    uint _883 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_410)], _356, memory_order_relaxed);
    uint _412 = _883;
    out.gl_FragDepth = _334;
    out.m_53.x = as_type<float>(_150);
    out.m_53.y = as_type<float>(_150);
    out.m_53.z = as_type<float>(_150);
    out.m_53.w = as_type<float>(_150);
    out.m_55.x = as_type<float>(_408);
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
    bool _178 = false;
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
    float2 _447 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447)), int2(0), component::x).xyzw;
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
    float _109 = trunc(_101);
    int _111 = int(_109);
    float _113 = trunc(_107);
    int _115 = int(_113);
    float _117 = precise::max(_89, _91);
    float _119 = -_95;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _123 = precise::max(_93, _95);
    bool _127 = _95 != 1.0;
    bool _129 = isnan(_95);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = 1.0 / _121;
    float _139 = precise::max(_117, _123);
    uint _142 = spvSubgroupBallot(true).x;
    bool _144 = int(_142) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_139, _139, _139, _139), uint2(int2(_111, _115)));
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _148 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].w, _146);
    int _150 = _135 ? as_type<int>(_148) : 1065353216;
    float _176;
    if (!_144)
    {
        int _152 = as_type<int>(_139);
        int _154 = 1;
        int _156 = 31;
        int _158;
        int _553 = _61(_152, _154, _156, _158, gl_SubgroupInvocationID);
        int _160 = _553;
        float _162 = precise::max(_139, as_type<float>(_160));
        int _164 = as_type<int>(_162);
        int _166 = 2;
        int _168 = 31;
        int _170;
        int _561 = _61(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _561;
        float _174 = precise::max(_162, as_type<float>(_172));
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = as_type<float>(gl_SubgroupInvocationID);
        uint _182 = spvSubgroupBallot(true).x;
        float _184 = as_type<float>(gl_SubgroupLtMask.x);
        int _186 = as_type<int>(_180) & (-4);
        uint _188 = min(uint(_186), 32u);
        bool _190 = int(_188) == 0;
        bool _192 = _188 < 32u;
        int _194 = 32 - int(_188);
        int _196 = int(_188) - 32;
        int _198 = 15 << int(_188);
        uint _200 = uint(int(uint(0) >> uint(_194)));
        int _202 = _198 | int(_200);
        int _204 = _190 ? 15 : _202;
        bool _206 = uint(_196) < 32u;
        int _208 = 0 << _196;
        int _210 = _206 ? _208 : 0;
        int _212 = _192 ? _204 : _210;
        int _214 = int(_182) & as_type<int>(_184);
        int _216 = _212 & _214;
        int _218 = _212 & int(_182);
        int _220 = int(spvFindUMSB(uint(_216)));
        int _222 = int(spvFindUMSB(uint(_218)));
        uint _224 = min(uint(_220), as_type<uint>(_180));
        int _226 = as_type<int>(_139);
        int _228 = int(_224);
        int _230 = 31;
        int _232;
        int _650 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _650;
        int _236 = int(_224);
        int _238 = int(_224);
        int _240 = 30;
        int _242;
        int _656 = _62(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _656;
        float _246 = precise::max(_139, as_type<float>(_234));
        int _248 = as_type<int>(_246);
        int _250 = _244;
        int _252 = 31;
        int _254;
        int _664 = _62(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _664;
        float _258 = precise::max(_246, as_type<float>(_256));
        int _260 = as_type<int>(_258);
        int _262 = _222;
        int _264 = 31;
        int _266;
        int _672 = _62(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _672;
        _176 = as_type<float>(_268);
    }
    _178 = false;
    float _270 = _176;
    float _272 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _274 = -_139;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _278 = precise::min(_89, _91);
    float _280 = as_type<float>(gl_SubgroupInvocationID);
    float _282 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _284 = _82 * _272;
    float _286 = precise::min(_93, _95);
    float _288 = 1.0 / _276;
    bool _290 = _139 >= 1.0;
    bool _292 = isnan(_139);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    float _300 = _84 * _282;
    float _302 = precise::min(_278, _286);
    int _304 = _115 * 2;
    int _306 = _111 & 1;
    bool _308 = _302 >= 1.0;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.0);
    bool _316 = _312 || _314;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _322 = trunc(_284);
    int _324 = int(_322);
    int _326 = 2 & _304;
    int _328 = (-3) & _306;
    int _330 = _326 | _328;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _334 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].w, _332);
    float _336 = 1.0 / _320;
    float _338 = _334 * 16777215.0;
    float _340 = trunc(_300);
    int _342 = int(_340);
    bool _344 = !_298;
    float _346 = _344 ? _338 : 16777215.0;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _350 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[1].w, _348);
    float _352 = trunc(_346);
    float _354 = precise::max(_352, 0.0);
    uint _356 = uint(_354);
    float _358 = _350 * 16777215.0;
    int _360 = _342 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _362 = _360 + _324;
    bool _364 = !_316;
    float _366 = _364 ? _358 : 16777215.0;
    int _368 = as_type<int>(_280) & 3;
    bool _370 = _368 != 0;
    int _372 = _362 * 4;
    int _374 = _372 + _330;
    int _376 = _374 * 4;
    float _378 = trunc(_366);
    float _380 = precise::max(_378, 0.0);
    uint _382 = uint(_380);
    int _384 = _376 + 9728;
    if (!_370)
    {
        int _386 = _111 >> 31;
        int _388 = _115 >> 31;
        int _390 = _386 & 1;
        int _392 = _388 & 1;
        int _394 = _111 + _390;
        int _396 = _115 + _392;
        int _398 = _394 >> 1;
        int _400 = _396 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_270, _270, _270, _270), uint2(int2(_398, _400)));
    }
    uint _402 = uint(int(uint(_376) >> uint(2)));
    uint _869 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_402)], _382, memory_order_relaxed);
    uint _404 = _869;
    bool _406 = !_298;
    int _408 = _406 ? as_type<int>(_334) : 1065353216;
    uint _410 = uint(int(uint(_384) >> uint(2)));
    uint _883 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_410)], _356, memory_order_relaxed);
    uint _412 = _883;
    out.gl_FragDepth = _334;
    out.m_53.x = as_type<float>(_150);
    out.m_53.y = as_type<float>(_150);
    out.m_53.z = as_type<float>(_150);
    out.m_53.w = as_type<float>(_150);
    out.m_55.x = as_type<float>(_408);
    return main0_out_u{as_type<uint4>(out.m_53), as_type<uint4>(out.m_55), out.gl_FragDepth};
}

