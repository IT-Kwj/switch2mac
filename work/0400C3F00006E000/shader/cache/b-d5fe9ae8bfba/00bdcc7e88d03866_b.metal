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
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _61 = _55 + _59;
    float _63 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _67 = _55 + _65;
    float _69 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _73 = _55 + _71;
    float _75 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _79 = _55 + _77;
    float _81 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _83 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _85 = _55 + _83;
    float _87 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _91 = _55 + _89;
    float _93 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _97 = _55 + _95;
    float _99 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _103 = _55 + _101;
    float _105 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float2 _289 = float2(_55, _57);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float2 _301 = float2(_61, _57);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).x;
    float2 _309 = float2(_63, _57);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).x;
    float2 _317 = float2(_67, _57);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).x;
    float2 _325 = float2(_69, _57);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_325, float2(0.0), isnan(_325))).x;
    float2 _333 = float2(_73, _57);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    float2 _341 = float2(_75, _57);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float2 _349 = float2(_79, _57);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).x;
    float2 _357 = float2(_81, _57);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).x;
    float2 _365 = float2(_85, _57);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_365, float2(0.0), isnan(_365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_365, float2(0.0), isnan(_365))).x;
    float2 _373 = float2(_87, _57);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).x;
    float2 _381 = float2(_91, _57);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _389 = float2(_93, _57);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float2 _397 = float2(_97, _57);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).x;
    float2 _405 = float2(_99, _57);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _413 = float2(_103, _57);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).x;
    float2 _421 = float2(_105, _57);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float _141 = _107 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _143 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].x, _141);
    float _145 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].x, _143);
    float _147 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].y, _145);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[18].y, _147);
    float _151 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[18].z, _149);
    float _153 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[18].z, _151);
    float _155 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[18].w, _153);
    float _157 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[18].w, _155);
    float _159 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].x, _157);
    float _161 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[19].x, _159);
    float _163 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].y, _161);
    float _165 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].y, _163);
    float _167 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _165);
    float _169 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].z, _167);
    float _171 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].w, _169);
    float _173 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].w, _171);
    out.m_32.x = _173;
    return out;
}

