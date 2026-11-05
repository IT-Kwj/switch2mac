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
int _56(thread const int& _679, thread const int& _680, thread const int& _681, thread int& _682, thread uint& gl_SubgroupInvocationID)
{
    int _685 = _681 & 31;
    uint _687 = uint(int(uint(_681) >> uint(8)));
    int _689 = int(_687) & 31;
    float _691 = as_type<float>(gl_SubgroupInvocationID);
    int _693 = as_type<int>(_691) & _689;
    int _695 = ~_689;
    int _697 = _685 & _695;
    int _699 = _697 | _693;
    int _701 = as_type<int>(_691) ^ _680;
    bool _703 = uint(_701) <= uint(_699);
    _682 = _703 ? (-1) : 0;
    float _705 = spvSubgroupShuffle(as_type<float>(_679), uint(_701));
    uint _707 = uint(_703 ? as_type<int>(_705) : _679);
    return int(_707);
}

static inline __attribute__((always_inline))
int _57(thread const int& _755, thread const int& _756, thread const int& _757, thread int& _758, thread uint& gl_SubgroupInvocationID)
{
    int _761 = _757 & 31;
    uint _763 = uint(int(uint(_757) >> uint(8)));
    int _765 = int(_763) & 31;
    float _767 = as_type<float>(gl_SubgroupInvocationID);
    int _769 = as_type<int>(_767) & _765;
    int _771 = ~_765;
    int _773 = _761 & _771;
    int _775 = _773 | _769;
    int _777 = ~_765;
    int _779 = _756 & _777;
    int _781 = _779 | _769;
    bool _783 = uint(_781) <= uint(_775);
    _758 = _783 ? (-1) : 0;
    float _785 = spvSubgroupShuffle(as_type<float>(_755), uint(_781));
    uint _787 = uint(_783 ? as_type<int>(_785) : _755);
    return int(_787);
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
    float2 _354 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354)), int2(0), component::x).xyzw;
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
        int _428 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _428;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _436 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _436;
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
        int _525 = _57(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _525;
        int _209 = int(_197);
        int _211 = int(_197);
        int _213 = 30;
        int _215;
        int _531 = _57(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _531;
        float _219 = precise::max(_123, as_type<float>(_207));
        int _221 = as_type<int>(_219);
        int _223 = _217;
        int _225 = 31;
        int _227;
        int _539 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _539;
        float _231 = precise::max(_219, as_type<float>(_229));
        int _233 = as_type<int>(_231);
        int _235 = _195;
        int _237 = 31;
        int _239;
        int _547 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _547;
        _149 = as_type<float>(_241);
    }
    _151 = false;
    float _243 = _149;
    float _245 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _247 = _117 * 2;
    float _249 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _251 = precise::min(_84, _86);
    float _253 = _77 * _245;
    float _255 = as_type<float>(gl_SubgroupInvocationID);
    float _257 = _79 * _249;
    float _259 = precise::min(_88, _90);
    float _261 = trunc(_253);
    int _263 = int(_261);
    int _265 = _113 & 1;
    float _267 = precise::min(_251, _259);
    int _269 = 2 & _247;
    int _271 = (-3) & _265;
    int _273 = _269 | _271;
    float _275 = trunc(_257);
    int _277 = int(_275);
    float _279 = _267 * 16777215.0;
    float _281 = trunc(_279);
    float _283 = precise::max(_281, 0.0);
    uint _285 = uint(_283);
    int _287 = as_type<int>(_255) & 3;
    bool _289 = _287 != 0;
    int _291 = _277 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _293 = _291 + _263;
    int _295 = _293 * 4;
    int _297 = _295 + _273;
    int _299 = _297 << 2;
    if (!_289)
    {
        int _301 = _113 >> 31;
        int _303 = _117 >> 31;
        int _305 = _301 & 1;
        int _307 = _303 & 1;
        int _309 = _113 + _305;
        int _311 = _117 + _307;
        int _313 = _309 >> 1;
        int _315 = _311 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_313, _315)));
    }
    uint _317 = uint(int(uint(_299) >> uint(2)));
    uint _669 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_317)], _285, memory_order_relaxed);
    uint _319 = _669;
    out.m_50.x = _90;
    out.m_50.y = _90;
    out.m_50.z = _90;
    out.m_50.w = _90;
    return out;
}

