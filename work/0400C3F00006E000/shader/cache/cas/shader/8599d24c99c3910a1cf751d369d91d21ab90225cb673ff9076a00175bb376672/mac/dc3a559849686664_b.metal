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
int _58(thread const int& _741, thread const int& _742, thread const int& _743, thread int& _744, thread uint& gl_SubgroupInvocationID)
{
    int _747 = _743 & 31;
    uint _749 = uint(int(uint(_743) >> uint(8)));
    int _751 = int(_749) & 31;
    float _753 = as_type<float>(gl_SubgroupInvocationID);
    int _755 = as_type<int>(_753) & _751;
    int _757 = ~_751;
    int _759 = _747 & _757;
    int _761 = _759 | _755;
    int _763 = as_type<int>(_753) ^ _742;
    bool _765 = uint(_763) <= uint(_761);
    _744 = _765 ? (-1) : 0;
    float _767 = spvSubgroupShuffle(as_type<float>(_741), uint(_763));
    uint _769 = uint(_765 ? as_type<int>(_767) : _741);
    return int(_769);
}

static inline __attribute__((always_inline))
int _59(thread const int& _817, thread const int& _818, thread const int& _819, thread int& _820, thread uint& gl_SubgroupInvocationID)
{
    int _823 = _819 & 31;
    uint _825 = uint(int(uint(_819) >> uint(8)));
    int _827 = int(_825) & 31;
    float _829 = as_type<float>(gl_SubgroupInvocationID);
    int _831 = as_type<int>(_829) & _827;
    int _833 = ~_827;
    int _835 = _823 & _833;
    int _837 = _835 | _831;
    int _839 = ~_827;
    int _841 = _818 & _839;
    int _843 = _841 | _831;
    bool _845 = uint(_843) <= uint(_837);
    _820 = _845 ? (-1) : 0;
    float _847 = spvSubgroupShuffle(as_type<float>(_817), uint(_843));
    uint _849 = uint(_845 ? as_type<int>(_847) : _817);
    return int(_849);
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
    float2 _380 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), int2(0), component::x).xyzw;
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
        int _454 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _454;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _462 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _462;
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
        int _551 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _551;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _557 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _557;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _565 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _565;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _573 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _573;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _253 = _119 * 2;
    bool _255 = _125 >= 1.0;
    bool _257 = isnan(_125);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = _79 * _247;
    float _267 = _81 * _251;
    int _269 = _115 & 1;
    float _271 = -_125;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _275 = trunc(_265);
    int _277 = int(_275);
    int _279 = 2 & _253;
    int _281 = (-3) & _269;
    int _283 = _279 | _281;
    float _285 = 1.0 / _273;
    int _287 = as_type<int>(_249) & 3;
    bool _289 = _287 != 0;
    float _291 = trunc(_267);
    int _293 = int(_291);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _297 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[1].w, _295);
    float _299 = _297 * 16777215.0;
    int _301 = _293 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _303 = _301 + _277;
    bool _305 = !_263;
    float _307 = _305 ? _299 : 16777215.0;
    int _309 = _303 * 4;
    int _311 = _309 + _283;
    float _313 = trunc(_307);
    float _315 = precise::max(_313, 0.0);
    uint _317 = uint(_315);
    int _319 = _311 << 2;
    int _321 = _319 + 9728;
    if (!_289)
    {
        int _323 = _115 >> 31;
        int _325 = _119 >> 31;
        int _327 = _323 & 1;
        int _329 = _325 & 1;
        int _331 = _115 + _327;
        int _333 = _119 + _329;
        int _335 = _331 >> 1;
        int _337 = _333 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_335, _337)));
    }
    uint _339 = uint(int(uint(_321) >> uint(2)));
    uint _721 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_339)], _317, memory_order_relaxed);
    uint _341 = _721;
    bool _343 = !_263;
    int _345 = _343 ? as_type<int>(_297) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_345);
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
    float2 _380 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), int2(0), component::x).xyzw;
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
        int _454 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _454;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _462 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _462;
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
        int _551 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _551;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _557 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _557;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _565 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _565;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _573 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _573;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _253 = _119 * 2;
    bool _255 = _125 >= 1.0;
    bool _257 = isnan(_125);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = _79 * _247;
    float _267 = _81 * _251;
    int _269 = _115 & 1;
    float _271 = -_125;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _275 = trunc(_265);
    int _277 = int(_275);
    int _279 = 2 & _253;
    int _281 = (-3) & _269;
    int _283 = _279 | _281;
    float _285 = 1.0 / _273;
    int _287 = as_type<int>(_249) & 3;
    bool _289 = _287 != 0;
    float _291 = trunc(_267);
    int _293 = int(_291);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _297 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[1].w, _295);
    float _299 = _297 * 16777215.0;
    int _301 = _293 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _303 = _301 + _277;
    bool _305 = !_263;
    float _307 = _305 ? _299 : 16777215.0;
    int _309 = _303 * 4;
    int _311 = _309 + _283;
    float _313 = trunc(_307);
    float _315 = precise::max(_313, 0.0);
    uint _317 = uint(_315);
    int _319 = _311 << 2;
    int _321 = _319 + 9728;
    if (!_289)
    {
        int _323 = _115 >> 31;
        int _325 = _119 >> 31;
        int _327 = _323 & 1;
        int _329 = _325 & 1;
        int _331 = _115 + _327;
        int _333 = _119 + _329;
        int _335 = _331 >> 1;
        int _337 = _333 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_335, _337)));
    }
    uint _339 = uint(int(uint(_321) >> uint(2)));
    uint _721 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_339)], _317, memory_order_relaxed);
    uint _341 = _721;
    bool _343 = !_263;
    int _345 = _343 ? as_type<int>(_297) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_345);
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
    float2 _380 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), int2(0), component::x).xyzw;
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
        int _454 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _454;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _462 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _462;
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
        int _551 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _551;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _557 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _557;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _565 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _565;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _573 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _573;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _253 = _119 * 2;
    bool _255 = _125 >= 1.0;
    bool _257 = isnan(_125);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = _79 * _247;
    float _267 = _81 * _251;
    int _269 = _115 & 1;
    float _271 = -_125;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _275 = trunc(_265);
    int _277 = int(_275);
    int _279 = 2 & _253;
    int _281 = (-3) & _269;
    int _283 = _279 | _281;
    float _285 = 1.0 / _273;
    int _287 = as_type<int>(_249) & 3;
    bool _289 = _287 != 0;
    float _291 = trunc(_267);
    int _293 = int(_291);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _297 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[1].w, _295);
    float _299 = _297 * 16777215.0;
    int _301 = _293 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _303 = _301 + _277;
    bool _305 = !_263;
    float _307 = _305 ? _299 : 16777215.0;
    int _309 = _303 * 4;
    int _311 = _309 + _283;
    float _313 = trunc(_307);
    float _315 = precise::max(_313, 0.0);
    uint _317 = uint(_315);
    int _319 = _311 << 2;
    int _321 = _319 + 9728;
    if (!_289)
    {
        int _323 = _115 >> 31;
        int _325 = _119 >> 31;
        int _327 = _323 & 1;
        int _329 = _325 & 1;
        int _331 = _115 + _327;
        int _333 = _119 + _329;
        int _335 = _331 >> 1;
        int _337 = _333 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_335, _337)));
    }
    uint _339 = uint(int(uint(_321) >> uint(2)));
    uint _721 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_339)], _317, memory_order_relaxed);
    uint _341 = _721;
    bool _343 = !_263;
    int _345 = _343 ? as_type<int>(_297) : 1065353216;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = as_type<float>(_345);
    return main0_out_m{out.m_50, as_type<uint4>(out.m_52)};
}

