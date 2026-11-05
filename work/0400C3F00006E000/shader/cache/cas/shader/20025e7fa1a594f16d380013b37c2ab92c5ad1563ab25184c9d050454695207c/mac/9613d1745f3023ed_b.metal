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
int _56(thread const int& _669, thread const int& _670, thread const int& _671, thread int& _672, thread uint& gl_SubgroupInvocationID)
{
    int _675 = _671 & 31;
    uint _677 = uint(int(uint(_671) >> uint(8)));
    int _679 = int(_677) & 31;
    float _681 = as_type<float>(gl_SubgroupInvocationID);
    int _683 = as_type<int>(_681) & _679;
    int _685 = ~_679;
    int _687 = _675 & _685;
    int _689 = _687 | _683;
    int _691 = as_type<int>(_681) ^ _670;
    bool _693 = uint(_691) <= uint(_689);
    _672 = _693 ? (-1) : 0;
    float _695 = spvSubgroupShuffle(as_type<float>(_669), uint(_691));
    uint _697 = uint(_693 ? as_type<int>(_695) : _669);
    return int(_697);
}

static inline __attribute__((always_inline))
int _57(thread const int& _745, thread const int& _746, thread const int& _747, thread int& _748, thread uint& gl_SubgroupInvocationID)
{
    int _751 = _747 & 31;
    uint _753 = uint(int(uint(_747) >> uint(8)));
    int _755 = int(_753) & 31;
    float _757 = as_type<float>(gl_SubgroupInvocationID);
    int _759 = as_type<int>(_757) & _755;
    int _761 = ~_755;
    int _763 = _751 & _761;
    int _765 = _763 | _759;
    int _767 = ~_755;
    int _769 = _746 & _767;
    int _771 = _769 | _759;
    bool _773 = uint(_771) <= uint(_765);
    _748 = _773 ? (-1) : 0;
    float _775 = spvSubgroupShuffle(as_type<float>(_745), uint(_771));
    uint _777 = uint(_773 ? as_type<int>(_775) : _745);
    return int(_777);
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
    float2 _350 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350)), int2(0), component::x).xyzw;
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
        int _424 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _424;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _432 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _432;
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
        int _521 = _57(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _521;
        int _209 = int(_197);
        int _211 = int(_197);
        int _213 = 30;
        int _215;
        int _527 = _57(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _527;
        float _219 = precise::max(_123, as_type<float>(_207));
        int _221 = as_type<int>(_219);
        int _223 = _217;
        int _225 = 31;
        int _227;
        int _535 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _535;
        float _231 = precise::max(_219, as_type<float>(_229));
        int _233 = as_type<int>(_231);
        int _235 = _195;
        int _237 = 31;
        int _239;
        int _543 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _543;
        _149 = as_type<float>(_241);
    }
    _151 = false;
    float _243 = _149;
    float _245 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _247 = as_type<float>(gl_SubgroupInvocationID);
    float _249 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _251 = _117 * 2;
    float _253 = _123 * 16777215.0;
    float _255 = _77 * _245;
    float _257 = _79 * _249;
    int _259 = _113 & 1;
    float _261 = trunc(_255);
    int _263 = int(_261);
    int _265 = 2 & _251;
    int _267 = (-3) & _259;
    int _269 = _265 | _267;
    float _271 = trunc(_257);
    int _273 = int(_271);
    int _275 = as_type<int>(_247) & 3;
    bool _277 = _275 != 0;
    float _279 = trunc(_253);
    float _281 = precise::max(_279, 0.0);
    uint _283 = uint(_281);
    int _285 = _273 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _287 = _285 + _263;
    int _289 = _287 * 4;
    int _291 = _289 + _269;
    int _293 = _291 << 2;
    int _295 = _293 + 9728;
    if (!_277)
    {
        int _297 = _113 >> 31;
        int _299 = _117 >> 31;
        int _301 = _297 & 1;
        int _303 = _299 & 1;
        int _305 = _113 + _301;
        int _307 = _117 + _303;
        int _309 = _305 >> 1;
        int _311 = _307 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_309, _311)));
    }
    uint _313 = uint(int(uint(_295) >> uint(2)));
    uint _659 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_313)], _283, memory_order_relaxed);
    uint _315 = _659;
    out.m_50.x = _90;
    out.m_50.y = _90;
    out.m_50.z = _90;
    out.m_50.w = _90;
    return out;
}

