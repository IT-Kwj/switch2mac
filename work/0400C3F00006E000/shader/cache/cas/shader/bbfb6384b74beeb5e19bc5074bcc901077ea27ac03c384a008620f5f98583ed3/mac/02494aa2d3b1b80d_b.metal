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
int _43(thread const int& _600, thread const int& _601, thread const int& _602, thread int& _603, thread uint& gl_SubgroupInvocationID)
{
    int _606 = _602 & 31;
    uint _608 = uint(int(uint(_602) >> uint(8)));
    int _610 = int(_608) & 31;
    float _612 = as_type<float>(gl_SubgroupInvocationID);
    int _614 = as_type<int>(_612) & _610;
    int _616 = ~_610;
    int _618 = _606 & _616;
    int _620 = _618 | _614;
    int _622 = as_type<int>(_612) ^ _601;
    bool _625 = uint(_622) <= uint(_620);
    _603 = _625 ? (-1) : 0;
    float _627 = spvSubgroupShuffle(as_type<float>(_600), uint(_622));
    uint _629 = uint(_625 ? as_type<int>(_627) : _600);
    return int(_629);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_31.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _65;
    float _81 = _73 * _71;
    int _83 = as_type<int>(_75);
    int _85 = 1;
    int _87 = 7171;
    int _89;
    int _293 = _43(_83, _85, _87, _89, gl_SubgroupInvocationID);
    int _91 = _293;
    float _93 = rint(_79);
    float _95 = precise::max(_93, 0.0);
    uint _98 = uint(_95);
    uint _100 = clamp(_98, 0u, 65535u);
    int _102 = as_type<int>(_77);
    int _104 = 1;
    int _106 = 7171;
    int _108;
    int _308 = _43(_102, _104, _106, _108, gl_SubgroupInvocationID);
    int _110 = _308;
    uint _322 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _112 = (as_type<float>(_91) * float4(1.0, -1.0, 1.0, 0.0)[_322]) + (_75 * float4(1.0, 1.0, -1.0, 1.0)[_322]);
    uint _335 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _114 = (as_type<float>(_110) * float4(1.0, -1.0, 1.0, 0.0)[_335]) + (_77 * float4(1.0, 1.0, -1.0, 1.0)[_335]);
    float _116 = fma(_112, -0.5, _75);
    float _118 = fma(_112, 0.5, _75);
    float _120 = fma(_114, -0.5, _77);
    float _122 = fma(_114, 0.5, _77);
    float3 _362 = float3(_77, _116, float(int(_100)));
    float3 _367 = select(_362, float3(0.0), isnan(_362));
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _367.xy, uint(rint(_367.z)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _367.xy, uint(rint(_367.z)), level(_81)).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float3 _385 = float3(_77, _118, float(int(_100)));
    float3 _387 = select(_385, float3(0.0), isnan(_385));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _387.xy, uint(rint(_387.z)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _387.xy, uint(rint(_387.z)), level(_81)).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float3 _405 = float3(_120, _75, float(int(_100)));
    float3 _407 = select(_405, float3(0.0), isnan(_405));
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _407.xy, uint(rint(_407.z)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _407.xy, uint(rint(_407.z)), level(_81)).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float3 _425 = float3(_122, _75, float(int(_100)));
    float3 _427 = select(_425, float3(0.0), isnan(_425));
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _427.xy, uint(rint(_427.z)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _427.xy, uint(rint(_427.z)), level(_81)).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float3 _445 = float3(_77, _75, float(int(_100)));
    float3 _447 = select(_445, float3(0.0), isnan(_445));
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _447.xy, uint(rint(_447.z)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _447.xy, uint(rint(_447.z)), level(_81)).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float3 _465 = float3(_77, _75, float(int(_100)));
    float3 _467 = select(_465, float3(0.0), isnan(_465));
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _467.xy, uint(rint(_467.z)), level(_81)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _467.xy, uint(rint(_467.z)), level(_81)).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float _185 = precise::min(_133, _143);
    float _187 = precise::min(_131, _141);
    float _189 = precise::min(_151, _161);
    float _191 = precise::min(_129, _139);
    float _193 = precise::min(_127, _137);
    float _195 = precise::min(_147, _157);
    float _197 = precise::min(_153, _163);
    float _199 = precise::min(_187, _189);
    float _201 = precise::min(_149, _159);
    float _203 = precise::min(_193, _195);
    float _205 = precise::min(_185, _197);
    float _207 = precise::min(_171, _199);
    float _209 = precise::min(_191, _201);
    float _211 = precise::min(_167, _203);
    float _213 = precise::min(_173, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _217 = precise::min(_169, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _221 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _223 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _225 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[5].x, _215);
    float _227 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[5].y, _219);
    float _229 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[5].z, _221);
    float _231 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[5].w, _223);
    float _233 = _225 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _235 = _227 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _237 = _229 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _239 = _231 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _233;
    out.m_34.y = _235;
    out.m_34.z = _237;
    out.m_34.w = _239;
    return out;
}

