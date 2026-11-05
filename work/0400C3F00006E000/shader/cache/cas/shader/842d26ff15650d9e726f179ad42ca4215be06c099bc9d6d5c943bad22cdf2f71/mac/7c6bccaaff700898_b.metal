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
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_27.x;
    float _43 = in.m_29.y;
    float _45 = in.m_29.x;
    float _47 = _39 * _39;
    float _49 = fma(_41, _41, _47);
    float _51 = rsqrt(_49);
    float _53 = _51 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _55 = _39 * _53;
    float _57 = _41 * _53;
    float _59 = _43 + _55;
    float _61 = _45 + _57;
    float _63 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _65 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _67 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _69 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _71 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _73 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float2 _172 = float2(_65, _63);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_172, float2(0.0), isnan(_172))).x;
    float2 _184 = float2(_45, _43);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_184, float2(0.0), isnan(_184))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_184, float2(0.0), isnan(_184))).x;
    float2 _192 = float2(_67, _69);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_192, float2(0.0), isnan(_192))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_192, float2(0.0), isnan(_192))).y;
    float2 _200 = float2(_45, _43);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_200, float2(0.0), isnan(_200))).y;
    float2 _208 = float2(_45, _43);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_208, float2(0.0), isnan(_208))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_208, float2(0.0), isnan(_208))).z;
    float2 _216 = float2(_73, _71);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_216, float2(0.0), isnan(_216))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_216, float2(0.0), isnan(_216))).z;
    float _87 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[1].x, _77);
    float _89 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[1].y, _81);
    float _91 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[1].z, _83);
    float _93 = _87 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _95 = _89 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _97 = _91 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _93;
    out.m_32.y = _95;
    out.m_32.z = _97;
    return out;
}

