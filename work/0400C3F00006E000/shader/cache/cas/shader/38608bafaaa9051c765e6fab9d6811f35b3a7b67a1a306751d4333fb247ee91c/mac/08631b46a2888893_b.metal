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
int _59(thread const int& _745, thread const int& _746, thread const int& _747, thread int& _748, thread uint& gl_SubgroupInvocationID)
{
    int _751 = _747 & 31;
    uint _753 = uint(int(uint(_747) >> uint(8)));
    int _755 = int(_753) & 31;
    float _757 = as_type<float>(gl_SubgroupInvocationID);
    int _759 = as_type<int>(_757) & _755;
    int _761 = ~_755;
    int _763 = _751 & _761;
    int _765 = _763 | _759;
    int _767 = as_type<int>(_757) ^ _746;
    bool _769 = uint(_767) <= uint(_765);
    _748 = _769 ? (-1) : 0;
    float _771 = spvSubgroupShuffle(as_type<float>(_745), uint(_767));
    uint _773 = uint(_769 ? as_type<int>(_771) : _745);
    return int(_773);
}

static inline __attribute__((always_inline))
int _60(thread const int& _821, thread const int& _822, thread const int& _823, thread int& _824, thread uint& gl_SubgroupInvocationID)
{
    int _827 = _823 & 31;
    uint _829 = uint(int(uint(_823) >> uint(8)));
    int _831 = int(_829) & 31;
    float _833 = as_type<float>(gl_SubgroupInvocationID);
    int _835 = as_type<int>(_833) & _831;
    int _837 = ~_831;
    int _839 = _827 & _837;
    int _841 = _839 | _835;
    int _843 = ~_831;
    int _845 = _822 & _843;
    int _847 = _845 | _835;
    bool _849 = uint(_847) <= uint(_841);
    _824 = _849 ? (-1) : 0;
    float _851 = spvSubgroupShuffle(as_type<float>(_821), uint(_847));
    uint _853 = uint(_849 ? as_type<int>(_851) : _821);
    return int(_853);
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
    float2 _383 = float2(_80, _82);
    float4 _85 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383)), int2(0), component::x).xyzw;
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
        int _461 = _59(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _461;
        float _140 = precise::max(_128, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _469 = _59(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _469;
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
        int _558 = _60(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _558;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _564 = _60(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _564;
        float _224 = precise::max(_128, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _572 = _60(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _572;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _580 = _60(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _580;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _252 = _128 * 16777215.0;
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _256 = precise::min(_87, _89);
    float _258 = _80 * _250;
    int _260 = _120 * 2;
    float _262 = _82 * _254;
    int _264 = _116 & 1;
    float _266 = as_type<float>(gl_SubgroupInvocationID);
    float _268 = precise::min(_91, _93);
    float _270 = trunc(_258);
    int _272 = int(_270);
    int _274 = 2 & _260;
    int _276 = (-3) & _264;
    int _278 = _274 | _276;
    float _280 = precise::min(_256, _268);
    float _282 = trunc(_262);
    int _284 = int(_282);
    float _286 = trunc(_252);
    float _288 = precise::max(_286, 0.0);
    uint _290 = uint(_288);
    int _292 = as_type<int>(_266) & 3;
    bool _294 = _292 != 0;
    int _296 = _284 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _298 = _296 + _272;
    int _300 = _298 * 4;
    int _302 = _300 + _278;
    float _304 = _280 * 16777215.0;
    int _306 = _302 * 4;
    float _308 = trunc(_304);
    float _310 = precise::max(_308, 0.0);
    uint _312 = uint(_310);
    int _314 = _306 + 9728;
    if (!_294)
    {
        int _316 = _116 >> 31;
        int _318 = _120 >> 31;
        int _320 = _316 & 1;
        int _322 = _318 & 1;
        int _324 = _116 + _320;
        int _326 = _120 + _322;
        int _328 = _324 >> 1;
        int _330 = _326 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_328, _330)));
    }
    float _332 = -_93;
    float _334 = _332 + 1.0;
    uint _336 = uint(int(uint(_306) >> uint(2)));
    uint _717 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_336)], _312, memory_order_relaxed);
    uint _338 = _717;
    float _340 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
    uint _342 = uint(int(uint(_314) >> uint(2)));
    uint _730 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_342)], _290, memory_order_relaxed);
    uint _344 = _730;
    float _346 = 1.0 / _340;
    float _348 = _124 * _346;
    out.gl_FragDepth = _348;
    out.m_53.x = _93;
    out.m_53.y = _93;
    out.m_53.z = _93;
    out.m_53.w = _93;
    return out;
}

