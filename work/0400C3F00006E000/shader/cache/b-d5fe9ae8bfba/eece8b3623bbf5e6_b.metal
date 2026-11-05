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
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _515, thread const int& _516, thread const int& _517, thread int& _518, thread uint& gl_SubgroupInvocationID)
{
    int _521 = _517 & 31;
    uint _523 = uint(int(uint(_517) >> uint(8)));
    int _525 = int(_523) & 31;
    float _527 = as_type<float>(gl_SubgroupInvocationID);
    int _529 = as_type<int>(_527) & _525;
    int _531 = ~_525;
    int _533 = _521 & _531;
    int _535 = _533 | _529;
    int _537 = as_type<int>(_527) ^ _516;
    bool _539 = uint(_537) <= uint(_535);
    _518 = _539 ? (-1) : 0;
    float _541 = spvSubgroupShuffle(as_type<float>(_515), uint(_537));
    uint _543 = uint(_539 ? as_type<int>(_541) : _515);
    return int(_543);
}

static inline __attribute__((always_inline))
int _52(thread const int& _591, thread const int& _592, thread const int& _593, thread int& _594, thread uint& gl_SubgroupInvocationID)
{
    int _597 = _593 & 31;
    uint _599 = uint(int(uint(_593) >> uint(8)));
    int _601 = int(_599) & 31;
    float _603 = as_type<float>(gl_SubgroupInvocationID);
    int _605 = as_type<int>(_603) & _601;
    int _607 = ~_601;
    int _609 = _597 & _607;
    int _611 = _609 | _605;
    int _613 = ~_601;
    int _615 = _592 & _613;
    int _617 = _615 | _605;
    bool _619 = uint(_617) <= uint(_611);
    _594 = _619 ? (-1) : 0;
    float _621 = spvSubgroupShuffle(as_type<float>(_591), uint(_617));
    uint _623 = uint(_619 ? as_type<int>(_621) : _591);
    return int(_623);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _158 = false;
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
    float2 _289 = float2(_72, _74);
    float4 _77 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289)), int2(0), component::x).xyzw;
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
    float _109 = _85 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _111 = precise::max(_83, _85);
    float _113 = -_85;
    float _115 = _113 + 1.0;
    uint _118 = spvSubgroupBallot(true).x;
    float _120 = precise::max(_107, _111);
    float _122 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[0].x, _109);
    bool _126 = int(_118) != (-1);
    float _128 = 1.0 / _122;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_101, _105)));
    float _130 = _109 * _128;
    float _156;
    if (!_126)
    {
        int _132 = as_type<int>(_120);
        int _134 = 1;
        int _136 = 31;
        int _138;
        int _381 = _51(_132, _134, _136, _138, gl_SubgroupInvocationID);
        int _140 = _381;
        float _142 = precise::max(_120, as_type<float>(_140));
        int _144 = as_type<int>(_142);
        int _146 = 2;
        int _148 = 31;
        int _150;
        int _389 = _51(_144, _146, _148, _150, gl_SubgroupInvocationID);
        int _152 = _389;
        float _154 = precise::max(_142, as_type<float>(_152));
        _156 = _154;
        _158 = true;
    }
    else
    {
        float _160 = as_type<float>(gl_SubgroupInvocationID);
        uint _162 = spvSubgroupBallot(true).x;
        float _164 = as_type<float>(gl_SubgroupLtMask.x);
        int _166 = as_type<int>(_160) & (-4);
        uint _168 = min(uint(_166), 32u);
        bool _170 = _168 < 32u;
        int _172 = 15 << int(_168);
        int _174 = _170 ? _172 : 0;
        int _176 = int(_162) & as_type<int>(_164);
        int _178 = _174 & _176;
        int _180 = _174 & int(_162);
        int _182 = int(spvFindUMSB(uint(_178)));
        int _184 = int(spvFindUMSB(uint(_180)));
        uint _186 = min(uint(_182), as_type<uint>(_160));
        int _188 = as_type<int>(_120);
        int _190 = int(_186);
        int _192 = 31;
        int _194;
        int _449 = _52(_188, _190, _192, _194, gl_SubgroupInvocationID);
        int _196 = _449;
        int _198 = int(_186);
        int _200 = int(_186);
        int _202 = 30;
        int _204;
        int _455 = _52(_198, _200, _202, _204, gl_SubgroupInvocationID);
        int _206 = _455;
        float _208 = precise::max(_120, as_type<float>(_196));
        int _210 = as_type<int>(_208);
        int _212 = _206;
        int _214 = 31;
        int _216;
        int _463 = _52(_210, _212, _214, _216, gl_SubgroupInvocationID);
        int _218 = _463;
        float _220 = precise::max(_208, as_type<float>(_218));
        int _222 = as_type<int>(_220);
        int _224 = _184;
        int _226 = 31;
        int _228;
        int _471 = _52(_222, _224, _226, _228, gl_SubgroupInvocationID);
        int _230 = _471;
        _156 = as_type<float>(_230);
    }
    _158 = false;
    float _232 = _156;
    float _234 = as_type<float>(gl_SubgroupInvocationID);
    int _236 = as_type<int>(_234) & 3;
    bool _238 = _236 != 0;
    if (_238)
    {
        out.gl_FragDepth = _130;
        return out;
    }
    int _240 = _101 >> 31;
    int _242 = _105 >> 31;
    int _244 = _240 & 1;
    int _246 = _242 & 1;
    int _248 = _101 + _244;
    int _250 = _105 + _246;
    int _252 = _248 >> 1;
    int _254 = _250 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_232, _232, _232, _232), uint2(int2(_252, _254)));
    out.gl_FragDepth = _130;
    return out;
}

