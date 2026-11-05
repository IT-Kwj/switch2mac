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
int _61(thread const int& _801, thread const int& _802, thread const int& _803, thread int& _804, thread uint& gl_SubgroupInvocationID)
{
    int _807 = _803 & 31;
    uint _809 = uint(int(uint(_803) >> uint(8)));
    int _811 = int(_809) & 31;
    float _813 = as_type<float>(gl_SubgroupInvocationID);
    int _815 = as_type<int>(_813) & _811;
    int _817 = ~_811;
    int _819 = _807 & _817;
    int _821 = _819 | _815;
    int _823 = as_type<int>(_813) ^ _802;
    bool _825 = uint(_823) <= uint(_821);
    _804 = _825 ? (-1) : 0;
    float _827 = spvSubgroupShuffle(as_type<float>(_801), uint(_823));
    uint _829 = uint(_825 ? as_type<int>(_827) : _801);
    return int(_829);
}

static inline __attribute__((always_inline))
int _62(thread const int& _877, thread const int& _878, thread const int& _879, thread int& _880, thread uint& gl_SubgroupInvocationID)
{
    int _883 = _879 & 31;
    uint _885 = uint(int(uint(_879) >> uint(8)));
    int _887 = int(_885) & 31;
    float _889 = as_type<float>(gl_SubgroupInvocationID);
    int _891 = as_type<int>(_889) & _887;
    int _893 = ~_887;
    int _895 = _883 & _893;
    int _897 = _895 | _891;
    int _899 = ~_887;
    int _901 = _878 & _899;
    int _903 = _901 | _891;
    bool _905 = uint(_903) <= uint(_897);
    _880 = _905 ? (-1) : 0;
    float _907 = spvSubgroupShuffle(as_type<float>(_877), uint(_903));
    uint _909 = uint(_905 ? as_type<int>(_907) : _877);
    return int(_909);
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
    float2 _407 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407)), int2(0), component::x).xyzw;
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
        int _481 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _481;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _489 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _489;
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
        int _578 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _578;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _584 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _584;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _592 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _592;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _600 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _600;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _258 = _122 * 2;
    float _260 = precise::min(_250, _252);
    float _262 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _264 = _82 * _256;
    float _266 = -_260;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _270 = _260 >= 1.0;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan(1.0);
    bool _278 = _274 || _276;
    float _280 = _84 * _262;
    float _282 = trunc(_264);
    int _284 = int(_282);
    float _286 = 1.0 / _268;
    float _288 = trunc(_280);
    int _290 = int(_288);
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _292);
    float _296 = _294 * 16777215.0;
    int _298 = _118 & 1;
    int _300 = _290 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _302 = _300 + _284;
    bool _304 = !_278;
    float _306 = _304 ? _296 : 16777215.0;
    int _308 = 2 & _258;
    int _310 = (-3) & _298;
    int _312 = _308 | _310;
    int _314 = as_type<int>(_254) & 3;
    bool _316 = _314 != 0;
    float _318 = trunc(_306);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = _302 * 4;
    int _326 = _324 + _312;
    int _328 = _326 << 2;
    if (!_316)
    {
        int _330 = _118 >> 31;
        int _332 = _122 >> 31;
        int _334 = _330 & 1;
        int _336 = _332 & 1;
        int _338 = _118 + _334;
        int _340 = _122 + _336;
        int _342 = _338 >> 1;
        int _344 = _340 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_342, _344)));
    }
    float _346 = -_128;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _350 = uint(int(uint(_328) >> uint(2)));
    uint _760 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_350)], _322, memory_order_relaxed);
    uint _352 = _760;
    bool _354 = _128 >= 1.0;
    bool _356 = isnan(_128);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = 1.0 / _348;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _368 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].w, _366);
    bool _370 = !_362;
    int _372 = _370 ? as_type<int>(_368) : 1065353216;
    out.gl_FragDepth = _348;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_372);
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
    float2 _407 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407)), int2(0), component::x).xyzw;
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
        int _481 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _481;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _489 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _489;
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
        int _578 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _578;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _584 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _584;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _592 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _592;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _600 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _600;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _258 = _122 * 2;
    float _260 = precise::min(_250, _252);
    float _262 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _264 = _82 * _256;
    float _266 = -_260;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _270 = _260 >= 1.0;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan(1.0);
    bool _278 = _274 || _276;
    float _280 = _84 * _262;
    float _282 = trunc(_264);
    int _284 = int(_282);
    float _286 = 1.0 / _268;
    float _288 = trunc(_280);
    int _290 = int(_288);
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _292);
    float _296 = _294 * 16777215.0;
    int _298 = _118 & 1;
    int _300 = _290 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _302 = _300 + _284;
    bool _304 = !_278;
    float _306 = _304 ? _296 : 16777215.0;
    int _308 = 2 & _258;
    int _310 = (-3) & _298;
    int _312 = _308 | _310;
    int _314 = as_type<int>(_254) & 3;
    bool _316 = _314 != 0;
    float _318 = trunc(_306);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = _302 * 4;
    int _326 = _324 + _312;
    int _328 = _326 << 2;
    if (!_316)
    {
        int _330 = _118 >> 31;
        int _332 = _122 >> 31;
        int _334 = _330 & 1;
        int _336 = _332 & 1;
        int _338 = _118 + _334;
        int _340 = _122 + _336;
        int _342 = _338 >> 1;
        int _344 = _340 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_342, _344)));
    }
    float _346 = -_128;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _350 = uint(int(uint(_328) >> uint(2)));
    uint _760 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_350)], _322, memory_order_relaxed);
    uint _352 = _760;
    bool _354 = _128 >= 1.0;
    bool _356 = isnan(_128);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = 1.0 / _348;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _368 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].w, _366);
    bool _370 = !_362;
    int _372 = _370 ? as_type<int>(_368) : 1065353216;
    out.gl_FragDepth = _348;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_372);
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
    float2 _407 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407)), int2(0), component::x).xyzw;
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
        int _481 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _481;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _489 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _489;
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
        int _578 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _578;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _584 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _584;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _592 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _592;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _600 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _600;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = precise::min(_89, _91);
    float _252 = precise::min(_93, _95);
    float _254 = as_type<float>(gl_SubgroupInvocationID);
    float _256 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _258 = _122 * 2;
    float _260 = precise::min(_250, _252);
    float _262 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _264 = _82 * _256;
    float _266 = -_260;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _270 = _260 >= 1.0;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan(1.0);
    bool _278 = _274 || _276;
    float _280 = _84 * _262;
    float _282 = trunc(_264);
    int _284 = int(_282);
    float _286 = 1.0 / _268;
    float _288 = trunc(_280);
    int _290 = int(_288);
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _292);
    float _296 = _294 * 16777215.0;
    int _298 = _118 & 1;
    int _300 = _290 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _302 = _300 + _284;
    bool _304 = !_278;
    float _306 = _304 ? _296 : 16777215.0;
    int _308 = 2 & _258;
    int _310 = (-3) & _298;
    int _312 = _308 | _310;
    int _314 = as_type<int>(_254) & 3;
    bool _316 = _314 != 0;
    float _318 = trunc(_306);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = _302 * 4;
    int _326 = _324 + _312;
    int _328 = _326 << 2;
    if (!_316)
    {
        int _330 = _118 >> 31;
        int _332 = _122 >> 31;
        int _334 = _330 & 1;
        int _336 = _332 & 1;
        int _338 = _118 + _334;
        int _340 = _122 + _336;
        int _342 = _338 >> 1;
        int _344 = _340 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_342, _344)));
    }
    float _346 = -_128;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _350 = uint(int(uint(_328) >> uint(2)));
    uint _760 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_350)], _322, memory_order_relaxed);
    uint _352 = _760;
    bool _354 = _128 >= 1.0;
    bool _356 = isnan(_128);
    bool _358 = _354 || _356;
    bool _360 = isnan(1.0);
    bool _362 = _358 || _360;
    float _364 = 1.0 / _348;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _368 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].w, _366);
    bool _370 = !_362;
    int _372 = _370 ? as_type<int>(_368) : 1065353216;
    out.gl_FragDepth = _348;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = as_type<float>(_372);
    return main0_out_m{out.m_53, as_type<uint4>(out.m_55), out.gl_FragDepth};
}

