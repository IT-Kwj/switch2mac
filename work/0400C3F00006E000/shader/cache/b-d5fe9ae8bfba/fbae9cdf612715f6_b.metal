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
    texture2d<float> fp_t_tcb_A [[id(3)]];
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
int _43(thread const int& _521, thread const int& _522, thread const int& _523, thread int& _524, thread uint& gl_SubgroupInvocationID)
{
    int _527 = _523 & 31;
    uint _530 = uint(int(uint(_523) >> uint(8)));
    int _532 = int(_530) & 31;
    float _534 = as_type<float>(gl_SubgroupInvocationID);
    int _536 = as_type<int>(_534) & _532;
    int _538 = ~_532;
    int _540 = _527 & _538;
    int _542 = _540 | _536;
    int _544 = as_type<int>(_534) ^ _522;
    bool _547 = uint(_544) <= uint(_542);
    _524 = _547 ? (-1) : 0;
    float _549 = spvSubgroupShuffle(as_type<float>(_521), uint(_544));
    uint _551 = uint(_547 ? as_type<int>(_549) : _521);
    return int(_551);
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
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    int _67 = as_type<int>(_63);
    int _69 = 1;
    int _71 = 7171;
    int _73;
    int _247 = _43(_67, _69, _71, _73, gl_SubgroupInvocationID);
    int _75 = _247;
    int _77 = as_type<int>(_65);
    int _79 = 1;
    int _81 = 7171;
    int _83;
    int _250 = _43(_77, _79, _81, _83, gl_SubgroupInvocationID);
    int _85 = _250;
    uint _265 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _87 = (as_type<float>(_75) * float4(1.0, -1.0, 1.0, 0.0)[_265]) + (_63 * float4(1.0, 1.0, -1.0, 1.0)[_265]);
    uint _278 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _89 = (as_type<float>(_85) * float4(1.0, -1.0, 1.0, 0.0)[_278]) + (_65 * float4(1.0, 1.0, -1.0, 1.0)[_278]);
    float _91 = fma(_87, -0.5, _63);
    float _93 = fma(_87, 0.5, _63);
    float _95 = fma(_89, -0.5, _65);
    float _97 = fma(_89, 0.5, _65);
    float2 _303 = float2(_91, _65);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _322 = float2(_93, _65);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _338 = float2(_63, _95);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float2(0.0), isnan(_338))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float2 _354 = float2(_63, _97);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_354, float2(0.0), isnan(_354))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _370 = float2(_63, _65);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _386 = float2(_63, _65);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_386, float2(0.0), isnan(_386))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = precise::min(_102, _112);
    float _162 = precise::min(_104, _114);
    float _164 = precise::min(_106, _116);
    float _166 = precise::min(_126, _136);
    float _168 = precise::min(_108, _118);
    float _170 = precise::min(_128, _138);
    float _172 = precise::min(_122, _132);
    float _174 = precise::min(_166, _164);
    float _176 = precise::min(_124, _134);
    float _178 = precise::min(_170, _168);
    float _180 = precise::min(_172, _160);
    float _182 = precise::min(_146, _174);
    float _184 = precise::min(_176, _162);
    float _186 = precise::min(_142, _180);
    float _188 = precise::min(_148, _178);
    float _190 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _192 = precise::min(_144, _184);
    float _194 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _196 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _198 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _200 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[5].x, _190);
    float _202 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[5].y, _194);
    float _204 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[5].z, _196);
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[5].w, _198);
    float _208 = _200 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _208;
    out.m_34.y = _210;
    out.m_34.z = _212;
    out.m_34.w = _214;
    return out;
}

