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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _41(thread const int& _453, thread const int& _454, thread const int& _455, thread int& _456, thread uint& gl_SubgroupInvocationID)
{
    int _459 = _455 & 31;
    uint _462 = uint(int(uint(_455) >> uint(8)));
    int _464 = int(_462) & 31;
    float _466 = as_type<float>(gl_SubgroupInvocationID);
    int _468 = as_type<int>(_466) & _464;
    int _470 = ~_464;
    int _472 = _459 & _470;
    int _474 = _472 | _468;
    int _476 = as_type<int>(_466) ^ _454;
    bool _479 = uint(_476) <= uint(_474);
    _456 = _479 ? (-1) : 0;
    float _481 = spvSubgroupShuffle(as_type<float>(_453), uint(_476));
    uint _483 = uint(_479 ? as_type<int>(_481) : _453);
    return int(_483);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _45;
    float _67 = _65 * _51;
    float _69 = _65 * _57;
    float _71 = _65 * _63;
    int _73 = as_type<int>(_67);
    int _75 = 1;
    int _77 = 7171;
    int _79;
    int _237 = _41(_73, _75, _77, _79, gl_SubgroupInvocationID);
    int _81 = _237;
    int _83 = as_type<int>(_69);
    int _85 = 1;
    int _87 = 7171;
    int _89;
    int _240 = _41(_83, _85, _87, _89, gl_SubgroupInvocationID);
    int _91 = _240;
    uint _255 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _93 = (as_type<float>(_81) * float4(1.0, -1.0, 1.0, 0.0)[_255]) + (_67 * float4(1.0, 1.0, -1.0, 1.0)[_255]);
    uint _268 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _95 = (as_type<float>(_91) * float4(1.0, -1.0, 1.0, 0.0)[_268]) + (_69 * float4(1.0, 1.0, -1.0, 1.0)[_268]);
    float _97 = fma(_93, 0.5, _67);
    float _99 = fma(_93, -0.5, _67);
    float _101 = fma(_95, -0.5, _69);
    float _103 = fma(_95, 0.5, _69);
    float2 _293 = float2(_69, _99);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_293, float2(0.0), isnan(_293)), level(_71)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_293, float2(0.0), isnan(_293)), level(_71)).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float2 _313 = float2(_69, _97);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_313, float2(0.0), isnan(_313)), level(_71)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_313, float2(0.0), isnan(_313)), level(_71)).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _330 = float2(_101, _67);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330)), level(_71)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330)), level(_71)).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _347 = float2(_103, _67);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347)), level(_71)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347)), level(_71)).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float2 _364 = float2(_69, _67);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), level(_71)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364)), level(_71)).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float _156 = precise::max(_108, _118);
    float _158 = precise::max(_112, _122);
    float _160 = precise::max(_114, _124);
    float _162 = precise::max(_110, _120);
    float _164 = precise::max(_128, _138);
    float _166 = precise::max(_130, _140);
    float _168 = precise::max(_132, _142);
    float _170 = precise::max(_134, _144);
    float _172 = precise::max(_156, _164);
    float _174 = precise::max(_162, _166);
    float _176 = precise::max(_158, _168);
    float _178 = precise::max(_160, _170);
    float _180 = precise::max(_148, _172);
    float _182 = precise::max(_150, _174);
    float _184 = precise::max(_152, _176);
    float _186 = _180 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _188 = precise::max(_154, _178);
    float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _194 = _188 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _186;
    out.m_32.y = _190;
    out.m_32.z = _192;
    out.m_32.w = _194;
    return out;
}

