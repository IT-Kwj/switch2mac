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
    float _79 = _43 + _59;
    float _81 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _83 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _63);
    float _85 = _45 + _65;
    float _87 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _67);
    float _89 = _45 + _69;
    float _91 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _71);
    float _93 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].z, _75);
    float _95 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _77);
    float _97 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].z, _79);
    float _99 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].z, _85);
    float2 _399 = float2(_73, _83);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).z;
    float2 _411 = float2(_81, _91);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).z;
    float2 _419 = float2(_87, _93);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).z;
    float2 _427 = float2(_43, _45);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).z;
    float2 _435 = float2(_95, _99);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).z;
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].z, _89);
    float2 _448 = float2(_97, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).z;
    float _115 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _71);
    float _117 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _71);
    float _119 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _53);
    float _121 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _63);
    float _123 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _53);
    float _125 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _127 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _63);
    float _129 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float2 _496 = float2(_119, _121);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_496, float2(0.0), isnan(_496))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_496, float2(0.0), isnan(_496))).x;
    float2 _504 = float2(_43, _45);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float2 _512 = float2(_123, _127);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).y;
    float2 _520 = float2(_43, _45);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_520, float2(0.0), isnan(_520))).y;
    float2 _528 = float2(_125, _115);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_528, float2(0.0), isnan(_528))).x;
    float2 _536 = float2(_129, _117);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_536, float2(0.0), isnan(_536))).y;
    float _143 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _67);
    float _145 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].x, _75);
    float _147 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _67);
    float _149 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[2].y, _75);
    float _151 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _77);
    float _153 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].x, _85);
    float _155 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].y, _85);
    float _157 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].x, _79);
    float _159 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _77);
    float _161 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[2].y, _79);
    float _163 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].x, _89);
    float2 _599 = float2(_143, _145);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).x;
    float2 _607 = float2(_147, _149);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).y;
    float2 _615 = float2(_151, _153);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float2 _623 = float2(_159, _155);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).y;
    float _173 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].y, _89);
    float2 _636 = float2(_157, _163);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float2 _644 = float2(_161, _173);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644))).y;
    float _179 = _39 * 6.0;
    float _181 = _41 * 6.0;
    float _183 = _41 * _41;
    float _185 = _179 + _43;
    float _187 = _181 + _45;
    float _189 = fma(_39, _39, _183);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].x, _185);
    float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].y, _185);
    float _195 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].z, _185);
    float _197 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].x, _187);
    float _199 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].y, _187);
    float _201 = rsqrt(_189);
    float _203 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].z, _187);
    float _205 = _201 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _207 = _39 * _205;
    float _209 = _41 * _205;
    float _211 = _207 + _43;
    float _213 = _209 + _45;
    float _215 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[2].x, _211);
    float _217 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[2].y, _211);
    float _219 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[2].z, _211);
    float _221 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[2].y, _213);
    float _223 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[2].x, _213);
    float2 _744 = float2(_191, _197);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
    float2 _752 = float2(_193, _199);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).y;
    float2 _760 = float2(_195, _203);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).z;
    float _231 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[2].z, _213);
    float2 _773 = float2(_215, _223);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_773, float2(0.0), isnan(_773))).x;
    float2 _781 = float2(_217, _221);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_781, float2(0.0), isnan(_781))).y;
    float2 _789 = float2(_219, _231);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_789, float2(0.0), isnan(_789))).z;
    float _239 = _107 + _101;
    float _241 = _239 + _103;
    float _243 = _241 + _105;
    float _245 = _243 + _109;
    float _247 = _133 + _131;
    float _249 = _245 + _113;
    float _251 = _137 + _135;
    float _253 = _247 + _139;
    float _255 = _251 + _141;
    float _257 = _253 + _165;
    float _259 = _255 + _167;
    float _261 = _257 + _169;
    float _263 = _259 + _171;
    float _265 = _261 + _175;
    float _267 = _263 + _177;
    float _269 = _225 + _265;
    float _271 = _227 + _267;
    float _273 = _229 + _249;
    float _275 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[1].x, _269);
    float _277 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[1].y, _271);
    float _279 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[1].z, _273);
    float _281 = _275 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _283 = _277 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _285 = _279 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _281;
    out.m_32.y = _283;
    out.m_32.z = _285;
    return out;
}

