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
    float _51 = _43 * _43;
    float _53 = _43 * 2.0;
    float _55 = _41 + _47;
    float _57 = _39 * 3.0;
    float _59 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _49);
    float _61 = _45 + _53;
    float _63 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _55);
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _55);
    float _67 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _55);
    float _69 = fma(_39, _39, _51);
    float _71 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _73 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _75 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _77 = _43 * 3.0;
    float _79 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _49);
    float _81 = rsqrt(_69);
    float _83 = _41 + _57;
    float _85 = _45 + _77;
    float _87 = _39 * 4.0;
    float _89 = _45 + _43;
    float _91 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _49);
    float _93 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].y, _85);
    float _97 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[2].z, _85);
    float _99 = _43 * 4.0;
    float _101 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _83);
    float _103 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _83);
    float _105 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].x, _89);
    float _107 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].y, _89);
    float _109 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _83);
    float _111 = _87 + _41;
    float _113 = _81 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _115 = _99 + _45;
    float _117 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].z, _89);
    float _119 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _111);
    float _121 = _39 * _113;
    float _123 = _43 * _113;
    float _125 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].y, _111);
    float _127 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].x, _115);
    float _129 = _121 + _41;
    float _131 = _123 + _45;
    float _133 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].y, _115);
    float2 _415 = float2(_91, _117);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_415, float2(0.0), isnan(_415))).z;
    float2 _427 = float2(_67, _75);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).z;
    float2 _435 = float2(_109, _97);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).z;
    float _141 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[2].x, _129);
    float _143 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[2].y, _129);
    float _145 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].z, _111);
    float _147 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _115);
    float _149 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _151 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[2].x, _131);
    float _153 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[2].y, _131);
    float _155 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float2 _483 = float2(_41, _45);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).z;
    float2 _491 = float2(_59, _105);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float2 _499 = float2(_41, _45);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).x;
    float2 _507 = float2(_41, _45);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507))).y;
    float2 _515 = float2(_79, _107);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).y;
    float2 _523 = float2(_63, _71);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _531 = float2(_65, _73);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).y;
    float2 _539 = float2(_101, _93);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _547 = float2(_103, _95);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).y;
    float2 _555 = float2(_119, _127);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float2 _563 = float2(_125, _133);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).y;
    float2 _571 = float2(_145, _147);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).z;
    float2 _579 = float2(_141, _151);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float2 _587 = float2(_143, _153);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_587, float2(0.0), isnan(_587))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_587, float2(0.0), isnan(_587))).y;
    float2 _595 = float2(_149, _155);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_595, float2(0.0), isnan(_595))).z;
    float _187 = _157 + _135;
    float _189 = _161 + _159;
    float _191 = _163 + _165;
    float _193 = _187 + _137;
    float _195 = _189 + _167;
    float _197 = _191 + _169;
    float _199 = _193 + _139;
    float _201 = _195 + _171;
    float _203 = _197 + _173;
    float _205 = _179 + _199;
    float _207 = _175 + _201;
    float _209 = _177 + _203;
    float _211 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].z, _205);
    float _213 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].x, _207);
    float _215 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].y, _209);
    float _217 = _211 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _219 = _213 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _221 = _215 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    out.m_32.x = _219;
    out.m_32.y = _221;
    out.m_32.z = _217;
    return out;
}

