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
    float _45 = in.m_29.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_29.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_31.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.y;
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
    float _117 = _103 + _107;
    float _119 = _105 + _109;
    float _121 = _99 * _97;
    float _123 = _103 + _111;
    float _125 = _105 + _113;
    float _127 = fma(_111, 2.0, _103);
    float _129 = fma(_111, 3.0, _103);
    float _131 = _101 + _115;
    float _133 = _101 + _121;
    float _135 = abs(_117);
    float _137 = abs(_119);
    float _139 = precise::max(_135, _137);
    float _141 = _123 + _107;
    float _143 = _125 + _109;
    float _145 = fma(_113, 2.0, _105);
    float _147 = fma(_113, 3.0, _105);
    float _149 = abs(_131);
    float _151 = precise::max(_149, _139);
    float _153 = _133 + _115;
    float _155 = abs(_141);
    float _157 = abs(_143);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 2.0, _101);
    float _163 = fma(_121, 3.0, _101);
    float _165 = _129 + _107;
    float _167 = abs(_153);
    float _169 = precise::max(_167, _159);
    float _171 = _147 + _109;
    float _173 = _127 + _107;
    float _175 = _145 + _109;
    float _177 = _163 + _115;
    float _179 = _161 + _115;
    float _181 = abs(_165);
    float _183 = abs(_171);
    float _185 = precise::max(_181, _183);
    float _187 = 1.0 / _151;
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
    float _219 = _153 * _203;
    float _221 = _165 * _205;
    float _223 = _171 * _205;
    float _225 = _177 * _205;
    float _227 = _173 * _213;
    float _229 = _175 * _213;
    float _231 = _179 * _213;
    float3 _1543 = float3(_207, _209, _211);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1543, float3(0.0), isnan(_1543)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1543, float3(0.0), isnan(_1543)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1558 = float3(_215, _217, _219);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1558, float3(0.0), isnan(_1558)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1558, float3(0.0), isnan(_1558)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1569 = float3(_227, _229, _231);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1569, float3(0.0), isnan(_1569)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1569, float3(0.0), isnan(_1569)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1580 = float3(_221, _223, _225);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1580, float3(0.0), isnan(_1580)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1580, float3(0.0), isnan(_1580)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _241 = abs(_103);
    float _243 = abs(_105);
    float _245 = precise::max(_241, _243);
    float _247 = fma(_107, 3.0, _103);
    float _249 = fma(_107, 2.0, _103);
    float _251 = fma(_115, 2.0, _101);
    float _253 = abs(_101);
    float _255 = precise::max(_253, _245);
    float _257 = fma(_109, 2.0, _105);
    float _259 = 1.0 / _255;
    float _261 = fma(_109, 3.0, _105);
    float _263 = fma(_115, 2.0, _133);
    float _265 = fma(_115, 3.0, _101);
    float _267 = abs(_247);
    float _269 = abs(_261);
    float _271 = precise::max(_267, _269);
    float _273 = fma(_107, 2.0, _123);
    float _275 = abs(_249);
    float _277 = abs(_257);
    float _279 = precise::max(_275, _277);
    float _281 = fma(_109, 2.0, _125);
    float _283 = abs(_265);
    float _285 = precise::max(_283, _271);
    float _287 = fma(_109, 2.0, _145);
    float _289 = abs(_251);
    float _291 = precise::max(_289, _279);
    float _293 = fma(_115, 2.0, _163);
    float _295 = abs(_273);
    float _297 = abs(_281);
    float _299 = precise::max(_295, _297);
    float _301 = 1.0 / _285;
    float _303 = _105 * _259;
    float _305 = abs(_263);
    float _307 = precise::max(_305, _299);
    float _309 = _103 * _259;
    float _311 = _101 * _259;
    float _313 = 1.0 / _291;
    float _315 = 1.0 / _307;
    float _317 = _265 * _301;
    float _319 = fma(_107, 2.0, _127);
    float _321 = _261 * _301;
    float _323 = abs(_123);
    float _325 = abs(_125);
    float _327 = precise::max(_323, _325);
    float _329 = _247 * _301;
    float _331 = _251 * _313;
    float _333 = _249 * _313;
    float _335 = _257 * _313;
    float _337 = fma(_115, 2.0, _161);
    float _339 = abs(_319);
    float _341 = abs(_287);
    float _343 = precise::max(_339, _341);
    float _345 = fma(_107, 2.0, _129);
    float _347 = abs(_133);
    float _349 = precise::max(_347, _327);
    float _351 = _273 * _315;
    float _353 = _281 * _315;
    float _355 = _263 * _315;
    float _357 = abs(_337);
    float _359 = precise::max(_357, _343);
    float _361 = fma(_109, 2.0, _147);
    float _363 = 1.0 / _349;
    float _365 = abs(_345);
    float _367 = abs(_361);
    float _369 = precise::max(_365, _367);
    float _371 = abs(_293);
    float _373 = precise::max(_371, _369);
    float _375 = 1.0 / _359;
    float3 _1768 = float3(_309, _303, _311);
    float _377 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1768, float3(0.0), isnan(_1768)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1768, float3(0.0), isnan(_1768)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _379 = _125 * _363;
    float _381 = 1.0 / _373;
    float _383 = _123 * _363;
    float _385 = _319 * _375;
    float _387 = _287 * _375;
    float _389 = _337 * _375;
    float _391 = _133 * _363;
    float _393 = _345 * _381;
    float _395 = _361 * _381;
    float _397 = _293 * _381;
    float3 _1808 = float3(_383, _379, _391);
    float _399 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1808, float3(0.0), isnan(_1808)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1808, float3(0.0), isnan(_1808)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1819 = float3(_333, _335, _331);
    float _401 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1819, float3(0.0), isnan(_1819)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1819, float3(0.0), isnan(_1819)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1830 = float3(_351, _353, _355);
    float _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1841 = float3(_385, _387, _389);
    float _405 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1841, float3(0.0), isnan(_1841)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1841, float3(0.0), isnan(_1841)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1852 = float3(_393, _395, _397);
    float _407 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1852, float3(0.0), isnan(_1852)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1852, float3(0.0), isnan(_1852)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _409 = fma(_107, 3.0, _123);
    float _411 = fma(_109, 3.0, _125);
    float _413 = fma(_115, 3.0, _133);
    float _415 = abs(_409);
    float _417 = abs(_411);
    float _419 = precise::max(_415, _417);
    float _421 = abs(_413);
    float _423 = precise::max(_421, _419);
    float _425 = abs(_127);
    float _427 = abs(_145);
    float _429 = precise::max(_425, _427);
    float _431 = fma(_115, 3.0, _161);
    float _433 = abs(_161);
    float _435 = precise::max(_433, _429);
    float _437 = 1.0 / _423;
    float _439 = 1.0 / _435;
    float _441 = fma(_107, 3.0, _127);
    float _443 = fma(_109, 3.0, _145);
    float _445 = fma(_107, 3.0, _129);
    float _447 = _411 * _437;
    float _449 = fma(_109, 3.0, _147);
    float _451 = _409 * _437;
    float _453 = _413 * _437;
    float _455 = _127 * _439;
    float _457 = _145 * _439;
    float _459 = _161 * _439;
    float _461 = abs(_441);
    float _463 = abs(_443);
    float _465 = precise::max(_461, _463);
    float _467 = abs(_431);
    float _469 = precise::max(_467, _465);
    float _471 = abs(_129);
    float _473 = abs(_147);
    float _475 = precise::max(_471, _473);
    float _477 = abs(_163);
    float _479 = precise::max(_477, _475);
    float _481 = 1.0 / _469;
    float _483 = 1.0 / _479;
    float _485 = _441 * _481;
    float _487 = _443 * _481;
    float _489 = _431 * _481;
    float _491 = abs(_445);
    float _493 = abs(_449);
    float _495 = precise::max(_491, _493);
    float _497 = _129 * _483;
    float _499 = fma(_115, 3.0, _163);
    float _501 = _147 * _483;
    float _503 = _163 * _483;
    float _505 = abs(_499);
    float _507 = precise::max(_505, _495);
    float _509 = 1.0 / _507;
    float3 _1996 = float3(_455, _457, _459);
    float _511 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1996, float3(0.0), isnan(_1996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1996, float3(0.0), isnan(_1996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2007 = float3(_497, _501, _503);
    float _513 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2007, float3(0.0), isnan(_2007)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2007, float3(0.0), isnan(_2007)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _515 = _445 * _509;
    float _517 = _449 * _509;
    float _519 = _499 * _509;
    float3 _2027 = float3(_329, _321, _317);
    float _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2027, float3(0.0), isnan(_2027)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2027, float3(0.0), isnan(_2027)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2038 = float3(_451, _447, _453);
    float _523 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2038, float3(0.0), isnan(_2038)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2038, float3(0.0), isnan(_2038)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2049 = float3(_485, _487, _489);
    float _525 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2049, float3(0.0), isnan(_2049)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2049, float3(0.0), isnan(_2049)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2060 = float3(_515, _517, _519);
    float _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2060, float3(0.0), isnan(_2060)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2060, float3(0.0), isnan(_2060)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _529 = precise::max(_233, _235);
    float _531 = precise::max(_237, _239);
    float _533 = precise::min(_237, _239);
    float _535 = precise::max(_529, _531);
    float _537 = precise::min(_233, _235);
    float _539 = precise::min(_537, _533);
    float _541 = precise::max(_377, _399);
    float _543 = precise::max(_401, _403);
    float _545 = precise::max(_405, _407);
    float _547 = precise::min(_401, _403);
    float _549 = precise::max(_543, _545);
    float _551 = precise::min(_405, _407);
    float _553 = precise::min(_377, _399);
    float _555 = precise::min(_547, _551);
    float _557 = precise::max(_511, _513);
    float _559 = precise::min(_511, _513);
    float _561 = precise::max(_541, _557);
    float _563 = precise::min(_553, _559);
    float _565 = precise::max(_561, _535);
    float _567 = precise::min(_563, _539);
    float _569 = precise::max(_521, _523);
    float _571 = precise::max(_525, _527);
    float _573 = precise::min(_521, _523);
    float _575 = precise::min(_525, _527);
    float _577 = precise::max(_569, _571);
    float _579 = precise::min(_573, _575);
    float _581 = precise::max(_549, _577);
    float _583 = precise::min(_555, _579);
    float _585 = precise::max(_565, _581);
    float _587 = precise::min(_567, _583);
    float _589 = _585 * 127.0;
    float _591 = _587 * 127.0;
    float _593 = trunc(_589);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = trunc(_591);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    bool _608 = _598 > _604;
    int _611 = int(_604) << 8;
    int _613 = _611 & 65280;
    int _615 = 255 & int(_598);
    int _617 = _613 | _615;
    int _619 = as_type<int>(_565);
    int _621 = as_type<int>(_581);
    int _623 = as_type<int>(_559);
    if (!_608)
    {
        _619 = 0;
    }
    int _625 = _619;
    if (!_608)
    {
        _621 = 0;
        _623 = 0;
    }
    int _627 = _621;
    int _629 = _623;
    if (!_608)
    {
        out.m_36.x = as_type<float>(_617);
        out.m_36.y = as_type<float>(_625);
        out.m_36.z = as_type<float>(_627);
        out.m_36.w = as_type<float>(_629);
        return out;
    }
    float _631 = -_587;
    float _633 = _585 + _631;
    float _635 = -_587;
    float _637 = _511 + _635;
    float _639 = -_587;
    float _641 = _377 + _639;
    float _643 = -_587;
    float _645 = _399 + _643;
    float _647 = -_587;
    float _649 = _513 + _647;
    float _651 = 1.0 / _633;
    float _653 = -_587;
    float _655 = _233 + _653;
    float _657 = -_587;
    float _659 = _525 + _657;
    float _661 = -_587;
    float _663 = _235 + _661;
    float _665 = -_587;
    float _667 = _237 + _665;
    float _669 = -_587;
    float _671 = _527 + _669;
    float _673 = -_587;
    float _675 = _403 + _673;
    float _677 = -_587;
    float _679 = _239 + _677;
    float _681 = -_587;
    float _683 = _401 + _681;
    float _685 = -_587;
    float _687 = _405 + _685;
    float _689 = -_587;
    float _691 = _407 + _689;
    float _693 = -_587;
    float _695 = _521 + _693;
    float _697 = _637 * _651;
    float _699 = _641 * _651;
    float _701 = _645 * _651;
    float _703 = _649 * _651;
    float _705 = fma(_697, -1.99999904632568359375, 1.99999904632568359375);
    float _707 = fma(_697, -7.99999904632568359375, 7.99999904632568359375);
    float _709 = fma(_699, -1.99999904632568359375, 1.99999904632568359375);
    float _711 = fma(_699, -7.99999904632568359375, 7.99999904632568359375);
    float _713 = fma(_701, -1.99999904632568359375, 1.99999904632568359375);
    float _715 = fma(_701, -7.99999904632568359375, 7.99999904632568359375);
    float _717 = _655 * _651;
    float _719 = _659 * _651;
    float _721 = -_697;
    float _723 = _721 + 0.5;
    float _725 = -_699;
    float _727 = _725 + 0.5;
    float _729 = -_701;
    float _731 = _729 + 0.5;
    float _733 = trunc(_705);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = fma(_703, -1.99999904632568359375, 1.99999904632568359375);
    float _741 = fma(_703, -7.99999904632568359375, 7.99999904632568359375);
    float _743 = fma(_717, -1.99999904632568359375, 1.99999904632568359375);
    float _745 = fma(_717, -7.99999904632568359375, 7.99999904632568359375);
    float _747 = _663 * _651;
    float _749 = _667 * _651;
    float _751 = abs(_723);
    bool _753 = _751 >= 0.375;
    float _755 = trunc(_707);
    float _757 = precise::max(_755, 0.0);
    uint _759 = uint(_757);
    float _761 = fma(_747, -1.99999904632568359375, 1.99999904632568359375);
    float _763 = fma(_747, -7.99999904632568359375, 7.99999904632568359375);
    float _765 = fma(_749, -1.99999904632568359375, 1.99999904632568359375);
    float _767 = fma(_749, -7.99999904632568359375, 7.99999904632568359375);
    float _769 = _675 * _651;
    float _771 = abs(_727);
    bool _773 = _771 >= 0.375;
    float _775 = -_703;
    float _777 = _775 + 0.5;
    float _779 = trunc(_709);
    float _781 = precise::max(_779, 0.0);
    uint _783 = uint(_781);
    float _785 = abs(_731);
    bool _787 = _785 >= 0.375;
    float _789 = -_717;
    float _791 = _789 + 0.5;
    float _793 = _679 * _651;
    float _795 = _683 * _651;
    float _797 = fma(_769, -1.99999904632568359375, 1.99999904632568359375);
    float _799 = -_747;
    float _801 = _799 + 0.5;
    float _803 = -_749;
    float _805 = _803 + 0.5;
    float _807 = trunc(_711);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    float _813 = fma(_793, -1.99999904632568359375, 1.99999904632568359375);
    float _815 = fma(_793, -7.99999904632568359375, 7.99999904632568359375);
    float _817 = fma(_795, -1.99999904632568359375, 1.99999904632568359375);
    float _819 = fma(_795, -7.99999904632568359375, 7.99999904632568359375);
    float _821 = _687 * _651;
    float _823 = abs(_777);
    bool _825 = _823 >= 0.375;
    float _827 = fma(_769, -7.99999904632568359375, 7.99999904632568359375);
    float _829 = trunc(_713);
    float _831 = precise::max(_829, 0.0);
    uint _833 = uint(_831);
    float _835 = abs(_791);
    bool _837 = _835 >= 0.375;
    float _839 = -_587;
    float _841 = _523 + _839;
    float _843 = _691 * _651;
    float _845 = -_769;
    float _847 = _845 + 0.5;
    float _849 = abs(_801);
    bool _851 = _849 >= 0.375;
    float _853 = -_793;
    float _855 = _853 + 0.5;
    float _857 = abs(_805);
    bool _859 = _857 >= 0.375;
    float _861 = trunc(_715);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    float _867 = -_795;
    float _869 = _867 + 0.5;
    float _871 = fma(_821, -1.99999904632568359375, 1.99999904632568359375);
    float _873 = _695 * _651;
    float _875 = _841 * _651;
    float _877 = fma(_821, -7.99999904632568359375, 7.99999904632568359375);
    float _879 = fma(_843, -1.99999904632568359375, 1.99999904632568359375);
    float _881 = fma(_843, -7.99999904632568359375, 7.99999904632568359375);
    float _883 = trunc(_739);
    float _885 = precise::max(_883, 0.0);
    uint _887 = uint(_885);
    int _889 = int(_737);
    int _891 = int(_783);
    int _893 = int(_833);
    int _895 = int(_887);
    if (!_753)
    {
        int _897 = int(_759) + 1;
        _889 = _897;
    }
    int _899 = _889;
    float _901 = fma(_873, -1.99999904632568359375, 1.99999904632568359375);
    if (!_773)
    {
        int _903 = int(_811) + 1;
        _891 = _903;
    }
    int _905 = _891;
    float _907 = fma(_873, -7.99999904632568359375, 7.99999904632568359375);
    float _909 = abs(_847);
    bool _911 = _909 >= 0.375;
    float _913 = fma(_875, -7.99999904632568359375, 7.99999904632568359375);
    float _915 = abs(_855);
    bool _917 = _915 >= 0.375;
    float _919 = trunc(_741);
    float _921 = precise::max(_919, 0.0);
    uint _923 = uint(_921);
    if (!_787)
    {
        int _925 = int(_865) + 1;
        _893 = _925;
    }
    int _927 = _893;
    float _929 = -_821;
    float _931 = _929 + 0.5;
    float _933 = abs(_869);
    bool _935 = _933 >= 0.375;
    float _937 = -_843;
    float _939 = _937 + 0.5;
    float _941 = _671 * _651;
    float _943 = fma(_875, -1.99999904632568359375, 1.99999904632568359375);
    float _945 = fma(_719, -1.99999904632568359375, 1.99999904632568359375);
    float _947 = trunc(_743);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    float _953 = -_873;
    float _955 = _953 + 0.5;
    float _957 = -_875;
    float _959 = _957 + 0.5;
    float _961 = fma(_719, -7.99999904632568359375, 7.99999904632568359375);
    float _963 = fma(_941, -1.99999904632568359375, 1.99999904632568359375);
    float _965 = fma(_941, -7.99999904632568359375, 7.99999904632568359375);
    float _967 = -_719;
    float _969 = _967 + 0.5;
    float _971 = -_941;
    float _973 = _971 + 0.5;
    float _975 = trunc(_745);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    int _981 = int(_951);
    if (!_825)
    {
        int _983 = int(_923) + 1;
        _895 = _983;
    }
    int _985 = _895;
    float _987 = abs(_931);
    bool _989 = _987 >= 0.375;
    int _991 = _927 << 3;
    int _993 = _985 << 9;
    float _995 = trunc(_761);
    float _997 = precise::max(_995, 0.0);
    uint _999 = uint(_997);
    int _1001 = _905 | _991;
    float _1003 = trunc(_763);
    float _1005 = precise::max(_1003, 0.0);
    uint _1007 = uint(_1005);
    int _1009 = int(_999);
    if (!_837)
    {
        int _1011 = int(_979) + 1;
        _981 = _1011;
    }
    int _1013 = _981;
    float _1015 = abs(_939);
    bool _1017 = _1015 >= 0.375;
    int _1019 = _1013 << 12;
    float _1021 = trunc(_765);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    float _1027 = trunc(_767);
    float _1029 = precise::max(_1027, 0.0);
    uint _1031 = uint(_1029);
    int _1033 = int(_1025);
    if (!_851)
    {
        int _1035 = int(_1007) + 1;
        _1009 = _1035;
    }
    int _1037 = _1009;
    float _1039 = abs(_955);
    bool _1041 = _1039 >= 0.375;
    int _1043 = _1037 << 15;
    float _1045 = trunc(_797);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = trunc(_827);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    int _1057 = int(_1049);
    if (!_859)
    {
        int _1059 = int(_1031) + 1;
        _1033 = _1059;
    }
    int _1061 = _1033;
    float _1063 = abs(_959);
    bool _1065 = _1063 >= 0.375;
    float _1067 = trunc(_813);
    float _1069 = precise::max(_1067, 0.0);
    uint _1071 = uint(_1069);
    float _1073 = trunc(_815);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    int _1079 = int(_1071);
    if (!_911)
    {
        int _1081 = int(_1055) + 1;
        _1057 = _1081;
    }
    int _1083 = _1057;
    float _1085 = trunc(_817);
    float _1087 = precise::max(_1085, 0.0);
    uint _1089 = uint(_1087);
    float _1091 = trunc(_819);
    float _1093 = precise::max(_1091, 0.0);
    uint _1095 = uint(_1093);
    int _1097 = int(_1089);
    if (!_917)
    {
        int _1099 = int(_1077) + 1;
        _1079 = _1099;
    }
    int _1101 = _1079;
    float _1103 = abs(_969);
    bool _1105 = _1103 >= 0.375;
    int _1107 = _1101 << 21;
    float _1109 = trunc(_871);
    float _1111 = precise::max(_1109, 0.0);
    uint _1113 = uint(_1111);
    float _1115 = trunc(_877);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    int _1121 = int(_1113);
    if (!_935)
    {
        int _1123 = int(_1095) + 1;
        _1097 = _1123;
    }
    int _1125 = _1097;
    float _1127 = abs(_973);
    bool _1129 = _1127 >= 0.375;
    int _1131 = _1083 << 3;
    float _1133 = trunc(_879);
    float _1135 = precise::max(_1133, 0.0);
    uint _1137 = uint(_1135);
    int _1139 = _1125 | _1131;
    int _1141 = _899 << 6;
    int _1143 = _1001 | _1141;
    int _1145 = _993 | _1143;
    float _1147 = trunc(_881);
    float _1149 = precise::max(_1147, 0.0);
    uint _1151 = uint(_1149);
    int _1153 = int(_1137);
    if (!_989)
    {
        int _1155 = int(_1119) + 1;
        _1121 = _1155;
    }
    int _1157 = _1121;
    int _1159 = _1145 | _1019;
    int _1161 = _1043 | _1159;
    int _1163 = _1157 << 6;
    float _1165 = trunc(_901);
    float _1167 = precise::max(_1165, 0.0);
    uint _1169 = uint(_1167);
    float _1171 = trunc(_907);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    int _1177 = int(_1169);
    if (!_1017)
    {
        int _1179 = int(_1151) + 1;
        _1153 = _1179;
    }
    int _1181 = _1153;
    int _1183 = _1181 << 9;
    float _1185 = trunc(_943);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    int _1191 = _1139 | _1163;
    int _1193 = _1183 | _1191;
    float _1195 = trunc(_913);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    int _1201 = int(_1189);
    if (!_1041)
    {
        int _1203 = int(_1175) + 1;
        _1177 = _1203;
    }
    int _1205 = _1177;
    int _1207 = _1205 << 12;
    float _1209 = trunc(_945);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    float _1215 = trunc(_961);
    float _1217 = precise::max(_1215, 0.0);
    uint _1219 = uint(_1217);
    int _1221 = int(_1213);
    if (!_1065)
    {
        int _1223 = int(_1199) + 1;
        _1201 = _1223;
    }
    int _1225 = _1201;
    int _1227 = _1225 << 15;
    float _1229 = trunc(_963);
    float _1231 = precise::max(_1229, 0.0);
    uint _1233 = uint(_1231);
    int _1235 = _1193 | _1207;
    int _1237 = _1227 | _1235;
    int _1239 = _1061 << 18;
    int _1241 = _1161 | _1239;
    int _1243 = _1107 | _1241;
    float _1245 = trunc(_965);
    float _1247 = precise::max(_1245, 0.0);
    uint _1249 = uint(_1247);
    int _1251 = int(_1233);
    if (!_1105)
    {
        int _1253 = int(_1219) + 1;
        _1221 = _1253;
    }
    int _1255 = _1221;
    uint _1257 = uint(int(uint(_1243) >> uint(16)));
    int _1259 = _1255 << 18;
    int _1261 = _1243 & 65535;
    if (!_1129)
    {
        int _1263 = int(_1249) + 1;
        _1251 = _1263;
    }
    int _1265 = _1251;
    int _1267 = _1265 << 21;
    int _1269 = _1237 | _1259;
    int _1271 = _1267 | _1269;
    int _1273 = _1271 << 8;
    uint _1275 = uint(int(uint(_1271) >> uint(8)));
    int _1277 = 65280 & _1273;
    int _1279 = int(_1257) | _1277;
    out.m_36.x = as_type<float>(_617);
    out.m_36.y = as_type<float>(_1261);
    out.m_36.z = as_type<float>(_1279);
    out.m_36.w = as_type<float>(_1275);
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
    float _45 = in.m_29.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_29.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_31.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.y;
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
    float _117 = _103 + _107;
    float _119 = _105 + _109;
    float _121 = _99 * _97;
    float _123 = _103 + _111;
    float _125 = _105 + _113;
    float _127 = fma(_111, 2.0, _103);
    float _129 = fma(_111, 3.0, _103);
    float _131 = _101 + _115;
    float _133 = _101 + _121;
    float _135 = abs(_117);
    float _137 = abs(_119);
    float _139 = precise::max(_135, _137);
    float _141 = _123 + _107;
    float _143 = _125 + _109;
    float _145 = fma(_113, 2.0, _105);
    float _147 = fma(_113, 3.0, _105);
    float _149 = abs(_131);
    float _151 = precise::max(_149, _139);
    float _153 = _133 + _115;
    float _155 = abs(_141);
    float _157 = abs(_143);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 2.0, _101);
    float _163 = fma(_121, 3.0, _101);
    float _165 = _129 + _107;
    float _167 = abs(_153);
    float _169 = precise::max(_167, _159);
    float _171 = _147 + _109;
    float _173 = _127 + _107;
    float _175 = _145 + _109;
    float _177 = _163 + _115;
    float _179 = _161 + _115;
    float _181 = abs(_165);
    float _183 = abs(_171);
    float _185 = precise::max(_181, _183);
    float _187 = 1.0 / _151;
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
    float _219 = _153 * _203;
    float _221 = _165 * _205;
    float _223 = _171 * _205;
    float _225 = _177 * _205;
    float _227 = _173 * _213;
    float _229 = _175 * _213;
    float _231 = _179 * _213;
    float3 _1543 = float3(_207, _209, _211);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1543, float3(0.0), isnan(_1543)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1543, float3(0.0), isnan(_1543)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1558 = float3(_215, _217, _219);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1558, float3(0.0), isnan(_1558)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1558, float3(0.0), isnan(_1558)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1569 = float3(_227, _229, _231);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1569, float3(0.0), isnan(_1569)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1569, float3(0.0), isnan(_1569)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1580 = float3(_221, _223, _225);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1580, float3(0.0), isnan(_1580)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1580, float3(0.0), isnan(_1580)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _241 = abs(_103);
    float _243 = abs(_105);
    float _245 = precise::max(_241, _243);
    float _247 = fma(_107, 3.0, _103);
    float _249 = fma(_107, 2.0, _103);
    float _251 = fma(_115, 2.0, _101);
    float _253 = abs(_101);
    float _255 = precise::max(_253, _245);
    float _257 = fma(_109, 2.0, _105);
    float _259 = 1.0 / _255;
    float _261 = fma(_109, 3.0, _105);
    float _263 = fma(_115, 2.0, _133);
    float _265 = fma(_115, 3.0, _101);
    float _267 = abs(_247);
    float _269 = abs(_261);
    float _271 = precise::max(_267, _269);
    float _273 = fma(_107, 2.0, _123);
    float _275 = abs(_249);
    float _277 = abs(_257);
    float _279 = precise::max(_275, _277);
    float _281 = fma(_109, 2.0, _125);
    float _283 = abs(_265);
    float _285 = precise::max(_283, _271);
    float _287 = fma(_109, 2.0, _145);
    float _289 = abs(_251);
    float _291 = precise::max(_289, _279);
    float _293 = fma(_115, 2.0, _163);
    float _295 = abs(_273);
    float _297 = abs(_281);
    float _299 = precise::max(_295, _297);
    float _301 = 1.0 / _285;
    float _303 = _105 * _259;
    float _305 = abs(_263);
    float _307 = precise::max(_305, _299);
    float _309 = _103 * _259;
    float _311 = _101 * _259;
    float _313 = 1.0 / _291;
    float _315 = 1.0 / _307;
    float _317 = _265 * _301;
    float _319 = fma(_107, 2.0, _127);
    float _321 = _261 * _301;
    float _323 = abs(_123);
    float _325 = abs(_125);
    float _327 = precise::max(_323, _325);
    float _329 = _247 * _301;
    float _331 = _251 * _313;
    float _333 = _249 * _313;
    float _335 = _257 * _313;
    float _337 = fma(_115, 2.0, _161);
    float _339 = abs(_319);
    float _341 = abs(_287);
    float _343 = precise::max(_339, _341);
    float _345 = fma(_107, 2.0, _129);
    float _347 = abs(_133);
    float _349 = precise::max(_347, _327);
    float _351 = _273 * _315;
    float _353 = _281 * _315;
    float _355 = _263 * _315;
    float _357 = abs(_337);
    float _359 = precise::max(_357, _343);
    float _361 = fma(_109, 2.0, _147);
    float _363 = 1.0 / _349;
    float _365 = abs(_345);
    float _367 = abs(_361);
    float _369 = precise::max(_365, _367);
    float _371 = abs(_293);
    float _373 = precise::max(_371, _369);
    float _375 = 1.0 / _359;
    float3 _1768 = float3(_309, _303, _311);
    float _377 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1768, float3(0.0), isnan(_1768)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1768, float3(0.0), isnan(_1768)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _379 = _125 * _363;
    float _381 = 1.0 / _373;
    float _383 = _123 * _363;
    float _385 = _319 * _375;
    float _387 = _287 * _375;
    float _389 = _337 * _375;
    float _391 = _133 * _363;
    float _393 = _345 * _381;
    float _395 = _361 * _381;
    float _397 = _293 * _381;
    float3 _1808 = float3(_383, _379, _391);
    float _399 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1808, float3(0.0), isnan(_1808)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1808, float3(0.0), isnan(_1808)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1819 = float3(_333, _335, _331);
    float _401 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1819, float3(0.0), isnan(_1819)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1819, float3(0.0), isnan(_1819)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1830 = float3(_351, _353, _355);
    float _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1841 = float3(_385, _387, _389);
    float _405 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1841, float3(0.0), isnan(_1841)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1841, float3(0.0), isnan(_1841)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1852 = float3(_393, _395, _397);
    float _407 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1852, float3(0.0), isnan(_1852)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1852, float3(0.0), isnan(_1852)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _409 = fma(_107, 3.0, _123);
    float _411 = fma(_109, 3.0, _125);
    float _413 = fma(_115, 3.0, _133);
    float _415 = abs(_409);
    float _417 = abs(_411);
    float _419 = precise::max(_415, _417);
    float _421 = abs(_413);
    float _423 = precise::max(_421, _419);
    float _425 = abs(_127);
    float _427 = abs(_145);
    float _429 = precise::max(_425, _427);
    float _431 = fma(_115, 3.0, _161);
    float _433 = abs(_161);
    float _435 = precise::max(_433, _429);
    float _437 = 1.0 / _423;
    float _439 = 1.0 / _435;
    float _441 = fma(_107, 3.0, _127);
    float _443 = fma(_109, 3.0, _145);
    float _445 = fma(_107, 3.0, _129);
    float _447 = _411 * _437;
    float _449 = fma(_109, 3.0, _147);
    float _451 = _409 * _437;
    float _453 = _413 * _437;
    float _455 = _127 * _439;
    float _457 = _145 * _439;
    float _459 = _161 * _439;
    float _461 = abs(_441);
    float _463 = abs(_443);
    float _465 = precise::max(_461, _463);
    float _467 = abs(_431);
    float _469 = precise::max(_467, _465);
    float _471 = abs(_129);
    float _473 = abs(_147);
    float _475 = precise::max(_471, _473);
    float _477 = abs(_163);
    float _479 = precise::max(_477, _475);
    float _481 = 1.0 / _469;
    float _483 = 1.0 / _479;
    float _485 = _441 * _481;
    float _487 = _443 * _481;
    float _489 = _431 * _481;
    float _491 = abs(_445);
    float _493 = abs(_449);
    float _495 = precise::max(_491, _493);
    float _497 = _129 * _483;
    float _499 = fma(_115, 3.0, _163);
    float _501 = _147 * _483;
    float _503 = _163 * _483;
    float _505 = abs(_499);
    float _507 = precise::max(_505, _495);
    float _509 = 1.0 / _507;
    float3 _1996 = float3(_455, _457, _459);
    float _511 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1996, float3(0.0), isnan(_1996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1996, float3(0.0), isnan(_1996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2007 = float3(_497, _501, _503);
    float _513 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2007, float3(0.0), isnan(_2007)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2007, float3(0.0), isnan(_2007)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _515 = _445 * _509;
    float _517 = _449 * _509;
    float _519 = _499 * _509;
    float3 _2027 = float3(_329, _321, _317);
    float _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2027, float3(0.0), isnan(_2027)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2027, float3(0.0), isnan(_2027)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2038 = float3(_451, _447, _453);
    float _523 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2038, float3(0.0), isnan(_2038)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2038, float3(0.0), isnan(_2038)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2049 = float3(_485, _487, _489);
    float _525 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2049, float3(0.0), isnan(_2049)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2049, float3(0.0), isnan(_2049)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _2060 = float3(_515, _517, _519);
    float _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2060, float3(0.0), isnan(_2060)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2060, float3(0.0), isnan(_2060)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float _529 = precise::max(_233, _235);
    float _531 = precise::max(_237, _239);
    float _533 = precise::min(_237, _239);
    float _535 = precise::max(_529, _531);
    float _537 = precise::min(_233, _235);
    float _539 = precise::min(_537, _533);
    float _541 = precise::max(_377, _399);
    float _543 = precise::max(_401, _403);
    float _545 = precise::max(_405, _407);
    float _547 = precise::min(_401, _403);
    float _549 = precise::max(_543, _545);
    float _551 = precise::min(_405, _407);
    float _553 = precise::min(_377, _399);
    float _555 = precise::min(_547, _551);
    float _557 = precise::max(_511, _513);
    float _559 = precise::min(_511, _513);
    float _561 = precise::max(_541, _557);
    float _563 = precise::min(_553, _559);
    float _565 = precise::max(_561, _535);
    float _567 = precise::min(_563, _539);
    float _569 = precise::max(_521, _523);
    float _571 = precise::max(_525, _527);
    float _573 = precise::min(_521, _523);
    float _575 = precise::min(_525, _527);
    float _577 = precise::max(_569, _571);
    float _579 = precise::min(_573, _575);
    float _581 = precise::max(_549, _577);
    float _583 = precise::min(_555, _579);
    float _585 = precise::max(_565, _581);
    float _587 = precise::min(_567, _583);
    float _589 = _585 * 127.0;
    float _591 = _587 * 127.0;
    float _593 = trunc(_589);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = trunc(_591);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    bool _608 = _598 > _604;
    int _611 = int(_604) << 8;
    int _613 = _611 & 65280;
    int _615 = 255 & int(_598);
    int _617 = _613 | _615;
    int _619 = as_type<int>(_565);
    int _621 = as_type<int>(_581);
    int _623 = as_type<int>(_559);
    if (!_608)
    {
        _619 = 0;
    }
    int _625 = _619;
    if (!_608)
    {
        _621 = 0;
        _623 = 0;
    }
    int _627 = _621;
    int _629 = _623;
    if (!_608)
    {
        out.m_36.x = as_type<float>(_617);
        out.m_36.y = as_type<float>(_625);
        out.m_36.z = as_type<float>(_627);
        out.m_36.w = as_type<float>(_629);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _631 = -_587;
    float _633 = _585 + _631;
    float _635 = -_587;
    float _637 = _511 + _635;
    float _639 = -_587;
    float _641 = _377 + _639;
    float _643 = -_587;
    float _645 = _399 + _643;
    float _647 = -_587;
    float _649 = _513 + _647;
    float _651 = 1.0 / _633;
    float _653 = -_587;
    float _655 = _233 + _653;
    float _657 = -_587;
    float _659 = _525 + _657;
    float _661 = -_587;
    float _663 = _235 + _661;
    float _665 = -_587;
    float _667 = _237 + _665;
    float _669 = -_587;
    float _671 = _527 + _669;
    float _673 = -_587;
    float _675 = _403 + _673;
    float _677 = -_587;
    float _679 = _239 + _677;
    float _681 = -_587;
    float _683 = _401 + _681;
    float _685 = -_587;
    float _687 = _405 + _685;
    float _689 = -_587;
    float _691 = _407 + _689;
    float _693 = -_587;
    float _695 = _521 + _693;
    float _697 = _637 * _651;
    float _699 = _641 * _651;
    float _701 = _645 * _651;
    float _703 = _649 * _651;
    float _705 = fma(_697, -1.99999904632568359375, 1.99999904632568359375);
    float _707 = fma(_697, -7.99999904632568359375, 7.99999904632568359375);
    float _709 = fma(_699, -1.99999904632568359375, 1.99999904632568359375);
    float _711 = fma(_699, -7.99999904632568359375, 7.99999904632568359375);
    float _713 = fma(_701, -1.99999904632568359375, 1.99999904632568359375);
    float _715 = fma(_701, -7.99999904632568359375, 7.99999904632568359375);
    float _717 = _655 * _651;
    float _719 = _659 * _651;
    float _721 = -_697;
    float _723 = _721 + 0.5;
    float _725 = -_699;
    float _727 = _725 + 0.5;
    float _729 = -_701;
    float _731 = _729 + 0.5;
    float _733 = trunc(_705);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = fma(_703, -1.99999904632568359375, 1.99999904632568359375);
    float _741 = fma(_703, -7.99999904632568359375, 7.99999904632568359375);
    float _743 = fma(_717, -1.99999904632568359375, 1.99999904632568359375);
    float _745 = fma(_717, -7.99999904632568359375, 7.99999904632568359375);
    float _747 = _663 * _651;
    float _749 = _667 * _651;
    float _751 = abs(_723);
    bool _753 = _751 >= 0.375;
    float _755 = trunc(_707);
    float _757 = precise::max(_755, 0.0);
    uint _759 = uint(_757);
    float _761 = fma(_747, -1.99999904632568359375, 1.99999904632568359375);
    float _763 = fma(_747, -7.99999904632568359375, 7.99999904632568359375);
    float _765 = fma(_749, -1.99999904632568359375, 1.99999904632568359375);
    float _767 = fma(_749, -7.99999904632568359375, 7.99999904632568359375);
    float _769 = _675 * _651;
    float _771 = abs(_727);
    bool _773 = _771 >= 0.375;
    float _775 = -_703;
    float _777 = _775 + 0.5;
    float _779 = trunc(_709);
    float _781 = precise::max(_779, 0.0);
    uint _783 = uint(_781);
    float _785 = abs(_731);
    bool _787 = _785 >= 0.375;
    float _789 = -_717;
    float _791 = _789 + 0.5;
    float _793 = _679 * _651;
    float _795 = _683 * _651;
    float _797 = fma(_769, -1.99999904632568359375, 1.99999904632568359375);
    float _799 = -_747;
    float _801 = _799 + 0.5;
    float _803 = -_749;
    float _805 = _803 + 0.5;
    float _807 = trunc(_711);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    float _813 = fma(_793, -1.99999904632568359375, 1.99999904632568359375);
    float _815 = fma(_793, -7.99999904632568359375, 7.99999904632568359375);
    float _817 = fma(_795, -1.99999904632568359375, 1.99999904632568359375);
    float _819 = fma(_795, -7.99999904632568359375, 7.99999904632568359375);
    float _821 = _687 * _651;
    float _823 = abs(_777);
    bool _825 = _823 >= 0.375;
    float _827 = fma(_769, -7.99999904632568359375, 7.99999904632568359375);
    float _829 = trunc(_713);
    float _831 = precise::max(_829, 0.0);
    uint _833 = uint(_831);
    float _835 = abs(_791);
    bool _837 = _835 >= 0.375;
    float _839 = -_587;
    float _841 = _523 + _839;
    float _843 = _691 * _651;
    float _845 = -_769;
    float _847 = _845 + 0.5;
    float _849 = abs(_801);
    bool _851 = _849 >= 0.375;
    float _853 = -_793;
    float _855 = _853 + 0.5;
    float _857 = abs(_805);
    bool _859 = _857 >= 0.375;
    float _861 = trunc(_715);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    float _867 = -_795;
    float _869 = _867 + 0.5;
    float _871 = fma(_821, -1.99999904632568359375, 1.99999904632568359375);
    float _873 = _695 * _651;
    float _875 = _841 * _651;
    float _877 = fma(_821, -7.99999904632568359375, 7.99999904632568359375);
    float _879 = fma(_843, -1.99999904632568359375, 1.99999904632568359375);
    float _881 = fma(_843, -7.99999904632568359375, 7.99999904632568359375);
    float _883 = trunc(_739);
    float _885 = precise::max(_883, 0.0);
    uint _887 = uint(_885);
    int _889 = int(_737);
    int _891 = int(_783);
    int _893 = int(_833);
    int _895 = int(_887);
    if (!_753)
    {
        int _897 = int(_759) + 1;
        _889 = _897;
    }
    int _899 = _889;
    float _901 = fma(_873, -1.99999904632568359375, 1.99999904632568359375);
    if (!_773)
    {
        int _903 = int(_811) + 1;
        _891 = _903;
    }
    int _905 = _891;
    float _907 = fma(_873, -7.99999904632568359375, 7.99999904632568359375);
    float _909 = abs(_847);
    bool _911 = _909 >= 0.375;
    float _913 = fma(_875, -7.99999904632568359375, 7.99999904632568359375);
    float _915 = abs(_855);
    bool _917 = _915 >= 0.375;
    float _919 = trunc(_741);
    float _921 = precise::max(_919, 0.0);
    uint _923 = uint(_921);
    if (!_787)
    {
        int _925 = int(_865) + 1;
        _893 = _925;
    }
    int _927 = _893;
    float _929 = -_821;
    float _931 = _929 + 0.5;
    float _933 = abs(_869);
    bool _935 = _933 >= 0.375;
    float _937 = -_843;
    float _939 = _937 + 0.5;
    float _941 = _671 * _651;
    float _943 = fma(_875, -1.99999904632568359375, 1.99999904632568359375);
    float _945 = fma(_719, -1.99999904632568359375, 1.99999904632568359375);
    float _947 = trunc(_743);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    float _953 = -_873;
    float _955 = _953 + 0.5;
    float _957 = -_875;
    float _959 = _957 + 0.5;
    float _961 = fma(_719, -7.99999904632568359375, 7.99999904632568359375);
    float _963 = fma(_941, -1.99999904632568359375, 1.99999904632568359375);
    float _965 = fma(_941, -7.99999904632568359375, 7.99999904632568359375);
    float _967 = -_719;
    float _969 = _967 + 0.5;
    float _971 = -_941;
    float _973 = _971 + 0.5;
    float _975 = trunc(_745);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    int _981 = int(_951);
    if (!_825)
    {
        int _983 = int(_923) + 1;
        _895 = _983;
    }
    int _985 = _895;
    float _987 = abs(_931);
    bool _989 = _987 >= 0.375;
    int _991 = _927 << 3;
    int _993 = _985 << 9;
    float _995 = trunc(_761);
    float _997 = precise::max(_995, 0.0);
    uint _999 = uint(_997);
    int _1001 = _905 | _991;
    float _1003 = trunc(_763);
    float _1005 = precise::max(_1003, 0.0);
    uint _1007 = uint(_1005);
    int _1009 = int(_999);
    if (!_837)
    {
        int _1011 = int(_979) + 1;
        _981 = _1011;
    }
    int _1013 = _981;
    float _1015 = abs(_939);
    bool _1017 = _1015 >= 0.375;
    int _1019 = _1013 << 12;
    float _1021 = trunc(_765);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    float _1027 = trunc(_767);
    float _1029 = precise::max(_1027, 0.0);
    uint _1031 = uint(_1029);
    int _1033 = int(_1025);
    if (!_851)
    {
        int _1035 = int(_1007) + 1;
        _1009 = _1035;
    }
    int _1037 = _1009;
    float _1039 = abs(_955);
    bool _1041 = _1039 >= 0.375;
    int _1043 = _1037 << 15;
    float _1045 = trunc(_797);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = trunc(_827);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    int _1057 = int(_1049);
    if (!_859)
    {
        int _1059 = int(_1031) + 1;
        _1033 = _1059;
    }
    int _1061 = _1033;
    float _1063 = abs(_959);
    bool _1065 = _1063 >= 0.375;
    float _1067 = trunc(_813);
    float _1069 = precise::max(_1067, 0.0);
    uint _1071 = uint(_1069);
    float _1073 = trunc(_815);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    int _1079 = int(_1071);
    if (!_911)
    {
        int _1081 = int(_1055) + 1;
        _1057 = _1081;
    }
    int _1083 = _1057;
    float _1085 = trunc(_817);
    float _1087 = precise::max(_1085, 0.0);
    uint _1089 = uint(_1087);
    float _1091 = trunc(_819);
    float _1093 = precise::max(_1091, 0.0);
    uint _1095 = uint(_1093);
    int _1097 = int(_1089);
    if (!_917)
    {
        int _1099 = int(_1077) + 1;
        _1079 = _1099;
    }
    int _1101 = _1079;
    float _1103 = abs(_969);
    bool _1105 = _1103 >= 0.375;
    int _1107 = _1101 << 21;
    float _1109 = trunc(_871);
    float _1111 = precise::max(_1109, 0.0);
    uint _1113 = uint(_1111);
    float _1115 = trunc(_877);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    int _1121 = int(_1113);
    if (!_935)
    {
        int _1123 = int(_1095) + 1;
        _1097 = _1123;
    }
    int _1125 = _1097;
    float _1127 = abs(_973);
    bool _1129 = _1127 >= 0.375;
    int _1131 = _1083 << 3;
    float _1133 = trunc(_879);
    float _1135 = precise::max(_1133, 0.0);
    uint _1137 = uint(_1135);
    int _1139 = _1125 | _1131;
    int _1141 = _899 << 6;
    int _1143 = _1001 | _1141;
    int _1145 = _993 | _1143;
    float _1147 = trunc(_881);
    float _1149 = precise::max(_1147, 0.0);
    uint _1151 = uint(_1149);
    int _1153 = int(_1137);
    if (!_989)
    {
        int _1155 = int(_1119) + 1;
        _1121 = _1155;
    }
    int _1157 = _1121;
    int _1159 = _1145 | _1019;
    int _1161 = _1043 | _1159;
    int _1163 = _1157 << 6;
    float _1165 = trunc(_901);
    float _1167 = precise::max(_1165, 0.0);
    uint _1169 = uint(_1167);
    float _1171 = trunc(_907);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    int _1177 = int(_1169);
    if (!_1017)
    {
        int _1179 = int(_1151) + 1;
        _1153 = _1179;
    }
    int _1181 = _1153;
    int _1183 = _1181 << 9;
    float _1185 = trunc(_943);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    int _1191 = _1139 | _1163;
    int _1193 = _1183 | _1191;
    float _1195 = trunc(_913);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    int _1201 = int(_1189);
    if (!_1041)
    {
        int _1203 = int(_1175) + 1;
        _1177 = _1203;
    }
    int _1205 = _1177;
    int _1207 = _1205 << 12;
    float _1209 = trunc(_945);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    float _1215 = trunc(_961);
    float _1217 = precise::max(_1215, 0.0);
    uint _1219 = uint(_1217);
    int _1221 = int(_1213);
    if (!_1065)
    {
        int _1223 = int(_1199) + 1;
        _1201 = _1223;
    }
    int _1225 = _1201;
    int _1227 = _1225 << 15;
    float _1229 = trunc(_963);
    float _1231 = precise::max(_1229, 0.0);
    uint _1233 = uint(_1231);
    int _1235 = _1193 | _1207;
    int _1237 = _1227 | _1235;
    int _1239 = _1061 << 18;
    int _1241 = _1161 | _1239;
    int _1243 = _1107 | _1241;
    float _1245 = trunc(_965);
    float _1247 = precise::max(_1245, 0.0);
    uint _1249 = uint(_1247);
    int _1251 = int(_1233);
    if (!_1105)
    {
        int _1253 = int(_1219) + 1;
        _1221 = _1253;
    }
    int _1255 = _1221;
    uint _1257 = uint(int(uint(_1243) >> uint(16)));
    int _1259 = _1255 << 18;
    int _1261 = _1243 & 65535;
    if (!_1129)
    {
        int _1263 = int(_1249) + 1;
        _1251 = _1263;
    }
    int _1265 = _1251;
    int _1267 = _1265 << 21;
    int _1269 = _1237 | _1259;
    int _1271 = _1267 | _1269;
    int _1273 = _1271 << 8;
    uint _1275 = uint(int(uint(_1271) >> uint(8)));
    int _1277 = 65280 & _1273;
    int _1279 = int(_1257) | _1277;
    out.m_36.x = as_type<float>(_617);
    out.m_36.y = as_type<float>(_1261);
    out.m_36.z = as_type<float>(_1279);
    out.m_36.w = as_type<float>(_1275);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

