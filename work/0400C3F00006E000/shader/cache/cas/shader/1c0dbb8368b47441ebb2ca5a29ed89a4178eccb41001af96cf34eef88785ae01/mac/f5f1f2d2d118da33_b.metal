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
int _56(thread const int& _717, thread const int& _718, thread const int& _719, thread int& _720, thread uint& gl_SubgroupInvocationID)
{
    int _723 = _719 & 31;
    uint _725 = uint(int(uint(_719) >> uint(8)));
    int _727 = int(_725) & 31;
    float _729 = as_type<float>(gl_SubgroupInvocationID);
    int _731 = as_type<int>(_729) & _727;
    int _733 = ~_727;
    int _735 = _723 & _733;
    int _737 = _735 | _731;
    int _739 = as_type<int>(_729) ^ _718;
    bool _741 = uint(_739) <= uint(_737);
    _720 = _741 ? (-1) : 0;
    float _743 = spvSubgroupShuffle(as_type<float>(_717), uint(_739));
    uint _745 = uint(_741 ? as_type<int>(_743) : _717);
    return int(_745);
}

static inline __attribute__((always_inline))
int _57(thread const int& _793, thread const int& _794, thread const int& _795, thread int& _796, thread uint& gl_SubgroupInvocationID)
{
    int _799 = _795 & 31;
    uint _801 = uint(int(uint(_795) >> uint(8)));
    int _803 = int(_801) & 31;
    float _805 = as_type<float>(gl_SubgroupInvocationID);
    int _807 = as_type<int>(_805) & _803;
    int _809 = ~_803;
    int _811 = _799 & _809;
    int _813 = _811 | _807;
    int _815 = ~_803;
    int _817 = _794 & _815;
    int _819 = _817 | _807;
    bool _821 = uint(_819) <= uint(_813);
    _796 = _821 ? (-1) : 0;
    float _823 = spvSubgroupShuffle(as_type<float>(_793), uint(_819));
    uint _825 = uint(_821 ? as_type<int>(_823) : _793);
    return int(_825);
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
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = precise::max(_88, _90);
    uint _117 = spvSubgroupBallot(true).x;
    float _119 = precise::max(_112, _114);
    bool _123 = int(_117) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_119, _119, _119, _119), uint2(int2(_106, _110)));
    float _149;
    if (!_123)
    {
        int _125 = as_type<int>(_119);
        int _127 = 1;
        int _129 = 31;
        int _131;
        int _448 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _448;
        float _135 = precise::max(_119, as_type<float>(_133));
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
        int _199 = as_type<int>(_119);
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
        float _219 = precise::max(_119, as_type<float>(_207));
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
    float _247 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    int _251 = _110 * 2;
    float _253 = _77 * _245;
    float _255 = -_119;
    float _257 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _259 = _79 * _247;
    bool _261 = _119 >= 1.0;
    bool _263 = isnan(_119);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = trunc(_253);
    int _273 = int(_271);
    float _275 = 1.0 / _257;
    float _277 = trunc(_259);
    int _279 = int(_277);
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _283 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[1].w, _281);
    int _285 = _106 & 1;
    float _287 = _283 * 16777215.0;
    int _289 = 2 & _251;
    int _291 = (-3) & _285;
    int _293 = _289 | _291;
    int _295 = _279 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _297 = _295 + _273;
    bool _299 = !_269;
    float _301 = _299 ? _287 : 16777215.0;
    int _303 = as_type<int>(_249) & 3;
    bool _305 = _303 != 0;
    int _307 = _297 * 4;
    int _309 = _307 + _293;
    float _311 = trunc(_301);
    float _313 = precise::max(_311, 0.0);
    uint _315 = uint(_313);
    int _317 = _309 << 2;
    int _319 = _317 + 9728;
    if (!_305)
    {
        int _321 = _106 >> 31;
        int _323 = _110 >> 31;
        int _325 = _321 & 1;
        int _327 = _323 & 1;
        int _329 = _106 + _325;
        int _331 = _110 + _327;
        int _333 = _329 >> 1;
        int _335 = _331 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_243, _243, _243, _243), uint2(int2(_333, _335)));
    }
    uint _337 = uint(int(uint(_319) >> uint(2)));
    uint _715 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_337)], _315, memory_order_relaxed);
    uint _339 = _715;
    out.gl_FragDepth = _90;
    return out;
}

