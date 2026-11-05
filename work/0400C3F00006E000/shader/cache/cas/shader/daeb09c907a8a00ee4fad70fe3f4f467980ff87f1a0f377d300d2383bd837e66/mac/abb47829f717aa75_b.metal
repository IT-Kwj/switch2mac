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
    float4 m_48 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _558, thread const int& _559, thread const int& _560, thread int& _561, thread uint& gl_SubgroupInvocationID)
{
    int _564 = _560 & 31;
    uint _566 = uint(int(uint(_560) >> uint(8)));
    int _568 = int(_566) & 31;
    float _570 = as_type<float>(gl_SubgroupInvocationID);
    int _572 = as_type<int>(_570) & _568;
    int _574 = ~_568;
    int _576 = _564 & _574;
    int _578 = _576 | _572;
    int _580 = as_type<int>(_570) ^ _559;
    bool _582 = uint(_580) <= uint(_578);
    _561 = _582 ? (-1) : 0;
    float _584 = spvSubgroupShuffle(as_type<float>(_558), uint(_580));
    uint _586 = uint(_582 ? as_type<int>(_584) : _558);
    return int(_586);
}

static inline __attribute__((always_inline))
int _55(thread const int& _634, thread const int& _635, thread const int& _636, thread int& _637, thread uint& gl_SubgroupInvocationID)
{
    int _640 = _636 & 31;
    uint _642 = uint(int(uint(_636) >> uint(8)));
    int _644 = int(_642) & 31;
    float _646 = as_type<float>(gl_SubgroupInvocationID);
    int _648 = as_type<int>(_646) & _644;
    int _650 = ~_644;
    int _652 = _640 & _650;
    int _654 = _652 | _648;
    int _656 = ~_644;
    int _658 = _635 & _656;
    int _660 = _658 | _648;
    bool _662 = uint(_660) <= uint(_654);
    _637 = _662 ? (-1) : 0;
    float _664 = spvSubgroupShuffle(as_type<float>(_634), uint(_660));
    uint _666 = uint(_662 ? as_type<int>(_664) : _634);
    return int(_666);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _149 = false;
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
    float2 _308 = float2(_75, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308)), int2(0), component::x).xyzw;
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
    uint _115 = spvSubgroupBallot(true).x;
    float _117 = precise::max(_110, _112);
    bool _121 = int(_115) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_117, _117, _117, _117), uint2(int2(_104, _108)));
    float _147;
    if (!_121)
    {
        int _123 = as_type<int>(_117);
        int _125 = 1;
        int _127 = 31;
        int _129;
        int _382 = _54(_123, _125, _127, _129, gl_SubgroupInvocationID);
        int _131 = _382;
        float _133 = precise::max(_117, as_type<float>(_131));
        int _135 = as_type<int>(_133);
        int _137 = 2;
        int _139 = 31;
        int _141;
        int _390 = _54(_135, _137, _139, _141, gl_SubgroupInvocationID);
        int _143 = _390;
        float _145 = precise::max(_133, as_type<float>(_143));
        _147 = _145;
        _149 = true;
    }
    else
    {
        float _151 = as_type<float>(gl_SubgroupInvocationID);
        uint _153 = spvSubgroupBallot(true).x;
        float _155 = as_type<float>(gl_SubgroupLtMask.x);
        int _157 = as_type<int>(_151) & (-4);
        uint _159 = min(uint(_157), 32u);
        bool _161 = _159 < 32u;
        int _163 = 15 << int(_159);
        int _165 = _161 ? _163 : 0;
        int _167 = int(_153) & as_type<int>(_155);
        int _169 = _165 & _167;
        int _171 = _165 & int(_153);
        int _173 = int(spvFindUMSB(uint(_169)));
        int _175 = int(spvFindUMSB(uint(_171)));
        uint _177 = min(uint(_173), as_type<uint>(_151));
        int _179 = as_type<int>(_117);
        int _181 = int(_177);
        int _183 = 31;
        int _185;
        int _450 = _55(_179, _181, _183, _185, gl_SubgroupInvocationID);
        int _187 = _450;
        int _189 = int(_177);
        int _191 = int(_177);
        int _193 = 30;
        int _195;
        int _456 = _55(_189, _191, _193, _195, gl_SubgroupInvocationID);
        int _197 = _456;
        float _199 = precise::max(_117, as_type<float>(_187));
        int _201 = as_type<int>(_199);
        int _203 = _197;
        int _205 = 31;
        int _207;
        int _464 = _55(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _464;
        float _211 = precise::max(_199, as_type<float>(_209));
        int _213 = as_type<int>(_211);
        int _215 = _175;
        int _217 = 31;
        int _219;
        int _472 = _55(_213, _215, _217, _219, gl_SubgroupInvocationID);
        int _221 = _472;
        _147 = as_type<float>(_221);
    }
    _149 = false;
    float _223 = _147;
    float _225 = as_type<float>(gl_SubgroupInvocationID);
    bool _227 = _117 >= 1.0;
    bool _229 = isnan(_117);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    float _237 = -_117;
    float _239 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _241 = 1.0 / _239;
    int _243 = as_type<int>(_225) & 3;
    bool _245 = _243 != 0;
    float _247 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _249 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[1].w, _247);
    int _251 = as_type<int>(_225);
    if (!_245)
    {
        int _253 = _104 >> 31;
        int _255 = _108 >> 31;
        int _257 = _253 & 1;
        int _259 = _255 & 1;
        int _261 = _104 + _257;
        int _263 = _108 + _259;
        int _265 = _261 >> 1;
        int _267 = _263 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_223, _223, _223, _223), uint2(int2(_265, _267)));
        _251 = _265;
    }
    int _269 = _251;
    bool _271 = !_235;
    int _273 = _271 ? as_type<int>(_249) : 1065353216;
    out.gl_FragDepth = as_type<float>(_269);
    out.m_48.x = as_type<float>(_273);
    return out;
}


struct main0_out_u
{
    uint4 m_48 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _149 = false;
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
    float2 _308 = float2(_75, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308)), int2(0), component::x).xyzw;
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
    uint _115 = spvSubgroupBallot(true).x;
    float _117 = precise::max(_110, _112);
    bool _121 = int(_115) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_117, _117, _117, _117), uint2(int2(_104, _108)));
    float _147;
    if (!_121)
    {
        int _123 = as_type<int>(_117);
        int _125 = 1;
        int _127 = 31;
        int _129;
        int _382 = _54(_123, _125, _127, _129, gl_SubgroupInvocationID);
        int _131 = _382;
        float _133 = precise::max(_117, as_type<float>(_131));
        int _135 = as_type<int>(_133);
        int _137 = 2;
        int _139 = 31;
        int _141;
        int _390 = _54(_135, _137, _139, _141, gl_SubgroupInvocationID);
        int _143 = _390;
        float _145 = precise::max(_133, as_type<float>(_143));
        _147 = _145;
        _149 = true;
    }
    else
    {
        float _151 = as_type<float>(gl_SubgroupInvocationID);
        uint _153 = spvSubgroupBallot(true).x;
        float _155 = as_type<float>(gl_SubgroupLtMask.x);
        int _157 = as_type<int>(_151) & (-4);
        uint _159 = min(uint(_157), 32u);
        bool _161 = _159 < 32u;
        int _163 = 15 << int(_159);
        int _165 = _161 ? _163 : 0;
        int _167 = int(_153) & as_type<int>(_155);
        int _169 = _165 & _167;
        int _171 = _165 & int(_153);
        int _173 = int(spvFindUMSB(uint(_169)));
        int _175 = int(spvFindUMSB(uint(_171)));
        uint _177 = min(uint(_173), as_type<uint>(_151));
        int _179 = as_type<int>(_117);
        int _181 = int(_177);
        int _183 = 31;
        int _185;
        int _450 = _55(_179, _181, _183, _185, gl_SubgroupInvocationID);
        int _187 = _450;
        int _189 = int(_177);
        int _191 = int(_177);
        int _193 = 30;
        int _195;
        int _456 = _55(_189, _191, _193, _195, gl_SubgroupInvocationID);
        int _197 = _456;
        float _199 = precise::max(_117, as_type<float>(_187));
        int _201 = as_type<int>(_199);
        int _203 = _197;
        int _205 = 31;
        int _207;
        int _464 = _55(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _464;
        float _211 = precise::max(_199, as_type<float>(_209));
        int _213 = as_type<int>(_211);
        int _215 = _175;
        int _217 = 31;
        int _219;
        int _472 = _55(_213, _215, _217, _219, gl_SubgroupInvocationID);
        int _221 = _472;
        _147 = as_type<float>(_221);
    }
    _149 = false;
    float _223 = _147;
    float _225 = as_type<float>(gl_SubgroupInvocationID);
    bool _227 = _117 >= 1.0;
    bool _229 = isnan(_117);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    float _237 = -_117;
    float _239 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _241 = 1.0 / _239;
    int _243 = as_type<int>(_225) & 3;
    bool _245 = _243 != 0;
    float _247 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _249 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[1].w, _247);
    int _251 = as_type<int>(_225);
    if (!_245)
    {
        int _253 = _104 >> 31;
        int _255 = _108 >> 31;
        int _257 = _253 & 1;
        int _259 = _255 & 1;
        int _261 = _104 + _257;
        int _263 = _108 + _259;
        int _265 = _261 >> 1;
        int _267 = _263 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_223, _223, _223, _223), uint2(int2(_265, _267)));
        _251 = _265;
    }
    int _269 = _251;
    bool _271 = !_235;
    int _273 = _271 ? as_type<int>(_249) : 1065353216;
    out.gl_FragDepth = as_type<float>(_269);
    out.m_48.x = as_type<float>(_273);
    return main0_out_u{as_type<uint4>(out.m_48), out.gl_FragDepth};
}

