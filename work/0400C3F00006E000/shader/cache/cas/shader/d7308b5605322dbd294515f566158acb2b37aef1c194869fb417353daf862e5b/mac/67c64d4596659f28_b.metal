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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
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
int _41(thread const int& _505, thread const int& _506, thread const int& _507, thread int& _508, thread uint& gl_SubgroupInvocationID)
{
    int _511 = _507 & 31;
    uint _513 = uint(int(uint(_507) >> uint(8)));
    int _515 = int(_513) & 31;
    float _517 = as_type<float>(gl_SubgroupInvocationID);
    int _519 = as_type<int>(_517) & _515;
    int _521 = ~_515;
    int _523 = _511 & _521;
    int _525 = _523 | _519;
    int _527 = as_type<int>(_517) ^ _506;
    bool _530 = uint(_527) <= uint(_525);
    _508 = _530 ? (-1) : 0;
    float _532 = spvSubgroupShuffle(as_type<float>(_505), uint(_527));
    uint _534 = uint(_530 ? as_type<int>(_532) : _505);
    return int(_534);
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
    float _59 = in.m_29.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_29.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    int _81 = as_type<int>(_73);
    int _83 = 1;
    int _85 = 7171;
    int _87;
    int _265 = _41(_81, _83, _85, _87, gl_SubgroupInvocationID);
    int _89 = _265;
    float _91 = rint(_77);
    float _93 = precise::max(_91, 0.0);
    uint _96 = uint(_93);
    uint _98 = clamp(_96, 0u, 65535u);
    int _100 = as_type<int>(_75);
    int _102 = 1;
    int _104 = 7171;
    int _106;
    int _280 = _41(_100, _102, _104, _106, gl_SubgroupInvocationID);
    int _108 = _280;
    uint _294 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _110 = (as_type<float>(_89) * float4(1.0, -1.0, 1.0, 0.0)[_294]) + (_73 * float4(1.0, 1.0, -1.0, 1.0)[_294]);
    uint _307 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _112 = (as_type<float>(_108) * float4(1.0, -1.0, 1.0, 0.0)[_307]) + (_75 * float4(1.0, 1.0, -1.0, 1.0)[_307]);
    float _114 = fma(_110, -0.5, _73);
    float _116 = fma(_110, 0.5, _73);
    float _118 = fma(_112, -0.5, _75);
    float _120 = fma(_112, 0.5, _75);
    float3 _334 = float3(_75, _114, float(int(_98)));
    float3 _339 = select(_334, float3(0.0), isnan(_334));
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _339.xy, uint(rint(_339.z)), level(_79)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _339.xy, uint(rint(_339.z)), level(_79)).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float3 _357 = float3(_75, _116, float(int(_98)));
    float3 _359 = select(_357, float3(0.0), isnan(_357));
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _359.xy, uint(rint(_359.z)), level(_79)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _359.xy, uint(rint(_359.z)), level(_79)).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float3 _377 = float3(_118, _73, float(int(_98)));
    float3 _379 = select(_377, float3(0.0), isnan(_377));
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _379.xy, uint(rint(_379.z)), level(_79)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _379.xy, uint(rint(_379.z)), level(_79)).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float3 _397 = float3(_120, _73, float(int(_98)));
    float3 _399 = select(_397, float3(0.0), isnan(_397));
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _399.xy, uint(rint(_399.z)), level(_79)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _399.xy, uint(rint(_399.z)), level(_79)).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float3 _417 = float3(_75, _73, float(int(_98)));
    float3 _419 = select(_417, float3(0.0), isnan(_417));
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _419.xy, uint(rint(_419.z)), level(_79)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _419.xy, uint(rint(_419.z)), level(_79)).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float _173 = precise::min(_127, _137);
    float _175 = precise::min(_129, _139);
    float _177 = precise::min(_131, _141);
    float _179 = precise::min(_149, _159);
    float _181 = precise::min(_125, _135);
    float _183 = precise::min(_145, _155);
    float _185 = precise::min(_147, _157);
    float _187 = precise::min(_151, _161);
    float _189 = precise::min(_181, _183);
    float _191 = precise::min(_173, _185);
    float _193 = precise::min(_175, _179);
    float _195 = precise::min(_177, _187);
    float _197 = precise::min(_165, _189);
    float _199 = precise::min(_167, _191);
    float _201 = precise::min(_169, _193);
    float _203 = _197 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _205 = precise::min(_171, _195);
    float _207 = _199 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _209 = _201 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _211 = _205 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _203;
    out.m_32.y = _207;
    out.m_32.z = _209;
    out.m_32.w = _211;
    return out;
}

