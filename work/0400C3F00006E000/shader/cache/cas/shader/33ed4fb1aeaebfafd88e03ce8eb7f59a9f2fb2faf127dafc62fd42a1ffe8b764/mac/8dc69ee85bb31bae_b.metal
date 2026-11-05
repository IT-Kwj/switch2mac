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
int _58(thread const int& _798, thread const int& _799, thread const int& _800, thread int& _801, thread uint& gl_SubgroupInvocationID)
{
    int _804 = _800 & 31;
    uint _806 = uint(int(uint(_800) >> uint(8)));
    int _808 = int(_806) & 31;
    float _810 = as_type<float>(gl_SubgroupInvocationID);
    int _812 = as_type<int>(_810) & _808;
    int _814 = ~_808;
    int _816 = _804 & _814;
    int _818 = _816 | _812;
    int _820 = as_type<int>(_810) ^ _799;
    bool _822 = uint(_820) <= uint(_818);
    _801 = _822 ? (-1) : 0;
    float _824 = spvSubgroupShuffle(as_type<float>(_798), uint(_820));
    uint _826 = uint(_822 ? as_type<int>(_824) : _798);
    return int(_826);
}

static inline __attribute__((always_inline))
int _59(thread const int& _874, thread const int& _875, thread const int& _876, thread int& _877, thread uint& gl_SubgroupInvocationID)
{
    int _880 = _876 & 31;
    uint _882 = uint(int(uint(_876) >> uint(8)));
    int _884 = int(_882) & 31;
    float _886 = as_type<float>(gl_SubgroupInvocationID);
    int _888 = as_type<int>(_886) & _884;
    int _890 = ~_884;
    int _892 = _880 & _890;
    int _894 = _892 | _888;
    int _896 = ~_884;
    int _898 = _875 & _896;
    int _900 = _898 | _888;
    bool _902 = uint(_900) <= uint(_894);
    _877 = _902 ? (-1) : 0;
    float _904 = spvSubgroupShuffle(as_type<float>(_874), uint(_900));
    uint _906 = uint(_902 ? as_type<int>(_904) : _874);
    return int(_906);
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
    float2 _404 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404)), int2(0), component::x).xyzw;
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
        int _478 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _478;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _486 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _486;
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
        int _575 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _575;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _581 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _581;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _589 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _589;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _597 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _597;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _255 = _119 * 2;
    float _257 = precise::min(_247, _249);
    float _259 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _261 = _79 * _253;
    float _263 = -_257;
    float _265 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _267 = _257 >= 1.0;
    bool _269 = isnan(_257);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = _81 * _259;
    float _279 = trunc(_261);
    int _281 = int(_279);
    float _283 = 1.0 / _265;
    float _285 = trunc(_277);
    int _287 = int(_285);
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _289);
    float _293 = _291 * 16777215.0;
    int _295 = _115 & 1;
    int _297 = _287 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _299 = _297 + _281;
    bool _301 = !_275;
    float _303 = _301 ? _293 : 16777215.0;
    int _305 = 2 & _255;
    int _307 = (-3) & _295;
    int _309 = _305 | _307;
    int _311 = as_type<int>(_251) & 3;
    bool _313 = _311 != 0;
    float _315 = trunc(_303);
    float _317 = precise::max(_315, 0.0);
    uint _319 = uint(_317);
    int _321 = _299 * 4;
    int _323 = _321 + _309;
    int _325 = _323 << 2;
    if (!_313)
    {
        int _327 = _115 >> 31;
        int _329 = _119 >> 31;
        int _331 = _327 & 1;
        int _333 = _329 & 1;
        int _335 = _115 + _331;
        int _337 = _119 + _333;
        int _339 = _335 >> 1;
        int _341 = _337 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_339, _341)));
    }
    float _343 = -_125;
    float _345 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _347 = uint(int(uint(_325) >> uint(2)));
    uint _757 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_347)], _319, memory_order_relaxed);
    uint _349 = _757;
    bool _351 = _125 >= 1.0;
    bool _353 = isnan(_125);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.0);
    bool _359 = _355 || _357;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _365 = fma(_361, (*spvDescriptorSet0.fp_c3)._m0[1].w, _363);
    bool _367 = !_359;
    int _369 = _367 ? as_type<int>(_365) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_369);
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
    float2 _404 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404)), int2(0), component::x).xyzw;
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
        int _478 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _478;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _486 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _486;
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
        int _575 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _575;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _581 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _581;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _589 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _589;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _597 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _597;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _255 = _119 * 2;
    float _257 = precise::min(_247, _249);
    float _259 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _261 = _79 * _253;
    float _263 = -_257;
    float _265 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _267 = _257 >= 1.0;
    bool _269 = isnan(_257);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = _81 * _259;
    float _279 = trunc(_261);
    int _281 = int(_279);
    float _283 = 1.0 / _265;
    float _285 = trunc(_277);
    int _287 = int(_285);
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _289);
    float _293 = _291 * 16777215.0;
    int _295 = _115 & 1;
    int _297 = _287 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _299 = _297 + _281;
    bool _301 = !_275;
    float _303 = _301 ? _293 : 16777215.0;
    int _305 = 2 & _255;
    int _307 = (-3) & _295;
    int _309 = _305 | _307;
    int _311 = as_type<int>(_251) & 3;
    bool _313 = _311 != 0;
    float _315 = trunc(_303);
    float _317 = precise::max(_315, 0.0);
    uint _319 = uint(_317);
    int _321 = _299 * 4;
    int _323 = _321 + _309;
    int _325 = _323 << 2;
    if (!_313)
    {
        int _327 = _115 >> 31;
        int _329 = _119 >> 31;
        int _331 = _327 & 1;
        int _333 = _329 & 1;
        int _335 = _115 + _331;
        int _337 = _119 + _333;
        int _339 = _335 >> 1;
        int _341 = _337 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_339, _341)));
    }
    float _343 = -_125;
    float _345 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _347 = uint(int(uint(_325) >> uint(2)));
    uint _757 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_347)], _319, memory_order_relaxed);
    uint _349 = _757;
    bool _351 = _125 >= 1.0;
    bool _353 = isnan(_125);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.0);
    bool _359 = _355 || _357;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _365 = fma(_361, (*spvDescriptorSet0.fp_c3)._m0[1].w, _363);
    bool _367 = !_359;
    int _369 = _367 ? as_type<int>(_365) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_369);
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
    float2 _404 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404)), int2(0), component::x).xyzw;
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
        int _478 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _478;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _486 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _486;
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
        int _575 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _575;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _581 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _581;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _589 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _589;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _597 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _597;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = precise::min(_86, _88);
    float _249 = precise::min(_90, _92);
    float _251 = as_type<float>(gl_SubgroupInvocationID);
    float _253 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _255 = _119 * 2;
    float _257 = precise::min(_247, _249);
    float _259 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _261 = _79 * _253;
    float _263 = -_257;
    float _265 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _267 = _257 >= 1.0;
    bool _269 = isnan(_257);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = _81 * _259;
    float _279 = trunc(_261);
    int _281 = int(_279);
    float _283 = 1.0 / _265;
    float _285 = trunc(_277);
    int _287 = int(_285);
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _289);
    float _293 = _291 * 16777215.0;
    int _295 = _115 & 1;
    int _297 = _287 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _299 = _297 + _281;
    bool _301 = !_275;
    float _303 = _301 ? _293 : 16777215.0;
    int _305 = 2 & _255;
    int _307 = (-3) & _295;
    int _309 = _305 | _307;
    int _311 = as_type<int>(_251) & 3;
    bool _313 = _311 != 0;
    float _315 = trunc(_303);
    float _317 = precise::max(_315, 0.0);
    uint _319 = uint(_317);
    int _321 = _299 * 4;
    int _323 = _321 + _309;
    int _325 = _323 << 2;
    if (!_313)
    {
        int _327 = _115 >> 31;
        int _329 = _119 >> 31;
        int _331 = _327 & 1;
        int _333 = _329 & 1;
        int _335 = _115 + _331;
        int _337 = _119 + _333;
        int _339 = _335 >> 1;
        int _341 = _337 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_339, _341)));
    }
    float _343 = -_125;
    float _345 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _347 = uint(int(uint(_325) >> uint(2)));
    uint _757 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_347)], _319, memory_order_relaxed);
    uint _349 = _757;
    bool _351 = _125 >= 1.0;
    bool _353 = isnan(_125);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.0);
    bool _359 = _355 || _357;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _365 = fma(_361, (*spvDescriptorSet0.fp_c3)._m0[1].w, _363);
    bool _367 = !_359;
    int _369 = _367 ? as_type<int>(_365) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_369);
    return main0_out_m{out.m_50, as_type<uint4>(out.m_52)};
}

