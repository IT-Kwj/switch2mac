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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_29.y;
    float _43 = in.m_29.x;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _47 = _43 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _49 = _43 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _51 = _41 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _53 = _45 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _55 = _49 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float2 _336 = float2(_47, _51);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).x;
    float2 _348 = float2(_55, _51);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348))).x;
    float2 _356 = float2(_47, _53);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_356, float2(0.0), isnan(_356))).x;
    float2 _364 = float2(_55, _53);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float _65 = in.m_31.y;
    float _67 = in.m_31.x;
    float _69 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _71 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _73 = -_65;
    float _75 = _69 * _73;
    float _77 = -_67;
    float _79 = _69 * _77;
    float _81 = -_71;
    float _83 = _65 * _81;
    float _85 = _75 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = _75 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _89 = -_71;
    float _91 = _67 * _89;
    float _93 = _83 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _95 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _97 = _83 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _99 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[4].x, _87);
    float _101 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[6].x, _93);
    float _103 = -_69;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[6].z, _95);
    float _107 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[4].x, _97);
    float _109 = -_69;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[4].z, _99);
    float _113 = -_71;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[6].z, _101);
    float _117 = _105 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _119 = -_71;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[4].z, _107);
    float _123 = _111 + (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _125 = _115 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _127 = _117 * _117;
    float _129 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _131 = _121 + (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _133 = _125 * _125;
    float _135 = fma(_123, _123, _127);
    float _137 = -_129;
    float _139 = _65 * _137;
    float _141 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _143 = fma(_131, _131, _133);
    float _145 = -_129;
    float _147 = _67 * _145;
    float _149 = _139 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _151 = -_141;
    float _153 = _65 * _151;
    float _155 = _139 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _157 = -_141;
    float _159 = _67 * _157;
    float _161 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[6].x, _149);
    float _163 = _153 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[4].x, _155);
    float _167 = _153 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _169 = -_129;
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[6].z, _161);
    float _173 = fma(_159, (*spvDescriptorSet0.fp_c4)._m0[4].x, _163);
    float _175 = -_129;
    float _177 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[4].z, _165);
    float _179 = fma(_159, (*spvDescriptorSet0.fp_c4)._m0[6].x, _167);
    float _181 = _171 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _183 = -_141;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[4].z, _173);
    float _187 = _177 + (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _189 = -_141;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[6].z, _179);
    float _193 = _181 * _181;
    float _195 = _185 + (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _197 = sqrt(_135);
    float _199 = _191 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _201 = fma(_187, _187, _193);
    float _203 = _199 * _199;
    float _205 = sqrt(_143);
    float _207 = fma(_195, _195, _203);
    float _209 = sqrt(_201);
    float _211 = _197 * 2.0;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = sqrt(_207);
    float _217 = _205 * 2.0;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _209 * 2.0;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = abs(_213);
    float _227 = log2(_225);
    float _229 = _215 * 2.0;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = abs(_219);
    float _235 = log2(_233);
    float _237 = abs(_223);
    float _239 = log2(_237);
    float _241 = _227 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _243 = abs(_231);
    float _245 = log2(_243);
    float _247 = _235 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _249 = _239 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _251 = exp2(_241);
    float _253 = _245 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _255 = exp2(_247);
    float _257 = exp2(_249);
    float _259 = -_251;
    float _261 = _259 + 1.0;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = exp2(_253);
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _263 + _271;
    float _275 = -_257;
    float _277 = _275 + 1.0;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _273 + _279;
    float _283 = -_265;
    float _285 = _283 + 1.0;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _281 + _287;
    float _291 = _289 * 0.25;
    float _293 = _291 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _295 = _291 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _297 = _291 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    out.m_34.x = _293;
    out.m_34.y = _295;
    out.m_34.z = _297;
    out.m_34.w = (*spvDescriptorSet0.fp_c4)._m0[8].w;
    return out;
}

