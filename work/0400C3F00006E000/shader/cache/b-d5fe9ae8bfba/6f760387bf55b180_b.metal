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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _43(thread const int& _576, thread const int& _577, thread const int& _578, thread int& _579, thread uint& gl_SubgroupInvocationID)
{
    int _582 = _578 & 31;
    uint _584 = uint(int(uint(_578) >> uint(8)));
    int _586 = int(_584) & 31;
    float _588 = as_type<float>(gl_SubgroupInvocationID);
    int _590 = as_type<int>(_588) & _586;
    int _592 = ~_586;
    int _594 = _582 & _592;
    int _596 = _594 | _590;
    int _598 = as_type<int>(_588) ^ _577;
    bool _601 = uint(_598) <= uint(_596);
    _579 = _601 ? (-1) : 0;
    float _603 = spvSubgroupShuffle(as_type<float>(_576), uint(_598));
    uint _605 = uint(_601 ? as_type<int>(_603) : _576);
    return int(_605);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _47;
    float _69 = _67 * _53;
    float _71 = _67 * _59;
    float _73 = _67 * _65;
    int _75 = as_type<int>(_69);
    int _77 = 1;
    int _79 = 7171;
    int _81;
    int _275 = _43(_75, _77, _79, _81, gl_SubgroupInvocationID);
    int _83 = _275;
    float _85 = rint(_73);
    float _87 = precise::max(_85, 0.0);
    uint _90 = uint(_87);
    uint _92 = clamp(_90, 0u, 65535u);
    int _94 = as_type<int>(_71);
    int _96 = 1;
    int _98 = 7171;
    int _100;
    int _290 = _43(_94, _96, _98, _100, gl_SubgroupInvocationID);
    int _102 = _290;
    uint _304 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _104 = (as_type<float>(_83) * float4(1.0, -1.0, 1.0, 0.0)[_304]) + (_69 * float4(1.0, 1.0, -1.0, 1.0)[_304]);
    uint _317 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _106 = (as_type<float>(_102) * float4(1.0, -1.0, 1.0, 0.0)[_317]) + (_71 * float4(1.0, 1.0, -1.0, 1.0)[_317]);
    float _108 = fma(_104, -0.5, _69);
    float _110 = fma(_104, 0.5, _69);
    float _112 = fma(_106, -0.5, _71);
    float _114 = fma(_106, 0.5, _71);
    float3 _344 = float3(_108, _71, float(int(_92)));
    float3 _349 = select(_344, float3(0.0), isnan(_344));
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _349.xy, uint(rint(_349.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _349.xy, uint(rint(_349.z))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float3 _366 = float3(_110, _71, float(int(_92)));
    float3 _368 = select(_366, float3(0.0), isnan(_366));
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _368.xy, uint(rint(_368.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _368.xy, uint(rint(_368.z))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float3 _385 = float3(_69, _112, float(int(_92)));
    float3 _387 = select(_385, float3(0.0), isnan(_385));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _387.xy, uint(rint(_387.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _387.xy, uint(rint(_387.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _404 = float3(_69, _114, float(int(_92)));
    float3 _406 = select(_404, float3(0.0), isnan(_404));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _406.xy, uint(rint(_406.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _406.xy, uint(rint(_406.z))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float3 _423 = float3(_69, _71, float(int(_92)));
    float3 _425 = select(_423, float3(0.0), isnan(_423));
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _425.xy, uint(rint(_425.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _425.xy, uint(rint(_425.z))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float3 _442 = float3(_69, _71, float(int(_92)));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _444.xy, uint(rint(_444.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _444.xy, uint(rint(_444.z))).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float _177 = precise::min(_119, _129);
    float _179 = precise::min(_121, _131);
    float _181 = precise::min(_123, _133);
    float _183 = precise::min(_143, _153);
    float _185 = precise::min(_125, _135);
    float _187 = precise::min(_145, _155);
    float _189 = precise::min(_139, _149);
    float _191 = precise::min(_183, _181);
    float _193 = precise::min(_141, _151);
    float _195 = precise::min(_187, _185);
    float _197 = precise::min(_189, _177);
    float _199 = precise::min(_163, _191);
    float _201 = precise::min(_193, _179);
    float _203 = precise::min(_159, _197);
    float _205 = precise::min(_165, _195);
    float _207 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _209 = precise::min(_161, _201);
    float _211 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _213 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _215 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _217 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[5].x, _207);
    float _219 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[5].y, _211);
    float _221 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[5].z, _213);
    float _223 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[5].w, _215);
    float _225 = _217 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _227 = _219 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _229 = _221 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _231 = _223 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _225;
    out.m_34.y = _227;
    out.m_34.z = _229;
    out.m_34.w = _231;
    return out;
}

