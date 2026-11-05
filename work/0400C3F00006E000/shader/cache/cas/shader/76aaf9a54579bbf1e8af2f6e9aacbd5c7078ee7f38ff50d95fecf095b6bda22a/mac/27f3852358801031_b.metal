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
    float _41 = in.m_27.y;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * 2.0;
    float _49 = _41 * 2.0;
    float _51 = _39 * 3.0;
    float _53 = _43 + _39;
    float _55 = _43 + _47;
    float _57 = _45 + _49;
    float _59 = _43 + _51;
    float _61 = _45 + _41;
    float _63 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _55);
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _55);
    float _67 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _55);
    float _69 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _57);
    float _71 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _57);
    float _73 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _57);
    float _75 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _77 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _79 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _53);
    float _81 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _53);
    float _83 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _53);
    float _85 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _87 = _39 * 4.0;
    float _89 = _41 * 3.0;
    float _91 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _93 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _95 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _97 = _41 * 4.0;
    float _99 = _87 + _43;
    float _101 = _45 + _89;
    float _103 = _97 + _45;
    float _105 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _99);
    float _107 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].y, _99);
    float _109 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _101);
    float _111 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].y, _101);
    float _113 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].z, _101);
    float _115 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].z, _99);
    float _117 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _119 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].y, _103);
    float _121 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].z, _103);
    float2 _359 = float2(_83, _95);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).z;
    float2 _371 = float2(_43, _45);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).z;
    float2 _379 = float2(_67, _73);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).z;
    float2 _387 = float2(_85, _113);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).z;
    float2 _395 = float2(_79, _91);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_395, float2(0.0), isnan(_395))).x;
    float2 _403 = float2(_43, _45);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).x;
    float2 _411 = float2(_43, _45);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).y;
    float2 _419 = float2(_81, _93);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).y;
    float2 _427 = float2(_63, _69);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float2 _435 = float2(_65, _71);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).y;
    float2 _443 = float2(_75, _109);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).x;
    float2 _451 = float2(_77, _111);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).y;
    float2 _459 = float2(_105, _117);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).x;
    float2 _467 = float2(_107, _119);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_467, float2(0.0), isnan(_467))).y;
    float2 _475 = float2(_115, _121);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).z;
    float _153 = _125 + _123;
    float _155 = _133 + _131;
    float _157 = _153 + _127;
    float _159 = _135 + _137;
    float _161 = _155 + _139;
    float _163 = _157 + _129;
    float _165 = _159 + _141;
    float _167 = _161 + _143;
    float _169 = _165 + _145;
    float _171 = _151 + _163;
    float _173 = _147 + _167;
    float _175 = _149 + _169;
    float _177 = _171 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _179 = _173 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _181 = _175 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    out.m_32.x = _179;
    out.m_32.y = _181;
    out.m_32.z = _177;
    return out;
}

