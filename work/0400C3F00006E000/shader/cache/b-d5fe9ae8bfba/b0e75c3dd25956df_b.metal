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
int _58(thread const int& _855, thread const int& _856, thread const int& _857, thread int& _858, thread uint& gl_SubgroupInvocationID)
{
    int _861 = _857 & 31;
    uint _863 = uint(int(uint(_857) >> uint(8)));
    int _865 = int(_863) & 31;
    float _867 = as_type<float>(gl_SubgroupInvocationID);
    int _869 = as_type<int>(_867) & _865;
    int _871 = ~_865;
    int _873 = _861 & _871;
    int _875 = _873 | _869;
    int _877 = as_type<int>(_867) ^ _856;
    bool _879 = uint(_877) <= uint(_875);
    _858 = _879 ? (-1) : 0;
    float _881 = spvSubgroupShuffle(as_type<float>(_855), uint(_877));
    uint _883 = uint(_879 ? as_type<int>(_881) : _855);
    return int(_883);
}

static inline __attribute__((always_inline))
int _59(thread const int& _931, thread const int& _932, thread const int& _933, thread int& _934, thread uint& gl_SubgroupInvocationID)
{
    int _937 = _933 & 31;
    uint _939 = uint(int(uint(_933) >> uint(8)));
    int _941 = int(_939) & 31;
    float _943 = as_type<float>(gl_SubgroupInvocationID);
    int _945 = as_type<int>(_943) & _941;
    int _947 = ~_941;
    int _949 = _937 & _947;
    int _951 = _949 | _945;
    int _953 = ~_941;
    int _955 = _932 & _953;
    int _957 = _955 | _945;
    bool _959 = uint(_957) <= uint(_951);
    _934 = _959 ? (-1) : 0;
    float _961 = spvSubgroupShuffle(as_type<float>(_931), uint(_957));
    uint _963 = uint(_959 ? as_type<int>(_961) : _931);
    return int(_963);
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
    float2 _426 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), int2(0), component::x).xyzw;
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
        int _532 = _58(_149, _151, _153, _155, gl_SubgroupInvocationID);
        int _157 = _532;
        float _159 = precise::max(_136, as_type<float>(_157));
        int _161 = as_type<int>(_159);
        int _163 = 2;
        int _165 = 31;
        int _167;
        int _540 = _58(_161, _163, _165, _167, gl_SubgroupInvocationID);
        int _169 = _540;
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
        int _629 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _629;
        int _233 = int(_221);
        int _235 = int(_221);
        int _237 = 30;
        int _239;
        int _635 = _59(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _635;
        float _243 = precise::max(_136, as_type<float>(_231));
        int _245 = as_type<int>(_243);
        int _247 = _241;
        int _249 = 31;
        int _251;
        int _643 = _59(_245, _247, _249, _251, gl_SubgroupInvocationID);
        int _253 = _643;
        float _255 = precise::max(_243, as_type<float>(_253));
        int _257 = as_type<int>(_255);
        int _259 = _219;
        int _261 = 31;
        int _263;
        int _651 = _59(_257, _259, _261, _263, gl_SubgroupInvocationID);
        int _265 = _651;
        _173 = as_type<float>(_265);
    }
    _175 = false;
    float _267 = _173;
    float _269 = precise::min(_86, _88);
    float _271 = precise::min(_90, _92);
    float _273 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _275 = as_type<float>(gl_SubgroupInvocationID);
    float _277 = precise::min(_269, _271);
    int _279 = _112 * 2;
    float _281 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _283 = _79 * _273;
    bool _285 = _277 >= 1.0;
    bool _287 = isnan(_277);
    bool _289 = _285 || _287;
    bool _291 = isnan(1.0);
    bool _293 = _289 || _291;
    float _295 = -_277;
    float _297 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _299 = _81 * _281;
    float _301 = trunc(_283);
    int _303 = int(_301);
    float _305 = 1.0 / _297;
    float _307 = trunc(_299);
    int _309 = int(_307);
    float _311 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _313 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[1].w, _311);
    float _315 = _313 * 16777215.0;
    int _317 = _108 & 1;
    int _319 = _309 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _321 = _319 + _303;
    bool _323 = !_293;
    float _325 = _323 ? _315 : 16777215.0;
    int _327 = 2 & _279;
    int _329 = (-3) & _317;
    int _331 = _327 | _329;
    int _333 = as_type<int>(_275) & 3;
    bool _335 = _333 != 0;
    float _337 = trunc(_325);
    float _339 = precise::max(_337, 0.0);
    uint _341 = uint(_339);
    int _343 = _321 * 4;
    int _345 = _343 + _331;
    int _347 = _345 << 2;
    if (!_335)
    {
        int _349 = _108 >> 31;
        int _351 = _112 >> 31;
        int _353 = _349 & 1;
        int _355 = _351 & 1;
        int _357 = _108 + _353;
        int _359 = _112 + _355;
        int _361 = _357 >> 1;
        int _363 = _359 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_267, _267, _267, _267), uint2(int2(_361, _363)));
    }
    float _365 = -_136;
    float _367 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _369 = uint(int(uint(_347) >> uint(2)));
    uint _811 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_369)], _341, memory_order_relaxed);
    uint _371 = _811;
    bool _373 = _136 >= 1.0;
    bool _375 = isnan(_136);
    bool _377 = _373 || _375;
    bool _379 = isnan(1.0);
    bool _381 = _377 || _379;
    float _383 = 1.0 / _367;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _387 = fma(_383, (*spvDescriptorSet0.fp_c3)._m0[1].w, _385);
    bool _389 = !_381;
    int _391 = _389 ? as_type<int>(_387) : 1065353216;
    out.m_50.x = as_type<float>(_147);
    out.m_50.y = as_type<float>(_147);
    out.m_50.z = as_type<float>(_147);
    out.m_50.w = as_type<float>(_147);
    out.m_52.x = as_type<float>(_391);
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
    float2 _426 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), int2(0), component::x).xyzw;
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
        int _532 = _58(_149, _151, _153, _155, gl_SubgroupInvocationID);
        int _157 = _532;
        float _159 = precise::max(_136, as_type<float>(_157));
        int _161 = as_type<int>(_159);
        int _163 = 2;
        int _165 = 31;
        int _167;
        int _540 = _58(_161, _163, _165, _167, gl_SubgroupInvocationID);
        int _169 = _540;
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
        int _629 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _629;
        int _233 = int(_221);
        int _235 = int(_221);
        int _237 = 30;
        int _239;
        int _635 = _59(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _635;
        float _243 = precise::max(_136, as_type<float>(_231));
        int _245 = as_type<int>(_243);
        int _247 = _241;
        int _249 = 31;
        int _251;
        int _643 = _59(_245, _247, _249, _251, gl_SubgroupInvocationID);
        int _253 = _643;
        float _255 = precise::max(_243, as_type<float>(_253));
        int _257 = as_type<int>(_255);
        int _259 = _219;
        int _261 = 31;
        int _263;
        int _651 = _59(_257, _259, _261, _263, gl_SubgroupInvocationID);
        int _265 = _651;
        _173 = as_type<float>(_265);
    }
    _175 = false;
    float _267 = _173;
    float _269 = precise::min(_86, _88);
    float _271 = precise::min(_90, _92);
    float _273 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _275 = as_type<float>(gl_SubgroupInvocationID);
    float _277 = precise::min(_269, _271);
    int _279 = _112 * 2;
    float _281 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _283 = _79 * _273;
    bool _285 = _277 >= 1.0;
    bool _287 = isnan(_277);
    bool _289 = _285 || _287;
    bool _291 = isnan(1.0);
    bool _293 = _289 || _291;
    float _295 = -_277;
    float _297 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _299 = _81 * _281;
    float _301 = trunc(_283);
    int _303 = int(_301);
    float _305 = 1.0 / _297;
    float _307 = trunc(_299);
    int _309 = int(_307);
    float _311 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _313 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[1].w, _311);
    float _315 = _313 * 16777215.0;
    int _317 = _108 & 1;
    int _319 = _309 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _321 = _319 + _303;
    bool _323 = !_293;
    float _325 = _323 ? _315 : 16777215.0;
    int _327 = 2 & _279;
    int _329 = (-3) & _317;
    int _331 = _327 | _329;
    int _333 = as_type<int>(_275) & 3;
    bool _335 = _333 != 0;
    float _337 = trunc(_325);
    float _339 = precise::max(_337, 0.0);
    uint _341 = uint(_339);
    int _343 = _321 * 4;
    int _345 = _343 + _331;
    int _347 = _345 << 2;
    if (!_335)
    {
        int _349 = _108 >> 31;
        int _351 = _112 >> 31;
        int _353 = _349 & 1;
        int _355 = _351 & 1;
        int _357 = _108 + _353;
        int _359 = _112 + _355;
        int _361 = _357 >> 1;
        int _363 = _359 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_267, _267, _267, _267), uint2(int2(_361, _363)));
    }
    float _365 = -_136;
    float _367 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _369 = uint(int(uint(_347) >> uint(2)));
    uint _811 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_369)], _341, memory_order_relaxed);
    uint _371 = _811;
    bool _373 = _136 >= 1.0;
    bool _375 = isnan(_136);
    bool _377 = _373 || _375;
    bool _379 = isnan(1.0);
    bool _381 = _377 || _379;
    float _383 = 1.0 / _367;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _387 = fma(_383, (*spvDescriptorSet0.fp_c3)._m0[1].w, _385);
    bool _389 = !_381;
    int _391 = _389 ? as_type<int>(_387) : 1065353216;
    out.m_50.x = as_type<float>(_147);
    out.m_50.y = as_type<float>(_147);
    out.m_50.z = as_type<float>(_147);
    out.m_50.w = as_type<float>(_147);
    out.m_52.x = as_type<float>(_391);
    return main0_out_u{as_type<uint4>(out.m_50), as_type<uint4>(out.m_52)};
}

