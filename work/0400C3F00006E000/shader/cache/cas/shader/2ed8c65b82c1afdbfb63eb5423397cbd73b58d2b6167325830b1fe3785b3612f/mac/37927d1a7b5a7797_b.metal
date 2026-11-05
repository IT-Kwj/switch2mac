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
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
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
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_29.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_31.z;
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
    float _113 = _99 * _85;
    float _115 = _99 * _91;
    float _117 = _101 + _105;
    float _119 = _103 + _107;
    float _121 = _99 * _97;
    float _123 = _101 + _109;
    float _125 = _103 + _111;
    float _127 = fma(_109, 2.0, _101);
    float _129 = fma(_109, 3.0, _101);
    float _131 = _113 + _115;
    float _133 = _113 + _121;
    float _135 = abs(_117);
    float _137 = abs(_119);
    float _139 = precise::max(_135, _137);
    float _141 = _123 + _105;
    float _143 = _125 + _107;
    float _145 = _133 + _115;
    float _147 = abs(_131);
    float _149 = precise::max(_147, _139);
    float _151 = fma(_111, 3.0, _103);
    float _153 = fma(_111, 2.0, _103);
    float _155 = abs(_141);
    float _157 = abs(_143);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 2.0, _113);
    float _163 = fma(_121, 3.0, _113);
    float _165 = _129 + _105;
    float _167 = abs(_145);
    float _169 = precise::max(_167, _159);
    float _171 = _151 + _107;
    float _173 = _127 + _105;
    float _175 = _153 + _107;
    float _177 = _163 + _115;
    float _179 = _161 + _115;
    float _181 = abs(_165);
    float _183 = abs(_171);
    float _185 = precise::max(_181, _183);
    float _187 = 1.0 / _149;
    float _189 = abs(_173);
    float _191 = abs(_175);
    float _193 = precise::max(_189, _191);
    float _195 = abs(_177);
    float _197 = precise::max(_195, _185);
    float _199 = abs(_179);
    float _201 = precise::max(_199, _193);
    float _203 = 1.0 / _169;
    float _205 = 1.0 / _197;
    float _207 = _117 * _187;
    float _209 = _119 * _187;
    float _211 = _131 * _187;
    float _213 = 1.0 / _201;
    float _215 = _141 * _203;
    float _217 = _143 * _203;
    float _219 = _145 * _203;
    float _221 = _177 * _205;
    float _223 = _165 * _205;
    float _225 = _171 * _205;
    float _227 = _173 * _213;
    float _229 = _175 * _213;
    float _231 = _179 * _213;
    float3 _2409 = float3(_207, _209, _211);
    float2 _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2409, float3(0.0), isnan(_2409)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2409, float3(0.0), isnan(_2409)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _237 = _235.x;
    float _239 = _235.y;
    float3 _2428 = float3(_215, _217, _219);
    float2 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2428, float3(0.0), isnan(_2428)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2428, float3(0.0), isnan(_2428)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _243 = _241.x;
    float _245 = _241.y;
    float3 _2443 = float3(_227, _229, _231);
    float2 _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2443, float3(0.0), isnan(_2443)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2443, float3(0.0), isnan(_2443)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _249 = _247.x;
    float _251 = _247.y;
    float3 _2458 = float3(_223, _225, _221);
    float2 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2458, float3(0.0), isnan(_2458)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2458, float3(0.0), isnan(_2458)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _255 = _253.x;
    float _257 = _253.y;
    float _259 = fma(_105, 2.0, _101);
    float _261 = fma(_107, 2.0, _103);
    float _263 = fma(_115, 2.0, _113);
    float _265 = abs(_101);
    float _267 = abs(_103);
    float _269 = precise::max(_265, _267);
    float _271 = fma(_105, 2.0, _123);
    float _273 = fma(_107, 2.0, _125);
    float _275 = abs(_259);
    float _277 = abs(_261);
    float _279 = precise::max(_275, _277);
    float _281 = abs(_113);
    float _283 = precise::max(_281, _269);
    float _285 = abs(_263);
    float _287 = precise::max(_285, _279);
    float _289 = abs(_123);
    float _291 = abs(_125);
    float _293 = precise::max(_289, _291);
    float _295 = fma(_115, 2.0, _133);
    float _297 = abs(_271);
    float _299 = abs(_273);
    float _301 = precise::max(_297, _299);
    float _303 = 1.0 / _283;
    float _305 = abs(_133);
    float _307 = precise::max(_305, _293);
    float _309 = abs(_127);
    float _311 = abs(_153);
    float _313 = precise::max(_309, _311);
    float _315 = abs(_129);
    float _317 = abs(_151);
    float _319 = precise::max(_315, _317);
    float _321 = abs(_295);
    float _323 = precise::max(_321, _301);
    float _325 = 1.0 / _287;
    float _327 = abs(_161);
    float _329 = precise::max(_327, _313);
    float _331 = 1.0 / _323;
    float _333 = _101 * _303;
    float _335 = _113 * _303;
    float _337 = _263 * _325;
    float _339 = abs(_163);
    float _341 = precise::max(_339, _319);
    float _343 = 1.0 / _307;
    float _345 = _259 * _325;
    float _347 = _261 * _325;
    float _349 = _103 * _303;
    float _351 = _271 * _331;
    float _353 = _273 * _331;
    float _355 = 1.0 / _329;
    float _357 = _295 * _331;
    float _359 = 1.0 / _341;
    float _361 = _123 * _343;
    float _363 = _125 * _343;
    float _365 = _133 * _343;
    float _367 = _127 * _355;
    float _369 = _153 * _355;
    float _371 = _161 * _355;
    float3 _2620 = float3(_333, _349, _335);
    float2 _373 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2620, float3(0.0), isnan(_2620)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2620, float3(0.0), isnan(_2620)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _375 = _373.x;
    float _377 = _373.y;
    float3 _2635 = float3(_361, _363, _365);
    float2 _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2635, float3(0.0), isnan(_2635)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2635, float3(0.0), isnan(_2635)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _381 = _379.x;
    float _383 = _379.y;
    float _385 = _129 * _359;
    float _387 = _151 * _359;
    float _389 = _163 * _359;
    float3 _2659 = float3(_367, _369, _371);
    float2 _391 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2659, float3(0.0), isnan(_2659)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2659, float3(0.0), isnan(_2659)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _393 = _391.x;
    float _395 = _391.y;
    float3 _2674 = float3(_385, _387, _389);
    float2 _397 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2674, float3(0.0), isnan(_2674)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2674, float3(0.0), isnan(_2674)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _399 = _397.x;
    float _401 = _397.y;
    float3 _2689 = float3(_345, _347, _337);
    float2 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2689, float3(0.0), isnan(_2689)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _405 = _403.x;
    float _407 = _403.y;
    float3 _2704 = float3(_351, _353, _357);
    float2 _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2704, float3(0.0), isnan(_2704)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2704, float3(0.0), isnan(_2704)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _411 = _409.x;
    float _413 = _409.y;
    float _415 = fma(_105, 2.0, _129);
    float _417 = fma(_107, 2.0, _151);
    float _419 = fma(_105, 3.0, _101);
    float _421 = fma(_107, 3.0, _103);
    float _423 = fma(_105, 3.0, _123);
    float _425 = fma(_107, 3.0, _125);
    float _427 = fma(_105, 2.0, _127);
    float _429 = fma(_107, 2.0, _153);
    float _431 = fma(_105, 3.0, _127);
    float _433 = fma(_107, 3.0, _153);
    float _435 = fma(_105, 3.0, _129);
    float _437 = fma(_107, 3.0, _151);
    float _439 = fma(_115, 3.0, _133);
    float _441 = fma(_115, 2.0, _163);
    float _443 = abs(_415);
    float _445 = abs(_417);
    float _447 = precise::max(_443, _445);
    float _449 = fma(_115, 3.0, _113);
    float _451 = abs(_419);
    float _453 = abs(_421);
    float _455 = precise::max(_451, _453);
    float _457 = fma(_115, 2.0, _161);
    float _459 = abs(_441);
    float _461 = precise::max(_459, _447);
    float _463 = fma(_115, 3.0, _161);
    float _465 = abs(_449);
    float _467 = precise::max(_465, _455);
    float _469 = fma(_115, 3.0, _163);
    float _471 = abs(_423);
    float _473 = abs(_425);
    float _475 = precise::max(_471, _473);
    float _477 = 1.0 / _461;
    float _479 = abs(_427);
    float _481 = abs(_429);
    float _483 = precise::max(_479, _481);
    float _485 = abs(_439);
    float _487 = precise::max(_485, _475);
    float _489 = abs(_457);
    float _491 = precise::max(_489, _483);
    float _493 = 1.0 / _467;
    float _495 = _415 * _477;
    float _497 = _417 * _477;
    float _499 = _441 * _477;
    float _501 = abs(_431);
    float _503 = abs(_433);
    float _505 = precise::max(_501, _503);
    float _507 = 1.0 / _487;
    float _509 = abs(_463);
    float _511 = precise::max(_509, _505);
    float _513 = _419 * _493;
    float _515 = _421 * _493;
    float _517 = _449 * _493;
    float _519 = abs(_435);
    float _521 = abs(_437);
    float _523 = precise::max(_519, _521);
    float _525 = 1.0 / _491;
    float _527 = abs(_469);
    float _529 = precise::max(_527, _523);
    float _531 = 1.0 / _511;
    float _533 = _423 * _507;
    float _535 = _425 * _507;
    float _537 = _439 * _507;
    float _539 = 1.0 / _529;
    float _541 = _427 * _525;
    float _543 = _429 * _525;
    float _545 = _457 * _525;
    float _547 = _431 * _531;
    float _549 = _433 * _531;
    float _551 = _463 * _531;
    float _553 = _435 * _539;
    float _555 = _437 * _539;
    float3 _2908 = float3(_541, _543, _545);
    float2 _557 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2908, float3(0.0), isnan(_2908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2908, float3(0.0), isnan(_2908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _559 = _557.x;
    float _561 = _557.y;
    float3 _2923 = float3(_495, _497, _499);
    float2 _563 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2923, float3(0.0), isnan(_2923)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2923, float3(0.0), isnan(_2923)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _565 = _563.x;
    float _567 = _563.y;
    float3 _2938 = float3(_513, _515, _517);
    float2 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2938, float3(0.0), isnan(_2938)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2938, float3(0.0), isnan(_2938)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _571 = _569.x;
    float _573 = _569.y;
    float3 _2953 = float3(_533, _535, _537);
    float2 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2953, float3(0.0), isnan(_2953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2953, float3(0.0), isnan(_2953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _577 = _575.x;
    float _579 = _575.y;
    float3 _2968 = float3(_547, _549, _551);
    float2 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2968, float3(0.0), isnan(_2968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2968, float3(0.0), isnan(_2968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _469 * _539;
    float3 _2986 = float3(_553, _555, _587);
    float2 _589 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2986, float3(0.0), isnan(_2986)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2986, float3(0.0), isnan(_2986)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _591 = _589.x;
    float _593 = _589.y;
    float _595 = precise::max(_239, _245);
    float _597 = precise::min(_239, _245);
    float _599 = precise::max(_251, _257);
    float _601 = precise::min(_251, _257);
    float _603 = precise::min(_237, _243);
    float _605 = precise::min(_249, _255);
    float _607 = precise::max(_595, _599);
    float _609 = precise::min(_597, _601);
    float _611 = precise::min(_603, _605);
    float _613 = precise::max(_237, _243);
    float _615 = precise::max(_249, _255);
    float _617 = precise::max(_613, _615);
    float _619 = precise::min(_375, _381);
    float _621 = precise::max(_377, _383);
    float _623 = precise::max(_375, _381);
    float _625 = precise::min(_377, _383);
    float _627 = precise::min(_393, _399);
    float _629 = precise::max(_395, _401);
    float _631 = precise::max(_393, _399);
    float _633 = precise::min(_395, _401);
    float _635 = precise::min(_619, _627);
    float _637 = precise::max(_621, _629);
    float _639 = precise::max(_623, _631);
    float _641 = precise::min(_625, _633);
    float _643 = precise::min(_635, _611);
    float _645 = precise::max(_405, _411);
    float _647 = precise::max(_637, _607);
    float _649 = precise::min(_405, _411);
    float _651 = precise::max(_639, _617);
    float _653 = precise::min(_641, _609);
    float _655 = precise::min(_407, _413);
    float _657 = precise::max(_559, _565);
    float _659 = precise::max(_571, _577);
    float _661 = precise::min(_559, _565);
    float _663 = precise::max(_645, _657);
    float _665 = precise::max(_583, _591);
    float _667 = precise::min(_649, _661);
    float _669 = precise::max(_659, _665);
    float _671 = precise::max(_407, _413);
    float _673 = precise::max(_561, _567);
    float _675 = precise::min(_571, _577);
    float _677 = precise::min(_583, _591);
    float _679 = precise::max(_663, _669);
    float _681 = precise::max(_671, _673);
    float _683 = precise::min(_675, _677);
    float _685 = precise::max(_651, _679);
    float _687 = precise::min(_561, _567);
    float _689 = precise::min(_573, _579);
    float _691 = precise::min(_585, _593);
    float _693 = precise::min(_667, _683);
    float _695 = _685 * 255.0;
    float _697 = precise::min(_655, _687);
    float _699 = precise::min(_689, _691);
    float _701 = precise::max(_573, _579);
    float _703 = trunc(_695);
    float _705 = precise::max(_703, 0.0);
    uint _708 = uint(_705);
    float _710 = precise::max(_585, _593);
    float _712 = precise::min(_643, _693);
    float _714 = precise::min(_697, _699);
    float _716 = precise::max(_701, _710);
    float _718 = _712 * 255.0;
    float _720 = precise::min(_653, _714);
    float _722 = precise::max(_681, _716);
    float _724 = trunc(_718);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _720 * 255.0;
    float _732 = precise::max(_647, _722);
    float _734 = _732 * 255.0;
    float _736 = trunc(_730);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    float _742 = trunc(_734);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    bool _750 = _708 > _728;
    int _753 = int(_728) << 8;
    int _755 = _753 & 65280;
    int _757 = int(_740) << 8;
    int _759 = 255 & int(_708);
    int _761 = _755 | _759;
    int _763 = _757 & 65280;
    bool _765 = _746 > _740;
    int _767 = 255 & int(_746);
    int _769 = _763 | _767;
    int _771 = int(_740);
    int _773 = int(_746);
    int _775 = _755;
    int _777 = _757;
    int _779 = as_type<int>(_243);
    int _781 = as_type<int>(_712);
    if (!_750)
    {
        _771 = 0;
    }
    int _783 = _771;
    int _785 = _783;
    if (!_750)
    {
        _773 = 0;
        _775 = 0;
    }
    int _787 = _773;
    int _789 = _775;
    bool _791 = !_750;
    int _793 = _787;
    int _795 = _789;
    if (!_791)
    {
        float _797 = -_712;
        float _799 = _685 + _797;
        float _801 = -_712;
        float _803 = _375 + _801;
        float _805 = -_712;
        float _807 = _381 + _805;
        float _809 = -_712;
        float _811 = _399 + _809;
        float _813 = -_712;
        float _815 = _237 + _813;
        float _817 = 1.0 / _799;
        float _819 = -_712;
        float _821 = _255 + _819;
        float _823 = -_712;
        float _825 = _249 + _823;
        float _827 = -_712;
        float _829 = _243 + _827;
        float _831 = -_712;
        float _833 = _411 + _831;
        float _835 = -_712;
        float _837 = _559 + _835;
        float _839 = -_712;
        float _841 = _565 + _839;
        float _843 = -_712;
        float _845 = _571 + _843;
        float _847 = -_712;
        float _849 = _577 + _847;
        float _851 = -_712;
        float _853 = _583 + _851;
        float _855 = _803 * _817;
        float _857 = _807 * _817;
        float _859 = -_712;
        float _861 = _393 + _859;
        float _863 = fma(_855, -1.99999904632568359375, 1.99999904632568359375);
        float _865 = _811 * _817;
        float _867 = fma(_857, -1.99999904632568359375, 1.99999904632568359375);
        float _869 = fma(_857, -7.99999904632568359375, 7.99999904632568359375);
        float _871 = _861 * _817;
        float _873 = -_857;
        float _875 = _873 + 0.5;
        float _877 = fma(_855, -7.99999904632568359375, 7.99999904632568359375);
        float _879 = -_855;
        float _881 = _879 + 0.5;
        float _883 = fma(_871, -7.99999904632568359375, 7.99999904632568359375);
        float _885 = trunc(_863);
        float _887 = precise::max(_885, 0.0);
        uint _889 = uint(_887);
        float _891 = abs(_875);
        bool _893 = _891 >= 0.375;
        float _895 = -_871;
        float _897 = _895 + 0.5;
        float _899 = fma(_865, -1.99999904632568359375, 1.99999904632568359375);
        float _901 = abs(_881);
        bool _903 = _901 >= 0.375;
        float _905 = fma(_871, -1.99999904632568359375, 1.99999904632568359375);
        float _907 = -_712;
        float _909 = _405 + _907;
        float _911 = abs(_897);
        bool _913 = _911 >= 0.375;
        float _915 = trunc(_877);
        float _917 = precise::max(_915, 0.0);
        uint _919 = uint(_917);
        float _921 = -_865;
        float _923 = _921 + 0.5;
        float _925 = -_712;
        float _927 = _591 + _925;
        float _929 = _829 * _817;
        float _931 = _825 * _817;
        float _933 = _821 * _817;
        float _935 = abs(_923);
        bool _937 = _935 >= 0.375;
        float _939 = _909 * _817;
        float _941 = trunc(_883);
        float _943 = precise::max(_941, 0.0);
        uint _945 = uint(_943);
        float _947 = _833 * _817;
        float _949 = _837 * _817;
        float _951 = _841 * _817;
        float _953 = _845 * _817;
        float _955 = _849 * _817;
        float _957 = _853 * _817;
        float _959 = fma(_929, -1.99999904632568359375, 1.99999904632568359375);
        float _961 = trunc(_867);
        float _963 = precise::max(_961, 0.0);
        uint _965 = uint(_963);
        float _967 = _815 * _817;
        float _969 = fma(_865, -7.99999904632568359375, 7.99999904632568359375);
        float _971 = _927 * _817;
        float _973 = fma(_929, -7.99999904632568359375, 7.99999904632568359375);
        float _975 = -_967;
        float _977 = _975 + 0.5;
        float _979 = fma(_967, -7.99999904632568359375, 7.99999904632568359375);
        float _981 = fma(_967, -1.99999904632568359375, 1.99999904632568359375);
        float _983 = trunc(_869);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        int _989 = int(_889);
        int _991 = int(_965);
        if (!_903)
        {
            int _993 = int(_919) + 1;
            _989 = _993;
        }
        int _995 = _989;
        float _997 = -_931;
        float _999 = _997 + 0.5;
        float _1001 = abs(_977);
        bool _1003 = _1001 >= 0.375;
        float _1005 = -_929;
        float _1007 = _1005 + 0.5;
        float _1009 = fma(_931, -1.99999904632568359375, 1.99999904632568359375);
        float _1011 = fma(_931, -7.99999904632568359375, 7.99999904632568359375);
        float _1013 = abs(_999);
        bool _1015 = _1013 >= 0.375;
        float _1017 = trunc(_899);
        float _1019 = precise::max(_1017, 0.0);
        uint _1021 = uint(_1019);
        float _1023 = abs(_1007);
        bool _1025 = _1023 >= 0.375;
        float _1027 = fma(_933, -1.99999904632568359375, 1.99999904632568359375);
        float _1029 = fma(_933, -7.99999904632568359375, 7.99999904632568359375);
        float _1031 = fma(_939, -1.99999904632568359375, 1.99999904632568359375);
        float _1033 = fma(_939, -7.99999904632568359375, 7.99999904632568359375);
        float _1035 = -_939;
        float _1037 = _1035 + 0.5;
        float _1039 = trunc(_969);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        int _1045 = int(_1021);
        if (!_893)
        {
            int _1047 = int(_987) + 1;
            _991 = _1047;
        }
        int _1049 = _991;
        float _1051 = -_933;
        float _1053 = _1051 + 0.5;
        float _1055 = fma(_947, -1.99999904632568359375, 1.99999904632568359375);
        float _1057 = abs(_1053);
        bool _1059 = _1057 >= 0.375;
        float _1061 = trunc(_905);
        float _1063 = precise::max(_1061, 0.0);
        uint _1065 = uint(_1063);
        float _1067 = fma(_947, -7.99999904632568359375, 7.99999904632568359375);
        float _1069 = trunc(_981);
        float _1071 = precise::max(_1069, 0.0);
        uint _1073 = uint(_1071);
        int _1075 = int(_1073);
        if (!_937)
        {
            int _1077 = int(_1043) + 1;
            _1045 = _1077;
        }
        int _1079 = _1045;
        float _1081 = -_947;
        float _1083 = _1081 + 0.5;
        float _1085 = fma(_951, -1.99999904632568359375, 1.99999904632568359375);
        int _1087 = _1079 << 9;
        float _1089 = abs(_1083);
        bool _1091 = _1089 >= 0.375;
        float _1093 = trunc(_979);
        float _1095 = precise::max(_1093, 0.0);
        uint _1097 = uint(_1095);
        int _1099 = int(_1065);
        if (!_913)
        {
            int _1101 = int(_945) + 1;
            _1099 = _1101;
        }
        int _1103 = _1099;
        float _1105 = fma(_949, -1.99999904632568359375, 1.99999904632568359375);
        float _1107 = abs(_1037);
        bool _1109 = _1107 >= 0.375;
        float _1111 = fma(_949, -7.99999904632568359375, 7.99999904632568359375);
        float _1113 = -_949;
        float _1115 = _1113 + 0.5;
        float _1117 = fma(_951, -7.99999904632568359375, 7.99999904632568359375);
        float _1119 = -_951;
        float _1121 = _1119 + 0.5;
        float _1123 = trunc(_959);
        float _1125 = precise::max(_1123, 0.0);
        uint _1127 = uint(_1125);
        float _1129 = fma(_971, -7.99999904632568359375, 7.99999904632568359375);
        float _1131 = trunc(_973);
        float _1133 = precise::max(_1131, 0.0);
        uint _1135 = uint(_1133);
        int _1137 = int(_1127);
        if (!_1003)
        {
            int _1139 = int(_1097) + 1;
            _1075 = _1139;
        }
        int _1141 = _1075;
        float _1143 = fma(_953, -1.99999904632568359375, 1.99999904632568359375);
        float _1145 = abs(_1115);
        bool _1147 = _1145 >= 0.375;
        float _1149 = fma(_953, -7.99999904632568359375, 7.99999904632568359375);
        float _1151 = -_953;
        float _1153 = _1151 + 0.5;
        float _1155 = trunc(_1009);
        float _1157 = precise::max(_1155, 0.0);
        uint _1159 = uint(_1157);
        float _1161 = trunc(_1011);
        float _1163 = precise::max(_1161, 0.0);
        uint _1165 = uint(_1163);
        int _1167 = int(_1159);
        if (!_1025)
        {
            int _1169 = int(_1135) + 1;
            _1137 = _1169;
        }
        int _1171 = _1137;
        float _1173 = fma(_955, -1.99999904632568359375, 1.99999904632568359375);
        float _1175 = abs(_1121);
        bool _1177 = _1175 >= 0.375;
        float _1179 = fma(_955, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = -_955;
        float _1183 = _1181 + 0.5;
        int _1185 = _1171 << 15;
        float _1187 = trunc(_1027);
        float _1189 = precise::max(_1187, 0.0);
        uint _1191 = uint(_1189);
        float _1193 = trunc(_1029);
        float _1195 = precise::max(_1193, 0.0);
        uint _1197 = uint(_1195);
        int _1199 = int(_1191);
        if (!_1015)
        {
            int _1201 = int(_1165) + 1;
            _1167 = _1201;
        }
        int _1203 = _1167;
        float _1205 = fma(_957, -1.99999904632568359375, 1.99999904632568359375);
        float _1207 = abs(_1153);
        bool _1209 = _1207 >= 0.375;
        float _1211 = fma(_957, -7.99999904632568359375, 7.99999904632568359375);
        float _1213 = -_957;
        float _1215 = _1213 + 0.5;
        float _1217 = trunc(_1055);
        float _1219 = precise::max(_1217, 0.0);
        uint _1221 = uint(_1219);
        float _1223 = trunc(_1067);
        float _1225 = precise::max(_1223, 0.0);
        uint _1227 = uint(_1225);
        int _1229 = int(_1221);
        if (!_1059)
        {
            int _1231 = int(_1197) + 1;
            _1199 = _1231;
        }
        int _1233 = _1199;
        float _1235 = fma(_971, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = abs(_1183);
        bool _1239 = _1237 >= 0.375;
        float _1241 = -_971;
        float _1243 = _1241 + 0.5;
        int _1245 = _1233 << 21;
        float _1247 = trunc(_1031);
        float _1249 = precise::max(_1247, 0.0);
        uint _1251 = uint(_1249);
        float _1253 = trunc(_1033);
        float _1255 = precise::max(_1253, 0.0);
        uint _1257 = uint(_1255);
        int _1259 = int(_1251);
        if (!_1091)
        {
            int _1261 = int(_1227) + 1;
            _1229 = _1261;
        }
        int _1263 = _1229;
        float _1265 = abs(_1243);
        bool _1267 = _1265 >= 0.375;
        int _1269 = _1263 << 3;
        int _1271 = _1049 << 3;
        float _1273 = trunc(_1105);
        float _1275 = precise::max(_1273, 0.0);
        uint _1277 = uint(_1275);
        int _1279 = _995 | _1271;
        float _1281 = trunc(_1111);
        float _1283 = precise::max(_1281, 0.0);
        uint _1285 = uint(_1283);
        int _1287 = int(_1277);
        if (!_1109)
        {
            int _1289 = int(_1257) + 1;
            _1259 = _1289;
        }
        int _1291 = _1259;
        float _1293 = abs(_1215);
        bool _1295 = _1293 >= 0.375;
        int _1297 = _1291 | _1269;
        int _1299 = _1103 << 6;
        float _1301 = trunc(_1085);
        float _1303 = precise::max(_1301, 0.0);
        uint _1305 = uint(_1303);
        int _1307 = _1279 | _1299;
        int _1309 = _1087 | _1307;
        int _1311 = _1141 << 12;
        float _1313 = trunc(_1117);
        float _1315 = precise::max(_1313, 0.0);
        uint _1317 = uint(_1315);
        int _1319 = int(_1305);
        _777 = _1297;
        if (!_1147)
        {
            int _1321 = int(_1285) + 1;
            _1287 = _1321;
        }
        int _1323 = _1287;
        int _1325 = _1309 | _1311;
        int _1327 = _1185 | _1325;
        int _1329 = _1323 << 6;
        int _1331 = _1203 << 18;
        float _1333 = trunc(_1143);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        int _1339 = _1327 | _1331;
        int _1341 = _1245 | _1339;
        uint _1343 = uint(int(uint(_1341) >> uint(16)));
        float _1345 = trunc(_1149);
        float _1347 = precise::max(_1345, 0.0);
        uint _1349 = uint(_1347);
        int _1351 = int(_1337);
        _779 = _1341;
        if (!_1177)
        {
            int _1353 = int(_1317) + 1;
            _1319 = _1353;
        }
        int _1355 = _1319;
        int _1357 = _1341 << 16;
        int _1359 = _1355 << 9;
        float _1361 = trunc(_1173);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        int _1367 = _1297 | _1329;
        int _1369 = _1359 | _1367;
        float _1371 = trunc(_1179);
        float _1373 = precise::max(_1371, 0.0);
        uint _1375 = uint(_1373);
        int _1377 = int(_1365);
        _785 = _1357;
        if (!_1209)
        {
            int _1379 = int(_1349) + 1;
            _1351 = _1379;
        }
        int _1381 = _1351;
        int _1383 = _1381 << 12;
        float _1385 = trunc(_1205);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        float _1391 = trunc(_1211);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        int _1397 = int(_1389);
        if (!_1239)
        {
            int _1399 = int(_1375) + 1;
            _1377 = _1399;
        }
        int _1401 = _1377;
        int _1403 = _1401 << 15;
        float _1405 = trunc(_1235);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        int _1411 = _1369 | _1383;
        int _1413 = _1403 | _1411;
        float _1415 = trunc(_1129);
        float _1417 = precise::max(_1415, 0.0);
        uint _1419 = uint(_1417);
        int _1421 = int(_1409);
        if (!_1295)
        {
            int _1423 = int(_1395) + 1;
            _1397 = _1423;
        }
        int _1425 = _1397;
        int _1427 = _1425 << 18;
        _781 = _1427;
        if (!_1267)
        {
            int _1429 = int(_1419) + 1;
            _1421 = _1429;
        }
        int _1431 = _1421;
        int _1433 = _1431 << 21;
        int _1435 = _1413 | _1427;
        int _1437 = _1433 | _1435;
        int _1439 = _1437 << 8;
        uint _1441 = uint(int(uint(_1437) >> uint(8)));
        int _1443 = 65280 & _1439;
        int _1445 = int(_1343) | _1443;
        int _1447 = int(_1441) << 16;
        _793 = _1447;
        _795 = _1445;
    }
    int _1449 = _785;
    int _1451 = _793;
    int _1453 = _795;
    int _1455 = _777;
    int _1457 = _779;
    int _1459 = _781;
    int _1461 = _1455;
    int _1463 = _1459;
    int _1465 = _1457;
    if (!_765)
    {
        _1461 = 0;
    }
    int _1467 = _1461;
    int _1469 = _1467;
    if (!_765)
    {
        _1463 = 0;
    }
    int _1471 = _1463;
    int _1473 = _1471;
    if (!_765)
    {
        _1465 = 0;
    }
    int _1475 = _1465;
    bool _1477 = !_765;
    int _1479 = _1475;
    if (!_1477)
    {
        float _1481 = -_720;
        float _1483 = _732 + _1481;
        float _1485 = -_720;
        float _1487 = _377 + _1485;
        float _1489 = -_720;
        float _1491 = _383 + _1489;
        float _1493 = -_720;
        float _1495 = _395 + _1493;
        float _1497 = -_720;
        float _1499 = _245 + _1497;
        float _1501 = 1.0 / _1483;
        float _1503 = -_720;
        float _1505 = _401 + _1503;
        float _1507 = -_720;
        float _1509 = _579 + _1507;
        float _1511 = -_720;
        float _1513 = _239 + _1511;
        float _1515 = -_720;
        float _1517 = _251 + _1515;
        float _1519 = -_720;
        float _1521 = _257 + _1519;
        float _1523 = -_720;
        float _1525 = _407 + _1523;
        float _1527 = -_720;
        float _1529 = _413 + _1527;
        float _1531 = -_720;
        float _1533 = _567 + _1531;
        float _1535 = -_720;
        float _1537 = _561 + _1535;
        float _1539 = -_720;
        float _1541 = _585 + _1539;
        float _1543 = -_720;
        float _1545 = _593 + _1543;
        float _1547 = _1487 * _1501;
        float _1549 = _1491 * _1501;
        float _1551 = _1495 * _1501;
        float _1553 = _1499 * _1501;
        float _1555 = -_1547;
        float _1557 = _1555 + 0.5;
        float _1559 = fma(_1547, -1.99999904632568359375, 1.99999904632568359375);
        float _1561 = fma(_1547, -7.99999904632568359375, 7.99999904632568359375);
        float _1563 = fma(_1549, -1.99999904632568359375, 1.99999904632568359375);
        float _1565 = fma(_1549, -7.99999904632568359375, 7.99999904632568359375);
        float _1567 = _1505 * _1501;
        float _1569 = fma(_1551, -1.99999904632568359375, 1.99999904632568359375);
        float _1571 = fma(_1551, -7.99999904632568359375, 7.99999904632568359375);
        float _1573 = _1513 * _1501;
        float _1575 = abs(_1557);
        bool _1577 = _1575 >= 0.375;
        float _1579 = fma(_1553, -1.99999904632568359375, 1.99999904632568359375);
        float _1581 = fma(_1553, -7.99999904632568359375, 7.99999904632568359375);
        float _1583 = -_1549;
        float _1585 = _1583 + 0.5;
        float _1587 = fma(_1567, -1.99999904632568359375, 1.99999904632568359375);
        float _1589 = fma(_1567, -7.99999904632568359375, 7.99999904632568359375);
        float _1591 = trunc(_1559);
        float _1593 = precise::max(_1591, 0.0);
        uint _1595 = uint(_1593);
        float _1597 = fma(_1573, -1.99999904632568359375, 1.99999904632568359375);
        float _1599 = fma(_1573, -7.99999904632568359375, 7.99999904632568359375);
        float _1601 = _1517 * _1501;
        float _1603 = -_1551;
        float _1605 = _1603 + 0.5;
        float _1607 = -_1553;
        float _1609 = _1607 + 0.5;
        float _1611 = abs(_1585);
        bool _1613 = _1611 >= 0.375;
        float _1615 = -_1567;
        float _1617 = _1615 + 0.5;
        float _1619 = trunc(_1561);
        float _1621 = precise::max(_1619, 0.0);
        uint _1623 = uint(_1621);
        float _1625 = fma(_1601, -1.99999904632568359375, 1.99999904632568359375);
        float _1627 = fma(_1601, -7.99999904632568359375, 7.99999904632568359375);
        float _1629 = _1521 * _1501;
        float _1631 = _1525 * _1501;
        float _1633 = -_1573;
        float _1635 = _1633 + 0.5;
        float _1637 = abs(_1605);
        bool _1639 = _1637 >= 0.375;
        float _1641 = _1529 * _1501;
        float _1643 = trunc(_1563);
        float _1645 = precise::max(_1643, 0.0);
        uint _1647 = uint(_1645);
        float _1649 = _1533 * _1501;
        float _1651 = -_720;
        float _1653 = _573 + _1651;
        float _1655 = abs(_1609);
        bool _1657 = _1655 >= 0.375;
        float _1659 = fma(_1629, -1.99999904632568359375, 1.99999904632568359375);
        float _1661 = fma(_1629, -7.99999904632568359375, 7.99999904632568359375);
        float _1663 = fma(_1631, -1.99999904632568359375, 1.99999904632568359375);
        float _1665 = fma(_1631, -7.99999904632568359375, 7.99999904632568359375);
        float _1667 = trunc(_1565);
        float _1669 = precise::max(_1667, 0.0);
        uint _1671 = uint(_1669);
        float _1673 = abs(_1617);
        bool _1675 = _1673 >= 0.375;
        float _1677 = -_1601;
        float _1679 = _1677 + 0.5;
        float _1681 = abs(_1635);
        bool _1683 = _1681 >= 0.375;
        float _1685 = fma(_1641, -1.99999904632568359375, 1.99999904632568359375);
        float _1687 = fma(_1641, -7.99999904632568359375, 7.99999904632568359375);
        float _1689 = _1537 * _1501;
        float _1691 = _1653 * _1501;
        float _1693 = trunc(_1569);
        float _1695 = precise::max(_1693, 0.0);
        uint _1697 = uint(_1695);
        float _1699 = -_1629;
        float _1701 = _1699 + 0.5;
        float _1703 = -_1631;
        float _1705 = _1703 + 0.5;
        float _1707 = abs(_1679);
        bool _1709 = _1707 >= 0.375;
        float _1711 = fma(_1689, -1.99999904632568359375, 1.99999904632568359375);
        float _1713 = fma(_1689, -7.99999904632568359375, 7.99999904632568359375);
        float _1715 = fma(_1649, -1.99999904632568359375, 1.99999904632568359375);
        float _1717 = -_1641;
        float _1719 = _1717 + 0.5;
        float _1721 = trunc(_1571);
        float _1723 = precise::max(_1721, 0.0);
        uint _1725 = uint(_1723);
        float _1727 = fma(_1691, -1.99999904632568359375, 1.99999904632568359375);
        float _1729 = fma(_1691, -7.99999904632568359375, 7.99999904632568359375);
        float _1731 = fma(_1649, -7.99999904632568359375, 7.99999904632568359375);
        float _1733 = _1509 * _1501;
        int _1735 = int(_1595);
        int _1737 = int(_1647);
        int _1739 = int(_1697);
        if (!_1577)
        {
            int _1741 = int(_1623) + 1;
            _1735 = _1741;
        }
        int _1743 = _1735;
        float _1745 = -_1691;
        float _1747 = _1745 + 0.5;
        if (!_1613)
        {
            int _1749 = int(_1671) + 1;
            _1737 = _1749;
        }
        int _1751 = _1737;
        float _1753 = trunc(_1579);
        float _1755 = precise::max(_1753, 0.0);
        uint _1757 = uint(_1755);
        float _1759 = _1541 * _1501;
        float _1761 = abs(_1701);
        bool _1763 = _1761 >= 0.375;
        float _1765 = _1545 * _1501;
        float _1767 = abs(_1705);
        bool _1769 = _1767 >= 0.375;
        float _1771 = -_1689;
        float _1773 = _1771 + 0.5;
        float _1775 = -_1649;
        float _1777 = _1775 + 0.5;
        float _1779 = fma(_1733, -1.99999904632568359375, 1.99999904632568359375);
        float _1781 = trunc(_1581);
        float _1783 = precise::max(_1781, 0.0);
        uint _1785 = uint(_1783);
        int _1787 = int(_1757);
        if (!_1639)
        {
            int _1789 = int(_1725) + 1;
            _1739 = _1789;
        }
        int _1791 = _1739;
        float _1793 = fma(_1733, -7.99999904632568359375, 7.99999904632568359375);
        float _1795 = abs(_1719);
        bool _1797 = _1795 >= 0.375;
        float _1799 = fma(_1759, -1.99999904632568359375, 1.99999904632568359375);
        float _1801 = -_1733;
        float _1803 = _1801 + 0.5;
        float _1805 = fma(_1765, -1.99999904632568359375, 1.99999904632568359375);
        float _1807 = trunc(_1587);
        float _1809 = precise::max(_1807, 0.0);
        uint _1811 = uint(_1809);
        float _1813 = trunc(_1589);
        float _1815 = precise::max(_1813, 0.0);
        uint _1817 = uint(_1815);
        int _1819 = int(_1811);
        if (!_1657)
        {
            int _1821 = int(_1785) + 1;
            _1787 = _1821;
        }
        int _1823 = _1787;
        float _1825 = abs(_1747);
        bool _1827 = _1825 >= 0.375;
        float _1829 = fma(_1765, -7.99999904632568359375, 7.99999904632568359375);
        float _1831 = -_1765;
        float _1833 = _1831 + 0.5;
        int _1835 = _1823 << 15;
        float _1837 = trunc(_1597);
        float _1839 = precise::max(_1837, 0.0);
        uint _1841 = uint(_1839);
        float _1843 = trunc(_1599);
        float _1845 = precise::max(_1843, 0.0);
        uint _1847 = uint(_1845);
        int _1849 = int(_1841);
        if (!_1675)
        {
            int _1851 = int(_1817) + 1;
            _1819 = _1851;
        }
        int _1853 = _1819;
        float _1855 = fma(_1759, -7.99999904632568359375, 7.99999904632568359375);
        float _1857 = abs(_1773);
        bool _1859 = _1857 >= 0.375;
        float _1861 = -_1759;
        float _1863 = _1861 + 0.5;
        int _1865 = _1751 << 3;
        int _1867 = _1853 << 9;
        float _1869 = trunc(_1625);
        float _1871 = precise::max(_1869, 0.0);
        uint _1873 = uint(_1871);
        int _1875 = _1743 | _1865;
        float _1877 = trunc(_1627);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        int _1883 = int(_1873);
        if (!_1683)
        {
            int _1885 = int(_1847) + 1;
            _1849 = _1885;
        }
        int _1887 = _1849;
        float _1889 = abs(_1777);
        bool _1891 = _1889 >= 0.375;
        int _1893 = _1887 << 12;
        float _1895 = trunc(_1659);
        float _1897 = precise::max(_1895, 0.0);
        uint _1899 = uint(_1897);
        float _1901 = trunc(_1661);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        int _1907 = int(_1899);
        if (!_1709)
        {
            int _1909 = int(_1881) + 1;
            _1883 = _1909;
        }
        int _1911 = _1883;
        float _1913 = abs(_1803);
        bool _1915 = _1913 >= 0.375;
        int _1917 = _1911 << 18;
        float _1919 = trunc(_1663);
        float _1921 = precise::max(_1919, 0.0);
        uint _1923 = uint(_1921);
        float _1925 = trunc(_1665);
        float _1927 = precise::max(_1925, 0.0);
        uint _1929 = uint(_1927);
        int _1931 = int(_1923);
        if (!_1763)
        {
            int _1933 = int(_1905) + 1;
            _1907 = _1933;
        }
        int _1935 = _1907;
        float _1937 = abs(_1863);
        bool _1939 = _1937 >= 0.375;
        int _1941 = _1935 << 21;
        float _1943 = trunc(_1685);
        float _1945 = precise::max(_1943, 0.0);
        uint _1947 = uint(_1945);
        float _1949 = trunc(_1687);
        float _1951 = precise::max(_1949, 0.0);
        uint _1953 = uint(_1951);
        int _1955 = int(_1947);
        if (!_1769)
        {
            int _1957 = int(_1929) + 1;
            _1931 = _1957;
        }
        int _1959 = _1931;
        float _1961 = abs(_1833);
        bool _1963 = _1961 >= 0.375;
        float _1965 = trunc(_1711);
        float _1967 = precise::max(_1965, 0.0);
        uint _1969 = uint(_1967);
        float _1971 = trunc(_1713);
        float _1973 = precise::max(_1971, 0.0);
        uint _1975 = uint(_1973);
        int _1977 = int(_1969);
        if (!_1797)
        {
            int _1979 = int(_1953) + 1;
            _1955 = _1979;
        }
        int _1981 = _1955;
        int _1983 = _1981 << 3;
        int _1985 = _1791 << 6;
        float _1987 = trunc(_1715);
        float _1989 = precise::max(_1987, 0.0);
        uint _1991 = uint(_1989);
        int _1993 = _1959 | _1983;
        int _1995 = _1875 | _1985;
        int _1997 = _1867 | _1995;
        int _1999 = _1997 | _1893;
        int _2001 = _1835 | _1999;
        float _2003 = trunc(_1731);
        float _2005 = precise::max(_2003, 0.0);
        uint _2007 = uint(_2005);
        int _2009 = int(_1991);
        if (!_1859)
        {
            int _2011 = int(_1975) + 1;
            _1977 = _2011;
        }
        int _2013 = _1977;
        int _2015 = _2001 | _1917;
        int _2017 = _1941 | _2015;
        int _2019 = _2013 << 6;
        float _2021 = trunc(_1727);
        float _2023 = precise::max(_2021, 0.0);
        uint _2025 = uint(_2023);
        float _2027 = trunc(_1729);
        float _2029 = precise::max(_2027, 0.0);
        uint _2031 = uint(_2029);
        int _2033 = int(_2025);
        if (!_1891)
        {
            int _2035 = int(_2007) + 1;
            _2009 = _2035;
        }
        int _2037 = _2009;
        uint _2039 = uint(int(uint(_2017) >> uint(16)));
        int _2041 = _2037 << 9;
        float _2043 = trunc(_1779);
        float _2045 = precise::max(_2043, 0.0);
        uint _2047 = uint(_2045);
        int _2049 = _1993 | _2019;
        int _2051 = _2041 | _2049;
        float _2053 = trunc(_1793);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        int _2059 = int(_2047);
        if (!_1827)
        {
            int _2061 = int(_2031) + 1;
            _2033 = _2061;
        }
        int _2063 = _2033;
        int _2065 = _2063 << 12;
        float _2067 = trunc(_1799);
        float _2069 = precise::max(_2067, 0.0);
        uint _2071 = uint(_2069);
        float _2073 = trunc(_1855);
        float _2075 = precise::max(_2073, 0.0);
        uint _2077 = uint(_2075);
        int _2079 = int(_2071);
        if (!_1915)
        {
            int _2081 = int(_2057) + 1;
            _2059 = _2081;
        }
        int _2083 = _2059;
        int _2085 = _2083 << 15;
        float _2087 = trunc(_1805);
        float _2089 = precise::max(_2087, 0.0);
        uint _2091 = uint(_2089);
        int _2093 = _2051 | _2065;
        int _2095 = _2085 | _2093;
        float _2097 = trunc(_1829);
        float _2099 = precise::max(_2097, 0.0);
        uint _2101 = uint(_2099);
        int _2103 = int(_2091);
        if (!_1939)
        {
            int _2105 = int(_2077) + 1;
            _2079 = _2105;
        }
        int _2107 = _2079;
        int _2109 = _2107 << 18;
        if (!_1963)
        {
            int _2111 = int(_2101) + 1;
            _2103 = _2111;
        }
        int _2113 = _2103;
        int _2115 = _2113 << 21;
        int _2117 = _2095 | _2109;
        int _2119 = _2115 | _2117;
        int _2121 = _2017 << 16;
        int _2123 = _2119 << 8;
        uint _2125 = uint(int(uint(_2119) >> uint(8)));
        int _2127 = 65280 & _2123;
        int _2129 = int(_2039) | _2127;
        int _2131 = int(_2125) << 16;
        _1469 = _2121;
        _1479 = _2131;
        _1473 = _2129;
    }
    int _2133 = _1469;
    int _2135 = _1479;
    int _2137 = _1473;
    int _2139 = _1449 | _761;
    int _2141 = _1451 | _1453;
    int _2143 = _2133 | _769;
    int _2145 = _2135 | _2137;
    out.m_36.x = as_type<float>(_2139);
    out.m_36.y = as_type<float>(_2141);
    out.m_36.z = as_type<float>(_2143);
    out.m_36.w = as_type<float>(_2145);
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
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
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_29.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_31.z;
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
    float _113 = _99 * _85;
    float _115 = _99 * _91;
    float _117 = _101 + _105;
    float _119 = _103 + _107;
    float _121 = _99 * _97;
    float _123 = _101 + _109;
    float _125 = _103 + _111;
    float _127 = fma(_109, 2.0, _101);
    float _129 = fma(_109, 3.0, _101);
    float _131 = _113 + _115;
    float _133 = _113 + _121;
    float _135 = abs(_117);
    float _137 = abs(_119);
    float _139 = precise::max(_135, _137);
    float _141 = _123 + _105;
    float _143 = _125 + _107;
    float _145 = _133 + _115;
    float _147 = abs(_131);
    float _149 = precise::max(_147, _139);
    float _151 = fma(_111, 3.0, _103);
    float _153 = fma(_111, 2.0, _103);
    float _155 = abs(_141);
    float _157 = abs(_143);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 2.0, _113);
    float _163 = fma(_121, 3.0, _113);
    float _165 = _129 + _105;
    float _167 = abs(_145);
    float _169 = precise::max(_167, _159);
    float _171 = _151 + _107;
    float _173 = _127 + _105;
    float _175 = _153 + _107;
    float _177 = _163 + _115;
    float _179 = _161 + _115;
    float _181 = abs(_165);
    float _183 = abs(_171);
    float _185 = precise::max(_181, _183);
    float _187 = 1.0 / _149;
    float _189 = abs(_173);
    float _191 = abs(_175);
    float _193 = precise::max(_189, _191);
    float _195 = abs(_177);
    float _197 = precise::max(_195, _185);
    float _199 = abs(_179);
    float _201 = precise::max(_199, _193);
    float _203 = 1.0 / _169;
    float _205 = 1.0 / _197;
    float _207 = _117 * _187;
    float _209 = _119 * _187;
    float _211 = _131 * _187;
    float _213 = 1.0 / _201;
    float _215 = _141 * _203;
    float _217 = _143 * _203;
    float _219 = _145 * _203;
    float _221 = _177 * _205;
    float _223 = _165 * _205;
    float _225 = _171 * _205;
    float _227 = _173 * _213;
    float _229 = _175 * _213;
    float _231 = _179 * _213;
    float3 _2409 = float3(_207, _209, _211);
    float2 _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2409, float3(0.0), isnan(_2409)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2409, float3(0.0), isnan(_2409)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _237 = _235.x;
    float _239 = _235.y;
    float3 _2428 = float3(_215, _217, _219);
    float2 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2428, float3(0.0), isnan(_2428)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2428, float3(0.0), isnan(_2428)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _243 = _241.x;
    float _245 = _241.y;
    float3 _2443 = float3(_227, _229, _231);
    float2 _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2443, float3(0.0), isnan(_2443)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2443, float3(0.0), isnan(_2443)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _249 = _247.x;
    float _251 = _247.y;
    float3 _2458 = float3(_223, _225, _221);
    float2 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2458, float3(0.0), isnan(_2458)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2458, float3(0.0), isnan(_2458)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _255 = _253.x;
    float _257 = _253.y;
    float _259 = fma(_105, 2.0, _101);
    float _261 = fma(_107, 2.0, _103);
    float _263 = fma(_115, 2.0, _113);
    float _265 = abs(_101);
    float _267 = abs(_103);
    float _269 = precise::max(_265, _267);
    float _271 = fma(_105, 2.0, _123);
    float _273 = fma(_107, 2.0, _125);
    float _275 = abs(_259);
    float _277 = abs(_261);
    float _279 = precise::max(_275, _277);
    float _281 = abs(_113);
    float _283 = precise::max(_281, _269);
    float _285 = abs(_263);
    float _287 = precise::max(_285, _279);
    float _289 = abs(_123);
    float _291 = abs(_125);
    float _293 = precise::max(_289, _291);
    float _295 = fma(_115, 2.0, _133);
    float _297 = abs(_271);
    float _299 = abs(_273);
    float _301 = precise::max(_297, _299);
    float _303 = 1.0 / _283;
    float _305 = abs(_133);
    float _307 = precise::max(_305, _293);
    float _309 = abs(_127);
    float _311 = abs(_153);
    float _313 = precise::max(_309, _311);
    float _315 = abs(_129);
    float _317 = abs(_151);
    float _319 = precise::max(_315, _317);
    float _321 = abs(_295);
    float _323 = precise::max(_321, _301);
    float _325 = 1.0 / _287;
    float _327 = abs(_161);
    float _329 = precise::max(_327, _313);
    float _331 = 1.0 / _323;
    float _333 = _101 * _303;
    float _335 = _113 * _303;
    float _337 = _263 * _325;
    float _339 = abs(_163);
    float _341 = precise::max(_339, _319);
    float _343 = 1.0 / _307;
    float _345 = _259 * _325;
    float _347 = _261 * _325;
    float _349 = _103 * _303;
    float _351 = _271 * _331;
    float _353 = _273 * _331;
    float _355 = 1.0 / _329;
    float _357 = _295 * _331;
    float _359 = 1.0 / _341;
    float _361 = _123 * _343;
    float _363 = _125 * _343;
    float _365 = _133 * _343;
    float _367 = _127 * _355;
    float _369 = _153 * _355;
    float _371 = _161 * _355;
    float3 _2620 = float3(_333, _349, _335);
    float2 _373 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2620, float3(0.0), isnan(_2620)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2620, float3(0.0), isnan(_2620)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _375 = _373.x;
    float _377 = _373.y;
    float3 _2635 = float3(_361, _363, _365);
    float2 _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2635, float3(0.0), isnan(_2635)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2635, float3(0.0), isnan(_2635)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _381 = _379.x;
    float _383 = _379.y;
    float _385 = _129 * _359;
    float _387 = _151 * _359;
    float _389 = _163 * _359;
    float3 _2659 = float3(_367, _369, _371);
    float2 _391 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2659, float3(0.0), isnan(_2659)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2659, float3(0.0), isnan(_2659)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _393 = _391.x;
    float _395 = _391.y;
    float3 _2674 = float3(_385, _387, _389);
    float2 _397 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2674, float3(0.0), isnan(_2674)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2674, float3(0.0), isnan(_2674)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _399 = _397.x;
    float _401 = _397.y;
    float3 _2689 = float3(_345, _347, _337);
    float2 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2689, float3(0.0), isnan(_2689)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _405 = _403.x;
    float _407 = _403.y;
    float3 _2704 = float3(_351, _353, _357);
    float2 _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2704, float3(0.0), isnan(_2704)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2704, float3(0.0), isnan(_2704)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _411 = _409.x;
    float _413 = _409.y;
    float _415 = fma(_105, 2.0, _129);
    float _417 = fma(_107, 2.0, _151);
    float _419 = fma(_105, 3.0, _101);
    float _421 = fma(_107, 3.0, _103);
    float _423 = fma(_105, 3.0, _123);
    float _425 = fma(_107, 3.0, _125);
    float _427 = fma(_105, 2.0, _127);
    float _429 = fma(_107, 2.0, _153);
    float _431 = fma(_105, 3.0, _127);
    float _433 = fma(_107, 3.0, _153);
    float _435 = fma(_105, 3.0, _129);
    float _437 = fma(_107, 3.0, _151);
    float _439 = fma(_115, 3.0, _133);
    float _441 = fma(_115, 2.0, _163);
    float _443 = abs(_415);
    float _445 = abs(_417);
    float _447 = precise::max(_443, _445);
    float _449 = fma(_115, 3.0, _113);
    float _451 = abs(_419);
    float _453 = abs(_421);
    float _455 = precise::max(_451, _453);
    float _457 = fma(_115, 2.0, _161);
    float _459 = abs(_441);
    float _461 = precise::max(_459, _447);
    float _463 = fma(_115, 3.0, _161);
    float _465 = abs(_449);
    float _467 = precise::max(_465, _455);
    float _469 = fma(_115, 3.0, _163);
    float _471 = abs(_423);
    float _473 = abs(_425);
    float _475 = precise::max(_471, _473);
    float _477 = 1.0 / _461;
    float _479 = abs(_427);
    float _481 = abs(_429);
    float _483 = precise::max(_479, _481);
    float _485 = abs(_439);
    float _487 = precise::max(_485, _475);
    float _489 = abs(_457);
    float _491 = precise::max(_489, _483);
    float _493 = 1.0 / _467;
    float _495 = _415 * _477;
    float _497 = _417 * _477;
    float _499 = _441 * _477;
    float _501 = abs(_431);
    float _503 = abs(_433);
    float _505 = precise::max(_501, _503);
    float _507 = 1.0 / _487;
    float _509 = abs(_463);
    float _511 = precise::max(_509, _505);
    float _513 = _419 * _493;
    float _515 = _421 * _493;
    float _517 = _449 * _493;
    float _519 = abs(_435);
    float _521 = abs(_437);
    float _523 = precise::max(_519, _521);
    float _525 = 1.0 / _491;
    float _527 = abs(_469);
    float _529 = precise::max(_527, _523);
    float _531 = 1.0 / _511;
    float _533 = _423 * _507;
    float _535 = _425 * _507;
    float _537 = _439 * _507;
    float _539 = 1.0 / _529;
    float _541 = _427 * _525;
    float _543 = _429 * _525;
    float _545 = _457 * _525;
    float _547 = _431 * _531;
    float _549 = _433 * _531;
    float _551 = _463 * _531;
    float _553 = _435 * _539;
    float _555 = _437 * _539;
    float3 _2908 = float3(_541, _543, _545);
    float2 _557 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2908, float3(0.0), isnan(_2908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2908, float3(0.0), isnan(_2908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _559 = _557.x;
    float _561 = _557.y;
    float3 _2923 = float3(_495, _497, _499);
    float2 _563 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2923, float3(0.0), isnan(_2923)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2923, float3(0.0), isnan(_2923)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _565 = _563.x;
    float _567 = _563.y;
    float3 _2938 = float3(_513, _515, _517);
    float2 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2938, float3(0.0), isnan(_2938)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2938, float3(0.0), isnan(_2938)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _571 = _569.x;
    float _573 = _569.y;
    float3 _2953 = float3(_533, _535, _537);
    float2 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2953, float3(0.0), isnan(_2953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2953, float3(0.0), isnan(_2953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _577 = _575.x;
    float _579 = _575.y;
    float3 _2968 = float3(_547, _549, _551);
    float2 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2968, float3(0.0), isnan(_2968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2968, float3(0.0), isnan(_2968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _469 * _539;
    float3 _2986 = float3(_553, _555, _587);
    float2 _589 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2986, float3(0.0), isnan(_2986)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2986, float3(0.0), isnan(_2986)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _591 = _589.x;
    float _593 = _589.y;
    float _595 = precise::max(_239, _245);
    float _597 = precise::min(_239, _245);
    float _599 = precise::max(_251, _257);
    float _601 = precise::min(_251, _257);
    float _603 = precise::min(_237, _243);
    float _605 = precise::min(_249, _255);
    float _607 = precise::max(_595, _599);
    float _609 = precise::min(_597, _601);
    float _611 = precise::min(_603, _605);
    float _613 = precise::max(_237, _243);
    float _615 = precise::max(_249, _255);
    float _617 = precise::max(_613, _615);
    float _619 = precise::min(_375, _381);
    float _621 = precise::max(_377, _383);
    float _623 = precise::max(_375, _381);
    float _625 = precise::min(_377, _383);
    float _627 = precise::min(_393, _399);
    float _629 = precise::max(_395, _401);
    float _631 = precise::max(_393, _399);
    float _633 = precise::min(_395, _401);
    float _635 = precise::min(_619, _627);
    float _637 = precise::max(_621, _629);
    float _639 = precise::max(_623, _631);
    float _641 = precise::min(_625, _633);
    float _643 = precise::min(_635, _611);
    float _645 = precise::max(_405, _411);
    float _647 = precise::max(_637, _607);
    float _649 = precise::min(_405, _411);
    float _651 = precise::max(_639, _617);
    float _653 = precise::min(_641, _609);
    float _655 = precise::min(_407, _413);
    float _657 = precise::max(_559, _565);
    float _659 = precise::max(_571, _577);
    float _661 = precise::min(_559, _565);
    float _663 = precise::max(_645, _657);
    float _665 = precise::max(_583, _591);
    float _667 = precise::min(_649, _661);
    float _669 = precise::max(_659, _665);
    float _671 = precise::max(_407, _413);
    float _673 = precise::max(_561, _567);
    float _675 = precise::min(_571, _577);
    float _677 = precise::min(_583, _591);
    float _679 = precise::max(_663, _669);
    float _681 = precise::max(_671, _673);
    float _683 = precise::min(_675, _677);
    float _685 = precise::max(_651, _679);
    float _687 = precise::min(_561, _567);
    float _689 = precise::min(_573, _579);
    float _691 = precise::min(_585, _593);
    float _693 = precise::min(_667, _683);
    float _695 = _685 * 255.0;
    float _697 = precise::min(_655, _687);
    float _699 = precise::min(_689, _691);
    float _701 = precise::max(_573, _579);
    float _703 = trunc(_695);
    float _705 = precise::max(_703, 0.0);
    uint _708 = uint(_705);
    float _710 = precise::max(_585, _593);
    float _712 = precise::min(_643, _693);
    float _714 = precise::min(_697, _699);
    float _716 = precise::max(_701, _710);
    float _718 = _712 * 255.0;
    float _720 = precise::min(_653, _714);
    float _722 = precise::max(_681, _716);
    float _724 = trunc(_718);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _720 * 255.0;
    float _732 = precise::max(_647, _722);
    float _734 = _732 * 255.0;
    float _736 = trunc(_730);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    float _742 = trunc(_734);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    bool _750 = _708 > _728;
    int _753 = int(_728) << 8;
    int _755 = _753 & 65280;
    int _757 = int(_740) << 8;
    int _759 = 255 & int(_708);
    int _761 = _755 | _759;
    int _763 = _757 & 65280;
    bool _765 = _746 > _740;
    int _767 = 255 & int(_746);
    int _769 = _763 | _767;
    int _771 = int(_740);
    int _773 = int(_746);
    int _775 = _755;
    int _777 = _757;
    int _779 = as_type<int>(_243);
    int _781 = as_type<int>(_712);
    if (!_750)
    {
        _771 = 0;
    }
    int _783 = _771;
    int _785 = _783;
    if (!_750)
    {
        _773 = 0;
        _775 = 0;
    }
    int _787 = _773;
    int _789 = _775;
    bool _791 = !_750;
    int _793 = _787;
    int _795 = _789;
    if (!_791)
    {
        float _797 = -_712;
        float _799 = _685 + _797;
        float _801 = -_712;
        float _803 = _375 + _801;
        float _805 = -_712;
        float _807 = _381 + _805;
        float _809 = -_712;
        float _811 = _399 + _809;
        float _813 = -_712;
        float _815 = _237 + _813;
        float _817 = 1.0 / _799;
        float _819 = -_712;
        float _821 = _255 + _819;
        float _823 = -_712;
        float _825 = _249 + _823;
        float _827 = -_712;
        float _829 = _243 + _827;
        float _831 = -_712;
        float _833 = _411 + _831;
        float _835 = -_712;
        float _837 = _559 + _835;
        float _839 = -_712;
        float _841 = _565 + _839;
        float _843 = -_712;
        float _845 = _571 + _843;
        float _847 = -_712;
        float _849 = _577 + _847;
        float _851 = -_712;
        float _853 = _583 + _851;
        float _855 = _803 * _817;
        float _857 = _807 * _817;
        float _859 = -_712;
        float _861 = _393 + _859;
        float _863 = fma(_855, -1.99999904632568359375, 1.99999904632568359375);
        float _865 = _811 * _817;
        float _867 = fma(_857, -1.99999904632568359375, 1.99999904632568359375);
        float _869 = fma(_857, -7.99999904632568359375, 7.99999904632568359375);
        float _871 = _861 * _817;
        float _873 = -_857;
        float _875 = _873 + 0.5;
        float _877 = fma(_855, -7.99999904632568359375, 7.99999904632568359375);
        float _879 = -_855;
        float _881 = _879 + 0.5;
        float _883 = fma(_871, -7.99999904632568359375, 7.99999904632568359375);
        float _885 = trunc(_863);
        float _887 = precise::max(_885, 0.0);
        uint _889 = uint(_887);
        float _891 = abs(_875);
        bool _893 = _891 >= 0.375;
        float _895 = -_871;
        float _897 = _895 + 0.5;
        float _899 = fma(_865, -1.99999904632568359375, 1.99999904632568359375);
        float _901 = abs(_881);
        bool _903 = _901 >= 0.375;
        float _905 = fma(_871, -1.99999904632568359375, 1.99999904632568359375);
        float _907 = -_712;
        float _909 = _405 + _907;
        float _911 = abs(_897);
        bool _913 = _911 >= 0.375;
        float _915 = trunc(_877);
        float _917 = precise::max(_915, 0.0);
        uint _919 = uint(_917);
        float _921 = -_865;
        float _923 = _921 + 0.5;
        float _925 = -_712;
        float _927 = _591 + _925;
        float _929 = _829 * _817;
        float _931 = _825 * _817;
        float _933 = _821 * _817;
        float _935 = abs(_923);
        bool _937 = _935 >= 0.375;
        float _939 = _909 * _817;
        float _941 = trunc(_883);
        float _943 = precise::max(_941, 0.0);
        uint _945 = uint(_943);
        float _947 = _833 * _817;
        float _949 = _837 * _817;
        float _951 = _841 * _817;
        float _953 = _845 * _817;
        float _955 = _849 * _817;
        float _957 = _853 * _817;
        float _959 = fma(_929, -1.99999904632568359375, 1.99999904632568359375);
        float _961 = trunc(_867);
        float _963 = precise::max(_961, 0.0);
        uint _965 = uint(_963);
        float _967 = _815 * _817;
        float _969 = fma(_865, -7.99999904632568359375, 7.99999904632568359375);
        float _971 = _927 * _817;
        float _973 = fma(_929, -7.99999904632568359375, 7.99999904632568359375);
        float _975 = -_967;
        float _977 = _975 + 0.5;
        float _979 = fma(_967, -7.99999904632568359375, 7.99999904632568359375);
        float _981 = fma(_967, -1.99999904632568359375, 1.99999904632568359375);
        float _983 = trunc(_869);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        int _989 = int(_889);
        int _991 = int(_965);
        if (!_903)
        {
            int _993 = int(_919) + 1;
            _989 = _993;
        }
        int _995 = _989;
        float _997 = -_931;
        float _999 = _997 + 0.5;
        float _1001 = abs(_977);
        bool _1003 = _1001 >= 0.375;
        float _1005 = -_929;
        float _1007 = _1005 + 0.5;
        float _1009 = fma(_931, -1.99999904632568359375, 1.99999904632568359375);
        float _1011 = fma(_931, -7.99999904632568359375, 7.99999904632568359375);
        float _1013 = abs(_999);
        bool _1015 = _1013 >= 0.375;
        float _1017 = trunc(_899);
        float _1019 = precise::max(_1017, 0.0);
        uint _1021 = uint(_1019);
        float _1023 = abs(_1007);
        bool _1025 = _1023 >= 0.375;
        float _1027 = fma(_933, -1.99999904632568359375, 1.99999904632568359375);
        float _1029 = fma(_933, -7.99999904632568359375, 7.99999904632568359375);
        float _1031 = fma(_939, -1.99999904632568359375, 1.99999904632568359375);
        float _1033 = fma(_939, -7.99999904632568359375, 7.99999904632568359375);
        float _1035 = -_939;
        float _1037 = _1035 + 0.5;
        float _1039 = trunc(_969);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        int _1045 = int(_1021);
        if (!_893)
        {
            int _1047 = int(_987) + 1;
            _991 = _1047;
        }
        int _1049 = _991;
        float _1051 = -_933;
        float _1053 = _1051 + 0.5;
        float _1055 = fma(_947, -1.99999904632568359375, 1.99999904632568359375);
        float _1057 = abs(_1053);
        bool _1059 = _1057 >= 0.375;
        float _1061 = trunc(_905);
        float _1063 = precise::max(_1061, 0.0);
        uint _1065 = uint(_1063);
        float _1067 = fma(_947, -7.99999904632568359375, 7.99999904632568359375);
        float _1069 = trunc(_981);
        float _1071 = precise::max(_1069, 0.0);
        uint _1073 = uint(_1071);
        int _1075 = int(_1073);
        if (!_937)
        {
            int _1077 = int(_1043) + 1;
            _1045 = _1077;
        }
        int _1079 = _1045;
        float _1081 = -_947;
        float _1083 = _1081 + 0.5;
        float _1085 = fma(_951, -1.99999904632568359375, 1.99999904632568359375);
        int _1087 = _1079 << 9;
        float _1089 = abs(_1083);
        bool _1091 = _1089 >= 0.375;
        float _1093 = trunc(_979);
        float _1095 = precise::max(_1093, 0.0);
        uint _1097 = uint(_1095);
        int _1099 = int(_1065);
        if (!_913)
        {
            int _1101 = int(_945) + 1;
            _1099 = _1101;
        }
        int _1103 = _1099;
        float _1105 = fma(_949, -1.99999904632568359375, 1.99999904632568359375);
        float _1107 = abs(_1037);
        bool _1109 = _1107 >= 0.375;
        float _1111 = fma(_949, -7.99999904632568359375, 7.99999904632568359375);
        float _1113 = -_949;
        float _1115 = _1113 + 0.5;
        float _1117 = fma(_951, -7.99999904632568359375, 7.99999904632568359375);
        float _1119 = -_951;
        float _1121 = _1119 + 0.5;
        float _1123 = trunc(_959);
        float _1125 = precise::max(_1123, 0.0);
        uint _1127 = uint(_1125);
        float _1129 = fma(_971, -7.99999904632568359375, 7.99999904632568359375);
        float _1131 = trunc(_973);
        float _1133 = precise::max(_1131, 0.0);
        uint _1135 = uint(_1133);
        int _1137 = int(_1127);
        if (!_1003)
        {
            int _1139 = int(_1097) + 1;
            _1075 = _1139;
        }
        int _1141 = _1075;
        float _1143 = fma(_953, -1.99999904632568359375, 1.99999904632568359375);
        float _1145 = abs(_1115);
        bool _1147 = _1145 >= 0.375;
        float _1149 = fma(_953, -7.99999904632568359375, 7.99999904632568359375);
        float _1151 = -_953;
        float _1153 = _1151 + 0.5;
        float _1155 = trunc(_1009);
        float _1157 = precise::max(_1155, 0.0);
        uint _1159 = uint(_1157);
        float _1161 = trunc(_1011);
        float _1163 = precise::max(_1161, 0.0);
        uint _1165 = uint(_1163);
        int _1167 = int(_1159);
        if (!_1025)
        {
            int _1169 = int(_1135) + 1;
            _1137 = _1169;
        }
        int _1171 = _1137;
        float _1173 = fma(_955, -1.99999904632568359375, 1.99999904632568359375);
        float _1175 = abs(_1121);
        bool _1177 = _1175 >= 0.375;
        float _1179 = fma(_955, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = -_955;
        float _1183 = _1181 + 0.5;
        int _1185 = _1171 << 15;
        float _1187 = trunc(_1027);
        float _1189 = precise::max(_1187, 0.0);
        uint _1191 = uint(_1189);
        float _1193 = trunc(_1029);
        float _1195 = precise::max(_1193, 0.0);
        uint _1197 = uint(_1195);
        int _1199 = int(_1191);
        if (!_1015)
        {
            int _1201 = int(_1165) + 1;
            _1167 = _1201;
        }
        int _1203 = _1167;
        float _1205 = fma(_957, -1.99999904632568359375, 1.99999904632568359375);
        float _1207 = abs(_1153);
        bool _1209 = _1207 >= 0.375;
        float _1211 = fma(_957, -7.99999904632568359375, 7.99999904632568359375);
        float _1213 = -_957;
        float _1215 = _1213 + 0.5;
        float _1217 = trunc(_1055);
        float _1219 = precise::max(_1217, 0.0);
        uint _1221 = uint(_1219);
        float _1223 = trunc(_1067);
        float _1225 = precise::max(_1223, 0.0);
        uint _1227 = uint(_1225);
        int _1229 = int(_1221);
        if (!_1059)
        {
            int _1231 = int(_1197) + 1;
            _1199 = _1231;
        }
        int _1233 = _1199;
        float _1235 = fma(_971, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = abs(_1183);
        bool _1239 = _1237 >= 0.375;
        float _1241 = -_971;
        float _1243 = _1241 + 0.5;
        int _1245 = _1233 << 21;
        float _1247 = trunc(_1031);
        float _1249 = precise::max(_1247, 0.0);
        uint _1251 = uint(_1249);
        float _1253 = trunc(_1033);
        float _1255 = precise::max(_1253, 0.0);
        uint _1257 = uint(_1255);
        int _1259 = int(_1251);
        if (!_1091)
        {
            int _1261 = int(_1227) + 1;
            _1229 = _1261;
        }
        int _1263 = _1229;
        float _1265 = abs(_1243);
        bool _1267 = _1265 >= 0.375;
        int _1269 = _1263 << 3;
        int _1271 = _1049 << 3;
        float _1273 = trunc(_1105);
        float _1275 = precise::max(_1273, 0.0);
        uint _1277 = uint(_1275);
        int _1279 = _995 | _1271;
        float _1281 = trunc(_1111);
        float _1283 = precise::max(_1281, 0.0);
        uint _1285 = uint(_1283);
        int _1287 = int(_1277);
        if (!_1109)
        {
            int _1289 = int(_1257) + 1;
            _1259 = _1289;
        }
        int _1291 = _1259;
        float _1293 = abs(_1215);
        bool _1295 = _1293 >= 0.375;
        int _1297 = _1291 | _1269;
        int _1299 = _1103 << 6;
        float _1301 = trunc(_1085);
        float _1303 = precise::max(_1301, 0.0);
        uint _1305 = uint(_1303);
        int _1307 = _1279 | _1299;
        int _1309 = _1087 | _1307;
        int _1311 = _1141 << 12;
        float _1313 = trunc(_1117);
        float _1315 = precise::max(_1313, 0.0);
        uint _1317 = uint(_1315);
        int _1319 = int(_1305);
        _777 = _1297;
        if (!_1147)
        {
            int _1321 = int(_1285) + 1;
            _1287 = _1321;
        }
        int _1323 = _1287;
        int _1325 = _1309 | _1311;
        int _1327 = _1185 | _1325;
        int _1329 = _1323 << 6;
        int _1331 = _1203 << 18;
        float _1333 = trunc(_1143);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        int _1339 = _1327 | _1331;
        int _1341 = _1245 | _1339;
        uint _1343 = uint(int(uint(_1341) >> uint(16)));
        float _1345 = trunc(_1149);
        float _1347 = precise::max(_1345, 0.0);
        uint _1349 = uint(_1347);
        int _1351 = int(_1337);
        _779 = _1341;
        if (!_1177)
        {
            int _1353 = int(_1317) + 1;
            _1319 = _1353;
        }
        int _1355 = _1319;
        int _1357 = _1341 << 16;
        int _1359 = _1355 << 9;
        float _1361 = trunc(_1173);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        int _1367 = _1297 | _1329;
        int _1369 = _1359 | _1367;
        float _1371 = trunc(_1179);
        float _1373 = precise::max(_1371, 0.0);
        uint _1375 = uint(_1373);
        int _1377 = int(_1365);
        _785 = _1357;
        if (!_1209)
        {
            int _1379 = int(_1349) + 1;
            _1351 = _1379;
        }
        int _1381 = _1351;
        int _1383 = _1381 << 12;
        float _1385 = trunc(_1205);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        float _1391 = trunc(_1211);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        int _1397 = int(_1389);
        if (!_1239)
        {
            int _1399 = int(_1375) + 1;
            _1377 = _1399;
        }
        int _1401 = _1377;
        int _1403 = _1401 << 15;
        float _1405 = trunc(_1235);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        int _1411 = _1369 | _1383;
        int _1413 = _1403 | _1411;
        float _1415 = trunc(_1129);
        float _1417 = precise::max(_1415, 0.0);
        uint _1419 = uint(_1417);
        int _1421 = int(_1409);
        if (!_1295)
        {
            int _1423 = int(_1395) + 1;
            _1397 = _1423;
        }
        int _1425 = _1397;
        int _1427 = _1425 << 18;
        _781 = _1427;
        if (!_1267)
        {
            int _1429 = int(_1419) + 1;
            _1421 = _1429;
        }
        int _1431 = _1421;
        int _1433 = _1431 << 21;
        int _1435 = _1413 | _1427;
        int _1437 = _1433 | _1435;
        int _1439 = _1437 << 8;
        uint _1441 = uint(int(uint(_1437) >> uint(8)));
        int _1443 = 65280 & _1439;
        int _1445 = int(_1343) | _1443;
        int _1447 = int(_1441) << 16;
        _793 = _1447;
        _795 = _1445;
    }
    int _1449 = _785;
    int _1451 = _793;
    int _1453 = _795;
    int _1455 = _777;
    int _1457 = _779;
    int _1459 = _781;
    int _1461 = _1455;
    int _1463 = _1459;
    int _1465 = _1457;
    if (!_765)
    {
        _1461 = 0;
    }
    int _1467 = _1461;
    int _1469 = _1467;
    if (!_765)
    {
        _1463 = 0;
    }
    int _1471 = _1463;
    int _1473 = _1471;
    if (!_765)
    {
        _1465 = 0;
    }
    int _1475 = _1465;
    bool _1477 = !_765;
    int _1479 = _1475;
    if (!_1477)
    {
        float _1481 = -_720;
        float _1483 = _732 + _1481;
        float _1485 = -_720;
        float _1487 = _377 + _1485;
        float _1489 = -_720;
        float _1491 = _383 + _1489;
        float _1493 = -_720;
        float _1495 = _395 + _1493;
        float _1497 = -_720;
        float _1499 = _245 + _1497;
        float _1501 = 1.0 / _1483;
        float _1503 = -_720;
        float _1505 = _401 + _1503;
        float _1507 = -_720;
        float _1509 = _579 + _1507;
        float _1511 = -_720;
        float _1513 = _239 + _1511;
        float _1515 = -_720;
        float _1517 = _251 + _1515;
        float _1519 = -_720;
        float _1521 = _257 + _1519;
        float _1523 = -_720;
        float _1525 = _407 + _1523;
        float _1527 = -_720;
        float _1529 = _413 + _1527;
        float _1531 = -_720;
        float _1533 = _567 + _1531;
        float _1535 = -_720;
        float _1537 = _561 + _1535;
        float _1539 = -_720;
        float _1541 = _585 + _1539;
        float _1543 = -_720;
        float _1545 = _593 + _1543;
        float _1547 = _1487 * _1501;
        float _1549 = _1491 * _1501;
        float _1551 = _1495 * _1501;
        float _1553 = _1499 * _1501;
        float _1555 = -_1547;
        float _1557 = _1555 + 0.5;
        float _1559 = fma(_1547, -1.99999904632568359375, 1.99999904632568359375);
        float _1561 = fma(_1547, -7.99999904632568359375, 7.99999904632568359375);
        float _1563 = fma(_1549, -1.99999904632568359375, 1.99999904632568359375);
        float _1565 = fma(_1549, -7.99999904632568359375, 7.99999904632568359375);
        float _1567 = _1505 * _1501;
        float _1569 = fma(_1551, -1.99999904632568359375, 1.99999904632568359375);
        float _1571 = fma(_1551, -7.99999904632568359375, 7.99999904632568359375);
        float _1573 = _1513 * _1501;
        float _1575 = abs(_1557);
        bool _1577 = _1575 >= 0.375;
        float _1579 = fma(_1553, -1.99999904632568359375, 1.99999904632568359375);
        float _1581 = fma(_1553, -7.99999904632568359375, 7.99999904632568359375);
        float _1583 = -_1549;
        float _1585 = _1583 + 0.5;
        float _1587 = fma(_1567, -1.99999904632568359375, 1.99999904632568359375);
        float _1589 = fma(_1567, -7.99999904632568359375, 7.99999904632568359375);
        float _1591 = trunc(_1559);
        float _1593 = precise::max(_1591, 0.0);
        uint _1595 = uint(_1593);
        float _1597 = fma(_1573, -1.99999904632568359375, 1.99999904632568359375);
        float _1599 = fma(_1573, -7.99999904632568359375, 7.99999904632568359375);
        float _1601 = _1517 * _1501;
        float _1603 = -_1551;
        float _1605 = _1603 + 0.5;
        float _1607 = -_1553;
        float _1609 = _1607 + 0.5;
        float _1611 = abs(_1585);
        bool _1613 = _1611 >= 0.375;
        float _1615 = -_1567;
        float _1617 = _1615 + 0.5;
        float _1619 = trunc(_1561);
        float _1621 = precise::max(_1619, 0.0);
        uint _1623 = uint(_1621);
        float _1625 = fma(_1601, -1.99999904632568359375, 1.99999904632568359375);
        float _1627 = fma(_1601, -7.99999904632568359375, 7.99999904632568359375);
        float _1629 = _1521 * _1501;
        float _1631 = _1525 * _1501;
        float _1633 = -_1573;
        float _1635 = _1633 + 0.5;
        float _1637 = abs(_1605);
        bool _1639 = _1637 >= 0.375;
        float _1641 = _1529 * _1501;
        float _1643 = trunc(_1563);
        float _1645 = precise::max(_1643, 0.0);
        uint _1647 = uint(_1645);
        float _1649 = _1533 * _1501;
        float _1651 = -_720;
        float _1653 = _573 + _1651;
        float _1655 = abs(_1609);
        bool _1657 = _1655 >= 0.375;
        float _1659 = fma(_1629, -1.99999904632568359375, 1.99999904632568359375);
        float _1661 = fma(_1629, -7.99999904632568359375, 7.99999904632568359375);
        float _1663 = fma(_1631, -1.99999904632568359375, 1.99999904632568359375);
        float _1665 = fma(_1631, -7.99999904632568359375, 7.99999904632568359375);
        float _1667 = trunc(_1565);
        float _1669 = precise::max(_1667, 0.0);
        uint _1671 = uint(_1669);
        float _1673 = abs(_1617);
        bool _1675 = _1673 >= 0.375;
        float _1677 = -_1601;
        float _1679 = _1677 + 0.5;
        float _1681 = abs(_1635);
        bool _1683 = _1681 >= 0.375;
        float _1685 = fma(_1641, -1.99999904632568359375, 1.99999904632568359375);
        float _1687 = fma(_1641, -7.99999904632568359375, 7.99999904632568359375);
        float _1689 = _1537 * _1501;
        float _1691 = _1653 * _1501;
        float _1693 = trunc(_1569);
        float _1695 = precise::max(_1693, 0.0);
        uint _1697 = uint(_1695);
        float _1699 = -_1629;
        float _1701 = _1699 + 0.5;
        float _1703 = -_1631;
        float _1705 = _1703 + 0.5;
        float _1707 = abs(_1679);
        bool _1709 = _1707 >= 0.375;
        float _1711 = fma(_1689, -1.99999904632568359375, 1.99999904632568359375);
        float _1713 = fma(_1689, -7.99999904632568359375, 7.99999904632568359375);
        float _1715 = fma(_1649, -1.99999904632568359375, 1.99999904632568359375);
        float _1717 = -_1641;
        float _1719 = _1717 + 0.5;
        float _1721 = trunc(_1571);
        float _1723 = precise::max(_1721, 0.0);
        uint _1725 = uint(_1723);
        float _1727 = fma(_1691, -1.99999904632568359375, 1.99999904632568359375);
        float _1729 = fma(_1691, -7.99999904632568359375, 7.99999904632568359375);
        float _1731 = fma(_1649, -7.99999904632568359375, 7.99999904632568359375);
        float _1733 = _1509 * _1501;
        int _1735 = int(_1595);
        int _1737 = int(_1647);
        int _1739 = int(_1697);
        if (!_1577)
        {
            int _1741 = int(_1623) + 1;
            _1735 = _1741;
        }
        int _1743 = _1735;
        float _1745 = -_1691;
        float _1747 = _1745 + 0.5;
        if (!_1613)
        {
            int _1749 = int(_1671) + 1;
            _1737 = _1749;
        }
        int _1751 = _1737;
        float _1753 = trunc(_1579);
        float _1755 = precise::max(_1753, 0.0);
        uint _1757 = uint(_1755);
        float _1759 = _1541 * _1501;
        float _1761 = abs(_1701);
        bool _1763 = _1761 >= 0.375;
        float _1765 = _1545 * _1501;
        float _1767 = abs(_1705);
        bool _1769 = _1767 >= 0.375;
        float _1771 = -_1689;
        float _1773 = _1771 + 0.5;
        float _1775 = -_1649;
        float _1777 = _1775 + 0.5;
        float _1779 = fma(_1733, -1.99999904632568359375, 1.99999904632568359375);
        float _1781 = trunc(_1581);
        float _1783 = precise::max(_1781, 0.0);
        uint _1785 = uint(_1783);
        int _1787 = int(_1757);
        if (!_1639)
        {
            int _1789 = int(_1725) + 1;
            _1739 = _1789;
        }
        int _1791 = _1739;
        float _1793 = fma(_1733, -7.99999904632568359375, 7.99999904632568359375);
        float _1795 = abs(_1719);
        bool _1797 = _1795 >= 0.375;
        float _1799 = fma(_1759, -1.99999904632568359375, 1.99999904632568359375);
        float _1801 = -_1733;
        float _1803 = _1801 + 0.5;
        float _1805 = fma(_1765, -1.99999904632568359375, 1.99999904632568359375);
        float _1807 = trunc(_1587);
        float _1809 = precise::max(_1807, 0.0);
        uint _1811 = uint(_1809);
        float _1813 = trunc(_1589);
        float _1815 = precise::max(_1813, 0.0);
        uint _1817 = uint(_1815);
        int _1819 = int(_1811);
        if (!_1657)
        {
            int _1821 = int(_1785) + 1;
            _1787 = _1821;
        }
        int _1823 = _1787;
        float _1825 = abs(_1747);
        bool _1827 = _1825 >= 0.375;
        float _1829 = fma(_1765, -7.99999904632568359375, 7.99999904632568359375);
        float _1831 = -_1765;
        float _1833 = _1831 + 0.5;
        int _1835 = _1823 << 15;
        float _1837 = trunc(_1597);
        float _1839 = precise::max(_1837, 0.0);
        uint _1841 = uint(_1839);
        float _1843 = trunc(_1599);
        float _1845 = precise::max(_1843, 0.0);
        uint _1847 = uint(_1845);
        int _1849 = int(_1841);
        if (!_1675)
        {
            int _1851 = int(_1817) + 1;
            _1819 = _1851;
        }
        int _1853 = _1819;
        float _1855 = fma(_1759, -7.99999904632568359375, 7.99999904632568359375);
        float _1857 = abs(_1773);
        bool _1859 = _1857 >= 0.375;
        float _1861 = -_1759;
        float _1863 = _1861 + 0.5;
        int _1865 = _1751 << 3;
        int _1867 = _1853 << 9;
        float _1869 = trunc(_1625);
        float _1871 = precise::max(_1869, 0.0);
        uint _1873 = uint(_1871);
        int _1875 = _1743 | _1865;
        float _1877 = trunc(_1627);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        int _1883 = int(_1873);
        if (!_1683)
        {
            int _1885 = int(_1847) + 1;
            _1849 = _1885;
        }
        int _1887 = _1849;
        float _1889 = abs(_1777);
        bool _1891 = _1889 >= 0.375;
        int _1893 = _1887 << 12;
        float _1895 = trunc(_1659);
        float _1897 = precise::max(_1895, 0.0);
        uint _1899 = uint(_1897);
        float _1901 = trunc(_1661);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        int _1907 = int(_1899);
        if (!_1709)
        {
            int _1909 = int(_1881) + 1;
            _1883 = _1909;
        }
        int _1911 = _1883;
        float _1913 = abs(_1803);
        bool _1915 = _1913 >= 0.375;
        int _1917 = _1911 << 18;
        float _1919 = trunc(_1663);
        float _1921 = precise::max(_1919, 0.0);
        uint _1923 = uint(_1921);
        float _1925 = trunc(_1665);
        float _1927 = precise::max(_1925, 0.0);
        uint _1929 = uint(_1927);
        int _1931 = int(_1923);
        if (!_1763)
        {
            int _1933 = int(_1905) + 1;
            _1907 = _1933;
        }
        int _1935 = _1907;
        float _1937 = abs(_1863);
        bool _1939 = _1937 >= 0.375;
        int _1941 = _1935 << 21;
        float _1943 = trunc(_1685);
        float _1945 = precise::max(_1943, 0.0);
        uint _1947 = uint(_1945);
        float _1949 = trunc(_1687);
        float _1951 = precise::max(_1949, 0.0);
        uint _1953 = uint(_1951);
        int _1955 = int(_1947);
        if (!_1769)
        {
            int _1957 = int(_1929) + 1;
            _1931 = _1957;
        }
        int _1959 = _1931;
        float _1961 = abs(_1833);
        bool _1963 = _1961 >= 0.375;
        float _1965 = trunc(_1711);
        float _1967 = precise::max(_1965, 0.0);
        uint _1969 = uint(_1967);
        float _1971 = trunc(_1713);
        float _1973 = precise::max(_1971, 0.0);
        uint _1975 = uint(_1973);
        int _1977 = int(_1969);
        if (!_1797)
        {
            int _1979 = int(_1953) + 1;
            _1955 = _1979;
        }
        int _1981 = _1955;
        int _1983 = _1981 << 3;
        int _1985 = _1791 << 6;
        float _1987 = trunc(_1715);
        float _1989 = precise::max(_1987, 0.0);
        uint _1991 = uint(_1989);
        int _1993 = _1959 | _1983;
        int _1995 = _1875 | _1985;
        int _1997 = _1867 | _1995;
        int _1999 = _1997 | _1893;
        int _2001 = _1835 | _1999;
        float _2003 = trunc(_1731);
        float _2005 = precise::max(_2003, 0.0);
        uint _2007 = uint(_2005);
        int _2009 = int(_1991);
        if (!_1859)
        {
            int _2011 = int(_1975) + 1;
            _1977 = _2011;
        }
        int _2013 = _1977;
        int _2015 = _2001 | _1917;
        int _2017 = _1941 | _2015;
        int _2019 = _2013 << 6;
        float _2021 = trunc(_1727);
        float _2023 = precise::max(_2021, 0.0);
        uint _2025 = uint(_2023);
        float _2027 = trunc(_1729);
        float _2029 = precise::max(_2027, 0.0);
        uint _2031 = uint(_2029);
        int _2033 = int(_2025);
        if (!_1891)
        {
            int _2035 = int(_2007) + 1;
            _2009 = _2035;
        }
        int _2037 = _2009;
        uint _2039 = uint(int(uint(_2017) >> uint(16)));
        int _2041 = _2037 << 9;
        float _2043 = trunc(_1779);
        float _2045 = precise::max(_2043, 0.0);
        uint _2047 = uint(_2045);
        int _2049 = _1993 | _2019;
        int _2051 = _2041 | _2049;
        float _2053 = trunc(_1793);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        int _2059 = int(_2047);
        if (!_1827)
        {
            int _2061 = int(_2031) + 1;
            _2033 = _2061;
        }
        int _2063 = _2033;
        int _2065 = _2063 << 12;
        float _2067 = trunc(_1799);
        float _2069 = precise::max(_2067, 0.0);
        uint _2071 = uint(_2069);
        float _2073 = trunc(_1855);
        float _2075 = precise::max(_2073, 0.0);
        uint _2077 = uint(_2075);
        int _2079 = int(_2071);
        if (!_1915)
        {
            int _2081 = int(_2057) + 1;
            _2059 = _2081;
        }
        int _2083 = _2059;
        int _2085 = _2083 << 15;
        float _2087 = trunc(_1805);
        float _2089 = precise::max(_2087, 0.0);
        uint _2091 = uint(_2089);
        int _2093 = _2051 | _2065;
        int _2095 = _2085 | _2093;
        float _2097 = trunc(_1829);
        float _2099 = precise::max(_2097, 0.0);
        uint _2101 = uint(_2099);
        int _2103 = int(_2091);
        if (!_1939)
        {
            int _2105 = int(_2077) + 1;
            _2079 = _2105;
        }
        int _2107 = _2079;
        int _2109 = _2107 << 18;
        if (!_1963)
        {
            int _2111 = int(_2101) + 1;
            _2103 = _2111;
        }
        int _2113 = _2103;
        int _2115 = _2113 << 21;
        int _2117 = _2095 | _2109;
        int _2119 = _2115 | _2117;
        int _2121 = _2017 << 16;
        int _2123 = _2119 << 8;
        uint _2125 = uint(int(uint(_2119) >> uint(8)));
        int _2127 = 65280 & _2123;
        int _2129 = int(_2039) | _2127;
        int _2131 = int(_2125) << 16;
        _1469 = _2121;
        _1479 = _2131;
        _1473 = _2129;
    }
    int _2133 = _1469;
    int _2135 = _1479;
    int _2137 = _1473;
    int _2139 = _1449 | _761;
    int _2141 = _1451 | _1453;
    int _2143 = _2133 | _769;
    int _2145 = _2135 | _2137;
    out.m_36.x = as_type<float>(_2139);
    out.m_36.y = as_type<float>(_2141);
    out.m_36.z = as_type<float>(_2143);
    out.m_36.w = as_type<float>(_2145);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

