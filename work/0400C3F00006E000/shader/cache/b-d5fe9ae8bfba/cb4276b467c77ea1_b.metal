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

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _178 = float3(_65, _63, float(int(_74)));
    float3 _183 = select(_178, float3(0.0), isnan(_178));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _183.xy, uint(rint(_183.z)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _183.xy, uint(rint(_183.z)), level(0.0), int2(1, 0)).x;
    float3 _194 = float3(_65, _63, float(int(_74)));
    float3 _196 = select(_194, float3(0.0), isnan(_194));
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _196.xy, uint(rint(_196.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _196.xy, uint(rint(_196.z)), level(0.0)).x;
    float3 _205 = float3(_65, _63, float(int(_74)));
    float3 _207 = select(_205, float3(0.0), isnan(_205));
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _207.xy, uint(rint(_207.z)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _207.xy, uint(rint(_207.z)), level(0.0), int2(0, 1)).x;
    float3 _217 = float3(_65, _63, float(int(_74)));
    float3 _219 = select(_217, float3(0.0), isnan(_217));
    float _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _219.xy, uint(rint(_219.z)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _219.xy, uint(rint(_219.z)), level(0.0), int2(1)).x;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[4].z + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _86 = _84 * _84;
    float _88 = -_76;
    float _90 = _78 + _88;
    float _92 = -_82;
    float _94 = _80 + _92;
    float _96 = -_80;
    float _98 = _78 + _96;
    float _100 = -_82;
    float _102 = _76 + _100;
    float _104 = _90 + _94;
    float _106 = _98 + _102;
    float _108 = fma(_104, _104, _86);
    float _110 = fma(_106, _106, _108);
    float _112 = rsqrt(_110);
    float _114 = _112 * 0.5;
    float _116 = fma(_104, _114, 0.5);
    float _118 = fma(_106, _114, 0.5);
    out.m_32.x = _116;
    out.m_32.y = _118;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

