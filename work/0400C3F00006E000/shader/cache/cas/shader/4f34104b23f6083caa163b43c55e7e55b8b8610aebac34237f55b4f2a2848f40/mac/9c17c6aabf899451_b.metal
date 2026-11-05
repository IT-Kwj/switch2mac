#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _701, thread const int& _702, thread const int& _703, thread int& _704, thread uint& gl_SubgroupInvocationID)
{
    int _707 = _703 & 31;
    uint _709 = uint(int(uint(_703) >> uint(8)));
    int _711 = int(_709) & 31;
    float _713 = as_type<float>(gl_SubgroupInvocationID);
    int _715 = as_type<int>(_713) & _711;
    int _717 = ~_711;
    int _719 = _707 & _717;
    int _721 = _719 | _715;
    int _723 = as_type<int>(_713) ^ _702;
    bool _725 = uint(_723) <= uint(_721);
    _704 = _725 ? (-1) : 0;
    float _727 = spvSubgroupShuffle(as_type<float>(_701), uint(_723));
    uint _729 = uint(_725 ? as_type<int>(_727) : _701);
    return int(_729);
}

static inline __attribute__((always_inline))
int _55(thread const int& _777, thread const int& _778, thread const int& _779, thread int& _780, thread uint& gl_SubgroupInvocationID)
{
    int _783 = _779 & 31;
    uint _785 = uint(int(uint(_779) >> uint(8)));
    int _787 = int(_785) & 31;
    float _789 = as_type<float>(gl_SubgroupInvocationID);
    int _791 = as_type<int>(_789) & _787;
    int _793 = ~_787;
    int _795 = _783 & _793;
    int _797 = _795 | _791;
    int _799 = ~_787;
    int _801 = _778 & _799;
    int _803 = _801 | _791;
    bool _805 = uint(_803) <= uint(_797);
    _780 = _805 ? (-1) : 0;
    float _807 = spvSubgroupShuffle(as_type<float>(_777), uint(_803));
    uint _809 = uint(_805 ? as_type<int>(_807) : _777);
    return int(_809);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _141 = false;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _374 = float2(_75, _77);
    float _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374)), int2(0), component::x).w;
    float2 _385 = float2(_75, _77);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_35.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_35.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    uint _105 = spvSubgroupBallot(true).x;
    bool _109 = int(_105) != (-1);
    float _111 = _73 * _96;
    float _113 = _73 * _102;
    float _139;
    if (!_109)
    {
        int _115 = as_type<int>(_79);
        int _117 = 1;
        int _119 = 31;
        int _121;
        int _433 = _54(_115, _117, _119, _121, gl_SubgroupInvocationID);
        int _123 = _433;
        float _125 = precise::max(_79, as_type<float>(_123));
        int _127 = as_type<int>(_125);
        int _129 = 2;
        int _131 = 31;
        int _133;
        int _441 = _54(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _441;
        float _137 = precise::max(_125, as_type<float>(_135));
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = as_type<float>(gl_SubgroupInvocationID);
        uint _145 = spvSubgroupBallot(true).x;
        float _147 = as_type<float>(gl_SubgroupLtMask.x);
        int _149 = as_type<int>(_143) & (-4);
        uint _151 = min(uint(_149), 32u);
        bool _153 = _151 < 32u;
        int _155 = 15 << int(_151);
        int _157 = _153 ? _155 : 0;
        int _159 = int(_145) & as_type<int>(_147);
        int _161 = _157 & _159;
        int _163 = _157 & int(_145);
        int _165 = int(spvFindUMSB(uint(_161)));
        int _167 = int(spvFindUMSB(uint(_163)));
        uint _169 = min(uint(_165), as_type<uint>(_143));
        int _171 = as_type<int>(_79);
        int _173 = int(_169);
        int _175 = 31;
        int _177;
        int _501 = _55(_171, _173, _175, _177, gl_SubgroupInvocationID);
        int _179 = _501;
        int _181 = int(_169);
        int _183 = int(_169);
        int _185 = 30;
        int _187;
        int _507 = _55(_181, _183, _185, _187, gl_SubgroupInvocationID);
        int _189 = _507;
        float _191 = precise::max(_79, as_type<float>(_179));
        int _193 = as_type<int>(_191);
        int _195 = _189;
        int _197 = 31;
        int _199;
        int _515 = _55(_193, _195, _197, _199, gl_SubgroupInvocationID);
        int _201 = _515;
        float _203 = precise::max(_191, as_type<float>(_201));
        int _205 = as_type<int>(_203);
        int _207 = _167;
        int _209 = 31;
        int _211;
        int _523 = _55(_205, _207, _209, _211, gl_SubgroupInvocationID);
        int _213 = _523;
        _139 = as_type<float>(_213);
    }
    _141 = false;
    float _215 = _139;
    float _217 = as_type<float>(gl_SubgroupInvocationID);
    float _219 = floor(_111);
    float _221 = -_79;
    float _223 = _221 + _84;
    float _225 = -_79;
    float _227 = _225 + _86;
    float _229 = -_79;
    float _231 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _233 = -_79;
    float _235 = _233 + _90;
    float _237 = -_79;
    float _239 = _237 + _88;
    float _241 = floor(_113);
    float _243 = abs(_227);
    float _245 = -_243;
    float _247 = abs(_235);
    float _249 = _245 + _247;
    float _251 = abs(_223);
    float _253 = abs(_239);
    float _255 = -_253;
    float _257 = _251 + _255;
    float _259 = _249 + _257;
    float _261 = -_257;
    float _263 = _249 + _261;
    float _265 = 1.0 / _231;
    float _267 = -_219;
    float _269 = _111 + _267;
    int _271 = as_type<int>(_217) & 3;
    bool _273 = _271 != 0;
    float _275 = -_241;
    float _277 = _113 + _275;
    float _279 = _265 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _281 = fma(_279, _259, _269);
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_279, _263, _277);
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = -_269;
    float _291 = _289 + _283;
    float _293 = -_277;
    float _295 = _293 + _287;
    int _297 = as_type<int>(_259);
    if (!_273)
    {
        float _299 = gl_FragCoord.y;
        float _301 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _303 = _299 / _301;
        float _305 = gl_FragCoord.x;
        float _307 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _309 = _305 / _307;
        float _311 = trunc(_303);
        int _313 = int(_311);
        float _315 = trunc(_309);
        int _317 = int(_315);
        int _319 = _313 >> 31;
        int _321 = _319 & 1;
        int _323 = _317 >> 31;
        int _325 = _313 + _321;
        int _327 = _323 & 1;
        int _329 = _325 >> 1;
        int _331 = _317 + _327;
        int _333 = _331 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_215, _215, _215, _215), uint2(int2(_333, _329)));
        _297 = _317;
    }
    int _335 = _297;
    float _337 = fma(_291, 0.5, 0.5);
    float _339 = fma(_295, 0.5, 0.5);
    out.gl_FragDepth = as_type<float>(_335);
    out.m_48.x = _337;
    out.m_48.y = _339;
    return out;
}

