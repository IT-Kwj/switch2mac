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
int _41(thread const int& _430, thread const int& _431, thread const int& _432, thread int& _433, thread uint& gl_SubgroupInvocationID)
{
    int _436 = _432 & 31;
    uint _439 = uint(int(uint(_432) >> uint(8)));
    int _441 = int(_439) & 31;
    float _443 = as_type<float>(gl_SubgroupInvocationID);
    int _445 = as_type<int>(_443) & _441;
    int _447 = ~_441;
    int _449 = _436 & _447;
    int _451 = _449 | _445;
    int _453 = as_type<int>(_443) ^ _431;
    bool _456 = uint(_453) <= uint(_451);
    _433 = _456 ? (-1) : 0;
    float _458 = spvSubgroupShuffle(as_type<float>(_430), uint(_453));
    uint _460 = uint(_456 ? as_type<int>(_458) : _430);
    return int(_460);
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
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    int _65 = as_type<int>(_61);
    int _67 = 1;
    int _69 = 7171;
    int _71;
    int _219 = _41(_65, _67, _69, _71, gl_SubgroupInvocationID);
    int _73 = _219;
    int _75 = as_type<int>(_63);
    int _77 = 1;
    int _79 = 7171;
    int _81;
    int _222 = _41(_75, _77, _79, _81, gl_SubgroupInvocationID);
    int _83 = _222;
    uint _237 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _85 = (as_type<float>(_73) * float4(1.0, -1.0, 1.0, 0.0)[_237]) + (_61 * float4(1.0, 1.0, -1.0, 1.0)[_237]);
    uint _250 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _87 = (as_type<float>(_83) * float4(1.0, -1.0, 1.0, 0.0)[_250]) + (_63 * float4(1.0, 1.0, -1.0, 1.0)[_250]);
    float _89 = fma(_85, -0.5, _61);
    float _91 = fma(_85, 0.5, _61);
    float _93 = fma(_87, -0.5, _63);
    float _95 = fma(_87, 0.5, _63);
    float2 _275 = float2(_63, _89);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_275, float2(0.0), isnan(_275))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float2 _294 = float2(_63, _91);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_294, float2(0.0), isnan(_294))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float2 _310 = float2(_93, _61);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_310, float2(0.0), isnan(_310))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _326 = float2(_95, _61);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_326, float2(0.0), isnan(_326))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _342 = float2(_63, _61);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_342, float2(0.0), isnan(_342))).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float _148 = precise::min(_100, _110);
    float _150 = precise::min(_102, _112);
    float _152 = precise::min(_104, _114);
    float _154 = precise::min(_106, _116);
    float _156 = precise::min(_120, _130);
    float _158 = precise::min(_122, _132);
    float _160 = precise::min(_124, _134);
    float _162 = precise::min(_126, _136);
    float _164 = precise::min(_148, _156);
    float _166 = precise::min(_150, _158);
    float _168 = precise::min(_152, _160);
    float _170 = precise::min(_154, _162);
    float _172 = precise::min(_140, _164);
    float _174 = precise::min(_142, _166);
    float _176 = precise::min(_144, _168);
    float _178 = _172 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _180 = precise::min(_146, _170);
    float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _186 = _180 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _178;
    out.m_32.y = _182;
    out.m_32.z = _184;
    out.m_32.w = _186;
    return out;
}

