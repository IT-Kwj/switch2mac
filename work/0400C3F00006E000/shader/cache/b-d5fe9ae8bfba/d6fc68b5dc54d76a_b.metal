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
    float2 _452 = float2(_47, _43);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _470 = float2(_49, _43);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_470, float2(0.0), isnan(_470))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _484 = float2(_39, _43);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float2 _498 = float2(_51, _43);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _512 = float2(_53, _43);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, -2.0, _37);
    float2 _530 = float2(_47, _97);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float2 _544 = float2(_49, _97);
    float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).xyz;
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
    float2 _606 = float2(_39, _97);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_606, float2(0.0), isnan(_606))).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float2 _620 = float2(_51, _97);
    float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyz;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float2 _634 = float2(_53, _97);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float2 _648 = float2(_47, _37);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_648, float2(0.0), isnan(_648))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _662 = float2(_49, _37);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662))).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float2 _676 = float2(_39, _37);
    float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float2 _690 = float2(_51, _37);
    float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).xyz;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _143 + _109;
    float2 _707 = float2(_53, _37);
    float3 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_707, float2(0.0), isnan(_707))).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _141 + _113;
    float _215 = _203 + _149;
    float _217 = _213 + _153;
    float _219 = _145 + _151;
    float _221 = _215 + _157;
    float _223 = _217 + _161;
    float _225 = _219 + _159;
    float _227 = _221 + _165;
    float _229 = _223 + _169;
    float _231 = _225 + _167;
    float _233 = _227 + _173;
    float _235 = _229 + _177;
    float _237 = _231 + _175;
    float _239 = _233 + _181;
    float _241 = _235 + _185;
    float _243 = _237 + _183;
    float _245 = _239 + _189;
    float _247 = _241 + _193;
    float _249 = _243 + _191;
    float _251 = _245 + _197;
    float _253 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 2.0, _37);
    float _255 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 4.0, _37);
    float _257 = _247 + _201;
    float _259 = _249 + _199;
    float2 _795 = float2(_47, _253);
    float3 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_795, float2(0.0), isnan(_795))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_795, float2(0.0), isnan(_795))).xyz;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = _251 + _207;
    float2 _812 = float2(_49, _253);
    float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_812, float2(0.0), isnan(_812))).xyz;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float2 _826 = float2(_39, _253);
    float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_826, float2(0.0), isnan(_826))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_826, float2(0.0), isnan(_826))).xyz;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float2 _840 = float2(_51, _253);
    float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_840, float2(0.0), isnan(_840))).xyz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _287.z;
    float2 _854 = float2(_53, _253);
    float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_854, float2(0.0), isnan(_854))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_854, float2(0.0), isnan(_854))).xyz;
    float _297 = _295.x;
    float _299 = _295.y;
    float _301 = _295.z;
    float2 _868 = float2(_47, _255);
    float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_868, float2(0.0), isnan(_868))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_868, float2(0.0), isnan(_868))).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float2 _882 = float2(_49, _255);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_882, float2(0.0), isnan(_882))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_882, float2(0.0), isnan(_882))).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float2 _896 = float2(_39, _255);
    float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_896, float2(0.0), isnan(_896))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_896, float2(0.0), isnan(_896))).xyz;
    float _321 = _319.x;
    float _323 = _319.y;
    float _325 = _319.z;
    float2 _910 = float2(_51, _255);
    float3 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_910, float2(0.0), isnan(_910))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_910, float2(0.0), isnan(_910))).xyz;
    float _329 = _327.x;
    float _331 = _327.y;
    float _333 = _327.z;
    float2 _924 = float2(_53, _255);
    float3 _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float2(0.0), isnan(_924))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_924, float2(0.0), isnan(_924))).xyz;
    float _337 = _335.x;
    float _339 = _335.y;
    float _341 = _335.z;
    float _343 = _259 + _209;
    float _345 = _257 + _211;
    float _347 = _269 + _263;
    float _349 = _343 + _265;
    float _351 = _345 + _267;
    float _353 = _347 + _273;
    float _355 = _349 + _275;
    float _357 = _351 + _277;
    float _359 = _353 + _281;
    float _361 = _355 + _283;
    float _363 = _357 + _285;
    float _365 = _359 + _289;
    float _367 = _361 + _291;
    float _369 = _363 + _293;
    float _371 = _365 + _297;
    float _373 = _367 + _299;
    float _375 = _369 + _301;
    float _377 = _371 + _305;
    float _379 = _373 + _307;
    float _381 = _375 + _309;
    float _383 = _377 + _313;
    float _385 = _379 + _315;
    float _387 = _381 + _317;
    float _389 = _383 + _321;
    float _391 = _385 + _323;
    float _393 = _387 + _325;
    float _395 = _389 + _329;
    float _397 = _391 + _331;
    float _399 = _393 + _333;
    float _401 = _395 + _337;
    float _403 = _397 + _339;
    float _405 = _399 + _341;
    float _407 = _401 * 0.039999999105930328369140625;
    float _409 = _403 * 0.039999999105930328369140625;
    float _411 = _405 * 0.039999999105930328369140625;
    out.m_30.x = _407;
    out.m_30.y = _409;
    out.m_30.z = _411;
    return out;
}

