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
int _59(thread const int& _796, thread const int& _797, thread const int& _798, thread int& _799, thread uint& gl_SubgroupInvocationID)
{
    int _802 = _798 & 31;
    uint _804 = uint(int(uint(_798) >> uint(8)));
    int _806 = int(_804) & 31;
    float _808 = as_type<float>(gl_SubgroupInvocationID);
    int _810 = as_type<int>(_808) & _806;
    int _812 = ~_806;
    int _814 = _802 & _812;
    int _816 = _814 | _810;
    int _818 = as_type<int>(_808) ^ _797;
    bool _820 = uint(_818) <= uint(_816);
    _799 = _820 ? (-1) : 0;
    float _822 = spvSubgroupShuffle(as_type<float>(_796), uint(_818));
    uint _824 = uint(_820 ? as_type<int>(_822) : _796);
    return int(_824);
}

static inline __attribute__((always_inline))
int _60(thread const int& _872, thread const int& _873, thread const int& _874, thread int& _875, thread uint& gl_SubgroupInvocationID)
{
    int _878 = _874 & 31;
    uint _880 = uint(int(uint(_874) >> uint(8)));
    int _882 = int(_880) & 31;
    float _884 = as_type<float>(gl_SubgroupInvocationID);
    int _886 = as_type<int>(_884) & _882;
    int _888 = ~_882;
    int _890 = _878 & _888;
    int _892 = _890 | _886;
    int _894 = ~_882;
    int _896 = _873 & _894;
    int _898 = _896 | _886;
    bool _900 = uint(_898) <= uint(_892);
    _875 = _900 ? (-1) : 0;
    float _902 = spvSubgroupShuffle(as_type<float>(_872), uint(_898));
    uint _904 = uint(_900 ? as_type<int>(_902) : _872);
    return int(_904);
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
    float2 _403 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403)), int2(0), component::x).xyzw;
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
        int _509 = _59(_150, _152, _154, _156, gl_SubgroupInvocationID);
        int _158 = _509;
        float _160 = precise::max(_137, as_type<float>(_158));
        int _162 = as_type<int>(_160);
        int _164 = 2;
        int _166 = 31;
        int _168;
        int _517 = _59(_162, _164, _166, _168, gl_SubgroupInvocationID);
        int _170 = _517;
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
        int _606 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _606;
        int _234 = int(_222);
        int _236 = int(_222);
        int _238 = 30;
        int _240;
        int _612 = _60(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _612;
        float _244 = precise::max(_137, as_type<float>(_232));
        int _246 = as_type<int>(_244);
        int _248 = _242;
        int _250 = 31;
        int _252;
        int _620 = _60(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _620;
        float _256 = precise::max(_244, as_type<float>(_254));
        int _258 = as_type<int>(_256);
        int _260 = _220;
        int _262 = 31;
        int _264;
        int _628 = _60(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _628;
        _174 = as_type<float>(_266);
    }
    _176 = false;
    float _268 = _174;
    float _270 = precise::min(_87, _89);
    float _272 = as_type<float>(gl_SubgroupInvocationID);
    float _274 = precise::min(_91, _93);
    int _276 = _113 * 2;
    float _278 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _280 = precise::min(_270, _274);
    int _282 = _109 & 1;
    float _284 = _80 * _278;
    float _286 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _288 = -_280;
    float _290 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _292 = _280 >= 1.0;
    bool _294 = isnan(_280);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    int _302 = 2 & _276;
    int _304 = (-3) & _282;
    int _306 = _302 | _304;
    float _308 = _82 * _286;
    float _310 = trunc(_284);
    int _312 = int(_310);
    float _314 = 1.0 / _290;
    float _316 = trunc(_308);
    int _318 = int(_316);
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[1].w, _320);
    float _324 = _322 * 16777215.0;
    int _326 = _318 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _328 = _326 + _312;
    bool _330 = !_300;
    float _332 = _330 ? _324 : 16777215.0;
    int _334 = as_type<int>(_272) & 3;
    bool _336 = _334 != 0;
    int _338 = _328 * 4;
    int _340 = _338 + _306;
    float _342 = trunc(_332);
    float _344 = precise::max(_342, 0.0);
    uint _346 = uint(_344);
    int _348 = _340 << 2;
    if (!_336)
    {
        int _350 = _109 >> 31;
        int _352 = _113 >> 31;
        int _354 = _350 & 1;
        int _356 = _352 & 1;
        int _358 = _109 + _354;
        int _360 = _113 + _356;
        int _362 = _358 >> 1;
        int _364 = _360 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_268, _268, _268, _268), uint2(int2(_362, _364)));
    }
    uint _366 = uint(int(uint(_348) >> uint(2)));
    uint _782 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_366)], _346, memory_order_relaxed);
    uint _368 = _782;
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
    float2 _403 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403)), int2(0), component::x).xyzw;
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
        int _509 = _59(_150, _152, _154, _156, gl_SubgroupInvocationID);
        int _158 = _509;
        float _160 = precise::max(_137, as_type<float>(_158));
        int _162 = as_type<int>(_160);
        int _164 = 2;
        int _166 = 31;
        int _168;
        int _517 = _59(_162, _164, _166, _168, gl_SubgroupInvocationID);
        int _170 = _517;
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
        int _606 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _606;
        int _234 = int(_222);
        int _236 = int(_222);
        int _238 = 30;
        int _240;
        int _612 = _60(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _612;
        float _244 = precise::max(_137, as_type<float>(_232));
        int _246 = as_type<int>(_244);
        int _248 = _242;
        int _250 = 31;
        int _252;
        int _620 = _60(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _620;
        float _256 = precise::max(_244, as_type<float>(_254));
        int _258 = as_type<int>(_256);
        int _260 = _220;
        int _262 = 31;
        int _264;
        int _628 = _60(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _628;
        _174 = as_type<float>(_266);
    }
    _176 = false;
    float _268 = _174;
    float _270 = precise::min(_87, _89);
    float _272 = as_type<float>(gl_SubgroupInvocationID);
    float _274 = precise::min(_91, _93);
    int _276 = _113 * 2;
    float _278 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _280 = precise::min(_270, _274);
    int _282 = _109 & 1;
    float _284 = _80 * _278;
    float _286 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _288 = -_280;
    float _290 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _292 = _280 >= 1.0;
    bool _294 = isnan(_280);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    int _302 = 2 & _276;
    int _304 = (-3) & _282;
    int _306 = _302 | _304;
    float _308 = _82 * _286;
    float _310 = trunc(_284);
    int _312 = int(_310);
    float _314 = 1.0 / _290;
    float _316 = trunc(_308);
    int _318 = int(_316);
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[1].w, _320);
    float _324 = _322 * 16777215.0;
    int _326 = _318 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _328 = _326 + _312;
    bool _330 = !_300;
    float _332 = _330 ? _324 : 16777215.0;
    int _334 = as_type<int>(_272) & 3;
    bool _336 = _334 != 0;
    int _338 = _328 * 4;
    int _340 = _338 + _306;
    float _342 = trunc(_332);
    float _344 = precise::max(_342, 0.0);
    uint _346 = uint(_344);
    int _348 = _340 << 2;
    if (!_336)
    {
        int _350 = _109 >> 31;
        int _352 = _113 >> 31;
        int _354 = _350 & 1;
        int _356 = _352 & 1;
        int _358 = _109 + _354;
        int _360 = _113 + _356;
        int _362 = _358 >> 1;
        int _364 = _360 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_268, _268, _268, _268), uint2(int2(_362, _364)));
    }
    uint _366 = uint(int(uint(_348) >> uint(2)));
    uint _782 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_366)], _346, memory_order_relaxed);
    uint _368 = _782;
    out.gl_FragDepth = _93;
    out.m_53.x = as_type<float>(_148);
    out.m_53.y = as_type<float>(_148);
    out.m_53.z = as_type<float>(_148);
    out.m_53.w = as_type<float>(_148);
    return main0_out_u{as_type<uint4>(out.m_53), out.gl_FragDepth};
}

