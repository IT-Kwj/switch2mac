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
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _691, thread const int& _692, thread const int& _693, thread int& _694, thread uint& gl_SubgroupInvocationID)
{
    int _697 = _693 & 31;
    uint _699 = uint(int(uint(_693) >> uint(8)));
    int _701 = int(_699) & 31;
    float _703 = as_type<float>(gl_SubgroupInvocationID);
    int _705 = as_type<int>(_703) & _701;
    int _707 = ~_701;
    int _709 = _697 & _707;
    int _711 = _709 | _705;
    int _713 = as_type<int>(_703) ^ _692;
    bool _715 = uint(_713) <= uint(_711);
    _694 = _715 ? (-1) : 0;
    float _717 = spvSubgroupShuffle(as_type<float>(_691), uint(_713));
    uint _719 = uint(_715 ? as_type<int>(_717) : _691);
    return int(_719);
}

static inline __attribute__((always_inline))
int _57(thread const int& _767, thread const int& _768, thread const int& _769, thread int& _770, thread uint& gl_SubgroupInvocationID)
{
    int _773 = _769 & 31;
    uint _775 = uint(int(uint(_769) >> uint(8)));
    int _777 = int(_775) & 31;
    float _779 = as_type<float>(gl_SubgroupInvocationID);
    int _781 = as_type<int>(_779) & _777;
    int _783 = ~_777;
    int _785 = _773 & _783;
    int _787 = _785 | _781;
    int _789 = ~_777;
    int _791 = _768 & _789;
    int _793 = _791 | _781;
    bool _795 = uint(_793) <= uint(_787);
    _770 = _795 ? (-1) : 0;
    float _797 = spvSubgroupShuffle(as_type<float>(_767), uint(_793));
    uint _799 = uint(_795 ? as_type<int>(_797) : _767);
    return int(_799);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _163 = false;
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
    float2 _362 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362)), int2(0), component::x).xyzw;
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
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = -_90;
    float _116 = _114 + 1.0;
    float _118 = precise::max(_88, _90);
    uint _121 = spvSubgroupBallot(true).x;
    float _123 = precise::max(_112, _118);
    float _125 = _90 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _129 = int(_121) != (-1);
    float _131 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _125);
    float _133 = 1.0 / _131;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_123, _123, _123, _123), uint2(int2(_106, _110)));
    float _135 = _125 * _133;
    float _161;
    if (!_129)
    {
        int _137 = as_type<int>(_123);
        int _139 = 1;
        int _141 = 31;
        int _143;
        int _454 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _454;
        float _147 = precise::max(_123, as_type<float>(_145));
        int _149 = as_type<int>(_147);
        int _151 = 2;
        int _153 = 31;
        int _155;
        int _462 = _56(_149, _151, _153, _155, gl_SubgroupInvocationID);
        int _157 = _462;
        float _159 = precise::max(_147, as_type<float>(_157));
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = as_type<float>(gl_SubgroupInvocationID);
        uint _167 = spvSubgroupBallot(true).x;
        float _169 = as_type<float>(gl_SubgroupLtMask.x);
        int _171 = as_type<int>(_165) & (-4);
        uint _173 = min(uint(_171), 32u);
        bool _175 = int(_173) == 0;
        bool _177 = _173 < 32u;
        int _179 = 32 - int(_173);
        int _181 = int(_173) - 32;
        int _183 = 15 << int(_173);
        uint _185 = uint(int(uint(0) >> uint(_179)));
        int _187 = _183 | int(_185);
        int _189 = _175 ? 15 : _187;
        bool _191 = uint(_181) < 32u;
        int _193 = 0 << _181;
        int _195 = _191 ? _193 : 0;
        int _197 = _177 ? _189 : _195;
        int _199 = int(_167) & as_type<int>(_169);
        int _201 = _197 & _199;
        int _203 = _197 & int(_167);
        int _205 = int(spvFindUMSB(uint(_201)));
        int _207 = int(spvFindUMSB(uint(_203)));
        uint _209 = min(uint(_205), as_type<uint>(_165));
        int _211 = as_type<int>(_123);
        int _213 = int(_209);
        int _215 = 31;
        int _217;
        int _551 = _57(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _551;
        int _221 = int(_209);
        int _223 = int(_209);
        int _225 = 30;
        int _227;
        int _557 = _57(_221, _223, _225, _227, gl_SubgroupInvocationID);
        int _229 = _557;
        float _231 = precise::max(_123, as_type<float>(_219));
        int _233 = as_type<int>(_231);
        int _235 = _229;
        int _237 = 31;
        int _239;
        int _565 = _57(_233, _235, _237, _239, gl_SubgroupInvocationID);
        int _241 = _565;
        float _243 = precise::max(_231, as_type<float>(_241));
        int _245 = as_type<int>(_243);
        int _247 = _207;
        int _249 = 31;
        int _251;
        int _573 = _57(_245, _247, _249, _251, gl_SubgroupInvocationID);
        int _253 = _573;
        _161 = as_type<float>(_253);
    }
    _163 = false;
    float _255 = _161;
    float _257 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _259 = as_type<float>(gl_SubgroupInvocationID);
    float _261 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _263 = _110 * 2;
    float _265 = _123 * 16777215.0;
    float _267 = _77 * _257;
    float _269 = _79 * _261;
    int _271 = _106 & 1;
    float _273 = trunc(_267);
    int _275 = int(_273);
    int _277 = 2 & _263;
    int _279 = (-3) & _271;
    int _281 = _277 | _279;
    float _283 = trunc(_269);
    int _285 = int(_283);
    int _287 = as_type<int>(_259) & 3;
    bool _289 = _287 != 0;
    int _291 = _285 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _293 = _291 + _275;
    int _295 = _293 * 4;
    int _297 = _295 + _281;
    float _299 = trunc(_265);
    float _301 = precise::max(_299, 0.0);
    uint _303 = uint(_301);
    int _305 = _297 << 2;
    int _307 = _305 + 9728;
    if (!_289)
    {
        int _309 = _106 >> 31;
        int _311 = _110 >> 31;
        int _313 = _309 & 1;
        int _315 = _311 & 1;
        int _317 = _106 + _313;
        int _319 = _110 + _315;
        int _321 = _317 >> 1;
        int _323 = _319 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_255, _255, _255, _255), uint2(int2(_321, _323)));
    }
    uint _325 = uint(int(uint(_307) >> uint(2)));
    uint _689 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_325)], _303, memory_order_relaxed);
    uint _327 = _689;
    out.gl_FragDepth = _135;
    return out;
}

