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
    float _43 = in.m_29.y;
    float _45 = in.m_29.x;
    float _47 = _39 * 2.0;
    float _49 = _41 * 2.0;
    float _51 = _41 * 3.0;
    float _53 = _41 * 4.0;
    float _55 = _43 + _47;
    float _57 = _45 + _49;
    float _59 = _45 + _51;
    float _61 = _39 * 3.0;
    float _63 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _55);
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _55);
    float _67 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _57);
    float _69 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _57);
    float _71 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _55);
    float _73 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _57);
    float _75 = _39 * 4.0;
    float _77 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _79 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _81 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _83 = _45 + _53;
    float _85 = _43 + _75;
    float _87 = _43 + _61;
    float _89 = _41 * 5.0;
    float _91 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _83);
    float _93 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _83);
    float _95 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _83);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].x, _85);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].y, _85);
    float _101 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].z, _85);
    float _103 = _45 + _41;
    float _105 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[2].x, _87);
    float _107 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[2].y, _87);
    float _109 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[2].z, _87);
    float _111 = _43 + _39;
    float _113 = _39 * 5.0;
    float _115 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _117 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _103);
    float _119 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _103);
    float _121 = _45 + _89;
    float _123 = _43 + _113;
    float _125 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _111);
    float _127 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _111);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].z, _121);
    float _131 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    float2 _511 = float2(_119, _125);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).z;
    float2 _523 = float2(_73, _71);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).z;
    float2 _531 = float2(_81, _109);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).z;
    float2 _539 = float2(_95, _101);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).z;
    float2 _547 = float2(_129, _131);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).z;
    float2 _555 = float2(_115, _127);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float _145 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _111);
    float2 _568 = float2(_117, _145);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).y;
    float2 _576 = float2(_67, _63);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).x;
    float2 _584 = float2(_69, _65);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_584, float2(0.0), isnan(_584))).y;
    float2 _592 = float2(_77, _105);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_592, float2(0.0), isnan(_592))).x;
    float2 _600 = float2(_79, _107);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).y;
    float2 _608 = float2(_91, _97);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_608, float2(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_608, float2(0.0), isnan(_608))).x;
    float2 _616 = float2(_93, _99);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).y;
    float _161 = _41 * 6.0;
    float _163 = _41 * 7.0;
    float _165 = _39 * 6.0;
    float _167 = _39 * 7.0;
    float _169 = _45 + _161;
    float _171 = _163 + _45;
    float _173 = _43 + _165;
    float _175 = _167 + _43;
    float _177 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[2].z, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[2].z, _171);
    float _181 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].z, _173);
    float _183 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].z, _175);
    float _185 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _187 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float2 _676 = float2(_177, _181);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).z;
    float2 _684 = float2(_179, _183);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).z;
    float2 _692 = float2(_185, _187);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    float2 _700 = float2(_45, _43);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700))).z;
    float _197 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].y, _121);
    float _199 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].y, _123);
    float _201 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[2].x, _169);
    float _203 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[2].y, _169);
    float _205 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].x, _173);
    float _207 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].y, _173);
    float2 _738 = float2(_45, _43);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float2 _746 = float2(_197, _199);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746))).y;
    float2 _754 = float2(_45, _43);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).y;
    float2 _762 = float2(_201, _205);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float2 _770 = float2(_203, _207);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_770, float2(0.0), isnan(_770))).y;
    float _219 = _39 * _39;
    float _221 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[2].x, _171);
    float _223 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[2].y, _171);
    float _225 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].x, _175);
    float _227 = fma(_41, _41, _219);
    float _229 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].y, _175);
    float _231 = rsqrt(_227);
    float _233 = _231 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _235 = _41 * _233;
    float _237 = _39 * _233;
    float _239 = _235 + _45;
    float _241 = _237 + _43;
    float _243 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[2].x, _239);
    float _245 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[2].y, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[2].z, _239);
    float _249 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[2].x, _241);
    float2 _844 = float2(_221, _225);
    float _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_844, float2(0.0), isnan(_844))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_844, float2(0.0), isnan(_844))).x;
    float2 _852 = float2(_223, _229);
    float _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_852, float2(0.0), isnan(_852))).y;
    float _255 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[2].y, _241);
    float _257 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[2].z, _241);
    float2 _870 = float2(_243, _249);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_870, float2(0.0), isnan(_870))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_870, float2(0.0), isnan(_870))).x;
    float2 _878 = float2(_245, _255);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_878, float2(0.0), isnan(_878))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_878, float2(0.0), isnan(_878))).y;
    float2 _886 = float2(_247, _257);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_886, float2(0.0), isnan(_886))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_886, float2(0.0), isnan(_886))).z;
    float _265 = _195 + _133;
    float _267 = _265 + _135;
    float _269 = _209 + _143;
    float _271 = _267 + _137;
    float _273 = _213 + _147;
    float _275 = _269 + _149;
    float _277 = _271 + _139;
    float _279 = _273 + _151;
    float _281 = _275 + _153;
    float _283 = _277 + _141;
    float _285 = _279 + _155;
    float _287 = _281 + _157;
    float _289 = _283 + _189;
    float _291 = _285 + _159;
    float _293 = _287 + _193;
    float _295 = _191 + _289;
    float _297 = _291 + _211;
    float _299 = _293 + _215;
    float _301 = _297 + _217;
    float _303 = _251 + _299;
    float _305 = _253 + _301;
    float _307 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[1].x, _303);
    float _309 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[1].y, _305);
    float _311 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[1].z, _295);
    float _313 = _307 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _315 = _309 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _317 = _311 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _313;
    out.m_32.y = _315;
    out.m_32.z = _317;
    return out;
}

