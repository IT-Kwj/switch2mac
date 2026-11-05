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
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _562, thread const int& _563, thread const int& _564, thread int& _565, thread uint& gl_SubgroupInvocationID)
{
    int _568 = _564 & 31;
    uint _570 = uint(int(uint(_564) >> uint(8)));
    int _572 = int(_570) & 31;
    float _574 = as_type<float>(gl_SubgroupInvocationID);
    int _576 = as_type<int>(_574) & _572;
    int _578 = ~_572;
    int _580 = _568 & _578;
    int _582 = _580 | _576;
    int _584 = as_type<int>(_574) ^ _563;
    bool _586 = uint(_584) <= uint(_582);
    _565 = _586 ? (-1) : 0;
    float _588 = spvSubgroupShuffle(as_type<float>(_562), uint(_584));
    uint _590 = uint(_586 ? as_type<int>(_588) : _562);
    return int(_590);
}

static inline __attribute__((always_inline))
int _52(thread const int& _638, thread const int& _639, thread const int& _640, thread int& _641, thread uint& gl_SubgroupInvocationID)
{
    int _644 = _640 & 31;
    uint _646 = uint(int(uint(_640) >> uint(8)));
    int _648 = int(_646) & 31;
    float _650 = as_type<float>(gl_SubgroupInvocationID);
    int _652 = as_type<int>(_650) & _648;
    int _654 = ~_648;
    int _656 = _644 & _654;
    int _658 = _656 | _652;
    int _660 = ~_648;
    int _662 = _639 & _660;
    int _664 = _662 | _652;
    bool _666 = uint(_664) <= uint(_658);
    _641 = _666 ? (-1) : 0;
    float _668 = spvSubgroupShuffle(as_type<float>(_638), uint(_664));
    uint _670 = uint(_666 ? as_type<int>(_668) : _638);
    return int(_670);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _168 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float2 _299 = float2(_72, _74);
    float4 _77 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), int2(0), component::x).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float _87 = gl_FragCoord.x;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = gl_FragCoord.y;
    float _95 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _97 = _93 / _95;
    float _99 = trunc(_91);
    int _101 = int(_99);
    float _103 = trunc(_97);
    int _105 = int(_103);
    float _107 = precise::max(_79, _81);
    float _109 = -_85;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _113 = precise::max(_83, _85);
    uint _116 = spvSubgroupBallot(true).x;
    float _118 = 1.0 / _111;
    float _120 = precise::max(_107, _113);
    bool _124 = int(_116) != (-1);
    bool _126 = _85 != 1.0;
    bool _128 = isnan(_85);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_101, _105)));
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].w, _136);
    int _140 = _134 ? as_type<int>(_138) : 1065353216;
    float _166;
    if (!_124)
    {
        int _142 = as_type<int>(_120);
        int _144 = 1;
        int _146 = 31;
        int _148;
        int _405 = _51(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _405;
        float _152 = precise::max(_120, as_type<float>(_150));
        int _154 = as_type<int>(_152);
        int _156 = 2;
        int _158 = 31;
        int _160;
        int _413 = _51(_154, _156, _158, _160, gl_SubgroupInvocationID);
        int _162 = _413;
        float _164 = precise::max(_152, as_type<float>(_162));
        _166 = _164;
        _168 = true;
    }
    else
    {
        float _170 = as_type<float>(gl_SubgroupInvocationID);
        uint _172 = spvSubgroupBallot(true).x;
        float _174 = as_type<float>(gl_SubgroupLtMask.x);
        int _176 = as_type<int>(_170) & (-4);
        uint _178 = min(uint(_176), 32u);
        bool _180 = _178 < 32u;
        int _182 = 15 << int(_178);
        int _184 = _180 ? _182 : 0;
        int _186 = int(_172) & as_type<int>(_174);
        int _188 = _184 & _186;
        int _190 = _184 & int(_172);
        int _192 = int(spvFindUMSB(uint(_188)));
        int _194 = int(spvFindUMSB(uint(_190)));
        uint _196 = min(uint(_192), as_type<uint>(_170));
        int _198 = as_type<int>(_120);
        int _200 = int(_196);
        int _202 = 31;
        int _204;
        int _473 = _52(_198, _200, _202, _204, gl_SubgroupInvocationID);
        int _206 = _473;
        int _208 = int(_196);
        int _210 = int(_196);
        int _212 = 30;
        int _214;
        int _479 = _52(_208, _210, _212, _214, gl_SubgroupInvocationID);
        int _216 = _479;
        float _218 = precise::max(_120, as_type<float>(_206));
        int _220 = as_type<int>(_218);
        int _222 = _216;
        int _224 = 31;
        int _226;
        int _487 = _52(_220, _222, _224, _226, gl_SubgroupInvocationID);
        int _228 = _487;
        float _230 = precise::max(_218, as_type<float>(_228));
        int _232 = as_type<int>(_230);
        int _234 = _194;
        int _236 = 31;
        int _238;
        int _495 = _52(_232, _234, _236, _238, gl_SubgroupInvocationID);
        int _240 = _495;
        _166 = as_type<float>(_240);
    }
    _168 = false;
    float _242 = _166;
    float _244 = as_type<float>(gl_SubgroupInvocationID);
    int _246 = as_type<int>(_244) & 3;
    bool _248 = _246 != 0;
    if (_248)
    {
        out.m_45.x = as_type<float>(_140);
        out.m_45.y = as_type<float>(_140);
        out.m_45.z = as_type<float>(_140);
        out.m_45.w = as_type<float>(_140);
        return out;
    }
    int _250 = _101 >> 31;
    int _252 = _105 >> 31;
    int _254 = _250 & 1;
    int _256 = _252 & 1;
    int _258 = _101 + _254;
    int _260 = _105 + _256;
    int _262 = _258 >> 1;
    int _264 = _260 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_242, _242, _242, _242), uint2(int2(_262, _264)));
    out.m_45.x = as_type<float>(_140);
    out.m_45.y = as_type<float>(_140);
    out.m_45.z = as_type<float>(_140);
    out.m_45.w = as_type<float>(_140);
    return out;
}


struct main0_out_u
{
    uint4 m_45 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _168 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float2 _299 = float2(_72, _74);
    float4 _77 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), int2(0), component::x).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float _87 = gl_FragCoord.x;
    float _89 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _91 = _87 / _89;
    float _93 = gl_FragCoord.y;
    float _95 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _97 = _93 / _95;
    float _99 = trunc(_91);
    int _101 = int(_99);
    float _103 = trunc(_97);
    int _105 = int(_103);
    float _107 = precise::max(_79, _81);
    float _109 = -_85;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _113 = precise::max(_83, _85);
    uint _116 = spvSubgroupBallot(true).x;
    float _118 = 1.0 / _111;
    float _120 = precise::max(_107, _113);
    bool _124 = int(_116) != (-1);
    bool _126 = _85 != 1.0;
    bool _128 = isnan(_85);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_101, _105)));
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].w, _136);
    int _140 = _134 ? as_type<int>(_138) : 1065353216;
    float _166;
    if (!_124)
    {
        int _142 = as_type<int>(_120);
        int _144 = 1;
        int _146 = 31;
        int _148;
        int _405 = _51(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _405;
        float _152 = precise::max(_120, as_type<float>(_150));
        int _154 = as_type<int>(_152);
        int _156 = 2;
        int _158 = 31;
        int _160;
        int _413 = _51(_154, _156, _158, _160, gl_SubgroupInvocationID);
        int _162 = _413;
        float _164 = precise::max(_152, as_type<float>(_162));
        _166 = _164;
        _168 = true;
    }
    else
    {
        float _170 = as_type<float>(gl_SubgroupInvocationID);
        uint _172 = spvSubgroupBallot(true).x;
        float _174 = as_type<float>(gl_SubgroupLtMask.x);
        int _176 = as_type<int>(_170) & (-4);
        uint _178 = min(uint(_176), 32u);
        bool _180 = _178 < 32u;
        int _182 = 15 << int(_178);
        int _184 = _180 ? _182 : 0;
        int _186 = int(_172) & as_type<int>(_174);
        int _188 = _184 & _186;
        int _190 = _184 & int(_172);
        int _192 = int(spvFindUMSB(uint(_188)));
        int _194 = int(spvFindUMSB(uint(_190)));
        uint _196 = min(uint(_192), as_type<uint>(_170));
        int _198 = as_type<int>(_120);
        int _200 = int(_196);
        int _202 = 31;
        int _204;
        int _473 = _52(_198, _200, _202, _204, gl_SubgroupInvocationID);
        int _206 = _473;
        int _208 = int(_196);
        int _210 = int(_196);
        int _212 = 30;
        int _214;
        int _479 = _52(_208, _210, _212, _214, gl_SubgroupInvocationID);
        int _216 = _479;
        float _218 = precise::max(_120, as_type<float>(_206));
        int _220 = as_type<int>(_218);
        int _222 = _216;
        int _224 = 31;
        int _226;
        int _487 = _52(_220, _222, _224, _226, gl_SubgroupInvocationID);
        int _228 = _487;
        float _230 = precise::max(_218, as_type<float>(_228));
        int _232 = as_type<int>(_230);
        int _234 = _194;
        int _236 = 31;
        int _238;
        int _495 = _52(_232, _234, _236, _238, gl_SubgroupInvocationID);
        int _240 = _495;
        _166 = as_type<float>(_240);
    }
    _168 = false;
    float _242 = _166;
    float _244 = as_type<float>(gl_SubgroupInvocationID);
    int _246 = as_type<int>(_244) & 3;
    bool _248 = _246 != 0;
    if (_248)
    {
        out.m_45.x = as_type<float>(_140);
        out.m_45.y = as_type<float>(_140);
        out.m_45.z = as_type<float>(_140);
        out.m_45.w = as_type<float>(_140);
        return main0_out_u{as_type<uint4>(out.m_45)};
    }
    int _250 = _101 >> 31;
    int _252 = _105 >> 31;
    int _254 = _250 & 1;
    int _256 = _252 & 1;
    int _258 = _101 + _254;
    int _260 = _105 + _256;
    int _262 = _258 >> 1;
    int _264 = _260 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_242, _242, _242, _242), uint2(int2(_262, _264)));
    out.m_45.x = as_type<float>(_140);
    out.m_45.y = as_type<float>(_140);
    out.m_45.z = as_type<float>(_140);
    out.m_45.w = as_type<float>(_140);
    return main0_out_u{as_type<uint4>(out.m_45)};
}

