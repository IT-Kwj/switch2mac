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
    float4 m_52 [[color(2)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _673, thread const int& _674, thread const int& _675, thread int& _676, thread uint& gl_SubgroupInvocationID)
{
    int _679 = _675 & 31;
    uint _681 = uint(int(uint(_675) >> uint(8)));
    int _683 = int(_681) & 31;
    float _685 = as_type<float>(gl_SubgroupInvocationID);
    int _687 = as_type<int>(_685) & _683;
    int _689 = ~_683;
    int _691 = _679 & _689;
    int _693 = _691 | _687;
    int _695 = as_type<int>(_685) ^ _674;
    bool _697 = uint(_695) <= uint(_693);
    _676 = _697 ? (-1) : 0;
    float _699 = spvSubgroupShuffle(as_type<float>(_673), uint(_695));
    uint _701 = uint(_697 ? as_type<int>(_699) : _673);
    return int(_701);
}

static inline __attribute__((always_inline))
int _59(thread const int& _749, thread const int& _750, thread const int& _751, thread int& _752, thread uint& gl_SubgroupInvocationID)
{
    int _755 = _751 & 31;
    uint _757 = uint(int(uint(_751) >> uint(8)));
    int _759 = int(_757) & 31;
    float _761 = as_type<float>(gl_SubgroupInvocationID);
    int _763 = as_type<int>(_761) & _759;
    int _765 = ~_759;
    int _767 = _755 & _765;
    int _769 = _767 | _763;
    int _771 = ~_759;
    int _773 = _750 & _771;
    int _775 = _773 | _763;
    bool _777 = uint(_775) <= uint(_769);
    _752 = _777 ? (-1) : 0;
    float _779 = spvSubgroupShuffle(as_type<float>(_749), uint(_775));
    uint _781 = uint(_777 ? as_type<int>(_779) : _749);
    return int(_781);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _153 = false;
    float _63 = gl_FragCoord.w;
    float _65 = in.m_40.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_40.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _352 = float2(_79, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = gl_FragCoord.x;
    float _96 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _98 = _94 / _96;
    float _100 = gl_FragCoord.y;
    float _102 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _104 = _100 / _102;
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = trunc(_98);
    int _115 = int(_113);
    float _117 = trunc(_104);
    int _119 = int(_117);
    float _121 = precise::max(_86, _88);
    float _123 = precise::max(_90, _92);
    float _125 = precise::max(_121, _123);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_125, _125, _125, _125), uint2(int2(_115, _119)));
    float _151;
    if (!_111)
    {
        int _127 = as_type<int>(_125);
        int _129 = 1;
        int _131 = 31;
        int _133;
        int _426 = _58(_127, _129, _131, _133, gl_SubgroupInvocationID);
        int _135 = _426;
        float _137 = precise::max(_125, as_type<float>(_135));
        int _139 = as_type<int>(_137);
        int _141 = 2;
        int _143 = 31;
        int _145;
        int _434 = _58(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _434;
        float _149 = precise::max(_137, as_type<float>(_147));
        _151 = _149;
        _153 = true;
    }
    else
    {
        float _155 = as_type<float>(gl_SubgroupInvocationID);
        uint _157 = spvSubgroupBallot(true).x;
        float _159 = as_type<float>(gl_SubgroupLtMask.x);
        int _161 = as_type<int>(_155) & (-4);
        uint _163 = min(uint(_161), 32u);
        bool _165 = int(_163) == 0;
        bool _167 = _163 < 32u;
        int _169 = 32 - int(_163);
        int _171 = int(_163) - 32;
        int _173 = 15 << int(_163);
        uint _175 = uint(int(uint(0) >> uint(_169)));
        int _177 = _173 | int(_175);
        int _179 = _165 ? 15 : _177;
        bool _181 = uint(_171) < 32u;
        int _183 = 0 << _171;
        int _185 = _181 ? _183 : 0;
        int _187 = _167 ? _179 : _185;
        int _189 = int(_157) & as_type<int>(_159);
        int _191 = _187 & _189;
        int _193 = _187 & int(_157);
        int _195 = int(spvFindUMSB(uint(_191)));
        int _197 = int(spvFindUMSB(uint(_193)));
        uint _199 = min(uint(_195), as_type<uint>(_155));
        int _201 = as_type<int>(_125);
        int _203 = int(_199);
        int _205 = 31;
        int _207;
        int _523 = _59(_201, _203, _205, _207, gl_SubgroupInvocationID);
        int _209 = _523;
        int _211 = int(_199);
        int _213 = int(_199);
        int _215 = 30;
        int _217;
        int _529 = _59(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _529;
        float _221 = precise::max(_125, as_type<float>(_209));
        int _223 = as_type<int>(_221);
        int _225 = _219;
        int _227 = 31;
        int _229;
        int _537 = _59(_223, _225, _227, _229, gl_SubgroupInvocationID);
        int _231 = _537;
        float _233 = precise::max(_221, as_type<float>(_231));
        int _235 = as_type<int>(_233);
        int _237 = _197;
        int _239 = 31;
        int _241;
        int _545 = _59(_235, _237, _239, _241, gl_SubgroupInvocationID);
        int _243 = _545;
        _151 = as_type<float>(_243);
    }
    _153 = false;
    float _245 = _151;
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _253 = _119 * 2;
    float _255 = _79 * _247;
    float _257 = _81 * _251;
    int _259 = _115 & 1;
    float _261 = trunc(_255);
    int _263 = int(_261);
    int _265 = 2 & _253;
    int _267 = (-3) & _259;
    int _269 = _265 | _267;
    float _271 = _125 * 16777215.0;
    float _273 = trunc(_257);
    int _275 = int(_273);
    int _277 = as_type<int>(_249) & 3;
    bool _279 = _277 != 0;
    int _281 = _275 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _283 = _281 + _263;
    int _285 = _283 * 4;
    int _287 = _285 + _269;
    float _289 = trunc(_271);
    float _291 = precise::max(_289, 0.0);
    uint _293 = uint(_291);
    int _295 = _287 << 2;
    int _297 = _295 + 9728;
    if (!_279)
    {
        int _299 = _115 >> 31;
        int _301 = _119 >> 31;
        int _303 = _299 & 1;
        int _305 = _301 & 1;
        int _307 = _115 + _303;
        int _309 = _119 + _305;
        int _311 = _307 >> 1;
        int _313 = _309 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_245, _245, _245, _245), uint2(int2(_311, _313)));
    }
    uint _315 = uint(int(uint(_297) >> uint(2)));
    uint _661 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_315)], _293, memory_order_relaxed);
    uint _317 = _661;
    out.m_50.x = _92;
    out.m_50.y = _92;
    out.m_50.z = _92;
    out.m_50.w = _92;
    out.m_52.x = _125;
    return out;
}

