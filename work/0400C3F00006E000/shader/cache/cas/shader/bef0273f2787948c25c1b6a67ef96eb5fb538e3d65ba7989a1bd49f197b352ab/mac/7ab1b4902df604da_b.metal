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
int _63(thread const int& _869, thread const int& _870, thread const int& _871, thread int& _872, thread uint& gl_SubgroupInvocationID)
{
    int _875 = _871 & 31;
    uint _877 = uint(int(uint(_871) >> uint(8)));
    int _879 = int(_877) & 31;
    float _881 = as_type<float>(gl_SubgroupInvocationID);
    int _883 = as_type<int>(_881) & _879;
    int _885 = ~_879;
    int _887 = _875 & _885;
    int _889 = _887 | _883;
    int _891 = as_type<int>(_881) ^ _870;
    bool _893 = uint(_891) <= uint(_889);
    _872 = _893 ? (-1) : 0;
    float _895 = spvSubgroupShuffle(as_type<float>(_869), uint(_891));
    uint _897 = uint(_893 ? as_type<int>(_895) : _869);
    return int(_897);
}

static inline __attribute__((always_inline))
int _64(thread const int& _945, thread const int& _946, thread const int& _947, thread int& _948, thread uint& gl_SubgroupInvocationID)
{
    int _951 = _947 & 31;
    uint _953 = uint(int(uint(_947) >> uint(8)));
    int _955 = int(_953) & 31;
    float _957 = as_type<float>(gl_SubgroupInvocationID);
    int _959 = as_type<int>(_957) & _955;
    int _961 = ~_955;
    int _963 = _951 & _961;
    int _965 = _963 | _959;
    int _967 = ~_955;
    int _969 = _946 & _967;
    int _971 = _969 | _959;
    bool _973 = uint(_971) <= uint(_965);
    _948 = _973 ? (-1) : 0;
    float _975 = spvSubgroupShuffle(as_type<float>(_945), uint(_971));
    uint _977 = uint(_973 ? as_type<int>(_975) : _945);
    return int(_977);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _180 = false;
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
    float2 _433 = float2(_84, _86);
    float4 _89 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433)), int2(0), component::x).xyzw;
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
    float _111 = trunc(_103);
    int _113 = int(_111);
    float _115 = trunc(_109);
    int _117 = int(_115);
    float _119 = precise::max(_91, _93);
    float _121 = -_97;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _125 = precise::max(_95, _97);
    bool _129 = _97 != 1.0;
    bool _131 = isnan(_97);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = 1.0 / _123;
    float _141 = precise::max(_119, _125);
    uint _144 = spvSubgroupBallot(true).x;
    bool _146 = int(_144) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_141, _141, _141, _141), uint2(int2(_113, _117)));
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _150 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].w, _148);
    int _152 = _137 ? as_type<int>(_150) : 1065353216;
    float _178;
    if (!_146)
    {
        int _154 = as_type<int>(_141);
        int _156 = 1;
        int _158 = 31;
        int _160;
        int _539 = _63(_154, _156, _158, _160, gl_SubgroupInvocationID);
        int _162 = _539;
        float _164 = precise::max(_141, as_type<float>(_162));
        int _166 = as_type<int>(_164);
        int _168 = 2;
        int _170 = 31;
        int _172;
        int _547 = _63(_166, _168, _170, _172, gl_SubgroupInvocationID);
        int _174 = _547;
        float _176 = precise::max(_164, as_type<float>(_174));
        _178 = _176;
        _180 = true;
    }
    else
    {
        float _182 = as_type<float>(gl_SubgroupInvocationID);
        uint _184 = spvSubgroupBallot(true).x;
        float _186 = as_type<float>(gl_SubgroupLtMask.x);
        int _188 = as_type<int>(_182) & (-4);
        uint _190 = min(uint(_188), 32u);
        bool _192 = int(_190) == 0;
        bool _194 = _190 < 32u;
        int _196 = 32 - int(_190);
        int _198 = int(_190) - 32;
        int _200 = 15 << int(_190);
        uint _202 = uint(int(uint(0) >> uint(_196)));
        int _204 = _200 | int(_202);
        int _206 = _192 ? 15 : _204;
        bool _208 = uint(_198) < 32u;
        int _210 = 0 << _198;
        int _212 = _208 ? _210 : 0;
        int _214 = _194 ? _206 : _212;
        int _216 = int(_184) & as_type<int>(_186);
        int _218 = _214 & _216;
        int _220 = _214 & int(_184);
        int _222 = int(spvFindUMSB(uint(_218)));
        int _224 = int(spvFindUMSB(uint(_220)));
        uint _226 = min(uint(_222), as_type<uint>(_182));
        int _228 = as_type<int>(_141);
        int _230 = int(_226);
        int _232 = 31;
        int _234;
        int _636 = _64(_228, _230, _232, _234, gl_SubgroupInvocationID);
        int _236 = _636;
        int _238 = int(_226);
        int _240 = int(_226);
        int _242 = 30;
        int _244;
        int _642 = _64(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _642;
        float _248 = precise::max(_141, as_type<float>(_236));
        int _250 = as_type<int>(_248);
        int _252 = _246;
        int _254 = 31;
        int _256;
        int _650 = _64(_250, _252, _254, _256, gl_SubgroupInvocationID);
        int _258 = _650;
        float _260 = precise::max(_248, as_type<float>(_258));
        int _262 = as_type<int>(_260);
        int _264 = _224;
        int _266 = 31;
        int _268;
        int _658 = _64(_262, _264, _266, _268, gl_SubgroupInvocationID);
        int _270 = _658;
        _178 = as_type<float>(_270);
    }
    _180 = false;
    float _272 = _178;
    float _274 = precise::min(_91, _93);
    int _276 = _117 * 2;
    float _278 = precise::min(_95, _97);
    float _280 = as_type<float>(gl_SubgroupInvocationID);
    float _282 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _284 = precise::min(_274, _278);
    float _286 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _288 = _84 * _282;
    bool _290 = _284 >= 1.0;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _304 = _86 * _286;
    float _306 = trunc(_288);
    int _308 = int(_306);
    float _310 = 1.0 / _302;
    float _312 = trunc(_304);
    int _314 = int(_312);
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _318 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[1].w, _316);
    float _320 = _318 * 16777215.0;
    int _322 = _113 & 1;
    int _324 = _314 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _326 = _324 + _308;
    bool _328 = !_298;
    float _330 = _328 ? _320 : 16777215.0;
    int _332 = 2 & _276;
    int _334 = (-3) & _322;
    int _336 = _332 | _334;
    int _338 = as_type<int>(_280) & 3;
    bool _340 = _338 != 0;
    float _342 = trunc(_330);
    float _344 = precise::max(_342, 0.0);
    uint _346 = uint(_344);
    int _348 = _326 * 4;
    int _350 = _348 + _336;
    int _352 = _350 << 2;
    int _354 = _352 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    if (!_340)
    {
        int _356 = _113 >> 31;
        int _358 = _117 >> 31;
        int _360 = _356 & 1;
        int _362 = _358 & 1;
        int _364 = _113 + _360;
        int _366 = _117 + _362;
        int _368 = _364 >> 1;
        int _370 = _366 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_272, _272, _272, _272), uint2(int2(_368, _370)));
    }
    float _372 = -_141;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _376 = uint(int(uint(_352) >> uint(2)));
    uint _824 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_376)], _346, memory_order_relaxed);
    uint _378 = _824;
    bool _380 = _141 >= 1.0;
    bool _382 = isnan(_141);
    bool _384 = _380 || _382;
    bool _386 = isnan(1.0);
    bool _388 = _384 || _386;
    float _390 = 1.0 / _374;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _394 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[1].w, _392);
    bool _396 = !_388;
    int _398 = _396 ? as_type<int>(_394) : 1065353216;
    out.gl_FragDepth = as_type<float>(_354);
    out.m_55.x = as_type<float>(_152);
    out.m_55.y = as_type<float>(_152);
    out.m_55.z = as_type<float>(_152);
    out.m_55.w = as_type<float>(_152);
    out.m_57.x = as_type<float>(_398);
    return out;
}


struct main0_out_u
{
    uint4 m_55 [[color(0)]];
    uint4 m_57 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _180 = false;
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
    float2 _433 = float2(_84, _86);
    float4 _89 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433)), int2(0), component::x).xyzw;
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
    float _111 = trunc(_103);
    int _113 = int(_111);
    float _115 = trunc(_109);
    int _117 = int(_115);
    float _119 = precise::max(_91, _93);
    float _121 = -_97;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _125 = precise::max(_95, _97);
    bool _129 = _97 != 1.0;
    bool _131 = isnan(_97);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = 1.0 / _123;
    float _141 = precise::max(_119, _125);
    uint _144 = spvSubgroupBallot(true).x;
    bool _146 = int(_144) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_141, _141, _141, _141), uint2(int2(_113, _117)));
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _150 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].w, _148);
    int _152 = _137 ? as_type<int>(_150) : 1065353216;
    float _178;
    if (!_146)
    {
        int _154 = as_type<int>(_141);
        int _156 = 1;
        int _158 = 31;
        int _160;
        int _539 = _63(_154, _156, _158, _160, gl_SubgroupInvocationID);
        int _162 = _539;
        float _164 = precise::max(_141, as_type<float>(_162));
        int _166 = as_type<int>(_164);
        int _168 = 2;
        int _170 = 31;
        int _172;
        int _547 = _63(_166, _168, _170, _172, gl_SubgroupInvocationID);
        int _174 = _547;
        float _176 = precise::max(_164, as_type<float>(_174));
        _178 = _176;
        _180 = true;
    }
    else
    {
        float _182 = as_type<float>(gl_SubgroupInvocationID);
        uint _184 = spvSubgroupBallot(true).x;
        float _186 = as_type<float>(gl_SubgroupLtMask.x);
        int _188 = as_type<int>(_182) & (-4);
        uint _190 = min(uint(_188), 32u);
        bool _192 = int(_190) == 0;
        bool _194 = _190 < 32u;
        int _196 = 32 - int(_190);
        int _198 = int(_190) - 32;
        int _200 = 15 << int(_190);
        uint _202 = uint(int(uint(0) >> uint(_196)));
        int _204 = _200 | int(_202);
        int _206 = _192 ? 15 : _204;
        bool _208 = uint(_198) < 32u;
        int _210 = 0 << _198;
        int _212 = _208 ? _210 : 0;
        int _214 = _194 ? _206 : _212;
        int _216 = int(_184) & as_type<int>(_186);
        int _218 = _214 & _216;
        int _220 = _214 & int(_184);
        int _222 = int(spvFindUMSB(uint(_218)));
        int _224 = int(spvFindUMSB(uint(_220)));
        uint _226 = min(uint(_222), as_type<uint>(_182));
        int _228 = as_type<int>(_141);
        int _230 = int(_226);
        int _232 = 31;
        int _234;
        int _636 = _64(_228, _230, _232, _234, gl_SubgroupInvocationID);
        int _236 = _636;
        int _238 = int(_226);
        int _240 = int(_226);
        int _242 = 30;
        int _244;
        int _642 = _64(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _642;
        float _248 = precise::max(_141, as_type<float>(_236));
        int _250 = as_type<int>(_248);
        int _252 = _246;
        int _254 = 31;
        int _256;
        int _650 = _64(_250, _252, _254, _256, gl_SubgroupInvocationID);
        int _258 = _650;
        float _260 = precise::max(_248, as_type<float>(_258));
        int _262 = as_type<int>(_260);
        int _264 = _224;
        int _266 = 31;
        int _268;
        int _658 = _64(_262, _264, _266, _268, gl_SubgroupInvocationID);
        int _270 = _658;
        _178 = as_type<float>(_270);
    }
    _180 = false;
    float _272 = _178;
    float _274 = precise::min(_91, _93);
    int _276 = _117 * 2;
    float _278 = precise::min(_95, _97);
    float _280 = as_type<float>(gl_SubgroupInvocationID);
    float _282 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _284 = precise::min(_274, _278);
    float _286 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _288 = _84 * _282;
    bool _290 = _284 >= 1.0;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.0);
    bool _298 = _294 || _296;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _304 = _86 * _286;
    float _306 = trunc(_288);
    int _308 = int(_306);
    float _310 = 1.0 / _302;
    float _312 = trunc(_304);
    int _314 = int(_312);
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _318 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[1].w, _316);
    float _320 = _318 * 16777215.0;
    int _322 = _113 & 1;
    int _324 = _314 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _326 = _324 + _308;
    bool _328 = !_298;
    float _330 = _328 ? _320 : 16777215.0;
    int _332 = 2 & _276;
    int _334 = (-3) & _322;
    int _336 = _332 | _334;
    int _338 = as_type<int>(_280) & 3;
    bool _340 = _338 != 0;
    float _342 = trunc(_330);
    float _344 = precise::max(_342, 0.0);
    uint _346 = uint(_344);
    int _348 = _326 * 4;
    int _350 = _348 + _336;
    int _352 = _350 << 2;
    int _354 = _352 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    if (!_340)
    {
        int _356 = _113 >> 31;
        int _358 = _117 >> 31;
        int _360 = _356 & 1;
        int _362 = _358 & 1;
        int _364 = _113 + _360;
        int _366 = _117 + _362;
        int _368 = _364 >> 1;
        int _370 = _366 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_272, _272, _272, _272), uint2(int2(_368, _370)));
    }
    float _372 = -_141;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _376 = uint(int(uint(_352) >> uint(2)));
    uint _824 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_376)], _346, memory_order_relaxed);
    uint _378 = _824;
    bool _380 = _141 >= 1.0;
    bool _382 = isnan(_141);
    bool _384 = _380 || _382;
    bool _386 = isnan(1.0);
    bool _388 = _384 || _386;
    float _390 = 1.0 / _374;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _394 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[1].w, _392);
    bool _396 = !_388;
    int _398 = _396 ? as_type<int>(_394) : 1065353216;
    out.gl_FragDepth = as_type<float>(_354);
    out.m_55.x = as_type<float>(_152);
    out.m_55.y = as_type<float>(_152);
    out.m_55.z = as_type<float>(_152);
    out.m_55.w = as_type<float>(_152);
    out.m_57.x = as_type<float>(_398);
    return main0_out_u{as_type<uint4>(out.m_55), as_type<uint4>(out.m_57), out.gl_FragDepth};
}

