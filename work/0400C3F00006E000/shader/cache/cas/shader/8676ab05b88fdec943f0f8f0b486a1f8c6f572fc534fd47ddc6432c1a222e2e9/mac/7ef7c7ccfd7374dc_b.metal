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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _712, thread const int& _713, thread const int& _714, thread int& _715, thread uint& gl_SubgroupInvocationID)
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
int _57(thread const int& _788, thread const int& _789, thread const int& _790, thread int& _791, thread uint& gl_SubgroupInvocationID)
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
    bool _151 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_40.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_40.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _368 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_368, float2(0.0), isnan(_368)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    uint _105 = spvSubgroupBallot(true).x;
    bool _109 = int(_105) != (-1);
    float _111 = trunc(_96);
    int _113 = int(_111);
    float _115 = trunc(_102);
    int _117 = int(_115);
    float _119 = precise::max(_84, _86);
    float _121 = precise::max(_88, _90);
    float _123 = precise::max(_119, _121);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_123, _123, _123, _123), uint2(int2(_113, _117)));
    float _149;
    if (!_109)
    {
        int _125 = as_type<int>(_123);
        int _127 = 1;
        int _129 = 31;
        int _131;
        int _442 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _442;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _450 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _450;
        float _147 = precise::max(_135, as_type<float>(_145));
        _149 = _147;
        _151 = true;
    }
    else
    {
        float _153 = as_type<float>(gl_SubgroupInvocationID);
        uint _155 = spvSubgroupBallot(true).x;
        float _157 = as_type<float>(gl_SubgroupLtMask.x);
        int _159 = as_type<int>(_153) & (-4);
        uint _161 = min(uint(_159), 32u);
        bool _163 = int(_161) == 0;
        bool _165 = _161 < 32u;
        int _167 = 32 - int(_161);
        int _169 = int(_161) - 32;
        int _171 = 15 << int(_161);
        uint _173 = uint(int(uint(0) >> uint(_167)));
        int _175 = _171 | int(_173);
        int _177 = _163 ? 15 : _175;
        bool _179 = uint(_169) < 32u;
        int _181 = 0 << _169;
        int _183 = _179 ? _181 : 0;
        int _185 = _165 ? _177 : _183;
        int _187 = int(_155) & as_type<int>(_157);
        int _189 = _185 & _187;
        int _191 = _185 & int(_155);
        int _193 = int(spvFindUMSB(uint(_189)));
        int _195 = int(spvFindUMSB(uint(_191)));
        uint _197 = min(uint(_193), as_type<uint>(_153));
        int _199 = as_type<int>(_123);
        int _201 = int(_197);
        int _203 = 31;
        int _205;
        int _539 = _57(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _539;
        int _209 = int(_197);
        int _211 = int(_197);
        int _213 = 30;
        int _215;
        int _545 = _57(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _545;
        float _219 = precise::max(_123, as_type<float>(_207));
        int _221 = as_type<int>(_219);
        int _223 = _217;
        int _225 = 31;
        int _227;
        int _553 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _553;
        float _231 = precise::max(_219, as_type<float>(_229));
        int _233 = as_type<int>(_231);
        int _235 = _195;
        int _237 = 31;
        int _239;
        int _561 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _561;
        _149 = as_type<float>(_241);
    }
    _151 = false;
    float _243 = _149;
    float _245 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _247 = as_type<float>(gl_SubgroupInvocationID);
    float _249 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _251 = _117 * 2;
    int _253 = _113 & 1;
    float _255 = _77 * _245;
    float _257 = precise::min(_84, _86);
    float _259 = _79 * _249;
    float _261 = precise::min(_88, _90);
    float _263 = _123 * 16777215.0;
    int _265 = 2 & _251;
    int _267 = (-3) & _253;
    int _269 = _265 | _267;
    float _271 = trunc(_255);
    int _273 = int(_271);
    float _275 = precise::min(_257, _261);
    float _277 = trunc(_259);
    int _279 = int(_277);
    int _281 = as_type<int>(_247) & 3;
    bool _283 = _281 != 0;
    float _285 = trunc(_263);
    float _287 = precise::max(_285, 0.0);
    uint _289 = uint(_287);
    int _291 = _279 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _293 = _291 + _273;
    float _295 = _275 * 16777215.0;
    int _297 = _293 * 4;
    int _299 = _297 + _269;
    float _301 = trunc(_295);
    float _303 = precise::max(_301, 0.0);
    uint _305 = uint(_303);
    int _307 = _299 * 4;
    int _309 = _307 + 9728;
    if (!_283)
    {
        int _311 = _113 >> 31;
        int _313 = _117 >> 31;
        int _315 = _311 & 1;
        int _317 = _313 & 1;
        int _319 = _113 + _315;
        int _321 = _117 + _317;
        int _323 = _319 >> 1;
        int _325 = _321 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_323, _325)));
    }
    uint _327 = uint(int(uint(_307) >> uint(2)));
    uint _694 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_327)], _305, memory_order_relaxed);
    uint _329 = _694;
    uint _331 = uint(int(uint(_309) >> uint(2)));
    uint _702 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_331)], _289, memory_order_relaxed);
    uint _333 = _702;
    out.m_50.x = _90;
    out.m_50.y = _90;
    out.m_50.z = _90;
    out.m_50.w = _90;
    return out;
}

