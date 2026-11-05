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
int _41(thread const int& _482, thread const int& _483, thread const int& _484, thread int& _485, thread uint& gl_SubgroupInvocationID)
{
    int _488 = _484 & 31;
    uint _490 = uint(int(uint(_484) >> uint(8)));
    int _492 = int(_490) & 31;
    float _494 = as_type<float>(gl_SubgroupInvocationID);
    int _496 = as_type<int>(_494) & _492;
    int _498 = ~_492;
    int _500 = _488 & _498;
    int _502 = _500 | _496;
    int _504 = as_type<int>(_494) ^ _483;
    bool _507 = uint(_504) <= uint(_502);
    _485 = _507 ? (-1) : 0;
    float _509 = spvSubgroupShuffle(as_type<float>(_482), uint(_504));
    uint _511 = uint(_507 ? as_type<int>(_509) : _482);
    return int(_511);
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
    float _65 = 1.0 / _45;
    float _67 = _65 * _51;
    float _69 = _65 * _57;
    float _71 = _65 * _63;
    int _73 = as_type<int>(_67);
    int _75 = 1;
    int _77 = 7171;
    int _79;
    int _247 = _41(_73, _75, _77, _79, gl_SubgroupInvocationID);
    int _81 = _247;
    float _83 = rint(_71);
    float _85 = precise::max(_83, 0.0);
    uint _88 = uint(_85);
    uint _90 = clamp(_88, 0u, 65535u);
    int _92 = as_type<int>(_69);
    int _94 = 1;
    int _96 = 7171;
    int _98;
    int _262 = _41(_92, _94, _96, _98, gl_SubgroupInvocationID);
    int _100 = _262;
    uint _276 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _102 = (as_type<float>(_81) * float4(1.0, -1.0, 1.0, 0.0)[_276]) + (_67 * float4(1.0, 1.0, -1.0, 1.0)[_276]);
    uint _289 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _104 = (as_type<float>(_100) * float4(1.0, -1.0, 1.0, 0.0)[_289]) + (_69 * float4(1.0, 1.0, -1.0, 1.0)[_289]);
    float _106 = fma(_102, 0.5, _67);
    float _108 = fma(_102, -0.5, _67);
    float _110 = fma(_104, -0.5, _69);
    float _112 = fma(_104, 0.5, _69);
    float3 _316 = float3(_69, _108, float(int(_90)));
    float3 _321 = select(_316, float3(0.0), isnan(_316));
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _321.xy, uint(rint(_321.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _321.xy, uint(rint(_321.z))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float3 _338 = float3(_69, _106, float(int(_90)));
    float3 _340 = select(_338, float3(0.0), isnan(_338));
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _340.xy, uint(rint(_340.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _340.xy, uint(rint(_340.z))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float3 _357 = float3(_110, _67, float(int(_90)));
    float3 _359 = select(_357, float3(0.0), isnan(_357));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _359.xy, uint(rint(_359.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _359.xy, uint(rint(_359.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float3 _376 = float3(_112, _67, float(int(_90)));
    float3 _378 = select(_376, float3(0.0), isnan(_376));
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _378.xy, uint(rint(_378.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _378.xy, uint(rint(_378.z))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float3 _395 = float3(_69, _67, float(int(_90)));
    float3 _397 = select(_395, float3(0.0), isnan(_395));
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _397.xy, uint(rint(_397.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _397.xy, uint(rint(_397.z))).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float _165 = precise::min(_119, _129);
    float _167 = precise::min(_121, _131);
    float _169 = precise::min(_141, _151);
    float _171 = precise::min(_117, _127);
    float _173 = precise::min(_123, _133);
    float _175 = precise::min(_137, _147);
    float _177 = precise::min(_139, _149);
    float _179 = precise::min(_143, _153);
    float _181 = precise::min(_171, _175);
    float _183 = precise::min(_165, _177);
    float _185 = precise::min(_167, _169);
    float _187 = precise::min(_173, _179);
    float _189 = precise::min(_157, _181);
    float _191 = precise::min(_159, _183);
    float _193 = precise::min(_161, _185);
    float _195 = _189 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _197 = precise::min(_163, _187);
    float _199 = _191 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _201 = _193 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _203 = _197 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _195;
    out.m_32.y = _199;
    out.m_32.z = _201;
    out.m_32.w = _203;
    return out;
}

