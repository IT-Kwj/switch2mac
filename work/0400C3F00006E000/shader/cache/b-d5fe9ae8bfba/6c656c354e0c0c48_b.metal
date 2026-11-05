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
    texture2d<float, access::write> fp_i_tcb_48_ [[id(4)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(5)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _566, thread const int& _567, thread const int& _568, thread int& _569, thread uint& gl_SubgroupInvocationID)
{
    int _572 = _568 & 31;
    uint _574 = uint(int(uint(_568) >> uint(8)));
    int _576 = int(_574) & 31;
    float _578 = as_type<float>(gl_SubgroupInvocationID);
    int _580 = as_type<int>(_578) & _576;
    int _582 = ~_576;
    int _584 = _572 & _582;
    int _586 = _584 | _580;
    int _588 = as_type<int>(_578) ^ _567;
    bool _590 = uint(_588) <= uint(_586);
    _569 = _590 ? (-1) : 0;
    float _592 = spvSubgroupShuffle(as_type<float>(_566), uint(_588));
    uint _594 = uint(_590 ? as_type<int>(_592) : _566);
    return int(_594);
}

static inline __attribute__((always_inline))
int _55(thread const int& _642, thread const int& _643, thread const int& _644, thread int& _645, thread uint& gl_SubgroupInvocationID)
{
    int _648 = _644 & 31;
    uint _650 = uint(int(uint(_644) >> uint(8)));
    int _652 = int(_650) & 31;
    float _654 = as_type<float>(gl_SubgroupInvocationID);
    int _656 = as_type<int>(_654) & _652;
    int _658 = ~_652;
    int _660 = _648 & _658;
    int _662 = _660 | _656;
    int _664 = ~_652;
    int _666 = _643 & _664;
    int _668 = _666 | _656;
    bool _670 = uint(_668) <= uint(_662);
    _645 = _670 ? (-1) : 0;
    float _672 = spvSubgroupShuffle(as_type<float>(_642), uint(_668));
    uint _674 = uint(_670 ? as_type<int>(_672) : _642);
    return int(_674);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _171 = false;
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
    float2 _302 = float2(_75, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = gl_FragCoord.x;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = gl_FragCoord.y;
    float _98 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _100 = _96 / _98;
    float _102 = trunc(_94);
    int _104 = int(_102);
    float _106 = trunc(_100);
    int _108 = int(_106);
    float _110 = precise::max(_82, _84);
    float _112 = precise::max(_86, _88);
    bool _116 = _88 != 1.0;
    bool _118 = isnan(_88);
    bool _120 = _116 || _118;
    bool _122 = isnan(1.0);
    bool _124 = _120 || _122;
    float _126 = precise::max(_110, _112);
    float _128 = -_88;
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _133 = spvSubgroupBallot(true).x;
    float _135 = 1.0 / _130;
    bool _137 = int(_133) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_126, _126, _126, _126), uint2(int2(_104, _108)));
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _141 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].w, _139);
    int _143 = _124 ? as_type<int>(_141) : 1065353216;
    float _169;
    if (!_137)
    {
        int _145 = as_type<int>(_126);
        int _147 = 1;
        int _149 = 31;
        int _151;
        int _408 = _54(_145, _147, _149, _151, gl_SubgroupInvocationID);
        int _153 = _408;
        float _155 = precise::max(_126, as_type<float>(_153));
        int _157 = as_type<int>(_155);
        int _159 = 2;
        int _161 = 31;
        int _163;
        int _416 = _54(_157, _159, _161, _163, gl_SubgroupInvocationID);
        int _165 = _416;
        float _167 = precise::max(_155, as_type<float>(_165));
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = as_type<float>(gl_SubgroupInvocationID);
        uint _175 = spvSubgroupBallot(true).x;
        float _177 = as_type<float>(gl_SubgroupLtMask.x);
        int _179 = as_type<int>(_173) & (-4);
        uint _181 = min(uint(_179), 32u);
        bool _183 = _181 < 32u;
        int _185 = 15 << int(_181);
        int _187 = _183 ? _185 : 0;
        int _189 = int(_175) & as_type<int>(_177);
        int _191 = _187 & _189;
        int _193 = _187 & int(_175);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_173));
        int _201 = as_type<int>(_126);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _476 = _55(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _476;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _482 = _55(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _482;
        float _221 = precise::max(_126, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _490 = _55(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _490;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _498 = _55(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _498;
        _169 = as_type<float>(_243);
    }
    _171 = false;
    float _245 = _169;
    float _247 = as_type<float>(gl_SubgroupInvocationID);
    int _249 = as_type<int>(_247) & 3;
    bool _251 = _249 != 0;
    if (_251)
    {
        out.gl_FragDepth = _88;
        out.m_48.x = as_type<float>(_143);
        out.m_48.y = as_type<float>(_143);
        out.m_48.z = as_type<float>(_143);
        out.m_48.w = as_type<float>(_143);
        return out;
    }
    int _253 = _104 >> 31;
    int _255 = _108 >> 31;
    int _257 = _253 & 1;
    int _259 = _255 & 1;
    int _261 = _104 + _257;
    int _263 = _108 + _259;
    int _265 = _261 >> 1;
    int _267 = _263 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_265, _267)));
    out.gl_FragDepth = _88;
    out.m_48.x = as_type<float>(_143);
    out.m_48.y = as_type<float>(_143);
    out.m_48.z = as_type<float>(_143);
    out.m_48.w = as_type<float>(_143);
    return out;
}


struct main0_out_u
{
    uint4 m_48 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _171 = false;
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
    float2 _302 = float2(_75, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = gl_FragCoord.x;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = gl_FragCoord.y;
    float _98 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _100 = _96 / _98;
    float _102 = trunc(_94);
    int _104 = int(_102);
    float _106 = trunc(_100);
    int _108 = int(_106);
    float _110 = precise::max(_82, _84);
    float _112 = precise::max(_86, _88);
    bool _116 = _88 != 1.0;
    bool _118 = isnan(_88);
    bool _120 = _116 || _118;
    bool _122 = isnan(1.0);
    bool _124 = _120 || _122;
    float _126 = precise::max(_110, _112);
    float _128 = -_88;
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    uint _133 = spvSubgroupBallot(true).x;
    float _135 = 1.0 / _130;
    bool _137 = int(_133) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_126, _126, _126, _126), uint2(int2(_104, _108)));
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _141 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].w, _139);
    int _143 = _124 ? as_type<int>(_141) : 1065353216;
    float _169;
    if (!_137)
    {
        int _145 = as_type<int>(_126);
        int _147 = 1;
        int _149 = 31;
        int _151;
        int _408 = _54(_145, _147, _149, _151, gl_SubgroupInvocationID);
        int _153 = _408;
        float _155 = precise::max(_126, as_type<float>(_153));
        int _157 = as_type<int>(_155);
        int _159 = 2;
        int _161 = 31;
        int _163;
        int _416 = _54(_157, _159, _161, _163, gl_SubgroupInvocationID);
        int _165 = _416;
        float _167 = precise::max(_155, as_type<float>(_165));
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = as_type<float>(gl_SubgroupInvocationID);
        uint _175 = spvSubgroupBallot(true).x;
        float _177 = as_type<float>(gl_SubgroupLtMask.x);
        int _179 = as_type<int>(_173) & (-4);
        uint _181 = min(uint(_179), 32u);
        bool _183 = _181 < 32u;
        int _185 = 15 << int(_181);
        int _187 = _183 ? _185 : 0;
        int _189 = int(_175) & as_type<int>(_177);
        int _191 = _187 & _189;
        int _193 = _187 & int(_175);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_173));
        int _201 = as_type<int>(_126);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _476 = _55(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _476;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _482 = _55(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _482;
        float _221 = precise::max(_126, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _490 = _55(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _490;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _498 = _55(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _498;
        _169 = as_type<float>(_243);
    }
    _171 = false;
    float _245 = _169;
    float _247 = as_type<float>(gl_SubgroupInvocationID);
    int _249 = as_type<int>(_247) & 3;
    bool _251 = _249 != 0;
    if (_251)
    {
        out.gl_FragDepth = _88;
        out.m_48.x = as_type<float>(_143);
        out.m_48.y = as_type<float>(_143);
        out.m_48.z = as_type<float>(_143);
        out.m_48.w = as_type<float>(_143);
        return main0_out_u{as_type<uint4>(out.m_48), out.gl_FragDepth};
    }
    int _253 = _104 >> 31;
    int _255 = _108 >> 31;
    int _257 = _253 & 1;
    int _259 = _255 & 1;
    int _261 = _104 + _257;
    int _263 = _108 + _259;
    int _265 = _261 >> 1;
    int _267 = _263 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_265, _267)));
    out.gl_FragDepth = _88;
    out.m_48.x = as_type<float>(_143);
    out.m_48.y = as_type<float>(_143);
    out.m_48.z = as_type<float>(_143);
    out.m_48.w = as_type<float>(_143);
    return main0_out_u{as_type<uint4>(out.m_48), out.gl_FragDepth};
}

