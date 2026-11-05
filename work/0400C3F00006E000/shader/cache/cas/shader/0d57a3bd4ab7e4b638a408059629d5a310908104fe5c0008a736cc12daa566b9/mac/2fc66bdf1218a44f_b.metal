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
int _56(thread const int& _725, thread const int& _726, thread const int& _727, thread int& _728, thread uint& gl_SubgroupInvocationID)
{
    int _731 = _727 & 31;
    uint _733 = uint(int(uint(_727) >> uint(8)));
    int _735 = int(_733) & 31;
    float _737 = as_type<float>(gl_SubgroupInvocationID);
    int _739 = as_type<int>(_737) & _735;
    int _741 = ~_735;
    int _743 = _731 & _741;
    int _745 = _743 | _739;
    int _747 = as_type<int>(_737) ^ _726;
    bool _749 = uint(_747) <= uint(_745);
    _728 = _749 ? (-1) : 0;
    float _751 = spvSubgroupShuffle(as_type<float>(_725), uint(_747));
    uint _753 = uint(_749 ? as_type<int>(_751) : _725);
    return int(_753);
}

static inline __attribute__((always_inline))
int _57(thread const int& _801, thread const int& _802, thread const int& _803, thread int& _804, thread uint& gl_SubgroupInvocationID)
{
    int _807 = _803 & 31;
    uint _809 = uint(int(uint(_803) >> uint(8)));
    int _811 = int(_809) & 31;
    float _813 = as_type<float>(gl_SubgroupInvocationID);
    int _815 = as_type<int>(_813) & _811;
    int _817 = ~_811;
    int _819 = _807 & _817;
    int _821 = _819 | _815;
    int _823 = ~_811;
    int _825 = _802 & _823;
    int _827 = _825 | _815;
    bool _829 = uint(_827) <= uint(_821);
    _804 = _829 ? (-1) : 0;
    float _831 = spvSubgroupShuffle(as_type<float>(_801), uint(_827));
    uint _833 = uint(_829 ? as_type<int>(_831) : _801);
    return int(_833);
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
    float2 _374 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374)), int2(0), component::x).xyzw;
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
        int _448 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _448;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _456 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _456;
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
        int _545 = _57(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _545;
        int _209 = int(_197);
        int _211 = int(_197);
        int _213 = 30;
        int _215;
        int _551 = _57(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _551;
        float _219 = precise::max(_123, as_type<float>(_207));
        int _221 = as_type<int>(_219);
        int _223 = _217;
        int _225 = 31;
        int _227;
        int _559 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _559;
        float _231 = precise::max(_219, as_type<float>(_229));
        int _233 = as_type<int>(_231);
        int _235 = _195;
        int _237 = 31;
        int _239;
        int _567 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _567;
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
    float _257 = _79 * _249;
    bool _259 = _123 >= 1.0;
    bool _261 = isnan(_123);
    bool _263 = _259 || _261;
    bool _265 = isnan(1.0);
    bool _267 = _263 || _265;
    float _269 = -_123;
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _273 = trunc(_255);
    int _275 = int(_273);
    int _277 = 2 & _251;
    int _279 = (-3) & _253;
    int _281 = _277 | _279;
    float _283 = 1.0 / _271;
    float _285 = trunc(_257);
    int _287 = int(_285);
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[1].w, _289);
    float _293 = _291 * 16777215.0;
    int _295 = _287 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _297 = _295 + _275;
    bool _299 = !_267;
    float _301 = _299 ? _293 : 16777215.0;
    int _303 = as_type<int>(_247) & 3;
    bool _305 = _303 != 0;
    int _307 = _297 * 4;
    int _309 = _307 + _281;
    float _311 = trunc(_301);
    float _313 = precise::max(_311, 0.0);
    uint _315 = uint(_313);
    int _317 = _309 << 2;
    int _319 = _317 + 9728;
    if (!_305)
    {
        int _321 = _113 >> 31;
        int _323 = _117 >> 31;
        int _325 = _321 & 1;
        int _327 = _323 & 1;
        int _329 = _113 + _325;
        int _331 = _117 + _327;
        int _333 = _329 >> 1;
        int _335 = _331 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_333, _335)));
    }
    uint _337 = uint(int(uint(_319) >> uint(2)));
    uint _715 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_337)], _315, memory_order_relaxed);
    uint _339 = _715;
    out.m_50.x = _90;
    out.m_50.y = _90;
    out.m_50.z = _90;
    out.m_50.w = _90;
    return out;
}

