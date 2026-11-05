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
int _58(thread const int& _840, thread const int& _841, thread const int& _842, thread int& _843, thread uint& gl_SubgroupInvocationID)
{
    int _846 = _842 & 31;
    uint _848 = uint(int(uint(_842) >> uint(8)));
    int _850 = int(_848) & 31;
    float _852 = as_type<float>(gl_SubgroupInvocationID);
    int _854 = as_type<int>(_852) & _850;
    int _856 = ~_850;
    int _858 = _846 & _856;
    int _860 = _858 | _854;
    int _862 = as_type<int>(_852) ^ _841;
    bool _864 = uint(_862) <= uint(_860);
    _843 = _864 ? (-1) : 0;
    float _866 = spvSubgroupShuffle(as_type<float>(_840), uint(_862));
    uint _868 = uint(_864 ? as_type<int>(_866) : _840);
    return int(_868);
}

static inline __attribute__((always_inline))
int _59(thread const int& _916, thread const int& _917, thread const int& _918, thread int& _919, thread uint& gl_SubgroupInvocationID)
{
    int _922 = _918 & 31;
    uint _924 = uint(int(uint(_918) >> uint(8)));
    int _926 = int(_924) & 31;
    float _928 = as_type<float>(gl_SubgroupInvocationID);
    int _930 = as_type<int>(_928) & _926;
    int _932 = ~_926;
    int _934 = _922 & _932;
    int _936 = _934 | _930;
    int _938 = ~_926;
    int _940 = _917 & _938;
    int _942 = _940 | _930;
    bool _944 = uint(_942) <= uint(_936);
    _919 = _944 ? (-1) : 0;
    float _946 = spvSubgroupShuffle(as_type<float>(_916), uint(_942));
    uint _948 = uint(_944 ? as_type<int>(_946) : _916);
    return int(_948);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _153 = false;
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
    float2 _422 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), int2(0), component::x).xyzw;
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
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = trunc(_98);
    int _115 = int(_113);
    float _117 = trunc(_104);
    int _119 = int(_117);
    float _121 = precise::max(_86, _88);
    float _123 = precise::max(_90, _92);
    float _125 = precise::max(_121, _123);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_125, _125, _125, _125), uint2(int2(_115, _119)));
    float _151;
    if (!_111)
    {
        int _127 = as_type<int>(_125);
        int _129 = 1;
        int _131 = 31;
        int _133;
        int _496 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _496;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _504 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _504;
        float _149 = precise::max(_137, as_type<float>(_147));
        _151 = _149;
        _153 = true;
    }
    else
    {
        float _155 = as_type<float>(gl_SubgroupInvocationID);
        uint _157 = spvSubgroupBallot(true).x;
        float _159 = as_type<float>(gl_SubgroupLtMask.x);
        int _161 = as_type<int>(_155) & (-4);
        uint _163 = min(uint(_161), 32u);
        bool _165 = int(_163) == 0;
        bool _167 = _163 < 32u;
        int _169 = 32 - int(_163);
        int _171 = int(_163) - 32;
        int _173 = 15 << int(_163);
        uint _175 = uint(int(uint(0) >> uint(_169)));
        int _177 = _173 | int(_175);
        int _179 = _165 ? 15 : _177;
        bool _181 = uint(_171) < 32u;
        int _183 = 0 << _171;
        int _185 = _181 ? _183 : 0;
        int _187 = _167 ? _179 : _185;
        int _189 = int(_157) & as_type<int>(_159);
        int _191 = _187 & _189;
        int _193 = _187 & int(_157);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_155));
        int _201 = as_type<int>(_125);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _593 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _593;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _599 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _599;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _607 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _607;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _615 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _615;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _255 = -_125;
    float _257 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _259 = precise::min(_247, _249);
    float _261 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _263 = _81 * _253;
    bool _265 = _125 >= 1.0;
    bool _267 = isnan(_125);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = -_259;
    float _277 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _279 = 1.0 / _257;
    float _281 = _79 * _261;
    int _283 = _119 * 2;
    bool _285 = _259 >= 1.0;
    bool _287 = isnan(_259);
    bool _289 = _285 || _287;
    bool _291 = isnan(1.0);
    bool _293 = _289 || _291;
    float _295 = 1.0 / _277;
    float _297 = trunc(_281);
    int _299 = int(_297);
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _303 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[1].w, _301);
    int _305 = _115 & 1;
    float _307 = _303 * 16777215.0;
    float _309 = trunc(_263);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _315 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[1].w, _313);
    int _317 = 2 & _283;
    int _319 = (-3) & _305;
    int _321 = _317 | _319;
    float _323 = _315 * 16777215.0;
    bool _325 = !_293;
    float _327 = _325 ? _323 : 16777215.0;
    int _329 = as_type<int>(_251) & 3;
    bool _331 = _329 != 0;
    int _333 = _311 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _335 = _333 + _299;
    bool _337 = !_273;
    float _339 = _337 ? _307 : 16777215.0;
    float _341 = trunc(_327);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = _335 * 4;
    int _349 = _347 + _321;
    int _351 = _349 * 4;
    float _353 = trunc(_339);
    float _355 = precise::max(_353, 0.0);
    uint _357 = uint(_355);
    int _359 = _351 + 9728;
    if (!_331)
    {
        int _361 = _115 >> 31;
        int _363 = _119 >> 31;
        int _365 = _361 & 1;
        int _367 = _363 & 1;
        int _369 = _115 + _365;
        int _371 = _119 + _367;
        int _373 = _369 >> 1;
        int _375 = _371 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_373, _375)));
    }
    uint _377 = uint(int(uint(_351) >> uint(2)));
    uint _812 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_377)], _345, memory_order_relaxed);
    uint _379 = _812;
    bool _381 = !_273;
    int _383 = _381 ? as_type<int>(_303) : 1065353216;
    uint _385 = uint(int(uint(_359) >> uint(2)));
    uint _827 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_385)], _357, memory_order_relaxed);
    uint _387 = _827;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_383);
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
    bool _153 = false;
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
    float2 _422 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), int2(0), component::x).xyzw;
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
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = trunc(_98);
    int _115 = int(_113);
    float _117 = trunc(_104);
    int _119 = int(_117);
    float _121 = precise::max(_86, _88);
    float _123 = precise::max(_90, _92);
    float _125 = precise::max(_121, _123);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_125, _125, _125, _125), uint2(int2(_115, _119)));
    float _151;
    if (!_111)
    {
        int _127 = as_type<int>(_125);
        int _129 = 1;
        int _131 = 31;
        int _133;
        int _496 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _496;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _504 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _504;
        float _149 = precise::max(_137, as_type<float>(_147));
        _151 = _149;
        _153 = true;
    }
    else
    {
        float _155 = as_type<float>(gl_SubgroupInvocationID);
        uint _157 = spvSubgroupBallot(true).x;
        float _159 = as_type<float>(gl_SubgroupLtMask.x);
        int _161 = as_type<int>(_155) & (-4);
        uint _163 = min(uint(_161), 32u);
        bool _165 = int(_163) == 0;
        bool _167 = _163 < 32u;
        int _169 = 32 - int(_163);
        int _171 = int(_163) - 32;
        int _173 = 15 << int(_163);
        uint _175 = uint(int(uint(0) >> uint(_169)));
        int _177 = _173 | int(_175);
        int _179 = _165 ? 15 : _177;
        bool _181 = uint(_171) < 32u;
        int _183 = 0 << _171;
        int _185 = _181 ? _183 : 0;
        int _187 = _167 ? _179 : _185;
        int _189 = int(_157) & as_type<int>(_159);
        int _191 = _187 & _189;
        int _193 = _187 & int(_157);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_155));
        int _201 = as_type<int>(_125);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _593 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _593;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _599 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _599;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _607 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _607;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _615 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _615;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _255 = -_125;
    float _257 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _259 = precise::min(_247, _249);
    float _261 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _263 = _81 * _253;
    bool _265 = _125 >= 1.0;
    bool _267 = isnan(_125);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = -_259;
    float _277 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _279 = 1.0 / _257;
    float _281 = _79 * _261;
    int _283 = _119 * 2;
    bool _285 = _259 >= 1.0;
    bool _287 = isnan(_259);
    bool _289 = _285 || _287;
    bool _291 = isnan(1.0);
    bool _293 = _289 || _291;
    float _295 = 1.0 / _277;
    float _297 = trunc(_281);
    int _299 = int(_297);
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _303 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[1].w, _301);
    int _305 = _115 & 1;
    float _307 = _303 * 16777215.0;
    float _309 = trunc(_263);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _315 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[1].w, _313);
    int _317 = 2 & _283;
    int _319 = (-3) & _305;
    int _321 = _317 | _319;
    float _323 = _315 * 16777215.0;
    bool _325 = !_293;
    float _327 = _325 ? _323 : 16777215.0;
    int _329 = as_type<int>(_251) & 3;
    bool _331 = _329 != 0;
    int _333 = _311 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _335 = _333 + _299;
    bool _337 = !_273;
    float _339 = _337 ? _307 : 16777215.0;
    float _341 = trunc(_327);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = _335 * 4;
    int _349 = _347 + _321;
    int _351 = _349 * 4;
    float _353 = trunc(_339);
    float _355 = precise::max(_353, 0.0);
    uint _357 = uint(_355);
    int _359 = _351 + 9728;
    if (!_331)
    {
        int _361 = _115 >> 31;
        int _363 = _119 >> 31;
        int _365 = _361 & 1;
        int _367 = _363 & 1;
        int _369 = _115 + _365;
        int _371 = _119 + _367;
        int _373 = _369 >> 1;
        int _375 = _371 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_373, _375)));
    }
    uint _377 = uint(int(uint(_351) >> uint(2)));
    uint _812 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_377)], _345, memory_order_relaxed);
    uint _379 = _812;
    bool _381 = !_273;
    int _383 = _381 ? as_type<int>(_303) : 1065353216;
    uint _385 = uint(int(uint(_359) >> uint(2)));
    uint _827 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_385)], _357, memory_order_relaxed);
    uint _387 = _827;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_383);
    return main0_out_u{as_type<uint4>(out.m_50), as_type<uint4>(out.m_52)};
}


struct main0_out_m
{
    float4 m_50 [[color(0)]];
    uint4 m_52 [[color(2)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _153 = false;
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
    float2 _422 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), int2(0), component::x).xyzw;
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
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = trunc(_98);
    int _115 = int(_113);
    float _117 = trunc(_104);
    int _119 = int(_117);
    float _121 = precise::max(_86, _88);
    float _123 = precise::max(_90, _92);
    float _125 = precise::max(_121, _123);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_125, _125, _125, _125), uint2(int2(_115, _119)));
    float _151;
    if (!_111)
    {
        int _127 = as_type<int>(_125);
        int _129 = 1;
        int _131 = 31;
        int _133;
        int _496 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _496;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _504 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _504;
        float _149 = precise::max(_137, as_type<float>(_147));
        _151 = _149;
        _153 = true;
    }
    else
    {
        float _155 = as_type<float>(gl_SubgroupInvocationID);
        uint _157 = spvSubgroupBallot(true).x;
        float _159 = as_type<float>(gl_SubgroupLtMask.x);
        int _161 = as_type<int>(_155) & (-4);
        uint _163 = min(uint(_161), 32u);
        bool _165 = int(_163) == 0;
        bool _167 = _163 < 32u;
        int _169 = 32 - int(_163);
        int _171 = int(_163) - 32;
        int _173 = 15 << int(_163);
        uint _175 = uint(int(uint(0) >> uint(_169)));
        int _177 = _173 | int(_175);
        int _179 = _165 ? 15 : _177;
        bool _181 = uint(_171) < 32u;
        int _183 = 0 << _171;
        int _185 = _181 ? _183 : 0;
        int _187 = _167 ? _179 : _185;
        int _189 = int(_157) & as_type<int>(_159);
        int _191 = _187 & _189;
        int _193 = _187 & int(_157);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_155));
        int _201 = as_type<int>(_125);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _593 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _593;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _599 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _599;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _607 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _607;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _615 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _615;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _255 = -_125;
    float _257 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _259 = precise::min(_247, _249);
    float _261 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _263 = _81 * _253;
    bool _265 = _125 >= 1.0;
    bool _267 = isnan(_125);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = -_259;
    float _277 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _279 = 1.0 / _257;
    float _281 = _79 * _261;
    int _283 = _119 * 2;
    bool _285 = _259 >= 1.0;
    bool _287 = isnan(_259);
    bool _289 = _285 || _287;
    bool _291 = isnan(1.0);
    bool _293 = _289 || _291;
    float _295 = 1.0 / _277;
    float _297 = trunc(_281);
    int _299 = int(_297);
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _303 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[1].w, _301);
    int _305 = _115 & 1;
    float _307 = _303 * 16777215.0;
    float _309 = trunc(_263);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _315 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[1].w, _313);
    int _317 = 2 & _283;
    int _319 = (-3) & _305;
    int _321 = _317 | _319;
    float _323 = _315 * 16777215.0;
    bool _325 = !_293;
    float _327 = _325 ? _323 : 16777215.0;
    int _329 = as_type<int>(_251) & 3;
    bool _331 = _329 != 0;
    int _333 = _311 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _335 = _333 + _299;
    bool _337 = !_273;
    float _339 = _337 ? _307 : 16777215.0;
    float _341 = trunc(_327);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = _335 * 4;
    int _349 = _347 + _321;
    int _351 = _349 * 4;
    float _353 = trunc(_339);
    float _355 = precise::max(_353, 0.0);
    uint _357 = uint(_355);
    int _359 = _351 + 9728;
    if (!_331)
    {
        int _361 = _115 >> 31;
        int _363 = _119 >> 31;
        int _365 = _361 & 1;
        int _367 = _363 & 1;
        int _369 = _115 + _365;
        int _371 = _119 + _367;
        int _373 = _369 >> 1;
        int _375 = _371 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_373, _375)));
    }
    uint _377 = uint(int(uint(_351) >> uint(2)));
    uint _812 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_377)], _345, memory_order_relaxed);
    uint _379 = _812;
    bool _381 = !_273;
    int _383 = _381 ? as_type<int>(_303) : 1065353216;
    uint _385 = uint(int(uint(_359) >> uint(2)));
    uint _827 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_385)], _357, memory_order_relaxed);
    uint _387 = _827;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_383);
    return main0_out_m{out.m_50, as_type<uint4>(out.m_52)};
}

