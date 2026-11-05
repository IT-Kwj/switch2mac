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
    float _107 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _109 = _55 + _107;
    float _111 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _113 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _115 = _55 + _113;
    float _117 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _121 = _55 + _119;
    float _123 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _127 = _55 + _125;
    float _129 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _133 = _55 + _131;
    float _135 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _139 = _55 + _137;
    float _141 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _145 = _55 + _143;
    float _147 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _151 = _55 + _149;
    float _153 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float2 _483 = float2(_55, _57);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float2 _495 = float2(_61, _57);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float2 _503 = float2(_63, _57);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).x;
    float2 _511 = float2(_67, _57);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).x;
    float2 _519 = float2(_69, _57);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float2 _527 = float2(_73, _57);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).x;
    float2 _535 = float2(_75, _57);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).x;
    float2 _543 = float2(_79, _57);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).x;
    float2 _551 = float2(_81, _57);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).x;
    float2 _559 = float2(_85, _57);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).x;
    float2 _567 = float2(_87, _57);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_567, float2(0.0), isnan(_567))).x;
    float2 _575 = float2(_91, _57);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_575, float2(0.0), isnan(_575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_575, float2(0.0), isnan(_575))).x;
    float2 _583 = float2(_93, _57);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_583, float2(0.0), isnan(_583))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_583, float2(0.0), isnan(_583))).x;
    float2 _591 = float2(_97, _57);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_591, float2(0.0), isnan(_591))).x;
    float2 _599 = float2(_99, _57);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).x;
    float2 _607 = float2(_103, _57);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float2 _615 = float2(_105, _57);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float2 _623 = float2(_109, _57);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).x;
    float2 _631 = float2(_111, _57);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_631, float2(0.0), isnan(_631))).x;
    float2 _639 = float2(_115, _57);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).x;
    float2 _647 = float2(_117, _57);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647))).x;
    float2 _655 = float2(_121, _57);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).x;
    float2 _663 = float2(_123, _57);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).x;
    float2 _671 = float2(_127, _57);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).x;
    float2 _679 = float2(_129, _57);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_679, float2(0.0), isnan(_679))).x;
    float2 _687 = float2(_133, _57);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).x;
    float2 _695 = float2(_135, _57);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float2 _703 = float2(_139, _57);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_141, _57);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float2 _719 = float2(_145, _57);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float2 _727 = float2(_147, _57);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_727, float2(0.0), isnan(_727))).x;
    float2 _735 = float2(_151, _57);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_735, float2(0.0), isnan(_735))).x;
    float2 _743 = float2(_153, _57);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_743, float2(0.0), isnan(_743))).x;
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
    float _271 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[21].x, _269);
    float _273 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[21].x, _271);
    float _275 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[21].y, _273);
    float _277 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[21].y, _275);
    float _279 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[21].z, _277);
    float _281 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[21].z, _279);
    float _283 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[21].w, _281);
    float _285 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[21].w, _283);
    out.m_32.x = _285;
    return out;
}

