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
    float _39 = in.m_27.x;
    float _41 = in.m_29.x;
    float _43 = in.m_27.y;
    float _45 = in.m_29.y;
    float _47 = _39 * 2.0;
    float _49 = _41 + _39;
    float _51 = _41 + _47;
    float _53 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _49);
    float _55 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _49);
    float _57 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _49);
    float _59 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _51);
    float _61 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _51);
    float _63 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _51);
    float _65 = _45 + _43;
    float _67 = _43 * 2.0;
    float _69 = _39 * 3.0;
    float _71 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].x, _65);
    float _73 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].y, _65);
    float _75 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].z, _65);
    float _77 = _43 * 3.0;
    float _79 = _45 + _67;
    float _81 = _69 + _41;
    float2 _238 = float2(_57, _75);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_238, float2(0.0), isnan(_238))).z;
    float2 _250 = float2(_41, _45);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_250, float2(0.0), isnan(_250))).z;
    float2 _258 = float2(_53, _71);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_258, float2(0.0), isnan(_258))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_258, float2(0.0), isnan(_258))).x;
    float2 _266 = float2(_41, _45);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_266, float2(0.0), isnan(_266))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_266, float2(0.0), isnan(_266))).x;
    float2 _274 = float2(_41, _45);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_274, float2(0.0), isnan(_274))).y;
    float2 _282 = float2(_55, _73);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_282, float2(0.0), isnan(_282))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_282, float2(0.0), isnan(_282))).y;
    float _95 = _77 + _45;
    float _97 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].x, _79);
    float _99 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].y, _79);
    float _101 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].z, _79);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].x, _81);
    float _105 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].y, _81);
    float _107 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].z, _81);
    float _109 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].x, _95);
    float2 _328 = float2(_59, _97);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328))).x;
    float2 _336 = float2(_61, _99);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).y;
    float2 _344 = float2(_63, _101);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).z;
    float _117 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].y, _95);
    float _119 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].z, _95);
    float2 _362 = float2(_103, _109);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).x;
    float2 _370 = float2(_105, _117);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370))).y;
    float2 _378 = float2(_107, _119);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).z;
    float _127 = _85 + _83;
    float _129 = _89 + _87;
    float _131 = _91 + _93;
    float _133 = _129 + _111;
    float _135 = _131 + _113;
    float _137 = _127 + _115;
    float _139 = _121 + _133;
    float _141 = _123 + _135;
    float _143 = _125 + _137;
    float _145 = _139 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _147 = _141 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _149 = _143 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _145;
    out.m_32.y = _147;
    out.m_32.z = _149;
    return out;
}

