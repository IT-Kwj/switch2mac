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
    float4 m_48 [[color(0)]];
    float4 m_50 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _711, thread const int& _712, thread const int& _713, thread int& _714, thread uint& gl_SubgroupInvocationID)
{
    int _717 = _713 & 31;
    uint _719 = uint(int(uint(_713) >> uint(8)));
    int _721 = int(_719) & 31;
    float _723 = as_type<float>(gl_SubgroupInvocationID);
    int _725 = as_type<int>(_723) & _721;
    int _727 = ~_721;
    int _729 = _717 & _727;
    int _731 = _729 | _725;
    int _733 = as_type<int>(_723) ^ _712;
    bool _735 = uint(_733) <= uint(_731);
    _714 = _735 ? (-1) : 0;
    float _737 = spvSubgroupShuffle(as_type<float>(_711), uint(_733));
    uint _739 = uint(_735 ? as_type<int>(_737) : _711);
    return int(_739);
}

static inline __attribute__((always_inline))
int _57(thread const int& _787, thread const int& _788, thread const int& _789, thread int& _790, thread uint& gl_SubgroupInvocationID)
{
    int _793 = _789 & 31;
    uint _795 = uint(int(uint(_789) >> uint(8)));
    int _797 = int(_795) & 31;
    float _799 = as_type<float>(gl_SubgroupInvocationID);
    int _801 = as_type<int>(_799) & _797;
    int _803 = ~_797;
    int _805 = _793 & _803;
    int _807 = _805 | _801;
    int _809 = ~_797;
    int _811 = _788 & _809;
    int _813 = _811 | _801;
    bool _815 = uint(_813) <= uint(_807);
    _790 = _815 ? (-1) : 0;
    float _817 = spvSubgroupShuffle(as_type<float>(_787), uint(_813));
    uint _819 = uint(_815 ? as_type<int>(_817) : _787);
    return int(_819);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _143 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _376 = float2(_77, _79);
    float _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376)), int2(0), component::x).w;
    float2 _387 = float2(_77, _79);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_387, float2(0.0), isnan(_387)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_35.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = _75 * _98;
    float _115 = _75 * _104;
    float _141;
    if (!_111)
    {
        int _117 = as_type<int>(_81);
        int _119 = 1;
        int _121 = 31;
        int _123;
        int _435 = _56(_117, _119, _121, _123, gl_SubgroupInvocationID);
        int _125 = _435;
        float _127 = precise::max(_81, as_type<float>(_125));
        int _129 = as_type<int>(_127);
        int _131 = 2;
        int _133 = 31;
        int _135;
        int _443 = _56(_129, _131, _133, _135, gl_SubgroupInvocationID);
        int _137 = _443;
        float _139 = precise::max(_127, as_type<float>(_137));
        _141 = _139;
        _143 = true;
    }
    else
    {
        float _145 = as_type<float>(gl_SubgroupInvocationID);
        uint _147 = spvSubgroupBallot(true).x;
        float _149 = as_type<float>(gl_SubgroupLtMask.x);
        int _151 = as_type<int>(_145) & (-4);
        uint _153 = min(uint(_151), 32u);
        bool _155 = _153 < 32u;
        int _157 = 15 << int(_153);
        int _159 = _155 ? _157 : 0;
        int _161 = int(_147) & as_type<int>(_149);
        int _163 = _159 & _161;
        int _165 = _159 & int(_147);
        int _167 = int(spvFindUMSB(uint(_163)));
        int _169 = int(spvFindUMSB(uint(_165)));
        uint _171 = min(uint(_167), as_type<uint>(_145));
        int _173 = as_type<int>(_81);
        int _175 = int(_171);
        int _177 = 31;
        int _179;
        int _503 = _57(_173, _175, _177, _179, gl_SubgroupInvocationID);
        int _181 = _503;
        int _183 = int(_171);
        int _185 = int(_171);
        int _187 = 30;
        int _189;
        int _509 = _57(_183, _185, _187, _189, gl_SubgroupInvocationID);
        int _191 = _509;
        float _193 = precise::max(_81, as_type<float>(_181));
        int _195 = as_type<int>(_193);
        int _197 = _191;
        int _199 = 31;
        int _201;
        int _517 = _57(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _517;
        float _205 = precise::max(_193, as_type<float>(_203));
        int _207 = as_type<int>(_205);
        int _209 = _169;
        int _211 = 31;
        int _213;
        int _525 = _57(_207, _209, _211, _213, gl_SubgroupInvocationID);
        int _215 = _525;
        _141 = as_type<float>(_215);
    }
    _143 = false;
    float _217 = _141;
    float _219 = as_type<float>(gl_SubgroupInvocationID);
    float _221 = floor(_113);
    float _223 = -_81;
    float _225 = _223 + _92;
    float _227 = -_81;
    float _229 = _227 + _86;
    float _231 = -_81;
    float _233 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _235 = -_81;
    float _237 = _235 + _88;
    float _239 = -_81;
    float _241 = _239 + _90;
    float _243 = floor(_115);
    float _245 = abs(_237);
    float _247 = -_245;
    float _249 = abs(_225);
    float _251 = _247 + _249;
    float _253 = abs(_229);
    float _255 = abs(_241);
    float _257 = -_255;
    float _259 = _253 + _257;
    float _261 = _251 + _259;
    float _263 = -_259;
    float _265 = _251 + _263;
    float _267 = 1.0 / _233;
    float _269 = -_221;
    float _271 = _113 + _269;
    int _273 = as_type<int>(_219) & 3;
    bool _275 = _273 != 0;
    float _277 = -_243;
    float _279 = _115 + _277;
    float _281 = _267 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _283 = fma(_281, _261, _271);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_281, _265, _279);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = -_271;
    float _293 = _291 + _285;
    float _295 = -_279;
    float _297 = _295 + _289;
    int _299 = as_type<int>(_261);
    if (!_275)
    {
        float _301 = gl_FragCoord.x;
        float _303 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _305 = _301 / _303;
        float _307 = gl_FragCoord.y;
        float _309 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _311 = _307 / _309;
        float _313 = trunc(_305);
        int _315 = int(_313);
        float _317 = trunc(_311);
        int _319 = int(_317);
        int _321 = _315 >> 31;
        int _323 = _321 & 1;
        int _325 = _319 >> 31;
        int _327 = _315 + _323;
        int _329 = _325 & 1;
        int _331 = _327 >> 1;
        int _333 = _319 + _329;
        int _335 = _333 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_217, _217, _217, _217), uint2(int2(_331, _335)));
        _299 = _315;
    }
    int _337 = _299;
    float _339 = fma(_293, 0.5, 0.5);
    float _341 = fma(_297, 0.5, 0.5);
    out.gl_FragDepth = as_type<float>(_337);
    out.m_48.x = _81;
    out.m_48.y = _81;
    out.m_48.z = _81;
    out.m_48.w = _81;
    out.m_50.x = _339;
    out.m_50.y = _341;
    return out;
}

