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
int _43(thread const int& _545, thread const int& _546, thread const int& _547, thread int& _548, thread uint& gl_SubgroupInvocationID)
{
    int _551 = _547 & 31;
    uint _554 = uint(int(uint(_547) >> uint(8)));
    int _556 = int(_554) & 31;
    float _558 = as_type<float>(gl_SubgroupInvocationID);
    int _560 = as_type<int>(_558) & _556;
    int _562 = ~_556;
    int _564 = _551 & _562;
    int _566 = _564 | _560;
    int _568 = as_type<int>(_558) ^ _546;
    bool _571 = uint(_568) <= uint(_566);
    _548 = _571 ? (-1) : 0;
    float _573 = spvSubgroupShuffle(as_type<float>(_545), uint(_568));
    uint _575 = uint(_571 ? as_type<int>(_573) : _545);
    return int(_575);
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
    float _61 = in.m_31.w;
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
    int _265 = _43(_75, _77, _79, _81, gl_SubgroupInvocationID);
    int _83 = _265;
    int _85 = as_type<int>(_71);
    int _87 = 1;
    int _89 = 7171;
    int _91;
    int _268 = _43(_85, _87, _89, _91, gl_SubgroupInvocationID);
    int _93 = _268;
    uint _283 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _95 = (as_type<float>(_83) * float4(1.0, -1.0, 1.0, 0.0)[_283]) + (_69 * float4(1.0, 1.0, -1.0, 1.0)[_283]);
    uint _296 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _97 = (as_type<float>(_93) * float4(1.0, -1.0, 1.0, 0.0)[_296]) + (_71 * float4(1.0, 1.0, -1.0, 1.0)[_296]);
    float _99 = fma(_95, 0.5, _69);
    float _101 = fma(_95, -0.5, _69);
    float _103 = fma(_97, -0.5, _71);
    float _105 = fma(_97, 0.5, _71);
    float2 _321 = float2(_71, _101);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_321, float2(0.0), isnan(_321)), level(_73)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_321, float2(0.0), isnan(_321)), level(_73)).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float2 _341 = float2(_71, _99);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341)), level(_73)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341)), level(_73)).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _358 = float2(_103, _69);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_358, float2(0.0), isnan(_358)), level(_73)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_358, float2(0.0), isnan(_358)), level(_73)).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _375 = float2(_105, _69);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375)), level(_73)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375)), level(_73)).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float2 _392 = float2(_71, _69);
    float4 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), level(_73)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392)), level(_73)).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    float2 _409 = float2(_71, _69);
    float4 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_409, float2(0.0), isnan(_409)), level(_73)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_409, float2(0.0), isnan(_409)), level(_73)).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float _168 = precise::max(_116, _126);
    float _170 = precise::max(_114, _124);
    float _172 = precise::max(_130, _140);
    float _174 = precise::max(_132, _142);
    float _176 = precise::max(_134, _144);
    float _178 = precise::max(_110, _120);
    float _180 = precise::max(_136, _146);
    float _182 = precise::max(_170, _176);
    float _184 = precise::max(_112, _122);
    float _186 = precise::max(_178, _172);
    float _188 = precise::max(_168, _180);
    float _190 = precise::max(_154, _182);
    float _192 = precise::max(_184, _174);
    float _194 = precise::max(_150, _186);
    float _196 = precise::max(_156, _188);
    float _198 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _200 = precise::max(_152, _192);
    float _202 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _204 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _206 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _208 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[5].x, _198);
    float _210 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[5].y, _202);
    float _212 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[5].z, _204);
    float _214 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[5].w, _206);
    float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _216;
    out.m_34.y = _218;
    out.m_34.z = _220;
    out.m_34.w = _222;
    return out;
}

