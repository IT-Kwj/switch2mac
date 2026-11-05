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

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _63 = _57 + _61;
    float2 _169 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_169, float2(0.0), isnan(_169))).x;
    float _67 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = _57 + _69;
    float _73 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = _57 + _75;
    float2 _201 = float2(_63, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_201, float2(0.0), isnan(_201))).x;
    float _81 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _213 = float2(_67, _59);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_213, float2(0.0), isnan(_213))).x;
    float2 _221 = float2(_71, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_221, float2(0.0), isnan(_221))).x;
    float2 _229 = float2(_73, _59);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_229, float2(0.0), isnan(_229))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_229, float2(0.0), isnan(_229))).x;
    float2 _237 = float2(_77, _59);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_237, float2(0.0), isnan(_237))).x;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _93 = _57 + _91;
    float2 _251 = float2(_81, _59);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_251, float2(0.0), isnan(_251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_251, float2(0.0), isnan(_251))).x;
    float _97 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _263 = float2(_93, _59);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
    float2 _271 = float2(_57, _59);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_271, float2(0.0), isnan(_271))).x;
    float2 _279 = float2(_97, _59);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_279, float2(0.0), isnan(_279))).x;
    float _105 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _107 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _105);
    float _109 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].x, _107);
    float _111 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _109);
    float _113 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _111);
    float _115 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].z, _113);
    float _117 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _115);
    float _119 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[18].w, _117);
    float _121 = -_101;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _125 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[18].w, _119);
    float _127 = _125 * _123;
    out.m_34.x = _127;
    return out;
}

