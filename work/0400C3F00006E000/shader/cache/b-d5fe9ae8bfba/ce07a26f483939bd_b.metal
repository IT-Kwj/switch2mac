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
int _59(thread const int& _712, thread const int& _713, thread const int& _714, thread int& _715, thread uint& gl_SubgroupInvocationID)
{
    int _718 = _714 & 31;
    uint _720 = uint(int(uint(_714) >> uint(8)));
    int _722 = int(_720) & 31;
    float _724 = as_type<float>(gl_SubgroupInvocationID);
    int _726 = as_type<int>(_724) & _722;
    int _728 = ~_722;
    int _730 = _718 & _728;
    int _732 = _730 | _726;
    int _734 = as_type<int>(_724) ^ _713;
    bool _736 = uint(_734) <= uint(_732);
    _715 = _736 ? (-1) : 0;
    float _738 = spvSubgroupShuffle(as_type<float>(_712), uint(_734));
    uint _740 = uint(_736 ? as_type<int>(_738) : _712);
    return int(_740);
}

static inline __attribute__((always_inline))
int _60(thread const int& _788, thread const int& _789, thread const int& _790, thread int& _791, thread uint& gl_SubgroupInvocationID)
{
    int _794 = _790 & 31;
    uint _796 = uint(int(uint(_790) >> uint(8)));
    int _798 = int(_796) & 31;
    float _800 = as_type<float>(gl_SubgroupInvocationID);
    int _802 = as_type<int>(_800) & _798;
    int _804 = ~_798;
    int _806 = _794 & _804;
    int _808 = _806 | _802;
    int _810 = ~_798;
    int _812 = _789 & _810;
    int _814 = _812 | _802;
    bool _816 = uint(_814) <= uint(_808);
    _791 = _816 ? (-1) : 0;
    float _818 = spvSubgroupShuffle(as_type<float>(_788), uint(_814));
    uint _820 = uint(_816 ? as_type<int>(_818) : _788);
    return int(_820);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
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
    float2 _369 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369)), int2(0), component::x).xyzw;
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
    float _124 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _126 = precise::max(_91, _93);
    float _128 = precise::max(_122, _126);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_128, _128, _128, _128), uint2(int2(_116, _120)));
    float _154;
    if (!_112)
    {
        int _130 = as_type<int>(_128);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _447 = _59(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _447;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _455 = _59(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _455;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_128);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _544 = _60(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _544;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _550 = _60(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _550;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _558 = _60(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _558;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _566 = _60(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _566;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _252 = as_type<float>(gl_SubgroupInvocationID);
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _256 = precise::min(_87, _89);
    float _258 = _80 * _250;
    float _260 = precise::min(_91, _93);
    float _262 = _82 * _254;
    int _264 = _120 * 2;
    float _266 = precise::min(_256, _260);
    float _268 = trunc(_258);
    int _270 = int(_268);
    int _272 = _116 & 1;
    float _274 = _266 * 16777215.0;
    int _276 = 2 & _264;
    int _278 = (-3) & _272;
    int _280 = _276 | _278;
    float _282 = trunc(_262);
    int _284 = int(_282);
    int _286 = as_type<int>(_252) & 3;
    bool _288 = _286 != 0;
    float _290 = trunc(_274);
    float _292 = precise::max(_290, 0.0);
    uint _294 = uint(_292);
    int _296 = _284 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _298 = _296 + _270;
    int _300 = _298 * 4;
    int _302 = _300 + _280;
    int _304 = _302 << 2;
    if (!_288)
    {
        int _306 = _116 >> 31;
        int _308 = _120 >> 31;
        int _310 = _306 & 1;
        int _312 = _308 & 1;
        int _314 = _116 + _310;
        int _316 = _120 + _312;
        int _318 = _314 >> 1;
        int _320 = _316 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_318, _320)));
    }
    float _322 = -_93;
    float _324 = _322 + 1.0;
    uint _326 = uint(int(uint(_304) >> uint(2)));
    uint _692 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_326)], _294, memory_order_relaxed);
    uint _328 = _692;
    float _330 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
    float _332 = 1.0 / _330;
    float _334 = _124 * _332;
    out.gl_FragDepth = _334;
    out.m_53.x = _93;
    out.m_53.y = _93;
    out.m_53.z = _93;
    out.m_53.w = _93;
    return out;
}

