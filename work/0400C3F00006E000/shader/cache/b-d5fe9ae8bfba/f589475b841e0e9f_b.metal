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
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * _39;
    float _49 = _41 * 2.0;
    float _51 = _43 + _41;
    float _53 = _39 * 2.0;
    float _55 = fma(_41, _41, _47);
    float _57 = _49 + _43;
    float _59 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _51);
    float _61 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _51);
    float _63 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _51);
    float _65 = _45 + _39;
    float _67 = rsqrt(_55);
    float _69 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _57);
    float _71 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _57);
    float _73 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _57);
    float _75 = _53 + _45;
    float _77 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _65);
    float _79 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _65);
    float _81 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _65);
    float _83 = _67 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _85 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _75);
    float _87 = _41 * _83;
    float _89 = _39 * _83;
    float _91 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _75);
    float _93 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _75);
    float _95 = _87 + _43;
    float _97 = _89 + _45;
    float2 _279 = float2(_63, _81);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_279, float2(0.0), isnan(_279))).z;
    float2 _291 = float2(_43, _45);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291))).z;
    float2 _299 = float2(_59, _77);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).x;
    float _105 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _95);
    float _107 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].y, _95);
    float _109 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].z, _95);
    float _111 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _97);
    float _113 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].y, _97);
    float _115 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].z, _97);
    float2 _337 = float2(_43, _45);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).x;
    float2 _345 = float2(_43, _45);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).y;
    float2 _353 = float2(_61, _79);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).y;
    float2 _361 = float2(_69, _85);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float2 _369 = float2(_71, _91);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).y;
    float2 _377 = float2(_73, _93);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).z;
    float2 _385 = float2(_105, _111);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float2 _393 = float2(_107, _113);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).y;
    float2 _401 = float2(_109, _115);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401))).z;
    float _135 = _101 + _99;
    float _137 = _117 + _103;
    float _139 = _119 + _121;
    float _141 = _123 + _137;
    float _143 = _127 + _135;
    float _145 = _125 + _139;
    float _147 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[1].x, _141);
    float _149 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _145);
    float _151 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[1].z, _143);
    float _153 = _147 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _155 = _149 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _157 = _151 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _153;
    out.m_32.y = _155;
    out.m_32.z = _157;
    return out;
}

