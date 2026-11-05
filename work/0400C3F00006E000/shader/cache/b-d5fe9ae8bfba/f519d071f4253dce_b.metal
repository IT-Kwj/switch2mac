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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_29.x;
    float _41 = in.m_29.y;
    float2 _100 = float2(_39, _41);
    float _43 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_100, float2(0.0), isnan(_100))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_100, float2(0.0), isnan(_100))).x;
    float2 _112 = float2(_39, _41);
    float2 _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_112, float2(0.0), isnan(_112))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_112, float2(0.0), isnan(_112))).xw;
    float _49 = _47.x;
    float _51 = _47.y;
    float _53 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _55 = 1.0 / _53;
    float _57 = -_55;
    float _59 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[0].z, _39);
    float _61 = -_55;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[0].w, _41);
    float2 _151 = float2(_59, _41);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_151, float2(0.0), isnan(_151))).x;
    float2 _159 = float2(_39, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_159, float2(0.0), isnan(_159))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_159, float2(0.0), isnan(_159))).x;
    float _69 = -_49;
    float _71 = _69 + _65;
    float _73 = -_49;
    float _75 = _73 + _67;
    float _77 = fma(_71, _71, 0.010000000707805156707763671875);
    float _79 = fma(_75, _75, _77);
    float _81 = rsqrt(_79);
    float _83 = _81 * 0.5;
    float _85 = fma(_81, 0.0500000007450580596923828125, 0.5);
    float _87 = fma(_71, _83, 0.5);
    float _89 = fma(_75, _83, 0.5);
    out.m_32.x = _87;
    out.m_32.y = _85;
    out.m_32.z = _89;
    out.m_32.w = _51;
    return out;
}

