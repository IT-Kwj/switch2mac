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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_24 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _31 = gl_FragCoord.w;
    float _33 = gl_FragCoord.x;
    float _35 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _37 = _33 / _35;
    float _39 = gl_FragCoord.y;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = 1.0 / _31;
    float _47 = _45 * 0.00390625;
    float _49 = _37 * _47;
    float _51 = _43 * _47;
    float _53 = _49 + (-0.03125);
    float _55 = _49 + (-0.03515625);
    float _57 = _49 + (-0.02734375);
    float _59 = _49 + (-0.0234375);
    float _61 = _49 + (-0.01953125);
    float _63 = _49 + (-0.015625);
    float2 _225 = float2(_53, _51);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_225, float2(0.0), isnan(_225))).x;
    float2 _237 = float2(_55, _51);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_237, float2(0.0), isnan(_237))).x;
    float2 _245 = float2(_57, _51);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245))).x;
    float2 _253 = float2(_59, _51);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_253, float2(0.0), isnan(_253))).x;
    float2 _261 = float2(_61, _51);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_261, float2(0.0), isnan(_261))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_261, float2(0.0), isnan(_261))).x;
    float2 _269 = float2(_63, _51);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_269, float2(0.0), isnan(_269))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_269, float2(0.0), isnan(_269))).x;
    float _77 = _49 + (-0.01171875);
    float _79 = _49 + (-0.0078125);
    float _81 = _49 + (-0.00390625);
    float _83 = _49 + 0.00390625;
    float _85 = _49 + 0.0078125;
    float _87 = _49 + 0.01171875;
    float2 _294 = float2(_77, _51);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_294, float2(0.0), isnan(_294))).x;
    float2 _302 = float2(_79, _51);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_302, float2(0.0), isnan(_302))).x;
    float2 _310 = float2(_81, _51);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_310, float2(0.0), isnan(_310))).x;
    float2 _318 = float2(_49, _51);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _330 = float2(_83, _51);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).x;
    float2 _338 = float2(_85, _51);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float2(0.0), isnan(_338))).x;
    float2 _346 = float2(_87, _51);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).x;
    float _109 = _49 + 0.015625;
    float _111 = _49 + 0.01953125;
    float _113 = _49 + 0.0234375;
    float _115 = _49 + 0.02734375;
    float2 _366 = float2(_109, _51);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).x;
    float2 _374 = float2(_111, _51);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).x;
    float2 _382 = float2(_113, _51);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).x;
    float2 _390 = float2(_115, _51);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _125 = _49 + 0.03125;
    float _127 = _49 + 0.03515625;
    float2 _404 = float2(_125, _51);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float2 _412 = float2(_127, _51);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float _133 = _65 * 0.0319039933383464813232421875;
    float _135 = fma(_67, 0.020628057420253753662109375, _133);
    float _137 = fma(_69, 0.048904143273830413818359375, _135);
    float _139 = fma(_71, 0.072541870176792144775390625, _137);
    float _141 = fma(_73, 0.10664616525173187255859375, _139);
    float _143 = fma(_75, 0.15314050018787384033203125, _141);
    float _145 = fma(_89, 0.21902985870838165283203125, _143);
    float _147 = fma(_91, 0.3112169206142425537109375, _145);
    float _149 = fma(_93, 0.451655864715576171875, _147);
    float _151 = fma(_99, 0.69422256946563720703125, _149);
    float _153 = fma(_103, 0.451655864715576171875, _151);
    float _155 = fma(_105, 0.3112169206142425537109375, _153);
    float _157 = fma(_107, 0.21902985870838165283203125, _155);
    float _159 = fma(_117, 0.15314050018787384033203125, _157);
    float _161 = fma(_119, 0.10664616525173187255859375, _159);
    float _163 = fma(_121, 0.072541870176792144775390625, _161);
    float _165 = fma(_123, 0.048904143273830413818359375, _163);
    float _167 = fma(_129, 0.0319039933383464813232421875, _165);
    float _169 = fma(_131, 0.020628057420253753662109375, _167);
    out.m_24.x = _169;
    out.m_24.y = _101;
    return out;
}

