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
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _783, thread const int& _784, thread const int& _785, thread int& _786, thread uint& gl_SubgroupInvocationID)
{
    int _789 = _785 & 31;
    uint _791 = uint(int(uint(_785) >> uint(8)));
    int _793 = int(_791) & 31;
    float _795 = as_type<float>(gl_SubgroupInvocationID);
    int _797 = as_type<int>(_795) & _793;
    int _799 = ~_793;
    int _801 = _789 & _799;
    int _803 = _801 | _797;
    int _805 = as_type<int>(_795) ^ _784;
    bool _807 = uint(_805) <= uint(_803);
    _786 = _807 ? (-1) : 0;
    float _809 = spvSubgroupShuffle(as_type<float>(_783), uint(_805));
    uint _811 = uint(_807 ? as_type<int>(_809) : _783);
    return int(_811);
}

static inline __attribute__((always_inline))
int _57(thread const int& _859, thread const int& _860, thread const int& _861, thread int& _862, thread uint& gl_SubgroupInvocationID)
{
    int _865 = _861 & 31;
    uint _867 = uint(int(uint(_861) >> uint(8)));
    int _869 = int(_867) & 31;
    float _871 = as_type<float>(gl_SubgroupInvocationID);
    int _873 = as_type<int>(_871) & _869;
    int _875 = ~_869;
    int _877 = _865 & _875;
    int _879 = _877 | _873;
    int _881 = ~_869;
    int _883 = _860 & _881;
    int _885 = _883 | _873;
    bool _887 = uint(_885) <= uint(_879);
    _862 = _887 ? (-1) : 0;
    float _889 = spvSubgroupShuffle(as_type<float>(_859), uint(_885));
    uint _891 = uint(_887 ? as_type<int>(_889) : _859);
    return int(_891);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _173 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_40.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_40.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _396 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = -_90;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _118 = precise::max(_88, _90);
    bool _122 = _90 != 1.0;
    bool _124 = isnan(_90);
    bool _126 = _122 || _124;
    bool _128 = isnan(1.0);
    bool _130 = _126 || _128;
    float _132 = precise::max(_112, _118);
    float _134 = 1.0 / _116;
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_132, _132, _132, _132), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_132);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _502 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _502;
        float _157 = precise::max(_132, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _510 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _510;
        float _169 = precise::max(_157, as_type<float>(_167));
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = as_type<float>(gl_SubgroupInvocationID);
        uint _177 = spvSubgroupBallot(true).x;
        float _179 = as_type<float>(gl_SubgroupLtMask.x);
        int _181 = as_type<int>(_175) & (-4);
        uint _183 = min(uint(_181), 32u);
        bool _185 = int(_183) == 0;
        bool _187 = _183 < 32u;
        int _189 = 32 - int(_183);
        int _191 = int(_183) - 32;
        int _193 = 15 << int(_183);
        uint _195 = uint(int(uint(0) >> uint(_189)));
        int _197 = _193 | int(_195);
        int _199 = _185 ? 15 : _197;
        bool _201 = uint(_191) < 32u;
        int _203 = 0 << _191;
        int _205 = _201 ? _203 : 0;
        int _207 = _187 ? _199 : _205;
        int _209 = int(_177) & as_type<int>(_179);
        int _211 = _207 & _209;
        int _213 = _207 & int(_177);
        int _215 = int(spvFindUMSB(uint(_211)));
        int _217 = int(spvFindUMSB(uint(_213)));
        uint _219 = min(uint(_215), as_type<uint>(_175));
        int _221 = as_type<int>(_132);
        int _223 = int(_219);
        int _225 = 31;
        int _227;
        int _599 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _599;
        int _231 = int(_219);
        int _233 = int(_219);
        int _235 = 30;
        int _237;
        int _605 = _57(_231, _233, _235, _237, gl_SubgroupInvocationID);
        int _239 = _605;
        float _241 = precise::max(_132, as_type<float>(_229));
        int _243 = as_type<int>(_241);
        int _245 = _239;
        int _247 = 31;
        int _249;
        int _613 = _57(_243, _245, _247, _249, gl_SubgroupInvocationID);
        int _251 = _613;
        float _253 = precise::max(_241, as_type<float>(_251));
        int _255 = as_type<int>(_253);
        int _257 = _217;
        int _259 = 31;
        int _261;
        int _621 = _57(_255, _257, _259, _261, gl_SubgroupInvocationID);
        int _263 = _621;
        _171 = as_type<float>(_263);
    }
    _173 = false;
    float _265 = _171;
    float _267 = -_132;
    float _269 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _271 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _273 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _275 = 1.0 / _269;
    bool _277 = _132 >= 1.0;
    bool _279 = isnan(_132);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = _77 * _271;
    int _289 = _110 * 2;
    float _291 = _79 * _273;
    float _293 = as_type<float>(gl_SubgroupInvocationID);
    float _295 = trunc(_287);
    int _297 = int(_295);
    float _299 = trunc(_291);
    int _301 = int(_299);
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _305 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[1].w, _303);
    int _307 = _106 & 1;
    float _309 = _305 * 16777215.0;
    int _311 = 2 & _289;
    int _313 = (-3) & _307;
    int _315 = _311 | _313;
    bool _317 = !_285;
    float _319 = _317 ? _309 : 16777215.0;
    int _321 = as_type<int>(_293) & 3;
    bool _323 = _321 != 0;
    float _325 = trunc(_319);
    float _327 = precise::max(_325, 0.0);
    uint _329 = uint(_327);
    int _331 = _301 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _333 = _331 + _297;
    int _335 = _333 * 4;
    int _337 = _335 + _315;
    int _339 = _337 << 2;
    int _341 = _339 + 9728;
    if (!_323)
    {
        int _343 = _106 >> 31;
        int _345 = _110 >> 31;
        int _347 = _343 & 1;
        int _349 = _345 & 1;
        int _351 = _106 + _347;
        int _353 = _110 + _349;
        int _355 = _351 >> 1;
        int _357 = _353 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_265, _265, _265, _265), uint2(int2(_355, _357)));
    }
    uint _359 = uint(int(uint(_341) >> uint(2)));
    uint _769 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_359)], _329, memory_order_relaxed);
    uint _361 = _769;
    out.m_50.x = as_type<float>(_145);
    out.m_50.y = as_type<float>(_145);
    out.m_50.z = as_type<float>(_145);
    out.m_50.w = as_type<float>(_145);
    return out;
}


struct main0_out_u
{
    uint4 m_50 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _173 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_40.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_40.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _396 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = -_90;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _118 = precise::max(_88, _90);
    bool _122 = _90 != 1.0;
    bool _124 = isnan(_90);
    bool _126 = _122 || _124;
    bool _128 = isnan(1.0);
    bool _130 = _126 || _128;
    float _132 = precise::max(_112, _118);
    float _134 = 1.0 / _116;
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_132, _132, _132, _132), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_132);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _502 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _502;
        float _157 = precise::max(_132, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _510 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _510;
        float _169 = precise::max(_157, as_type<float>(_167));
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = as_type<float>(gl_SubgroupInvocationID);
        uint _177 = spvSubgroupBallot(true).x;
        float _179 = as_type<float>(gl_SubgroupLtMask.x);
        int _181 = as_type<int>(_175) & (-4);
        uint _183 = min(uint(_181), 32u);
        bool _185 = int(_183) == 0;
        bool _187 = _183 < 32u;
        int _189 = 32 - int(_183);
        int _191 = int(_183) - 32;
        int _193 = 15 << int(_183);
        uint _195 = uint(int(uint(0) >> uint(_189)));
        int _197 = _193 | int(_195);
        int _199 = _185 ? 15 : _197;
        bool _201 = uint(_191) < 32u;
        int _203 = 0 << _191;
        int _205 = _201 ? _203 : 0;
        int _207 = _187 ? _199 : _205;
        int _209 = int(_177) & as_type<int>(_179);
        int _211 = _207 & _209;
        int _213 = _207 & int(_177);
        int _215 = int(spvFindUMSB(uint(_211)));
        int _217 = int(spvFindUMSB(uint(_213)));
        uint _219 = min(uint(_215), as_type<uint>(_175));
        int _221 = as_type<int>(_132);
        int _223 = int(_219);
        int _225 = 31;
        int _227;
        int _599 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _599;
        int _231 = int(_219);
        int _233 = int(_219);
        int _235 = 30;
        int _237;
        int _605 = _57(_231, _233, _235, _237, gl_SubgroupInvocationID);
        int _239 = _605;
        float _241 = precise::max(_132, as_type<float>(_229));
        int _243 = as_type<int>(_241);
        int _245 = _239;
        int _247 = 31;
        int _249;
        int _613 = _57(_243, _245, _247, _249, gl_SubgroupInvocationID);
        int _251 = _613;
        float _253 = precise::max(_241, as_type<float>(_251));
        int _255 = as_type<int>(_253);
        int _257 = _217;
        int _259 = 31;
        int _261;
        int _621 = _57(_255, _257, _259, _261, gl_SubgroupInvocationID);
        int _263 = _621;
        _171 = as_type<float>(_263);
    }
    _173 = false;
    float _265 = _171;
    float _267 = -_132;
    float _269 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _271 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _273 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _275 = 1.0 / _269;
    bool _277 = _132 >= 1.0;
    bool _279 = isnan(_132);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = _77 * _271;
    int _289 = _110 * 2;
    float _291 = _79 * _273;
    float _293 = as_type<float>(gl_SubgroupInvocationID);
    float _295 = trunc(_287);
    int _297 = int(_295);
    float _299 = trunc(_291);
    int _301 = int(_299);
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _305 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[1].w, _303);
    int _307 = _106 & 1;
    float _309 = _305 * 16777215.0;
    int _311 = 2 & _289;
    int _313 = (-3) & _307;
    int _315 = _311 | _313;
    bool _317 = !_285;
    float _319 = _317 ? _309 : 16777215.0;
    int _321 = as_type<int>(_293) & 3;
    bool _323 = _321 != 0;
    float _325 = trunc(_319);
    float _327 = precise::max(_325, 0.0);
    uint _329 = uint(_327);
    int _331 = _301 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _333 = _331 + _297;
    int _335 = _333 * 4;
    int _337 = _335 + _315;
    int _339 = _337 << 2;
    int _341 = _339 + 9728;
    if (!_323)
    {
        int _343 = _106 >> 31;
        int _345 = _110 >> 31;
        int _347 = _343 & 1;
        int _349 = _345 & 1;
        int _351 = _106 + _347;
        int _353 = _110 + _349;
        int _355 = _351 >> 1;
        int _357 = _353 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_265, _265, _265, _265), uint2(int2(_355, _357)));
    }
    uint _359 = uint(int(uint(_341) >> uint(2)));
    uint _769 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_359)], _329, memory_order_relaxed);
    uint _361 = _769;
    out.m_50.x = as_type<float>(_145);
    out.m_50.y = as_type<float>(_145);
    out.m_50.z = as_type<float>(_145);
    out.m_50.w = as_type<float>(_145);
    return main0_out_u{as_type<uint4>(out.m_50)};
}

