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
    float4 m_53 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _710, thread const int& _711, thread const int& _712, thread int& _713, thread uint& gl_SubgroupInvocationID)
{
    int _716 = _712 & 31;
    uint _718 = uint(int(uint(_712) >> uint(8)));
    int _720 = int(_718) & 31;
    float _722 = as_type<float>(gl_SubgroupInvocationID);
    int _724 = as_type<int>(_722) & _720;
    int _726 = ~_720;
    int _728 = _716 & _726;
    int _730 = _728 | _724;
    int _732 = as_type<int>(_722) ^ _711;
    bool _734 = uint(_732) <= uint(_730);
    _713 = _734 ? (-1) : 0;
    float _736 = spvSubgroupShuffle(as_type<float>(_710), uint(_732));
    uint _738 = uint(_734 ? as_type<int>(_736) : _710);
    return int(_738);
}

static inline __attribute__((always_inline))
int _60(thread const int& _786, thread const int& _787, thread const int& _788, thread int& _789, thread uint& gl_SubgroupInvocationID)
{
    int _792 = _788 & 31;
    uint _794 = uint(int(uint(_788) >> uint(8)));
    int _796 = int(_794) & 31;
    float _798 = as_type<float>(gl_SubgroupInvocationID);
    int _800 = as_type<int>(_798) & _796;
    int _802 = ~_796;
    int _804 = _792 & _802;
    int _806 = _804 | _800;
    int _808 = ~_796;
    int _810 = _787 & _808;
    int _812 = _810 | _800;
    bool _814 = uint(_812) <= uint(_806);
    _789 = _814 ? (-1) : 0;
    float _816 = spvSubgroupShuffle(as_type<float>(_786), uint(_812));
    uint _818 = uint(_814 ? as_type<int>(_816) : _786);
    return int(_818);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _154 = false;
    float _64 = gl_FragCoord.w;
    float _66 = in.m_40.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_40.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _371 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371)), int2(0), component::x).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = gl_FragCoord.x;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = gl_FragCoord.y;
    float _103 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _105 = _101 / _103;
    uint _108 = spvSubgroupBallot(true).x;
    bool _112 = int(_108) != (-1);
    float _114 = trunc(_99);
    int _116 = int(_114);
    float _118 = trunc(_105);
    int _120 = int(_118);
    float _122 = precise::max(_87, _89);
    float _124 = precise::max(_91, _93);
    float _126 = precise::max(_122, _124);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_126, _126, _126, _126), uint2(int2(_116, _120)));
    float _152;
    if (!_112)
    {
        int _128 = as_type<int>(_126);
        int _130 = 1;
        int _132 = 31;
        int _134;
        int _445 = _59(_128, _130, _132, _134, gl_SubgroupInvocationID);
        int _136 = _445;
        float _138 = precise::max(_126, as_type<float>(_136));
        int _140 = as_type<int>(_138);
        int _142 = 2;
        int _144 = 31;
        int _146;
        int _453 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _453;
        float _150 = precise::max(_138, as_type<float>(_148));
        _152 = _150;
        _154 = true;
    }
    else
    {
        float _156 = as_type<float>(gl_SubgroupInvocationID);
        uint _158 = spvSubgroupBallot(true).x;
        float _160 = as_type<float>(gl_SubgroupLtMask.x);
        int _162 = as_type<int>(_156) & (-4);
        uint _164 = min(uint(_162), 32u);
        bool _166 = int(_164) == 0;
        bool _168 = _164 < 32u;
        int _170 = 32 - int(_164);
        int _172 = int(_164) - 32;
        int _174 = 15 << int(_164);
        uint _176 = uint(int(uint(0) >> uint(_170)));
        int _178 = _174 | int(_176);
        int _180 = _166 ? 15 : _178;
        bool _182 = uint(_172) < 32u;
        int _184 = 0 << _172;
        int _186 = _182 ? _184 : 0;
        int _188 = _168 ? _180 : _186;
        int _190 = int(_158) & as_type<int>(_160);
        int _192 = _188 & _190;
        int _194 = _188 & int(_158);
        int _196 = int(spvFindUMSB(uint(_192)));
        int _198 = int(spvFindUMSB(uint(_194)));
        uint _200 = min(uint(_196), as_type<uint>(_156));
        int _202 = as_type<int>(_126);
        int _204 = int(_200);
        int _206 = 31;
        int _208;
        int _542 = _60(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _542;
        int _212 = int(_200);
        int _214 = int(_200);
        int _216 = 30;
        int _218;
        int _548 = _60(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _548;
        float _222 = precise::max(_126, as_type<float>(_210));
        int _224 = as_type<int>(_222);
        int _226 = _220;
        int _228 = 31;
        int _230;
        int _556 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _556;
        float _234 = precise::max(_222, as_type<float>(_232));
        int _236 = as_type<int>(_234);
        int _238 = _198;
        int _240 = 31;
        int _242;
        int _564 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _564;
        _152 = as_type<float>(_244);
    }
    _154 = false;
    float _246 = _152;
    float _248 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _250 = _120 * 2;
    float _252 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _254 = precise::min(_87, _89);
    float _256 = _80 * _248;
    int _258 = _116 & 1;
    float _260 = _82 * _252;
    float _262 = as_type<float>(gl_SubgroupInvocationID);
    int _264 = 2 & _250;
    int _266 = (-3) & _258;
    int _268 = _264 | _266;
    float _270 = trunc(_256);
    int _272 = int(_270);
    float _274 = trunc(_260);
    int _276 = int(_274);
    int _278 = as_type<int>(_262) & 3;
    bool _280 = _278 != 0;
    int _282 = _276 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _284 = _282 + _272;
    float _286 = precise::min(_91, _93);
    float _288 = _126 * 16777215.0;
    int _290 = _284 * 4;
    int _292 = _290 + _268;
    float _294 = precise::min(_254, _286);
    float _296 = trunc(_288);
    float _298 = precise::max(_296, 0.0);
    uint _300 = uint(_298);
    int _302 = _292 * 4;
    float _304 = _294 * 16777215.0;
    int _306 = _302 + 9728;
    float _308 = trunc(_304);
    float _310 = precise::max(_308, 0.0);
    uint _312 = uint(_310);
    if (!_280)
    {
        int _314 = _116 >> 31;
        int _316 = _120 >> 31;
        int _318 = _314 & 1;
        int _320 = _316 & 1;
        int _322 = _116 + _318;
        int _324 = _120 + _320;
        int _326 = _322 >> 1;
        int _328 = _324 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_246, _246, _246, _246), uint2(int2(_326, _328)));
    }
    uint _330 = uint(int(uint(_302) >> uint(2)));
    uint _697 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_330)], _312, memory_order_relaxed);
    uint _332 = _697;
    uint _334 = uint(int(uint(_306) >> uint(2)));
    uint _705 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_334)], _300, memory_order_relaxed);
    uint _336 = _705;
    out.gl_FragDepth = as_type<float>(_300);
    out.m_53.x = _126;
    return out;
}

