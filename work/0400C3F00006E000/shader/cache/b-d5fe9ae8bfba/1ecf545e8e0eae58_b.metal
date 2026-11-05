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
    float _107 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _109 = _55 + _107;
    float _111 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _113 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _115 = _55 + _113;
    float _117 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _121 = _55 + _119;
    float _123 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _127 = _55 + _125;
    float _129 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _133 = _55 + _131;
    float _135 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _139 = _55 + _137;
    float _141 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _145 = _55 + _143;
    float _147 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _151 = _55 + _149;
    float _153 = _55 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float2 _495 = float2(_57, _55);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float2 _507 = float2(_57, _61);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507))).x;
    float2 _515 = float2(_57, _63);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).x;
    float2 _523 = float2(_57, _67);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _531 = float2(_57, _69);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _539 = float2(_57, _73);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _547 = float2(_57, _75);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).x;
    float2 _555 = float2(_57, _79);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float2 _563 = float2(_57, _81);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float2 _571 = float2(_57, _85);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).x;
    float2 _579 = float2(_57, _87);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float2 _587 = float2(_57, _91);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_587, float2(0.0), isnan(_587))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_587, float2(0.0), isnan(_587))).x;
    float2 _595 = float2(_57, _93);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_595, float2(0.0), isnan(_595))).x;
    float2 _603 = float2(_57, _97);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_603, float2(0.0), isnan(_603))).x;
    float2 _611 = float2(_57, _99);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).x;
    float2 _619 = float2(_57, _103);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_619, float2(0.0), isnan(_619))).x;
    float2 _627 = float2(_57, _105);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_627, float2(0.0), isnan(_627))).x;
    float2 _635 = float2(_57, _109);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float2 _643 = float2(_57, _111);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_643, float2(0.0), isnan(_643))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_643, float2(0.0), isnan(_643))).x;
    float2 _651 = float2(_57, _115);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_651, float2(0.0), isnan(_651))).x;
    float2 _659 = float2(_57, _117);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_659, float2(0.0), isnan(_659))).x;
    float2 _667 = float2(_57, _121);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_667, float2(0.0), isnan(_667))).x;
    float2 _675 = float2(_57, _123);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_675, float2(0.0), isnan(_675))).x;
    float2 _683 = float2(_57, _127);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_683, float2(0.0), isnan(_683))).x;
    float2 _691 = float2(_57, _129);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_691, float2(0.0), isnan(_691))).x;
    float2 _699 = float2(_57, _133);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_699, float2(0.0), isnan(_699))).x;
    float2 _707 = float2(_57, _135);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_707, float2(0.0), isnan(_707))).x;
    float2 _715 = float2(_57, _139);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_715, float2(0.0), isnan(_715))).x;
    float2 _723 = float2(_57, _141);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).x;
    float2 _731 = float2(_57, _145);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731))).x;
    float2 _739 = float2(_57, _147);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_739, float2(0.0), isnan(_739))).x;
    float2 _747 = float2(_57, _151);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_747, float2(0.0), isnan(_747))).x;
    float2 _755 = float2(_57, _153);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_755, float2(0.0), isnan(_755))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_755, float2(0.0), isnan(_755))).x;
    float _221 = _155 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _223 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[18].x, _221);
    float _225 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[18].x, _223);
    float _227 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[18].y, _225);
    float _229 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[18].y, _227);
    float _231 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[18].z, _229);
    float _233 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[18].z, _231);
    float _235 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[18].w, _233);
    float _237 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[18].w, _235);
    float _239 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[19].x, _237);
    float _241 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[19].x, _239);
    float _243 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[19].y, _241);
    float _245 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[19].y, _243);
    float _247 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[19].z, _245);
    float _249 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[19].z, _247);
    float _251 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[19].w, _249);
    float _253 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[19].w, _251);
    float _255 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[20].x, _253);
    float _257 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[20].x, _255);
    float _259 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[20].y, _257);
    float _261 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[20].y, _259);
    float _263 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[20].z, _261);
    float _265 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[20].z, _263);
    float _267 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[20].w, _265);
    float _269 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[20].w, _267);
    float _271 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _273 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[21].x, _269);
    float _275 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[21].x, _273);
    float _277 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[21].y, _275);
    float _279 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[21].y, _277);
    float _281 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[21].z, _279);
    float _283 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[21].z, _281);
    float _285 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[21].w, _283);
    float _287 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[21].w, _285);
    float _289 = _287 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = _289 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = _293 * _271;
    out.m_32.x = _295;
    return out;
}

