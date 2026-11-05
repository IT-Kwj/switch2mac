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
int _56(thread const int& _882, thread const int& _883, thread const int& _884, thread int& _885, thread uint& gl_SubgroupInvocationID)
{
    int _888 = _884 & 31;
    uint _890 = uint(int(uint(_884) >> uint(8)));
    int _892 = int(_890) & 31;
    float _894 = as_type<float>(gl_SubgroupInvocationID);
    int _896 = as_type<int>(_894) & _892;
    int _898 = ~_892;
    int _900 = _888 & _898;
    int _902 = _900 | _896;
    int _904 = as_type<int>(_894) ^ _883;
    bool _906 = uint(_904) <= uint(_902);
    _885 = _906 ? (-1) : 0;
    float _908 = spvSubgroupShuffle(as_type<float>(_882), uint(_904));
    uint _910 = uint(_906 ? as_type<int>(_908) : _882);
    return int(_910);
}

static inline __attribute__((always_inline))
int _57(thread const int& _958, thread const int& _959, thread const int& _960, thread int& _961, thread uint& gl_SubgroupInvocationID)
{
    int _964 = _960 & 31;
    uint _966 = uint(int(uint(_960) >> uint(8)));
    int _968 = int(_966) & 31;
    float _970 = as_type<float>(gl_SubgroupInvocationID);
    int _972 = as_type<int>(_970) & _968;
    int _974 = ~_968;
    int _976 = _964 & _974;
    int _978 = _976 | _972;
    int _980 = ~_968;
    int _982 = _959 & _980;
    int _984 = _982 | _972;
    bool _986 = uint(_984) <= uint(_978);
    _961 = _986 ? (-1) : 0;
    float _988 = spvSubgroupShuffle(as_type<float>(_958), uint(_984));
    uint _990 = uint(_986 ? as_type<int>(_988) : _958);
    return int(_990);
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
    float2 _438 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438)), int2(0), component::x).xyzw;
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
    float _132 = 1.0 / _116;
    float _134 = precise::max(_112, _118);
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_134, _134, _134, _134), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_134);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _544 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _544;
        float _157 = precise::max(_134, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _552 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _552;
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
        int _221 = as_type<int>(_134);
        int _223 = int(_219);
        int _225 = 31;
        int _227;
        int _641 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _641;
        int _231 = int(_219);
        int _233 = int(_219);
        int _235 = 30;
        int _237;
        int _647 = _57(_231, _233, _235, _237, gl_SubgroupInvocationID);
        int _239 = _647;
        float _241 = precise::max(_134, as_type<float>(_229));
        int _243 = as_type<int>(_241);
        int _245 = _239;
        int _247 = 31;
        int _249;
        int _655 = _57(_243, _245, _247, _249, gl_SubgroupInvocationID);
        int _251 = _655;
        float _253 = precise::max(_241, as_type<float>(_251));
        int _255 = as_type<int>(_253);
        int _257 = _217;
        int _259 = 31;
        int _261;
        int _663 = _57(_255, _257, _259, _261, gl_SubgroupInvocationID);
        int _263 = _663;
        _171 = as_type<float>(_263);
    }
    _173 = false;
    float _265 = _171;
    float _267 = precise::min(_84, _86);
    float _269 = -_134;
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _273 = precise::min(_88, _90);
    float _275 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _277 = 1.0 / _271;
    float _279 = precise::min(_267, _273);
    float _281 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _283 = _77 * _275;
    float _285 = as_type<float>(gl_SubgroupInvocationID);
    float _287 = -_279;
    float _289 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _291 = _134 >= 1.0;
    bool _293 = isnan(_134);
    bool _295 = _291 || _293;
    bool _297 = isnan(1.0);
    bool _299 = _295 || _297;
    float _301 = _79 * _281;
    int _303 = _110 * 2;
    float _305 = 1.0 / _289;
    int _307 = _106 & 1;
    int _309 = 2 & _303;
    int _311 = (-3) & _307;
    int _313 = _309 | _311;
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _317 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[1].w, _315);
    float _319 = trunc(_283);
    int _321 = int(_319);
    float _323 = _317 * 16777215.0;
    bool _325 = !_299;
    float _327 = _325 ? _323 : 16777215.0;
    float _329 = trunc(_301);
    int _331 = int(_329);
    float _333 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _335 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[1].w, _333);
    bool _337 = _279 >= 1.0;
    bool _339 = isnan(_279);
    bool _341 = _337 || _339;
    bool _343 = isnan(1.0);
    bool _345 = _341 || _343;
    float _347 = _335 * 16777215.0;
    float _349 = trunc(_327);
    float _351 = precise::max(_349, 0.0);
    uint _353 = uint(_351);
    bool _355 = !_345;
    float _357 = _355 ? _347 : 16777215.0;
    int _359 = as_type<int>(_285) & 3;
    bool _361 = _359 != 0;
    int _363 = _331 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _365 = _363 + _321;
    float _367 = trunc(_357);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    int _373 = _365 * 4;
    int _375 = _373 + _313;
    int _377 = _375 * 4;
    int _379 = _377 + 9728;
    if (!_361)
    {
        int _381 = _106 >> 31;
        int _383 = _110 >> 31;
        int _385 = _381 & 1;
        int _387 = _383 & 1;
        int _389 = _106 + _385;
        int _391 = _110 + _387;
        int _393 = _389 >> 1;
        int _395 = _391 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_265, _265, _265, _265), uint2(int2(_393, _395)));
    }
    uint _397 = uint(int(uint(_377) >> uint(2)));
    uint _860 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_397)], _371, memory_order_relaxed);
    uint _399 = _860;
    uint _401 = uint(int(uint(_379) >> uint(2)));
    uint _868 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_401)], _353, memory_order_relaxed);
    uint _403 = _868;
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
    float2 _438 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438)), int2(0), component::x).xyzw;
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
    float _132 = 1.0 / _116;
    float _134 = precise::max(_112, _118);
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_134, _134, _134, _134), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_134);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _544 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _544;
        float _157 = precise::max(_134, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _552 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _552;
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
        int _221 = as_type<int>(_134);
        int _223 = int(_219);
        int _225 = 31;
        int _227;
        int _641 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _641;
        int _231 = int(_219);
        int _233 = int(_219);
        int _235 = 30;
        int _237;
        int _647 = _57(_231, _233, _235, _237, gl_SubgroupInvocationID);
        int _239 = _647;
        float _241 = precise::max(_134, as_type<float>(_229));
        int _243 = as_type<int>(_241);
        int _245 = _239;
        int _247 = 31;
        int _249;
        int _655 = _57(_243, _245, _247, _249, gl_SubgroupInvocationID);
        int _251 = _655;
        float _253 = precise::max(_241, as_type<float>(_251));
        int _255 = as_type<int>(_253);
        int _257 = _217;
        int _259 = 31;
        int _261;
        int _663 = _57(_255, _257, _259, _261, gl_SubgroupInvocationID);
        int _263 = _663;
        _171 = as_type<float>(_263);
    }
    _173 = false;
    float _265 = _171;
    float _267 = precise::min(_84, _86);
    float _269 = -_134;
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _273 = precise::min(_88, _90);
    float _275 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _277 = 1.0 / _271;
    float _279 = precise::min(_267, _273);
    float _281 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _283 = _77 * _275;
    float _285 = as_type<float>(gl_SubgroupInvocationID);
    float _287 = -_279;
    float _289 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _291 = _134 >= 1.0;
    bool _293 = isnan(_134);
    bool _295 = _291 || _293;
    bool _297 = isnan(1.0);
    bool _299 = _295 || _297;
    float _301 = _79 * _281;
    int _303 = _110 * 2;
    float _305 = 1.0 / _289;
    int _307 = _106 & 1;
    int _309 = 2 & _303;
    int _311 = (-3) & _307;
    int _313 = _309 | _311;
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _317 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[1].w, _315);
    float _319 = trunc(_283);
    int _321 = int(_319);
    float _323 = _317 * 16777215.0;
    bool _325 = !_299;
    float _327 = _325 ? _323 : 16777215.0;
    float _329 = trunc(_301);
    int _331 = int(_329);
    float _333 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _335 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[1].w, _333);
    bool _337 = _279 >= 1.0;
    bool _339 = isnan(_279);
    bool _341 = _337 || _339;
    bool _343 = isnan(1.0);
    bool _345 = _341 || _343;
    float _347 = _335 * 16777215.0;
    float _349 = trunc(_327);
    float _351 = precise::max(_349, 0.0);
    uint _353 = uint(_351);
    bool _355 = !_345;
    float _357 = _355 ? _347 : 16777215.0;
    int _359 = as_type<int>(_285) & 3;
    bool _361 = _359 != 0;
    int _363 = _331 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _365 = _363 + _321;
    float _367 = trunc(_357);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    int _373 = _365 * 4;
    int _375 = _373 + _313;
    int _377 = _375 * 4;
    int _379 = _377 + 9728;
    if (!_361)
    {
        int _381 = _106 >> 31;
        int _383 = _110 >> 31;
        int _385 = _381 & 1;
        int _387 = _383 & 1;
        int _389 = _106 + _385;
        int _391 = _110 + _387;
        int _393 = _389 >> 1;
        int _395 = _391 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_265, _265, _265, _265), uint2(int2(_393, _395)));
    }
    uint _397 = uint(int(uint(_377) >> uint(2)));
    uint _860 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_397)], _371, memory_order_relaxed);
    uint _399 = _860;
    uint _401 = uint(int(uint(_379) >> uint(2)));
    uint _868 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_401)], _353, memory_order_relaxed);
    uint _403 = _868;
    out.m_50.x = as_type<float>(_145);
    out.m_50.y = as_type<float>(_145);
    out.m_50.z = as_type<float>(_145);
    out.m_50.w = as_type<float>(_145);
    return main0_out_u{as_type<uint4>(out.m_50)};
}

