#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _35(thread const int& _195, thread const int& _196, thread const int& _197, thread int& _198, thread uint& gl_SubgroupInvocationID)
{
    int _201 = _197 & 31;
    uint _204 = uint(int(uint(_197) >> uint(8)));
    int _206 = int(_204) & 31;
    float _208 = as_type<float>(gl_SubgroupInvocationID);
    int _210 = as_type<int>(_208) & _206;
    int _212 = ~_206;
    int _214 = _201 & _212;
    int _216 = _214 | _210;
    int _218 = as_type<int>(_208) ^ _196;
    bool _221 = uint(_218) <= uint(_216);
    _198 = _221 ? (-1) : 0;
    float _223 = spvSubgroupShuffle(as_type<float>(_195), uint(_218));
    uint _225 = uint(_221 ? as_type<int>(_223) : _195);
    return int(_225);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_23.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _125 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_125, float2(0.0), isnan(_125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_125, float2(0.0), isnan(_125))).x;
    int _61 = as_type<int>(_59);
    int _63 = 2;
    int _65 = 7171;
    int _67;
    int _138 = _35(_61, _63, _65, _67, gl_SubgroupInvocationID);
    int _69 = _138;
    int _71 = as_type<int>(_59);
    int _73 = 1;
    int _75 = 7171;
    int _77;
    int _141 = _35(_71, _73, _75, _77, gl_SubgroupInvocationID);
    int _79 = _141;
    uint _155 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _81 = (as_type<float>(_69) * float4(1.0, -1.0, 1.0, 0.0)[_155]) + (_59 * float4(1.0, 1.0, -1.0, 1.0)[_155]);
    uint _169 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _83 = (as_type<float>(_79) * float4(1.0, -1.0, 1.0, 0.0)[_169]) + (_59 * float4(1.0, 1.0, -1.0, 1.0)[_169]);
    float _85 = _81 * _81;
    float _87 = fma(_83, _83, _85);
    float _89 = _87 * 0.25;
    float _91 = fma(_59, _59, _89);
    out.m_26.x = _59;
    out.m_26.y = _91;
    return out;
}

