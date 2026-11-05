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
int _56(thread const int& _735, thread const int& _736, thread const int& _737, thread int& _738, thread uint& gl_SubgroupInvocationID)
{
    int _741 = _737 & 31;
    uint _743 = uint(int(uint(_737) >> uint(8)));
    int _745 = int(_743) & 31;
    float _747 = as_type<float>(gl_SubgroupInvocationID);
    int _749 = as_type<int>(_747) & _745;
    int _751 = ~_745;
    int _753 = _741 & _751;
    int _755 = _753 | _749;
    int _757 = as_type<int>(_747) ^ _736;
    bool _759 = uint(_757) <= uint(_755);
    _738 = _759 ? (-1) : 0;
    float _761 = spvSubgroupShuffle(as_type<float>(_735), uint(_757));
    uint _763 = uint(_759 ? as_type<int>(_761) : _735);
    return int(_763);
}

static inline __attribute__((always_inline))
int _57(thread const int& _811, thread const int& _812, thread const int& _813, thread int& _814, thread uint& gl_SubgroupInvocationID)
{
    int _817 = _813 & 31;
    uint _819 = uint(int(uint(_813) >> uint(8)));
    int _821 = int(_819) & 31;
    float _823 = as_type<float>(gl_SubgroupInvocationID);
    int _825 = as_type<int>(_823) & _821;
    int _827 = ~_821;
    int _829 = _817 & _827;
    int _831 = _829 | _825;
    int _833 = ~_821;
    int _835 = _812 & _833;
    int _837 = _835 | _825;
    bool _839 = uint(_837) <= uint(_831);
    _814 = _839 ? (-1) : 0;
    float _841 = spvSubgroupShuffle(as_type<float>(_811), uint(_837));
    uint _843 = uint(_839 ? as_type<int>(_841) : _811);
    return int(_843);
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
    float2 _378 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378)), int2(0), component::x).xyzw;
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
        int _452 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _452;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _460 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _460;
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
        int _549 = _57(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _549;
        int _209 = int(_197);
        int _211 = int(_197);
        int _213 = 30;
        int _215;
        int _555 = _57(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _555;
        float _219 = precise::max(_123, as_type<float>(_207));
        int _221 = as_type<int>(_219);
        int _223 = _217;
        int _225 = 31;
        int _227;
        int _563 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _563;
        float _231 = precise::max(_219, as_type<float>(_229));
        int _233 = as_type<int>(_231);
        int _235 = _195;
        int _237 = 31;
        int _239;
        int _571 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _571;
        _149 = as_type<float>(_241);
    }
    _151 = false;
    float _243 = _149;
    float _245 = precise::min(_84, _86);
    float _247 = precise::min(_88, _90);
    float _249 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _251 = precise::min(_245, _247);
    int _253 = _117 * 2;
    float _255 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _257 = _77 * _249;
    bool _259 = _251 >= 1.0;
    bool _261 = isnan(_251);
    bool _263 = _259 || _261;
    bool _265 = isnan(1.0);
    bool _267 = _263 || _265;
    float _269 = -_251;
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _273 = _113 & 1;
    float _275 = _79 * _255;
    float _277 = as_type<float>(gl_SubgroupInvocationID);
    float _279 = trunc(_257);
    int _281 = int(_279);
    int _283 = 2 & _253;
    int _285 = (-3) & _273;
    int _287 = _283 | _285;
    float _289 = 1.0 / _271;
    float _291 = trunc(_275);
    int _293 = int(_291);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _297 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[1].w, _295);
    float _299 = _297 * 16777215.0;
    int _301 = _293 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _303 = _301 + _281;
    bool _305 = !_267;
    float _307 = _305 ? _299 : 16777215.0;
    int _309 = as_type<int>(_277) & 3;
    bool _311 = _309 != 0;
    int _313 = _303 * 4;
    int _315 = _313 + _287;
    float _317 = trunc(_307);
    float _319 = precise::max(_317, 0.0);
    uint _321 = uint(_319);
    int _323 = _315 << 2;
    if (!_311)
    {
        int _325 = _113 >> 31;
        int _327 = _117 >> 31;
        int _329 = _325 & 1;
        int _331 = _327 & 1;
        int _333 = _113 + _329;
        int _335 = _117 + _331;
        int _337 = _333 >> 1;
        int _339 = _335 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_337, _339)));
    }
    uint _341 = uint(int(uint(_323) >> uint(2)));
    uint _725 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_341)], _321, memory_order_relaxed);
    uint _343 = _725;
    out.m_50.x = _90;
    out.m_50.y = _90;
    out.m_50.z = _90;
    out.m_50.w = _90;
    return out;
}

