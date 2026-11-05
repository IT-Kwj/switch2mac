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
    float2 _405 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405)), int2(0), component::x).xyzw;
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
        int _511 = _61(_152, _154, _156, _158, gl_SubgroupInvocationID);
        int _160 = _511;
        float _162 = precise::max(_139, as_type<float>(_160));
        int _164 = as_type<int>(_162);
        int _166 = 2;
        int _168 = 31;
        int _170;
        int _519 = _61(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _519;
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
        int _608 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _608;
        int _236 = int(_224);
        int _238 = int(_224);
        int _240 = 30;
        int _242;
        int _614 = _62(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _614;
        float _246 = precise::max(_139, as_type<float>(_234));
        int _248 = as_type<int>(_246);
        int _250 = _244;
        int _252 = 31;
        int _254;
        int _622 = _62(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _622;
        float _258 = precise::max(_246, as_type<float>(_256));
        int _260 = as_type<int>(_258);
        int _262 = _222;
        int _264 = 31;
        int _266;
        int _630 = _62(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _630;
        _176 = as_type<float>(_268);
    }
    _178 = false;
    float _270 = _176;
    float _272 = -_139;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _276 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _278 = as_type<float>(gl_SubgroupInvocationID);
    float _280 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _282 = _115 * 2;
    bool _284 = _139 >= 1.0;
    bool _286 = isnan(_139);
    bool _288 = _284 || _286;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    float _294 = 1.0 / _274;
    float _296 = _82 * _276;
    float _298 = _84 * _280;
    float _300 = trunc(_296);
    int _302 = int(_300);
    float _304 = trunc(_298);
    int _306 = int(_304);
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _310 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[1].w, _308);
    int _312 = _111 & 1;
    int _314 = as_type<int>(_278) & 3;
    bool _316 = _314 != 0;
    float _318 = _310 * 16777215.0;
    int _320 = 2 & _282;
    int _322 = (-3) & _312;
    int _324 = _320 | _322;
    int _326 = _306 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _328 = _326 + _302;
    bool _330 = !_292;
    float _332 = _330 ? _318 : 16777215.0;
    int _334 = _328 * 4;
    int _336 = _334 + _324;
    float _338 = trunc(_332);
    float _340 = precise::max(_338, 0.0);
    uint _342 = uint(_340);
    int _344 = _336 << 2;
    int _346 = _344 + 9728;
    if (!_316)
    {
        int _348 = _111 >> 31;
        int _350 = _115 >> 31;
        int _352 = _348 & 1;
        int _354 = _350 & 1;
        int _356 = _111 + _352;
        int _358 = _115 + _354;
        int _360 = _356 >> 1;
        int _362 = _358 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_270, _270, _270, _270), uint2(int2(_360, _362)));
    }
    uint _364 = uint(int(uint(_346) >> uint(2)));
    uint _778 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_364)], _342, memory_order_relaxed);
    uint _366 = _778;
    bool _368 = !_292;
    int _370 = _368 ? as_type<int>(_310) : 1065353216;
    out.gl_FragDepth = _310;
    out.m_53.x = as_type<float>(_150);
    out.m_53.y = as_type<float>(_150);
    out.m_53.z = as_type<float>(_150);
    out.m_53.w = as_type<float>(_150);
    out.m_55.x = as_type<float>(_370);
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
    float2 _405 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405)), int2(0), component::x).xyzw;
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
        int _511 = _61(_152, _154, _156, _158, gl_SubgroupInvocationID);
        int _160 = _511;
        float _162 = precise::max(_139, as_type<float>(_160));
        int _164 = as_type<int>(_162);
        int _166 = 2;
        int _168 = 31;
        int _170;
        int _519 = _61(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _519;
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
        int _608 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _608;
        int _236 = int(_224);
        int _238 = int(_224);
        int _240 = 30;
        int _242;
        int _614 = _62(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _614;
        float _246 = precise::max(_139, as_type<float>(_234));
        int _248 = as_type<int>(_246);
        int _250 = _244;
        int _252 = 31;
        int _254;
        int _622 = _62(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _622;
        float _258 = precise::max(_246, as_type<float>(_256));
        int _260 = as_type<int>(_258);
        int _262 = _222;
        int _264 = 31;
        int _266;
        int _630 = _62(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _630;
        _176 = as_type<float>(_268);
    }
    _178 = false;
    float _270 = _176;
    float _272 = -_139;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _276 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _278 = as_type<float>(gl_SubgroupInvocationID);
    float _280 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _282 = _115 * 2;
    bool _284 = _139 >= 1.0;
    bool _286 = isnan(_139);
    bool _288 = _284 || _286;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    float _294 = 1.0 / _274;
    float _296 = _82 * _276;
    float _298 = _84 * _280;
    float _300 = trunc(_296);
    int _302 = int(_300);
    float _304 = trunc(_298);
    int _306 = int(_304);
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _310 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[1].w, _308);
    int _312 = _111 & 1;
    int _314 = as_type<int>(_278) & 3;
    bool _316 = _314 != 0;
    float _318 = _310 * 16777215.0;
    int _320 = 2 & _282;
    int _322 = (-3) & _312;
    int _324 = _320 | _322;
    int _326 = _306 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _328 = _326 + _302;
    bool _330 = !_292;
    float _332 = _330 ? _318 : 16777215.0;
    int _334 = _328 * 4;
    int _336 = _334 + _324;
    float _338 = trunc(_332);
    float _340 = precise::max(_338, 0.0);
    uint _342 = uint(_340);
    int _344 = _336 << 2;
    int _346 = _344 + 9728;
    if (!_316)
    {
        int _348 = _111 >> 31;
        int _350 = _115 >> 31;
        int _352 = _348 & 1;
        int _354 = _350 & 1;
        int _356 = _111 + _352;
        int _358 = _115 + _354;
        int _360 = _356 >> 1;
        int _362 = _358 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_270, _270, _270, _270), uint2(int2(_360, _362)));
    }
    uint _364 = uint(int(uint(_346) >> uint(2)));
    uint _778 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_364)], _342, memory_order_relaxed);
    uint _366 = _778;
    bool _368 = !_292;
    int _370 = _368 ? as_type<int>(_310) : 1065353216;
    out.gl_FragDepth = _310;
    out.m_53.x = as_type<float>(_150);
    out.m_53.y = as_type<float>(_150);
    out.m_53.z = as_type<float>(_150);
    out.m_53.w = as_type<float>(_150);
    out.m_55.x = as_type<float>(_370);
    return main0_out_u{as_type<uint4>(out.m_53), as_type<uint4>(out.m_55), out.gl_FragDepth};
}

