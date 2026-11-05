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
    float _49 = _39 * 3.0;
    float _51 = _41 * 2.0;
    float _53 = _43 + _39;
    float _55 = _41 * 3.0;
    float _57 = _39 * 4.0;
    float _59 = _39 * 5.0;
    float _61 = _43 + _47;
    float _63 = _45 + _41;
    float _65 = _41 * 4.0;
    float _67 = _43 + _49;
    float _69 = _41 * 5.0;
    float _71 = _45 + _51;
    float _73 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _53);
    float _75 = _45 + _55;
    float _77 = _43 + _57;
    float _79 = _59 + _43;
    float _81 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _83 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _63);
    float _85 = _45 + _65;
    float _87 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _67);
    float _89 = _69 + _45;
    float _91 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _71);
    float _93 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].z, _75);
    float _95 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _77);
    float _97 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].z, _79);
    float _99 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].z, _85);
    float2 _367 = float2(_73, _83);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).z;
    float2 _379 = float2(_81, _91);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).z;
    float2 _387 = float2(_87, _93);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).z;
    float2 _395 = float2(_43, _45);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_395, float2(0.0), isnan(_395))).z;
    float2 _403 = float2(_95, _99);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).z;
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].z, _89);
    float2 _416 = float2(_97, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416))).z;
    float _115 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _117 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _119 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _53);
    float _121 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _53);
    float _123 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _63);
    float _125 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _63);
    float _127 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _71);
    float _129 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].y, _75);
    float _131 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _71);
    float _133 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _67);
    float _135 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].x, _75);
    float _137 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _67);
    float2 _484 = float2(_119, _123);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float2 _492 = float2(_43, _45);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float2 _500 = float2(_121, _125);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).y;
    float2 _508 = float2(_43, _45);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_508, float2(0.0), isnan(_508))).y;
    float2 _516 = float2(_115, _127);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _524 = float2(_117, _131);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).y;
    float _151 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _77);
    float _153 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _77);
    float _155 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].x, _85);
    float _157 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].y, _85);
    float2 _552 = float2(_133, _135);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_552, float2(0.0), isnan(_552))).x;
    float2 _560 = float2(_137, _129);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_560, float2(0.0), isnan(_560))).y;
    float2 _568 = float2(_151, _155);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).x;
    float2 _576 = float2(_153, _157);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).y;
    float _167 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].x, _79);
    float _169 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].y, _79);
    float _171 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].x, _89);
    float _173 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].y, _89);
    float _175 = _41 * _41;
    float _177 = fma(_39, _39, _175);
    float _179 = rsqrt(_177);
    float2 _613 = float2(_167, _171);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float2 _621 = float2(_169, _173);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_621, float2(0.0), isnan(_621))).y;
    float _185 = _179 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _187 = _39 * _185;
    float _189 = _41 * _185;
    float _191 = _187 + _43;
    float _193 = _189 + _45;
    float _195 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].x, _191);
    float _197 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].y, _191);
    float _199 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].z, _191);
    float _201 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[2].x, _193);
    float _203 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[2].y, _193);
    float _205 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[2].z, _193);
    float2 _676 = float2(_195, _201);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float2 _684 = float2(_197, _203);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).y;
    float2 _692 = float2(_199, _205);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).z;
    float _213 = _107 + _101;
    float _215 = _213 + _103;
    float _217 = _215 + _105;
    float _219 = _217 + _109;
    float _221 = _113 + _219;
    float _223 = _141 + _139;
    float _225 = _145 + _143;
    float _227 = _223 + _147;
    float _229 = _225 + _149;
    float _231 = _227 + _159;
    float _233 = _229 + _161;
    float _235 = _231 + _163;
    float _237 = _233 + _165;
    float _239 = _181 + _235;
    float _241 = _183 + _237;
    float _243 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[1].x, _239);
    float _245 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[1].y, _241);
    float _247 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[1].z, _221);
    float _249 = _243 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _251 = _245 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _253 = _247 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _249;
    out.m_32.y = _251;
    out.m_32.z = _253;
    return out;
}

