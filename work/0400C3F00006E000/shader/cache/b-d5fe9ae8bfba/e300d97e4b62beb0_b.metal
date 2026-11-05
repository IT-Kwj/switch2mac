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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.y;
    float _39 = in.m_27.x;
    float _41 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _43 = _37 + _41;
    float _45 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _47 = _39 + _45;
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _51 = fma(2.0, _49, _43);
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = fma(2.0, _53, _47);
    float _57 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].x, _47);
    float _59 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, 4.0, _47);
    float2 _353 = float2(_55, _51);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _371 = float2(_47, _51);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _385 = float2(_57, _51);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _399 = float2(_59, _51);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _413 = float2(_55, _43);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _427 = float2(_47, _43);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _67 + _75;
    float _113 = _65 + _73;
    float _115 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].y, _43);
    float _117 = _69 + _77;
    float _119 = _111 + _83;
    float _121 = _113 + _81;
    float _123 = _117 + _85;
    float _125 = _119 + _91;
    float _127 = _121 + _89;
    float _129 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 4.0, _43);
    float _131 = _125 + _99;
    float _133 = _123 + _93;
    float _135 = _127 + _97;
    float _137 = _131 + _107;
    float _139 = _133 + _101;
    float2 _488 = float2(_57, _43);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_488, float2(0.0), isnan(_488))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float2 _502 = float2(_59, _43);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float2 _516 = float2(_55, _115);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float2 _530 = float2(_47, _115);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float2 _544 = float2(_57, _115);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float2 _558 = float2(_59, _115);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float2 _572 = float2(_55, _129);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float2 _586 = float2(_47, _129);
    float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).xyz;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = _197.z;
    float2 _600 = float2(_57, _129);
    float3 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float2 _614 = float2(_59, _129);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _135 + _105;
    float _223 = _139 + _109;
    float _225 = _137 + _145;
    float _227 = _221 + _143;
    float _229 = _223 + _147;
    float _231 = _225 + _153;
    float _233 = _227 + _151;
    float _235 = _229 + _155;
    float _237 = _231 + _161;
    float _239 = _233 + _159;
    float _241 = _235 + _163;
    float _243 = _237 + _169;
    float _245 = _239 + _167;
    float _247 = _241 + _171;
    float _249 = _243 + _177;
    float _251 = _245 + _175;
    float _253 = _247 + _179;
    float _255 = _249 + _185;
    float _257 = _251 + _183;
    float _259 = _253 + _187;
    float _261 = _255 + _193;
    float _263 = _257 + _191;
    float _265 = _259 + _195;
    float _267 = _261 + _201;
    float _269 = _263 + _199;
    float _271 = _265 + _203;
    float _273 = _267 + _209;
    float _275 = _269 + _207;
    float _277 = _271 + _211;
    float _279 = _273 + _217;
    float _281 = _275 + _215;
    float _283 = _277 + _219;
    float _285 = fma(_279, 0.125, -1.0);
    float _287 = fma(_281, 0.125, -1.0);
    float _289 = fma(_283, 0.125, -1.0);
    float _291 = _285 * _285;
    float _293 = fma(_287, _287, _291);
    float _295 = fma(_289, _289, _293);
    float _297 = rsqrt(_295);
    float _299 = _297 * 0.5;
    float _301 = fma(_287, _299, 0.5);
    float _303 = fma(_285, _299, 0.5);
    float _305 = fma(_289, _299, 0.5);
    out.m_30.x = _301;
    out.m_30.y = _303;
    out.m_30.z = _305;
    return out;
}

