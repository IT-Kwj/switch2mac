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
    float _43 = fma(4.0, _41, _37);
    float _45 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _47 = fma(4.0, _45, _39);
    float _49 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, -2.0, _39);
    float _51 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, 2.0, _39);
    float _53 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, 4.0, _39);
    float2 _468 = float2(_47, _43);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _486 = float2(_49, _43);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _500 = float2(_39, _43);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float2 _514 = float2(_51, _43);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _528 = float2(_53, _43);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_528, float2(0.0), isnan(_528))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, -2.0, _37);
    float2 _546 = float2(_47, _97);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float2 _560 = float2(_49, _97);
    float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_560, float2(0.0), isnan(_560))).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _59 + _67;
    float _117 = _61 + _69;
    float _119 = _63 + _71;
    float _121 = _117 + _77;
    float _123 = _119 + _79;
    float _125 = _115 + _75;
    float _127 = _121 + _85;
    float _129 = _123 + _87;
    float _131 = _125 + _83;
    float _133 = _127 + _93;
    float _135 = _129 + _95;
    float _137 = _131 + _91;
    float _139 = _133 + _103;
    float _141 = _135 + _105;
    float _143 = _137 + _101;
    float _145 = _139 + _111;
    float2 _622 = float2(_39, _97);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_622, float2(0.0), isnan(_622))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_622, float2(0.0), isnan(_622))).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float2 _636 = float2(_51, _97);
    float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636))).xyz;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float2 _650 = float2(_53, _97);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float2 _664 = float2(_47, _37);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_664, float2(0.0), isnan(_664))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _678 = float2(_49, _37);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678))).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float2 _692 = float2(_39, _37);
    float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float2 _706 = float2(_51, _37);
    float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).xyz;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _143 + _109;
    float2 _723 = float2(_53, _37);
    float3 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _141 + _113;
    float _215 = _145 + _151;
    float _217 = _213 + _153;
    float _219 = _203 + _149;
    float _221 = _215 + _159;
    float _223 = _217 + _161;
    float _225 = _219 + _157;
    float _227 = _221 + _167;
    float _229 = _223 + _169;
    float _231 = _225 + _165;
    float _233 = _227 + _175;
    float _235 = _229 + _177;
    float _237 = _231 + _173;
    float _239 = _233 + _183;
    float _241 = _235 + _185;
    float _243 = _237 + _181;
    float _245 = _239 + _191;
    float _247 = _241 + _193;
    float _249 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 4.0, _37);
    float _251 = _243 + _189;
    float _253 = _245 + _199;
    float _255 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 2.0, _37);
    float _257 = _247 + _201;
    float _259 = _251 + _197;
    float2 _811 = float2(_47, _255);
    float3 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_811, float2(0.0), isnan(_811))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_811, float2(0.0), isnan(_811))).xyz;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float2 _825 = float2(_49, _255);
    float3 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_825, float2(0.0), isnan(_825))).xyz;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float2 _839 = float2(_39, _255);
    float3 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839))).xyz;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = _277.z;
    float2 _853 = float2(_51, _255);
    float3 _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_853, float2(0.0), isnan(_853))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_853, float2(0.0), isnan(_853))).xyz;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    float _293 = _253 + _209;
    float2 _870 = float2(_53, _255);
    float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_870, float2(0.0), isnan(_870))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_870, float2(0.0), isnan(_870))).xyz;
    float _297 = _295.x;
    float _299 = _295.y;
    float _301 = _295.z;
    float2 _884 = float2(_47, _249);
    float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_884, float2(0.0), isnan(_884))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_884, float2(0.0), isnan(_884))).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float2 _898 = float2(_49, _249);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_898, float2(0.0), isnan(_898))).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float2 _912 = float2(_39, _249);
    float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float2(0.0), isnan(_912))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_912, float2(0.0), isnan(_912))).xyz;
    float _321 = _319.x;
    float _323 = _319.y;
    float _325 = _319.z;
    float2 _926 = float2(_51, _249);
    float3 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_926, float2(0.0), isnan(_926))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_926, float2(0.0), isnan(_926))).xyz;
    float _329 = _327.x;
    float _331 = _327.y;
    float _333 = _327.z;
    float2 _940 = float2(_53, _249);
    float3 _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_940, float2(0.0), isnan(_940))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_940, float2(0.0), isnan(_940))).xyz;
    float _337 = _335.x;
    float _339 = _335.y;
    float _341 = _335.z;
    float _343 = _259 + _207;
    float _345 = _257 + _211;
    float _347 = _293 + _265;
    float _349 = _343 + _263;
    float _351 = _345 + _267;
    float _353 = _347 + _273;
    float _355 = _349 + _271;
    float _357 = _351 + _275;
    float _359 = _353 + _281;
    float _361 = _355 + _279;
    float _363 = _357 + _283;
    float _365 = _359 + _289;
    float _367 = _361 + _287;
    float _369 = _363 + _291;
    float _371 = _365 + _299;
    float _373 = _367 + _297;
    float _375 = _369 + _301;
    float _377 = _371 + _307;
    float _379 = _373 + _305;
    float _381 = _375 + _309;
    float _383 = _377 + _315;
    float _385 = _379 + _313;
    float _387 = _381 + _317;
    float _389 = _383 + _323;
    float _391 = _385 + _321;
    float _393 = _387 + _325;
    float _395 = _389 + _331;
    float _397 = _391 + _329;
    float _399 = _393 + _333;
    float _401 = _395 + _339;
    float _403 = _397 + _337;
    float _405 = _399 + _341;
    float _407 = fma(_401, 0.07999999821186065673828125, -1.0);
    float _409 = fma(_403, 0.07999999821186065673828125, -1.0);
    float _411 = fma(_405, 0.07999999821186065673828125, -1.0);
    float _413 = _407 * _407;
    float _415 = fma(_409, _409, _413);
    float _417 = fma(_411, _411, _415);
    float _419 = rsqrt(_417);
    float _421 = _419 * 0.5;
    float _423 = fma(_409, _421, 0.5);
    float _425 = fma(_407, _421, 0.5);
    float _427 = fma(_411, _421, 0.5);
    out.m_30.x = _423;
    out.m_30.y = _425;
    out.m_30.z = _427;
    return out;
}

