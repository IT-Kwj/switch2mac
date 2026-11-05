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
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = floor(_55);
    float _61 = floor(_57);
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _65 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[3].z, _63);
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _69 = _65 + _67;
    float _71 = _65 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _73 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _65);
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _77 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[3].z, _75);
    float _79 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _81 = _77 + _79;
    float _83 = _77 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _85 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _77);
    float2 _241 = float2(_65, _81);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_241, float2(0.0), isnan(_241)), level(0.0)).x;
    float2 _253 = float2(_69, _81);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_253, float2(0.0), isnan(_253)), level(0.0)).x;
    float2 _261 = float2(_65, _77);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_261, float2(0.0), isnan(_261)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_261, float2(0.0), isnan(_261)), level(0.0)).x;
    float2 _269 = float2(_69, _77);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_269, float2(0.0), isnan(_269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_269, float2(0.0), isnan(_269)), level(0.0)).x;
    float2 _277 = float2(_71, _77);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277)), level(0.0)).x;
    float2 _285 = float2(_73, _77);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_285, float2(0.0), isnan(_285)), level(0.0)).x;
    float2 _293 = float2(_71, _81);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_293, float2(0.0), isnan(_293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_293, float2(0.0), isnan(_293)), level(0.0)).x;
    float2 _301 = float2(_73, _81);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301)), level(0.0)).x;
    float2 _309 = float2(_65, _83);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309)), level(0.0)).x;
    float2 _317 = float2(_69, _83);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317)), level(0.0)).x;
    float2 _325 = float2(_65, _85);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_325, float2(0.0), isnan(_325)), level(0.0)).x;
    float2 _333 = float2(_69, _85);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333)), level(0.0)).x;
    float2 _341 = float2(_71, _83);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341)), level(0.0)).x;
    float2 _349 = float2(_71, _85);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349)), level(0.0)).x;
    float2 _357 = float2(_73, _83);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357)), level(0.0)).x;
    float2 _365 = float2(_73, _85);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_365, float2(0.0), isnan(_365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_365, float2(0.0), isnan(_365)), level(0.0)).x;
    float _119 = _87 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _121 = _91 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _123 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[16].x, _119);
    float _125 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[17].x, _121);
    float _127 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[16].z, _123);
    float _129 = _103 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _131 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[17].z, _125);
    float _133 = _107 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _135 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[16].w, _127);
    float _137 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].x, _129);
    float _139 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[17].w, _131);
    float _141 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[19].x, _133);
    float _143 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].z, _137);
    float _145 = _135 + _139;
    float _147 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[19].z, _141);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[18].w, _143);
    float _151 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].w, _147);
    float _153 = _145 + _149;
    float _155 = _153 + _151;
    out.m_32.x = _155;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

