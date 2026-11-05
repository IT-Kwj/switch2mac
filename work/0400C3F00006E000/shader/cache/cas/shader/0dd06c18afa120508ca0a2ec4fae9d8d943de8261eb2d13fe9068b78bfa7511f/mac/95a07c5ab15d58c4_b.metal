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
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _59(thread const int& _702, thread const int& _703, thread const int& _704, thread int& _705, thread uint& gl_SubgroupInvocationID)
{
    int _708 = _704 & 31;
    uint _710 = uint(int(uint(_704) >> uint(8)));
    int _712 = int(_710) & 31;
    float _714 = as_type<float>(gl_SubgroupInvocationID);
    int _716 = as_type<int>(_714) & _712;
    int _718 = ~_712;
    int _720 = _708 & _718;
    int _722 = _720 | _716;
    int _724 = as_type<int>(_714) ^ _703;
    bool _726 = uint(_724) <= uint(_722);
    _705 = _726 ? (-1) : 0;
    float _728 = spvSubgroupShuffle(as_type<float>(_702), uint(_724));
    uint _730 = uint(_726 ? as_type<int>(_728) : _702);
    return int(_730);
}

static inline __attribute__((always_inline))
int _60(thread const int& _778, thread const int& _779, thread const int& _780, thread int& _781, thread uint& gl_SubgroupInvocationID)
{
    int _784 = _780 & 31;
    uint _786 = uint(int(uint(_780) >> uint(8)));
    int _788 = int(_786) & 31;
    float _790 = as_type<float>(gl_SubgroupInvocationID);
    int _792 = as_type<int>(_790) & _788;
    int _794 = ~_788;
    int _796 = _784 & _794;
    int _798 = _796 | _792;
    int _800 = ~_788;
    int _802 = _779 & _800;
    int _804 = _802 | _792;
    bool _806 = uint(_804) <= uint(_798);
    _781 = _806 ? (-1) : 0;
    float _808 = spvSubgroupShuffle(as_type<float>(_778), uint(_804));
    uint _810 = uint(_806 ? as_type<int>(_808) : _778);
    return int(_810);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _166 = false;
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
    float2 _365 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_365, float2(0.0), isnan(_365)), int2(0), component::x).xyzw;
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
    float _107 = trunc(_99);
    int _109 = int(_107);
    float _111 = trunc(_105);
    int _113 = int(_111);
    float _115 = precise::max(_87, _89);
    float _117 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _119 = precise::max(_91, _93);
    uint _122 = spvSubgroupBallot(true).x;
    float _124 = precise::max(_115, _119);
    float _126 = -_93;
    float _128 = _126 + 1.0;
    bool _132 = int(_122) != (-1);
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].x, _117);
    float _136 = 1.0 / _134;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_124, _124, _124, _124), uint2(int2(_109, _113)));
    float _138 = _117 * _136;
    float _164;
    if (!_132)
    {
        int _140 = as_type<int>(_124);
        int _142 = 1;
        int _144 = 31;
        int _146;
        int _457 = _59(_140, _142, _144, _146, gl_SubgroupInvocationID);
        int _148 = _457;
        float _150 = precise::max(_124, as_type<float>(_148));
        int _152 = as_type<int>(_150);
        int _154 = 2;
        int _156 = 31;
        int _158;
        int _465 = _59(_152, _154, _156, _158, gl_SubgroupInvocationID);
        int _160 = _465;
        float _162 = precise::max(_150, as_type<float>(_160));
        _164 = _162;
        _166 = true;
    }
    else
    {
        float _168 = as_type<float>(gl_SubgroupInvocationID);
        uint _170 = spvSubgroupBallot(true).x;
        float _172 = as_type<float>(gl_SubgroupLtMask.x);
        int _174 = as_type<int>(_168) & (-4);
        uint _176 = min(uint(_174), 32u);
        bool _178 = int(_176) == 0;
        bool _180 = _176 < 32u;
        int _182 = 32 - int(_176);
        int _184 = int(_176) - 32;
        int _186 = 15 << int(_176);
        uint _188 = uint(int(uint(0) >> uint(_182)));
        int _190 = _186 | int(_188);
        int _192 = _178 ? 15 : _190;
        bool _194 = uint(_184) < 32u;
        int _196 = 0 << _184;
        int _198 = _194 ? _196 : 0;
        int _200 = _180 ? _192 : _198;
        int _202 = int(_170) & as_type<int>(_172);
        int _204 = _200 & _202;
        int _206 = _200 & int(_170);
        int _208 = int(spvFindUMSB(uint(_204)));
        int _210 = int(spvFindUMSB(uint(_206)));
        uint _212 = min(uint(_208), as_type<uint>(_168));
        int _214 = as_type<int>(_124);
        int _216 = int(_212);
        int _218 = 31;
        int _220;
        int _554 = _60(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _554;
        int _224 = int(_212);
        int _226 = int(_212);
        int _228 = 30;
        int _230;
        int _560 = _60(_224, _226, _228, _230, gl_SubgroupInvocationID);
        int _232 = _560;
        float _234 = precise::max(_124, as_type<float>(_222));
        int _236 = as_type<int>(_234);
        int _238 = _232;
        int _240 = 31;
        int _242;
        int _568 = _60(_236, _238, _240, _242, gl_SubgroupInvocationID);
        int _244 = _568;
        float _246 = precise::max(_234, as_type<float>(_244));
        int _248 = as_type<int>(_246);
        int _250 = _210;
        int _252 = 31;
        int _254;
        int _576 = _60(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _576;
        _164 = as_type<float>(_256);
    }
    _166 = false;
    float _258 = _164;
    float _260 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _262 = _113 * 2;
    float _264 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _266 = _109 & 1;
    float _268 = _80 * _260;
    float _270 = _82 * _264;
    int _272 = 2 & _262;
    int _274 = (-3) & _266;
    int _276 = _272 | _274;
    float _278 = as_type<float>(gl_SubgroupInvocationID);
    float _280 = trunc(_268);
    int _282 = int(_280);
    float _284 = trunc(_270);
    int _286 = int(_284);
    int _288 = as_type<int>(_278) & 3;
    bool _290 = _288 != 0;
    int _292 = _286 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _294 = _292 + _282;
    float _296 = _124 * 16777215.0;
    int _298 = _294 * 4;
    int _300 = _298 + _276;
    float _302 = trunc(_296);
    float _304 = precise::max(_302, 0.0);
    uint _306 = uint(_304);
    int _308 = _300 << 2;
    int _310 = _308 + 9728;
    if (!_290)
    {
        int _312 = _109 >> 31;
        int _314 = _113 >> 31;
        int _316 = _312 & 1;
        int _318 = _314 & 1;
        int _320 = _109 + _316;
        int _322 = _113 + _318;
        int _324 = _320 >> 1;
        int _326 = _322 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_258, _258, _258, _258), uint2(int2(_324, _326)));
    }
    uint _328 = uint(int(uint(_310) >> uint(2)));
    uint _692 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_328)], _306, memory_order_relaxed);
    uint _330 = _692;
    out.gl_FragDepth = _138;
    out.m_53.x = _93;
    out.m_53.y = _93;
    out.m_53.z = _93;
    out.m_53.w = _93;
    return out;
}

