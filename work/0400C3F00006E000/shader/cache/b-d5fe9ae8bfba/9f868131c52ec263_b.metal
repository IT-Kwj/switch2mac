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
    float4 m_53 [[color(0)]];
    float4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _61(thread const int& _707, thread const int& _708, thread const int& _709, thread int& _710, thread uint& gl_SubgroupInvocationID)
{
    int _713 = _709 & 31;
    uint _715 = uint(int(uint(_709) >> uint(8)));
    int _717 = int(_715) & 31;
    float _719 = as_type<float>(gl_SubgroupInvocationID);
    int _721 = as_type<int>(_719) & _717;
    int _723 = ~_717;
    int _725 = _713 & _723;
    int _727 = _725 | _721;
    int _729 = as_type<int>(_719) ^ _708;
    bool _731 = uint(_729) <= uint(_727);
    _710 = _731 ? (-1) : 0;
    float _733 = spvSubgroupShuffle(as_type<float>(_707), uint(_729));
    uint _735 = uint(_731 ? as_type<int>(_733) : _707);
    return int(_735);
}

static inline __attribute__((always_inline))
int _62(thread const int& _783, thread const int& _784, thread const int& _785, thread int& _786, thread uint& gl_SubgroupInvocationID)
{
    int _789 = _785 & 31;
    uint _791 = uint(int(uint(_785) >> uint(8)));
    int _793 = int(_791) & 31;
    float _795 = as_type<float>(gl_SubgroupInvocationID);
    int _797 = as_type<int>(_795) & _793;
    int _799 = ~_793;
    int _801 = _789 & _799;
    int _803 = _801 | _797;
    int _805 = ~_793;
    int _807 = _784 & _805;
    int _809 = _807 | _797;
    bool _811 = uint(_809) <= uint(_803);
    _786 = _811 ? (-1) : 0;
    float _813 = spvSubgroupShuffle(as_type<float>(_783), uint(_809));
    uint _815 = uint(_811 ? as_type<int>(_813) : _783);
    return int(_815);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _158 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _367 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    uint _110 = spvSubgroupBallot(true).x;
    bool _114 = int(_110) != (-1);
    float _116 = trunc(_101);
    int _118 = int(_116);
    float _120 = trunc(_107);
    int _122 = int(_120);
    float _124 = precise::max(_89, _91);
    float _126 = _95 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _128 = precise::max(_93, _95);
    float _130 = precise::max(_124, _128);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_130, _130, _130, _130), uint2(int2(_118, _122)));
    float _156;
    if (!_114)
    {
        int _132 = as_type<int>(_130);
        int _134 = 1;
        int _136 = 31;
        int _138;
        int _445 = _61(_132, _134, _136, _138, gl_SubgroupInvocationID);
        int _140 = _445;
        float _142 = precise::max(_130, as_type<float>(_140));
        int _144 = as_type<int>(_142);
        int _146 = 2;
        int _148 = 31;
        int _150;
        int _453 = _61(_144, _146, _148, _150, gl_SubgroupInvocationID);
        int _152 = _453;
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
        bool _170 = int(_168) == 0;
        bool _172 = _168 < 32u;
        int _174 = 32 - int(_168);
        int _176 = int(_168) - 32;
        int _178 = 15 << int(_168);
        uint _180 = uint(int(uint(0) >> uint(_174)));
        int _182 = _178 | int(_180);
        int _184 = _170 ? 15 : _182;
        bool _186 = uint(_176) < 32u;
        int _188 = 0 << _176;
        int _190 = _186 ? _188 : 0;
        int _192 = _172 ? _184 : _190;
        int _194 = int(_162) & as_type<int>(_164);
        int _196 = _192 & _194;
        int _198 = _192 & int(_162);
        int _200 = int(spvFindUMSB(uint(_196)));
        int _202 = int(spvFindUMSB(uint(_198)));
        uint _204 = min(uint(_200), as_type<uint>(_160));
        int _206 = as_type<int>(_130);
        int _208 = int(_204);
        int _210 = 31;
        int _212;
        int _542 = _62(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _542;
        int _216 = int(_204);
        int _218 = int(_204);
        int _220 = 30;
        int _222;
        int _548 = _62(_216, _218, _220, _222, gl_SubgroupInvocationID);
        int _224 = _548;
        float _226 = precise::max(_130, as_type<float>(_214));
        int _228 = as_type<int>(_226);
        int _230 = _224;
        int _232 = 31;
        int _234;
        int _556 = _62(_228, _230, _232, _234, gl_SubgroupInvocationID);
        int _236 = _556;
        float _238 = precise::max(_226, as_type<float>(_236));
        int _240 = as_type<int>(_238);
        int _242 = _202;
        int _244 = 31;
        int _246;
        int _564 = _62(_240, _242, _244, _246, gl_SubgroupInvocationID);
        int _248 = _564;
        _156 = as_type<float>(_248);
    }
    _158 = false;
    float _250 = _156;
    float _252 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _256 = precise::min(_89, _91);
    float _258 = _84 * _252;
    int _260 = _122 * 2;
    float _262 = as_type<float>(gl_SubgroupInvocationID);
    float _264 = _82 * _254;
    float _266 = trunc(_258);
    int _268 = int(_266);
    float _270 = precise::min(_93, _95);
    float _272 = precise::min(_256, _270);
    int _274 = _118 & 1;
    float _276 = trunc(_264);
    int _278 = int(_276);
    float _280 = _272 * 16777215.0;
    int _282 = 2 & _260;
    int _284 = (-3) & _274;
    int _286 = _282 | _284;
    float _288 = trunc(_280);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    int _294 = as_type<int>(_262) & 3;
    bool _296 = _294 != 0;
    int _298 = _268 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _300 = _298 + _278;
    int _302 = _300 * 4;
    int _304 = _302 + _286;
    int _306 = _304 << 2;
    if (!_296)
    {
        int _308 = _118 >> 31;
        int _310 = _122 >> 31;
        int _312 = _308 & 1;
        int _314 = _310 & 1;
        int _316 = _118 + _312;
        int _318 = _122 + _314;
        int _320 = _316 >> 1;
        int _322 = _318 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_250, _250, _250, _250), uint2(int2(_320, _322)));
    }
    float _324 = -_95;
    float _326 = _324 + 1.0;
    uint _328 = uint(int(uint(_306) >> uint(2)));
    uint _690 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_328)], _292, memory_order_relaxed);
    uint _330 = _690;
    float _332 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
    out.gl_FragDepth = _332;
    out.m_53.x = _95;
    out.m_53.y = _95;
    out.m_53.z = _95;
    out.m_53.w = _95;
    out.m_55.x = _130;
    return out;
}

