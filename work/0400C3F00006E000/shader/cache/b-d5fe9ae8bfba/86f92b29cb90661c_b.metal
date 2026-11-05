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
    float4 m_50 [[color(0)]];
    float4 m_52 [[color(2)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _897, thread const int& _898, thread const int& _899, thread int& _900, thread uint& gl_SubgroupInvocationID)
{
    int _903 = _899 & 31;
    uint _905 = uint(int(uint(_899) >> uint(8)));
    int _907 = int(_905) & 31;
    float _909 = as_type<float>(gl_SubgroupInvocationID);
    int _911 = as_type<int>(_909) & _907;
    int _913 = ~_907;
    int _915 = _903 & _913;
    int _917 = _915 | _911;
    int _919 = as_type<int>(_909) ^ _898;
    bool _921 = uint(_919) <= uint(_917);
    _900 = _921 ? (-1) : 0;
    float _923 = spvSubgroupShuffle(as_type<float>(_897), uint(_919));
    uint _925 = uint(_921 ? as_type<int>(_923) : _897);
    return int(_925);
}

static inline __attribute__((always_inline))
int _59(thread const int& _973, thread const int& _974, thread const int& _975, thread int& _976, thread uint& gl_SubgroupInvocationID)
{
    int _979 = _975 & 31;
    uint _981 = uint(int(uint(_975) >> uint(8)));
    int _983 = int(_981) & 31;
    float _985 = as_type<float>(gl_SubgroupInvocationID);
    int _987 = as_type<int>(_985) & _983;
    int _989 = ~_983;
    int _991 = _979 & _989;
    int _993 = _991 | _987;
    int _995 = ~_983;
    int _997 = _974 & _995;
    int _999 = _997 | _987;
    bool _1001 = uint(_999) <= uint(_993);
    _976 = _1001 ? (-1) : 0;
    float _1003 = spvSubgroupShuffle(as_type<float>(_973), uint(_999));
    uint _1005 = uint(_1001 ? as_type<int>(_1003) : _973);
    return int(_1005);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _175 = false;
    float _63 = gl_FragCoord.w;
    float _65 = in.m_40.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_40.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _444 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = gl_FragCoord.x;
    float _96 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _98 = _94 / _96;
    float _100 = gl_FragCoord.y;
    float _102 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _104 = _100 / _102;
    float _106 = trunc(_98);
    int _108 = int(_106);
    float _110 = trunc(_104);
    int _112 = int(_110);
    float _114 = precise::max(_86, _88);
    float _116 = -_92;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _120 = precise::max(_90, _92);
    bool _124 = _92 != 1.0;
    bool _126 = isnan(_92);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = 1.0 / _118;
    float _136 = precise::max(_114, _120);
    uint _139 = spvSubgroupBallot(true).x;
    bool _141 = int(_139) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_136, _136, _136, _136), uint2(int2(_108, _112)));
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _145 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _143);
    int _147 = _132 ? as_type<int>(_145) : 1065353216;
    float _173;
    if (!_141)
    {
        int _149 = as_type<int>(_136);
        int _151 = 1;
        int _153 = 31;
        int _155;
        int _550 = _58(_149, _151, _153, _155, gl_SubgroupInvocationID);
        int _157 = _550;
        float _159 = precise::max(_136, as_type<float>(_157));
        int _161 = as_type<int>(_159);
        int _163 = 2;
        int _165 = 31;
        int _167;
        int _558 = _58(_161, _163, _165, _167, gl_SubgroupInvocationID);
        int _169 = _558;
        float _171 = precise::max(_159, as_type<float>(_169));
        _173 = _171;
        _175 = true;
    }
    else
    {
        float _177 = as_type<float>(gl_SubgroupInvocationID);
        uint _179 = spvSubgroupBallot(true).x;
        float _181 = as_type<float>(gl_SubgroupLtMask.x);
        int _183 = as_type<int>(_177) & (-4);
        uint _185 = min(uint(_183), 32u);
        bool _187 = int(_185) == 0;
        bool _189 = _185 < 32u;
        int _191 = 32 - int(_185);
        int _193 = int(_185) - 32;
        int _195 = 15 << int(_185);
        uint _197 = uint(int(uint(0) >> uint(_191)));
        int _199 = _195 | int(_197);
        int _201 = _187 ? 15 : _199;
        bool _203 = uint(_193) < 32u;
        int _205 = 0 << _193;
        int _207 = _203 ? _205 : 0;
        int _209 = _189 ? _201 : _207;
        int _211 = int(_179) & as_type<int>(_181);
        int _213 = _209 & _211;
        int _215 = _209 & int(_179);
        int _217 = int(spvFindUMSB(uint(_213)));
        int _219 = int(spvFindUMSB(uint(_215)));
        uint _221 = min(uint(_217), as_type<uint>(_177));
        int _223 = as_type<int>(_136);
        int _225 = int(_221);
        int _227 = 31;
        int _229;
        int _647 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _647;
        int _233 = int(_221);
        int _235 = int(_221);
        int _237 = 30;
        int _239;
        int _653 = _59(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _653;
        float _243 = precise::max(_136, as_type<float>(_231));
        int _245 = as_type<int>(_243);
        int _247 = _241;
        int _249 = 31;
        int _251;
        int _661 = _59(_245, _247, _249, _251, gl_SubgroupInvocationID);
        int _253 = _661;
        float _255 = precise::max(_243, as_type<float>(_253));
        int _257 = as_type<int>(_255);
        int _259 = _219;
        int _261 = 31;
        int _263;
        int _669 = _59(_257, _259, _261, _263, gl_SubgroupInvocationID);
        int _265 = _669;
        _173 = as_type<float>(_265);
    }
    _175 = false;
    float _267 = _173;
    float _269 = precise::min(_86, _88);
    float _271 = -_136;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _275 = precise::min(_90, _92);
    int _277 = _112 * 2;
    float _279 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _281 = precise::min(_269, _275);
    float _283 = 1.0 / _273;
    float _285 = as_type<float>(gl_SubgroupInvocationID);
    float _287 = _79 * _279;
    float _289 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _291 = -_281;
    float _293 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _295 = _136 >= 1.0;
    bool _297 = isnan(_136);
    bool _299 = _295 || _297;
    bool _301 = isnan(1.0);
    bool _303 = _299 || _301;
    int _305 = _108 & 1;
    float _307 = _81 * _289;
    float _309 = 1.0 / _293;
    bool _311 = _281 >= 1.0;
    bool _313 = isnan(_281);
    bool _315 = _311 || _313;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    int _321 = 2 & _277;
    int _323 = (-3) & _305;
    int _325 = _321 | _323;
    float _327 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _329 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _327);
    float _331 = trunc(_287);
    int _333 = int(_331);
    float _335 = _329 * 16777215.0;
    float _337 = trunc(_307);
    int _339 = int(_337);
    float _341 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _343 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[1].w, _341);
    float _345 = _343 * 16777215.0;
    int _347 = _339 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _349 = _347 + _333;
    bool _351 = !_303;
    float _353 = _351 ? _335 : 16777215.0;
    bool _355 = !_319;
    float _357 = _355 ? _345 : 16777215.0;
    int _359 = _349 * 4;
    int _361 = _359 + _325;
    int _363 = as_type<int>(_285) & 3;
    bool _365 = _363 != 0;
    float _367 = trunc(_353);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    int _373 = _361 * 4;
    int _375 = _373 + 9728;
    float _377 = trunc(_357);
    float _379 = precise::max(_377, 0.0);
    uint _381 = uint(_379);
    if (!_365)
    {
        int _383 = _108 >> 31;
        int _385 = _112 >> 31;
        int _387 = _383 & 1;
        int _389 = _385 & 1;
        int _391 = _108 + _387;
        int _393 = _112 + _389;
        int _395 = _391 >> 1;
        int _397 = _393 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_267, _267, _267, _267), uint2(int2(_395, _397)));
    }
    uint _399 = uint(int(uint(_373) >> uint(2)));
    uint _866 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_399)], _381, memory_order_relaxed);
    uint _401 = _866;
    bool _403 = !_303;
    int _405 = _403 ? as_type<int>(_329) : 1065353216;
    uint _407 = uint(int(uint(_375) >> uint(2)));
    uint _880 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_407)], _371, memory_order_relaxed);
    uint _409 = _880;
    out.m_50.x = as_type<float>(_147);
    out.m_50.y = as_type<float>(_147);
    out.m_50.z = as_type<float>(_147);
    out.m_50.w = as_type<float>(_147);
    out.m_52.x = as_type<float>(_405);
    return out;
}


struct main0_out_u
{
    uint4 m_50 [[color(0)]];
    uint4 m_52 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _175 = false;
    float _63 = gl_FragCoord.w;
    float _65 = in.m_40.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_40.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _444 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = gl_FragCoord.x;
    float _96 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _98 = _94 / _96;
    float _100 = gl_FragCoord.y;
    float _102 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _104 = _100 / _102;
    float _106 = trunc(_98);
    int _108 = int(_106);
    float _110 = trunc(_104);
    int _112 = int(_110);
    float _114 = precise::max(_86, _88);
    float _116 = -_92;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _120 = precise::max(_90, _92);
    bool _124 = _92 != 1.0;
    bool _126 = isnan(_92);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = 1.0 / _118;
    float _136 = precise::max(_114, _120);
    uint _139 = spvSubgroupBallot(true).x;
    bool _141 = int(_139) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_136, _136, _136, _136), uint2(int2(_108, _112)));
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _145 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _143);
    int _147 = _132 ? as_type<int>(_145) : 1065353216;
    float _173;
    if (!_141)
    {
        int _149 = as_type<int>(_136);
        int _151 = 1;
        int _153 = 31;
        int _155;
        int _550 = _58(_149, _151, _153, _155, gl_SubgroupInvocationID);
        int _157 = _550;
        float _159 = precise::max(_136, as_type<float>(_157));
        int _161 = as_type<int>(_159);
        int _163 = 2;
        int _165 = 31;
        int _167;
        int _558 = _58(_161, _163, _165, _167, gl_SubgroupInvocationID);
        int _169 = _558;
        float _171 = precise::max(_159, as_type<float>(_169));
        _173 = _171;
        _175 = true;
    }
    else
    {
        float _177 = as_type<float>(gl_SubgroupInvocationID);
        uint _179 = spvSubgroupBallot(true).x;
        float _181 = as_type<float>(gl_SubgroupLtMask.x);
        int _183 = as_type<int>(_177) & (-4);
        uint _185 = min(uint(_183), 32u);
        bool _187 = int(_185) == 0;
        bool _189 = _185 < 32u;
        int _191 = 32 - int(_185);
        int _193 = int(_185) - 32;
        int _195 = 15 << int(_185);
        uint _197 = uint(int(uint(0) >> uint(_191)));
        int _199 = _195 | int(_197);
        int _201 = _187 ? 15 : _199;
        bool _203 = uint(_193) < 32u;
        int _205 = 0 << _193;
        int _207 = _203 ? _205 : 0;
        int _209 = _189 ? _201 : _207;
        int _211 = int(_179) & as_type<int>(_181);
        int _213 = _209 & _211;
        int _215 = _209 & int(_179);
        int _217 = int(spvFindUMSB(uint(_213)));
        int _219 = int(spvFindUMSB(uint(_215)));
        uint _221 = min(uint(_217), as_type<uint>(_177));
        int _223 = as_type<int>(_136);
        int _225 = int(_221);
        int _227 = 31;
        int _229;
        int _647 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _647;
        int _233 = int(_221);
        int _235 = int(_221);
        int _237 = 30;
        int _239;
        int _653 = _59(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _653;
        float _243 = precise::max(_136, as_type<float>(_231));
        int _245 = as_type<int>(_243);
        int _247 = _241;
        int _249 = 31;
        int _251;
        int _661 = _59(_245, _247, _249, _251, gl_SubgroupInvocationID);
        int _253 = _661;
        float _255 = precise::max(_243, as_type<float>(_253));
        int _257 = as_type<int>(_255);
        int _259 = _219;
        int _261 = 31;
        int _263;
        int _669 = _59(_257, _259, _261, _263, gl_SubgroupInvocationID);
        int _265 = _669;
        _173 = as_type<float>(_265);
    }
    _175 = false;
    float _267 = _173;
    float _269 = precise::min(_86, _88);
    float _271 = -_136;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _275 = precise::min(_90, _92);
    int _277 = _112 * 2;
    float _279 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _281 = precise::min(_269, _275);
    float _283 = 1.0 / _273;
    float _285 = as_type<float>(gl_SubgroupInvocationID);
    float _287 = _79 * _279;
    float _289 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _291 = -_281;
    float _293 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _295 = _136 >= 1.0;
    bool _297 = isnan(_136);
    bool _299 = _295 || _297;
    bool _301 = isnan(1.0);
    bool _303 = _299 || _301;
    int _305 = _108 & 1;
    float _307 = _81 * _289;
    float _309 = 1.0 / _293;
    bool _311 = _281 >= 1.0;
    bool _313 = isnan(_281);
    bool _315 = _311 || _313;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    int _321 = 2 & _277;
    int _323 = (-3) & _305;
    int _325 = _321 | _323;
    float _327 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _329 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _327);
    float _331 = trunc(_287);
    int _333 = int(_331);
    float _335 = _329 * 16777215.0;
    float _337 = trunc(_307);
    int _339 = int(_337);
    float _341 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _343 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[1].w, _341);
    float _345 = _343 * 16777215.0;
    int _347 = _339 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _349 = _347 + _333;
    bool _351 = !_303;
    float _353 = _351 ? _335 : 16777215.0;
    bool _355 = !_319;
    float _357 = _355 ? _345 : 16777215.0;
    int _359 = _349 * 4;
    int _361 = _359 + _325;
    int _363 = as_type<int>(_285) & 3;
    bool _365 = _363 != 0;
    float _367 = trunc(_353);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    int _373 = _361 * 4;
    int _375 = _373 + 9728;
    float _377 = trunc(_357);
    float _379 = precise::max(_377, 0.0);
    uint _381 = uint(_379);
    if (!_365)
    {
        int _383 = _108 >> 31;
        int _385 = _112 >> 31;
        int _387 = _383 & 1;
        int _389 = _385 & 1;
        int _391 = _108 + _387;
        int _393 = _112 + _389;
        int _395 = _391 >> 1;
        int _397 = _393 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_267, _267, _267, _267), uint2(int2(_395, _397)));
    }
    uint _399 = uint(int(uint(_373) >> uint(2)));
    uint _866 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_399)], _381, memory_order_relaxed);
    uint _401 = _866;
    bool _403 = !_303;
    int _405 = _403 ? as_type<int>(_329) : 1065353216;
    uint _407 = uint(int(uint(_375) >> uint(2)));
    uint _880 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_407)], _371, memory_order_relaxed);
    uint _409 = _880;
    out.m_50.x = as_type<float>(_147);
    out.m_50.y = as_type<float>(_147);
    out.m_50.z = as_type<float>(_147);
    out.m_50.w = as_type<float>(_147);
    out.m_52.x = as_type<float>(_405);
    return main0_out_u{as_type<uint4>(out.m_50), as_type<uint4>(out.m_52)};
}

