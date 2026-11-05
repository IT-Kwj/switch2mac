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
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _61 = _55 + _59;
    float _63 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _67 = _55 + _65;
    float _69 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _73 = _55 + _71;
    float _75 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _79 = _55 + _77;
    float _81 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _83 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _85 = _55 + _83;
    float _87 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _91 = _55 + _89;
    float _93 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _97 = _55 + _95;
    float _99 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _103 = _55 + _101;
    float _105 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float2 _301 = float2(_57, _55);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).x;
    float2 _313 = float2(_57, _61);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_313, float2(0.0), isnan(_313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_313, float2(0.0), isnan(_313))).x;
    float2 _321 = float2(_57, _63);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_321, float2(0.0), isnan(_321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_321, float2(0.0), isnan(_321))).x;
    float2 _329 = float2(_57, _67);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).x;
    float2 _337 = float2(_57, _69);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).x;
    float2 _345 = float2(_57, _73);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).x;
    float2 _353 = float2(_57, _75);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).x;
    float2 _361 = float2(_57, _79);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float2 _369 = float2(_57, _81);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float2 _377 = float2(_57, _85);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float2 _385 = float2(_57, _87);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float2 _393 = float2(_57, _91);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float2 _401 = float2(_57, _93);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401))).x;
    float2 _409 = float2(_57, _97);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).x;
    float2 _417 = float2(_57, _99);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_417, float2(0.0), isnan(_417))).x;
    float2 _425 = float2(_57, _103);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float2 _433 = float2(_57, _105);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433))).x;
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
    float _161 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _163 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[19].x, _159);
    float _165 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].y, _163);
    float _167 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].y, _165);
    float _169 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _167);
    float _171 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].z, _169);
    float _173 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].w, _171);
    float _175 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].w, _173);
    float _177 = _175 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _179 = _177 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _181 * _161;
    out.m_32.x = _183;
    return out;
}

