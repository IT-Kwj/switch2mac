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
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5434 = false;
    bool _5416 = false;
    bool _5272 = false;
    bool _5254 = false;
    bool _5110 = false;
    bool _5092 = false;
    bool _4948 = false;
    bool _4930 = false;
    bool _4786 = false;
    bool _4768 = false;
    bool _4624 = false;
    bool _4606 = false;
    bool _4462 = false;
    bool _4444 = false;
    bool _4300 = false;
    bool _4282 = false;
    bool _4138 = false;
    bool _4120 = false;
    bool _3976 = false;
    bool _3958 = false;
    bool _3814 = false;
    bool _3796 = false;
    bool _3652 = false;
    bool _3634 = false;
    bool _3490 = false;
    bool _3472 = false;
    bool _3328 = false;
    bool _3310 = false;
    bool _3166 = false;
    bool _3148 = false;
    bool _3038 = false;
    bool _3004 = false;
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_29.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _43;
    float _101 = _99 * _49;
    float _103 = _99 * _55;
    float _105 = _99 * _61;
    float _107 = _99 * _67;
    float _109 = _99 * _73;
    float _111 = _99 * _79;
    float _113 = abs(_101);
    float _115 = abs(_103);
    float _117 = precise::max(_113, _115);
    float _119 = _101 + _105;
    float _121 = _103 + _107;
    float _123 = _109 + _111;
    float _125 = abs(_109);
    float _127 = precise::max(_125, _117);
    float _129 = fma(_105, 2.0, _101);
    float _131 = fma(_107, 2.0, _103);
    float _133 = abs(_119);
    float _135 = abs(_121);
    float _137 = precise::max(_133, _135);
    float _139 = fma(_111, 2.0, _109);
    float _141 = _99 * _91;
    float _143 = fma(_105, 3.0, _101);
    float _145 = abs(_123);
    float _147 = precise::max(_145, _137);
    float _149 = _99 * _85;
    float _151 = abs(_129);
    float _153 = abs(_131);
    float _155 = precise::max(_151, _153);
    float _157 = fma(_107, 3.0, _103);
    float _159 = 1.0 / _127;
    float _161 = _99 * _97;
    float _163 = abs(_139);
    float _165 = precise::max(_163, _155);
    float _167 = fma(_149, 2.0, _101);
    float _169 = fma(_141, 2.0, _103);
    float _171 = fma(_111, 3.0, _109);
    float _173 = abs(_143);
    float _175 = abs(_157);
    float _177 = precise::max(_173, _175);
    float _179 = _101 + _149;
    float _181 = 1.0 / _165;
    float _183 = _103 + _141;
    float _185 = fma(_161, 2.0, _109);
    float _187 = abs(_171);
    float _189 = precise::max(_187, _177);
    float _191 = _109 + _161;
    float _193 = _129 + _149;
    float _195 = abs(_179);
    float _197 = abs(_183);
    float _199 = precise::max(_195, _197);
    float _201 = _131 + _141;
    float _203 = 1.0 / _147;
    float _205 = abs(_167);
    float _207 = abs(_169);
    float _209 = precise::max(_205, _207);
    float _211 = _119 + _149;
    float _213 = _121 + _141;
    float _215 = abs(_191);
    float _217 = precise::max(_215, _199);
    float _219 = _139 + _161;
    float _221 = abs(_185);
    float _223 = precise::max(_221, _209);
    float _225 = fma(_149, 3.0, _101);
    float _227 = 1.0 / _189;
    float _229 = fma(_141, 3.0, _103);
    float _231 = fma(_161, 3.0, _109);
    float _233 = _101 * _159;
    float _235 = _103 * _159;
    float _237 = _109 * _159;
    float _239 = _123 + _161;
    float _241 = abs(_211);
    float _243 = abs(_213);
    float _245 = precise::max(_241, _243);
    float _247 = 1.0 / _223;
    float _249 = _143 + _149;
    float _251 = _157 + _141;
    float _253 = abs(_239);
    float _255 = precise::max(_253, _245);
    float _257 = _171 + _161;
    float _259 = fma(_149, 2.0, _119);
    float _261 = fma(_149, 3.0, _119);
    float _263 = abs(_249);
    float _265 = abs(_251);
    float _267 = precise::max(_263, _265);
    float _269 = 1.0 / _217;
    float _271 = abs(_193);
    float _273 = abs(_201);
    float _275 = precise::max(_271, _273);
    float _277 = fma(_141, 2.0, _121);
    float _279 = fma(_141, 3.0, _121);
    float _281 = fma(_149, 2.0, _129);
    float _283 = abs(_219);
    float _285 = precise::max(_283, _275);
    float _287 = fma(_141, 2.0, _131);
    float _289 = _119 * _203;
    float _291 = 1.0 / _255;
    float _293 = _121 * _203;
    float _295 = _123 * _203;
    float _297 = abs(_257);
    float _299 = precise::max(_297, _267);
    float _301 = fma(_161, 2.0, _139);
    float _303 = fma(_161, 2.0, _123);
    float _305 = fma(_149, 3.0, _129);
    float _307 = fma(_141, 3.0, _131);
    float _309 = 1.0 / _285;
    float _311 = abs(_281);
    float _313 = abs(_287);
    float _315 = precise::max(_311, _313);
    float _317 = _139 * _181;
    float _319 = abs(_259);
    float _321 = abs(_277);
    float _323 = precise::max(_319, _321);
    float _325 = _129 * _181;
    float _327 = _131 * _181;
    float3 _6814 = float3(_233, _235, _237);
    float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6814, float3(0.0), isnan(_6814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6814, float3(0.0), isnan(_6814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float3 _6835 = float3(_289, _293, _295);
    float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6835, float3(0.0), isnan(_6835)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6835, float3(0.0), isnan(_6835)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _341 = _339.x;
    float _343 = _339.y;
    float _345 = _339.z;
    float _347 = 1.0 / _299;
    float _349 = fma(_161, 3.0, _123);
    float _351 = fma(_161, 3.0, _139);
    float _353 = abs(_301);
    float _355 = precise::max(_353, _315);
    float _357 = _179 * _269;
    float _359 = _183 * _269;
    float _361 = _191 * _269;
    float _363 = abs(_303);
    float _365 = precise::max(_363, _323);
    float _367 = fma(_149, 2.0, _143);
    float _369 = fma(_141, 2.0, _157);
    float _371 = fma(_149, 3.0, _143);
    float _373 = fma(_141, 3.0, _157);
    float _375 = abs(_305);
    float _377 = abs(_307);
    float _379 = precise::max(_375, _377);
    float _381 = _143 * _227;
    float _383 = _157 * _227;
    float _385 = fma(_161, 2.0, _171);
    float _387 = fma(_161, 3.0, _171);
    float _389 = _171 * _227;
    float3 _6913 = float3(_325, _327, _317);
    float3 _391 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6913, float3(0.0), isnan(_6913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6913, float3(0.0), isnan(_6913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = abs(_225);
    float _401 = abs(_229);
    float _403 = precise::max(_399, _401);
    float _405 = 1.0 / _365;
    float _407 = abs(_351);
    float _409 = precise::max(_407, _379);
    float _411 = _201 * _309;
    float _413 = abs(_367);
    float _415 = abs(_369);
    float _417 = precise::max(_413, _415);
    float _419 = _211 * _291;
    float _421 = _213 * _291;
    float _423 = _239 * _291;
    float3 _6963 = float3(_381, _383, _389);
    float3 _425 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6963, float3(0.0), isnan(_6963)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6963, float3(0.0), isnan(_6963)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _427 = _425.x;
    float _429 = _425.y;
    float _431 = _425.z;
    float3 _6980 = float3(_357, _359, _361);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6980, float3(0.0), isnan(_6980)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = abs(_231);
    float _443 = precise::max(_441, _403);
    float _445 = 1.0 / _409;
    float _447 = abs(_371);
    float _449 = abs(_373);
    float _451 = precise::max(_447, _449);
    float _453 = _193 * _309;
    float _455 = abs(_261);
    float _457 = abs(_279);
    float _459 = precise::max(_455, _457);
    float _461 = _251 * _347;
    float _463 = abs(_385);
    float _465 = precise::max(_463, _417);
    float _467 = _219 * _309;
    float _469 = abs(_387);
    float _471 = precise::max(_469, _451);
    float _473 = 1.0 / _355;
    float _475 = abs(_349);
    float _477 = precise::max(_475, _459);
    float3 _7044 = float3(_419, _421, _423);
    float3 _479 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7044, float3(0.0), isnan(_7044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7044, float3(0.0), isnan(_7044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _481 = _479.x;
    float _483 = _479.y;
    float _485 = _479.z;
    float3 _7061 = float3(_453, _411, _467);
    float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7061, float3(0.0), isnan(_7061)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7061, float3(0.0), isnan(_7061)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _489 = _487.x;
    float _491 = _487.y;
    float _493 = _487.z;
    float _495 = _167 * _247;
    float _497 = _169 * _247;
    float _499 = _185 * _247;
    float _501 = _249 * _347;
    float _503 = 1.0 / _443;
    float _505 = _257 * _347;
    float _507 = _277 * _405;
    float _509 = _259 * _405;
    float _511 = _305 * _445;
    float _513 = _307 * _445;
    float _515 = _351 * _445;
    float _517 = _303 * _405;
    float _519 = 1.0 / _465;
    float _521 = _281 * _473;
    float _523 = _287 * _473;
    float _525 = _301 * _473;
    float _527 = 1.0 / _477;
    float _529 = _225 * _503;
    float _531 = _229 * _503;
    float _533 = _231 * _503;
    float _535 = 1.0 / _471;
    float _537 = _367 * _519;
    float _539 = _369 * _519;
    float _541 = _385 * _519;
    float3 _7146 = float3(_501, _461, _505);
    float3 _543 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7146, float3(0.0), isnan(_7146)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7146, float3(0.0), isnan(_7146)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _545 = _543.x;
    float _547 = _543.y;
    float _549 = _543.z;
    float3 _7163 = float3(_495, _497, _499);
    float3 _551 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7163, float3(0.0), isnan(_7163)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7163, float3(0.0), isnan(_7163)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float3 _7180 = float3(_509, _507, _517);
    float3 _559 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7180, float3(0.0), isnan(_7180)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7180, float3(0.0), isnan(_7180)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float3 _7197 = float3(_521, _523, _525);
    float3 _567 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7197, float3(0.0), isnan(_7197)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7197, float3(0.0), isnan(_7197)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _261 * _527;
    float _577 = _279 * _527;
    float _579 = _349 * _527;
    float _581 = _371 * _535;
    float _583 = _373 * _535;
    float _585 = _387 * _535;
    float3 _7232 = float3(_537, _539, _541);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7232, float3(0.0), isnan(_7232)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7232, float3(0.0), isnan(_7232)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float3 _7249 = float3(_529, _531, _533);
    float3 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7249, float3(0.0), isnan(_7249)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7249, float3(0.0), isnan(_7249)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float3 _7266 = float3(_575, _577, _579);
    float3 _603 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7266, float3(0.0), isnan(_7266)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7266, float3(0.0), isnan(_7266)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _605 = _603.x;
    float _607 = _603.y;
    float _609 = _603.z;
    float3 _7283 = float3(_511, _513, _515);
    float3 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7283, float3(0.0), isnan(_7283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7283, float3(0.0), isnan(_7283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float3 _7300 = float3(_581, _583, _585);
    float3 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7300, float3(0.0), isnan(_7300)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7300, float3(0.0), isnan(_7300)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _335 + _343;
    float _629 = _333 + _341;
    float _631 = _337 + _345;
    float _633 = _395 + _627;
    float _635 = _393 + _629;
    float _637 = _397 + _631;
    float _639 = _429 + _633;
    float _641 = _427 + _635;
    float _643 = _431 + _637;
    float _645 = _437 + _639;
    float _647 = _435 + _641;
    float _649 = _439 + _643;
    float _651 = _483 + _645;
    float _653 = _481 + _647;
    float _655 = _485 + _649;
    float _657 = _491 + _651;
    float _659 = _489 + _653;
    float _661 = _493 + _655;
    float _663 = _547 + _657;
    float _665 = _545 + _659;
    float _667 = _549 + _661;
    float _669 = _555 + _663;
    float _671 = _553 + _665;
    float _673 = _557 + _667;
    float _675 = _563 + _669;
    float _677 = _561 + _671;
    float _679 = _565 + _673;
    float _681 = _571 + _675;
    float _683 = _569 + _677;
    float _685 = _573 + _679;
    float _687 = _591 + _681;
    float _689 = _589 + _683;
    float _691 = _593 + _685;
    float _693 = _599 + _687;
    float _695 = _597 + _689;
    float _697 = _601 + _691;
    float _699 = _607 + _693;
    float _701 = _605 + _695;
    float _703 = _609 + _697;
    float _705 = _615 + _699;
    float _707 = _613 + _701;
    float _709 = _617 + _703;
    float _711 = _623 + _705;
    float _713 = _621 + _707;
    float _715 = _625 + _709;
    float _717 = fma(_711, -0.0625, _343);
    float _719 = fma(_713, -0.0625, _341);
    float _721 = fma(_715, -0.0625, _345);
    float _723 = fma(_711, -0.0625, _335);
    float _725 = fma(_713, -0.0625, _333);
    float _727 = _719 * _717;
    float _729 = _719 * _719;
    float _731 = fma(_715, -0.0625, _337);
    float _733 = _717 * _717;
    float _735 = _717 * _721;
    float _737 = _719 * _721;
    float _739 = fma(_725, _723, _727);
    float _741 = fma(_723, _723, _733);
    float _743 = fma(_723, _731, _735);
    float _745 = fma(_725, _725, _729);
    float _747 = fma(_725, _731, _737);
    float _749 = _721 * _721;
    float _751 = fma(_711, -0.0625, _395);
    float _753 = fma(_713, -0.0625, _393);
    float _755 = fma(_715, -0.0625, _397);
    float _757 = fma(_731, _731, _749);
    float _759 = fma(_751, _751, _741);
    float _761 = fma(_753, _751, _739);
    float _763 = fma(_751, _755, _743);
    float _765 = fma(_753, _753, _745);
    float _767 = fma(_753, _755, _747);
    float _769 = fma(_711, -0.0625, _429);
    float _771 = fma(_713, -0.0625, _427);
    float _773 = fma(_715, -0.0625, _431);
    float _775 = fma(_755, _755, _757);
    float _777 = fma(_769, _769, _759);
    float _779 = fma(_771, _769, _761);
    float _781 = fma(_769, _773, _763);
    float _783 = fma(_771, _771, _765);
    float _785 = fma(_771, _773, _767);
    float _787 = fma(_711, -0.0625, _437);
    float _789 = fma(_713, -0.0625, _435);
    float _791 = fma(_715, -0.0625, _439);
    float _793 = fma(_773, _773, _775);
    float _795 = fma(_787, _787, _777);
    float _797 = fma(_789, _787, _779);
    float _799 = fma(_787, _791, _781);
    float _801 = fma(_789, _789, _783);
    float _803 = fma(_789, _791, _785);
    float _805 = fma(_711, -0.0625, _483);
    float _807 = fma(_713, -0.0625, _481);
    float _809 = fma(_715, -0.0625, _485);
    float _811 = fma(_791, _791, _793);
    float _813 = fma(_805, _805, _795);
    float _815 = fma(_807, _805, _797);
    float _817 = fma(_805, _809, _799);
    float _819 = fma(_807, _807, _801);
    float _821 = fma(_807, _809, _803);
    float _823 = fma(_711, -0.0625, _491);
    float _825 = fma(_713, -0.0625, _489);
    float _827 = fma(_715, -0.0625, _493);
    float _829 = fma(_809, _809, _811);
    float _831 = fma(_823, _823, _813);
    float _833 = fma(_825, _823, _815);
    float _835 = fma(_823, _827, _817);
    float _837 = fma(_825, _825, _819);
    float _839 = fma(_825, _827, _821);
    float _841 = fma(_711, -0.0625, _547);
    float _843 = fma(_713, -0.0625, _545);
    float _845 = fma(_715, -0.0625, _549);
    float _847 = fma(_827, _827, _829);
    float _849 = fma(_841, _841, _831);
    float _851 = fma(_843, _841, _833);
    float _853 = fma(_841, _845, _835);
    float _855 = fma(_843, _843, _837);
    float _857 = fma(_843, _845, _839);
    float _859 = fma(_711, -0.0625, _555);
    float _861 = fma(_713, -0.0625, _553);
    float _863 = fma(_715, -0.0625, _557);
    float _865 = fma(_845, _845, _847);
    float _867 = fma(_859, _859, _849);
    float _869 = fma(_861, _859, _851);
    float _871 = fma(_859, _863, _853);
    float _873 = fma(_861, _861, _855);
    float _875 = fma(_861, _863, _857);
    float _877 = fma(_711, -0.0625, _563);
    float _879 = fma(_713, -0.0625, _561);
    float _881 = fma(_715, -0.0625, _565);
    float _883 = fma(_863, _863, _865);
    float _885 = fma(_877, _877, _867);
    float _887 = fma(_879, _877, _869);
    float _889 = fma(_877, _881, _871);
    float _891 = fma(_879, _879, _873);
    float _893 = fma(_879, _881, _875);
    float _895 = fma(_711, -0.0625, _571);
    float _897 = fma(_713, -0.0625, _569);
    float _899 = fma(_715, -0.0625, _573);
    float _901 = fma(_881, _881, _883);
    float _903 = fma(_895, _895, _885);
    float _905 = fma(_897, _895, _887);
    float _907 = fma(_895, _899, _889);
    float _909 = fma(_897, _897, _891);
    float _911 = fma(_897, _899, _893);
    float _913 = fma(_711, -0.0625, _591);
    float _915 = fma(_713, -0.0625, _589);
    float _917 = fma(_715, -0.0625, _593);
    float _919 = fma(_899, _899, _901);
    float _921 = fma(_913, _913, _903);
    float _923 = fma(_915, _913, _905);
    float _925 = fma(_913, _917, _907);
    float _927 = fma(_915, _915, _909);
    float _929 = fma(_915, _917, _911);
    float _931 = fma(_711, -0.0625, _599);
    float _933 = fma(_713, -0.0625, _597);
    float _935 = fma(_715, -0.0625, _601);
    float _937 = fma(_917, _917, _919);
    float _939 = fma(_931, _931, _921);
    float _941 = fma(_933, _931, _923);
    float _943 = fma(_931, _935, _925);
    float _945 = fma(_933, _933, _927);
    float _947 = fma(_933, _935, _929);
    float _949 = fma(_711, -0.0625, _607);
    float _951 = fma(_713, -0.0625, _605);
    float _953 = fma(_715, -0.0625, _609);
    float _955 = fma(_935, _935, _937);
    float _957 = fma(_949, _949, _939);
    float _959 = fma(_951, _949, _941);
    float _961 = fma(_949, _953, _943);
    float _963 = fma(_951, _951, _945);
    float _965 = fma(_951, _953, _947);
    float _967 = fma(_711, -0.0625, _615);
    float _969 = fma(_713, -0.0625, _613);
    float _971 = fma(_715, -0.0625, _617);
    float _973 = fma(_711, -0.0625, _623);
    float _975 = fma(_967, _967, _957);
    float _977 = fma(_969, _967, _959);
    float _979 = fma(_713, -0.0625, _621);
    float _981 = fma(_967, _971, _961);
    float _983 = fma(_715, -0.0625, _625);
    float _985 = fma(_969, _969, _963);
    float _987 = fma(_973, _973, _975);
    float _989 = fma(_979, _973, _977);
    float _991 = fma(_953, _953, _955);
    float _993 = fma(_969, _971, _965);
    float _995 = fma(_973, _983, _981);
    float _997 = fma(_979, _979, _985);
    float _999 = _987 + _989;
    float _1001 = fma(_971, _971, _991);
    float _1003 = fma(_979, _983, _993);
    float _1005 = _997 + _989;
    float _1007 = _995 + _999;
    float _1009 = fma(_983, _983, _1001);
    float _1011 = _995 + _1003;
    float _1013 = _1003 + _1005;
    float _1015 = _1007 * _1007;
    float _1017 = _1009 + _1011;
    float _1019 = fma(_1013, _1013, _1015);
    float _1021 = fma(_1017, _1017, _1019);
    float _1023 = rsqrt(_1021);
    float _1025 = _1007 * _1023;
    float _1027 = _1013 * _1023;
    float _1029 = _1017 * _1023;
    float _1031 = _987 * _1025;
    float _1033 = _989 * _1025;
    float _1035 = fma(_989, _1027, _1031);
    float _1037 = _995 * _1025;
    float _1039 = fma(_997, _1027, _1033);
    float _1041 = fma(_995, _1029, _1035);
    float _1043 = fma(_1003, _1027, _1037);
    float _1045 = fma(_1003, _1029, _1039);
    float _1047 = _1041 * _1041;
    float _1049 = fma(_1009, _1029, _1043);
    float _1051 = fma(_1045, _1045, _1047);
    float _1053 = fma(_1049, _1049, _1051);
    float _1055 = rsqrt(_1053);
    float _1057 = _1041 * _1055;
    float _1059 = _1045 * _1055;
    float _1061 = _1049 * _1055;
    float _1063 = _987 * _1057;
    float _1065 = _989 * _1057;
    float _1067 = _995 * _1057;
    float _1069 = fma(_989, _1059, _1063);
    float _1071 = fma(_997, _1059, _1065);
    float _1073 = fma(_1003, _1059, _1067);
    float _1075 = fma(_995, _1061, _1069);
    float _1077 = fma(_1003, _1061, _1071);
    float _1079 = fma(_1009, _1061, _1073);
    float _1081 = _1075 * _1075;
    float _1083 = fma(_1077, _1077, _1081);
    float _1085 = fma(_1079, _1079, _1083);
    float _1087 = rsqrt(_1085);
    float _1089 = _1075 * _1087;
    float _1091 = _1077 * _1087;
    float _1093 = _1079 * _1087;
    float _1095 = _987 * _1089;
    float _1097 = _989 * _1089;
    float _1099 = _995 * _1089;
    float _1101 = fma(_989, _1091, _1095);
    float _1103 = fma(_997, _1091, _1097);
    float _1105 = fma(_1003, _1091, _1099);
    float _1107 = fma(_995, _1093, _1101);
    float _1109 = fma(_1003, _1093, _1103);
    float _1111 = fma(_1009, _1093, _1105);
    float _1113 = _1107 * _1107;
    float _1115 = fma(_1109, _1109, _1113);
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = rsqrt(_1117);
    float _1121 = _1107 * _1119;
    float _1123 = _1109 * _1119;
    float _1125 = _1111 * _1119;
    float _1127 = _987 * _1121;
    float _1129 = _989 * _1121;
    float _1131 = _995 * _1121;
    float _1133 = fma(_989, _1123, _1127);
    float _1135 = fma(_997, _1123, _1129);
    float _1137 = fma(_1003, _1123, _1131);
    float _1139 = fma(_995, _1125, _1133);
    float _1141 = fma(_1003, _1125, _1135);
    float _1143 = fma(_1009, _1125, _1137);
    float _1145 = _1139 * _1139;
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = fma(_1143, _1143, _1147);
    float _1151 = rsqrt(_1149);
    float _1153 = _1139 * _1151;
    float _1155 = _1141 * _1151;
    float _1157 = _1143 * _1151;
    float _1159 = _987 * _1153;
    float _1161 = _989 * _1153;
    float _1163 = _995 * _1153;
    float _1165 = fma(_989, _1155, _1159);
    float _1167 = fma(_997, _1155, _1161);
    float _1169 = fma(_1003, _1155, _1163);
    float _1171 = fma(_995, _1157, _1165);
    float _1173 = fma(_1003, _1157, _1167);
    float _1175 = fma(_1009, _1157, _1169);
    float _1177 = _1171 * _1171;
    float _1179 = fma(_1173, _1173, _1177);
    float _1181 = fma(_1175, _1175, _1179);
    float _1183 = rsqrt(_1181);
    float _1185 = _1171 * _1183;
    float _1187 = _1173 * _1183;
    float _1189 = _1175 * _1183;
    float _1191 = _987 * _1185;
    float _1193 = _989 * _1185;
    float _1195 = _995 * _1185;
    float _1197 = fma(_989, _1187, _1191);
    float _1199 = fma(_997, _1187, _1193);
    float _1201 = fma(_1003, _1187, _1195);
    float _1203 = fma(_995, _1189, _1197);
    float _1205 = fma(_1003, _1189, _1199);
    float _1207 = fma(_1009, _1189, _1201);
    float _1209 = _1203 * _1203;
    float _1211 = fma(_1205, _1205, _1209);
    float _1213 = fma(_1207, _1207, _1211);
    float _1215 = rsqrt(_1213);
    float _1217 = _1203 * _1215;
    float _1219 = _1205 * _1215;
    float _1221 = _1207 * _1215;
    float _1223 = _987 * _1217;
    float _1225 = _989 * _1217;
    float _1227 = fma(_989, _1219, _1223);
    float _1229 = _995 * _1217;
    float _1231 = fma(_997, _1219, _1225);
    float _1233 = fma(_995, _1221, _1227);
    float _1235 = fma(_1003, _1219, _1229);
    float _1237 = fma(_1003, _1221, _1231);
    float _1239 = _1233 * _1233;
    float _1241 = fma(_1009, _1221, _1235);
    float _1243 = fma(_1237, _1237, _1239);
    float _1245 = fma(_1241, _1241, _1243);
    float _1247 = rsqrt(_1245);
    float _1249 = _1233 * _1247;
    float _1251 = _1237 * _1247;
    float _1253 = _1241 * _1247;
    float _1255 = _335 * _1249;
    float _1257 = _343 * _1249;
    float _1259 = _395 * _1249;
    float _1261 = fma(_333, _1251, _1255);
    float _1263 = fma(_341, _1251, _1257);
    float _1265 = fma(_393, _1251, _1259);
    float _1267 = fma(_337, _1253, _1261);
    float _1269 = fma(_345, _1253, _1263);
    float _1271 = fma(_397, _1253, _1265);
    bool _1275 = _1267 >= _1269;
    bool _1277 = isnan(_1267);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(_1269);
    bool _1283 = _1279 || _1281;
    float _1285 = _981;
    float _1287 = _1261;
    float _1289 = _1265;
    float _1291 = _1263;
    float _1293 = _1259;
    float _1295 = _1219;
    float _1297 = _1207;
    float _1299 = _1217;
    float _1301 = _1267;
    float _1303 = _1191;
    float _1305 = _1271;
    float _1307 = _1271;
    float _1309 = _1253;
    float _1311 = _1251;
    float _1313 = _213;
    float _1315 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_1283)
    {
        _1285 = _341;
    }
    float _1317 = _1285;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1283)
    {
        _1287 = _343;
    }
    float _1323 = _1287;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1283)
    {
        _1289 = _345;
    }
    float _1329 = _1289;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1283)
    {
        _1291 = _1267;
    }
    float _1335 = _1291;
    float _1337 = _1335;
    float _1339 = _1335;
    if (!_1283)
    {
        _1293 = _1269;
    }
    float _1341 = _1293;
    float _1343 = _1341;
    float _1345 = _1341;
    if (!_1283)
    {
        _1295 = _333;
    }
    float _1347 = _1295;
    float _1349 = _1347;
    float _1351 = _1347;
    if (!_1283)
    {
        _1297 = _335;
    }
    float _1353 = _1297;
    float _1355 = _1353;
    float _1357 = _1353;
    if (!_1283)
    {
        _1299 = _337;
    }
    float _1359 = _1299;
    bool _1361 = !_1283;
    float _1363 = _1359;
    float _1365 = _1359;
    if (!_1361)
    {
        bool _1367 = _1267 > _1269;
        if (!_1367)
        {
            _1337 = _1267;
        }
        float _1369 = _1337;
        float _1371 = _1369;
        if (!_1367)
        {
            _1343 = _1267;
        }
        float _1373 = _1343;
        float _1375 = _1373;
        if (!_1367)
        {
            _1349 = _333;
        }
        float _1377 = _1349;
        float _1379 = _1377;
        if (!_1367)
        {
            _1355 = _335;
        }
        float _1381 = _1355;
        float _1383 = _1381;
        if (!_1367)
        {
            _1363 = _337;
        }
        float _1385 = _1363;
        float _1387 = _1385;
        if (!_1367)
        {
            _1319 = _333;
        }
        float _1389 = _1319;
        float _1391 = _1389;
        if (!_1367)
        {
            _1325 = _335;
        }
        float _1393 = _1325;
        float _1395 = _1393;
        if (!_1367)
        {
            _1331 = _337;
        }
        float _1397 = _1331;
        _1333 = _1397;
        if (_1367)
        {
            _1371 = _1269;
        }
        float _1399 = _1371;
        _1339 = _1399;
        if (_1367)
        {
            _1375 = _1267;
        }
        float _1401 = _1375;
        _1345 = _1401;
        if (_1367)
        {
            _1379 = _341;
        }
        float _1403 = _1379;
        _1351 = _1403;
        if (_1367)
        {
            _1383 = _343;
        }
        float _1405 = _1383;
        _1357 = _1405;
        if (_1367)
        {
            _1387 = _345;
        }
        float _1407 = _1387;
        _1365 = _1407;
        if (_1367)
        {
            _1391 = _333;
        }
        float _1409 = _1391;
        _1321 = _1409;
        if (_1367)
        {
            _1395 = _335;
        }
        float _1411 = _1395;
        _1327 = _1411;
        if (_1367)
        {
            _1333 = _337;
        }
    }
    float _1413 = _1345;
    float _1415 = _1339;
    float _1417 = _1321;
    float _1419 = _1327;
    float _1421 = _1333;
    float _1423 = _1351;
    float _1425 = _1357;
    float _1427 = _1365;
    bool _1429 = _1413 >= _1271;
    bool _1431 = isnan(_1413);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(_1271);
    bool _1437 = _1433 || _1435;
    float _1439 = _429 * _1249;
    float _1441 = fma(_427, _1251, _1439);
    float _1443 = fma(_431, _1253, _1441);
    float _1445 = _1441;
    float _1447 = _1415;
    float _1449 = _1423;
    float _1451 = _1425;
    float _1453 = _1415;
    float _1455 = _1423;
    float _1457 = _1425;
    float _1459 = _1427;
    float _1461 = _1421;
    float _1463 = _1419;
    float _1465 = _1443;
    float _1467 = _1443;
    if (!_1437)
    {
        _1301 = _393;
    }
    float _1469 = _1301;
    float _1471 = _1469;
    float _1473 = _1469;
    if (!_1437)
    {
        _1445 = _395;
    }
    float _1475 = _1445;
    float _1477 = _1475;
    float _1479 = _1475;
    if (!_1437)
    {
        _1303 = _397;
    }
    float _1481 = _1303;
    bool _1483 = !_1437;
    float _1485 = _1481;
    float _1487 = _1481;
    if (!_1483)
    {
        bool _1489 = _1415 > _1271;
        if (_1489)
        {
            _1447 = _1271;
        }
        float _1491 = _1447;
        _1453 = _1491;
        if (!_1489)
        {
            _1471 = _1417;
        }
        float _1493 = _1471;
        float _1495 = _1493;
        if (!_1489)
        {
            _1477 = _1419;
        }
        float _1497 = _1477;
        float _1499 = _1497;
        if (!_1489)
        {
            _1485 = _1421;
        }
        float _1501 = _1485;
        float _1503 = _1501;
        if (!_1489)
        {
            _1305 = _1413;
        }
        float _1505 = _1305;
        float _1507 = _1505;
        if (_1489)
        {
            _1495 = _1417;
        }
        float _1509 = _1495;
        _1473 = _1509;
        if (_1489)
        {
            _1499 = _1419;
        }
        float _1511 = _1499;
        _1479 = _1511;
        if (_1489)
        {
            _1503 = _1421;
        }
        float _1513 = _1503;
        _1487 = _1513;
        if (_1489)
        {
            _1507 = _1413;
        }
        float _1515 = _1507;
        _1307 = _1515;
        if (_1489)
        {
            _1449 = _393;
        }
        float _1517 = _1449;
        _1455 = _1517;
        if (_1489)
        {
            _1451 = _395;
        }
        float _1519 = _1451;
        _1457 = _1519;
        if (_1489)
        {
            _1459 = _397;
        }
    }
    float _1521 = _1307;
    float _1523 = _1453;
    float _1525 = _1473;
    float _1527 = _1479;
    float _1529 = _1487;
    float _1531 = _1455;
    float _1533 = _1457;
    float _1535 = _1459;
    bool _1537 = _1521 >= _1443;
    bool _1539 = isnan(_1521);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(_1443);
    bool _1545 = _1541 || _1543;
    float _1547 = _437 * _1249;
    float _1549 = fma(_435, _1251, _1547);
    float _1551 = fma(_439, _1253, _1549);
    float _1553 = _1547;
    float _1555 = _1523;
    float _1557 = _1531;
    float _1559 = _1533;
    float _1561 = _1523;
    float _1563 = _1531;
    float _1565 = _1533;
    float _1567 = _1535;
    float _1569 = _1525;
    float _1571 = _1529;
    float _1573 = _1551;
    float _1575 = _1551;
    if (!_1545)
    {
        _1553 = _427;
    }
    float _1577 = _1553;
    float _1579 = _1577;
    float _1581 = _1577;
    if (!_1545)
    {
        _1461 = _429;
    }
    float _1583 = _1461;
    float _1585 = _1583;
    float _1587 = _1583;
    if (!_1545)
    {
        _1463 = _431;
    }
    float _1589 = _1463;
    bool _1591 = !_1545;
    float _1593 = _1589;
    float _1595 = _1589;
    if (!_1591)
    {
        bool _1597 = _1523 > _1443;
        if (_1597)
        {
            _1555 = _1443;
        }
        float _1599 = _1555;
        _1561 = _1599;
        if (!_1597)
        {
            _1579 = _1525;
        }
        float _1601 = _1579;
        float _1603 = _1601;
        if (!_1597)
        {
            _1585 = _1527;
        }
        float _1605 = _1585;
        float _1607 = _1605;
        if (!_1597)
        {
            _1593 = _1529;
        }
        float _1609 = _1593;
        float _1611 = _1609;
        if (!_1597)
        {
            _1465 = _1521;
        }
        float _1613 = _1465;
        float _1615 = _1613;
        if (_1597)
        {
            _1603 = _1525;
        }
        float _1617 = _1603;
        _1581 = _1617;
        if (_1597)
        {
            _1607 = _1527;
        }
        float _1619 = _1607;
        _1587 = _1619;
        if (_1597)
        {
            _1611 = _1529;
        }
        float _1621 = _1611;
        _1595 = _1621;
        if (_1597)
        {
            _1615 = _1521;
        }
        float _1623 = _1615;
        _1467 = _1623;
        if (_1597)
        {
            _1557 = _427;
        }
        float _1625 = _1557;
        _1563 = _1625;
        if (_1597)
        {
            _1559 = _429;
        }
        float _1627 = _1559;
        _1565 = _1627;
        if (_1597)
        {
            _1567 = _431;
        }
    }
    float _1629 = _1467;
    float _1631 = _1561;
    float _1633 = _1581;
    float _1635 = _1587;
    float _1637 = _1595;
    float _1639 = _1563;
    float _1641 = _1565;
    float _1643 = _1567;
    bool _1645 = _1629 >= _1551;
    bool _1647 = isnan(_1629);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan(_1551);
    bool _1653 = _1649 || _1651;
    float _1655 = _483 * _1249;
    float _1657 = fma(_481, _1251, _1655);
    float _1659 = fma(_485, _1253, _1657);
    float _1661 = _1657;
    float _1663 = _1631;
    float _1665 = _1639;
    float _1667 = _1641;
    float _1669 = _1631;
    float _1671 = _1639;
    float _1673 = _1641;
    float _1675 = _1643;
    float _1677 = _1635;
    float _1679 = _1637;
    float _1681 = _1659;
    float _1683 = _1659;
    float _1685 = _1629;
    if (!_1653)
    {
        _1569 = _435;
    }
    float _1687 = _1569;
    float _1689 = _1687;
    float _1691 = _1687;
    if (!_1653)
    {
        _1661 = _437;
    }
    float _1693 = _1661;
    float _1695 = _1693;
    float _1697 = _1693;
    if (!_1653)
    {
        _1571 = _439;
    }
    float _1699 = _1571;
    bool _1701 = !_1653;
    float _1703 = _1699;
    float _1705 = _1699;
    if (!_1701)
    {
        bool _1707 = _1631 > _1551;
        if (_1707)
        {
            _1663 = _1551;
        }
        float _1709 = _1663;
        _1669 = _1709;
        if (!_1707)
        {
            _1689 = _1633;
        }
        float _1711 = _1689;
        float _1713 = _1711;
        if (!_1707)
        {
            _1695 = _1635;
        }
        float _1715 = _1695;
        float _1717 = _1715;
        if (!_1707)
        {
            _1703 = _1637;
        }
        float _1719 = _1703;
        float _1721 = _1719;
        if (!_1707)
        {
            _1573 = _1629;
        }
        float _1723 = _1573;
        float _1725 = _1723;
        if (_1707)
        {
            _1713 = _1633;
        }
        float _1727 = _1713;
        _1691 = _1727;
        if (_1707)
        {
            _1717 = _1635;
        }
        float _1729 = _1717;
        _1697 = _1729;
        if (_1707)
        {
            _1721 = _1637;
        }
        float _1731 = _1721;
        _1705 = _1731;
        if (_1707)
        {
            _1725 = _1629;
        }
        float _1733 = _1725;
        _1575 = _1733;
        if (_1707)
        {
            _1665 = _435;
        }
        float _1735 = _1665;
        _1671 = _1735;
        if (_1707)
        {
            _1667 = _437;
        }
        float _1737 = _1667;
        _1673 = _1737;
        if (_1707)
        {
            _1675 = _439;
        }
    }
    float _1739 = _1575;
    float _1741 = _1669;
    float _1743 = _1691;
    float _1745 = _1697;
    float _1747 = _1705;
    float _1749 = _1671;
    float _1751 = _1673;
    float _1753 = _1675;
    bool _1755 = _1739 >= _1659;
    bool _1757 = isnan(_1739);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1659);
    bool _1763 = _1759 || _1761;
    float _1765 = _491 * _1249;
    float _1767 = fma(_489, _1251, _1765);
    float _1769 = fma(_493, _1253, _1767);
    float _1771 = _1765;
    float _1773 = _1741;
    float _1775 = _1749;
    float _1777 = _1751;
    float _1779 = _1741;
    float _1781 = _1749;
    float _1783 = _1751;
    float _1785 = _1753;
    float _1787 = _1747;
    float _1789 = _1739;
    float _1791 = _1769;
    float _1793 = _1769;
    if (!_1763)
    {
        _1771 = _481;
    }
    float _1795 = _1771;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1763)
    {
        _1677 = _483;
    }
    float _1801 = _1677;
    float _1803 = _1801;
    float _1805 = _1801;
    if (!_1763)
    {
        _1679 = _485;
    }
    float _1807 = _1679;
    bool _1809 = !_1763;
    float _1811 = _1807;
    float _1813 = _1807;
    if (!_1809)
    {
        bool _1815 = _1741 > _1659;
        if (_1815)
        {
            _1773 = _1659;
        }
        float _1817 = _1773;
        _1779 = _1817;
        if (!_1815)
        {
            _1797 = _1743;
        }
        float _1819 = _1797;
        float _1821 = _1819;
        if (!_1815)
        {
            _1803 = _1745;
        }
        float _1823 = _1803;
        float _1825 = _1823;
        if (!_1815)
        {
            _1811 = _1747;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        if (!_1815)
        {
            _1681 = _1739;
        }
        float _1831 = _1681;
        float _1833 = _1831;
        if (_1815)
        {
            _1821 = _1743;
        }
        float _1835 = _1821;
        _1799 = _1835;
        if (_1815)
        {
            _1825 = _1745;
        }
        float _1837 = _1825;
        _1805 = _1837;
        if (_1815)
        {
            _1829 = _1747;
        }
        float _1839 = _1829;
        _1813 = _1839;
        if (_1815)
        {
            _1833 = _1739;
        }
        float _1841 = _1833;
        _1683 = _1841;
        if (_1815)
        {
            _1775 = _481;
        }
        float _1843 = _1775;
        _1781 = _1843;
        if (_1815)
        {
            _1777 = _483;
        }
        float _1845 = _1777;
        _1783 = _1845;
        if (_1815)
        {
            _1785 = _485;
        }
    }
    float _1847 = _1683;
    float _1849 = _1779;
    float _1851 = _1799;
    float _1853 = _1805;
    float _1855 = _1813;
    float _1857 = _1781;
    float _1859 = _1783;
    float _1861 = _1785;
    bool _1863 = _1847 >= _1769;
    bool _1865 = isnan(_1847);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1769);
    bool _1871 = _1867 || _1869;
    float _1873 = _547 * _1249;
    float _1875 = fma(_545, _1251, _1873);
    float _1877 = fma(_549, _1253, _1875);
    float _1879 = _1849;
    float _1881 = _1857;
    float _1883 = _1859;
    float _1885 = _1849;
    float _1887 = _1857;
    float _1889 = _1859;
    float _1891 = _1861;
    float _1893 = _1853;
    float _1895 = _1855;
    float _1897 = _1877;
    float _1899 = _1877;
    if (!_1871)
    {
        _1787 = _489;
    }
    float _1901 = _1787;
    float _1903 = _1901;
    float _1905 = _1901;
    if (!_1871)
    {
        _1685 = _491;
    }
    float _1907 = _1685;
    float _1909 = _1907;
    float _1911 = _1907;
    if (!_1871)
    {
        _1789 = _493;
    }
    float _1913 = _1789;
    bool _1915 = !_1871;
    float _1917 = _1913;
    float _1919 = _1913;
    if (!_1915)
    {
        bool _1921 = _1849 > _1769;
        if (_1921)
        {
            _1879 = _1769;
        }
        float _1923 = _1879;
        _1885 = _1923;
        if (!_1921)
        {
            _1903 = _1851;
        }
        float _1925 = _1903;
        float _1927 = _1925;
        if (!_1921)
        {
            _1909 = _1853;
        }
        float _1929 = _1909;
        float _1931 = _1929;
        if (!_1921)
        {
            _1917 = _1855;
        }
        float _1933 = _1917;
        float _1935 = _1933;
        if (!_1921)
        {
            _1791 = _1847;
        }
        float _1937 = _1791;
        float _1939 = _1937;
        if (_1921)
        {
            _1927 = _1851;
        }
        float _1941 = _1927;
        _1905 = _1941;
        if (_1921)
        {
            _1931 = _1853;
        }
        float _1943 = _1931;
        _1911 = _1943;
        if (_1921)
        {
            _1935 = _1855;
        }
        float _1945 = _1935;
        _1919 = _1945;
        if (_1921)
        {
            _1939 = _1847;
        }
        float _1947 = _1939;
        _1793 = _1947;
        if (_1921)
        {
            _1881 = _489;
        }
        float _1949 = _1881;
        _1887 = _1949;
        if (_1921)
        {
            _1883 = _491;
        }
        float _1951 = _1883;
        _1889 = _1951;
        if (_1921)
        {
            _1891 = _493;
        }
    }
    float _1953 = _1793;
    float _1955 = _1885;
    float _1957 = _1905;
    float _1959 = _1911;
    float _1961 = _1919;
    float _1963 = _1887;
    float _1965 = _1889;
    float _1967 = _1891;
    bool _1969 = _1953 >= _1877;
    bool _1971 = isnan(_1953);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan(_1877);
    bool _1977 = _1973 || _1975;
    float _1979 = _555 * _1249;
    float _1981 = fma(_553, _1251, _1979);
    float _1983 = fma(_557, _1253, _1981);
    float _1985 = _1979;
    float _1987 = _1955;
    float _1989 = _1963;
    float _1991 = _1965;
    float _1993 = _1955;
    float _1995 = _1963;
    float _1997 = _1965;
    float _1999 = _1967;
    float _2001 = _1961;
    float _2003 = _1983;
    float _2005 = _1983;
    if (!_1977)
    {
        _1985 = _545;
    }
    float _2007 = _1985;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1977)
    {
        _1893 = _547;
    }
    float _2013 = _1893;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1977)
    {
        _1895 = _549;
    }
    float _2019 = _1895;
    bool _2021 = !_1977;
    float _2023 = _2019;
    float _2025 = _2019;
    if (!_2021)
    {
        bool _2027 = _1955 > _1877;
        if (_2027)
        {
            _1987 = _1877;
        }
        float _2029 = _1987;
        _1993 = _2029;
        if (!_2027)
        {
            _2009 = _1957;
        }
        float _2031 = _2009;
        float _2033 = _2031;
        if (!_2027)
        {
            _2015 = _1959;
        }
        float _2035 = _2015;
        float _2037 = _2035;
        if (!_2027)
        {
            _2023 = _1961;
        }
        float _2039 = _2023;
        float _2041 = _2039;
        if (!_2027)
        {
            _1897 = _1953;
        }
        float _2043 = _1897;
        float _2045 = _2043;
        if (_2027)
        {
            _2033 = _1957;
        }
        float _2047 = _2033;
        _2011 = _2047;
        if (_2027)
        {
            _2037 = _1959;
        }
        float _2049 = _2037;
        _2017 = _2049;
        if (_2027)
        {
            _2041 = _1961;
        }
        float _2051 = _2041;
        _2025 = _2051;
        if (_2027)
        {
            _2045 = _1953;
        }
        float _2053 = _2045;
        _1899 = _2053;
        if (_2027)
        {
            _1989 = _545;
        }
        float _2055 = _1989;
        _1995 = _2055;
        if (_2027)
        {
            _1991 = _547;
        }
        float _2057 = _1991;
        _1997 = _2057;
        if (_2027)
        {
            _1999 = _549;
        }
    }
    float _2059 = _1899;
    float _2061 = _1993;
    float _2063 = _2011;
    float _2065 = _2017;
    float _2067 = _2025;
    float _2069 = _1995;
    float _2071 = _1997;
    float _2073 = _1999;
    bool _2075 = _2059 >= _1983;
    bool _2077 = isnan(_2059);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(_1983);
    bool _2083 = _2079 || _2081;
    float _2085 = _563 * _1249;
    float _2087 = fma(_561, _1251, _2085);
    float _2089 = fma(_565, _1253, _2087);
    float _2091 = _2085;
    float _2093 = _2087;
    float _2095 = _2061;
    float _2097 = _2069;
    float _2099 = _2071;
    float _2101 = _2061;
    float _2103 = _2069;
    float _2105 = _2071;
    float _2107 = _2073;
    float _2109 = _2067;
    float _2111 = _2065;
    float _2113 = _2089;
    float _2115 = _2089;
    if (!_2083)
    {
        _2001 = _553;
    }
    float _2117 = _2001;
    float _2119 = _2117;
    float _2121 = _2117;
    if (!_2083)
    {
        _2091 = _555;
    }
    float _2123 = _2091;
    float _2125 = _2123;
    float _2127 = _2123;
    if (!_2083)
    {
        _2093 = _557;
    }
    float _2129 = _2093;
    bool _2131 = !_2083;
    float _2133 = _2129;
    float _2135 = _2129;
    if (!_2131)
    {
        bool _2137 = _2061 > _1983;
        if (_2137)
        {
            _2095 = _1983;
        }
        float _2139 = _2095;
        _2101 = _2139;
        if (!_2137)
        {
            _2119 = _2063;
        }
        float _2141 = _2119;
        float _2143 = _2141;
        if (!_2137)
        {
            _2125 = _2065;
        }
        float _2145 = _2125;
        float _2147 = _2145;
        if (!_2137)
        {
            _2133 = _2067;
        }
        float _2149 = _2133;
        float _2151 = _2149;
        if (!_2137)
        {
            _2003 = _2059;
        }
        float _2153 = _2003;
        float _2155 = _2153;
        if (_2137)
        {
            _2143 = _2063;
        }
        float _2157 = _2143;
        _2121 = _2157;
        if (_2137)
        {
            _2147 = _2065;
        }
        float _2159 = _2147;
        _2127 = _2159;
        if (_2137)
        {
            _2151 = _2067;
        }
        float _2161 = _2151;
        _2135 = _2161;
        if (_2137)
        {
            _2155 = _2059;
        }
        float _2163 = _2155;
        _2005 = _2163;
        if (_2137)
        {
            _2097 = _553;
        }
        float _2165 = _2097;
        _2103 = _2165;
        if (_2137)
        {
            _2099 = _555;
        }
        float _2167 = _2099;
        _2105 = _2167;
        if (_2137)
        {
            _2107 = _557;
        }
    }
    float _2169 = _2005;
    float _2171 = _2101;
    float _2173 = _2121;
    float _2175 = _2127;
    float _2177 = _2135;
    float _2179 = _2103;
    float _2181 = _2105;
    float _2183 = _2107;
    bool _2185 = _2169 >= _2089;
    bool _2187 = isnan(_2169);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(_2089);
    bool _2193 = _2189 || _2191;
    float _2195 = _571 * _1249;
    float _2197 = fma(_569, _1251, _2195);
    float _2199 = fma(_573, _1253, _2197);
    float _2201 = _2197;
    float _2203 = _2171;
    float _2205 = _2179;
    float _2207 = _2181;
    float _2209 = _2171;
    float _2211 = _2179;
    float _2213 = _2181;
    float _2215 = _2183;
    float _2217 = _2177;
    float _2219 = _2199;
    float _2221 = _2199;
    if (!_2193)
    {
        _2109 = _561;
    }
    float _2223 = _2109;
    float _2225 = _2223;
    float _2227 = _2223;
    if (!_2193)
    {
        _2111 = _563;
    }
    float _2229 = _2111;
    float _2231 = _2229;
    float _2233 = _2229;
    if (!_2193)
    {
        _2201 = _565;
    }
    float _2235 = _2201;
    bool _2237 = !_2193;
    float _2239 = _2235;
    float _2241 = _2235;
    if (!_2237)
    {
        bool _2243 = _2171 > _2089;
        if (_2243)
        {
            _2203 = _2089;
        }
        float _2245 = _2203;
        _2209 = _2245;
        if (!_2243)
        {
            _2225 = _2173;
        }
        float _2247 = _2225;
        float _2249 = _2247;
        if (!_2243)
        {
            _2231 = _2175;
        }
        float _2251 = _2231;
        float _2253 = _2251;
        if (!_2243)
        {
            _2239 = _2177;
        }
        float _2255 = _2239;
        float _2257 = _2255;
        if (!_2243)
        {
            _2113 = _2169;
        }
        float _2259 = _2113;
        float _2261 = _2259;
        if (_2243)
        {
            _2249 = _2173;
        }
        float _2263 = _2249;
        _2227 = _2263;
        if (_2243)
        {
            _2253 = _2175;
        }
        float _2265 = _2253;
        _2233 = _2265;
        if (_2243)
        {
            _2257 = _2177;
        }
        float _2267 = _2257;
        _2241 = _2267;
        if (_2243)
        {
            _2261 = _2169;
        }
        float _2269 = _2261;
        _2115 = _2269;
        if (_2243)
        {
            _2205 = _561;
        }
        float _2271 = _2205;
        _2211 = _2271;
        if (_2243)
        {
            _2207 = _563;
        }
        float _2273 = _2207;
        _2213 = _2273;
        if (_2243)
        {
            _2215 = _565;
        }
    }
    float _2275 = _2115;
    float _2277 = _2209;
    float _2279 = _2227;
    float _2281 = _2233;
    float _2283 = _2241;
    float _2285 = _2211;
    float _2287 = _2213;
    float _2289 = _2215;
    bool _2291 = _2275 >= _2199;
    bool _2293 = isnan(_2275);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(_2199);
    bool _2299 = _2295 || _2297;
    float _2301 = _591 * _1249;
    float _2303 = fma(_589, _1251, _2301);
    float _2305 = fma(_593, _1253, _2303);
    float _2307 = _2301;
    float _2309 = _2303;
    float _2311 = _2277;
    float _2313 = _2285;
    float _2315 = _2287;
    float _2317 = _2277;
    float _2319 = _2285;
    float _2321 = _2287;
    float _2323 = _2289;
    float _2325 = _2279;
    float _2327 = _2281;
    float _2329 = _2305;
    float _2331 = _2305;
    if (!_2299)
    {
        _2217 = _569;
    }
    float _2333 = _2217;
    float _2335 = _2333;
    float _2337 = _2333;
    if (!_2299)
    {
        _2307 = _571;
    }
    float _2339 = _2307;
    float _2341 = _2339;
    float _2343 = _2339;
    if (!_2299)
    {
        _2309 = _573;
    }
    float _2345 = _2309;
    bool _2347 = !_2299;
    float _2349 = _2345;
    float _2351 = _2345;
    if (!_2347)
    {
        bool _2353 = _2277 > _2199;
        if (_2353)
        {
            _2311 = _2199;
        }
        float _2355 = _2311;
        _2317 = _2355;
        if (!_2353)
        {
            _2335 = _2279;
        }
        float _2357 = _2335;
        float _2359 = _2357;
        if (!_2353)
        {
            _2341 = _2281;
        }
        float _2361 = _2341;
        float _2363 = _2361;
        if (!_2353)
        {
            _2349 = _2283;
        }
        float _2365 = _2349;
        float _2367 = _2365;
        if (!_2353)
        {
            _2219 = _2275;
        }
        float _2369 = _2219;
        float _2371 = _2369;
        if (_2353)
        {
            _2359 = _2279;
        }
        float _2373 = _2359;
        _2337 = _2373;
        if (_2353)
        {
            _2363 = _2281;
        }
        float _2375 = _2363;
        _2343 = _2375;
        if (_2353)
        {
            _2367 = _2283;
        }
        float _2377 = _2367;
        _2351 = _2377;
        if (_2353)
        {
            _2371 = _2275;
        }
        float _2379 = _2371;
        _2221 = _2379;
        if (_2353)
        {
            _2313 = _569;
        }
        float _2381 = _2313;
        _2319 = _2381;
        if (_2353)
        {
            _2315 = _571;
        }
        float _2383 = _2315;
        _2321 = _2383;
        if (_2353)
        {
            _2323 = _573;
        }
    }
    float _2385 = _2221;
    float _2387 = _2317;
    float _2389 = _2337;
    float _2391 = _2343;
    float _2393 = _2351;
    float _2395 = _2319;
    float _2397 = _2321;
    float _2399 = _2323;
    bool _2401 = _2385 >= _2305;
    bool _2403 = isnan(_2385);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan(_2305);
    bool _2409 = _2405 || _2407;
    float _2411 = _599 * _1249;
    float _2413 = fma(_597, _1251, _2411);
    float _2415 = fma(_601, _1253, _2413);
    float _2417 = _2413;
    float _2419 = _2387;
    float _2421 = _2395;
    float _2423 = _2397;
    float _2425 = _2387;
    float _2427 = _2395;
    float _2429 = _2397;
    float _2431 = _2399;
    float _2433 = _2389;
    float _2435 = _2415;
    float _2437 = _2415;
    if (!_2409)
    {
        _2325 = _589;
    }
    float _2439 = _2325;
    float _2441 = _2439;
    float _2443 = _2439;
    if (!_2409)
    {
        _2327 = _591;
    }
    float _2445 = _2327;
    float _2447 = _2445;
    float _2449 = _2445;
    if (!_2409)
    {
        _2417 = _593;
    }
    float _2451 = _2417;
    bool _2453 = !_2409;
    float _2455 = _2451;
    float _2457 = _2451;
    if (!_2453)
    {
        bool _2459 = _2387 > _2305;
        if (_2459)
        {
            _2419 = _2305;
        }
        float _2461 = _2419;
        _2425 = _2461;
        if (!_2459)
        {
            _2441 = _2389;
        }
        float _2463 = _2441;
        float _2465 = _2463;
        if (!_2459)
        {
            _2447 = _2391;
        }
        float _2467 = _2447;
        float _2469 = _2467;
        if (!_2459)
        {
            _2455 = _2393;
        }
        float _2471 = _2455;
        float _2473 = _2471;
        if (!_2459)
        {
            _2329 = _2385;
        }
        float _2475 = _2329;
        float _2477 = _2475;
        if (_2459)
        {
            _2465 = _2389;
        }
        float _2479 = _2465;
        _2443 = _2479;
        if (_2459)
        {
            _2469 = _2391;
        }
        float _2481 = _2469;
        _2449 = _2481;
        if (_2459)
        {
            _2473 = _2393;
        }
        float _2483 = _2473;
        _2457 = _2483;
        if (_2459)
        {
            _2477 = _2385;
        }
        float _2485 = _2477;
        _2331 = _2485;
        if (_2459)
        {
            _2421 = _589;
        }
        float _2487 = _2421;
        _2427 = _2487;
        if (_2459)
        {
            _2423 = _591;
        }
        float _2489 = _2423;
        _2429 = _2489;
        if (_2459)
        {
            _2431 = _593;
        }
    }
    float _2491 = _2331;
    float _2493 = _2425;
    float _2495 = _2443;
    float _2497 = _2449;
    float _2499 = _2457;
    float _2501 = _2427;
    float _2503 = _2429;
    float _2505 = _2431;
    bool _2507 = _2491 >= _2415;
    bool _2509 = isnan(_2491);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(_2415);
    bool _2515 = _2511 || _2513;
    float _2517 = _607 * _1249;
    float _2519 = fma(_605, _1251, _2517);
    float _2521 = fma(_609, _1253, _2519);
    float _2523 = _2517;
    float _2525 = _2519;
    float _2527 = _2493;
    float _2529 = _2501;
    float _2531 = _2503;
    float _2533 = _2493;
    float _2535 = _2501;
    float _2537 = _2503;
    float _2539 = _2505;
    float _2541 = _2495;
    float _2543 = _2497;
    float _2545 = _2521;
    float _2547 = _2521;
    if (!_2515)
    {
        _2433 = _597;
    }
    float _2549 = _2433;
    float _2551 = _2549;
    float _2553 = _2549;
    if (!_2515)
    {
        _2523 = _599;
    }
    float _2555 = _2523;
    float _2557 = _2555;
    float _2559 = _2555;
    if (!_2515)
    {
        _2525 = _601;
    }
    float _2561 = _2525;
    bool _2563 = !_2515;
    float _2565 = _2561;
    float _2567 = _2561;
    if (!_2563)
    {
        bool _2569 = _2493 > _2415;
        if (_2569)
        {
            _2527 = _2415;
        }
        float _2571 = _2527;
        _2533 = _2571;
        if (!_2569)
        {
            _2551 = _2495;
        }
        float _2573 = _2551;
        float _2575 = _2573;
        if (!_2569)
        {
            _2557 = _2497;
        }
        float _2577 = _2557;
        float _2579 = _2577;
        if (!_2569)
        {
            _2565 = _2499;
        }
        float _2581 = _2565;
        float _2583 = _2581;
        if (!_2569)
        {
            _2435 = _2491;
        }
        float _2585 = _2435;
        float _2587 = _2585;
        if (_2569)
        {
            _2575 = _2495;
        }
        float _2589 = _2575;
        _2553 = _2589;
        if (_2569)
        {
            _2579 = _2497;
        }
        float _2591 = _2579;
        _2559 = _2591;
        if (_2569)
        {
            _2583 = _2499;
        }
        float _2593 = _2583;
        _2567 = _2593;
        if (_2569)
        {
            _2587 = _2491;
        }
        float _2595 = _2587;
        _2437 = _2595;
        if (_2569)
        {
            _2529 = _597;
        }
        float _2597 = _2529;
        _2535 = _2597;
        if (_2569)
        {
            _2531 = _599;
        }
        float _2599 = _2531;
        _2537 = _2599;
        if (_2569)
        {
            _2539 = _601;
        }
    }
    float _2601 = _2437;
    float _2603 = _2533;
    float _2605 = _2553;
    float _2607 = _2559;
    float _2609 = _2567;
    float _2611 = _2535;
    float _2613 = _2537;
    float _2615 = _2539;
    bool _2617 = _2601 >= _2521;
    bool _2619 = isnan(_2601);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(_2521);
    bool _2625 = _2621 || _2623;
    float _2627 = _615 * _1249;
    float _2629 = fma(_613, _1251, _2627);
    float _2631 = fma(_617, _1253, _2629);
    float _2633 = _2629;
    float _2635 = _2603;
    float _2637 = _2611;
    float _2639 = _2613;
    float _2641 = _2611;
    float _2643 = _2603;
    float _2645 = _2613;
    float _2647 = _2615;
    float _2649 = _2609;
    float _2651 = _2631;
    float _2653 = _2631;
    if (!_2625)
    {
        _2541 = _605;
    }
    float _2655 = _2541;
    float _2657 = _2655;
    float _2659 = _2655;
    if (!_2625)
    {
        _2543 = _607;
    }
    float _2661 = _2543;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2625)
    {
        _2633 = _609;
    }
    float _2667 = _2633;
    bool _2669 = !_2625;
    float _2671 = _2667;
    float _2673 = _2667;
    if (!_2669)
    {
        bool _2675 = _2603 > _2521;
        if (_2675)
        {
            _2635 = _2521;
        }
        float _2677 = _2635;
        _2643 = _2677;
        if (!_2675)
        {
            _2657 = _2605;
        }
        float _2679 = _2657;
        float _2681 = _2679;
        if (!_2675)
        {
            _2663 = _2607;
        }
        float _2683 = _2663;
        float _2685 = _2683;
        if (!_2675)
        {
            _2671 = _2609;
        }
        float _2687 = _2671;
        float _2689 = _2687;
        if (!_2675)
        {
            _2545 = _2601;
        }
        float _2691 = _2545;
        float _2693 = _2691;
        if (_2675)
        {
            _2681 = _2605;
        }
        float _2695 = _2681;
        _2659 = _2695;
        if (_2675)
        {
            _2685 = _2607;
        }
        float _2697 = _2685;
        _2665 = _2697;
        if (_2675)
        {
            _2689 = _2609;
        }
        float _2699 = _2689;
        _2673 = _2699;
        if (_2675)
        {
            _2693 = _2601;
        }
        float _2701 = _2693;
        _2547 = _2701;
        if (_2675)
        {
            _2637 = _605;
        }
        float _2703 = _2637;
        _2641 = _2703;
        if (_2675)
        {
            _2639 = _607;
        }
        float _2705 = _2639;
        _2645 = _2705;
        if (_2675)
        {
            _2647 = _609;
        }
    }
    float _2707 = _2547;
    float _2709 = _2641;
    float _2711 = _2643;
    float _2713 = _2659;
    float _2715 = _2665;
    float _2717 = _2673;
    float _2719 = _2645;
    float _2721 = _2647;
    bool _2723 = _2707 >= _2631;
    bool _2725 = isnan(_2707);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan(_2631);
    bool _2731 = _2727 || _2729;
    float _2733 = _623 * _1249;
    float _2735 = fma(_621, _1251, _2733);
    float _2737 = fma(_625, _1253, _2735);
    float _2739 = _2733;
    float _2741 = _2711;
    float _2743 = _2719;
    float _2745 = _2719;
    float _2747 = _2721;
    float _2749 = _2711;
    float _2751 = _2713;
    float _2753 = _2715;
    if (!_2731)
    {
        _2649 = _2709;
    }
    float _2755 = _2649;
    float _2757 = _2755;
    float _2759 = _2755;
    if (!_2731)
    {
        _1309 = _613;
    }
    float _2761 = _1309;
    float _2763 = _2761;
    float _2765 = _2761;
    if (!_2731)
    {
        _1311 = _615;
    }
    float _2767 = _1311;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2731)
    {
        _2739 = _617;
    }
    float _2773 = _2739;
    bool _2775 = !_2731;
    float _2777 = _2773;
    float _2779 = _2773;
    if (!_2775)
    {
        bool _2781 = _2711 > _2631;
        if (_2781)
        {
            _2741 = _2631;
        }
        float _2783 = _2741;
        _2749 = _2783;
        if (!_2781)
        {
            _2763 = _2713;
        }
        float _2785 = _2763;
        float _2787 = _2785;
        if (!_2781)
        {
            _2769 = _2715;
        }
        float _2789 = _2769;
        float _2791 = _2789;
        if (!_2781)
        {
            _2777 = _2717;
        }
        float _2793 = _2777;
        float _2795 = _2793;
        if (!_2781)
        {
            _2651 = _2707;
        }
        float _2797 = _2651;
        float _2799 = _2797;
        if (!_2781)
        {
            _2757 = _2709;
        }
        float _2801 = _2757;
        float _2803 = _2801;
        if (_2781)
        {
            _2787 = _2713;
        }
        float _2805 = _2787;
        _2765 = _2805;
        if (_2781)
        {
            _2791 = _2715;
        }
        float _2807 = _2791;
        _2771 = _2807;
        if (_2781)
        {
            _2795 = _2717;
        }
        float _2809 = _2795;
        _2779 = _2809;
        if (_2781)
        {
            _2799 = _2707;
        }
        float _2811 = _2799;
        _2653 = _2811;
        if (_2781)
        {
            _2803 = _613;
        }
        float _2813 = _2803;
        _2759 = _2813;
        if (_2781)
        {
            _2743 = _615;
        }
        float _2815 = _2743;
        _2745 = _2815;
        if (_2781)
        {
            _2747 = _617;
        }
    }
    float _2817 = _2653;
    float _2819 = _2745;
    float _2821 = _2747;
    float _2823 = _2749;
    float _2825 = _2765;
    float _2827 = _2771;
    float _2829 = _2779;
    float _2831 = _2759;
    bool _2833 = _2817 >= _2737;
    bool _2835 = isnan(_2817);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan(_2737);
    bool _2841 = _2837 || _2839;
    float _2843 = _2831;
    float _2845 = _2831;
    if (!_2841)
    {
        _2751 = _2819;
    }
    float _2847 = _2751;
    float _2849 = _2847;
    float _2851 = _2847;
    if (!_2841)
    {
        _2753 = _2821;
    }
    float _2853 = _2753;
    float _2855 = 0.0;
    float _2857 = _2853;
    float _2859 = _2853;
    if (!_2841)
    {
        _2855 = _621;
    }
    float _2861 = _2855;
    float _2863 = _2861;
    float _2865 = _2861;
    if (!_2841)
    {
        _1313 = _623;
    }
    float _2867 = _1313;
    float _2869 = _2867;
    float _2871 = _2867;
    if (!_2841)
    {
        _1315 = _625;
    }
    float _2873 = _1315;
    bool _2875 = !_2841;
    float _2877 = _2873;
    float _2879 = _2873;
    if (!_2875)
    {
        bool _2881 = _2823 > _2737;
        if (!_2881)
        {
            _2863 = _2825;
        }
        float _2883 = _2863;
        float _2885 = _2883;
        if (!_2881)
        {
            _2869 = _2827;
        }
        float _2887 = _2869;
        float _2889 = _2887;
        if (!_2881)
        {
            _2877 = _2829;
        }
        float _2891 = _2877;
        float _2893 = _2891;
        if (!_2881)
        {
            _2849 = _2819;
        }
        float _2895 = _2849;
        float _2897 = _2895;
        if (!_2881)
        {
            _2857 = _2821;
        }
        float _2899 = _2857;
        _2859 = _2899;
        if (_2881)
        {
            _2885 = _2825;
        }
        float _2901 = _2885;
        _2865 = _2901;
        if (_2881)
        {
            _2889 = _2827;
        }
        float _2903 = _2889;
        _2871 = _2903;
        if (_2881)
        {
            _2893 = _2829;
        }
        float _2905 = _2893;
        _2879 = _2905;
        if (_2881)
        {
            _2843 = _621;
        }
        float _2907 = _2843;
        _2845 = _2907;
        if (_2881)
        {
            _2897 = _623;
        }
        float _2909 = _2897;
        _2851 = _2909;
        if (_2881)
        {
            _2859 = _625;
        }
    }
    float _2911 = _2851;
    float _2913 = _2871;
    float _2915 = _2845;
    float _2917 = _2865;
    float _2919 = _2859;
    float _2921 = _2879;
    float _2923 = -_2911;
    float _2925 = _2913 + _2923;
    float _2927 = -_2915;
    float _2929 = _2917 + _2927;
    float _2931 = -_2919;
    float _2933 = _2921 + _2931;
    float _2935 = -_2915;
    float _2937 = _333 + _2935;
    float _2939 = _2925 * _2925;
    float _2941 = fma(_2929, _2929, _2939);
    float _2943 = fma(_2933, _2933, _2941);
    float _2945 = -_2911;
    float _2947 = _335 + _2945;
    float _2949 = _2925 * _2947;
    float _2951 = 1.0 / _2943;
    float _2953 = -_2919;
    float _2955 = _337 + _2953;
    float _2957 = fma(_2929, _2937, _2949);
    float _2959 = fma(_2933, _2955, _2957);
    float _2961 = _2951 * 3.0;
    float _2963 = _2961 * _2959;
    float _2965 = rint(_2963);
    float _2967 = precise::max(0.0, _2965);
    float _2969 = precise::min(_2967, 3.0);
    float _2971 = trunc(_2969);
    int _2974 = int(_2971);
    bool _2976 = _2974 >= 2;
    bool _2978 = !_2976;
    float _2980 = _2929;
    float _2982 = _2925;
    float _2984 = _2933;
    float _2986 = _2915;
    float _2988 = _2917;
    float _2990 = _2911;
    float _2992 = _2913;
    float _2994 = _2921;
    float _2996 = _2919;
    float _3006;
    float _3008;
    float _3010;
    float _3012;
    float _3014;
    float _3016;
    float _3018;
    float _3020;
    float _3022;
    float _3024;
    float _3026;
    float _3028;
    float _3030;
    float _3032;
    float _3034;
    float _3036;
    if (!_2978)
    {
        bool _2998 = _2974 >= 3;
        bool _3000 = !_2998;
        if (!_3000)
        {
            bool _3002 = _2974 != 3;
            _3004 = _3002;
            if (!_3004)
            {
                _3006 = _333;
                _3008 = _335;
                _3010 = _337;
                _3012 = 1.0;
                _3014 = 0.0;
                _3016 = 0.0;
                _3018 = 0.0;
                _3020 = 0.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
        }
        else
        {
            _3006 = 0.0;
            _3008 = 0.0;
            _3010 = 0.0;
            _3012 = 0.0;
            _3014 = 0.0;
            _3016 = 0.0;
            _3018 = 0.0;
            _3020 = 0.0;
            _3022 = _333;
            _3024 = _335;
            _3026 = _337;
            _3028 = 1.0;
            _3030 = 0.0;
            _3032 = 0.0;
            _3034 = 0.0;
            _3036 = 0.0;
            _3038 = true;
        }
    }
    if ((!_3038) || _3004)
    {
        bool _3040;
        if (!_3004)
        {
            _3040 = _2974 >= 1;
        }
        if ((!_3040) || _3004)
        {
            bool _3042;
            if (!_3004)
            {
                _3042 = _2974 != 0;
            }
            if ((!_3042) && (!_3004))
            {
                _3006 = 0.0;
                _3008 = 0.0;
                _3010 = 0.0;
                _3012 = 0.0;
                _3014 = _333;
                _3016 = _335;
                _3018 = _337;
                _3020 = 1.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
            else
            {
                _3004 = false;
                _3006 = 0.0;
                _3008 = 0.0;
                _3010 = 0.0;
                _3012 = 0.0;
                _3014 = 0.0;
                _3016 = 0.0;
                _3018 = 0.0;
                _3020 = 0.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
        }
        else
        {
            _3006 = 0.0;
            _3008 = 0.0;
            _3010 = 0.0;
            _3012 = 0.0;
            _3014 = 0.0;
            _3016 = 0.0;
            _3018 = 0.0;
            _3020 = 0.0;
            _3022 = 0.0;
            _3024 = 0.0;
            _3026 = 0.0;
            _3028 = 0.0;
            _3030 = _333;
            _3032 = _335;
            _3034 = _337;
            _3036 = 1.0;
        }
    }
    _3038 = false;
    float _3044 = _3006;
    float _3046 = _3008;
    float _3048 = _3010;
    float _3050 = _3012;
    float _3052 = _3014;
    float _3054 = _3016;
    float _3056 = _3018;
    float _3058 = _3020;
    float _3060 = _3022;
    float _3062 = _3024;
    float _3064 = _3026;
    float _3066 = _3028;
    float _3068 = _3030;
    float _3070 = _3032;
    float _3072 = _3034;
    float _3074 = _3036;
    float _3076 = -_2911;
    float _3078 = _343 + _3076;
    float _3080 = -_2915;
    float _3082 = _341 + _3080;
    float _3084 = _2925 * _3078;
    float _3086 = -_2919;
    float _3088 = _345 + _3086;
    float _3090 = fma(_2929, _3082, _3084);
    float _3092 = fma(_2933, _3088, _3090);
    float _3094 = _2961 * _3092;
    float _3096 = rint(_3094);
    float _3098 = precise::max(0.0, _3096);
    float _3100 = precise::min(_3098, 3.0);
    float _3102 = trunc(_3100);
    int _3104 = int(_3102);
    bool _3106 = _3104 >= 2;
    bool _3108 = !_3106;
    float _3110 = _3096;
    float _3112 = as_type<float>(_3104);
    float _3114 = _3084;
    float _3116 = _3090;
    float _3118 = _3044;
    float _3120 = _3046;
    float _3122 = _3048;
    float _3124 = _3050;
    float _3126 = _3060;
    float _3128 = _3062;
    float _3130 = _3064;
    float _3132 = _3066;
    float _3134 = _3068;
    float _3136 = _3070;
    float _3138 = _3072;
    float _3140 = _3074;
    float _3158;
    float _3160;
    float _3162;
    float _3164;
    if (!_3108)
    {
        bool _3142 = _3104 >= 3;
        bool _3144 = !_3142;
        if (!_3144)
        {
            bool _3146 = _3104 != 3;
            _3148 = _3146;
            if (!_3148)
            {
                float _3150 = _341 + _3044;
                float _3152 = _343 + _3046;
                float _3154 = _345 + _3048;
                float _3156 = _3050 + 1.0;
                _3118 = _3150;
                _3120 = _3152;
                _3122 = _3154;
                _3124 = _3156;
                _3158 = _3052;
                _3160 = _3054;
                _3162 = _3056;
                _3164 = _3058;
                _3166 = true;
            }
        }
        else
        {
            float _3168 = _341 + _3060;
            float _3170 = _343 + _3062;
            float _3172 = _345 + _3064;
            float _3174 = _3066 + 1.0;
            _3158 = _3052;
            _3160 = _3054;
            _3162 = _3056;
            _3164 = _3058;
            _3126 = _3168;
            _3128 = _3170;
            _3130 = _3172;
            _3132 = _3174;
            _3166 = true;
        }
    }
    if ((!_3166) || _3148)
    {
        bool _3176;
        if (!_3148)
        {
            _3176 = _3104 >= 1;
        }
        if ((!_3176) || _3148)
        {
            if (!_3148)
            {
                bool _3178 = _3104 != 0;
                if (!_3178)
                {
                    float _3180 = _341 + _3052;
                    _3110 = _3180;
                }
                float _3182 = _3110;
                _3158 = _3182;
                if (!_3178)
                {
                    float _3184 = _343 + _3054;
                    _3112 = _3184;
                }
                float _3186 = _3112;
                _3160 = _3186;
                if (!_3178)
                {
                    float _3188 = _345 + _3056;
                    _3114 = _3188;
                }
                float _3190 = _3114;
                _3162 = _3190;
                if (!_3178)
                {
                    float _3192 = _3058 + 1.0;
                    _3116 = _3192;
                }
                float _3194 = _3116;
                bool _3196 = !_3178;
                _3164 = _3194;
                _3166 = _3196;
            }
            if ((!_3166) || _3148)
            {
                _3148 = false;
                _3158 = _3052;
                _3160 = _3054;
                _3162 = _3056;
                _3164 = _3058;
                _3166 = true;
            }
        }
        else
        {
            float _3198 = _341 + _3068;
            float _3200 = _343 + _3070;
            float _3202 = _345 + _3072;
            float _3204 = _3074 + 1.0;
            _3158 = _3052;
            _3160 = _3054;
            _3162 = _3056;
            _3164 = _3058;
            _3134 = _3198;
            _3136 = _3200;
            _3138 = _3202;
            _3140 = _3204;
        }
    }
    _3166 = false;
    float _3206 = _3118;
    float _3208 = _3120;
    float _3210 = _3122;
    float _3212 = _3124;
    float _3214 = _3158;
    float _3216 = _3160;
    float _3218 = _3162;
    float _3220 = _3164;
    float _3222 = _3126;
    float _3224 = _3128;
    float _3226 = _3130;
    float _3228 = _3132;
    float _3230 = _3134;
    float _3232 = _3136;
    float _3234 = _3138;
    float _3236 = _3140;
    float _3238 = -_2911;
    float _3240 = _395 + _3238;
    float _3242 = -_2915;
    float _3244 = _393 + _3242;
    float _3246 = _2925 * _3240;
    float _3248 = -_2919;
    float _3250 = _397 + _3248;
    float _3252 = fma(_2929, _3244, _3246);
    float _3254 = fma(_2933, _3250, _3252);
    float _3256 = _2961 * _3254;
    float _3258 = rint(_3256);
    float _3260 = precise::max(0.0, _3258);
    float _3262 = precise::min(_3260, 3.0);
    float _3264 = trunc(_3262);
    int _3266 = int(_3264);
    bool _3268 = _3266 >= 2;
    bool _3270 = !_3268;
    float _3272 = _3258;
    float _3274 = as_type<float>(_3266);
    float _3276 = _3246;
    float _3278 = _3252;
    float _3280 = _3206;
    float _3282 = _3208;
    float _3284 = _3210;
    float _3286 = _3212;
    float _3288 = _3222;
    float _3290 = _3224;
    float _3292 = _3226;
    float _3294 = _3228;
    float _3296 = _3230;
    float _3298 = _3232;
    float _3300 = _3234;
    float _3302 = _3236;
    float _3320;
    float _3322;
    float _3324;
    float _3326;
    if (!_3270)
    {
        bool _3304 = _3266 >= 3;
        bool _3306 = !_3304;
        if (!_3306)
        {
            bool _3308 = _3266 != 3;
            _3310 = _3308;
            if (!_3310)
            {
                float _3312 = _393 + _3206;
                float _3314 = _395 + _3208;
                float _3316 = _397 + _3210;
                float _3318 = _3212 + 1.0;
                _3280 = _3312;
                _3282 = _3314;
                _3284 = _3316;
                _3286 = _3318;
                _3320 = _3214;
                _3322 = _3216;
                _3324 = _3218;
                _3326 = _3220;
                _3328 = true;
            }
        }
        else
        {
            float _3330 = _393 + _3222;
            float _3332 = _395 + _3224;
            float _3334 = _397 + _3226;
            float _3336 = _3228 + 1.0;
            _3320 = _3214;
            _3322 = _3216;
            _3324 = _3218;
            _3326 = _3220;
            _3288 = _3330;
            _3290 = _3332;
            _3292 = _3334;
            _3294 = _3336;
            _3328 = true;
        }
    }
    if ((!_3328) || _3310)
    {
        bool _3338;
        if (!_3310)
        {
            _3338 = _3266 >= 1;
        }
        if ((!_3338) || _3310)
        {
            if (!_3310)
            {
                bool _3340 = _3266 != 0;
                if (!_3340)
                {
                    float _3342 = _393 + _3214;
                    _3272 = _3342;
                }
                float _3344 = _3272;
                _3320 = _3344;
                if (!_3340)
                {
                    float _3346 = _395 + _3216;
                    _3274 = _3346;
                }
                float _3348 = _3274;
                _3322 = _3348;
                if (!_3340)
                {
                    float _3350 = _397 + _3218;
                    _3276 = _3350;
                }
                float _3352 = _3276;
                _3324 = _3352;
                if (!_3340)
                {
                    float _3354 = _3220 + 1.0;
                    _3278 = _3354;
                }
                float _3356 = _3278;
                bool _3358 = !_3340;
                _3326 = _3356;
                _3328 = _3358;
            }
            if ((!_3328) || _3310)
            {
                _3310 = false;
                _3320 = _3214;
                _3322 = _3216;
                _3324 = _3218;
                _3326 = _3220;
                _3328 = true;
            }
        }
        else
        {
            float _3360 = _393 + _3230;
            float _3362 = _395 + _3232;
            float _3364 = _397 + _3234;
            float _3366 = _3236 + 1.0;
            _3320 = _3214;
            _3322 = _3216;
            _3324 = _3218;
            _3326 = _3220;
            _3296 = _3360;
            _3298 = _3362;
            _3300 = _3364;
            _3302 = _3366;
        }
    }
    _3328 = false;
    float _3368 = _3280;
    float _3370 = _3282;
    float _3372 = _3284;
    float _3374 = _3286;
    float _3376 = _3320;
    float _3378 = _3322;
    float _3380 = _3324;
    float _3382 = _3326;
    float _3384 = _3288;
    float _3386 = _3290;
    float _3388 = _3292;
    float _3390 = _3294;
    float _3392 = _3296;
    float _3394 = _3298;
    float _3396 = _3300;
    float _3398 = _3302;
    float _3400 = -_2911;
    float _3402 = _429 + _3400;
    float _3404 = -_2915;
    float _3406 = _427 + _3404;
    float _3408 = _2925 * _3402;
    float _3410 = -_2919;
    float _3412 = _431 + _3410;
    float _3414 = fma(_2929, _3406, _3408);
    float _3416 = fma(_2933, _3412, _3414);
    float _3418 = _2961 * _3416;
    float _3420 = rint(_3418);
    float _3422 = precise::max(0.0, _3420);
    float _3424 = precise::min(_3422, 3.0);
    float _3426 = trunc(_3424);
    int _3428 = int(_3426);
    bool _3430 = _3428 >= 2;
    bool _3432 = !_3430;
    float _3434 = _3420;
    float _3436 = as_type<float>(_3428);
    float _3438 = _3408;
    float _3440 = _3414;
    float _3442 = _3368;
    float _3444 = _3370;
    float _3446 = _3372;
    float _3448 = _3374;
    float _3450 = _3384;
    float _3452 = _3386;
    float _3454 = _3388;
    float _3456 = _3390;
    float _3458 = _3392;
    float _3460 = _3394;
    float _3462 = _3396;
    float _3464 = _3398;
    float _3482;
    float _3484;
    float _3486;
    float _3488;
    if (!_3432)
    {
        bool _3466 = _3428 >= 3;
        bool _3468 = !_3466;
        if (!_3468)
        {
            bool _3470 = _3428 != 3;
            _3472 = _3470;
            if (!_3472)
            {
                float _3474 = _427 + _3368;
                float _3476 = _429 + _3370;
                float _3478 = _431 + _3372;
                float _3480 = _3374 + 1.0;
                _3442 = _3474;
                _3444 = _3476;
                _3446 = _3478;
                _3448 = _3480;
                _3482 = _3376;
                _3484 = _3378;
                _3486 = _3380;
                _3488 = _3382;
                _3490 = true;
            }
        }
        else
        {
            float _3492 = _427 + _3384;
            float _3494 = _429 + _3386;
            float _3496 = _431 + _3388;
            float _3498 = _3390 + 1.0;
            _3482 = _3376;
            _3484 = _3378;
            _3486 = _3380;
            _3488 = _3382;
            _3450 = _3492;
            _3452 = _3494;
            _3454 = _3496;
            _3456 = _3498;
            _3490 = true;
        }
    }
    if ((!_3490) || _3472)
    {
        bool _3500;
        if (!_3472)
        {
            _3500 = _3428 >= 1;
        }
        if ((!_3500) || _3472)
        {
            if (!_3472)
            {
                bool _3502 = _3428 != 0;
                if (!_3502)
                {
                    float _3504 = _427 + _3376;
                    _3434 = _3504;
                }
                float _3506 = _3434;
                _3482 = _3506;
                if (!_3502)
                {
                    float _3508 = _429 + _3378;
                    _3436 = _3508;
                }
                float _3510 = _3436;
                _3484 = _3510;
                if (!_3502)
                {
                    float _3512 = _431 + _3380;
                    _3438 = _3512;
                }
                float _3514 = _3438;
                _3486 = _3514;
                if (!_3502)
                {
                    float _3516 = _3382 + 1.0;
                    _3440 = _3516;
                }
                float _3518 = _3440;
                bool _3520 = !_3502;
                _3488 = _3518;
                _3490 = _3520;
            }
            if ((!_3490) || _3472)
            {
                _3472 = false;
                _3482 = _3376;
                _3484 = _3378;
                _3486 = _3380;
                _3488 = _3382;
                _3490 = true;
            }
        }
        else
        {
            float _3522 = _427 + _3392;
            float _3524 = _429 + _3394;
            float _3526 = _431 + _3396;
            float _3528 = _3398 + 1.0;
            _3482 = _3376;
            _3484 = _3378;
            _3486 = _3380;
            _3488 = _3382;
            _3458 = _3522;
            _3460 = _3524;
            _3462 = _3526;
            _3464 = _3528;
        }
    }
    _3490 = false;
    float _3530 = _3442;
    float _3532 = _3444;
    float _3534 = _3446;
    float _3536 = _3448;
    float _3538 = _3482;
    float _3540 = _3484;
    float _3542 = _3486;
    float _3544 = _3488;
    float _3546 = _3450;
    float _3548 = _3452;
    float _3550 = _3454;
    float _3552 = _3456;
    float _3554 = _3458;
    float _3556 = _3460;
    float _3558 = _3462;
    float _3560 = _3464;
    float _3562 = -_2911;
    float _3564 = _437 + _3562;
    float _3566 = -_2915;
    float _3568 = _435 + _3566;
    float _3570 = _2925 * _3564;
    float _3572 = -_2919;
    float _3574 = _439 + _3572;
    float _3576 = fma(_2929, _3568, _3570);
    float _3578 = fma(_2933, _3574, _3576);
    float _3580 = _2961 * _3578;
    float _3582 = rint(_3580);
    float _3584 = precise::max(0.0, _3582);
    float _3586 = precise::min(_3584, 3.0);
    float _3588 = trunc(_3586);
    int _3590 = int(_3588);
    bool _3592 = _3590 >= 2;
    bool _3594 = !_3592;
    float _3596 = _3582;
    float _3598 = as_type<float>(_3590);
    float _3600 = _3570;
    float _3602 = _3576;
    float _3604 = _3530;
    float _3606 = _3532;
    float _3608 = _3534;
    float _3610 = _3536;
    float _3612 = _3546;
    float _3614 = _3548;
    float _3616 = _3550;
    float _3618 = _3552;
    float _3620 = _3554;
    float _3622 = _3556;
    float _3624 = _3558;
    float _3626 = _3560;
    float _3644;
    float _3646;
    float _3648;
    float _3650;
    if (!_3594)
    {
        bool _3628 = _3590 >= 3;
        bool _3630 = !_3628;
        if (!_3630)
        {
            bool _3632 = _3590 != 3;
            _3634 = _3632;
            if (!_3634)
            {
                float _3636 = _435 + _3530;
                float _3638 = _437 + _3532;
                float _3640 = _439 + _3534;
                float _3642 = _3536 + 1.0;
                _3604 = _3636;
                _3606 = _3638;
                _3608 = _3640;
                _3610 = _3642;
                _3644 = _3538;
                _3646 = _3540;
                _3648 = _3542;
                _3650 = _3544;
                _3652 = true;
            }
        }
        else
        {
            float _3654 = _435 + _3546;
            float _3656 = _437 + _3548;
            float _3658 = _439 + _3550;
            float _3660 = _3552 + 1.0;
            _3644 = _3538;
            _3646 = _3540;
            _3648 = _3542;
            _3650 = _3544;
            _3612 = _3654;
            _3614 = _3656;
            _3616 = _3658;
            _3618 = _3660;
            _3652 = true;
        }
    }
    if ((!_3652) || _3634)
    {
        bool _3662;
        if (!_3634)
        {
            _3662 = _3590 >= 1;
        }
        if ((!_3662) || _3634)
        {
            if (!_3634)
            {
                bool _3664 = _3590 != 0;
                if (!_3664)
                {
                    float _3666 = _435 + _3538;
                    _3596 = _3666;
                }
                float _3668 = _3596;
                _3644 = _3668;
                if (!_3664)
                {
                    float _3670 = _437 + _3540;
                    _3598 = _3670;
                }
                float _3672 = _3598;
                _3646 = _3672;
                if (!_3664)
                {
                    float _3674 = _439 + _3542;
                    _3600 = _3674;
                }
                float _3676 = _3600;
                _3648 = _3676;
                if (!_3664)
                {
                    float _3678 = _3544 + 1.0;
                    _3602 = _3678;
                }
                float _3680 = _3602;
                bool _3682 = !_3664;
                _3650 = _3680;
                _3652 = _3682;
            }
            if ((!_3652) || _3634)
            {
                _3634 = false;
                _3644 = _3538;
                _3646 = _3540;
                _3648 = _3542;
                _3650 = _3544;
                _3652 = true;
            }
        }
        else
        {
            float _3684 = _435 + _3554;
            float _3686 = _437 + _3556;
            float _3688 = _439 + _3558;
            float _3690 = _3560 + 1.0;
            _3644 = _3538;
            _3646 = _3540;
            _3648 = _3542;
            _3650 = _3544;
            _3620 = _3684;
            _3622 = _3686;
            _3624 = _3688;
            _3626 = _3690;
        }
    }
    _3652 = false;
    float _3692 = _3604;
    float _3694 = _3606;
    float _3696 = _3608;
    float _3698 = _3610;
    float _3700 = _3644;
    float _3702 = _3646;
    float _3704 = _3648;
    float _3706 = _3650;
    float _3708 = _3612;
    float _3710 = _3614;
    float _3712 = _3616;
    float _3714 = _3618;
    float _3716 = _3620;
    float _3718 = _3622;
    float _3720 = _3624;
    float _3722 = _3626;
    float _3724 = -_2911;
    float _3726 = _483 + _3724;
    float _3728 = -_2915;
    float _3730 = _481 + _3728;
    float _3732 = _2925 * _3726;
    float _3734 = -_2919;
    float _3736 = _485 + _3734;
    float _3738 = fma(_2929, _3730, _3732);
    float _3740 = fma(_2933, _3736, _3738);
    float _3742 = _2961 * _3740;
    float _3744 = rint(_3742);
    float _3746 = precise::max(0.0, _3744);
    float _3748 = precise::min(_3746, 3.0);
    float _3750 = trunc(_3748);
    int _3752 = int(_3750);
    bool _3754 = _3752 >= 2;
    bool _3756 = !_3754;
    float _3758 = _3744;
    float _3760 = as_type<float>(_3752);
    float _3762 = _3732;
    float _3764 = _3738;
    float _3766 = _3692;
    float _3768 = _3694;
    float _3770 = _3696;
    float _3772 = _3698;
    float _3774 = _3708;
    float _3776 = _3710;
    float _3778 = _3712;
    float _3780 = _3714;
    float _3782 = _3716;
    float _3784 = _3718;
    float _3786 = _3720;
    float _3788 = _3722;
    float _3806;
    float _3808;
    float _3810;
    float _3812;
    if (!_3756)
    {
        bool _3790 = _3752 >= 3;
        bool _3792 = !_3790;
        if (!_3792)
        {
            bool _3794 = _3752 != 3;
            _3796 = _3794;
            if (!_3796)
            {
                float _3798 = _481 + _3692;
                float _3800 = _483 + _3694;
                float _3802 = _485 + _3696;
                float _3804 = _3698 + 1.0;
                _3766 = _3798;
                _3768 = _3800;
                _3770 = _3802;
                _3772 = _3804;
                _3806 = _3700;
                _3808 = _3702;
                _3810 = _3704;
                _3812 = _3706;
                _3814 = true;
            }
        }
        else
        {
            float _3816 = _481 + _3708;
            float _3818 = _483 + _3710;
            float _3820 = _485 + _3712;
            float _3822 = _3714 + 1.0;
            _3806 = _3700;
            _3808 = _3702;
            _3810 = _3704;
            _3812 = _3706;
            _3774 = _3816;
            _3776 = _3818;
            _3778 = _3820;
            _3780 = _3822;
            _3814 = true;
        }
    }
    if ((!_3814) || _3796)
    {
        bool _3824;
        if (!_3796)
        {
            _3824 = _3752 >= 1;
        }
        if ((!_3824) || _3796)
        {
            if (!_3796)
            {
                bool _3826 = _3752 != 0;
                if (!_3826)
                {
                    float _3828 = _481 + _3700;
                    _3758 = _3828;
                }
                float _3830 = _3758;
                _3806 = _3830;
                if (!_3826)
                {
                    float _3832 = _483 + _3702;
                    _3760 = _3832;
                }
                float _3834 = _3760;
                _3808 = _3834;
                if (!_3826)
                {
                    float _3836 = _485 + _3704;
                    _3762 = _3836;
                }
                float _3838 = _3762;
                _3810 = _3838;
                if (!_3826)
                {
                    float _3840 = _3706 + 1.0;
                    _3764 = _3840;
                }
                float _3842 = _3764;
                bool _3844 = !_3826;
                _3812 = _3842;
                _3814 = _3844;
            }
            if ((!_3814) || _3796)
            {
                _3796 = false;
                _3806 = _3700;
                _3808 = _3702;
                _3810 = _3704;
                _3812 = _3706;
                _3814 = true;
            }
        }
        else
        {
            float _3846 = _481 + _3716;
            float _3848 = _483 + _3718;
            float _3850 = _485 + _3720;
            float _3852 = _3722 + 1.0;
            _3806 = _3700;
            _3808 = _3702;
            _3810 = _3704;
            _3812 = _3706;
            _3782 = _3846;
            _3784 = _3848;
            _3786 = _3850;
            _3788 = _3852;
        }
    }
    _3814 = false;
    float _3854 = _3766;
    float _3856 = _3768;
    float _3858 = _3770;
    float _3860 = _3772;
    float _3862 = _3806;
    float _3864 = _3808;
    float _3866 = _3810;
    float _3868 = _3812;
    float _3870 = _3774;
    float _3872 = _3776;
    float _3874 = _3778;
    float _3876 = _3780;
    float _3878 = _3782;
    float _3880 = _3784;
    float _3882 = _3786;
    float _3884 = _3788;
    float _3886 = -_2911;
    float _3888 = _491 + _3886;
    float _3890 = -_2915;
    float _3892 = _489 + _3890;
    float _3894 = _2925 * _3888;
    float _3896 = -_2919;
    float _3898 = _493 + _3896;
    float _3900 = fma(_2929, _3892, _3894);
    float _3902 = fma(_2933, _3898, _3900);
    float _3904 = _2961 * _3902;
    float _3906 = rint(_3904);
    float _3908 = precise::max(0.0, _3906);
    float _3910 = precise::min(_3908, 3.0);
    float _3912 = trunc(_3910);
    int _3914 = int(_3912);
    bool _3916 = _3914 >= 2;
    bool _3918 = !_3916;
    float _3920 = _3906;
    float _3922 = as_type<float>(_3914);
    float _3924 = _3894;
    float _3926 = _3900;
    float _3928 = _3854;
    float _3930 = _3856;
    float _3932 = _3858;
    float _3934 = _3860;
    float _3936 = _3870;
    float _3938 = _3872;
    float _3940 = _3874;
    float _3942 = _3876;
    float _3944 = _3878;
    float _3946 = _3880;
    float _3948 = _3882;
    float _3950 = _3884;
    float _3968;
    float _3970;
    float _3972;
    float _3974;
    if (!_3918)
    {
        bool _3952 = _3914 >= 3;
        bool _3954 = !_3952;
        if (!_3954)
        {
            bool _3956 = _3914 != 3;
            _3958 = _3956;
            if (!_3958)
            {
                float _3960 = _489 + _3854;
                float _3962 = _491 + _3856;
                float _3964 = _493 + _3858;
                float _3966 = _3860 + 1.0;
                _3928 = _3960;
                _3930 = _3962;
                _3932 = _3964;
                _3934 = _3966;
                _3968 = _3862;
                _3970 = _3864;
                _3972 = _3866;
                _3974 = _3868;
                _3976 = true;
            }
        }
        else
        {
            float _3978 = _489 + _3870;
            float _3980 = _491 + _3872;
            float _3982 = _493 + _3874;
            float _3984 = _3876 + 1.0;
            _3968 = _3862;
            _3970 = _3864;
            _3972 = _3866;
            _3974 = _3868;
            _3936 = _3978;
            _3938 = _3980;
            _3940 = _3982;
            _3942 = _3984;
            _3976 = true;
        }
    }
    if ((!_3976) || _3958)
    {
        bool _3986;
        if (!_3958)
        {
            _3986 = _3914 >= 1;
        }
        if ((!_3986) || _3958)
        {
            if (!_3958)
            {
                bool _3988 = _3914 != 0;
                if (!_3988)
                {
                    float _3990 = _489 + _3862;
                    _3920 = _3990;
                }
                float _3992 = _3920;
                _3968 = _3992;
                if (!_3988)
                {
                    float _3994 = _491 + _3864;
                    _3922 = _3994;
                }
                float _3996 = _3922;
                _3970 = _3996;
                if (!_3988)
                {
                    float _3998 = _493 + _3866;
                    _3924 = _3998;
                }
                float _4000 = _3924;
                _3972 = _4000;
                if (!_3988)
                {
                    float _4002 = _3868 + 1.0;
                    _3926 = _4002;
                }
                float _4004 = _3926;
                bool _4006 = !_3988;
                _3974 = _4004;
                _3976 = _4006;
            }
            if ((!_3976) || _3958)
            {
                _3958 = false;
                _3968 = _3862;
                _3970 = _3864;
                _3972 = _3866;
                _3974 = _3868;
                _3976 = true;
            }
        }
        else
        {
            float _4008 = _489 + _3878;
            float _4010 = _491 + _3880;
            float _4012 = _493 + _3882;
            float _4014 = _3884 + 1.0;
            _3968 = _3862;
            _3970 = _3864;
            _3972 = _3866;
            _3974 = _3868;
            _3944 = _4008;
            _3946 = _4010;
            _3948 = _4012;
            _3950 = _4014;
        }
    }
    _3976 = false;
    float _4016 = _3928;
    float _4018 = _3930;
    float _4020 = _3932;
    float _4022 = _3934;
    float _4024 = _3968;
    float _4026 = _3970;
    float _4028 = _3972;
    float _4030 = _3974;
    float _4032 = _3936;
    float _4034 = _3938;
    float _4036 = _3940;
    float _4038 = _3942;
    float _4040 = _3944;
    float _4042 = _3946;
    float _4044 = _3948;
    float _4046 = _3950;
    float _4048 = -_2911;
    float _4050 = _547 + _4048;
    float _4052 = -_2915;
    float _4054 = _545 + _4052;
    float _4056 = _2925 * _4050;
    float _4058 = -_2919;
    float _4060 = _549 + _4058;
    float _4062 = fma(_2929, _4054, _4056);
    float _4064 = fma(_2933, _4060, _4062);
    float _4066 = _2961 * _4064;
    float _4068 = rint(_4066);
    float _4070 = precise::max(0.0, _4068);
    float _4072 = precise::min(_4070, 3.0);
    float _4074 = trunc(_4072);
    int _4076 = int(_4074);
    bool _4078 = _4076 >= 2;
    bool _4080 = !_4078;
    float _4082 = _4068;
    float _4084 = as_type<float>(_4076);
    float _4086 = _4056;
    float _4088 = _4062;
    float _4090 = _4016;
    float _4092 = _4018;
    float _4094 = _4020;
    float _4096 = _4022;
    float _4098 = _4032;
    float _4100 = _4034;
    float _4102 = _4036;
    float _4104 = _4038;
    float _4106 = _4040;
    float _4108 = _4042;
    float _4110 = _4044;
    float _4112 = _4046;
    float _4130;
    float _4132;
    float _4134;
    float _4136;
    if (!_4080)
    {
        bool _4114 = _4076 >= 3;
        bool _4116 = !_4114;
        if (!_4116)
        {
            bool _4118 = _4076 != 3;
            _4120 = _4118;
            if (!_4120)
            {
                float _4122 = _545 + _4016;
                float _4124 = _547 + _4018;
                float _4126 = _549 + _4020;
                float _4128 = _4022 + 1.0;
                _4090 = _4122;
                _4092 = _4124;
                _4094 = _4126;
                _4096 = _4128;
                _4130 = _4024;
                _4132 = _4026;
                _4134 = _4028;
                _4136 = _4030;
                _4138 = true;
            }
        }
        else
        {
            float _4140 = _545 + _4032;
            float _4142 = _547 + _4034;
            float _4144 = _549 + _4036;
            float _4146 = _4038 + 1.0;
            _4130 = _4024;
            _4132 = _4026;
            _4134 = _4028;
            _4136 = _4030;
            _4098 = _4140;
            _4100 = _4142;
            _4102 = _4144;
            _4104 = _4146;
            _4138 = true;
        }
    }
    if ((!_4138) || _4120)
    {
        bool _4148;
        if (!_4120)
        {
            _4148 = _4076 >= 1;
        }
        if ((!_4148) || _4120)
        {
            if (!_4120)
            {
                bool _4150 = _4076 != 0;
                if (!_4150)
                {
                    float _4152 = _545 + _4024;
                    _4082 = _4152;
                }
                float _4154 = _4082;
                _4130 = _4154;
                if (!_4150)
                {
                    float _4156 = _547 + _4026;
                    _4084 = _4156;
                }
                float _4158 = _4084;
                _4132 = _4158;
                if (!_4150)
                {
                    float _4160 = _549 + _4028;
                    _4086 = _4160;
                }
                float _4162 = _4086;
                _4134 = _4162;
                if (!_4150)
                {
                    float _4164 = _4030 + 1.0;
                    _4088 = _4164;
                }
                float _4166 = _4088;
                bool _4168 = !_4150;
                _4136 = _4166;
                _4138 = _4168;
            }
            if ((!_4138) || _4120)
            {
                _4120 = false;
                _4130 = _4024;
                _4132 = _4026;
                _4134 = _4028;
                _4136 = _4030;
                _4138 = true;
            }
        }
        else
        {
            float _4170 = _545 + _4040;
            float _4172 = _547 + _4042;
            float _4174 = _549 + _4044;
            float _4176 = _4046 + 1.0;
            _4130 = _4024;
            _4132 = _4026;
            _4134 = _4028;
            _4136 = _4030;
            _4106 = _4170;
            _4108 = _4172;
            _4110 = _4174;
            _4112 = _4176;
        }
    }
    _4138 = false;
    float _4178 = _4090;
    float _4180 = _4092;
    float _4182 = _4094;
    float _4184 = _4096;
    float _4186 = _4130;
    float _4188 = _4132;
    float _4190 = _4134;
    float _4192 = _4136;
    float _4194 = _4098;
    float _4196 = _4100;
    float _4198 = _4102;
    float _4200 = _4104;
    float _4202 = _4106;
    float _4204 = _4108;
    float _4206 = _4110;
    float _4208 = _4112;
    float _4210 = -_2911;
    float _4212 = _555 + _4210;
    float _4214 = -_2915;
    float _4216 = _553 + _4214;
    float _4218 = _2925 * _4212;
    float _4220 = -_2919;
    float _4222 = _557 + _4220;
    float _4224 = fma(_2929, _4216, _4218);
    float _4226 = fma(_2933, _4222, _4224);
    float _4228 = _2961 * _4226;
    float _4230 = rint(_4228);
    float _4232 = precise::max(0.0, _4230);
    float _4234 = precise::min(_4232, 3.0);
    float _4236 = trunc(_4234);
    int _4238 = int(_4236);
    bool _4240 = _4238 >= 2;
    bool _4242 = !_4240;
    float _4244 = _4230;
    float _4246 = as_type<float>(_4238);
    float _4248 = _4218;
    float _4250 = _4224;
    float _4252 = _4178;
    float _4254 = _4180;
    float _4256 = _4182;
    float _4258 = _4184;
    float _4260 = _4194;
    float _4262 = _4196;
    float _4264 = _4198;
    float _4266 = _4200;
    float _4268 = _4202;
    float _4270 = _4204;
    float _4272 = _4206;
    float _4274 = _4208;
    float _4292;
    float _4294;
    float _4296;
    float _4298;
    if (!_4242)
    {
        bool _4276 = _4238 >= 3;
        bool _4278 = !_4276;
        if (!_4278)
        {
            bool _4280 = _4238 != 3;
            _4282 = _4280;
            if (!_4282)
            {
                float _4284 = _553 + _4178;
                float _4286 = _555 + _4180;
                float _4288 = _557 + _4182;
                float _4290 = _4184 + 1.0;
                _4252 = _4284;
                _4254 = _4286;
                _4256 = _4288;
                _4258 = _4290;
                _4292 = _4186;
                _4294 = _4188;
                _4296 = _4190;
                _4298 = _4192;
                _4300 = true;
            }
        }
        else
        {
            float _4302 = _553 + _4194;
            float _4304 = _555 + _4196;
            float _4306 = _557 + _4198;
            float _4308 = _4200 + 1.0;
            _4292 = _4186;
            _4294 = _4188;
            _4296 = _4190;
            _4298 = _4192;
            _4260 = _4302;
            _4262 = _4304;
            _4264 = _4306;
            _4266 = _4308;
            _4300 = true;
        }
    }
    if ((!_4300) || _4282)
    {
        bool _4310;
        if (!_4282)
        {
            _4310 = _4238 >= 1;
        }
        if ((!_4310) || _4282)
        {
            if (!_4282)
            {
                bool _4312 = _4238 != 0;
                if (!_4312)
                {
                    float _4314 = _553 + _4186;
                    _4244 = _4314;
                }
                float _4316 = _4244;
                _4292 = _4316;
                if (!_4312)
                {
                    float _4318 = _555 + _4188;
                    _4246 = _4318;
                }
                float _4320 = _4246;
                _4294 = _4320;
                if (!_4312)
                {
                    float _4322 = _557 + _4190;
                    _4248 = _4322;
                }
                float _4324 = _4248;
                _4296 = _4324;
                if (!_4312)
                {
                    float _4326 = _4192 + 1.0;
                    _4250 = _4326;
                }
                float _4328 = _4250;
                bool _4330 = !_4312;
                _4298 = _4328;
                _4300 = _4330;
            }
            if ((!_4300) || _4282)
            {
                _4282 = false;
                _4292 = _4186;
                _4294 = _4188;
                _4296 = _4190;
                _4298 = _4192;
                _4300 = true;
            }
        }
        else
        {
            float _4332 = _553 + _4202;
            float _4334 = _555 + _4204;
            float _4336 = _557 + _4206;
            float _4338 = _4208 + 1.0;
            _4292 = _4186;
            _4294 = _4188;
            _4296 = _4190;
            _4298 = _4192;
            _4268 = _4332;
            _4270 = _4334;
            _4272 = _4336;
            _4274 = _4338;
        }
    }
    _4300 = false;
    float _4340 = _4252;
    float _4342 = _4254;
    float _4344 = _4256;
    float _4346 = _4258;
    float _4348 = _4292;
    float _4350 = _4294;
    float _4352 = _4296;
    float _4354 = _4298;
    float _4356 = _4260;
    float _4358 = _4262;
    float _4360 = _4264;
    float _4362 = _4266;
    float _4364 = _4268;
    float _4366 = _4270;
    float _4368 = _4272;
    float _4370 = _4274;
    float _4372 = -_2911;
    float _4374 = _563 + _4372;
    float _4376 = -_2915;
    float _4378 = _561 + _4376;
    float _4380 = _2925 * _4374;
    float _4382 = -_2919;
    float _4384 = _565 + _4382;
    float _4386 = fma(_2929, _4378, _4380);
    float _4388 = fma(_2933, _4384, _4386);
    float _4390 = _2961 * _4388;
    float _4392 = rint(_4390);
    float _4394 = precise::max(0.0, _4392);
    float _4396 = precise::min(_4394, 3.0);
    float _4398 = trunc(_4396);
    int _4400 = int(_4398);
    bool _4402 = _4400 >= 2;
    bool _4404 = !_4402;
    float _4406 = _4392;
    float _4408 = as_type<float>(_4400);
    float _4410 = _4380;
    float _4412 = _4386;
    float _4414 = _4340;
    float _4416 = _4342;
    float _4418 = _4344;
    float _4420 = _4346;
    float _4422 = _4356;
    float _4424 = _4358;
    float _4426 = _4360;
    float _4428 = _4362;
    float _4430 = _4364;
    float _4432 = _4366;
    float _4434 = _4368;
    float _4436 = _4370;
    float _4454;
    float _4456;
    float _4458;
    float _4460;
    if (!_4404)
    {
        bool _4438 = _4400 >= 3;
        bool _4440 = !_4438;
        if (!_4440)
        {
            bool _4442 = _4400 != 3;
            _4444 = _4442;
            if (!_4444)
            {
                float _4446 = _561 + _4340;
                float _4448 = _563 + _4342;
                float _4450 = _565 + _4344;
                float _4452 = _4346 + 1.0;
                _4414 = _4446;
                _4416 = _4448;
                _4418 = _4450;
                _4420 = _4452;
                _4454 = _4348;
                _4456 = _4350;
                _4458 = _4352;
                _4460 = _4354;
                _4462 = true;
            }
        }
        else
        {
            float _4464 = _561 + _4356;
            float _4466 = _563 + _4358;
            float _4468 = _565 + _4360;
            float _4470 = _4362 + 1.0;
            _4454 = _4348;
            _4456 = _4350;
            _4458 = _4352;
            _4460 = _4354;
            _4422 = _4464;
            _4424 = _4466;
            _4426 = _4468;
            _4428 = _4470;
            _4462 = true;
        }
    }
    if ((!_4462) || _4444)
    {
        bool _4472;
        if (!_4444)
        {
            _4472 = _4400 >= 1;
        }
        if ((!_4472) || _4444)
        {
            if (!_4444)
            {
                bool _4474 = _4400 != 0;
                if (!_4474)
                {
                    float _4476 = _561 + _4348;
                    _4406 = _4476;
                }
                float _4478 = _4406;
                _4454 = _4478;
                if (!_4474)
                {
                    float _4480 = _563 + _4350;
                    _4408 = _4480;
                }
                float _4482 = _4408;
                _4456 = _4482;
                if (!_4474)
                {
                    float _4484 = _565 + _4352;
                    _4410 = _4484;
                }
                float _4486 = _4410;
                _4458 = _4486;
                if (!_4474)
                {
                    float _4488 = _4354 + 1.0;
                    _4412 = _4488;
                }
                float _4490 = _4412;
                bool _4492 = !_4474;
                _4460 = _4490;
                _4462 = _4492;
            }
            if ((!_4462) || _4444)
            {
                _4444 = false;
                _4454 = _4348;
                _4456 = _4350;
                _4458 = _4352;
                _4460 = _4354;
                _4462 = true;
            }
        }
        else
        {
            float _4494 = _561 + _4364;
            float _4496 = _563 + _4366;
            float _4498 = _565 + _4368;
            float _4500 = _4370 + 1.0;
            _4454 = _4348;
            _4456 = _4350;
            _4458 = _4352;
            _4460 = _4354;
            _4430 = _4494;
            _4432 = _4496;
            _4434 = _4498;
            _4436 = _4500;
        }
    }
    _4462 = false;
    float _4502 = _4414;
    float _4504 = _4416;
    float _4506 = _4418;
    float _4508 = _4420;
    float _4510 = _4454;
    float _4512 = _4456;
    float _4514 = _4458;
    float _4516 = _4460;
    float _4518 = _4422;
    float _4520 = _4424;
    float _4522 = _4426;
    float _4524 = _4428;
    float _4526 = _4430;
    float _4528 = _4432;
    float _4530 = _4434;
    float _4532 = _4436;
    float _4534 = -_2911;
    float _4536 = _571 + _4534;
    float _4538 = -_2915;
    float _4540 = _569 + _4538;
    float _4542 = _2925 * _4536;
    float _4544 = -_2919;
    float _4546 = _573 + _4544;
    float _4548 = fma(_2929, _4540, _4542);
    float _4550 = fma(_2933, _4546, _4548);
    float _4552 = _2961 * _4550;
    float _4554 = rint(_4552);
    float _4556 = precise::max(0.0, _4554);
    float _4558 = precise::min(_4556, 3.0);
    float _4560 = trunc(_4558);
    int _4562 = int(_4560);
    bool _4564 = _4562 >= 2;
    bool _4566 = !_4564;
    float _4568 = _4554;
    float _4570 = as_type<float>(_4562);
    float _4572 = _4542;
    float _4574 = _4548;
    float _4576 = _4502;
    float _4578 = _4504;
    float _4580 = _4506;
    float _4582 = _4508;
    float _4584 = _4518;
    float _4586 = _4520;
    float _4588 = _4522;
    float _4590 = _4524;
    float _4592 = _4526;
    float _4594 = _4528;
    float _4596 = _4530;
    float _4598 = _4532;
    float _4616;
    float _4618;
    float _4620;
    float _4622;
    if (!_4566)
    {
        bool _4600 = _4562 >= 3;
        bool _4602 = !_4600;
        if (!_4602)
        {
            bool _4604 = _4562 != 3;
            _4606 = _4604;
            if (!_4606)
            {
                float _4608 = _569 + _4502;
                float _4610 = _571 + _4504;
                float _4612 = _573 + _4506;
                float _4614 = _4508 + 1.0;
                _4576 = _4608;
                _4578 = _4610;
                _4580 = _4612;
                _4582 = _4614;
                _4616 = _4510;
                _4618 = _4512;
                _4620 = _4514;
                _4622 = _4516;
                _4624 = true;
            }
        }
        else
        {
            float _4626 = _569 + _4518;
            float _4628 = _571 + _4520;
            float _4630 = _573 + _4522;
            float _4632 = _4524 + 1.0;
            _4616 = _4510;
            _4618 = _4512;
            _4620 = _4514;
            _4622 = _4516;
            _4584 = _4626;
            _4586 = _4628;
            _4588 = _4630;
            _4590 = _4632;
            _4624 = true;
        }
    }
    if ((!_4624) || _4606)
    {
        bool _4634;
        if (!_4606)
        {
            _4634 = _4562 >= 1;
        }
        if ((!_4634) || _4606)
        {
            if (!_4606)
            {
                bool _4636 = _4562 != 0;
                if (!_4636)
                {
                    float _4638 = _569 + _4510;
                    _4568 = _4638;
                }
                float _4640 = _4568;
                _4616 = _4640;
                if (!_4636)
                {
                    float _4642 = _571 + _4512;
                    _4570 = _4642;
                }
                float _4644 = _4570;
                _4618 = _4644;
                if (!_4636)
                {
                    float _4646 = _573 + _4514;
                    _4572 = _4646;
                }
                float _4648 = _4572;
                _4620 = _4648;
                if (!_4636)
                {
                    float _4650 = _4516 + 1.0;
                    _4574 = _4650;
                }
                float _4652 = _4574;
                bool _4654 = !_4636;
                _4622 = _4652;
                _4624 = _4654;
            }
            if ((!_4624) || _4606)
            {
                _4606 = false;
                _4616 = _4510;
                _4618 = _4512;
                _4620 = _4514;
                _4622 = _4516;
                _4624 = true;
            }
        }
        else
        {
            float _4656 = _569 + _4526;
            float _4658 = _571 + _4528;
            float _4660 = _573 + _4530;
            float _4662 = _4532 + 1.0;
            _4616 = _4510;
            _4618 = _4512;
            _4620 = _4514;
            _4622 = _4516;
            _4592 = _4656;
            _4594 = _4658;
            _4596 = _4660;
            _4598 = _4662;
        }
    }
    _4624 = false;
    float _4664 = _4576;
    float _4666 = _4578;
    float _4668 = _4580;
    float _4670 = _4582;
    float _4672 = _4616;
    float _4674 = _4618;
    float _4676 = _4620;
    float _4678 = _4622;
    float _4680 = _4584;
    float _4682 = _4586;
    float _4684 = _4588;
    float _4686 = _4590;
    float _4688 = _4592;
    float _4690 = _4594;
    float _4692 = _4596;
    float _4694 = _4598;
    float _4696 = -_2911;
    float _4698 = _591 + _4696;
    float _4700 = -_2915;
    float _4702 = _589 + _4700;
    float _4704 = _2925 * _4698;
    float _4706 = -_2919;
    float _4708 = _593 + _4706;
    float _4710 = fma(_2929, _4702, _4704);
    float _4712 = fma(_2933, _4708, _4710);
    float _4714 = _2961 * _4712;
    float _4716 = rint(_4714);
    float _4718 = precise::max(0.0, _4716);
    float _4720 = precise::min(_4718, 3.0);
    float _4722 = trunc(_4720);
    int _4724 = int(_4722);
    bool _4726 = _4724 >= 2;
    bool _4728 = !_4726;
    float _4730 = _4716;
    float _4732 = as_type<float>(_4724);
    float _4734 = _4704;
    float _4736 = _4710;
    float _4738 = _4664;
    float _4740 = _4666;
    float _4742 = _4668;
    float _4744 = _4670;
    float _4746 = _4680;
    float _4748 = _4682;
    float _4750 = _4684;
    float _4752 = _4686;
    float _4754 = _4688;
    float _4756 = _4690;
    float _4758 = _4692;
    float _4760 = _4694;
    float _4778;
    float _4780;
    float _4782;
    float _4784;
    if (!_4728)
    {
        bool _4762 = _4724 >= 3;
        bool _4764 = !_4762;
        if (!_4764)
        {
            bool _4766 = _4724 != 3;
            _4768 = _4766;
            if (!_4768)
            {
                float _4770 = _589 + _4664;
                float _4772 = _591 + _4666;
                float _4774 = _593 + _4668;
                float _4776 = _4670 + 1.0;
                _4738 = _4770;
                _4740 = _4772;
                _4742 = _4774;
                _4744 = _4776;
                _4778 = _4672;
                _4780 = _4674;
                _4782 = _4676;
                _4784 = _4678;
                _4786 = true;
            }
        }
        else
        {
            float _4788 = _589 + _4680;
            float _4790 = _591 + _4682;
            float _4792 = _593 + _4684;
            float _4794 = _4686 + 1.0;
            _4778 = _4672;
            _4780 = _4674;
            _4782 = _4676;
            _4784 = _4678;
            _4746 = _4788;
            _4748 = _4790;
            _4750 = _4792;
            _4752 = _4794;
            _4786 = true;
        }
    }
    if ((!_4786) || _4768)
    {
        bool _4796;
        if (!_4768)
        {
            _4796 = _4724 >= 1;
        }
        if ((!_4796) || _4768)
        {
            if (!_4768)
            {
                bool _4798 = _4724 != 0;
                if (!_4798)
                {
                    float _4800 = _589 + _4672;
                    _4730 = _4800;
                }
                float _4802 = _4730;
                _4778 = _4802;
                if (!_4798)
                {
                    float _4804 = _591 + _4674;
                    _4732 = _4804;
                }
                float _4806 = _4732;
                _4780 = _4806;
                if (!_4798)
                {
                    float _4808 = _593 + _4676;
                    _4734 = _4808;
                }
                float _4810 = _4734;
                _4782 = _4810;
                if (!_4798)
                {
                    float _4812 = _4678 + 1.0;
                    _4736 = _4812;
                }
                float _4814 = _4736;
                bool _4816 = !_4798;
                _4784 = _4814;
                _4786 = _4816;
            }
            if ((!_4786) || _4768)
            {
                _4768 = false;
                _4778 = _4672;
                _4780 = _4674;
                _4782 = _4676;
                _4784 = _4678;
                _4786 = true;
            }
        }
        else
        {
            float _4818 = _589 + _4688;
            float _4820 = _591 + _4690;
            float _4822 = _593 + _4692;
            float _4824 = _4694 + 1.0;
            _4778 = _4672;
            _4780 = _4674;
            _4782 = _4676;
            _4784 = _4678;
            _4754 = _4818;
            _4756 = _4820;
            _4758 = _4822;
            _4760 = _4824;
        }
    }
    _4786 = false;
    float _4826 = _4738;
    float _4828 = _4740;
    float _4830 = _4742;
    float _4832 = _4744;
    float _4834 = _4778;
    float _4836 = _4780;
    float _4838 = _4782;
    float _4840 = _4784;
    float _4842 = _4746;
    float _4844 = _4748;
    float _4846 = _4750;
    float _4848 = _4752;
    float _4850 = _4754;
    float _4852 = _4756;
    float _4854 = _4758;
    float _4856 = _4760;
    float _4858 = -_2911;
    float _4860 = _599 + _4858;
    float _4862 = -_2915;
    float _4864 = _597 + _4862;
    float _4866 = _2925 * _4860;
    float _4868 = -_2919;
    float _4870 = _601 + _4868;
    float _4872 = fma(_2929, _4864, _4866);
    float _4874 = fma(_2933, _4870, _4872);
    float _4876 = _2961 * _4874;
    float _4878 = rint(_4876);
    float _4880 = precise::max(0.0, _4878);
    float _4882 = precise::min(_4880, 3.0);
    float _4884 = trunc(_4882);
    int _4886 = int(_4884);
    bool _4888 = _4886 >= 2;
    bool _4890 = !_4888;
    float _4892 = _4878;
    float _4894 = as_type<float>(_4886);
    float _4896 = _4866;
    float _4898 = _4872;
    float _4900 = _4826;
    float _4902 = _4828;
    float _4904 = _4830;
    float _4906 = _4832;
    float _4908 = _4842;
    float _4910 = _4844;
    float _4912 = _4846;
    float _4914 = _4848;
    float _4916 = _4850;
    float _4918 = _4852;
    float _4920 = _4854;
    float _4922 = _4856;
    float _4940;
    float _4942;
    float _4944;
    float _4946;
    if (!_4890)
    {
        bool _4924 = _4886 >= 3;
        bool _4926 = !_4924;
        if (!_4926)
        {
            bool _4928 = _4886 != 3;
            _4930 = _4928;
            if (!_4930)
            {
                float _4932 = _597 + _4826;
                float _4934 = _599 + _4828;
                float _4936 = _601 + _4830;
                float _4938 = _4832 + 1.0;
                _4900 = _4932;
                _4902 = _4934;
                _4904 = _4936;
                _4906 = _4938;
                _4940 = _4834;
                _4942 = _4836;
                _4944 = _4838;
                _4946 = _4840;
                _4948 = true;
            }
        }
        else
        {
            float _4950 = _597 + _4842;
            float _4952 = _599 + _4844;
            float _4954 = _601 + _4846;
            float _4956 = _4848 + 1.0;
            _4940 = _4834;
            _4942 = _4836;
            _4944 = _4838;
            _4946 = _4840;
            _4908 = _4950;
            _4910 = _4952;
            _4912 = _4954;
            _4914 = _4956;
            _4948 = true;
        }
    }
    if ((!_4948) || _4930)
    {
        bool _4958;
        if (!_4930)
        {
            _4958 = _4886 >= 1;
        }
        if ((!_4958) || _4930)
        {
            if (!_4930)
            {
                bool _4960 = _4886 != 0;
                if (!_4960)
                {
                    float _4962 = _597 + _4834;
                    _4892 = _4962;
                }
                float _4964 = _4892;
                _4940 = _4964;
                if (!_4960)
                {
                    float _4966 = _599 + _4836;
                    _4894 = _4966;
                }
                float _4968 = _4894;
                _4942 = _4968;
                if (!_4960)
                {
                    float _4970 = _601 + _4838;
                    _4896 = _4970;
                }
                float _4972 = _4896;
                _4944 = _4972;
                if (!_4960)
                {
                    float _4974 = _4840 + 1.0;
                    _4898 = _4974;
                }
                float _4976 = _4898;
                bool _4978 = !_4960;
                _4946 = _4976;
                _4948 = _4978;
            }
            if ((!_4948) || _4930)
            {
                _4930 = false;
                _4940 = _4834;
                _4942 = _4836;
                _4944 = _4838;
                _4946 = _4840;
                _4948 = true;
            }
        }
        else
        {
            float _4980 = _597 + _4850;
            float _4982 = _599 + _4852;
            float _4984 = _601 + _4854;
            float _4986 = _4856 + 1.0;
            _4940 = _4834;
            _4942 = _4836;
            _4944 = _4838;
            _4946 = _4840;
            _4916 = _4980;
            _4918 = _4982;
            _4920 = _4984;
            _4922 = _4986;
        }
    }
    _4948 = false;
    float _4988 = _4900;
    float _4990 = _4902;
    float _4992 = _4904;
    float _4994 = _4906;
    float _4996 = _4940;
    float _4998 = _4942;
    float _5000 = _4944;
    float _5002 = _4946;
    float _5004 = _4908;
    float _5006 = _4910;
    float _5008 = _4912;
    float _5010 = _4914;
    float _5012 = _4916;
    float _5014 = _4918;
    float _5016 = _4920;
    float _5018 = _4922;
    float _5020 = -_2911;
    float _5022 = _607 + _5020;
    float _5024 = -_2915;
    float _5026 = _605 + _5024;
    float _5028 = _2925 * _5022;
    float _5030 = -_2919;
    float _5032 = _609 + _5030;
    float _5034 = fma(_2929, _5026, _5028);
    float _5036 = fma(_2933, _5032, _5034);
    float _5038 = _2961 * _5036;
    float _5040 = rint(_5038);
    float _5042 = precise::max(0.0, _5040);
    float _5044 = precise::min(_5042, 3.0);
    float _5046 = trunc(_5044);
    int _5048 = int(_5046);
    bool _5050 = _5048 >= 2;
    bool _5052 = !_5050;
    float _5054 = _5040;
    float _5056 = as_type<float>(_5048);
    float _5058 = _5028;
    float _5060 = _5034;
    float _5062 = _4988;
    float _5064 = _4990;
    float _5066 = _4992;
    float _5068 = _4994;
    float _5070 = _5004;
    float _5072 = _5006;
    float _5074 = _5008;
    float _5076 = _5010;
    float _5078 = _5012;
    float _5080 = _5014;
    float _5082 = _5016;
    float _5084 = _5018;
    float _5102;
    float _5104;
    float _5106;
    float _5108;
    if (!_5052)
    {
        bool _5086 = _5048 >= 3;
        bool _5088 = !_5086;
        if (!_5088)
        {
            bool _5090 = _5048 != 3;
            _5092 = _5090;
            if (!_5092)
            {
                float _5094 = _605 + _4988;
                float _5096 = _607 + _4990;
                float _5098 = _609 + _4992;
                float _5100 = _4994 + 1.0;
                _5062 = _5094;
                _5064 = _5096;
                _5066 = _5098;
                _5068 = _5100;
                _5102 = _4996;
                _5104 = _4998;
                _5106 = _5000;
                _5108 = _5002;
                _5110 = true;
            }
        }
        else
        {
            float _5112 = _605 + _5004;
            float _5114 = _607 + _5006;
            float _5116 = _609 + _5008;
            float _5118 = _5010 + 1.0;
            _5102 = _4996;
            _5104 = _4998;
            _5106 = _5000;
            _5108 = _5002;
            _5070 = _5112;
            _5072 = _5114;
            _5074 = _5116;
            _5076 = _5118;
            _5110 = true;
        }
    }
    if ((!_5110) || _5092)
    {
        bool _5120;
        if (!_5092)
        {
            _5120 = _5048 >= 1;
        }
        if ((!_5120) || _5092)
        {
            if (!_5092)
            {
                bool _5122 = _5048 != 0;
                if (!_5122)
                {
                    float _5124 = _605 + _4996;
                    _5054 = _5124;
                }
                float _5126 = _5054;
                _5102 = _5126;
                if (!_5122)
                {
                    float _5128 = _607 + _4998;
                    _5056 = _5128;
                }
                float _5130 = _5056;
                _5104 = _5130;
                if (!_5122)
                {
                    float _5132 = _609 + _5000;
                    _5058 = _5132;
                }
                float _5134 = _5058;
                _5106 = _5134;
                if (!_5122)
                {
                    float _5136 = _5002 + 1.0;
                    _5060 = _5136;
                }
                float _5138 = _5060;
                bool _5140 = !_5122;
                _5108 = _5138;
                _5110 = _5140;
            }
            if ((!_5110) || _5092)
            {
                _5092 = false;
                _5102 = _4996;
                _5104 = _4998;
                _5106 = _5000;
                _5108 = _5002;
                _5110 = true;
            }
        }
        else
        {
            float _5142 = _605 + _5012;
            float _5144 = _607 + _5014;
            float _5146 = _609 + _5016;
            float _5148 = _5018 + 1.0;
            _5102 = _4996;
            _5104 = _4998;
            _5106 = _5000;
            _5108 = _5002;
            _5078 = _5142;
            _5080 = _5144;
            _5082 = _5146;
            _5084 = _5148;
        }
    }
    _5110 = false;
    float _5150 = _5062;
    float _5152 = _5064;
    float _5154 = _5066;
    float _5156 = _5068;
    float _5158 = _5102;
    float _5160 = _5104;
    float _5162 = _5106;
    float _5164 = _5108;
    float _5166 = _5070;
    float _5168 = _5072;
    float _5170 = _5074;
    float _5172 = _5076;
    float _5174 = _5078;
    float _5176 = _5080;
    float _5178 = _5082;
    float _5180 = _5084;
    float _5182 = -_2911;
    float _5184 = _615 + _5182;
    float _5186 = -_2915;
    float _5188 = _613 + _5186;
    float _5190 = _2925 * _5184;
    float _5192 = -_2919;
    float _5194 = _617 + _5192;
    float _5196 = fma(_2929, _5188, _5190);
    float _5198 = fma(_2933, _5194, _5196);
    float _5200 = _2961 * _5198;
    float _5202 = rint(_5200);
    float _5204 = precise::max(0.0, _5202);
    float _5206 = precise::min(_5204, 3.0);
    float _5208 = trunc(_5206);
    int _5210 = int(_5208);
    bool _5212 = _5210 >= 2;
    bool _5214 = !_5212;
    float _5216 = _5202;
    float _5218 = as_type<float>(_5210);
    float _5220 = _5190;
    float _5222 = _5196;
    float _5224 = _5150;
    float _5226 = _5152;
    float _5228 = _5154;
    float _5230 = _5156;
    float _5232 = _5166;
    float _5234 = _5168;
    float _5236 = _5170;
    float _5238 = _5172;
    float _5240 = _5174;
    float _5242 = _5176;
    float _5244 = _5178;
    float _5246 = _5180;
    float _5264;
    float _5266;
    float _5268;
    float _5270;
    if (!_5214)
    {
        bool _5248 = _5210 >= 3;
        bool _5250 = !_5248;
        if (!_5250)
        {
            bool _5252 = _5210 != 3;
            _5254 = _5252;
            if (!_5254)
            {
                float _5256 = _613 + _5150;
                float _5258 = _615 + _5152;
                float _5260 = _617 + _5154;
                float _5262 = _5156 + 1.0;
                _5224 = _5256;
                _5226 = _5258;
                _5228 = _5260;
                _5230 = _5262;
                _5264 = _5158;
                _5266 = _5160;
                _5268 = _5162;
                _5270 = _5164;
                _5272 = true;
            }
        }
        else
        {
            float _5274 = _613 + _5166;
            float _5276 = _615 + _5168;
            float _5278 = _617 + _5170;
            float _5280 = _5172 + 1.0;
            _5264 = _5158;
            _5266 = _5160;
            _5268 = _5162;
            _5270 = _5164;
            _5232 = _5274;
            _5234 = _5276;
            _5236 = _5278;
            _5238 = _5280;
            _5272 = true;
        }
    }
    if ((!_5272) || _5254)
    {
        bool _5282;
        if (!_5254)
        {
            _5282 = _5210 >= 1;
        }
        if ((!_5282) || _5254)
        {
            if (!_5254)
            {
                bool _5284 = _5210 != 0;
                if (!_5284)
                {
                    float _5286 = _613 + _5158;
                    _5216 = _5286;
                }
                float _5288 = _5216;
                _5264 = _5288;
                if (!_5284)
                {
                    float _5290 = _615 + _5160;
                    _5218 = _5290;
                }
                float _5292 = _5218;
                _5266 = _5292;
                if (!_5284)
                {
                    float _5294 = _617 + _5162;
                    _5220 = _5294;
                }
                float _5296 = _5220;
                _5268 = _5296;
                if (!_5284)
                {
                    float _5298 = _5164 + 1.0;
                    _5222 = _5298;
                }
                float _5300 = _5222;
                bool _5302 = !_5284;
                _5270 = _5300;
                _5272 = _5302;
            }
            if ((!_5272) || _5254)
            {
                _5254 = false;
                _5264 = _5158;
                _5266 = _5160;
                _5268 = _5162;
                _5270 = _5164;
                _5272 = true;
            }
        }
        else
        {
            float _5304 = _613 + _5174;
            float _5306 = _615 + _5176;
            float _5308 = _617 + _5178;
            float _5310 = _5180 + 1.0;
            _5264 = _5158;
            _5266 = _5160;
            _5268 = _5162;
            _5270 = _5164;
            _5240 = _5304;
            _5242 = _5306;
            _5244 = _5308;
            _5246 = _5310;
        }
    }
    _5272 = false;
    float _5312 = _5224;
    float _5314 = _5226;
    float _5316 = _5228;
    float _5318 = _5230;
    float _5320 = _5264;
    float _5322 = _5266;
    float _5324 = _5268;
    float _5326 = _5270;
    float _5328 = _5232;
    float _5330 = _5234;
    float _5332 = _5236;
    float _5334 = _5238;
    float _5336 = _5240;
    float _5338 = _5242;
    float _5340 = _5244;
    float _5342 = _5246;
    float _5344 = -_2911;
    float _5346 = _623 + _5344;
    float _5348 = -_2915;
    float _5350 = _621 + _5348;
    float _5352 = _2925 * _5346;
    float _5354 = -_2919;
    float _5356 = _625 + _5354;
    float _5358 = fma(_2929, _5350, _5352);
    float _5360 = fma(_2933, _5356, _5358);
    float _5362 = _2961 * _5360;
    float _5364 = rint(_5362);
    float _5366 = precise::max(0.0, _5364);
    float _5368 = precise::min(_5366, 3.0);
    float _5370 = trunc(_5368);
    int _5372 = int(_5370);
    bool _5374 = _5372 >= 2;
    bool _5376 = !_5374;
    float _5378 = as_type<float>(_5372);
    float _5380 = _5364;
    float _5382 = _5356;
    float _5384 = _5352;
    float _5386 = _5342;
    float _5388 = _5334;
    float _5390 = _5328;
    float _5392 = _5318;
    float _5394 = _5336;
    float _5396 = _5338;
    float _5398 = _5340;
    float _5400 = _5332;
    float _5402 = _5330;
    float _5404 = _5314;
    float _5406 = _5312;
    float _5408 = _5316;
    float _5426;
    float _5428;
    float _5430;
    float _5432;
    if (!_5376)
    {
        bool _5410 = _5372 >= 3;
        bool _5412 = !_5410;
        if (!_5412)
        {
            bool _5414 = _5372 != 3;
            _5416 = _5414;
            if (!_5416)
            {
                float _5418 = _621 + _5312;
                float _5420 = _623 + _5314;
                float _5422 = _625 + _5316;
                float _5424 = _5318 + 1.0;
                _5426 = _5326;
                _5392 = _5424;
                _5428 = _5320;
                _5430 = _5322;
                _5432 = _5324;
                _5404 = _5420;
                _5406 = _5418;
                _5408 = _5422;
                _5434 = true;
            }
        }
        else
        {
            float _5436 = _621 + _5328;
            float _5438 = _623 + _5330;
            float _5440 = _625 + _5332;
            float _5442 = _5334 + 1.0;
            _5388 = _5442;
            _5390 = _5436;
            _5426 = _5326;
            _5428 = _5320;
            _5400 = _5440;
            _5430 = _5322;
            _5402 = _5438;
            _5432 = _5324;
            _5434 = true;
        }
    }
    if ((!_5434) || _5416)
    {
        bool _5444;
        if (!_5416)
        {
            _5444 = _5372 >= 1;
        }
        if ((!_5444) || _5416)
        {
            if (!_5416)
            {
                bool _5446 = _5372 != 0;
                if (!_5446)
                {
                    float _5448 = _621 + _5320;
                    _5378 = _5448;
                }
                float _5450 = _5378;
                _5428 = _5450;
                if (!_5446)
                {
                    float _5452 = _623 + _5322;
                    _5380 = _5452;
                }
                float _5454 = _5380;
                _5430 = _5454;
                if (!_5446)
                {
                    float _5456 = _625 + _5324;
                    _5382 = _5456;
                }
                float _5458 = _5382;
                _5432 = _5458;
                if (!_5446)
                {
                    float _5460 = _5326 + 1.0;
                    _5384 = _5460;
                }
                float _5462 = _5384;
                bool _5464 = !_5446;
                _5426 = _5462;
                _5434 = _5464;
            }
            if ((!_5434) || _5416)
            {
                _5416 = false;
                _5426 = _5326;
                _5428 = _5320;
                _5430 = _5322;
                _5432 = _5324;
                _5434 = true;
            }
        }
        else
        {
            float _5466 = _621 + _5336;
            float _5468 = _623 + _5338;
            float _5470 = _625 + _5340;
            float _5472 = _5342 + 1.0;
            _5386 = _5472;
            _5426 = _5326;
            _5394 = _5466;
            _5396 = _5468;
            _5428 = _5320;
            _5398 = _5470;
            _5430 = _5322;
            _5432 = _5324;
        }
    }
    _5434 = false;
    float _5474 = _5386;
    float _5476 = _5388;
    float _5478 = _5390;
    float _5480 = _5426;
    float _5482 = _5392;
    float _5484 = _5394;
    float _5486 = _5396;
    float _5488 = _5428;
    float _5490 = _5398;
    float _5492 = _5400;
    float _5494 = _5430;
    float _5496 = _5402;
    float _5498 = _5432;
    float _5500 = _5404;
    float _5502 = _5406;
    float _5504 = _5408;
    float _5506 = _5474 * 4.0;
    float _5508 = fma(_5476, 4.0, _5474);
    float _5510 = _5476 + _5474;
    float _5512 = _5478 * 6.0;
    float _5514 = fma(_5480, 9.0, _5506);
    float _5516 = fma(_5482, 9.0, _5508);
    float _5518 = _5484 * 6.0;
    float _5520 = _5510 * 2.0;
    float _5522 = _5514 + _5476;
    float _5524 = _5486 * 6.0;
    float _5526 = fma(_5488, 9.0, _5518);
    float _5528 = _5490 * 6.0;
    float _5530 = _5522 * _5516;
    float _5532 = _5492 * 6.0;
    float _5534 = fma(_5484, 3.0, _5512);
    float _5536 = fma(_5494, 9.0, _5524);
    float _5538 = -_5530;
    float _5540 = fma(_5520, _5520, _5538);
    float _5542 = _5496 * 6.0;
    float _5544 = fma(_5498, 9.0, _5528);
    float _5546 = fma(_5490, 3.0, _5532);
    bool _5548 = _5540 != 0.0;
    bool _5550 = isnan(_5540);
    bool _5552 = _5548 || _5550;
    bool _5554 = isnan(0.0);
    bool _5556 = _5552 || _5554;
    float _5558 = fma(_5486, 3.0, _5542);
    float _5560 = fma(_5478, 3.0, _5526);
    float _5562 = fma(_5496, 3.0, _5536);
    float _5564 = fma(_5492, 3.0, _5544);
    float _5566 = fma(_5500, 9.0, _5558);
    float _5568 = fma(_5502, 9.0, _5534);
    float _5570 = fma(_5504, 9.0, _5546);
    bool _5572 = !_5556;
    if (!_5572)
    {
        float _5574 = 1.0 / _5540;
        float _5576 = _5560 * _5516;
        float _5578 = _5522 * _5568;
        float _5580 = _5522 * _5570;
        float _5582 = -_5576;
        float _5584 = fma(_5568, _5520, _5582);
        float _5586 = -_5578;
        float _5588 = fma(_5560, _5520, _5586);
        float _5590 = _5562 * _5516;
        float _5592 = _5522 * _5566;
        float _5594 = _5564 * _5516;
        float _5596 = -_5580;
        float _5598 = fma(_5564, _5520, _5596);
        float _5600 = -_5590;
        float _5602 = fma(_5566, _5520, _5600);
        float _5604 = -_5592;
        float _5606 = fma(_5562, _5520, _5604);
        float _5608 = -_5594;
        float _5610 = fma(_5570, _5520, _5608);
        float _5612 = _5588 * _5574;
        float _5614 = _5606 * _5574;
        float _5616 = _5598 * _5574;
        float _5618 = _5584 * _5574;
        float _5620 = _5602 * _5574;
        float _5622 = _5610 * _5574;
        float _5624 = -_5618;
        float _5626 = _5612 + _5624;
        float _5628 = -_5620;
        float _5630 = _5614 + _5628;
        float _5632 = -_5622;
        float _5634 = _5616 + _5632;
        _2980 = _5626;
        _2982 = _5630;
        _2984 = _5634;
        _2986 = _5618;
        _2988 = _5612;
        _2990 = _5620;
        _2992 = _5614;
        _2994 = _5616;
        _2996 = _5622;
    }
    float _5636 = _2980;
    float _5638 = _2982;
    float _5640 = _2984;
    float _5642 = _2986;
    float _5644 = _2988;
    float _5646 = _2990;
    float _5648 = _2992;
    float _5650 = _2994;
    float _5652 = _2996;
    float _5654 = fma(_5636, 496.0, 0.5);
    float _5656 = precise::clamp(_5654, 0.0, 1.0);
    float _5658 = fma(_5636, -31.0, 1.0);
    float _5660 = precise::clamp(_5658, 0.0, 1.0);
    float _5662 = _5656 + (-0.5);
    float _5664 = fma(_5638, 1008.0, 0.5);
    float _5666 = precise::clamp(_5664, 0.0, 1.0);
    float _5668 = fma(_5638, -63.0, 1.0);
    float _5670 = precise::clamp(_5668, 0.0, 1.0);
    float _5672 = fma(_5640, 496.0, 0.5);
    float _5674 = precise::clamp(_5672, 0.0, 1.0);
    float _5676 = _5660 * _5662;
    float _5678 = _5666 + (-0.5);
    float _5680 = fma(_5640, -31.0, 1.0);
    float _5682 = precise::clamp(_5680, 0.0, 1.0);
    float _5684 = fma(_5676, -0.0322580635547637939453125, _5642);
    float _5686 = precise::clamp(_5684, 0.0, 1.0);
    float _5688 = _5670 * _5678;
    float _5690 = _5688 * 2.0;
    float _5692 = fma(_5676, 0.0322580635547637939453125, _5644);
    float _5694 = precise::clamp(_5692, 0.0, 1.0);
    float _5696 = _5686 * 31.0;
    float _5698 = fma(_5690, -0.01587301678955554962158203125, _5646);
    float _5700 = precise::clamp(_5698, 0.0, 1.0);
    float _5702 = fma(_5690, 0.01587301678955554962158203125, _5648);
    float _5704 = precise::clamp(_5702, 0.0, 1.0);
    float _5706 = _5694 * 31.0;
    float _5708 = rint(_5696);
    float _5710 = _5700 * 63.0;
    float _5712 = _5674 + (-0.5);
    float _5714 = _5704 * 63.0;
    float _5716 = _5682 * _5712;
    float _5718 = rint(_5706);
    float _5720 = fma(_5716, 0.0322580635547637939453125, _5650);
    float _5722 = precise::clamp(_5720, 0.0, 1.0);
    float _5724 = fma(_5716, -0.0322580635547637939453125, _5652);
    float _5726 = precise::clamp(_5724, 0.0, 1.0);
    float _5728 = _5722 * 31.0;
    float _5730 = _5726 * 31.0;
    float _5732 = rint(_5714);
    float _5734 = rint(_5710);
    float _5736 = _5718 + 0.5;
    float _5738 = _5708 + 0.5;
    float _5740 = rint(_5728);
    float _5742 = _5732 + 0.5;
    float _5744 = rint(_5730);
    float _5746 = _5734 + 0.5;
    float _5748 = _5740 + 0.5;
    float _5750 = trunc(_5736);
    float _5752 = precise::max(_5750, 0.0);
    uint _5755 = uint(_5752);
    float _5757 = _5744 + 0.5;
    float _5759 = trunc(_5742);
    float _5761 = precise::max(_5759, 0.0);
    uint _5763 = uint(_5761);
    float _5765 = trunc(_5738);
    float _5767 = precise::max(_5765, 0.0);
    uint _5769 = uint(_5767);
    int _5771 = int(_5755) << 11;
    float _5773 = trunc(_5746);
    float _5775 = precise::max(_5773, 0.0);
    uint _5777 = uint(_5775);
    int _5779 = int(_5763) << 5;
    float _5781 = trunc(_5748);
    float _5783 = precise::max(_5781, 0.0);
    uint _5785 = uint(_5783);
    int _5787 = int(_5769) << 11;
    float _5789 = trunc(_5757);
    float _5791 = precise::max(_5789, 0.0);
    uint _5793 = uint(_5791);
    int _5795 = int(_5777) << 5;
    int _5797 = _5771 | _5779;
    int _5799 = int(_5785) | _5797;
    int _5801 = _5787 | _5795;
    int _5803 = int(_5793) | _5801;
    bool _5805 = _5799 != _5803;
    int _5807 = _5779;
    int _5809 = _5795;
    int _5811 = int(_5769);
    if (!_5805)
    {
        _5807 = _5799;
    }
    int _5813 = _5807;
    if (!_5805)
    {
        _5809 = 0;
        _5811 = 0;
    }
    int _5815 = _5809;
    int _5817 = _5811;
    if (!_5805)
    {
        out.m_36.x = as_type<float>(_5813);
        out.m_36.y = as_type<float>(_5799);
        out.m_36.z = as_type<float>(_5815);
        out.m_36.w = as_type<float>(_5817);
        return out;
    }
    float _5819 = _5718 * 0.0322580635547637939453125;
    float _5821 = _5708 * 0.0322580635547637939453125;
    float _5823 = _5732 * 0.01587301678955554962158203125;
    bool _5825 = uint(_5799) >= uint(_5803);
    float _5827 = _5734 * 0.01587301678955554962158203125;
    float _5829 = _5740 * 0.0322580635547637939453125;
    float _5831 = _5744 * 0.0322580635547637939453125;
    bool _5833 = !_5825;
    float _5835 = _5833 ? _5819 : _5821;
    bool _5837 = !_5825;
    float _5839 = _5837 ? _5821 : _5819;
    bool _5841 = !_5825;
    float _5843 = _5841 ? _5823 : _5827;
    float _5845 = -_5835;
    float _5847 = _545 + _5845;
    bool _5849 = !_5825;
    float _5851 = _5849 ? _5827 : _5823;
    float _5853 = -_5835;
    float _5855 = _5853 + _5839;
    bool _5857 = !_5825;
    float _5859 = _5857 ? _5829 : _5831;
    float _5861 = -_5843;
    float _5863 = _547 + _5861;
    bool _5865 = !_5825;
    float _5867 = _5865 ? _5831 : _5829;
    float _5869 = -_5843;
    float _5871 = _5869 + _5851;
    float _5873 = -_5843;
    float _5875 = _623 + _5873;
    float _5877 = -_5859;
    float _5879 = _549 + _5877;
    float _5881 = -_5835;
    float _5883 = _621 + _5881;
    float _5885 = _5871 * _5871;
    float _5887 = -_5859;
    float _5889 = _5887 + _5867;
    float _5891 = -_5843;
    float _5893 = _491 + _5891;
    float _5895 = -_5843;
    float _5897 = _483 + _5895;
    float _5899 = fma(_5855, _5855, _5885);
    float _5901 = -_5843;
    float _5903 = _437 + _5901;
    float _5905 = -_5843;
    float _5907 = _429 + _5905;
    float _5909 = -_5843;
    float _5911 = _395 + _5909;
    float _5913 = fma(_5889, _5889, _5899);
    float _5915 = -_5843;
    float _5917 = _343 + _5915;
    float _5919 = -_5843;
    float _5921 = _335 + _5919;
    float _5923 = -_5843;
    float _5925 = _615 + _5923;
    float _5927 = -_5843;
    float _5929 = _607 + _5927;
    float _5931 = -_5843;
    float _5933 = _599 + _5931;
    float _5935 = 1.0 / _5913;
    float _5937 = -_5843;
    float _5939 = _591 + _5937;
    float _5941 = -_5843;
    float _5943 = _571 + _5941;
    float _5945 = -_5843;
    float _5947 = _563 + _5945;
    float _5949 = -_5843;
    float _5951 = _555 + _5949;
    float _5953 = -_5859;
    float _5955 = _625 + _5953;
    float _5957 = -_5835;
    float _5959 = _489 + _5957;
    float _5961 = -_5835;
    float _5963 = _481 + _5961;
    float _5965 = -_5835;
    float _5967 = _435 + _5965;
    float _5969 = -_5835;
    float _5971 = _427 + _5969;
    float _5973 = -_5835;
    float _5975 = _393 + _5973;
    float _5977 = -_5835;
    float _5979 = _341 + _5977;
    float _5981 = -_5835;
    float _5983 = _333 + _5981;
    float _5985 = -_5835;
    float _5987 = _613 + _5985;
    float _5989 = -_5835;
    float _5991 = _605 + _5989;
    float _5993 = -_5835;
    float _5995 = _597 + _5993;
    float _5997 = _5871 * _5935;
    float _5999 = _5855 * _5935;
    float _6001 = _5889 * _5935;
    float _6003 = -_5835;
    float _6005 = _589 + _6003;
    float _6007 = _5997 * _5863;
    float _6009 = _5997 * _5875;
    float _6011 = _5997 * _5893;
    float _6013 = -_5835;
    float _6015 = _569 + _6013;
    float _6017 = fma(_5999, _5847, _6007);
    float _6019 = fma(_5999, _5883, _6009);
    float _6021 = -_5835;
    float _6023 = _561 + _6021;
    float _6025 = -_5835;
    float _6027 = _553 + _6025;
    float _6029 = fma(_6001, _5879, _6017);
    float _6031 = _5997 * _5897;
    float _6033 = _5997 * _5903;
    float _6035 = _5997 * _5907;
    float _6037 = _5997 * _5911;
    float _6039 = _5997 * _5917;
    float _6041 = _5997 * _5921;
    float _6043 = _5997 * _5925;
    float _6045 = _5997 * _5929;
    float _6047 = _5997 * _5933;
    float _6049 = _5997 * _5939;
    float _6051 = _5997 * _5943;
    float _6053 = _5997 * _5947;
    float _6055 = _5997 * _5951;
    float _6057 = fma(_6001, _5955, _6019);
    bool _6059 = _6029 >= 0.5;
    float _6061 = -_5859;
    float _6063 = _493 + _6061;
    float _6065 = fma(_5999, _5959, _6011);
    float _6067 = -_5859;
    float _6069 = _485 + _6067;
    float _6071 = -_5859;
    float _6073 = _439 + _6071;
    float _6075 = -_5859;
    float _6077 = _431 + _6075;
    float _6079 = -_5859;
    float _6081 = _397 + _6079;
    float _6083 = -_5859;
    float _6085 = _345 + _6083;
    float _6087 = -_5859;
    float _6089 = _337 + _6087;
    float _6091 = -_5859;
    float _6093 = _617 + _6091;
    float _6095 = -_5859;
    float _6097 = _609 + _6095;
    float _6099 = -_5859;
    float _6101 = _601 + _6099;
    float _6103 = -_5859;
    float _6105 = _593 + _6103;
    float _6107 = -_5859;
    float _6109 = _573 + _6107;
    float _6111 = -_5859;
    float _6113 = _565 + _6111;
    float _6115 = -_5859;
    float _6117 = _557 + _6115;
    float _6119 = fma(_5999, _5963, _6031);
    float _6121 = fma(_5999, _5967, _6033);
    float _6123 = fma(_5999, _5971, _6035);
    float _6125 = fma(_5999, _5975, _6037);
    float _6127 = fma(_5999, _5979, _6039);
    float _6129 = fma(_5999, _5983, _6041);
    float _6131 = fma(_5999, _5987, _6043);
    float _6133 = fma(_5999, _5991, _6045);
    float _6135 = fma(_5999, _5995, _6047);
    float _6137 = fma(_5999, _6005, _6049);
    float _6139 = fma(_5999, _6015, _6051);
    float _6141 = fma(_5999, _6023, _6053);
    float _6143 = fma(_5999, _6027, _6055);
    float _6145 = fma(_6001, _6063, _6065);
    bool _6147 = _6057 >= 0.5;
    float _6149 = fma(_6001, _6069, _6119);
    bool _6151 = _6029 >= 0.833000004291534423828125;
    float _6153 = fma(_6001, _6073, _6121);
    float _6155 = fma(_6001, _6077, _6123);
    float _6157 = fma(_6001, _6081, _6125);
    float _6159 = fma(_6001, _6085, _6127);
    float _6161 = fma(_6001, _6089, _6129);
    float _6163 = fma(_6001, _6093, _6131);
    float _6165 = fma(_6001, _6097, _6133);
    float _6167 = fma(_6001, _6101, _6135);
    float _6169 = fma(_6001, _6105, _6137);
    float _6171 = fma(_6001, _6109, _6139);
    float _6173 = fma(_6001, _6113, _6141);
    float _6175 = fma(_6001, _6117, _6143);
    bool _6177 = _6029 >= 0.16599999368190765380859375;
    int _6179 = _6151 ? 0 : 32768;
    bool _6181 = _6057 >= 0.833000004291534423828125;
    bool _6183 = _6145 >= 0.5;
    int _6185 = _6179;
    if (!_6059)
    {
        int _6187 = _6177 ? 49152 : 16384;
        _6185 = _6187;
    }
    int _6189 = _6185;
    bool _6191 = _6057 >= 0.16599999368190765380859375;
    int _6193 = _6181 ? 0 : 32768;
    bool _6195 = _6163 >= 0.5;
    bool _6197 = _6145 >= 0.833000004291534423828125;
    int _6199 = _6193;
    if (!_6147)
    {
        int _6201 = _6191 ? 49152 : 16384;
        _6199 = _6201;
    }
    int _6203 = _6199;
    bool _6205 = _6145 >= 0.16599999368190765380859375;
    bool _6207 = _6163 >= 0.833000004291534423828125;
    int _6209 = _6197 ? 0 : 8192;
    bool _6211 = _6149 >= 0.5;
    bool _6213 = _6163 >= 0.16599999368190765380859375;
    int _6215 = _6207 ? 0 : 8192;
    int _6217 = _6209;
    int _6219 = _6215;
    if (!_6183)
    {
        int _6221 = _6205 ? 12288 : 4096;
        _6217 = _6221;
    }
    int _6223 = _6217;
    bool _6225 = _6149 >= 0.833000004291534423828125;
    bool _6227 = _6165 >= 0.5;
    if (!_6195)
    {
        int _6229 = _6213 ? 12288 : 4096;
        _6219 = _6229;
    }
    int _6231 = _6219;
    int _6233 = _6225 ? 0 : 2048;
    bool _6235 = _6149 >= 0.16599999368190765380859375;
    bool _6237 = _6165 >= 0.833000004291534423828125;
    bool _6239 = _6153 >= 0.5;
    bool _6241 = _6165 >= 0.16599999368190765380859375;
    int _6243 = _6237 ? 0 : 2048;
    int _6245 = _6233;
    int _6247 = _6243;
    if (!_6211)
    {
        int _6249 = _6235 ? 3072 : 1024;
        _6245 = _6249;
    }
    int _6251 = _6245;
    bool _6253 = _6153 >= 0.833000004291534423828125;
    bool _6255 = _6167 >= 0.5;
    if (!_6227)
    {
        int _6257 = _6241 ? 3072 : 1024;
        _6247 = _6257;
    }
    int _6259 = _6247;
    bool _6261 = _6153 >= 0.16599999368190765380859375;
    int _6263 = _6253 ? 0 : 512;
    bool _6265 = _6155 >= 0.5;
    bool _6267 = _6167 >= 0.833000004291534423828125;
    int _6269 = _6263;
    if (!_6239)
    {
        int _6271 = _6261 ? 768 : 256;
        _6269 = _6271;
    }
    int _6273 = _6269;
    bool _6275 = _6167 >= 0.16599999368190765380859375;
    bool _6277 = _6169 >= 0.5;
    int _6279 = _6267 ? 0 : 512;
    bool _6281 = _6155 >= 0.833000004291534423828125;
    int _6283 = _6279;
    if (!_6255)
    {
        int _6285 = _6275 ? 768 : 256;
        _6283 = _6285;
    }
    int _6287 = _6283;
    bool _6289 = _6155 >= 0.16599999368190765380859375;
    bool _6291 = _6169 >= 0.833000004291534423828125;
    int _6293 = _6281 ? 0 : 128;
    bool _6295 = _6169 >= 0.16599999368190765380859375;
    bool _6297 = _6157 >= 0.5;
    int _6299 = _6291 ? 0 : 128;
    int _6301 = _6293;
    int _6303 = _6299;
    if (!_6265)
    {
        int _6305 = _6289 ? 192 : 64;
        _6301 = _6305;
    }
    int _6307 = _6301;
    bool _6309 = _6157 >= 0.833000004291534423828125;
    bool _6311 = _6171 >= 0.5;
    if (!_6277)
    {
        int _6313 = _6295 ? 192 : 64;
        _6303 = _6313;
    }
    int _6315 = _6303;
    int _6317 = _6309 ? 0 : 32;
    bool _6319 = _6159 >= 0.5;
    bool _6321 = _6157 >= 0.16599999368190765380859375;
    bool _6323 = _6171 >= 0.833000004291534423828125;
    bool _6325 = _6171 >= 0.16599999368190765380859375;
    int _6327 = _6323 ? 0 : 32;
    int _6329 = _6317;
    int _6331 = _6327;
    if (!_6297)
    {
        int _6333 = _6321 ? 48 : 16;
        _6329 = _6333;
    }
    int _6335 = _6329;
    bool _6337 = _6159 >= 0.833000004291534423828125;
    bool _6339 = _6173 >= 0.5;
    if (!_6311)
    {
        int _6341 = _6325 ? 48 : 16;
        _6331 = _6341;
    }
    int _6343 = _6331;
    bool _6345 = _6159 >= 0.16599999368190765380859375;
    bool _6347 = _6173 >= 0.833000004291534423828125;
    int _6349 = _6337 ? 0 : 8;
    int _6351 = _6347 ? 0 : 8;
    int _6353 = _6349;
    int _6355 = _6351;
    if (!_6319)
    {
        int _6357 = _6345 ? 12 : 4;
        _6353 = _6357;
    }
    int _6359 = _6353;
    bool _6361 = _6161 >= 0.5;
    bool _6363 = _6175 >= 0.5;
    bool _6365 = _6173 >= 0.16599999368190765380859375;
    int _6367 = _6251 + _6189;
    int _6369 = _6367 + _6223;
    int _6371 = _6259 + _6203;
    int _6373 = _6371 + _6231;
    if (!_6339)
    {
        int _6375 = _6365 ? 12 : 4;
        _6355 = _6375;
    }
    int _6377 = _6355;
    bool _6379 = _6161 >= 0.833000004291534423828125;
    bool _6381 = _6175 >= 0.833000004291534423828125;
    bool _6383 = _6161 >= 0.16599999368190765380859375;
    bool _6385 = _6175 >= 0.16599999368190765380859375;
    int _6387 = _6307 + _6369;
    int _6389 = _6387 + _6273;
    int _6391 = _6315 + _6373;
    int _6393 = _6391 + _6287;
    int _6395 = _6379 ? 0 : 2;
    int _6397 = _6381 ? 0 : 2;
    int _6399 = _6395;
    int _6401 = _6397;
    if (!_6361)
    {
        int _6403 = _6383 ? 3 : 1;
        _6399 = _6403;
    }
    int _6405 = _6399;
    if (!_6363)
    {
        int _6407 = _6385 ? 3 : 1;
        _6401 = _6407;
    }
    int _6409 = _6401;
    int _6411 = _6359 + _6389;
    int _6413 = _6411 + _6335;
    int _6415 = _6377 + _6393;
    int _6417 = _6415 + _6343;
    bool _6419 = !_5825;
    int _6421 = _6419 ? _5803 : _5799;
    bool _6423 = !_5825;
    int _6425 = _6423 ? _5799 : _5803;
    int _6427 = _6413 + _6405;
    int _6429 = _6417 + _6409;
    out.m_36.x = as_type<float>(_6421);
    out.m_36.y = as_type<float>(_6425);
    out.m_36.z = as_type<float>(_6427);
    out.m_36.w = as_type<float>(_6429);
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5434 = false;
    bool _5416 = false;
    bool _5272 = false;
    bool _5254 = false;
    bool _5110 = false;
    bool _5092 = false;
    bool _4948 = false;
    bool _4930 = false;
    bool _4786 = false;
    bool _4768 = false;
    bool _4624 = false;
    bool _4606 = false;
    bool _4462 = false;
    bool _4444 = false;
    bool _4300 = false;
    bool _4282 = false;
    bool _4138 = false;
    bool _4120 = false;
    bool _3976 = false;
    bool _3958 = false;
    bool _3814 = false;
    bool _3796 = false;
    bool _3652 = false;
    bool _3634 = false;
    bool _3490 = false;
    bool _3472 = false;
    bool _3328 = false;
    bool _3310 = false;
    bool _3166 = false;
    bool _3148 = false;
    bool _3038 = false;
    bool _3004 = false;
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_29.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _43;
    float _101 = _99 * _49;
    float _103 = _99 * _55;
    float _105 = _99 * _61;
    float _107 = _99 * _67;
    float _109 = _99 * _73;
    float _111 = _99 * _79;
    float _113 = abs(_101);
    float _115 = abs(_103);
    float _117 = precise::max(_113, _115);
    float _119 = _101 + _105;
    float _121 = _103 + _107;
    float _123 = _109 + _111;
    float _125 = abs(_109);
    float _127 = precise::max(_125, _117);
    float _129 = fma(_105, 2.0, _101);
    float _131 = fma(_107, 2.0, _103);
    float _133 = abs(_119);
    float _135 = abs(_121);
    float _137 = precise::max(_133, _135);
    float _139 = fma(_111, 2.0, _109);
    float _141 = _99 * _91;
    float _143 = fma(_105, 3.0, _101);
    float _145 = abs(_123);
    float _147 = precise::max(_145, _137);
    float _149 = _99 * _85;
    float _151 = abs(_129);
    float _153 = abs(_131);
    float _155 = precise::max(_151, _153);
    float _157 = fma(_107, 3.0, _103);
    float _159 = 1.0 / _127;
    float _161 = _99 * _97;
    float _163 = abs(_139);
    float _165 = precise::max(_163, _155);
    float _167 = fma(_149, 2.0, _101);
    float _169 = fma(_141, 2.0, _103);
    float _171 = fma(_111, 3.0, _109);
    float _173 = abs(_143);
    float _175 = abs(_157);
    float _177 = precise::max(_173, _175);
    float _179 = _101 + _149;
    float _181 = 1.0 / _165;
    float _183 = _103 + _141;
    float _185 = fma(_161, 2.0, _109);
    float _187 = abs(_171);
    float _189 = precise::max(_187, _177);
    float _191 = _109 + _161;
    float _193 = _129 + _149;
    float _195 = abs(_179);
    float _197 = abs(_183);
    float _199 = precise::max(_195, _197);
    float _201 = _131 + _141;
    float _203 = 1.0 / _147;
    float _205 = abs(_167);
    float _207 = abs(_169);
    float _209 = precise::max(_205, _207);
    float _211 = _119 + _149;
    float _213 = _121 + _141;
    float _215 = abs(_191);
    float _217 = precise::max(_215, _199);
    float _219 = _139 + _161;
    float _221 = abs(_185);
    float _223 = precise::max(_221, _209);
    float _225 = fma(_149, 3.0, _101);
    float _227 = 1.0 / _189;
    float _229 = fma(_141, 3.0, _103);
    float _231 = fma(_161, 3.0, _109);
    float _233 = _101 * _159;
    float _235 = _103 * _159;
    float _237 = _109 * _159;
    float _239 = _123 + _161;
    float _241 = abs(_211);
    float _243 = abs(_213);
    float _245 = precise::max(_241, _243);
    float _247 = 1.0 / _223;
    float _249 = _143 + _149;
    float _251 = _157 + _141;
    float _253 = abs(_239);
    float _255 = precise::max(_253, _245);
    float _257 = _171 + _161;
    float _259 = fma(_149, 2.0, _119);
    float _261 = fma(_149, 3.0, _119);
    float _263 = abs(_249);
    float _265 = abs(_251);
    float _267 = precise::max(_263, _265);
    float _269 = 1.0 / _217;
    float _271 = abs(_193);
    float _273 = abs(_201);
    float _275 = precise::max(_271, _273);
    float _277 = fma(_141, 2.0, _121);
    float _279 = fma(_141, 3.0, _121);
    float _281 = fma(_149, 2.0, _129);
    float _283 = abs(_219);
    float _285 = precise::max(_283, _275);
    float _287 = fma(_141, 2.0, _131);
    float _289 = _119 * _203;
    float _291 = 1.0 / _255;
    float _293 = _121 * _203;
    float _295 = _123 * _203;
    float _297 = abs(_257);
    float _299 = precise::max(_297, _267);
    float _301 = fma(_161, 2.0, _139);
    float _303 = fma(_161, 2.0, _123);
    float _305 = fma(_149, 3.0, _129);
    float _307 = fma(_141, 3.0, _131);
    float _309 = 1.0 / _285;
    float _311 = abs(_281);
    float _313 = abs(_287);
    float _315 = precise::max(_311, _313);
    float _317 = _139 * _181;
    float _319 = abs(_259);
    float _321 = abs(_277);
    float _323 = precise::max(_319, _321);
    float _325 = _129 * _181;
    float _327 = _131 * _181;
    float3 _6814 = float3(_233, _235, _237);
    float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6814, float3(0.0), isnan(_6814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6814, float3(0.0), isnan(_6814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float3 _6835 = float3(_289, _293, _295);
    float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6835, float3(0.0), isnan(_6835)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6835, float3(0.0), isnan(_6835)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _341 = _339.x;
    float _343 = _339.y;
    float _345 = _339.z;
    float _347 = 1.0 / _299;
    float _349 = fma(_161, 3.0, _123);
    float _351 = fma(_161, 3.0, _139);
    float _353 = abs(_301);
    float _355 = precise::max(_353, _315);
    float _357 = _179 * _269;
    float _359 = _183 * _269;
    float _361 = _191 * _269;
    float _363 = abs(_303);
    float _365 = precise::max(_363, _323);
    float _367 = fma(_149, 2.0, _143);
    float _369 = fma(_141, 2.0, _157);
    float _371 = fma(_149, 3.0, _143);
    float _373 = fma(_141, 3.0, _157);
    float _375 = abs(_305);
    float _377 = abs(_307);
    float _379 = precise::max(_375, _377);
    float _381 = _143 * _227;
    float _383 = _157 * _227;
    float _385 = fma(_161, 2.0, _171);
    float _387 = fma(_161, 3.0, _171);
    float _389 = _171 * _227;
    float3 _6913 = float3(_325, _327, _317);
    float3 _391 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6913, float3(0.0), isnan(_6913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6913, float3(0.0), isnan(_6913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = abs(_225);
    float _401 = abs(_229);
    float _403 = precise::max(_399, _401);
    float _405 = 1.0 / _365;
    float _407 = abs(_351);
    float _409 = precise::max(_407, _379);
    float _411 = _201 * _309;
    float _413 = abs(_367);
    float _415 = abs(_369);
    float _417 = precise::max(_413, _415);
    float _419 = _211 * _291;
    float _421 = _213 * _291;
    float _423 = _239 * _291;
    float3 _6963 = float3(_381, _383, _389);
    float3 _425 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6963, float3(0.0), isnan(_6963)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6963, float3(0.0), isnan(_6963)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _427 = _425.x;
    float _429 = _425.y;
    float _431 = _425.z;
    float3 _6980 = float3(_357, _359, _361);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6980, float3(0.0), isnan(_6980)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = abs(_231);
    float _443 = precise::max(_441, _403);
    float _445 = 1.0 / _409;
    float _447 = abs(_371);
    float _449 = abs(_373);
    float _451 = precise::max(_447, _449);
    float _453 = _193 * _309;
    float _455 = abs(_261);
    float _457 = abs(_279);
    float _459 = precise::max(_455, _457);
    float _461 = _251 * _347;
    float _463 = abs(_385);
    float _465 = precise::max(_463, _417);
    float _467 = _219 * _309;
    float _469 = abs(_387);
    float _471 = precise::max(_469, _451);
    float _473 = 1.0 / _355;
    float _475 = abs(_349);
    float _477 = precise::max(_475, _459);
    float3 _7044 = float3(_419, _421, _423);
    float3 _479 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7044, float3(0.0), isnan(_7044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7044, float3(0.0), isnan(_7044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _481 = _479.x;
    float _483 = _479.y;
    float _485 = _479.z;
    float3 _7061 = float3(_453, _411, _467);
    float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7061, float3(0.0), isnan(_7061)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7061, float3(0.0), isnan(_7061)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _489 = _487.x;
    float _491 = _487.y;
    float _493 = _487.z;
    float _495 = _167 * _247;
    float _497 = _169 * _247;
    float _499 = _185 * _247;
    float _501 = _249 * _347;
    float _503 = 1.0 / _443;
    float _505 = _257 * _347;
    float _507 = _277 * _405;
    float _509 = _259 * _405;
    float _511 = _305 * _445;
    float _513 = _307 * _445;
    float _515 = _351 * _445;
    float _517 = _303 * _405;
    float _519 = 1.0 / _465;
    float _521 = _281 * _473;
    float _523 = _287 * _473;
    float _525 = _301 * _473;
    float _527 = 1.0 / _477;
    float _529 = _225 * _503;
    float _531 = _229 * _503;
    float _533 = _231 * _503;
    float _535 = 1.0 / _471;
    float _537 = _367 * _519;
    float _539 = _369 * _519;
    float _541 = _385 * _519;
    float3 _7146 = float3(_501, _461, _505);
    float3 _543 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7146, float3(0.0), isnan(_7146)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7146, float3(0.0), isnan(_7146)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _545 = _543.x;
    float _547 = _543.y;
    float _549 = _543.z;
    float3 _7163 = float3(_495, _497, _499);
    float3 _551 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7163, float3(0.0), isnan(_7163)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7163, float3(0.0), isnan(_7163)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float3 _7180 = float3(_509, _507, _517);
    float3 _559 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7180, float3(0.0), isnan(_7180)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7180, float3(0.0), isnan(_7180)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float3 _7197 = float3(_521, _523, _525);
    float3 _567 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7197, float3(0.0), isnan(_7197)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7197, float3(0.0), isnan(_7197)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _261 * _527;
    float _577 = _279 * _527;
    float _579 = _349 * _527;
    float _581 = _371 * _535;
    float _583 = _373 * _535;
    float _585 = _387 * _535;
    float3 _7232 = float3(_537, _539, _541);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7232, float3(0.0), isnan(_7232)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7232, float3(0.0), isnan(_7232)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float3 _7249 = float3(_529, _531, _533);
    float3 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7249, float3(0.0), isnan(_7249)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7249, float3(0.0), isnan(_7249)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float3 _7266 = float3(_575, _577, _579);
    float3 _603 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7266, float3(0.0), isnan(_7266)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7266, float3(0.0), isnan(_7266)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _605 = _603.x;
    float _607 = _603.y;
    float _609 = _603.z;
    float3 _7283 = float3(_511, _513, _515);
    float3 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7283, float3(0.0), isnan(_7283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7283, float3(0.0), isnan(_7283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float3 _7300 = float3(_581, _583, _585);
    float3 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7300, float3(0.0), isnan(_7300)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7300, float3(0.0), isnan(_7300)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _335 + _343;
    float _629 = _333 + _341;
    float _631 = _337 + _345;
    float _633 = _395 + _627;
    float _635 = _393 + _629;
    float _637 = _397 + _631;
    float _639 = _429 + _633;
    float _641 = _427 + _635;
    float _643 = _431 + _637;
    float _645 = _437 + _639;
    float _647 = _435 + _641;
    float _649 = _439 + _643;
    float _651 = _483 + _645;
    float _653 = _481 + _647;
    float _655 = _485 + _649;
    float _657 = _491 + _651;
    float _659 = _489 + _653;
    float _661 = _493 + _655;
    float _663 = _547 + _657;
    float _665 = _545 + _659;
    float _667 = _549 + _661;
    float _669 = _555 + _663;
    float _671 = _553 + _665;
    float _673 = _557 + _667;
    float _675 = _563 + _669;
    float _677 = _561 + _671;
    float _679 = _565 + _673;
    float _681 = _571 + _675;
    float _683 = _569 + _677;
    float _685 = _573 + _679;
    float _687 = _591 + _681;
    float _689 = _589 + _683;
    float _691 = _593 + _685;
    float _693 = _599 + _687;
    float _695 = _597 + _689;
    float _697 = _601 + _691;
    float _699 = _607 + _693;
    float _701 = _605 + _695;
    float _703 = _609 + _697;
    float _705 = _615 + _699;
    float _707 = _613 + _701;
    float _709 = _617 + _703;
    float _711 = _623 + _705;
    float _713 = _621 + _707;
    float _715 = _625 + _709;
    float _717 = fma(_711, -0.0625, _343);
    float _719 = fma(_713, -0.0625, _341);
    float _721 = fma(_715, -0.0625, _345);
    float _723 = fma(_711, -0.0625, _335);
    float _725 = fma(_713, -0.0625, _333);
    float _727 = _719 * _717;
    float _729 = _719 * _719;
    float _731 = fma(_715, -0.0625, _337);
    float _733 = _717 * _717;
    float _735 = _717 * _721;
    float _737 = _719 * _721;
    float _739 = fma(_725, _723, _727);
    float _741 = fma(_723, _723, _733);
    float _743 = fma(_723, _731, _735);
    float _745 = fma(_725, _725, _729);
    float _747 = fma(_725, _731, _737);
    float _749 = _721 * _721;
    float _751 = fma(_711, -0.0625, _395);
    float _753 = fma(_713, -0.0625, _393);
    float _755 = fma(_715, -0.0625, _397);
    float _757 = fma(_731, _731, _749);
    float _759 = fma(_751, _751, _741);
    float _761 = fma(_753, _751, _739);
    float _763 = fma(_751, _755, _743);
    float _765 = fma(_753, _753, _745);
    float _767 = fma(_753, _755, _747);
    float _769 = fma(_711, -0.0625, _429);
    float _771 = fma(_713, -0.0625, _427);
    float _773 = fma(_715, -0.0625, _431);
    float _775 = fma(_755, _755, _757);
    float _777 = fma(_769, _769, _759);
    float _779 = fma(_771, _769, _761);
    float _781 = fma(_769, _773, _763);
    float _783 = fma(_771, _771, _765);
    float _785 = fma(_771, _773, _767);
    float _787 = fma(_711, -0.0625, _437);
    float _789 = fma(_713, -0.0625, _435);
    float _791 = fma(_715, -0.0625, _439);
    float _793 = fma(_773, _773, _775);
    float _795 = fma(_787, _787, _777);
    float _797 = fma(_789, _787, _779);
    float _799 = fma(_787, _791, _781);
    float _801 = fma(_789, _789, _783);
    float _803 = fma(_789, _791, _785);
    float _805 = fma(_711, -0.0625, _483);
    float _807 = fma(_713, -0.0625, _481);
    float _809 = fma(_715, -0.0625, _485);
    float _811 = fma(_791, _791, _793);
    float _813 = fma(_805, _805, _795);
    float _815 = fma(_807, _805, _797);
    float _817 = fma(_805, _809, _799);
    float _819 = fma(_807, _807, _801);
    float _821 = fma(_807, _809, _803);
    float _823 = fma(_711, -0.0625, _491);
    float _825 = fma(_713, -0.0625, _489);
    float _827 = fma(_715, -0.0625, _493);
    float _829 = fma(_809, _809, _811);
    float _831 = fma(_823, _823, _813);
    float _833 = fma(_825, _823, _815);
    float _835 = fma(_823, _827, _817);
    float _837 = fma(_825, _825, _819);
    float _839 = fma(_825, _827, _821);
    float _841 = fma(_711, -0.0625, _547);
    float _843 = fma(_713, -0.0625, _545);
    float _845 = fma(_715, -0.0625, _549);
    float _847 = fma(_827, _827, _829);
    float _849 = fma(_841, _841, _831);
    float _851 = fma(_843, _841, _833);
    float _853 = fma(_841, _845, _835);
    float _855 = fma(_843, _843, _837);
    float _857 = fma(_843, _845, _839);
    float _859 = fma(_711, -0.0625, _555);
    float _861 = fma(_713, -0.0625, _553);
    float _863 = fma(_715, -0.0625, _557);
    float _865 = fma(_845, _845, _847);
    float _867 = fma(_859, _859, _849);
    float _869 = fma(_861, _859, _851);
    float _871 = fma(_859, _863, _853);
    float _873 = fma(_861, _861, _855);
    float _875 = fma(_861, _863, _857);
    float _877 = fma(_711, -0.0625, _563);
    float _879 = fma(_713, -0.0625, _561);
    float _881 = fma(_715, -0.0625, _565);
    float _883 = fma(_863, _863, _865);
    float _885 = fma(_877, _877, _867);
    float _887 = fma(_879, _877, _869);
    float _889 = fma(_877, _881, _871);
    float _891 = fma(_879, _879, _873);
    float _893 = fma(_879, _881, _875);
    float _895 = fma(_711, -0.0625, _571);
    float _897 = fma(_713, -0.0625, _569);
    float _899 = fma(_715, -0.0625, _573);
    float _901 = fma(_881, _881, _883);
    float _903 = fma(_895, _895, _885);
    float _905 = fma(_897, _895, _887);
    float _907 = fma(_895, _899, _889);
    float _909 = fma(_897, _897, _891);
    float _911 = fma(_897, _899, _893);
    float _913 = fma(_711, -0.0625, _591);
    float _915 = fma(_713, -0.0625, _589);
    float _917 = fma(_715, -0.0625, _593);
    float _919 = fma(_899, _899, _901);
    float _921 = fma(_913, _913, _903);
    float _923 = fma(_915, _913, _905);
    float _925 = fma(_913, _917, _907);
    float _927 = fma(_915, _915, _909);
    float _929 = fma(_915, _917, _911);
    float _931 = fma(_711, -0.0625, _599);
    float _933 = fma(_713, -0.0625, _597);
    float _935 = fma(_715, -0.0625, _601);
    float _937 = fma(_917, _917, _919);
    float _939 = fma(_931, _931, _921);
    float _941 = fma(_933, _931, _923);
    float _943 = fma(_931, _935, _925);
    float _945 = fma(_933, _933, _927);
    float _947 = fma(_933, _935, _929);
    float _949 = fma(_711, -0.0625, _607);
    float _951 = fma(_713, -0.0625, _605);
    float _953 = fma(_715, -0.0625, _609);
    float _955 = fma(_935, _935, _937);
    float _957 = fma(_949, _949, _939);
    float _959 = fma(_951, _949, _941);
    float _961 = fma(_949, _953, _943);
    float _963 = fma(_951, _951, _945);
    float _965 = fma(_951, _953, _947);
    float _967 = fma(_711, -0.0625, _615);
    float _969 = fma(_713, -0.0625, _613);
    float _971 = fma(_715, -0.0625, _617);
    float _973 = fma(_711, -0.0625, _623);
    float _975 = fma(_967, _967, _957);
    float _977 = fma(_969, _967, _959);
    float _979 = fma(_713, -0.0625, _621);
    float _981 = fma(_967, _971, _961);
    float _983 = fma(_715, -0.0625, _625);
    float _985 = fma(_969, _969, _963);
    float _987 = fma(_973, _973, _975);
    float _989 = fma(_979, _973, _977);
    float _991 = fma(_953, _953, _955);
    float _993 = fma(_969, _971, _965);
    float _995 = fma(_973, _983, _981);
    float _997 = fma(_979, _979, _985);
    float _999 = _987 + _989;
    float _1001 = fma(_971, _971, _991);
    float _1003 = fma(_979, _983, _993);
    float _1005 = _997 + _989;
    float _1007 = _995 + _999;
    float _1009 = fma(_983, _983, _1001);
    float _1011 = _995 + _1003;
    float _1013 = _1003 + _1005;
    float _1015 = _1007 * _1007;
    float _1017 = _1009 + _1011;
    float _1019 = fma(_1013, _1013, _1015);
    float _1021 = fma(_1017, _1017, _1019);
    float _1023 = rsqrt(_1021);
    float _1025 = _1007 * _1023;
    float _1027 = _1013 * _1023;
    float _1029 = _1017 * _1023;
    float _1031 = _987 * _1025;
    float _1033 = _989 * _1025;
    float _1035 = fma(_989, _1027, _1031);
    float _1037 = _995 * _1025;
    float _1039 = fma(_997, _1027, _1033);
    float _1041 = fma(_995, _1029, _1035);
    float _1043 = fma(_1003, _1027, _1037);
    float _1045 = fma(_1003, _1029, _1039);
    float _1047 = _1041 * _1041;
    float _1049 = fma(_1009, _1029, _1043);
    float _1051 = fma(_1045, _1045, _1047);
    float _1053 = fma(_1049, _1049, _1051);
    float _1055 = rsqrt(_1053);
    float _1057 = _1041 * _1055;
    float _1059 = _1045 * _1055;
    float _1061 = _1049 * _1055;
    float _1063 = _987 * _1057;
    float _1065 = _989 * _1057;
    float _1067 = _995 * _1057;
    float _1069 = fma(_989, _1059, _1063);
    float _1071 = fma(_997, _1059, _1065);
    float _1073 = fma(_1003, _1059, _1067);
    float _1075 = fma(_995, _1061, _1069);
    float _1077 = fma(_1003, _1061, _1071);
    float _1079 = fma(_1009, _1061, _1073);
    float _1081 = _1075 * _1075;
    float _1083 = fma(_1077, _1077, _1081);
    float _1085 = fma(_1079, _1079, _1083);
    float _1087 = rsqrt(_1085);
    float _1089 = _1075 * _1087;
    float _1091 = _1077 * _1087;
    float _1093 = _1079 * _1087;
    float _1095 = _987 * _1089;
    float _1097 = _989 * _1089;
    float _1099 = _995 * _1089;
    float _1101 = fma(_989, _1091, _1095);
    float _1103 = fma(_997, _1091, _1097);
    float _1105 = fma(_1003, _1091, _1099);
    float _1107 = fma(_995, _1093, _1101);
    float _1109 = fma(_1003, _1093, _1103);
    float _1111 = fma(_1009, _1093, _1105);
    float _1113 = _1107 * _1107;
    float _1115 = fma(_1109, _1109, _1113);
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = rsqrt(_1117);
    float _1121 = _1107 * _1119;
    float _1123 = _1109 * _1119;
    float _1125 = _1111 * _1119;
    float _1127 = _987 * _1121;
    float _1129 = _989 * _1121;
    float _1131 = _995 * _1121;
    float _1133 = fma(_989, _1123, _1127);
    float _1135 = fma(_997, _1123, _1129);
    float _1137 = fma(_1003, _1123, _1131);
    float _1139 = fma(_995, _1125, _1133);
    float _1141 = fma(_1003, _1125, _1135);
    float _1143 = fma(_1009, _1125, _1137);
    float _1145 = _1139 * _1139;
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = fma(_1143, _1143, _1147);
    float _1151 = rsqrt(_1149);
    float _1153 = _1139 * _1151;
    float _1155 = _1141 * _1151;
    float _1157 = _1143 * _1151;
    float _1159 = _987 * _1153;
    float _1161 = _989 * _1153;
    float _1163 = _995 * _1153;
    float _1165 = fma(_989, _1155, _1159);
    float _1167 = fma(_997, _1155, _1161);
    float _1169 = fma(_1003, _1155, _1163);
    float _1171 = fma(_995, _1157, _1165);
    float _1173 = fma(_1003, _1157, _1167);
    float _1175 = fma(_1009, _1157, _1169);
    float _1177 = _1171 * _1171;
    float _1179 = fma(_1173, _1173, _1177);
    float _1181 = fma(_1175, _1175, _1179);
    float _1183 = rsqrt(_1181);
    float _1185 = _1171 * _1183;
    float _1187 = _1173 * _1183;
    float _1189 = _1175 * _1183;
    float _1191 = _987 * _1185;
    float _1193 = _989 * _1185;
    float _1195 = _995 * _1185;
    float _1197 = fma(_989, _1187, _1191);
    float _1199 = fma(_997, _1187, _1193);
    float _1201 = fma(_1003, _1187, _1195);
    float _1203 = fma(_995, _1189, _1197);
    float _1205 = fma(_1003, _1189, _1199);
    float _1207 = fma(_1009, _1189, _1201);
    float _1209 = _1203 * _1203;
    float _1211 = fma(_1205, _1205, _1209);
    float _1213 = fma(_1207, _1207, _1211);
    float _1215 = rsqrt(_1213);
    float _1217 = _1203 * _1215;
    float _1219 = _1205 * _1215;
    float _1221 = _1207 * _1215;
    float _1223 = _987 * _1217;
    float _1225 = _989 * _1217;
    float _1227 = fma(_989, _1219, _1223);
    float _1229 = _995 * _1217;
    float _1231 = fma(_997, _1219, _1225);
    float _1233 = fma(_995, _1221, _1227);
    float _1235 = fma(_1003, _1219, _1229);
    float _1237 = fma(_1003, _1221, _1231);
    float _1239 = _1233 * _1233;
    float _1241 = fma(_1009, _1221, _1235);
    float _1243 = fma(_1237, _1237, _1239);
    float _1245 = fma(_1241, _1241, _1243);
    float _1247 = rsqrt(_1245);
    float _1249 = _1233 * _1247;
    float _1251 = _1237 * _1247;
    float _1253 = _1241 * _1247;
    float _1255 = _335 * _1249;
    float _1257 = _343 * _1249;
    float _1259 = _395 * _1249;
    float _1261 = fma(_333, _1251, _1255);
    float _1263 = fma(_341, _1251, _1257);
    float _1265 = fma(_393, _1251, _1259);
    float _1267 = fma(_337, _1253, _1261);
    float _1269 = fma(_345, _1253, _1263);
    float _1271 = fma(_397, _1253, _1265);
    bool _1275 = _1267 >= _1269;
    bool _1277 = isnan(_1267);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(_1269);
    bool _1283 = _1279 || _1281;
    float _1285 = _981;
    float _1287 = _1261;
    float _1289 = _1265;
    float _1291 = _1263;
    float _1293 = _1259;
    float _1295 = _1219;
    float _1297 = _1207;
    float _1299 = _1217;
    float _1301 = _1267;
    float _1303 = _1191;
    float _1305 = _1271;
    float _1307 = _1271;
    float _1309 = _1253;
    float _1311 = _1251;
    float _1313 = _213;
    float _1315 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_1283)
    {
        _1285 = _341;
    }
    float _1317 = _1285;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1283)
    {
        _1287 = _343;
    }
    float _1323 = _1287;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1283)
    {
        _1289 = _345;
    }
    float _1329 = _1289;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1283)
    {
        _1291 = _1267;
    }
    float _1335 = _1291;
    float _1337 = _1335;
    float _1339 = _1335;
    if (!_1283)
    {
        _1293 = _1269;
    }
    float _1341 = _1293;
    float _1343 = _1341;
    float _1345 = _1341;
    if (!_1283)
    {
        _1295 = _333;
    }
    float _1347 = _1295;
    float _1349 = _1347;
    float _1351 = _1347;
    if (!_1283)
    {
        _1297 = _335;
    }
    float _1353 = _1297;
    float _1355 = _1353;
    float _1357 = _1353;
    if (!_1283)
    {
        _1299 = _337;
    }
    float _1359 = _1299;
    bool _1361 = !_1283;
    float _1363 = _1359;
    float _1365 = _1359;
    if (!_1361)
    {
        bool _1367 = _1267 > _1269;
        if (!_1367)
        {
            _1337 = _1267;
        }
        float _1369 = _1337;
        float _1371 = _1369;
        if (!_1367)
        {
            _1343 = _1267;
        }
        float _1373 = _1343;
        float _1375 = _1373;
        if (!_1367)
        {
            _1349 = _333;
        }
        float _1377 = _1349;
        float _1379 = _1377;
        if (!_1367)
        {
            _1355 = _335;
        }
        float _1381 = _1355;
        float _1383 = _1381;
        if (!_1367)
        {
            _1363 = _337;
        }
        float _1385 = _1363;
        float _1387 = _1385;
        if (!_1367)
        {
            _1319 = _333;
        }
        float _1389 = _1319;
        float _1391 = _1389;
        if (!_1367)
        {
            _1325 = _335;
        }
        float _1393 = _1325;
        float _1395 = _1393;
        if (!_1367)
        {
            _1331 = _337;
        }
        float _1397 = _1331;
        _1333 = _1397;
        if (_1367)
        {
            _1371 = _1269;
        }
        float _1399 = _1371;
        _1339 = _1399;
        if (_1367)
        {
            _1375 = _1267;
        }
        float _1401 = _1375;
        _1345 = _1401;
        if (_1367)
        {
            _1379 = _341;
        }
        float _1403 = _1379;
        _1351 = _1403;
        if (_1367)
        {
            _1383 = _343;
        }
        float _1405 = _1383;
        _1357 = _1405;
        if (_1367)
        {
            _1387 = _345;
        }
        float _1407 = _1387;
        _1365 = _1407;
        if (_1367)
        {
            _1391 = _333;
        }
        float _1409 = _1391;
        _1321 = _1409;
        if (_1367)
        {
            _1395 = _335;
        }
        float _1411 = _1395;
        _1327 = _1411;
        if (_1367)
        {
            _1333 = _337;
        }
    }
    float _1413 = _1345;
    float _1415 = _1339;
    float _1417 = _1321;
    float _1419 = _1327;
    float _1421 = _1333;
    float _1423 = _1351;
    float _1425 = _1357;
    float _1427 = _1365;
    bool _1429 = _1413 >= _1271;
    bool _1431 = isnan(_1413);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(_1271);
    bool _1437 = _1433 || _1435;
    float _1439 = _429 * _1249;
    float _1441 = fma(_427, _1251, _1439);
    float _1443 = fma(_431, _1253, _1441);
    float _1445 = _1441;
    float _1447 = _1415;
    float _1449 = _1423;
    float _1451 = _1425;
    float _1453 = _1415;
    float _1455 = _1423;
    float _1457 = _1425;
    float _1459 = _1427;
    float _1461 = _1421;
    float _1463 = _1419;
    float _1465 = _1443;
    float _1467 = _1443;
    if (!_1437)
    {
        _1301 = _393;
    }
    float _1469 = _1301;
    float _1471 = _1469;
    float _1473 = _1469;
    if (!_1437)
    {
        _1445 = _395;
    }
    float _1475 = _1445;
    float _1477 = _1475;
    float _1479 = _1475;
    if (!_1437)
    {
        _1303 = _397;
    }
    float _1481 = _1303;
    bool _1483 = !_1437;
    float _1485 = _1481;
    float _1487 = _1481;
    if (!_1483)
    {
        bool _1489 = _1415 > _1271;
        if (_1489)
        {
            _1447 = _1271;
        }
        float _1491 = _1447;
        _1453 = _1491;
        if (!_1489)
        {
            _1471 = _1417;
        }
        float _1493 = _1471;
        float _1495 = _1493;
        if (!_1489)
        {
            _1477 = _1419;
        }
        float _1497 = _1477;
        float _1499 = _1497;
        if (!_1489)
        {
            _1485 = _1421;
        }
        float _1501 = _1485;
        float _1503 = _1501;
        if (!_1489)
        {
            _1305 = _1413;
        }
        float _1505 = _1305;
        float _1507 = _1505;
        if (_1489)
        {
            _1495 = _1417;
        }
        float _1509 = _1495;
        _1473 = _1509;
        if (_1489)
        {
            _1499 = _1419;
        }
        float _1511 = _1499;
        _1479 = _1511;
        if (_1489)
        {
            _1503 = _1421;
        }
        float _1513 = _1503;
        _1487 = _1513;
        if (_1489)
        {
            _1507 = _1413;
        }
        float _1515 = _1507;
        _1307 = _1515;
        if (_1489)
        {
            _1449 = _393;
        }
        float _1517 = _1449;
        _1455 = _1517;
        if (_1489)
        {
            _1451 = _395;
        }
        float _1519 = _1451;
        _1457 = _1519;
        if (_1489)
        {
            _1459 = _397;
        }
    }
    float _1521 = _1307;
    float _1523 = _1453;
    float _1525 = _1473;
    float _1527 = _1479;
    float _1529 = _1487;
    float _1531 = _1455;
    float _1533 = _1457;
    float _1535 = _1459;
    bool _1537 = _1521 >= _1443;
    bool _1539 = isnan(_1521);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(_1443);
    bool _1545 = _1541 || _1543;
    float _1547 = _437 * _1249;
    float _1549 = fma(_435, _1251, _1547);
    float _1551 = fma(_439, _1253, _1549);
    float _1553 = _1547;
    float _1555 = _1523;
    float _1557 = _1531;
    float _1559 = _1533;
    float _1561 = _1523;
    float _1563 = _1531;
    float _1565 = _1533;
    float _1567 = _1535;
    float _1569 = _1525;
    float _1571 = _1529;
    float _1573 = _1551;
    float _1575 = _1551;
    if (!_1545)
    {
        _1553 = _427;
    }
    float _1577 = _1553;
    float _1579 = _1577;
    float _1581 = _1577;
    if (!_1545)
    {
        _1461 = _429;
    }
    float _1583 = _1461;
    float _1585 = _1583;
    float _1587 = _1583;
    if (!_1545)
    {
        _1463 = _431;
    }
    float _1589 = _1463;
    bool _1591 = !_1545;
    float _1593 = _1589;
    float _1595 = _1589;
    if (!_1591)
    {
        bool _1597 = _1523 > _1443;
        if (_1597)
        {
            _1555 = _1443;
        }
        float _1599 = _1555;
        _1561 = _1599;
        if (!_1597)
        {
            _1579 = _1525;
        }
        float _1601 = _1579;
        float _1603 = _1601;
        if (!_1597)
        {
            _1585 = _1527;
        }
        float _1605 = _1585;
        float _1607 = _1605;
        if (!_1597)
        {
            _1593 = _1529;
        }
        float _1609 = _1593;
        float _1611 = _1609;
        if (!_1597)
        {
            _1465 = _1521;
        }
        float _1613 = _1465;
        float _1615 = _1613;
        if (_1597)
        {
            _1603 = _1525;
        }
        float _1617 = _1603;
        _1581 = _1617;
        if (_1597)
        {
            _1607 = _1527;
        }
        float _1619 = _1607;
        _1587 = _1619;
        if (_1597)
        {
            _1611 = _1529;
        }
        float _1621 = _1611;
        _1595 = _1621;
        if (_1597)
        {
            _1615 = _1521;
        }
        float _1623 = _1615;
        _1467 = _1623;
        if (_1597)
        {
            _1557 = _427;
        }
        float _1625 = _1557;
        _1563 = _1625;
        if (_1597)
        {
            _1559 = _429;
        }
        float _1627 = _1559;
        _1565 = _1627;
        if (_1597)
        {
            _1567 = _431;
        }
    }
    float _1629 = _1467;
    float _1631 = _1561;
    float _1633 = _1581;
    float _1635 = _1587;
    float _1637 = _1595;
    float _1639 = _1563;
    float _1641 = _1565;
    float _1643 = _1567;
    bool _1645 = _1629 >= _1551;
    bool _1647 = isnan(_1629);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan(_1551);
    bool _1653 = _1649 || _1651;
    float _1655 = _483 * _1249;
    float _1657 = fma(_481, _1251, _1655);
    float _1659 = fma(_485, _1253, _1657);
    float _1661 = _1657;
    float _1663 = _1631;
    float _1665 = _1639;
    float _1667 = _1641;
    float _1669 = _1631;
    float _1671 = _1639;
    float _1673 = _1641;
    float _1675 = _1643;
    float _1677 = _1635;
    float _1679 = _1637;
    float _1681 = _1659;
    float _1683 = _1659;
    float _1685 = _1629;
    if (!_1653)
    {
        _1569 = _435;
    }
    float _1687 = _1569;
    float _1689 = _1687;
    float _1691 = _1687;
    if (!_1653)
    {
        _1661 = _437;
    }
    float _1693 = _1661;
    float _1695 = _1693;
    float _1697 = _1693;
    if (!_1653)
    {
        _1571 = _439;
    }
    float _1699 = _1571;
    bool _1701 = !_1653;
    float _1703 = _1699;
    float _1705 = _1699;
    if (!_1701)
    {
        bool _1707 = _1631 > _1551;
        if (_1707)
        {
            _1663 = _1551;
        }
        float _1709 = _1663;
        _1669 = _1709;
        if (!_1707)
        {
            _1689 = _1633;
        }
        float _1711 = _1689;
        float _1713 = _1711;
        if (!_1707)
        {
            _1695 = _1635;
        }
        float _1715 = _1695;
        float _1717 = _1715;
        if (!_1707)
        {
            _1703 = _1637;
        }
        float _1719 = _1703;
        float _1721 = _1719;
        if (!_1707)
        {
            _1573 = _1629;
        }
        float _1723 = _1573;
        float _1725 = _1723;
        if (_1707)
        {
            _1713 = _1633;
        }
        float _1727 = _1713;
        _1691 = _1727;
        if (_1707)
        {
            _1717 = _1635;
        }
        float _1729 = _1717;
        _1697 = _1729;
        if (_1707)
        {
            _1721 = _1637;
        }
        float _1731 = _1721;
        _1705 = _1731;
        if (_1707)
        {
            _1725 = _1629;
        }
        float _1733 = _1725;
        _1575 = _1733;
        if (_1707)
        {
            _1665 = _435;
        }
        float _1735 = _1665;
        _1671 = _1735;
        if (_1707)
        {
            _1667 = _437;
        }
        float _1737 = _1667;
        _1673 = _1737;
        if (_1707)
        {
            _1675 = _439;
        }
    }
    float _1739 = _1575;
    float _1741 = _1669;
    float _1743 = _1691;
    float _1745 = _1697;
    float _1747 = _1705;
    float _1749 = _1671;
    float _1751 = _1673;
    float _1753 = _1675;
    bool _1755 = _1739 >= _1659;
    bool _1757 = isnan(_1739);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1659);
    bool _1763 = _1759 || _1761;
    float _1765 = _491 * _1249;
    float _1767 = fma(_489, _1251, _1765);
    float _1769 = fma(_493, _1253, _1767);
    float _1771 = _1765;
    float _1773 = _1741;
    float _1775 = _1749;
    float _1777 = _1751;
    float _1779 = _1741;
    float _1781 = _1749;
    float _1783 = _1751;
    float _1785 = _1753;
    float _1787 = _1747;
    float _1789 = _1739;
    float _1791 = _1769;
    float _1793 = _1769;
    if (!_1763)
    {
        _1771 = _481;
    }
    float _1795 = _1771;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1763)
    {
        _1677 = _483;
    }
    float _1801 = _1677;
    float _1803 = _1801;
    float _1805 = _1801;
    if (!_1763)
    {
        _1679 = _485;
    }
    float _1807 = _1679;
    bool _1809 = !_1763;
    float _1811 = _1807;
    float _1813 = _1807;
    if (!_1809)
    {
        bool _1815 = _1741 > _1659;
        if (_1815)
        {
            _1773 = _1659;
        }
        float _1817 = _1773;
        _1779 = _1817;
        if (!_1815)
        {
            _1797 = _1743;
        }
        float _1819 = _1797;
        float _1821 = _1819;
        if (!_1815)
        {
            _1803 = _1745;
        }
        float _1823 = _1803;
        float _1825 = _1823;
        if (!_1815)
        {
            _1811 = _1747;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        if (!_1815)
        {
            _1681 = _1739;
        }
        float _1831 = _1681;
        float _1833 = _1831;
        if (_1815)
        {
            _1821 = _1743;
        }
        float _1835 = _1821;
        _1799 = _1835;
        if (_1815)
        {
            _1825 = _1745;
        }
        float _1837 = _1825;
        _1805 = _1837;
        if (_1815)
        {
            _1829 = _1747;
        }
        float _1839 = _1829;
        _1813 = _1839;
        if (_1815)
        {
            _1833 = _1739;
        }
        float _1841 = _1833;
        _1683 = _1841;
        if (_1815)
        {
            _1775 = _481;
        }
        float _1843 = _1775;
        _1781 = _1843;
        if (_1815)
        {
            _1777 = _483;
        }
        float _1845 = _1777;
        _1783 = _1845;
        if (_1815)
        {
            _1785 = _485;
        }
    }
    float _1847 = _1683;
    float _1849 = _1779;
    float _1851 = _1799;
    float _1853 = _1805;
    float _1855 = _1813;
    float _1857 = _1781;
    float _1859 = _1783;
    float _1861 = _1785;
    bool _1863 = _1847 >= _1769;
    bool _1865 = isnan(_1847);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1769);
    bool _1871 = _1867 || _1869;
    float _1873 = _547 * _1249;
    float _1875 = fma(_545, _1251, _1873);
    float _1877 = fma(_549, _1253, _1875);
    float _1879 = _1849;
    float _1881 = _1857;
    float _1883 = _1859;
    float _1885 = _1849;
    float _1887 = _1857;
    float _1889 = _1859;
    float _1891 = _1861;
    float _1893 = _1853;
    float _1895 = _1855;
    float _1897 = _1877;
    float _1899 = _1877;
    if (!_1871)
    {
        _1787 = _489;
    }
    float _1901 = _1787;
    float _1903 = _1901;
    float _1905 = _1901;
    if (!_1871)
    {
        _1685 = _491;
    }
    float _1907 = _1685;
    float _1909 = _1907;
    float _1911 = _1907;
    if (!_1871)
    {
        _1789 = _493;
    }
    float _1913 = _1789;
    bool _1915 = !_1871;
    float _1917 = _1913;
    float _1919 = _1913;
    if (!_1915)
    {
        bool _1921 = _1849 > _1769;
        if (_1921)
        {
            _1879 = _1769;
        }
        float _1923 = _1879;
        _1885 = _1923;
        if (!_1921)
        {
            _1903 = _1851;
        }
        float _1925 = _1903;
        float _1927 = _1925;
        if (!_1921)
        {
            _1909 = _1853;
        }
        float _1929 = _1909;
        float _1931 = _1929;
        if (!_1921)
        {
            _1917 = _1855;
        }
        float _1933 = _1917;
        float _1935 = _1933;
        if (!_1921)
        {
            _1791 = _1847;
        }
        float _1937 = _1791;
        float _1939 = _1937;
        if (_1921)
        {
            _1927 = _1851;
        }
        float _1941 = _1927;
        _1905 = _1941;
        if (_1921)
        {
            _1931 = _1853;
        }
        float _1943 = _1931;
        _1911 = _1943;
        if (_1921)
        {
            _1935 = _1855;
        }
        float _1945 = _1935;
        _1919 = _1945;
        if (_1921)
        {
            _1939 = _1847;
        }
        float _1947 = _1939;
        _1793 = _1947;
        if (_1921)
        {
            _1881 = _489;
        }
        float _1949 = _1881;
        _1887 = _1949;
        if (_1921)
        {
            _1883 = _491;
        }
        float _1951 = _1883;
        _1889 = _1951;
        if (_1921)
        {
            _1891 = _493;
        }
    }
    float _1953 = _1793;
    float _1955 = _1885;
    float _1957 = _1905;
    float _1959 = _1911;
    float _1961 = _1919;
    float _1963 = _1887;
    float _1965 = _1889;
    float _1967 = _1891;
    bool _1969 = _1953 >= _1877;
    bool _1971 = isnan(_1953);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan(_1877);
    bool _1977 = _1973 || _1975;
    float _1979 = _555 * _1249;
    float _1981 = fma(_553, _1251, _1979);
    float _1983 = fma(_557, _1253, _1981);
    float _1985 = _1979;
    float _1987 = _1955;
    float _1989 = _1963;
    float _1991 = _1965;
    float _1993 = _1955;
    float _1995 = _1963;
    float _1997 = _1965;
    float _1999 = _1967;
    float _2001 = _1961;
    float _2003 = _1983;
    float _2005 = _1983;
    if (!_1977)
    {
        _1985 = _545;
    }
    float _2007 = _1985;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1977)
    {
        _1893 = _547;
    }
    float _2013 = _1893;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1977)
    {
        _1895 = _549;
    }
    float _2019 = _1895;
    bool _2021 = !_1977;
    float _2023 = _2019;
    float _2025 = _2019;
    if (!_2021)
    {
        bool _2027 = _1955 > _1877;
        if (_2027)
        {
            _1987 = _1877;
        }
        float _2029 = _1987;
        _1993 = _2029;
        if (!_2027)
        {
            _2009 = _1957;
        }
        float _2031 = _2009;
        float _2033 = _2031;
        if (!_2027)
        {
            _2015 = _1959;
        }
        float _2035 = _2015;
        float _2037 = _2035;
        if (!_2027)
        {
            _2023 = _1961;
        }
        float _2039 = _2023;
        float _2041 = _2039;
        if (!_2027)
        {
            _1897 = _1953;
        }
        float _2043 = _1897;
        float _2045 = _2043;
        if (_2027)
        {
            _2033 = _1957;
        }
        float _2047 = _2033;
        _2011 = _2047;
        if (_2027)
        {
            _2037 = _1959;
        }
        float _2049 = _2037;
        _2017 = _2049;
        if (_2027)
        {
            _2041 = _1961;
        }
        float _2051 = _2041;
        _2025 = _2051;
        if (_2027)
        {
            _2045 = _1953;
        }
        float _2053 = _2045;
        _1899 = _2053;
        if (_2027)
        {
            _1989 = _545;
        }
        float _2055 = _1989;
        _1995 = _2055;
        if (_2027)
        {
            _1991 = _547;
        }
        float _2057 = _1991;
        _1997 = _2057;
        if (_2027)
        {
            _1999 = _549;
        }
    }
    float _2059 = _1899;
    float _2061 = _1993;
    float _2063 = _2011;
    float _2065 = _2017;
    float _2067 = _2025;
    float _2069 = _1995;
    float _2071 = _1997;
    float _2073 = _1999;
    bool _2075 = _2059 >= _1983;
    bool _2077 = isnan(_2059);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(_1983);
    bool _2083 = _2079 || _2081;
    float _2085 = _563 * _1249;
    float _2087 = fma(_561, _1251, _2085);
    float _2089 = fma(_565, _1253, _2087);
    float _2091 = _2085;
    float _2093 = _2087;
    float _2095 = _2061;
    float _2097 = _2069;
    float _2099 = _2071;
    float _2101 = _2061;
    float _2103 = _2069;
    float _2105 = _2071;
    float _2107 = _2073;
    float _2109 = _2067;
    float _2111 = _2065;
    float _2113 = _2089;
    float _2115 = _2089;
    if (!_2083)
    {
        _2001 = _553;
    }
    float _2117 = _2001;
    float _2119 = _2117;
    float _2121 = _2117;
    if (!_2083)
    {
        _2091 = _555;
    }
    float _2123 = _2091;
    float _2125 = _2123;
    float _2127 = _2123;
    if (!_2083)
    {
        _2093 = _557;
    }
    float _2129 = _2093;
    bool _2131 = !_2083;
    float _2133 = _2129;
    float _2135 = _2129;
    if (!_2131)
    {
        bool _2137 = _2061 > _1983;
        if (_2137)
        {
            _2095 = _1983;
        }
        float _2139 = _2095;
        _2101 = _2139;
        if (!_2137)
        {
            _2119 = _2063;
        }
        float _2141 = _2119;
        float _2143 = _2141;
        if (!_2137)
        {
            _2125 = _2065;
        }
        float _2145 = _2125;
        float _2147 = _2145;
        if (!_2137)
        {
            _2133 = _2067;
        }
        float _2149 = _2133;
        float _2151 = _2149;
        if (!_2137)
        {
            _2003 = _2059;
        }
        float _2153 = _2003;
        float _2155 = _2153;
        if (_2137)
        {
            _2143 = _2063;
        }
        float _2157 = _2143;
        _2121 = _2157;
        if (_2137)
        {
            _2147 = _2065;
        }
        float _2159 = _2147;
        _2127 = _2159;
        if (_2137)
        {
            _2151 = _2067;
        }
        float _2161 = _2151;
        _2135 = _2161;
        if (_2137)
        {
            _2155 = _2059;
        }
        float _2163 = _2155;
        _2005 = _2163;
        if (_2137)
        {
            _2097 = _553;
        }
        float _2165 = _2097;
        _2103 = _2165;
        if (_2137)
        {
            _2099 = _555;
        }
        float _2167 = _2099;
        _2105 = _2167;
        if (_2137)
        {
            _2107 = _557;
        }
    }
    float _2169 = _2005;
    float _2171 = _2101;
    float _2173 = _2121;
    float _2175 = _2127;
    float _2177 = _2135;
    float _2179 = _2103;
    float _2181 = _2105;
    float _2183 = _2107;
    bool _2185 = _2169 >= _2089;
    bool _2187 = isnan(_2169);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(_2089);
    bool _2193 = _2189 || _2191;
    float _2195 = _571 * _1249;
    float _2197 = fma(_569, _1251, _2195);
    float _2199 = fma(_573, _1253, _2197);
    float _2201 = _2197;
    float _2203 = _2171;
    float _2205 = _2179;
    float _2207 = _2181;
    float _2209 = _2171;
    float _2211 = _2179;
    float _2213 = _2181;
    float _2215 = _2183;
    float _2217 = _2177;
    float _2219 = _2199;
    float _2221 = _2199;
    if (!_2193)
    {
        _2109 = _561;
    }
    float _2223 = _2109;
    float _2225 = _2223;
    float _2227 = _2223;
    if (!_2193)
    {
        _2111 = _563;
    }
    float _2229 = _2111;
    float _2231 = _2229;
    float _2233 = _2229;
    if (!_2193)
    {
        _2201 = _565;
    }
    float _2235 = _2201;
    bool _2237 = !_2193;
    float _2239 = _2235;
    float _2241 = _2235;
    if (!_2237)
    {
        bool _2243 = _2171 > _2089;
        if (_2243)
        {
            _2203 = _2089;
        }
        float _2245 = _2203;
        _2209 = _2245;
        if (!_2243)
        {
            _2225 = _2173;
        }
        float _2247 = _2225;
        float _2249 = _2247;
        if (!_2243)
        {
            _2231 = _2175;
        }
        float _2251 = _2231;
        float _2253 = _2251;
        if (!_2243)
        {
            _2239 = _2177;
        }
        float _2255 = _2239;
        float _2257 = _2255;
        if (!_2243)
        {
            _2113 = _2169;
        }
        float _2259 = _2113;
        float _2261 = _2259;
        if (_2243)
        {
            _2249 = _2173;
        }
        float _2263 = _2249;
        _2227 = _2263;
        if (_2243)
        {
            _2253 = _2175;
        }
        float _2265 = _2253;
        _2233 = _2265;
        if (_2243)
        {
            _2257 = _2177;
        }
        float _2267 = _2257;
        _2241 = _2267;
        if (_2243)
        {
            _2261 = _2169;
        }
        float _2269 = _2261;
        _2115 = _2269;
        if (_2243)
        {
            _2205 = _561;
        }
        float _2271 = _2205;
        _2211 = _2271;
        if (_2243)
        {
            _2207 = _563;
        }
        float _2273 = _2207;
        _2213 = _2273;
        if (_2243)
        {
            _2215 = _565;
        }
    }
    float _2275 = _2115;
    float _2277 = _2209;
    float _2279 = _2227;
    float _2281 = _2233;
    float _2283 = _2241;
    float _2285 = _2211;
    float _2287 = _2213;
    float _2289 = _2215;
    bool _2291 = _2275 >= _2199;
    bool _2293 = isnan(_2275);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(_2199);
    bool _2299 = _2295 || _2297;
    float _2301 = _591 * _1249;
    float _2303 = fma(_589, _1251, _2301);
    float _2305 = fma(_593, _1253, _2303);
    float _2307 = _2301;
    float _2309 = _2303;
    float _2311 = _2277;
    float _2313 = _2285;
    float _2315 = _2287;
    float _2317 = _2277;
    float _2319 = _2285;
    float _2321 = _2287;
    float _2323 = _2289;
    float _2325 = _2279;
    float _2327 = _2281;
    float _2329 = _2305;
    float _2331 = _2305;
    if (!_2299)
    {
        _2217 = _569;
    }
    float _2333 = _2217;
    float _2335 = _2333;
    float _2337 = _2333;
    if (!_2299)
    {
        _2307 = _571;
    }
    float _2339 = _2307;
    float _2341 = _2339;
    float _2343 = _2339;
    if (!_2299)
    {
        _2309 = _573;
    }
    float _2345 = _2309;
    bool _2347 = !_2299;
    float _2349 = _2345;
    float _2351 = _2345;
    if (!_2347)
    {
        bool _2353 = _2277 > _2199;
        if (_2353)
        {
            _2311 = _2199;
        }
        float _2355 = _2311;
        _2317 = _2355;
        if (!_2353)
        {
            _2335 = _2279;
        }
        float _2357 = _2335;
        float _2359 = _2357;
        if (!_2353)
        {
            _2341 = _2281;
        }
        float _2361 = _2341;
        float _2363 = _2361;
        if (!_2353)
        {
            _2349 = _2283;
        }
        float _2365 = _2349;
        float _2367 = _2365;
        if (!_2353)
        {
            _2219 = _2275;
        }
        float _2369 = _2219;
        float _2371 = _2369;
        if (_2353)
        {
            _2359 = _2279;
        }
        float _2373 = _2359;
        _2337 = _2373;
        if (_2353)
        {
            _2363 = _2281;
        }
        float _2375 = _2363;
        _2343 = _2375;
        if (_2353)
        {
            _2367 = _2283;
        }
        float _2377 = _2367;
        _2351 = _2377;
        if (_2353)
        {
            _2371 = _2275;
        }
        float _2379 = _2371;
        _2221 = _2379;
        if (_2353)
        {
            _2313 = _569;
        }
        float _2381 = _2313;
        _2319 = _2381;
        if (_2353)
        {
            _2315 = _571;
        }
        float _2383 = _2315;
        _2321 = _2383;
        if (_2353)
        {
            _2323 = _573;
        }
    }
    float _2385 = _2221;
    float _2387 = _2317;
    float _2389 = _2337;
    float _2391 = _2343;
    float _2393 = _2351;
    float _2395 = _2319;
    float _2397 = _2321;
    float _2399 = _2323;
    bool _2401 = _2385 >= _2305;
    bool _2403 = isnan(_2385);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan(_2305);
    bool _2409 = _2405 || _2407;
    float _2411 = _599 * _1249;
    float _2413 = fma(_597, _1251, _2411);
    float _2415 = fma(_601, _1253, _2413);
    float _2417 = _2413;
    float _2419 = _2387;
    float _2421 = _2395;
    float _2423 = _2397;
    float _2425 = _2387;
    float _2427 = _2395;
    float _2429 = _2397;
    float _2431 = _2399;
    float _2433 = _2389;
    float _2435 = _2415;
    float _2437 = _2415;
    if (!_2409)
    {
        _2325 = _589;
    }
    float _2439 = _2325;
    float _2441 = _2439;
    float _2443 = _2439;
    if (!_2409)
    {
        _2327 = _591;
    }
    float _2445 = _2327;
    float _2447 = _2445;
    float _2449 = _2445;
    if (!_2409)
    {
        _2417 = _593;
    }
    float _2451 = _2417;
    bool _2453 = !_2409;
    float _2455 = _2451;
    float _2457 = _2451;
    if (!_2453)
    {
        bool _2459 = _2387 > _2305;
        if (_2459)
        {
            _2419 = _2305;
        }
        float _2461 = _2419;
        _2425 = _2461;
        if (!_2459)
        {
            _2441 = _2389;
        }
        float _2463 = _2441;
        float _2465 = _2463;
        if (!_2459)
        {
            _2447 = _2391;
        }
        float _2467 = _2447;
        float _2469 = _2467;
        if (!_2459)
        {
            _2455 = _2393;
        }
        float _2471 = _2455;
        float _2473 = _2471;
        if (!_2459)
        {
            _2329 = _2385;
        }
        float _2475 = _2329;
        float _2477 = _2475;
        if (_2459)
        {
            _2465 = _2389;
        }
        float _2479 = _2465;
        _2443 = _2479;
        if (_2459)
        {
            _2469 = _2391;
        }
        float _2481 = _2469;
        _2449 = _2481;
        if (_2459)
        {
            _2473 = _2393;
        }
        float _2483 = _2473;
        _2457 = _2483;
        if (_2459)
        {
            _2477 = _2385;
        }
        float _2485 = _2477;
        _2331 = _2485;
        if (_2459)
        {
            _2421 = _589;
        }
        float _2487 = _2421;
        _2427 = _2487;
        if (_2459)
        {
            _2423 = _591;
        }
        float _2489 = _2423;
        _2429 = _2489;
        if (_2459)
        {
            _2431 = _593;
        }
    }
    float _2491 = _2331;
    float _2493 = _2425;
    float _2495 = _2443;
    float _2497 = _2449;
    float _2499 = _2457;
    float _2501 = _2427;
    float _2503 = _2429;
    float _2505 = _2431;
    bool _2507 = _2491 >= _2415;
    bool _2509 = isnan(_2491);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(_2415);
    bool _2515 = _2511 || _2513;
    float _2517 = _607 * _1249;
    float _2519 = fma(_605, _1251, _2517);
    float _2521 = fma(_609, _1253, _2519);
    float _2523 = _2517;
    float _2525 = _2519;
    float _2527 = _2493;
    float _2529 = _2501;
    float _2531 = _2503;
    float _2533 = _2493;
    float _2535 = _2501;
    float _2537 = _2503;
    float _2539 = _2505;
    float _2541 = _2495;
    float _2543 = _2497;
    float _2545 = _2521;
    float _2547 = _2521;
    if (!_2515)
    {
        _2433 = _597;
    }
    float _2549 = _2433;
    float _2551 = _2549;
    float _2553 = _2549;
    if (!_2515)
    {
        _2523 = _599;
    }
    float _2555 = _2523;
    float _2557 = _2555;
    float _2559 = _2555;
    if (!_2515)
    {
        _2525 = _601;
    }
    float _2561 = _2525;
    bool _2563 = !_2515;
    float _2565 = _2561;
    float _2567 = _2561;
    if (!_2563)
    {
        bool _2569 = _2493 > _2415;
        if (_2569)
        {
            _2527 = _2415;
        }
        float _2571 = _2527;
        _2533 = _2571;
        if (!_2569)
        {
            _2551 = _2495;
        }
        float _2573 = _2551;
        float _2575 = _2573;
        if (!_2569)
        {
            _2557 = _2497;
        }
        float _2577 = _2557;
        float _2579 = _2577;
        if (!_2569)
        {
            _2565 = _2499;
        }
        float _2581 = _2565;
        float _2583 = _2581;
        if (!_2569)
        {
            _2435 = _2491;
        }
        float _2585 = _2435;
        float _2587 = _2585;
        if (_2569)
        {
            _2575 = _2495;
        }
        float _2589 = _2575;
        _2553 = _2589;
        if (_2569)
        {
            _2579 = _2497;
        }
        float _2591 = _2579;
        _2559 = _2591;
        if (_2569)
        {
            _2583 = _2499;
        }
        float _2593 = _2583;
        _2567 = _2593;
        if (_2569)
        {
            _2587 = _2491;
        }
        float _2595 = _2587;
        _2437 = _2595;
        if (_2569)
        {
            _2529 = _597;
        }
        float _2597 = _2529;
        _2535 = _2597;
        if (_2569)
        {
            _2531 = _599;
        }
        float _2599 = _2531;
        _2537 = _2599;
        if (_2569)
        {
            _2539 = _601;
        }
    }
    float _2601 = _2437;
    float _2603 = _2533;
    float _2605 = _2553;
    float _2607 = _2559;
    float _2609 = _2567;
    float _2611 = _2535;
    float _2613 = _2537;
    float _2615 = _2539;
    bool _2617 = _2601 >= _2521;
    bool _2619 = isnan(_2601);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(_2521);
    bool _2625 = _2621 || _2623;
    float _2627 = _615 * _1249;
    float _2629 = fma(_613, _1251, _2627);
    float _2631 = fma(_617, _1253, _2629);
    float _2633 = _2629;
    float _2635 = _2603;
    float _2637 = _2611;
    float _2639 = _2613;
    float _2641 = _2611;
    float _2643 = _2603;
    float _2645 = _2613;
    float _2647 = _2615;
    float _2649 = _2609;
    float _2651 = _2631;
    float _2653 = _2631;
    if (!_2625)
    {
        _2541 = _605;
    }
    float _2655 = _2541;
    float _2657 = _2655;
    float _2659 = _2655;
    if (!_2625)
    {
        _2543 = _607;
    }
    float _2661 = _2543;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2625)
    {
        _2633 = _609;
    }
    float _2667 = _2633;
    bool _2669 = !_2625;
    float _2671 = _2667;
    float _2673 = _2667;
    if (!_2669)
    {
        bool _2675 = _2603 > _2521;
        if (_2675)
        {
            _2635 = _2521;
        }
        float _2677 = _2635;
        _2643 = _2677;
        if (!_2675)
        {
            _2657 = _2605;
        }
        float _2679 = _2657;
        float _2681 = _2679;
        if (!_2675)
        {
            _2663 = _2607;
        }
        float _2683 = _2663;
        float _2685 = _2683;
        if (!_2675)
        {
            _2671 = _2609;
        }
        float _2687 = _2671;
        float _2689 = _2687;
        if (!_2675)
        {
            _2545 = _2601;
        }
        float _2691 = _2545;
        float _2693 = _2691;
        if (_2675)
        {
            _2681 = _2605;
        }
        float _2695 = _2681;
        _2659 = _2695;
        if (_2675)
        {
            _2685 = _2607;
        }
        float _2697 = _2685;
        _2665 = _2697;
        if (_2675)
        {
            _2689 = _2609;
        }
        float _2699 = _2689;
        _2673 = _2699;
        if (_2675)
        {
            _2693 = _2601;
        }
        float _2701 = _2693;
        _2547 = _2701;
        if (_2675)
        {
            _2637 = _605;
        }
        float _2703 = _2637;
        _2641 = _2703;
        if (_2675)
        {
            _2639 = _607;
        }
        float _2705 = _2639;
        _2645 = _2705;
        if (_2675)
        {
            _2647 = _609;
        }
    }
    float _2707 = _2547;
    float _2709 = _2641;
    float _2711 = _2643;
    float _2713 = _2659;
    float _2715 = _2665;
    float _2717 = _2673;
    float _2719 = _2645;
    float _2721 = _2647;
    bool _2723 = _2707 >= _2631;
    bool _2725 = isnan(_2707);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan(_2631);
    bool _2731 = _2727 || _2729;
    float _2733 = _623 * _1249;
    float _2735 = fma(_621, _1251, _2733);
    float _2737 = fma(_625, _1253, _2735);
    float _2739 = _2733;
    float _2741 = _2711;
    float _2743 = _2719;
    float _2745 = _2719;
    float _2747 = _2721;
    float _2749 = _2711;
    float _2751 = _2713;
    float _2753 = _2715;
    if (!_2731)
    {
        _2649 = _2709;
    }
    float _2755 = _2649;
    float _2757 = _2755;
    float _2759 = _2755;
    if (!_2731)
    {
        _1309 = _613;
    }
    float _2761 = _1309;
    float _2763 = _2761;
    float _2765 = _2761;
    if (!_2731)
    {
        _1311 = _615;
    }
    float _2767 = _1311;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2731)
    {
        _2739 = _617;
    }
    float _2773 = _2739;
    bool _2775 = !_2731;
    float _2777 = _2773;
    float _2779 = _2773;
    if (!_2775)
    {
        bool _2781 = _2711 > _2631;
        if (_2781)
        {
            _2741 = _2631;
        }
        float _2783 = _2741;
        _2749 = _2783;
        if (!_2781)
        {
            _2763 = _2713;
        }
        float _2785 = _2763;
        float _2787 = _2785;
        if (!_2781)
        {
            _2769 = _2715;
        }
        float _2789 = _2769;
        float _2791 = _2789;
        if (!_2781)
        {
            _2777 = _2717;
        }
        float _2793 = _2777;
        float _2795 = _2793;
        if (!_2781)
        {
            _2651 = _2707;
        }
        float _2797 = _2651;
        float _2799 = _2797;
        if (!_2781)
        {
            _2757 = _2709;
        }
        float _2801 = _2757;
        float _2803 = _2801;
        if (_2781)
        {
            _2787 = _2713;
        }
        float _2805 = _2787;
        _2765 = _2805;
        if (_2781)
        {
            _2791 = _2715;
        }
        float _2807 = _2791;
        _2771 = _2807;
        if (_2781)
        {
            _2795 = _2717;
        }
        float _2809 = _2795;
        _2779 = _2809;
        if (_2781)
        {
            _2799 = _2707;
        }
        float _2811 = _2799;
        _2653 = _2811;
        if (_2781)
        {
            _2803 = _613;
        }
        float _2813 = _2803;
        _2759 = _2813;
        if (_2781)
        {
            _2743 = _615;
        }
        float _2815 = _2743;
        _2745 = _2815;
        if (_2781)
        {
            _2747 = _617;
        }
    }
    float _2817 = _2653;
    float _2819 = _2745;
    float _2821 = _2747;
    float _2823 = _2749;
    float _2825 = _2765;
    float _2827 = _2771;
    float _2829 = _2779;
    float _2831 = _2759;
    bool _2833 = _2817 >= _2737;
    bool _2835 = isnan(_2817);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan(_2737);
    bool _2841 = _2837 || _2839;
    float _2843 = _2831;
    float _2845 = _2831;
    if (!_2841)
    {
        _2751 = _2819;
    }
    float _2847 = _2751;
    float _2849 = _2847;
    float _2851 = _2847;
    if (!_2841)
    {
        _2753 = _2821;
    }
    float _2853 = _2753;
    float _2855 = 0.0;
    float _2857 = _2853;
    float _2859 = _2853;
    if (!_2841)
    {
        _2855 = _621;
    }
    float _2861 = _2855;
    float _2863 = _2861;
    float _2865 = _2861;
    if (!_2841)
    {
        _1313 = _623;
    }
    float _2867 = _1313;
    float _2869 = _2867;
    float _2871 = _2867;
    if (!_2841)
    {
        _1315 = _625;
    }
    float _2873 = _1315;
    bool _2875 = !_2841;
    float _2877 = _2873;
    float _2879 = _2873;
    if (!_2875)
    {
        bool _2881 = _2823 > _2737;
        if (!_2881)
        {
            _2863 = _2825;
        }
        float _2883 = _2863;
        float _2885 = _2883;
        if (!_2881)
        {
            _2869 = _2827;
        }
        float _2887 = _2869;
        float _2889 = _2887;
        if (!_2881)
        {
            _2877 = _2829;
        }
        float _2891 = _2877;
        float _2893 = _2891;
        if (!_2881)
        {
            _2849 = _2819;
        }
        float _2895 = _2849;
        float _2897 = _2895;
        if (!_2881)
        {
            _2857 = _2821;
        }
        float _2899 = _2857;
        _2859 = _2899;
        if (_2881)
        {
            _2885 = _2825;
        }
        float _2901 = _2885;
        _2865 = _2901;
        if (_2881)
        {
            _2889 = _2827;
        }
        float _2903 = _2889;
        _2871 = _2903;
        if (_2881)
        {
            _2893 = _2829;
        }
        float _2905 = _2893;
        _2879 = _2905;
        if (_2881)
        {
            _2843 = _621;
        }
        float _2907 = _2843;
        _2845 = _2907;
        if (_2881)
        {
            _2897 = _623;
        }
        float _2909 = _2897;
        _2851 = _2909;
        if (_2881)
        {
            _2859 = _625;
        }
    }
    float _2911 = _2851;
    float _2913 = _2871;
    float _2915 = _2845;
    float _2917 = _2865;
    float _2919 = _2859;
    float _2921 = _2879;
    float _2923 = -_2911;
    float _2925 = _2913 + _2923;
    float _2927 = -_2915;
    float _2929 = _2917 + _2927;
    float _2931 = -_2919;
    float _2933 = _2921 + _2931;
    float _2935 = -_2915;
    float _2937 = _333 + _2935;
    float _2939 = _2925 * _2925;
    float _2941 = fma(_2929, _2929, _2939);
    float _2943 = fma(_2933, _2933, _2941);
    float _2945 = -_2911;
    float _2947 = _335 + _2945;
    float _2949 = _2925 * _2947;
    float _2951 = 1.0 / _2943;
    float _2953 = -_2919;
    float _2955 = _337 + _2953;
    float _2957 = fma(_2929, _2937, _2949);
    float _2959 = fma(_2933, _2955, _2957);
    float _2961 = _2951 * 3.0;
    float _2963 = _2961 * _2959;
    float _2965 = rint(_2963);
    float _2967 = precise::max(0.0, _2965);
    float _2969 = precise::min(_2967, 3.0);
    float _2971 = trunc(_2969);
    int _2974 = int(_2971);
    bool _2976 = _2974 >= 2;
    bool _2978 = !_2976;
    float _2980 = _2929;
    float _2982 = _2925;
    float _2984 = _2933;
    float _2986 = _2915;
    float _2988 = _2917;
    float _2990 = _2911;
    float _2992 = _2913;
    float _2994 = _2921;
    float _2996 = _2919;
    float _3006;
    float _3008;
    float _3010;
    float _3012;
    float _3014;
    float _3016;
    float _3018;
    float _3020;
    float _3022;
    float _3024;
    float _3026;
    float _3028;
    float _3030;
    float _3032;
    float _3034;
    float _3036;
    if (!_2978)
    {
        bool _2998 = _2974 >= 3;
        bool _3000 = !_2998;
        if (!_3000)
        {
            bool _3002 = _2974 != 3;
            _3004 = _3002;
            if (!_3004)
            {
                _3006 = _333;
                _3008 = _335;
                _3010 = _337;
                _3012 = 1.0;
                _3014 = 0.0;
                _3016 = 0.0;
                _3018 = 0.0;
                _3020 = 0.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
        }
        else
        {
            _3006 = 0.0;
            _3008 = 0.0;
            _3010 = 0.0;
            _3012 = 0.0;
            _3014 = 0.0;
            _3016 = 0.0;
            _3018 = 0.0;
            _3020 = 0.0;
            _3022 = _333;
            _3024 = _335;
            _3026 = _337;
            _3028 = 1.0;
            _3030 = 0.0;
            _3032 = 0.0;
            _3034 = 0.0;
            _3036 = 0.0;
            _3038 = true;
        }
    }
    if ((!_3038) || _3004)
    {
        bool _3040;
        if (!_3004)
        {
            _3040 = _2974 >= 1;
        }
        if ((!_3040) || _3004)
        {
            bool _3042;
            if (!_3004)
            {
                _3042 = _2974 != 0;
            }
            if ((!_3042) && (!_3004))
            {
                _3006 = 0.0;
                _3008 = 0.0;
                _3010 = 0.0;
                _3012 = 0.0;
                _3014 = _333;
                _3016 = _335;
                _3018 = _337;
                _3020 = 1.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
            else
            {
                _3004 = false;
                _3006 = 0.0;
                _3008 = 0.0;
                _3010 = 0.0;
                _3012 = 0.0;
                _3014 = 0.0;
                _3016 = 0.0;
                _3018 = 0.0;
                _3020 = 0.0;
                _3022 = 0.0;
                _3024 = 0.0;
                _3026 = 0.0;
                _3028 = 0.0;
                _3030 = 0.0;
                _3032 = 0.0;
                _3034 = 0.0;
                _3036 = 0.0;
                _3038 = true;
            }
        }
        else
        {
            _3006 = 0.0;
            _3008 = 0.0;
            _3010 = 0.0;
            _3012 = 0.0;
            _3014 = 0.0;
            _3016 = 0.0;
            _3018 = 0.0;
            _3020 = 0.0;
            _3022 = 0.0;
            _3024 = 0.0;
            _3026 = 0.0;
            _3028 = 0.0;
            _3030 = _333;
            _3032 = _335;
            _3034 = _337;
            _3036 = 1.0;
        }
    }
    _3038 = false;
    float _3044 = _3006;
    float _3046 = _3008;
    float _3048 = _3010;
    float _3050 = _3012;
    float _3052 = _3014;
    float _3054 = _3016;
    float _3056 = _3018;
    float _3058 = _3020;
    float _3060 = _3022;
    float _3062 = _3024;
    float _3064 = _3026;
    float _3066 = _3028;
    float _3068 = _3030;
    float _3070 = _3032;
    float _3072 = _3034;
    float _3074 = _3036;
    float _3076 = -_2911;
    float _3078 = _343 + _3076;
    float _3080 = -_2915;
    float _3082 = _341 + _3080;
    float _3084 = _2925 * _3078;
    float _3086 = -_2919;
    float _3088 = _345 + _3086;
    float _3090 = fma(_2929, _3082, _3084);
    float _3092 = fma(_2933, _3088, _3090);
    float _3094 = _2961 * _3092;
    float _3096 = rint(_3094);
    float _3098 = precise::max(0.0, _3096);
    float _3100 = precise::min(_3098, 3.0);
    float _3102 = trunc(_3100);
    int _3104 = int(_3102);
    bool _3106 = _3104 >= 2;
    bool _3108 = !_3106;
    float _3110 = _3096;
    float _3112 = as_type<float>(_3104);
    float _3114 = _3084;
    float _3116 = _3090;
    float _3118 = _3044;
    float _3120 = _3046;
    float _3122 = _3048;
    float _3124 = _3050;
    float _3126 = _3060;
    float _3128 = _3062;
    float _3130 = _3064;
    float _3132 = _3066;
    float _3134 = _3068;
    float _3136 = _3070;
    float _3138 = _3072;
    float _3140 = _3074;
    float _3158;
    float _3160;
    float _3162;
    float _3164;
    if (!_3108)
    {
        bool _3142 = _3104 >= 3;
        bool _3144 = !_3142;
        if (!_3144)
        {
            bool _3146 = _3104 != 3;
            _3148 = _3146;
            if (!_3148)
            {
                float _3150 = _341 + _3044;
                float _3152 = _343 + _3046;
                float _3154 = _345 + _3048;
                float _3156 = _3050 + 1.0;
                _3118 = _3150;
                _3120 = _3152;
                _3122 = _3154;
                _3124 = _3156;
                _3158 = _3052;
                _3160 = _3054;
                _3162 = _3056;
                _3164 = _3058;
                _3166 = true;
            }
        }
        else
        {
            float _3168 = _341 + _3060;
            float _3170 = _343 + _3062;
            float _3172 = _345 + _3064;
            float _3174 = _3066 + 1.0;
            _3158 = _3052;
            _3160 = _3054;
            _3162 = _3056;
            _3164 = _3058;
            _3126 = _3168;
            _3128 = _3170;
            _3130 = _3172;
            _3132 = _3174;
            _3166 = true;
        }
    }
    if ((!_3166) || _3148)
    {
        bool _3176;
        if (!_3148)
        {
            _3176 = _3104 >= 1;
        }
        if ((!_3176) || _3148)
        {
            if (!_3148)
            {
                bool _3178 = _3104 != 0;
                if (!_3178)
                {
                    float _3180 = _341 + _3052;
                    _3110 = _3180;
                }
                float _3182 = _3110;
                _3158 = _3182;
                if (!_3178)
                {
                    float _3184 = _343 + _3054;
                    _3112 = _3184;
                }
                float _3186 = _3112;
                _3160 = _3186;
                if (!_3178)
                {
                    float _3188 = _345 + _3056;
                    _3114 = _3188;
                }
                float _3190 = _3114;
                _3162 = _3190;
                if (!_3178)
                {
                    float _3192 = _3058 + 1.0;
                    _3116 = _3192;
                }
                float _3194 = _3116;
                bool _3196 = !_3178;
                _3164 = _3194;
                _3166 = _3196;
            }
            if ((!_3166) || _3148)
            {
                _3148 = false;
                _3158 = _3052;
                _3160 = _3054;
                _3162 = _3056;
                _3164 = _3058;
                _3166 = true;
            }
        }
        else
        {
            float _3198 = _341 + _3068;
            float _3200 = _343 + _3070;
            float _3202 = _345 + _3072;
            float _3204 = _3074 + 1.0;
            _3158 = _3052;
            _3160 = _3054;
            _3162 = _3056;
            _3164 = _3058;
            _3134 = _3198;
            _3136 = _3200;
            _3138 = _3202;
            _3140 = _3204;
        }
    }
    _3166 = false;
    float _3206 = _3118;
    float _3208 = _3120;
    float _3210 = _3122;
    float _3212 = _3124;
    float _3214 = _3158;
    float _3216 = _3160;
    float _3218 = _3162;
    float _3220 = _3164;
    float _3222 = _3126;
    float _3224 = _3128;
    float _3226 = _3130;
    float _3228 = _3132;
    float _3230 = _3134;
    float _3232 = _3136;
    float _3234 = _3138;
    float _3236 = _3140;
    float _3238 = -_2911;
    float _3240 = _395 + _3238;
    float _3242 = -_2915;
    float _3244 = _393 + _3242;
    float _3246 = _2925 * _3240;
    float _3248 = -_2919;
    float _3250 = _397 + _3248;
    float _3252 = fma(_2929, _3244, _3246);
    float _3254 = fma(_2933, _3250, _3252);
    float _3256 = _2961 * _3254;
    float _3258 = rint(_3256);
    float _3260 = precise::max(0.0, _3258);
    float _3262 = precise::min(_3260, 3.0);
    float _3264 = trunc(_3262);
    int _3266 = int(_3264);
    bool _3268 = _3266 >= 2;
    bool _3270 = !_3268;
    float _3272 = _3258;
    float _3274 = as_type<float>(_3266);
    float _3276 = _3246;
    float _3278 = _3252;
    float _3280 = _3206;
    float _3282 = _3208;
    float _3284 = _3210;
    float _3286 = _3212;
    float _3288 = _3222;
    float _3290 = _3224;
    float _3292 = _3226;
    float _3294 = _3228;
    float _3296 = _3230;
    float _3298 = _3232;
    float _3300 = _3234;
    float _3302 = _3236;
    float _3320;
    float _3322;
    float _3324;
    float _3326;
    if (!_3270)
    {
        bool _3304 = _3266 >= 3;
        bool _3306 = !_3304;
        if (!_3306)
        {
            bool _3308 = _3266 != 3;
            _3310 = _3308;
            if (!_3310)
            {
                float _3312 = _393 + _3206;
                float _3314 = _395 + _3208;
                float _3316 = _397 + _3210;
                float _3318 = _3212 + 1.0;
                _3280 = _3312;
                _3282 = _3314;
                _3284 = _3316;
                _3286 = _3318;
                _3320 = _3214;
                _3322 = _3216;
                _3324 = _3218;
                _3326 = _3220;
                _3328 = true;
            }
        }
        else
        {
            float _3330 = _393 + _3222;
            float _3332 = _395 + _3224;
            float _3334 = _397 + _3226;
            float _3336 = _3228 + 1.0;
            _3320 = _3214;
            _3322 = _3216;
            _3324 = _3218;
            _3326 = _3220;
            _3288 = _3330;
            _3290 = _3332;
            _3292 = _3334;
            _3294 = _3336;
            _3328 = true;
        }
    }
    if ((!_3328) || _3310)
    {
        bool _3338;
        if (!_3310)
        {
            _3338 = _3266 >= 1;
        }
        if ((!_3338) || _3310)
        {
            if (!_3310)
            {
                bool _3340 = _3266 != 0;
                if (!_3340)
                {
                    float _3342 = _393 + _3214;
                    _3272 = _3342;
                }
                float _3344 = _3272;
                _3320 = _3344;
                if (!_3340)
                {
                    float _3346 = _395 + _3216;
                    _3274 = _3346;
                }
                float _3348 = _3274;
                _3322 = _3348;
                if (!_3340)
                {
                    float _3350 = _397 + _3218;
                    _3276 = _3350;
                }
                float _3352 = _3276;
                _3324 = _3352;
                if (!_3340)
                {
                    float _3354 = _3220 + 1.0;
                    _3278 = _3354;
                }
                float _3356 = _3278;
                bool _3358 = !_3340;
                _3326 = _3356;
                _3328 = _3358;
            }
            if ((!_3328) || _3310)
            {
                _3310 = false;
                _3320 = _3214;
                _3322 = _3216;
                _3324 = _3218;
                _3326 = _3220;
                _3328 = true;
            }
        }
        else
        {
            float _3360 = _393 + _3230;
            float _3362 = _395 + _3232;
            float _3364 = _397 + _3234;
            float _3366 = _3236 + 1.0;
            _3320 = _3214;
            _3322 = _3216;
            _3324 = _3218;
            _3326 = _3220;
            _3296 = _3360;
            _3298 = _3362;
            _3300 = _3364;
            _3302 = _3366;
        }
    }
    _3328 = false;
    float _3368 = _3280;
    float _3370 = _3282;
    float _3372 = _3284;
    float _3374 = _3286;
    float _3376 = _3320;
    float _3378 = _3322;
    float _3380 = _3324;
    float _3382 = _3326;
    float _3384 = _3288;
    float _3386 = _3290;
    float _3388 = _3292;
    float _3390 = _3294;
    float _3392 = _3296;
    float _3394 = _3298;
    float _3396 = _3300;
    float _3398 = _3302;
    float _3400 = -_2911;
    float _3402 = _429 + _3400;
    float _3404 = -_2915;
    float _3406 = _427 + _3404;
    float _3408 = _2925 * _3402;
    float _3410 = -_2919;
    float _3412 = _431 + _3410;
    float _3414 = fma(_2929, _3406, _3408);
    float _3416 = fma(_2933, _3412, _3414);
    float _3418 = _2961 * _3416;
    float _3420 = rint(_3418);
    float _3422 = precise::max(0.0, _3420);
    float _3424 = precise::min(_3422, 3.0);
    float _3426 = trunc(_3424);
    int _3428 = int(_3426);
    bool _3430 = _3428 >= 2;
    bool _3432 = !_3430;
    float _3434 = _3420;
    float _3436 = as_type<float>(_3428);
    float _3438 = _3408;
    float _3440 = _3414;
    float _3442 = _3368;
    float _3444 = _3370;
    float _3446 = _3372;
    float _3448 = _3374;
    float _3450 = _3384;
    float _3452 = _3386;
    float _3454 = _3388;
    float _3456 = _3390;
    float _3458 = _3392;
    float _3460 = _3394;
    float _3462 = _3396;
    float _3464 = _3398;
    float _3482;
    float _3484;
    float _3486;
    float _3488;
    if (!_3432)
    {
        bool _3466 = _3428 >= 3;
        bool _3468 = !_3466;
        if (!_3468)
        {
            bool _3470 = _3428 != 3;
            _3472 = _3470;
            if (!_3472)
            {
                float _3474 = _427 + _3368;
                float _3476 = _429 + _3370;
                float _3478 = _431 + _3372;
                float _3480 = _3374 + 1.0;
                _3442 = _3474;
                _3444 = _3476;
                _3446 = _3478;
                _3448 = _3480;
                _3482 = _3376;
                _3484 = _3378;
                _3486 = _3380;
                _3488 = _3382;
                _3490 = true;
            }
        }
        else
        {
            float _3492 = _427 + _3384;
            float _3494 = _429 + _3386;
            float _3496 = _431 + _3388;
            float _3498 = _3390 + 1.0;
            _3482 = _3376;
            _3484 = _3378;
            _3486 = _3380;
            _3488 = _3382;
            _3450 = _3492;
            _3452 = _3494;
            _3454 = _3496;
            _3456 = _3498;
            _3490 = true;
        }
    }
    if ((!_3490) || _3472)
    {
        bool _3500;
        if (!_3472)
        {
            _3500 = _3428 >= 1;
        }
        if ((!_3500) || _3472)
        {
            if (!_3472)
            {
                bool _3502 = _3428 != 0;
                if (!_3502)
                {
                    float _3504 = _427 + _3376;
                    _3434 = _3504;
                }
                float _3506 = _3434;
                _3482 = _3506;
                if (!_3502)
                {
                    float _3508 = _429 + _3378;
                    _3436 = _3508;
                }
                float _3510 = _3436;
                _3484 = _3510;
                if (!_3502)
                {
                    float _3512 = _431 + _3380;
                    _3438 = _3512;
                }
                float _3514 = _3438;
                _3486 = _3514;
                if (!_3502)
                {
                    float _3516 = _3382 + 1.0;
                    _3440 = _3516;
                }
                float _3518 = _3440;
                bool _3520 = !_3502;
                _3488 = _3518;
                _3490 = _3520;
            }
            if ((!_3490) || _3472)
            {
                _3472 = false;
                _3482 = _3376;
                _3484 = _3378;
                _3486 = _3380;
                _3488 = _3382;
                _3490 = true;
            }
        }
        else
        {
            float _3522 = _427 + _3392;
            float _3524 = _429 + _3394;
            float _3526 = _431 + _3396;
            float _3528 = _3398 + 1.0;
            _3482 = _3376;
            _3484 = _3378;
            _3486 = _3380;
            _3488 = _3382;
            _3458 = _3522;
            _3460 = _3524;
            _3462 = _3526;
            _3464 = _3528;
        }
    }
    _3490 = false;
    float _3530 = _3442;
    float _3532 = _3444;
    float _3534 = _3446;
    float _3536 = _3448;
    float _3538 = _3482;
    float _3540 = _3484;
    float _3542 = _3486;
    float _3544 = _3488;
    float _3546 = _3450;
    float _3548 = _3452;
    float _3550 = _3454;
    float _3552 = _3456;
    float _3554 = _3458;
    float _3556 = _3460;
    float _3558 = _3462;
    float _3560 = _3464;
    float _3562 = -_2911;
    float _3564 = _437 + _3562;
    float _3566 = -_2915;
    float _3568 = _435 + _3566;
    float _3570 = _2925 * _3564;
    float _3572 = -_2919;
    float _3574 = _439 + _3572;
    float _3576 = fma(_2929, _3568, _3570);
    float _3578 = fma(_2933, _3574, _3576);
    float _3580 = _2961 * _3578;
    float _3582 = rint(_3580);
    float _3584 = precise::max(0.0, _3582);
    float _3586 = precise::min(_3584, 3.0);
    float _3588 = trunc(_3586);
    int _3590 = int(_3588);
    bool _3592 = _3590 >= 2;
    bool _3594 = !_3592;
    float _3596 = _3582;
    float _3598 = as_type<float>(_3590);
    float _3600 = _3570;
    float _3602 = _3576;
    float _3604 = _3530;
    float _3606 = _3532;
    float _3608 = _3534;
    float _3610 = _3536;
    float _3612 = _3546;
    float _3614 = _3548;
    float _3616 = _3550;
    float _3618 = _3552;
    float _3620 = _3554;
    float _3622 = _3556;
    float _3624 = _3558;
    float _3626 = _3560;
    float _3644;
    float _3646;
    float _3648;
    float _3650;
    if (!_3594)
    {
        bool _3628 = _3590 >= 3;
        bool _3630 = !_3628;
        if (!_3630)
        {
            bool _3632 = _3590 != 3;
            _3634 = _3632;
            if (!_3634)
            {
                float _3636 = _435 + _3530;
                float _3638 = _437 + _3532;
                float _3640 = _439 + _3534;
                float _3642 = _3536 + 1.0;
                _3604 = _3636;
                _3606 = _3638;
                _3608 = _3640;
                _3610 = _3642;
                _3644 = _3538;
                _3646 = _3540;
                _3648 = _3542;
                _3650 = _3544;
                _3652 = true;
            }
        }
        else
        {
            float _3654 = _435 + _3546;
            float _3656 = _437 + _3548;
            float _3658 = _439 + _3550;
            float _3660 = _3552 + 1.0;
            _3644 = _3538;
            _3646 = _3540;
            _3648 = _3542;
            _3650 = _3544;
            _3612 = _3654;
            _3614 = _3656;
            _3616 = _3658;
            _3618 = _3660;
            _3652 = true;
        }
    }
    if ((!_3652) || _3634)
    {
        bool _3662;
        if (!_3634)
        {
            _3662 = _3590 >= 1;
        }
        if ((!_3662) || _3634)
        {
            if (!_3634)
            {
                bool _3664 = _3590 != 0;
                if (!_3664)
                {
                    float _3666 = _435 + _3538;
                    _3596 = _3666;
                }
                float _3668 = _3596;
                _3644 = _3668;
                if (!_3664)
                {
                    float _3670 = _437 + _3540;
                    _3598 = _3670;
                }
                float _3672 = _3598;
                _3646 = _3672;
                if (!_3664)
                {
                    float _3674 = _439 + _3542;
                    _3600 = _3674;
                }
                float _3676 = _3600;
                _3648 = _3676;
                if (!_3664)
                {
                    float _3678 = _3544 + 1.0;
                    _3602 = _3678;
                }
                float _3680 = _3602;
                bool _3682 = !_3664;
                _3650 = _3680;
                _3652 = _3682;
            }
            if ((!_3652) || _3634)
            {
                _3634 = false;
                _3644 = _3538;
                _3646 = _3540;
                _3648 = _3542;
                _3650 = _3544;
                _3652 = true;
            }
        }
        else
        {
            float _3684 = _435 + _3554;
            float _3686 = _437 + _3556;
            float _3688 = _439 + _3558;
            float _3690 = _3560 + 1.0;
            _3644 = _3538;
            _3646 = _3540;
            _3648 = _3542;
            _3650 = _3544;
            _3620 = _3684;
            _3622 = _3686;
            _3624 = _3688;
            _3626 = _3690;
        }
    }
    _3652 = false;
    float _3692 = _3604;
    float _3694 = _3606;
    float _3696 = _3608;
    float _3698 = _3610;
    float _3700 = _3644;
    float _3702 = _3646;
    float _3704 = _3648;
    float _3706 = _3650;
    float _3708 = _3612;
    float _3710 = _3614;
    float _3712 = _3616;
    float _3714 = _3618;
    float _3716 = _3620;
    float _3718 = _3622;
    float _3720 = _3624;
    float _3722 = _3626;
    float _3724 = -_2911;
    float _3726 = _483 + _3724;
    float _3728 = -_2915;
    float _3730 = _481 + _3728;
    float _3732 = _2925 * _3726;
    float _3734 = -_2919;
    float _3736 = _485 + _3734;
    float _3738 = fma(_2929, _3730, _3732);
    float _3740 = fma(_2933, _3736, _3738);
    float _3742 = _2961 * _3740;
    float _3744 = rint(_3742);
    float _3746 = precise::max(0.0, _3744);
    float _3748 = precise::min(_3746, 3.0);
    float _3750 = trunc(_3748);
    int _3752 = int(_3750);
    bool _3754 = _3752 >= 2;
    bool _3756 = !_3754;
    float _3758 = _3744;
    float _3760 = as_type<float>(_3752);
    float _3762 = _3732;
    float _3764 = _3738;
    float _3766 = _3692;
    float _3768 = _3694;
    float _3770 = _3696;
    float _3772 = _3698;
    float _3774 = _3708;
    float _3776 = _3710;
    float _3778 = _3712;
    float _3780 = _3714;
    float _3782 = _3716;
    float _3784 = _3718;
    float _3786 = _3720;
    float _3788 = _3722;
    float _3806;
    float _3808;
    float _3810;
    float _3812;
    if (!_3756)
    {
        bool _3790 = _3752 >= 3;
        bool _3792 = !_3790;
        if (!_3792)
        {
            bool _3794 = _3752 != 3;
            _3796 = _3794;
            if (!_3796)
            {
                float _3798 = _481 + _3692;
                float _3800 = _483 + _3694;
                float _3802 = _485 + _3696;
                float _3804 = _3698 + 1.0;
                _3766 = _3798;
                _3768 = _3800;
                _3770 = _3802;
                _3772 = _3804;
                _3806 = _3700;
                _3808 = _3702;
                _3810 = _3704;
                _3812 = _3706;
                _3814 = true;
            }
        }
        else
        {
            float _3816 = _481 + _3708;
            float _3818 = _483 + _3710;
            float _3820 = _485 + _3712;
            float _3822 = _3714 + 1.0;
            _3806 = _3700;
            _3808 = _3702;
            _3810 = _3704;
            _3812 = _3706;
            _3774 = _3816;
            _3776 = _3818;
            _3778 = _3820;
            _3780 = _3822;
            _3814 = true;
        }
    }
    if ((!_3814) || _3796)
    {
        bool _3824;
        if (!_3796)
        {
            _3824 = _3752 >= 1;
        }
        if ((!_3824) || _3796)
        {
            if (!_3796)
            {
                bool _3826 = _3752 != 0;
                if (!_3826)
                {
                    float _3828 = _481 + _3700;
                    _3758 = _3828;
                }
                float _3830 = _3758;
                _3806 = _3830;
                if (!_3826)
                {
                    float _3832 = _483 + _3702;
                    _3760 = _3832;
                }
                float _3834 = _3760;
                _3808 = _3834;
                if (!_3826)
                {
                    float _3836 = _485 + _3704;
                    _3762 = _3836;
                }
                float _3838 = _3762;
                _3810 = _3838;
                if (!_3826)
                {
                    float _3840 = _3706 + 1.0;
                    _3764 = _3840;
                }
                float _3842 = _3764;
                bool _3844 = !_3826;
                _3812 = _3842;
                _3814 = _3844;
            }
            if ((!_3814) || _3796)
            {
                _3796 = false;
                _3806 = _3700;
                _3808 = _3702;
                _3810 = _3704;
                _3812 = _3706;
                _3814 = true;
            }
        }
        else
        {
            float _3846 = _481 + _3716;
            float _3848 = _483 + _3718;
            float _3850 = _485 + _3720;
            float _3852 = _3722 + 1.0;
            _3806 = _3700;
            _3808 = _3702;
            _3810 = _3704;
            _3812 = _3706;
            _3782 = _3846;
            _3784 = _3848;
            _3786 = _3850;
            _3788 = _3852;
        }
    }
    _3814 = false;
    float _3854 = _3766;
    float _3856 = _3768;
    float _3858 = _3770;
    float _3860 = _3772;
    float _3862 = _3806;
    float _3864 = _3808;
    float _3866 = _3810;
    float _3868 = _3812;
    float _3870 = _3774;
    float _3872 = _3776;
    float _3874 = _3778;
    float _3876 = _3780;
    float _3878 = _3782;
    float _3880 = _3784;
    float _3882 = _3786;
    float _3884 = _3788;
    float _3886 = -_2911;
    float _3888 = _491 + _3886;
    float _3890 = -_2915;
    float _3892 = _489 + _3890;
    float _3894 = _2925 * _3888;
    float _3896 = -_2919;
    float _3898 = _493 + _3896;
    float _3900 = fma(_2929, _3892, _3894);
    float _3902 = fma(_2933, _3898, _3900);
    float _3904 = _2961 * _3902;
    float _3906 = rint(_3904);
    float _3908 = precise::max(0.0, _3906);
    float _3910 = precise::min(_3908, 3.0);
    float _3912 = trunc(_3910);
    int _3914 = int(_3912);
    bool _3916 = _3914 >= 2;
    bool _3918 = !_3916;
    float _3920 = _3906;
    float _3922 = as_type<float>(_3914);
    float _3924 = _3894;
    float _3926 = _3900;
    float _3928 = _3854;
    float _3930 = _3856;
    float _3932 = _3858;
    float _3934 = _3860;
    float _3936 = _3870;
    float _3938 = _3872;
    float _3940 = _3874;
    float _3942 = _3876;
    float _3944 = _3878;
    float _3946 = _3880;
    float _3948 = _3882;
    float _3950 = _3884;
    float _3968;
    float _3970;
    float _3972;
    float _3974;
    if (!_3918)
    {
        bool _3952 = _3914 >= 3;
        bool _3954 = !_3952;
        if (!_3954)
        {
            bool _3956 = _3914 != 3;
            _3958 = _3956;
            if (!_3958)
            {
                float _3960 = _489 + _3854;
                float _3962 = _491 + _3856;
                float _3964 = _493 + _3858;
                float _3966 = _3860 + 1.0;
                _3928 = _3960;
                _3930 = _3962;
                _3932 = _3964;
                _3934 = _3966;
                _3968 = _3862;
                _3970 = _3864;
                _3972 = _3866;
                _3974 = _3868;
                _3976 = true;
            }
        }
        else
        {
            float _3978 = _489 + _3870;
            float _3980 = _491 + _3872;
            float _3982 = _493 + _3874;
            float _3984 = _3876 + 1.0;
            _3968 = _3862;
            _3970 = _3864;
            _3972 = _3866;
            _3974 = _3868;
            _3936 = _3978;
            _3938 = _3980;
            _3940 = _3982;
            _3942 = _3984;
            _3976 = true;
        }
    }
    if ((!_3976) || _3958)
    {
        bool _3986;
        if (!_3958)
        {
            _3986 = _3914 >= 1;
        }
        if ((!_3986) || _3958)
        {
            if (!_3958)
            {
                bool _3988 = _3914 != 0;
                if (!_3988)
                {
                    float _3990 = _489 + _3862;
                    _3920 = _3990;
                }
                float _3992 = _3920;
                _3968 = _3992;
                if (!_3988)
                {
                    float _3994 = _491 + _3864;
                    _3922 = _3994;
                }
                float _3996 = _3922;
                _3970 = _3996;
                if (!_3988)
                {
                    float _3998 = _493 + _3866;
                    _3924 = _3998;
                }
                float _4000 = _3924;
                _3972 = _4000;
                if (!_3988)
                {
                    float _4002 = _3868 + 1.0;
                    _3926 = _4002;
                }
                float _4004 = _3926;
                bool _4006 = !_3988;
                _3974 = _4004;
                _3976 = _4006;
            }
            if ((!_3976) || _3958)
            {
                _3958 = false;
                _3968 = _3862;
                _3970 = _3864;
                _3972 = _3866;
                _3974 = _3868;
                _3976 = true;
            }
        }
        else
        {
            float _4008 = _489 + _3878;
            float _4010 = _491 + _3880;
            float _4012 = _493 + _3882;
            float _4014 = _3884 + 1.0;
            _3968 = _3862;
            _3970 = _3864;
            _3972 = _3866;
            _3974 = _3868;
            _3944 = _4008;
            _3946 = _4010;
            _3948 = _4012;
            _3950 = _4014;
        }
    }
    _3976 = false;
    float _4016 = _3928;
    float _4018 = _3930;
    float _4020 = _3932;
    float _4022 = _3934;
    float _4024 = _3968;
    float _4026 = _3970;
    float _4028 = _3972;
    float _4030 = _3974;
    float _4032 = _3936;
    float _4034 = _3938;
    float _4036 = _3940;
    float _4038 = _3942;
    float _4040 = _3944;
    float _4042 = _3946;
    float _4044 = _3948;
    float _4046 = _3950;
    float _4048 = -_2911;
    float _4050 = _547 + _4048;
    float _4052 = -_2915;
    float _4054 = _545 + _4052;
    float _4056 = _2925 * _4050;
    float _4058 = -_2919;
    float _4060 = _549 + _4058;
    float _4062 = fma(_2929, _4054, _4056);
    float _4064 = fma(_2933, _4060, _4062);
    float _4066 = _2961 * _4064;
    float _4068 = rint(_4066);
    float _4070 = precise::max(0.0, _4068);
    float _4072 = precise::min(_4070, 3.0);
    float _4074 = trunc(_4072);
    int _4076 = int(_4074);
    bool _4078 = _4076 >= 2;
    bool _4080 = !_4078;
    float _4082 = _4068;
    float _4084 = as_type<float>(_4076);
    float _4086 = _4056;
    float _4088 = _4062;
    float _4090 = _4016;
    float _4092 = _4018;
    float _4094 = _4020;
    float _4096 = _4022;
    float _4098 = _4032;
    float _4100 = _4034;
    float _4102 = _4036;
    float _4104 = _4038;
    float _4106 = _4040;
    float _4108 = _4042;
    float _4110 = _4044;
    float _4112 = _4046;
    float _4130;
    float _4132;
    float _4134;
    float _4136;
    if (!_4080)
    {
        bool _4114 = _4076 >= 3;
        bool _4116 = !_4114;
        if (!_4116)
        {
            bool _4118 = _4076 != 3;
            _4120 = _4118;
            if (!_4120)
            {
                float _4122 = _545 + _4016;
                float _4124 = _547 + _4018;
                float _4126 = _549 + _4020;
                float _4128 = _4022 + 1.0;
                _4090 = _4122;
                _4092 = _4124;
                _4094 = _4126;
                _4096 = _4128;
                _4130 = _4024;
                _4132 = _4026;
                _4134 = _4028;
                _4136 = _4030;
                _4138 = true;
            }
        }
        else
        {
            float _4140 = _545 + _4032;
            float _4142 = _547 + _4034;
            float _4144 = _549 + _4036;
            float _4146 = _4038 + 1.0;
            _4130 = _4024;
            _4132 = _4026;
            _4134 = _4028;
            _4136 = _4030;
            _4098 = _4140;
            _4100 = _4142;
            _4102 = _4144;
            _4104 = _4146;
            _4138 = true;
        }
    }
    if ((!_4138) || _4120)
    {
        bool _4148;
        if (!_4120)
        {
            _4148 = _4076 >= 1;
        }
        if ((!_4148) || _4120)
        {
            if (!_4120)
            {
                bool _4150 = _4076 != 0;
                if (!_4150)
                {
                    float _4152 = _545 + _4024;
                    _4082 = _4152;
                }
                float _4154 = _4082;
                _4130 = _4154;
                if (!_4150)
                {
                    float _4156 = _547 + _4026;
                    _4084 = _4156;
                }
                float _4158 = _4084;
                _4132 = _4158;
                if (!_4150)
                {
                    float _4160 = _549 + _4028;
                    _4086 = _4160;
                }
                float _4162 = _4086;
                _4134 = _4162;
                if (!_4150)
                {
                    float _4164 = _4030 + 1.0;
                    _4088 = _4164;
                }
                float _4166 = _4088;
                bool _4168 = !_4150;
                _4136 = _4166;
                _4138 = _4168;
            }
            if ((!_4138) || _4120)
            {
                _4120 = false;
                _4130 = _4024;
                _4132 = _4026;
                _4134 = _4028;
                _4136 = _4030;
                _4138 = true;
            }
        }
        else
        {
            float _4170 = _545 + _4040;
            float _4172 = _547 + _4042;
            float _4174 = _549 + _4044;
            float _4176 = _4046 + 1.0;
            _4130 = _4024;
            _4132 = _4026;
            _4134 = _4028;
            _4136 = _4030;
            _4106 = _4170;
            _4108 = _4172;
            _4110 = _4174;
            _4112 = _4176;
        }
    }
    _4138 = false;
    float _4178 = _4090;
    float _4180 = _4092;
    float _4182 = _4094;
    float _4184 = _4096;
    float _4186 = _4130;
    float _4188 = _4132;
    float _4190 = _4134;
    float _4192 = _4136;
    float _4194 = _4098;
    float _4196 = _4100;
    float _4198 = _4102;
    float _4200 = _4104;
    float _4202 = _4106;
    float _4204 = _4108;
    float _4206 = _4110;
    float _4208 = _4112;
    float _4210 = -_2911;
    float _4212 = _555 + _4210;
    float _4214 = -_2915;
    float _4216 = _553 + _4214;
    float _4218 = _2925 * _4212;
    float _4220 = -_2919;
    float _4222 = _557 + _4220;
    float _4224 = fma(_2929, _4216, _4218);
    float _4226 = fma(_2933, _4222, _4224);
    float _4228 = _2961 * _4226;
    float _4230 = rint(_4228);
    float _4232 = precise::max(0.0, _4230);
    float _4234 = precise::min(_4232, 3.0);
    float _4236 = trunc(_4234);
    int _4238 = int(_4236);
    bool _4240 = _4238 >= 2;
    bool _4242 = !_4240;
    float _4244 = _4230;
    float _4246 = as_type<float>(_4238);
    float _4248 = _4218;
    float _4250 = _4224;
    float _4252 = _4178;
    float _4254 = _4180;
    float _4256 = _4182;
    float _4258 = _4184;
    float _4260 = _4194;
    float _4262 = _4196;
    float _4264 = _4198;
    float _4266 = _4200;
    float _4268 = _4202;
    float _4270 = _4204;
    float _4272 = _4206;
    float _4274 = _4208;
    float _4292;
    float _4294;
    float _4296;
    float _4298;
    if (!_4242)
    {
        bool _4276 = _4238 >= 3;
        bool _4278 = !_4276;
        if (!_4278)
        {
            bool _4280 = _4238 != 3;
            _4282 = _4280;
            if (!_4282)
            {
                float _4284 = _553 + _4178;
                float _4286 = _555 + _4180;
                float _4288 = _557 + _4182;
                float _4290 = _4184 + 1.0;
                _4252 = _4284;
                _4254 = _4286;
                _4256 = _4288;
                _4258 = _4290;
                _4292 = _4186;
                _4294 = _4188;
                _4296 = _4190;
                _4298 = _4192;
                _4300 = true;
            }
        }
        else
        {
            float _4302 = _553 + _4194;
            float _4304 = _555 + _4196;
            float _4306 = _557 + _4198;
            float _4308 = _4200 + 1.0;
            _4292 = _4186;
            _4294 = _4188;
            _4296 = _4190;
            _4298 = _4192;
            _4260 = _4302;
            _4262 = _4304;
            _4264 = _4306;
            _4266 = _4308;
            _4300 = true;
        }
    }
    if ((!_4300) || _4282)
    {
        bool _4310;
        if (!_4282)
        {
            _4310 = _4238 >= 1;
        }
        if ((!_4310) || _4282)
        {
            if (!_4282)
            {
                bool _4312 = _4238 != 0;
                if (!_4312)
                {
                    float _4314 = _553 + _4186;
                    _4244 = _4314;
                }
                float _4316 = _4244;
                _4292 = _4316;
                if (!_4312)
                {
                    float _4318 = _555 + _4188;
                    _4246 = _4318;
                }
                float _4320 = _4246;
                _4294 = _4320;
                if (!_4312)
                {
                    float _4322 = _557 + _4190;
                    _4248 = _4322;
                }
                float _4324 = _4248;
                _4296 = _4324;
                if (!_4312)
                {
                    float _4326 = _4192 + 1.0;
                    _4250 = _4326;
                }
                float _4328 = _4250;
                bool _4330 = !_4312;
                _4298 = _4328;
                _4300 = _4330;
            }
            if ((!_4300) || _4282)
            {
                _4282 = false;
                _4292 = _4186;
                _4294 = _4188;
                _4296 = _4190;
                _4298 = _4192;
                _4300 = true;
            }
        }
        else
        {
            float _4332 = _553 + _4202;
            float _4334 = _555 + _4204;
            float _4336 = _557 + _4206;
            float _4338 = _4208 + 1.0;
            _4292 = _4186;
            _4294 = _4188;
            _4296 = _4190;
            _4298 = _4192;
            _4268 = _4332;
            _4270 = _4334;
            _4272 = _4336;
            _4274 = _4338;
        }
    }
    _4300 = false;
    float _4340 = _4252;
    float _4342 = _4254;
    float _4344 = _4256;
    float _4346 = _4258;
    float _4348 = _4292;
    float _4350 = _4294;
    float _4352 = _4296;
    float _4354 = _4298;
    float _4356 = _4260;
    float _4358 = _4262;
    float _4360 = _4264;
    float _4362 = _4266;
    float _4364 = _4268;
    float _4366 = _4270;
    float _4368 = _4272;
    float _4370 = _4274;
    float _4372 = -_2911;
    float _4374 = _563 + _4372;
    float _4376 = -_2915;
    float _4378 = _561 + _4376;
    float _4380 = _2925 * _4374;
    float _4382 = -_2919;
    float _4384 = _565 + _4382;
    float _4386 = fma(_2929, _4378, _4380);
    float _4388 = fma(_2933, _4384, _4386);
    float _4390 = _2961 * _4388;
    float _4392 = rint(_4390);
    float _4394 = precise::max(0.0, _4392);
    float _4396 = precise::min(_4394, 3.0);
    float _4398 = trunc(_4396);
    int _4400 = int(_4398);
    bool _4402 = _4400 >= 2;
    bool _4404 = !_4402;
    float _4406 = _4392;
    float _4408 = as_type<float>(_4400);
    float _4410 = _4380;
    float _4412 = _4386;
    float _4414 = _4340;
    float _4416 = _4342;
    float _4418 = _4344;
    float _4420 = _4346;
    float _4422 = _4356;
    float _4424 = _4358;
    float _4426 = _4360;
    float _4428 = _4362;
    float _4430 = _4364;
    float _4432 = _4366;
    float _4434 = _4368;
    float _4436 = _4370;
    float _4454;
    float _4456;
    float _4458;
    float _4460;
    if (!_4404)
    {
        bool _4438 = _4400 >= 3;
        bool _4440 = !_4438;
        if (!_4440)
        {
            bool _4442 = _4400 != 3;
            _4444 = _4442;
            if (!_4444)
            {
                float _4446 = _561 + _4340;
                float _4448 = _563 + _4342;
                float _4450 = _565 + _4344;
                float _4452 = _4346 + 1.0;
                _4414 = _4446;
                _4416 = _4448;
                _4418 = _4450;
                _4420 = _4452;
                _4454 = _4348;
                _4456 = _4350;
                _4458 = _4352;
                _4460 = _4354;
                _4462 = true;
            }
        }
        else
        {
            float _4464 = _561 + _4356;
            float _4466 = _563 + _4358;
            float _4468 = _565 + _4360;
            float _4470 = _4362 + 1.0;
            _4454 = _4348;
            _4456 = _4350;
            _4458 = _4352;
            _4460 = _4354;
            _4422 = _4464;
            _4424 = _4466;
            _4426 = _4468;
            _4428 = _4470;
            _4462 = true;
        }
    }
    if ((!_4462) || _4444)
    {
        bool _4472;
        if (!_4444)
        {
            _4472 = _4400 >= 1;
        }
        if ((!_4472) || _4444)
        {
            if (!_4444)
            {
                bool _4474 = _4400 != 0;
                if (!_4474)
                {
                    float _4476 = _561 + _4348;
                    _4406 = _4476;
                }
                float _4478 = _4406;
                _4454 = _4478;
                if (!_4474)
                {
                    float _4480 = _563 + _4350;
                    _4408 = _4480;
                }
                float _4482 = _4408;
                _4456 = _4482;
                if (!_4474)
                {
                    float _4484 = _565 + _4352;
                    _4410 = _4484;
                }
                float _4486 = _4410;
                _4458 = _4486;
                if (!_4474)
                {
                    float _4488 = _4354 + 1.0;
                    _4412 = _4488;
                }
                float _4490 = _4412;
                bool _4492 = !_4474;
                _4460 = _4490;
                _4462 = _4492;
            }
            if ((!_4462) || _4444)
            {
                _4444 = false;
                _4454 = _4348;
                _4456 = _4350;
                _4458 = _4352;
                _4460 = _4354;
                _4462 = true;
            }
        }
        else
        {
            float _4494 = _561 + _4364;
            float _4496 = _563 + _4366;
            float _4498 = _565 + _4368;
            float _4500 = _4370 + 1.0;
            _4454 = _4348;
            _4456 = _4350;
            _4458 = _4352;
            _4460 = _4354;
            _4430 = _4494;
            _4432 = _4496;
            _4434 = _4498;
            _4436 = _4500;
        }
    }
    _4462 = false;
    float _4502 = _4414;
    float _4504 = _4416;
    float _4506 = _4418;
    float _4508 = _4420;
    float _4510 = _4454;
    float _4512 = _4456;
    float _4514 = _4458;
    float _4516 = _4460;
    float _4518 = _4422;
    float _4520 = _4424;
    float _4522 = _4426;
    float _4524 = _4428;
    float _4526 = _4430;
    float _4528 = _4432;
    float _4530 = _4434;
    float _4532 = _4436;
    float _4534 = -_2911;
    float _4536 = _571 + _4534;
    float _4538 = -_2915;
    float _4540 = _569 + _4538;
    float _4542 = _2925 * _4536;
    float _4544 = -_2919;
    float _4546 = _573 + _4544;
    float _4548 = fma(_2929, _4540, _4542);
    float _4550 = fma(_2933, _4546, _4548);
    float _4552 = _2961 * _4550;
    float _4554 = rint(_4552);
    float _4556 = precise::max(0.0, _4554);
    float _4558 = precise::min(_4556, 3.0);
    float _4560 = trunc(_4558);
    int _4562 = int(_4560);
    bool _4564 = _4562 >= 2;
    bool _4566 = !_4564;
    float _4568 = _4554;
    float _4570 = as_type<float>(_4562);
    float _4572 = _4542;
    float _4574 = _4548;
    float _4576 = _4502;
    float _4578 = _4504;
    float _4580 = _4506;
    float _4582 = _4508;
    float _4584 = _4518;
    float _4586 = _4520;
    float _4588 = _4522;
    float _4590 = _4524;
    float _4592 = _4526;
    float _4594 = _4528;
    float _4596 = _4530;
    float _4598 = _4532;
    float _4616;
    float _4618;
    float _4620;
    float _4622;
    if (!_4566)
    {
        bool _4600 = _4562 >= 3;
        bool _4602 = !_4600;
        if (!_4602)
        {
            bool _4604 = _4562 != 3;
            _4606 = _4604;
            if (!_4606)
            {
                float _4608 = _569 + _4502;
                float _4610 = _571 + _4504;
                float _4612 = _573 + _4506;
                float _4614 = _4508 + 1.0;
                _4576 = _4608;
                _4578 = _4610;
                _4580 = _4612;
                _4582 = _4614;
                _4616 = _4510;
                _4618 = _4512;
                _4620 = _4514;
                _4622 = _4516;
                _4624 = true;
            }
        }
        else
        {
            float _4626 = _569 + _4518;
            float _4628 = _571 + _4520;
            float _4630 = _573 + _4522;
            float _4632 = _4524 + 1.0;
            _4616 = _4510;
            _4618 = _4512;
            _4620 = _4514;
            _4622 = _4516;
            _4584 = _4626;
            _4586 = _4628;
            _4588 = _4630;
            _4590 = _4632;
            _4624 = true;
        }
    }
    if ((!_4624) || _4606)
    {
        bool _4634;
        if (!_4606)
        {
            _4634 = _4562 >= 1;
        }
        if ((!_4634) || _4606)
        {
            if (!_4606)
            {
                bool _4636 = _4562 != 0;
                if (!_4636)
                {
                    float _4638 = _569 + _4510;
                    _4568 = _4638;
                }
                float _4640 = _4568;
                _4616 = _4640;
                if (!_4636)
                {
                    float _4642 = _571 + _4512;
                    _4570 = _4642;
                }
                float _4644 = _4570;
                _4618 = _4644;
                if (!_4636)
                {
                    float _4646 = _573 + _4514;
                    _4572 = _4646;
                }
                float _4648 = _4572;
                _4620 = _4648;
                if (!_4636)
                {
                    float _4650 = _4516 + 1.0;
                    _4574 = _4650;
                }
                float _4652 = _4574;
                bool _4654 = !_4636;
                _4622 = _4652;
                _4624 = _4654;
            }
            if ((!_4624) || _4606)
            {
                _4606 = false;
                _4616 = _4510;
                _4618 = _4512;
                _4620 = _4514;
                _4622 = _4516;
                _4624 = true;
            }
        }
        else
        {
            float _4656 = _569 + _4526;
            float _4658 = _571 + _4528;
            float _4660 = _573 + _4530;
            float _4662 = _4532 + 1.0;
            _4616 = _4510;
            _4618 = _4512;
            _4620 = _4514;
            _4622 = _4516;
            _4592 = _4656;
            _4594 = _4658;
            _4596 = _4660;
            _4598 = _4662;
        }
    }
    _4624 = false;
    float _4664 = _4576;
    float _4666 = _4578;
    float _4668 = _4580;
    float _4670 = _4582;
    float _4672 = _4616;
    float _4674 = _4618;
    float _4676 = _4620;
    float _4678 = _4622;
    float _4680 = _4584;
    float _4682 = _4586;
    float _4684 = _4588;
    float _4686 = _4590;
    float _4688 = _4592;
    float _4690 = _4594;
    float _4692 = _4596;
    float _4694 = _4598;
    float _4696 = -_2911;
    float _4698 = _591 + _4696;
    float _4700 = -_2915;
    float _4702 = _589 + _4700;
    float _4704 = _2925 * _4698;
    float _4706 = -_2919;
    float _4708 = _593 + _4706;
    float _4710 = fma(_2929, _4702, _4704);
    float _4712 = fma(_2933, _4708, _4710);
    float _4714 = _2961 * _4712;
    float _4716 = rint(_4714);
    float _4718 = precise::max(0.0, _4716);
    float _4720 = precise::min(_4718, 3.0);
    float _4722 = trunc(_4720);
    int _4724 = int(_4722);
    bool _4726 = _4724 >= 2;
    bool _4728 = !_4726;
    float _4730 = _4716;
    float _4732 = as_type<float>(_4724);
    float _4734 = _4704;
    float _4736 = _4710;
    float _4738 = _4664;
    float _4740 = _4666;
    float _4742 = _4668;
    float _4744 = _4670;
    float _4746 = _4680;
    float _4748 = _4682;
    float _4750 = _4684;
    float _4752 = _4686;
    float _4754 = _4688;
    float _4756 = _4690;
    float _4758 = _4692;
    float _4760 = _4694;
    float _4778;
    float _4780;
    float _4782;
    float _4784;
    if (!_4728)
    {
        bool _4762 = _4724 >= 3;
        bool _4764 = !_4762;
        if (!_4764)
        {
            bool _4766 = _4724 != 3;
            _4768 = _4766;
            if (!_4768)
            {
                float _4770 = _589 + _4664;
                float _4772 = _591 + _4666;
                float _4774 = _593 + _4668;
                float _4776 = _4670 + 1.0;
                _4738 = _4770;
                _4740 = _4772;
                _4742 = _4774;
                _4744 = _4776;
                _4778 = _4672;
                _4780 = _4674;
                _4782 = _4676;
                _4784 = _4678;
                _4786 = true;
            }
        }
        else
        {
            float _4788 = _589 + _4680;
            float _4790 = _591 + _4682;
            float _4792 = _593 + _4684;
            float _4794 = _4686 + 1.0;
            _4778 = _4672;
            _4780 = _4674;
            _4782 = _4676;
            _4784 = _4678;
            _4746 = _4788;
            _4748 = _4790;
            _4750 = _4792;
            _4752 = _4794;
            _4786 = true;
        }
    }
    if ((!_4786) || _4768)
    {
        bool _4796;
        if (!_4768)
        {
            _4796 = _4724 >= 1;
        }
        if ((!_4796) || _4768)
        {
            if (!_4768)
            {
                bool _4798 = _4724 != 0;
                if (!_4798)
                {
                    float _4800 = _589 + _4672;
                    _4730 = _4800;
                }
                float _4802 = _4730;
                _4778 = _4802;
                if (!_4798)
                {
                    float _4804 = _591 + _4674;
                    _4732 = _4804;
                }
                float _4806 = _4732;
                _4780 = _4806;
                if (!_4798)
                {
                    float _4808 = _593 + _4676;
                    _4734 = _4808;
                }
                float _4810 = _4734;
                _4782 = _4810;
                if (!_4798)
                {
                    float _4812 = _4678 + 1.0;
                    _4736 = _4812;
                }
                float _4814 = _4736;
                bool _4816 = !_4798;
                _4784 = _4814;
                _4786 = _4816;
            }
            if ((!_4786) || _4768)
            {
                _4768 = false;
                _4778 = _4672;
                _4780 = _4674;
                _4782 = _4676;
                _4784 = _4678;
                _4786 = true;
            }
        }
        else
        {
            float _4818 = _589 + _4688;
            float _4820 = _591 + _4690;
            float _4822 = _593 + _4692;
            float _4824 = _4694 + 1.0;
            _4778 = _4672;
            _4780 = _4674;
            _4782 = _4676;
            _4784 = _4678;
            _4754 = _4818;
            _4756 = _4820;
            _4758 = _4822;
            _4760 = _4824;
        }
    }
    _4786 = false;
    float _4826 = _4738;
    float _4828 = _4740;
    float _4830 = _4742;
    float _4832 = _4744;
    float _4834 = _4778;
    float _4836 = _4780;
    float _4838 = _4782;
    float _4840 = _4784;
    float _4842 = _4746;
    float _4844 = _4748;
    float _4846 = _4750;
    float _4848 = _4752;
    float _4850 = _4754;
    float _4852 = _4756;
    float _4854 = _4758;
    float _4856 = _4760;
    float _4858 = -_2911;
    float _4860 = _599 + _4858;
    float _4862 = -_2915;
    float _4864 = _597 + _4862;
    float _4866 = _2925 * _4860;
    float _4868 = -_2919;
    float _4870 = _601 + _4868;
    float _4872 = fma(_2929, _4864, _4866);
    float _4874 = fma(_2933, _4870, _4872);
    float _4876 = _2961 * _4874;
    float _4878 = rint(_4876);
    float _4880 = precise::max(0.0, _4878);
    float _4882 = precise::min(_4880, 3.0);
    float _4884 = trunc(_4882);
    int _4886 = int(_4884);
    bool _4888 = _4886 >= 2;
    bool _4890 = !_4888;
    float _4892 = _4878;
    float _4894 = as_type<float>(_4886);
    float _4896 = _4866;
    float _4898 = _4872;
    float _4900 = _4826;
    float _4902 = _4828;
    float _4904 = _4830;
    float _4906 = _4832;
    float _4908 = _4842;
    float _4910 = _4844;
    float _4912 = _4846;
    float _4914 = _4848;
    float _4916 = _4850;
    float _4918 = _4852;
    float _4920 = _4854;
    float _4922 = _4856;
    float _4940;
    float _4942;
    float _4944;
    float _4946;
    if (!_4890)
    {
        bool _4924 = _4886 >= 3;
        bool _4926 = !_4924;
        if (!_4926)
        {
            bool _4928 = _4886 != 3;
            _4930 = _4928;
            if (!_4930)
            {
                float _4932 = _597 + _4826;
                float _4934 = _599 + _4828;
                float _4936 = _601 + _4830;
                float _4938 = _4832 + 1.0;
                _4900 = _4932;
                _4902 = _4934;
                _4904 = _4936;
                _4906 = _4938;
                _4940 = _4834;
                _4942 = _4836;
                _4944 = _4838;
                _4946 = _4840;
                _4948 = true;
            }
        }
        else
        {
            float _4950 = _597 + _4842;
            float _4952 = _599 + _4844;
            float _4954 = _601 + _4846;
            float _4956 = _4848 + 1.0;
            _4940 = _4834;
            _4942 = _4836;
            _4944 = _4838;
            _4946 = _4840;
            _4908 = _4950;
            _4910 = _4952;
            _4912 = _4954;
            _4914 = _4956;
            _4948 = true;
        }
    }
    if ((!_4948) || _4930)
    {
        bool _4958;
        if (!_4930)
        {
            _4958 = _4886 >= 1;
        }
        if ((!_4958) || _4930)
        {
            if (!_4930)
            {
                bool _4960 = _4886 != 0;
                if (!_4960)
                {
                    float _4962 = _597 + _4834;
                    _4892 = _4962;
                }
                float _4964 = _4892;
                _4940 = _4964;
                if (!_4960)
                {
                    float _4966 = _599 + _4836;
                    _4894 = _4966;
                }
                float _4968 = _4894;
                _4942 = _4968;
                if (!_4960)
                {
                    float _4970 = _601 + _4838;
                    _4896 = _4970;
                }
                float _4972 = _4896;
                _4944 = _4972;
                if (!_4960)
                {
                    float _4974 = _4840 + 1.0;
                    _4898 = _4974;
                }
                float _4976 = _4898;
                bool _4978 = !_4960;
                _4946 = _4976;
                _4948 = _4978;
            }
            if ((!_4948) || _4930)
            {
                _4930 = false;
                _4940 = _4834;
                _4942 = _4836;
                _4944 = _4838;
                _4946 = _4840;
                _4948 = true;
            }
        }
        else
        {
            float _4980 = _597 + _4850;
            float _4982 = _599 + _4852;
            float _4984 = _601 + _4854;
            float _4986 = _4856 + 1.0;
            _4940 = _4834;
            _4942 = _4836;
            _4944 = _4838;
            _4946 = _4840;
            _4916 = _4980;
            _4918 = _4982;
            _4920 = _4984;
            _4922 = _4986;
        }
    }
    _4948 = false;
    float _4988 = _4900;
    float _4990 = _4902;
    float _4992 = _4904;
    float _4994 = _4906;
    float _4996 = _4940;
    float _4998 = _4942;
    float _5000 = _4944;
    float _5002 = _4946;
    float _5004 = _4908;
    float _5006 = _4910;
    float _5008 = _4912;
    float _5010 = _4914;
    float _5012 = _4916;
    float _5014 = _4918;
    float _5016 = _4920;
    float _5018 = _4922;
    float _5020 = -_2911;
    float _5022 = _607 + _5020;
    float _5024 = -_2915;
    float _5026 = _605 + _5024;
    float _5028 = _2925 * _5022;
    float _5030 = -_2919;
    float _5032 = _609 + _5030;
    float _5034 = fma(_2929, _5026, _5028);
    float _5036 = fma(_2933, _5032, _5034);
    float _5038 = _2961 * _5036;
    float _5040 = rint(_5038);
    float _5042 = precise::max(0.0, _5040);
    float _5044 = precise::min(_5042, 3.0);
    float _5046 = trunc(_5044);
    int _5048 = int(_5046);
    bool _5050 = _5048 >= 2;
    bool _5052 = !_5050;
    float _5054 = _5040;
    float _5056 = as_type<float>(_5048);
    float _5058 = _5028;
    float _5060 = _5034;
    float _5062 = _4988;
    float _5064 = _4990;
    float _5066 = _4992;
    float _5068 = _4994;
    float _5070 = _5004;
    float _5072 = _5006;
    float _5074 = _5008;
    float _5076 = _5010;
    float _5078 = _5012;
    float _5080 = _5014;
    float _5082 = _5016;
    float _5084 = _5018;
    float _5102;
    float _5104;
    float _5106;
    float _5108;
    if (!_5052)
    {
        bool _5086 = _5048 >= 3;
        bool _5088 = !_5086;
        if (!_5088)
        {
            bool _5090 = _5048 != 3;
            _5092 = _5090;
            if (!_5092)
            {
                float _5094 = _605 + _4988;
                float _5096 = _607 + _4990;
                float _5098 = _609 + _4992;
                float _5100 = _4994 + 1.0;
                _5062 = _5094;
                _5064 = _5096;
                _5066 = _5098;
                _5068 = _5100;
                _5102 = _4996;
                _5104 = _4998;
                _5106 = _5000;
                _5108 = _5002;
                _5110 = true;
            }
        }
        else
        {
            float _5112 = _605 + _5004;
            float _5114 = _607 + _5006;
            float _5116 = _609 + _5008;
            float _5118 = _5010 + 1.0;
            _5102 = _4996;
            _5104 = _4998;
            _5106 = _5000;
            _5108 = _5002;
            _5070 = _5112;
            _5072 = _5114;
            _5074 = _5116;
            _5076 = _5118;
            _5110 = true;
        }
    }
    if ((!_5110) || _5092)
    {
        bool _5120;
        if (!_5092)
        {
            _5120 = _5048 >= 1;
        }
        if ((!_5120) || _5092)
        {
            if (!_5092)
            {
                bool _5122 = _5048 != 0;
                if (!_5122)
                {
                    float _5124 = _605 + _4996;
                    _5054 = _5124;
                }
                float _5126 = _5054;
                _5102 = _5126;
                if (!_5122)
                {
                    float _5128 = _607 + _4998;
                    _5056 = _5128;
                }
                float _5130 = _5056;
                _5104 = _5130;
                if (!_5122)
                {
                    float _5132 = _609 + _5000;
                    _5058 = _5132;
                }
                float _5134 = _5058;
                _5106 = _5134;
                if (!_5122)
                {
                    float _5136 = _5002 + 1.0;
                    _5060 = _5136;
                }
                float _5138 = _5060;
                bool _5140 = !_5122;
                _5108 = _5138;
                _5110 = _5140;
            }
            if ((!_5110) || _5092)
            {
                _5092 = false;
                _5102 = _4996;
                _5104 = _4998;
                _5106 = _5000;
                _5108 = _5002;
                _5110 = true;
            }
        }
        else
        {
            float _5142 = _605 + _5012;
            float _5144 = _607 + _5014;
            float _5146 = _609 + _5016;
            float _5148 = _5018 + 1.0;
            _5102 = _4996;
            _5104 = _4998;
            _5106 = _5000;
            _5108 = _5002;
            _5078 = _5142;
            _5080 = _5144;
            _5082 = _5146;
            _5084 = _5148;
        }
    }
    _5110 = false;
    float _5150 = _5062;
    float _5152 = _5064;
    float _5154 = _5066;
    float _5156 = _5068;
    float _5158 = _5102;
    float _5160 = _5104;
    float _5162 = _5106;
    float _5164 = _5108;
    float _5166 = _5070;
    float _5168 = _5072;
    float _5170 = _5074;
    float _5172 = _5076;
    float _5174 = _5078;
    float _5176 = _5080;
    float _5178 = _5082;
    float _5180 = _5084;
    float _5182 = -_2911;
    float _5184 = _615 + _5182;
    float _5186 = -_2915;
    float _5188 = _613 + _5186;
    float _5190 = _2925 * _5184;
    float _5192 = -_2919;
    float _5194 = _617 + _5192;
    float _5196 = fma(_2929, _5188, _5190);
    float _5198 = fma(_2933, _5194, _5196);
    float _5200 = _2961 * _5198;
    float _5202 = rint(_5200);
    float _5204 = precise::max(0.0, _5202);
    float _5206 = precise::min(_5204, 3.0);
    float _5208 = trunc(_5206);
    int _5210 = int(_5208);
    bool _5212 = _5210 >= 2;
    bool _5214 = !_5212;
    float _5216 = _5202;
    float _5218 = as_type<float>(_5210);
    float _5220 = _5190;
    float _5222 = _5196;
    float _5224 = _5150;
    float _5226 = _5152;
    float _5228 = _5154;
    float _5230 = _5156;
    float _5232 = _5166;
    float _5234 = _5168;
    float _5236 = _5170;
    float _5238 = _5172;
    float _5240 = _5174;
    float _5242 = _5176;
    float _5244 = _5178;
    float _5246 = _5180;
    float _5264;
    float _5266;
    float _5268;
    float _5270;
    if (!_5214)
    {
        bool _5248 = _5210 >= 3;
        bool _5250 = !_5248;
        if (!_5250)
        {
            bool _5252 = _5210 != 3;
            _5254 = _5252;
            if (!_5254)
            {
                float _5256 = _613 + _5150;
                float _5258 = _615 + _5152;
                float _5260 = _617 + _5154;
                float _5262 = _5156 + 1.0;
                _5224 = _5256;
                _5226 = _5258;
                _5228 = _5260;
                _5230 = _5262;
                _5264 = _5158;
                _5266 = _5160;
                _5268 = _5162;
                _5270 = _5164;
                _5272 = true;
            }
        }
        else
        {
            float _5274 = _613 + _5166;
            float _5276 = _615 + _5168;
            float _5278 = _617 + _5170;
            float _5280 = _5172 + 1.0;
            _5264 = _5158;
            _5266 = _5160;
            _5268 = _5162;
            _5270 = _5164;
            _5232 = _5274;
            _5234 = _5276;
            _5236 = _5278;
            _5238 = _5280;
            _5272 = true;
        }
    }
    if ((!_5272) || _5254)
    {
        bool _5282;
        if (!_5254)
        {
            _5282 = _5210 >= 1;
        }
        if ((!_5282) || _5254)
        {
            if (!_5254)
            {
                bool _5284 = _5210 != 0;
                if (!_5284)
                {
                    float _5286 = _613 + _5158;
                    _5216 = _5286;
                }
                float _5288 = _5216;
                _5264 = _5288;
                if (!_5284)
                {
                    float _5290 = _615 + _5160;
                    _5218 = _5290;
                }
                float _5292 = _5218;
                _5266 = _5292;
                if (!_5284)
                {
                    float _5294 = _617 + _5162;
                    _5220 = _5294;
                }
                float _5296 = _5220;
                _5268 = _5296;
                if (!_5284)
                {
                    float _5298 = _5164 + 1.0;
                    _5222 = _5298;
                }
                float _5300 = _5222;
                bool _5302 = !_5284;
                _5270 = _5300;
                _5272 = _5302;
            }
            if ((!_5272) || _5254)
            {
                _5254 = false;
                _5264 = _5158;
                _5266 = _5160;
                _5268 = _5162;
                _5270 = _5164;
                _5272 = true;
            }
        }
        else
        {
            float _5304 = _613 + _5174;
            float _5306 = _615 + _5176;
            float _5308 = _617 + _5178;
            float _5310 = _5180 + 1.0;
            _5264 = _5158;
            _5266 = _5160;
            _5268 = _5162;
            _5270 = _5164;
            _5240 = _5304;
            _5242 = _5306;
            _5244 = _5308;
            _5246 = _5310;
        }
    }
    _5272 = false;
    float _5312 = _5224;
    float _5314 = _5226;
    float _5316 = _5228;
    float _5318 = _5230;
    float _5320 = _5264;
    float _5322 = _5266;
    float _5324 = _5268;
    float _5326 = _5270;
    float _5328 = _5232;
    float _5330 = _5234;
    float _5332 = _5236;
    float _5334 = _5238;
    float _5336 = _5240;
    float _5338 = _5242;
    float _5340 = _5244;
    float _5342 = _5246;
    float _5344 = -_2911;
    float _5346 = _623 + _5344;
    float _5348 = -_2915;
    float _5350 = _621 + _5348;
    float _5352 = _2925 * _5346;
    float _5354 = -_2919;
    float _5356 = _625 + _5354;
    float _5358 = fma(_2929, _5350, _5352);
    float _5360 = fma(_2933, _5356, _5358);
    float _5362 = _2961 * _5360;
    float _5364 = rint(_5362);
    float _5366 = precise::max(0.0, _5364);
    float _5368 = precise::min(_5366, 3.0);
    float _5370 = trunc(_5368);
    int _5372 = int(_5370);
    bool _5374 = _5372 >= 2;
    bool _5376 = !_5374;
    float _5378 = as_type<float>(_5372);
    float _5380 = _5364;
    float _5382 = _5356;
    float _5384 = _5352;
    float _5386 = _5342;
    float _5388 = _5334;
    float _5390 = _5328;
    float _5392 = _5318;
    float _5394 = _5336;
    float _5396 = _5338;
    float _5398 = _5340;
    float _5400 = _5332;
    float _5402 = _5330;
    float _5404 = _5314;
    float _5406 = _5312;
    float _5408 = _5316;
    float _5426;
    float _5428;
    float _5430;
    float _5432;
    if (!_5376)
    {
        bool _5410 = _5372 >= 3;
        bool _5412 = !_5410;
        if (!_5412)
        {
            bool _5414 = _5372 != 3;
            _5416 = _5414;
            if (!_5416)
            {
                float _5418 = _621 + _5312;
                float _5420 = _623 + _5314;
                float _5422 = _625 + _5316;
                float _5424 = _5318 + 1.0;
                _5426 = _5326;
                _5392 = _5424;
                _5428 = _5320;
                _5430 = _5322;
                _5432 = _5324;
                _5404 = _5420;
                _5406 = _5418;
                _5408 = _5422;
                _5434 = true;
            }
        }
        else
        {
            float _5436 = _621 + _5328;
            float _5438 = _623 + _5330;
            float _5440 = _625 + _5332;
            float _5442 = _5334 + 1.0;
            _5388 = _5442;
            _5390 = _5436;
            _5426 = _5326;
            _5428 = _5320;
            _5400 = _5440;
            _5430 = _5322;
            _5402 = _5438;
            _5432 = _5324;
            _5434 = true;
        }
    }
    if ((!_5434) || _5416)
    {
        bool _5444;
        if (!_5416)
        {
            _5444 = _5372 >= 1;
        }
        if ((!_5444) || _5416)
        {
            if (!_5416)
            {
                bool _5446 = _5372 != 0;
                if (!_5446)
                {
                    float _5448 = _621 + _5320;
                    _5378 = _5448;
                }
                float _5450 = _5378;
                _5428 = _5450;
                if (!_5446)
                {
                    float _5452 = _623 + _5322;
                    _5380 = _5452;
                }
                float _5454 = _5380;
                _5430 = _5454;
                if (!_5446)
                {
                    float _5456 = _625 + _5324;
                    _5382 = _5456;
                }
                float _5458 = _5382;
                _5432 = _5458;
                if (!_5446)
                {
                    float _5460 = _5326 + 1.0;
                    _5384 = _5460;
                }
                float _5462 = _5384;
                bool _5464 = !_5446;
                _5426 = _5462;
                _5434 = _5464;
            }
            if ((!_5434) || _5416)
            {
                _5416 = false;
                _5426 = _5326;
                _5428 = _5320;
                _5430 = _5322;
                _5432 = _5324;
                _5434 = true;
            }
        }
        else
        {
            float _5466 = _621 + _5336;
            float _5468 = _623 + _5338;
            float _5470 = _625 + _5340;
            float _5472 = _5342 + 1.0;
            _5386 = _5472;
            _5426 = _5326;
            _5394 = _5466;
            _5396 = _5468;
            _5428 = _5320;
            _5398 = _5470;
            _5430 = _5322;
            _5432 = _5324;
        }
    }
    _5434 = false;
    float _5474 = _5386;
    float _5476 = _5388;
    float _5478 = _5390;
    float _5480 = _5426;
    float _5482 = _5392;
    float _5484 = _5394;
    float _5486 = _5396;
    float _5488 = _5428;
    float _5490 = _5398;
    float _5492 = _5400;
    float _5494 = _5430;
    float _5496 = _5402;
    float _5498 = _5432;
    float _5500 = _5404;
    float _5502 = _5406;
    float _5504 = _5408;
    float _5506 = _5474 * 4.0;
    float _5508 = fma(_5476, 4.0, _5474);
    float _5510 = _5476 + _5474;
    float _5512 = _5478 * 6.0;
    float _5514 = fma(_5480, 9.0, _5506);
    float _5516 = fma(_5482, 9.0, _5508);
    float _5518 = _5484 * 6.0;
    float _5520 = _5510 * 2.0;
    float _5522 = _5514 + _5476;
    float _5524 = _5486 * 6.0;
    float _5526 = fma(_5488, 9.0, _5518);
    float _5528 = _5490 * 6.0;
    float _5530 = _5522 * _5516;
    float _5532 = _5492 * 6.0;
    float _5534 = fma(_5484, 3.0, _5512);
    float _5536 = fma(_5494, 9.0, _5524);
    float _5538 = -_5530;
    float _5540 = fma(_5520, _5520, _5538);
    float _5542 = _5496 * 6.0;
    float _5544 = fma(_5498, 9.0, _5528);
    float _5546 = fma(_5490, 3.0, _5532);
    bool _5548 = _5540 != 0.0;
    bool _5550 = isnan(_5540);
    bool _5552 = _5548 || _5550;
    bool _5554 = isnan(0.0);
    bool _5556 = _5552 || _5554;
    float _5558 = fma(_5486, 3.0, _5542);
    float _5560 = fma(_5478, 3.0, _5526);
    float _5562 = fma(_5496, 3.0, _5536);
    float _5564 = fma(_5492, 3.0, _5544);
    float _5566 = fma(_5500, 9.0, _5558);
    float _5568 = fma(_5502, 9.0, _5534);
    float _5570 = fma(_5504, 9.0, _5546);
    bool _5572 = !_5556;
    if (!_5572)
    {
        float _5574 = 1.0 / _5540;
        float _5576 = _5560 * _5516;
        float _5578 = _5522 * _5568;
        float _5580 = _5522 * _5570;
        float _5582 = -_5576;
        float _5584 = fma(_5568, _5520, _5582);
        float _5586 = -_5578;
        float _5588 = fma(_5560, _5520, _5586);
        float _5590 = _5562 * _5516;
        float _5592 = _5522 * _5566;
        float _5594 = _5564 * _5516;
        float _5596 = -_5580;
        float _5598 = fma(_5564, _5520, _5596);
        float _5600 = -_5590;
        float _5602 = fma(_5566, _5520, _5600);
        float _5604 = -_5592;
        float _5606 = fma(_5562, _5520, _5604);
        float _5608 = -_5594;
        float _5610 = fma(_5570, _5520, _5608);
        float _5612 = _5588 * _5574;
        float _5614 = _5606 * _5574;
        float _5616 = _5598 * _5574;
        float _5618 = _5584 * _5574;
        float _5620 = _5602 * _5574;
        float _5622 = _5610 * _5574;
        float _5624 = -_5618;
        float _5626 = _5612 + _5624;
        float _5628 = -_5620;
        float _5630 = _5614 + _5628;
        float _5632 = -_5622;
        float _5634 = _5616 + _5632;
        _2980 = _5626;
        _2982 = _5630;
        _2984 = _5634;
        _2986 = _5618;
        _2988 = _5612;
        _2990 = _5620;
        _2992 = _5614;
        _2994 = _5616;
        _2996 = _5622;
    }
    float _5636 = _2980;
    float _5638 = _2982;
    float _5640 = _2984;
    float _5642 = _2986;
    float _5644 = _2988;
    float _5646 = _2990;
    float _5648 = _2992;
    float _5650 = _2994;
    float _5652 = _2996;
    float _5654 = fma(_5636, 496.0, 0.5);
    float _5656 = precise::clamp(_5654, 0.0, 1.0);
    float _5658 = fma(_5636, -31.0, 1.0);
    float _5660 = precise::clamp(_5658, 0.0, 1.0);
    float _5662 = _5656 + (-0.5);
    float _5664 = fma(_5638, 1008.0, 0.5);
    float _5666 = precise::clamp(_5664, 0.0, 1.0);
    float _5668 = fma(_5638, -63.0, 1.0);
    float _5670 = precise::clamp(_5668, 0.0, 1.0);
    float _5672 = fma(_5640, 496.0, 0.5);
    float _5674 = precise::clamp(_5672, 0.0, 1.0);
    float _5676 = _5660 * _5662;
    float _5678 = _5666 + (-0.5);
    float _5680 = fma(_5640, -31.0, 1.0);
    float _5682 = precise::clamp(_5680, 0.0, 1.0);
    float _5684 = fma(_5676, -0.0322580635547637939453125, _5642);
    float _5686 = precise::clamp(_5684, 0.0, 1.0);
    float _5688 = _5670 * _5678;
    float _5690 = _5688 * 2.0;
    float _5692 = fma(_5676, 0.0322580635547637939453125, _5644);
    float _5694 = precise::clamp(_5692, 0.0, 1.0);
    float _5696 = _5686 * 31.0;
    float _5698 = fma(_5690, -0.01587301678955554962158203125, _5646);
    float _5700 = precise::clamp(_5698, 0.0, 1.0);
    float _5702 = fma(_5690, 0.01587301678955554962158203125, _5648);
    float _5704 = precise::clamp(_5702, 0.0, 1.0);
    float _5706 = _5694 * 31.0;
    float _5708 = rint(_5696);
    float _5710 = _5700 * 63.0;
    float _5712 = _5674 + (-0.5);
    float _5714 = _5704 * 63.0;
    float _5716 = _5682 * _5712;
    float _5718 = rint(_5706);
    float _5720 = fma(_5716, 0.0322580635547637939453125, _5650);
    float _5722 = precise::clamp(_5720, 0.0, 1.0);
    float _5724 = fma(_5716, -0.0322580635547637939453125, _5652);
    float _5726 = precise::clamp(_5724, 0.0, 1.0);
    float _5728 = _5722 * 31.0;
    float _5730 = _5726 * 31.0;
    float _5732 = rint(_5714);
    float _5734 = rint(_5710);
    float _5736 = _5718 + 0.5;
    float _5738 = _5708 + 0.5;
    float _5740 = rint(_5728);
    float _5742 = _5732 + 0.5;
    float _5744 = rint(_5730);
    float _5746 = _5734 + 0.5;
    float _5748 = _5740 + 0.5;
    float _5750 = trunc(_5736);
    float _5752 = precise::max(_5750, 0.0);
    uint _5755 = uint(_5752);
    float _5757 = _5744 + 0.5;
    float _5759 = trunc(_5742);
    float _5761 = precise::max(_5759, 0.0);
    uint _5763 = uint(_5761);
    float _5765 = trunc(_5738);
    float _5767 = precise::max(_5765, 0.0);
    uint _5769 = uint(_5767);
    int _5771 = int(_5755) << 11;
    float _5773 = trunc(_5746);
    float _5775 = precise::max(_5773, 0.0);
    uint _5777 = uint(_5775);
    int _5779 = int(_5763) << 5;
    float _5781 = trunc(_5748);
    float _5783 = precise::max(_5781, 0.0);
    uint _5785 = uint(_5783);
    int _5787 = int(_5769) << 11;
    float _5789 = trunc(_5757);
    float _5791 = precise::max(_5789, 0.0);
    uint _5793 = uint(_5791);
    int _5795 = int(_5777) << 5;
    int _5797 = _5771 | _5779;
    int _5799 = int(_5785) | _5797;
    int _5801 = _5787 | _5795;
    int _5803 = int(_5793) | _5801;
    bool _5805 = _5799 != _5803;
    int _5807 = _5779;
    int _5809 = _5795;
    int _5811 = int(_5769);
    if (!_5805)
    {
        _5807 = _5799;
    }
    int _5813 = _5807;
    if (!_5805)
    {
        _5809 = 0;
        _5811 = 0;
    }
    int _5815 = _5809;
    int _5817 = _5811;
    if (!_5805)
    {
        out.m_36.x = as_type<float>(_5813);
        out.m_36.y = as_type<float>(_5799);
        out.m_36.z = as_type<float>(_5815);
        out.m_36.w = as_type<float>(_5817);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _5819 = _5718 * 0.0322580635547637939453125;
    float _5821 = _5708 * 0.0322580635547637939453125;
    float _5823 = _5732 * 0.01587301678955554962158203125;
    bool _5825 = uint(_5799) >= uint(_5803);
    float _5827 = _5734 * 0.01587301678955554962158203125;
    float _5829 = _5740 * 0.0322580635547637939453125;
    float _5831 = _5744 * 0.0322580635547637939453125;
    bool _5833 = !_5825;
    float _5835 = _5833 ? _5819 : _5821;
    bool _5837 = !_5825;
    float _5839 = _5837 ? _5821 : _5819;
    bool _5841 = !_5825;
    float _5843 = _5841 ? _5823 : _5827;
    float _5845 = -_5835;
    float _5847 = _545 + _5845;
    bool _5849 = !_5825;
    float _5851 = _5849 ? _5827 : _5823;
    float _5853 = -_5835;
    float _5855 = _5853 + _5839;
    bool _5857 = !_5825;
    float _5859 = _5857 ? _5829 : _5831;
    float _5861 = -_5843;
    float _5863 = _547 + _5861;
    bool _5865 = !_5825;
    float _5867 = _5865 ? _5831 : _5829;
    float _5869 = -_5843;
    float _5871 = _5869 + _5851;
    float _5873 = -_5843;
    float _5875 = _623 + _5873;
    float _5877 = -_5859;
    float _5879 = _549 + _5877;
    float _5881 = -_5835;
    float _5883 = _621 + _5881;
    float _5885 = _5871 * _5871;
    float _5887 = -_5859;
    float _5889 = _5887 + _5867;
    float _5891 = -_5843;
    float _5893 = _491 + _5891;
    float _5895 = -_5843;
    float _5897 = _483 + _5895;
    float _5899 = fma(_5855, _5855, _5885);
    float _5901 = -_5843;
    float _5903 = _437 + _5901;
    float _5905 = -_5843;
    float _5907 = _429 + _5905;
    float _5909 = -_5843;
    float _5911 = _395 + _5909;
    float _5913 = fma(_5889, _5889, _5899);
    float _5915 = -_5843;
    float _5917 = _343 + _5915;
    float _5919 = -_5843;
    float _5921 = _335 + _5919;
    float _5923 = -_5843;
    float _5925 = _615 + _5923;
    float _5927 = -_5843;
    float _5929 = _607 + _5927;
    float _5931 = -_5843;
    float _5933 = _599 + _5931;
    float _5935 = 1.0 / _5913;
    float _5937 = -_5843;
    float _5939 = _591 + _5937;
    float _5941 = -_5843;
    float _5943 = _571 + _5941;
    float _5945 = -_5843;
    float _5947 = _563 + _5945;
    float _5949 = -_5843;
    float _5951 = _555 + _5949;
    float _5953 = -_5859;
    float _5955 = _625 + _5953;
    float _5957 = -_5835;
    float _5959 = _489 + _5957;
    float _5961 = -_5835;
    float _5963 = _481 + _5961;
    float _5965 = -_5835;
    float _5967 = _435 + _5965;
    float _5969 = -_5835;
    float _5971 = _427 + _5969;
    float _5973 = -_5835;
    float _5975 = _393 + _5973;
    float _5977 = -_5835;
    float _5979 = _341 + _5977;
    float _5981 = -_5835;
    float _5983 = _333 + _5981;
    float _5985 = -_5835;
    float _5987 = _613 + _5985;
    float _5989 = -_5835;
    float _5991 = _605 + _5989;
    float _5993 = -_5835;
    float _5995 = _597 + _5993;
    float _5997 = _5871 * _5935;
    float _5999 = _5855 * _5935;
    float _6001 = _5889 * _5935;
    float _6003 = -_5835;
    float _6005 = _589 + _6003;
    float _6007 = _5997 * _5863;
    float _6009 = _5997 * _5875;
    float _6011 = _5997 * _5893;
    float _6013 = -_5835;
    float _6015 = _569 + _6013;
    float _6017 = fma(_5999, _5847, _6007);
    float _6019 = fma(_5999, _5883, _6009);
    float _6021 = -_5835;
    float _6023 = _561 + _6021;
    float _6025 = -_5835;
    float _6027 = _553 + _6025;
    float _6029 = fma(_6001, _5879, _6017);
    float _6031 = _5997 * _5897;
    float _6033 = _5997 * _5903;
    float _6035 = _5997 * _5907;
    float _6037 = _5997 * _5911;
    float _6039 = _5997 * _5917;
    float _6041 = _5997 * _5921;
    float _6043 = _5997 * _5925;
    float _6045 = _5997 * _5929;
    float _6047 = _5997 * _5933;
    float _6049 = _5997 * _5939;
    float _6051 = _5997 * _5943;
    float _6053 = _5997 * _5947;
    float _6055 = _5997 * _5951;
    float _6057 = fma(_6001, _5955, _6019);
    bool _6059 = _6029 >= 0.5;
    float _6061 = -_5859;
    float _6063 = _493 + _6061;
    float _6065 = fma(_5999, _5959, _6011);
    float _6067 = -_5859;
    float _6069 = _485 + _6067;
    float _6071 = -_5859;
    float _6073 = _439 + _6071;
    float _6075 = -_5859;
    float _6077 = _431 + _6075;
    float _6079 = -_5859;
    float _6081 = _397 + _6079;
    float _6083 = -_5859;
    float _6085 = _345 + _6083;
    float _6087 = -_5859;
    float _6089 = _337 + _6087;
    float _6091 = -_5859;
    float _6093 = _617 + _6091;
    float _6095 = -_5859;
    float _6097 = _609 + _6095;
    float _6099 = -_5859;
    float _6101 = _601 + _6099;
    float _6103 = -_5859;
    float _6105 = _593 + _6103;
    float _6107 = -_5859;
    float _6109 = _573 + _6107;
    float _6111 = -_5859;
    float _6113 = _565 + _6111;
    float _6115 = -_5859;
    float _6117 = _557 + _6115;
    float _6119 = fma(_5999, _5963, _6031);
    float _6121 = fma(_5999, _5967, _6033);
    float _6123 = fma(_5999, _5971, _6035);
    float _6125 = fma(_5999, _5975, _6037);
    float _6127 = fma(_5999, _5979, _6039);
    float _6129 = fma(_5999, _5983, _6041);
    float _6131 = fma(_5999, _5987, _6043);
    float _6133 = fma(_5999, _5991, _6045);
    float _6135 = fma(_5999, _5995, _6047);
    float _6137 = fma(_5999, _6005, _6049);
    float _6139 = fma(_5999, _6015, _6051);
    float _6141 = fma(_5999, _6023, _6053);
    float _6143 = fma(_5999, _6027, _6055);
    float _6145 = fma(_6001, _6063, _6065);
    bool _6147 = _6057 >= 0.5;
    float _6149 = fma(_6001, _6069, _6119);
    bool _6151 = _6029 >= 0.833000004291534423828125;
    float _6153 = fma(_6001, _6073, _6121);
    float _6155 = fma(_6001, _6077, _6123);
    float _6157 = fma(_6001, _6081, _6125);
    float _6159 = fma(_6001, _6085, _6127);
    float _6161 = fma(_6001, _6089, _6129);
    float _6163 = fma(_6001, _6093, _6131);
    float _6165 = fma(_6001, _6097, _6133);
    float _6167 = fma(_6001, _6101, _6135);
    float _6169 = fma(_6001, _6105, _6137);
    float _6171 = fma(_6001, _6109, _6139);
    float _6173 = fma(_6001, _6113, _6141);
    float _6175 = fma(_6001, _6117, _6143);
    bool _6177 = _6029 >= 0.16599999368190765380859375;
    int _6179 = _6151 ? 0 : 32768;
    bool _6181 = _6057 >= 0.833000004291534423828125;
    bool _6183 = _6145 >= 0.5;
    int _6185 = _6179;
    if (!_6059)
    {
        int _6187 = _6177 ? 49152 : 16384;
        _6185 = _6187;
    }
    int _6189 = _6185;
    bool _6191 = _6057 >= 0.16599999368190765380859375;
    int _6193 = _6181 ? 0 : 32768;
    bool _6195 = _6163 >= 0.5;
    bool _6197 = _6145 >= 0.833000004291534423828125;
    int _6199 = _6193;
    if (!_6147)
    {
        int _6201 = _6191 ? 49152 : 16384;
        _6199 = _6201;
    }
    int _6203 = _6199;
    bool _6205 = _6145 >= 0.16599999368190765380859375;
    bool _6207 = _6163 >= 0.833000004291534423828125;
    int _6209 = _6197 ? 0 : 8192;
    bool _6211 = _6149 >= 0.5;
    bool _6213 = _6163 >= 0.16599999368190765380859375;
    int _6215 = _6207 ? 0 : 8192;
    int _6217 = _6209;
    int _6219 = _6215;
    if (!_6183)
    {
        int _6221 = _6205 ? 12288 : 4096;
        _6217 = _6221;
    }
    int _6223 = _6217;
    bool _6225 = _6149 >= 0.833000004291534423828125;
    bool _6227 = _6165 >= 0.5;
    if (!_6195)
    {
        int _6229 = _6213 ? 12288 : 4096;
        _6219 = _6229;
    }
    int _6231 = _6219;
    int _6233 = _6225 ? 0 : 2048;
    bool _6235 = _6149 >= 0.16599999368190765380859375;
    bool _6237 = _6165 >= 0.833000004291534423828125;
    bool _6239 = _6153 >= 0.5;
    bool _6241 = _6165 >= 0.16599999368190765380859375;
    int _6243 = _6237 ? 0 : 2048;
    int _6245 = _6233;
    int _6247 = _6243;
    if (!_6211)
    {
        int _6249 = _6235 ? 3072 : 1024;
        _6245 = _6249;
    }
    int _6251 = _6245;
    bool _6253 = _6153 >= 0.833000004291534423828125;
    bool _6255 = _6167 >= 0.5;
    if (!_6227)
    {
        int _6257 = _6241 ? 3072 : 1024;
        _6247 = _6257;
    }
    int _6259 = _6247;
    bool _6261 = _6153 >= 0.16599999368190765380859375;
    int _6263 = _6253 ? 0 : 512;
    bool _6265 = _6155 >= 0.5;
    bool _6267 = _6167 >= 0.833000004291534423828125;
    int _6269 = _6263;
    if (!_6239)
    {
        int _6271 = _6261 ? 768 : 256;
        _6269 = _6271;
    }
    int _6273 = _6269;
    bool _6275 = _6167 >= 0.16599999368190765380859375;
    bool _6277 = _6169 >= 0.5;
    int _6279 = _6267 ? 0 : 512;
    bool _6281 = _6155 >= 0.833000004291534423828125;
    int _6283 = _6279;
    if (!_6255)
    {
        int _6285 = _6275 ? 768 : 256;
        _6283 = _6285;
    }
    int _6287 = _6283;
    bool _6289 = _6155 >= 0.16599999368190765380859375;
    bool _6291 = _6169 >= 0.833000004291534423828125;
    int _6293 = _6281 ? 0 : 128;
    bool _6295 = _6169 >= 0.16599999368190765380859375;
    bool _6297 = _6157 >= 0.5;
    int _6299 = _6291 ? 0 : 128;
    int _6301 = _6293;
    int _6303 = _6299;
    if (!_6265)
    {
        int _6305 = _6289 ? 192 : 64;
        _6301 = _6305;
    }
    int _6307 = _6301;
    bool _6309 = _6157 >= 0.833000004291534423828125;
    bool _6311 = _6171 >= 0.5;
    if (!_6277)
    {
        int _6313 = _6295 ? 192 : 64;
        _6303 = _6313;
    }
    int _6315 = _6303;
    int _6317 = _6309 ? 0 : 32;
    bool _6319 = _6159 >= 0.5;
    bool _6321 = _6157 >= 0.16599999368190765380859375;
    bool _6323 = _6171 >= 0.833000004291534423828125;
    bool _6325 = _6171 >= 0.16599999368190765380859375;
    int _6327 = _6323 ? 0 : 32;
    int _6329 = _6317;
    int _6331 = _6327;
    if (!_6297)
    {
        int _6333 = _6321 ? 48 : 16;
        _6329 = _6333;
    }
    int _6335 = _6329;
    bool _6337 = _6159 >= 0.833000004291534423828125;
    bool _6339 = _6173 >= 0.5;
    if (!_6311)
    {
        int _6341 = _6325 ? 48 : 16;
        _6331 = _6341;
    }
    int _6343 = _6331;
    bool _6345 = _6159 >= 0.16599999368190765380859375;
    bool _6347 = _6173 >= 0.833000004291534423828125;
    int _6349 = _6337 ? 0 : 8;
    int _6351 = _6347 ? 0 : 8;
    int _6353 = _6349;
    int _6355 = _6351;
    if (!_6319)
    {
        int _6357 = _6345 ? 12 : 4;
        _6353 = _6357;
    }
    int _6359 = _6353;
    bool _6361 = _6161 >= 0.5;
    bool _6363 = _6175 >= 0.5;
    bool _6365 = _6173 >= 0.16599999368190765380859375;
    int _6367 = _6251 + _6189;
    int _6369 = _6367 + _6223;
    int _6371 = _6259 + _6203;
    int _6373 = _6371 + _6231;
    if (!_6339)
    {
        int _6375 = _6365 ? 12 : 4;
        _6355 = _6375;
    }
    int _6377 = _6355;
    bool _6379 = _6161 >= 0.833000004291534423828125;
    bool _6381 = _6175 >= 0.833000004291534423828125;
    bool _6383 = _6161 >= 0.16599999368190765380859375;
    bool _6385 = _6175 >= 0.16599999368190765380859375;
    int _6387 = _6307 + _6369;
    int _6389 = _6387 + _6273;
    int _6391 = _6315 + _6373;
    int _6393 = _6391 + _6287;
    int _6395 = _6379 ? 0 : 2;
    int _6397 = _6381 ? 0 : 2;
    int _6399 = _6395;
    int _6401 = _6397;
    if (!_6361)
    {
        int _6403 = _6383 ? 3 : 1;
        _6399 = _6403;
    }
    int _6405 = _6399;
    if (!_6363)
    {
        int _6407 = _6385 ? 3 : 1;
        _6401 = _6407;
    }
    int _6409 = _6401;
    int _6411 = _6359 + _6389;
    int _6413 = _6411 + _6335;
    int _6415 = _6377 + _6393;
    int _6417 = _6415 + _6343;
    bool _6419 = !_5825;
    int _6421 = _6419 ? _5803 : _5799;
    bool _6423 = !_5825;
    int _6425 = _6423 ? _5799 : _5803;
    int _6427 = _6413 + _6405;
    int _6429 = _6417 + _6409;
    out.m_36.x = as_type<float>(_6421);
    out.m_36.y = as_type<float>(_6425);
    out.m_36.z = as_type<float>(_6427);
    out.m_36.w = as_type<float>(_6429);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

