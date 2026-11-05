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
    float2 _1877 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1877, float2(0.0), isnan(_1877)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1877, float2(0.0), isnan(_1877)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _1896 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1896, float2(0.0), isnan(_1896)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1896, float2(0.0), isnan(_1896)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _1911 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1911, float2(0.0), isnan(_1911)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1911, float2(0.0), isnan(_1911)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1927 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1927, float2(0.0), isnan(_1927)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1927, float2(0.0), isnan(_1927)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1942 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1942, float2(0.0), isnan(_1942))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _65 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _103 = _73 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _105 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _107 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _109 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].x, _101);
    float _111 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _113 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _105);
    float _115 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _107);
    float _117 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].z, _109);
    float _119 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].z, _111);
    float _121 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _113);
    float _125 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _115);
    float _127 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _129 = precise::max(_117, _119);
    float _131 = precise::max(_123, _125);
    float _133 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _135 = precise::min(_117, _119);
    float _137 = precise::min(_123, _125);
    float _139 = precise::max(_131, _129);
    float _141 = precise::min(_137, _135);
    float _143 = precise::max(_133, _139);
    float _145 = precise::min(_133, _141);
    float _147 = _143 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _149 = -_145;
    float _151 = _143 + _149;
    float _153 = precise::max(_147, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _157 = _151 >= _153;
    bool _159 = isnan(_151);
    bool _161 = _157 || _159;
    bool _163 = isnan(_153);
    bool _165 = _161 || _163;
    if (!_165)
    {
        float2 _2082 = float2(_55, _57);
        float4 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2082, float2(0.0), isnan(_2082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2082, float2(0.0), isnan(_2082))).xyzw;
        float _170 = _168.x;
        float _172 = _168.y;
        float _174 = _168.z;
        float _176 = _168.w;
        out.m_32.x = _170;
        out.m_32.y = _172;
        out.m_32.z = _174;
        out.m_32.w = _176;
        return out;
    }
    float2 _2108 = float2(_55, _57);
    float3 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2108, float2(0.0), isnan(_2108)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2108, float2(0.0), isnan(_2108)), int2(1, -1)).xyz;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float2 _2123 = float2(_55, _57);
    float3 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2123, float2(0.0), isnan(_2123)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2123, float2(0.0), isnan(_2123)), int2(-1, 1)).xyz;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _117 + _125;
    float _196 = _119 + _123;
    float _198 = fma(_133, -2.0, _196);
    float _200 = _182 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _202 = _190 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _204 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[2].x, _202);
    float _208 = fma(_133, -2.0, _194);
    float _210 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
    float _212 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[2].z, _206);
    float _214 = _125 + _210;
    float _216 = _125 + _212;
    float _218 = _117 + _210;
    float _220 = fma(_123, -2.0, _214);
    float _222 = fma(_125, -2.0, _216);
    float _224 = _117 + _212;
    float _226 = abs(_208);
    float _228 = abs(_220);
    float _230 = fma(_226, 2.0, _228);
    float _232 = abs(_198);
    float _234 = abs(_222);
    float _236 = fma(_232, 2.0, _234);
    float _238 = fma(_119, -2.0, _224);
    float _240 = fma(_117, -2.0, _218);
    float _242 = abs(_238);
    float _244 = _242 + _230;
    float _246 = abs(_240);
    float _248 = _246 + _236;
    bool _250 = _248 >= _244;
    float _252 = float(_250);
    bool _254 = _248 < _244;
    bool _256 = isnan(_248);
    bool _258 = _254 || _256;
    bool _260 = isnan(_244);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = _123 * _252;
    float _268 = _119 * _252;
    float _270 = _252 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _272 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _274 = fma(_125, _264, _266);
    float _276 = fma(_117, _264, _268);
    float _278 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
    float _280 = _252 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _282 = -_133;
    float _284 = _282 + _274;
    float _286 = -_133;
    float _288 = _286 + _276;
    float _290 = abs(_284);
    float _292 = abs(_288);
    bool _294 = _290 >= _292;
    float _296 = -_278;
    float _298 = _294 ? _296 : _278;
    float _300 = _298 * 0.5;
    float _302 = fma(_264, _300, _55);
    float _304 = fma(_252, _300, _57);
    float _306 = -_280;
    float _308 = _306 + _302;
    float _310 = -_272;
    float _312 = _310 + _304;
    float _314 = _280 + _302;
    float _316 = _272 + _304;
    float2 _2329 = float2(_308, _312);
    float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2329, float2(0.0), isnan(_2329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2329, float2(0.0), isnan(_2329))).xyz;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float2 _2343 = float2(_314, _316);
    float3 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2343, float2(0.0), isnan(_2343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2343, float2(0.0), isnan(_2343))).xyz;
    float _328 = _326.x;
    float _330 = _326.y;
    float _332 = _326.z;
    float _334 = 1.0 / _151;
    float _336 = _196 + _194;
    float _338 = _218 + _216;
    float _340 = _294 ? _274 : _276;
    float _342 = abs(_284);
    float _344 = abs(_288);
    float _346 = _294 ? _342 : _344;
    float _348 = fma(_336, 2.0, _338);
    float _350 = fma(_348, -0.083333335816860198974609375, _133);
    float _352 = abs(_350);
    float _354 = _352 * _334;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = fma(_356, 6.0, -15.0);
    float _360 = _356 * _356;
    float _362 = fma(_356, _358, 10.0);
    float _364 = _362 * _360;
    float _366 = _356 * _364;
    float _368 = _322 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _370 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[2].x, _368);
    float _372 = _133 + _340;
    float _374 = _330 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _376 = _346 * 0.25;
    float _378 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[2].z, _370);
    float _380 = _372 * 0.5;
    float _382 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[2].x, _374);
    float _384 = -_380;
    float _386 = _384 + _378;
    float _388 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[2].z, _382);
    float _390 = abs(_386);
    bool _392 = _390 >= _376;
    float _394 = -_380;
    float _396 = _394 + _388;
    float _398 = abs(_396);
    bool _400 = _398 >= _376;
    bool _402 = !_400;
    int _405 = _402 ? 0 : 1;
    int _407 = as_type<int>(_370);
    float _409 = _308;
    float _411 = _312;
    int _413 = as_type<int>(_388);
    float _415 = _386;
    int _417 = _405;
    float _419 = _314;
    float _421 = _316;
    int _423 = as_type<int>(_194);
    float _425 = _396;
    float _427 = _346;
    int _429 = _400 ? (-1) : 0;
    if (_392)
    {
        bool _431 = !_392;
        int _433 = _431 ? 0 : 1;
        _407 = _433;
    }
    int _435 = _407;
    int _437 = _435;
    if (!_392)
    {
        float _439 = -_280;
        float _441 = _439 + _308;
        float _443 = -_272;
        float _445 = _443 + _312;
        float2 _2507 = float2(_441, _445);
        float3 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2507, float2(0.0), isnan(_2507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2507, float2(0.0), isnan(_2507))).xyz;
        float _449 = _447.x;
        float _451 = _447.y;
        float _453 = _447.z;
        float _455 = _451 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _457 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[2].x, _455);
        float _459 = fma(_453, (*spvDescriptorSet0.fp_c3)._m0[2].z, _457);
        float _461 = -_380;
        float _463 = _461 + _459;
        float _465 = abs(_463);
        bool _467 = _465 >= _376;
        bool _469 = !_467;
        int _471 = _469 ? 0 : 1;
        _437 = _471;
        _409 = _441;
        _411 = _445;
        _413 = as_type<int>(_459);
        _415 = _463;
    }
    int _473 = _437;
    float _475 = _409;
    float _477 = _411;
    int _479 = _413;
    float _481 = _415;
    int _483 = _479;
    int _485 = _473;
    float _487 = _475;
    float _489 = _477;
    float _491 = _481;
    if (!_400)
    {
        float _493 = _280 + _314;
        float _495 = _272 + _316;
        float2 _2575 = float2(_493, _495);
        float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2575, float2(0.0), isnan(_2575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2575, float2(0.0), isnan(_2575))).xyz;
        float _499 = _497.x;
        float _501 = _497.y;
        float _503 = _497.z;
        float _505 = _501 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _507 = fma(_499, (*spvDescriptorSet0.fp_c3)._m0[2].x, _505);
        float _509 = fma(_503, (*spvDescriptorSet0.fp_c3)._m0[2].z, _507);
        float _511 = -_380;
        float _513 = _511 + _509;
        float _515 = abs(_513);
        bool _517 = _515 >= _376;
        bool _519 = !_517;
        int _521 = _519 ? 0 : 1;
        _417 = _521;
        _419 = _493;
        _421 = _495;
        _423 = as_type<int>(_503);
        _425 = _513;
    }
    int _523 = _417;
    float _525 = _419;
    float _527 = _421;
    int _529 = _423;
    float _531 = _425;
    int _533 = _473 & 1;
    bool _535 = _533 != 0;
    int _537 = _529;
    float _539 = _525;
    float _541 = _527;
    float _543 = _531;
    if (!_535)
    {
        float _545 = -_280;
        float _547 = _545 + _475;
        float _549 = -_272;
        float _551 = _549 + _477;
        float2 _2650 = float2(_547, _551);
        float3 _553 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2650, float2(0.0), isnan(_2650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2650, float2(0.0), isnan(_2650))).xyz;
        float _555 = _553.x;
        float _557 = _553.y;
        float _559 = _553.z;
        float _561 = _557 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _563 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[2].x, _561);
        float _565 = fma(_559, (*spvDescriptorSet0.fp_c3)._m0[2].z, _563);
        float _567 = -_380;
        float _569 = _567 + _565;
        float _571 = abs(_569);
        bool _573 = _571 >= _376;
        bool _575 = !_573;
        int _577 = _575 ? 0 : 1;
        _483 = as_type<int>(_565);
        _485 = _577;
        _487 = _547;
        _489 = _551;
        _491 = _569;
    }
    int _579 = _483;
    int _581 = _485;
    float _583 = _487;
    float _585 = _489;
    float _587 = _491;
    int _589 = _523 & 1;
    bool _591 = _589 != 0;
    int _593 = _579;
    int _595 = _581;
    float _597 = _583;
    float _599 = _585;
    float _601 = _587;
    if (_591)
    {
        _537 = _523;
    }
    int _603 = _537;
    int _605 = _603;
    if (!_591)
    {
        float _607 = _280 + _525;
        float _609 = _272 + _527;
        float2 _2728 = float2(_607, _609);
        float3 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2728, float2(0.0), isnan(_2728))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2728, float2(0.0), isnan(_2728))).xyz;
        float _613 = _611.x;
        float _615 = _611.y;
        float _617 = _611.z;
        float _619 = _615 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _621 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[2].x, _619);
        float _623 = fma(_617, (*spvDescriptorSet0.fp_c3)._m0[2].z, _621);
        float _625 = -_380;
        float _627 = _625 + _623;
        float _629 = abs(_627);
        bool _631 = _629 >= _376;
        bool _633 = !_631;
        int _635 = _633 ? 0 : 1;
        _593 = as_type<int>(_613);
        _605 = _635;
        _539 = _607;
        _541 = _609;
        _543 = _627;
    }
    int _637 = _593;
    int _639 = _605;
    float _641 = _539;
    float _643 = _541;
    float _645 = _543;
    int _647 = _581 & 1;
    bool _649 = _647 != 0;
    int _651 = _637;
    int _653 = _639;
    float _655 = _641;
    float _657 = _643;
    float _659 = _645;
    if (!_649)
    {
        float _661 = -_280;
        float _663 = _661 + _583;
        float _665 = -_272;
        float _667 = _665 + _585;
        float2 _2804 = float2(_663, _667);
        float3 _669 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2804, float2(0.0), isnan(_2804))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2804, float2(0.0), isnan(_2804))).xyz;
        float _671 = _669.x;
        float _673 = _669.y;
        float _675 = _669.z;
        float _677 = _673 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _679 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[2].x, _677);
        float _681 = fma(_675, (*spvDescriptorSet0.fp_c3)._m0[2].z, _679);
        float _683 = -_380;
        float _685 = _683 + _681;
        float _687 = abs(_685);
        bool _689 = _687 >= _376;
        bool _691 = !_689;
        int _693 = _691 ? 0 : 1;
        _651 = as_type<int>(_671);
        _595 = _693;
        _597 = _663;
        _599 = _667;
        _601 = _685;
    }
    int _695 = _651;
    int _697 = _595;
    float _699 = _597;
    float _701 = _599;
    float _703 = _601;
    int _705 = _639 & 1;
    bool _707 = _705 != 0;
    int _709 = _695;
    int _711 = _697;
    float _713 = _699;
    float _715 = _701;
    float _717 = _703;
    if (!_707)
    {
        float _719 = _280 + _641;
        float _721 = _272 + _643;
        float2 _2876 = float2(_719, _721);
        float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2876, float2(0.0), isnan(_2876))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2876, float2(0.0), isnan(_2876))).xyz;
        float _725 = _723.x;
        float _727 = _723.y;
        float _729 = _723.z;
        float _731 = _727 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _733 = fma(_725, (*spvDescriptorSet0.fp_c3)._m0[2].x, _731);
        float _735 = fma(_729, (*spvDescriptorSet0.fp_c3)._m0[2].z, _733);
        float _737 = -_380;
        float _739 = _737 + _735;
        float _741 = abs(_739);
        bool _743 = _741 >= _376;
        bool _745 = !_743;
        int _747 = _745 ? 0 : 1;
        _709 = as_type<int>(_725);
        _653 = _747;
        _655 = _719;
        _657 = _721;
        _659 = _739;
    }
    int _749 = _709;
    int _751 = _653;
    float _753 = _655;
    float _755 = _657;
    float _757 = _659;
    int _759 = _697 & 1;
    bool _761 = _759 != 0;
    int _763 = _749;
    int _765 = _751;
    float _767 = _753;
    float _769 = _755;
    float _771 = _757;
    if (!_761)
    {
        float _773 = -_280;
        float _775 = _773 + _699;
        float _777 = -_272;
        float _779 = _777 + _701;
        float2 _2952 = float2(_775, _779);
        float3 _781 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2952, float2(0.0), isnan(_2952))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2952, float2(0.0), isnan(_2952))).xyz;
        float _783 = _781.x;
        float _785 = _781.y;
        float _787 = _781.z;
        float _789 = _785 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _791 = fma(_783, (*spvDescriptorSet0.fp_c3)._m0[2].x, _789);
        float _793 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[2].z, _791);
        float _795 = -_380;
        float _797 = _795 + _793;
        float _799 = abs(_797);
        bool _801 = _799 >= _376;
        bool _803 = !_801;
        int _805 = _803 ? 0 : 1;
        _763 = as_type<int>(_783);
        _711 = _805;
        _713 = _775;
        _715 = _779;
        _717 = _797;
    }
    int _807 = _763;
    int _809 = _711;
    float _811 = _713;
    float _813 = _715;
    float _815 = _717;
    int _817 = _751 & 1;
    bool _819 = _817 != 0;
    int _821 = _807;
    int _823 = _809;
    float _825 = _811;
    float _827 = _813;
    float _829 = _815;
    if (!_819)
    {
        float _831 = _280 + _753;
        float _833 = _272 + _755;
        float2 _3024 = float2(_831, _833);
        float3 _835 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3024, float2(0.0), isnan(_3024))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3024, float2(0.0), isnan(_3024))).xyz;
        float _837 = _835.x;
        float _839 = _835.y;
        float _841 = _835.z;
        float _843 = _839 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _845 = fma(_837, (*spvDescriptorSet0.fp_c3)._m0[2].x, _843);
        float _847 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[2].z, _845);
        float _849 = -_380;
        float _851 = _849 + _847;
        float _853 = abs(_851);
        bool _855 = _853 >= _376;
        bool _857 = !_855;
        int _859 = _857 ? 0 : 1;
        _821 = as_type<int>(_837);
        _765 = _859;
        _767 = _831;
        _769 = _833;
        _771 = _851;
    }
    int _861 = _821;
    int _863 = _765;
    float _865 = _767;
    float _867 = _769;
    float _869 = _771;
    int _871 = _809 & 1;
    bool _873 = _871 != 0;
    int _875 = _861;
    int _877 = _863;
    float _879 = _865;
    float _881 = _867;
    float _883 = _869;
    if (!_873)
    {
        float _885 = -_280;
        float _887 = _885 + _811;
        float _889 = -_272;
        float _891 = _889 + _813;
        float2 _3100 = float2(_887, _891);
        float3 _893 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3100, float2(0.0), isnan(_3100))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3100, float2(0.0), isnan(_3100))).xyz;
        float _895 = _893.x;
        float _897 = _893.y;
        float _899 = _893.z;
        float _901 = _897 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _903 = fma(_895, (*spvDescriptorSet0.fp_c3)._m0[2].x, _901);
        float _905 = fma(_899, (*spvDescriptorSet0.fp_c3)._m0[2].z, _903);
        float _907 = -_380;
        float _909 = _907 + _905;
        float _911 = abs(_909);
        bool _913 = _911 >= _376;
        bool _915 = !_913;
        int _917 = _915 ? 0 : 1;
        _875 = as_type<int>(_895);
        _823 = _917;
        _825 = _887;
        _827 = _891;
        _829 = _909;
    }
    int _919 = _875;
    int _921 = _823;
    float _923 = _825;
    float _925 = _827;
    float _927 = _829;
    int _929 = _863 & 1;
    bool _931 = _929 != 0;
    int _933 = _919;
    int _935 = _921;
    float _937 = _923;
    float _939 = _925;
    float _941 = _927;
    if (!_931)
    {
        float _943 = _280 + _865;
        float _945 = _272 + _867;
        float2 _3172 = float2(_943, _945);
        float3 _947 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3172, float2(0.0), isnan(_3172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3172, float2(0.0), isnan(_3172))).xyz;
        float _949 = _947.x;
        float _951 = _947.y;
        float _953 = _947.z;
        float _955 = _951 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _957 = fma(_949, (*spvDescriptorSet0.fp_c3)._m0[2].x, _955);
        float _959 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[2].z, _957);
        float _961 = -_380;
        float _963 = _961 + _959;
        float _965 = abs(_963);
        bool _967 = _965 >= _376;
        bool _969 = !_967;
        int _971 = _969 ? 0 : 1;
        _933 = as_type<int>(_949);
        _877 = _971;
        _879 = _943;
        _881 = _945;
        _883 = _963;
    }
    int _973 = _933;
    int _975 = _877;
    float _977 = _879;
    float _979 = _881;
    float _981 = _883;
    int _983 = _921 & 1;
    bool _985 = _983 != 0;
    int _987 = _973;
    int _989 = _975;
    float _991 = _977;
    float _993 = _979;
    float _995 = _981;
    if (!_985)
    {
        float _997 = fma(_280, -1.5, _923);
        float _999 = fma(_272, -1.5, _925);
        float2 _3245 = float2(_997, _999);
        float3 _1001 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3245, float2(0.0), isnan(_3245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3245, float2(0.0), isnan(_3245))).xyz;
        float _1003 = _1001.x;
        float _1005 = _1001.y;
        float _1007 = _1001.z;
        float _1009 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1011 = fma(_1003, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1009);
        float _1013 = fma(_1007, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1011);
        float _1015 = -_380;
        float _1017 = _1015 + _1013;
        float _1019 = abs(_1017);
        bool _1021 = _1019 >= _376;
        bool _1023 = !_1021;
        int _1025 = _1023 ? 0 : 1;
        _987 = as_type<int>(_1003);
        _935 = _1025;
        _937 = _997;
        _939 = _999;
        _941 = _1017;
    }
    int _1027 = _987;
    int _1029 = _935;
    float _1031 = _937;
    float _1033 = _939;
    float _1035 = _941;
    int _1037 = _975 & 1;
    bool _1039 = _1037 != 0;
    int _1041 = _1027;
    int _1043 = _1029;
    float _1045 = _1031;
    float _1047 = _1033;
    float _1049 = _1035;
    if (!_1039)
    {
        float _1051 = fma(_280, 1.5, _977);
        float _1053 = fma(_272, 1.5, _979);
        float2 _3318 = float2(_1051, _1053);
        float3 _1055 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3318, float2(0.0), isnan(_3318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3318, float2(0.0), isnan(_3318))).xyz;
        float _1057 = _1055.x;
        float _1059 = _1055.y;
        float _1061 = _1055.z;
        float _1063 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1065 = fma(_1057, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1063);
        float _1067 = fma(_1061, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1065);
        float _1069 = -_380;
        float _1071 = _1069 + _1067;
        float _1073 = abs(_1071);
        bool _1075 = _1073 >= _376;
        bool _1077 = !_1075;
        int _1079 = _1077 ? 0 : 1;
        _1041 = as_type<int>(_1057);
        _989 = _1079;
        _991 = _1051;
        _993 = _1053;
        _995 = _1071;
    }
    int _1081 = _1041;
    int _1083 = _989;
    float _1085 = _991;
    float _1087 = _993;
    float _1089 = _995;
    int _1091 = _1029 & 1;
    bool _1093 = _1091 != 0;
    int _1095 = _1081;
    int _1097 = _1083;
    float _1099 = _1085;
    float _1101 = _1087;
    float _1103 = _1089;
    if (!_1093)
    {
        float _1105 = fma(_280, -2.0, _1031);
        float _1107 = fma(_272, -2.0, _1033);
        float2 _3390 = float2(_1105, _1107);
        float3 _1109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3390, float2(0.0), isnan(_3390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3390, float2(0.0), isnan(_3390))).xyz;
        float _1111 = _1109.x;
        float _1113 = _1109.y;
        float _1115 = _1109.z;
        float _1117 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1119 = fma(_1111, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1117);
        float _1121 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1119);
        float _1123 = -_380;
        float _1125 = _1123 + _1121;
        float _1127 = abs(_1125);
        bool _1129 = _1127 >= _376;
        bool _1131 = !_1129;
        int _1133 = _1131 ? 0 : 1;
        _1095 = as_type<int>(_1111);
        _1043 = _1133;
        _1045 = _1105;
        _1047 = _1107;
        _1049 = _1125;
    }
    int _1135 = _1095;
    int _1137 = _1043;
    float _1139 = _1045;
    float _1141 = _1047;
    float _1143 = _1049;
    int _1145 = _1083 & 1;
    bool _1147 = _1145 != 0;
    int _1149 = _1135;
    int _1151 = _1137;
    float _1153 = _1139;
    float _1155 = _1141;
    float _1157 = _1143;
    if (!_1147)
    {
        float _1159 = fma(_280, 2.0, _1085);
        float _1161 = fma(_272, 2.0, _1087);
        float2 _3462 = float2(_1159, _1161);
        float3 _1163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3462, float2(0.0), isnan(_3462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3462, float2(0.0), isnan(_3462))).xyz;
        float _1165 = _1163.x;
        float _1167 = _1163.y;
        float _1169 = _1163.z;
        float _1171 = _1167 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1173 = fma(_1165, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1171);
        float _1175 = fma(_1169, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1173);
        float _1177 = -_380;
        float _1179 = _1177 + _1175;
        float _1181 = abs(_1179);
        bool _1183 = _1181 >= _376;
        bool _1185 = !_1183;
        int _1187 = _1185 ? 0 : 1;
        _1149 = as_type<int>(_1165);
        _1097 = _1187;
        _1099 = _1159;
        _1101 = _1161;
        _1103 = _1179;
    }
    int _1189 = _1149;
    int _1191 = _1097;
    float _1193 = _1099;
    float _1195 = _1101;
    float _1197 = _1103;
    int _1199 = _1137 & 1;
    bool _1201 = _1199 != 0;
    int _1203 = _1189;
    int _1205 = _1191;
    float _1207 = _1193;
    float _1209 = _1195;
    float _1211 = _1197;
    if (!_1201)
    {
        float _1213 = fma(_280, -2.0, _1139);
        float _1215 = fma(_272, -2.0, _1141);
        float2 _3534 = float2(_1213, _1215);
        float3 _1217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3534, float2(0.0), isnan(_3534))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3534, float2(0.0), isnan(_3534))).xyz;
        float _1219 = _1217.x;
        float _1221 = _1217.y;
        float _1223 = _1217.z;
        float _1225 = _1221 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1227 = fma(_1219, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1225);
        float _1229 = fma(_1223, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1227);
        float _1231 = -_380;
        float _1233 = _1231 + _1229;
        float _1235 = abs(_1233);
        bool _1237 = _1235 >= _376;
        bool _1239 = !_1237;
        int _1241 = _1239 ? 0 : 1;
        _1203 = as_type<int>(_1219);
        _1151 = _1241;
        _1153 = _1213;
        _1155 = _1215;
        _1157 = _1233;
    }
    int _1243 = _1203;
    int _1245 = _1151;
    float _1247 = _1153;
    float _1249 = _1155;
    float _1251 = _1157;
    int _1253 = _1191 & 1;
    bool _1255 = _1253 != 0;
    int _1257 = _1243;
    int _1259 = _1245;
    float _1261 = _1247;
    float _1263 = _1249;
    float _1265 = _1251;
    if (!_1255)
    {
        float _1267 = fma(_280, 2.0, _1193);
        float _1269 = fma(_272, 2.0, _1195);
        float2 _3606 = float2(_1267, _1269);
        float3 _1271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3606, float2(0.0), isnan(_3606))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3606, float2(0.0), isnan(_3606))).xyz;
        float _1273 = _1271.x;
        float _1275 = _1271.y;
        float _1277 = _1271.z;
        float _1279 = _1275 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1281 = fma(_1273, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1279);
        float _1283 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1281);
        float _1285 = -_380;
        float _1287 = _1285 + _1283;
        float _1289 = abs(_1287);
        bool _1291 = _1289 >= _376;
        bool _1293 = !_1291;
        int _1295 = _1293 ? 0 : 1;
        _1257 = as_type<int>(_1273);
        _1205 = _1295;
        _1207 = _1267;
        _1209 = _1269;
        _1211 = _1287;
    }
    int _1297 = _1257;
    int _1299 = _1205;
    float _1301 = _1207;
    float _1303 = _1209;
    float _1305 = _1211;
    int _1307 = _1245 & 1;
    bool _1309 = _1307 != 0;
    int _1311 = _1297;
    int _1313 = _1299;
    float _1315 = _1301;
    float _1317 = _1303;
    float _1319 = _1305;
    if (!_1309)
    {
        float _1321 = fma(_280, -2.0, _1247);
        float _1323 = fma(_272, -2.0, _1249);
        float2 _3678 = float2(_1321, _1323);
        float3 _1325 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3678, float2(0.0), isnan(_3678))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3678, float2(0.0), isnan(_3678))).xyz;
        float _1327 = _1325.x;
        float _1329 = _1325.y;
        float _1331 = _1325.z;
        float _1333 = _1329 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1335 = fma(_1327, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1333);
        float _1337 = fma(_1331, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1335);
        float _1339 = -_380;
        float _1341 = _1339 + _1337;
        float _1343 = abs(_1341);
        bool _1345 = _1343 >= _376;
        bool _1347 = !_1345;
        int _1349 = _1347 ? 0 : 1;
        _1311 = as_type<int>(_1327);
        _1259 = _1349;
        _1261 = _1321;
        _1263 = _1323;
        _1265 = _1341;
    }
    int _1351 = _1311;
    int _1353 = _1259;
    float _1355 = _1261;
    float _1357 = _1263;
    float _1359 = _1265;
    int _1361 = _1299 & 1;
    bool _1363 = _1361 != 0;
    int _1365 = _1351;
    int _1367 = _1353;
    float _1369 = _1359;
    float _1371 = _1357;
    float _1373 = _1355;
    if (!_1363)
    {
        float _1375 = fma(_280, 2.0, _1301);
        float _1377 = fma(_272, 2.0, _1303);
        float2 _3750 = float2(_1375, _1377);
        float3 _1379 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3750, float2(0.0), isnan(_3750))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3750, float2(0.0), isnan(_3750))).xyz;
        float _1381 = _1379.x;
        float _1383 = _1379.y;
        float _1385 = _1379.z;
        float _1387 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1389 = fma(_1381, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1387);
        float _1391 = fma(_1385, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1389);
        float _1393 = -_380;
        float _1395 = _1393 + _1391;
        float _1397 = abs(_1395);
        bool _1399 = _1397 >= _376;
        bool _1401 = !_1399;
        int _1403 = _1401 ? 0 : 1;
        _1365 = as_type<int>(_1381);
        _1313 = _1403;
        _1315 = _1375;
        _1317 = _1377;
        _1319 = _1395;
    }
    int _1405 = _1365;
    int _1407 = _1313;
    float _1409 = _1315;
    float _1411 = _1317;
    float _1413 = _1319;
    int _1415 = _1353 & 1;
    bool _1417 = _1415 != 0;
    int _1419 = _1405;
    float _1421 = _1411;
    float _1423 = _1409;
    float _1425 = _1413;
    float _1427 = as_type<float>(_1407);
    if (!_1417)
    {
        float _1429 = fma(_280, -2.0, _1355);
        float _1431 = fma(_272, -2.0, _1357);
        float2 _3823 = float2(_1429, _1431);
        float3 _1433 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3823, float2(0.0), isnan(_3823))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3823, float2(0.0), isnan(_3823))).xyz;
        float _1435 = _1433.x;
        float _1437 = _1433.y;
        float _1439 = _1433.z;
        float _1441 = _1437 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1443 = fma(_1435, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1441);
        float _1445 = fma(_1439, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1443);
        float _1447 = -_380;
        float _1449 = _1447 + _1445;
        float _1451 = abs(_1449);
        bool _1453 = _1451 >= _376;
        bool _1455 = !_1453;
        int _1457 = _1455 ? 0 : 1;
        _1419 = as_type<int>(_1435);
        _1367 = _1457;
        _1369 = _1449;
        _1371 = _1431;
        _1373 = _1429;
    }
    int _1459 = _1419;
    int _1461 = _1367;
    float _1463 = _1369;
    float _1465 = _1371;
    float _1467 = _1373;
    int _1469 = _1407 & 1;
    bool _1471 = _1469 != 0;
    int _1473 = _1459;
    int _1475 = _1461;
    float _1477 = _1467;
    float _1479 = _1465;
    if (_1471)
    {
        _1473 = _1407;
    }
    int _1481 = _1473;
    int _1483 = _1481;
    if (!_1471)
    {
        float _1485 = fma(_280, 2.0, _1409);
        float _1487 = fma(_272, 2.0, _1411);
        float2 _3900 = float2(_1485, _1487);
        float3 _1489 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3900, float2(0.0), isnan(_3900))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3900, float2(0.0), isnan(_3900))).xyz;
        float _1491 = _1489.x;
        float _1493 = _1489.y;
        float _1495 = _1489.z;
        float _1497 = _1493 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1499 = fma(_1491, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1497);
        float _1501 = fma(_1495, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1499);
        float _1503 = -_380;
        float _1505 = _1503 + _1501;
        float _1507 = abs(_1505);
        bool _1509 = _1507 >= _376;
        bool _1511 = !_1509;
        int _1513 = _1511 ? 0 : 1;
        _1483 = _1513;
        _1421 = _1487;
        _1423 = _1485;
        _1425 = _1505;
    }
    int _1515 = _1483;
    float _1517 = _1421;
    float _1519 = _1423;
    float _1521 = _1425;
    int _1523 = _1461 & 1;
    bool _1525 = _1523 != 0;
    int _1527 = _1515;
    float _1529 = _1521;
    float _1531 = _1519;
    if (_1525)
    {
        _1427 = _1463;
    }
    float _1533 = _1427;
    float _1535 = _1533;
    if (_1525)
    {
        _427 = _1465;
    }
    float _1537 = _427;
    float _1539 = _1537;
    if (!_1525)
    {
        float _1541 = fma(_280, -4.0, _1467);
        float _1543 = fma(_272, -4.0, _1465);
        float2 _3980 = float2(_1541, _1543);
        float3 _1545 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3980, float2(0.0), isnan(_3980))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3980, float2(0.0), isnan(_3980))).xyz;
        float _1547 = _1545.x;
        float _1549 = _1545.y;
        float _1551 = _1545.z;
        float _1553 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1555 = fma(_1547, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1553);
        float _1557 = fma(_1551, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1555);
        float _1559 = -_380;
        float _1561 = _1559 + _1557;
        float _1563 = abs(_1561);
        bool _1565 = _1563 >= _376;
        bool _1567 = !_1565;
        int _1569 = _1567 ? 0 : 1;
        _1475 = _1569;
        _1535 = _1561;
        _1477 = _1541;
        _1539 = _1543;
        _1479 = _1547;
    }
    int _1571 = _1475;
    float _1573 = _1535;
    float _1575 = _1477;
    float _1577 = _1539;
    float _1579 = _1479;
    int _1581 = _1515 & 1;
    bool _1583 = _1581 != 0;
    float _1585 = _1579;
    float _1587 = _1577;
    float _1589 = _1575;
    if (_1583)
    {
        _1585 = _1517;
    }
    float _1591 = _1585;
    float _1593 = _1591;
    if (!_1583)
    {
        float _1595 = fma(_280, 4.0, _1519);
        float _1597 = fma(_272, 4.0, _1517);
        float2 _4056 = float2(_1595, _1597);
        float3 _1599 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4056, float2(0.0), isnan(_4056))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4056, float2(0.0), isnan(_4056))).xyz;
        float _1601 = _1599.x;
        float _1603 = _1599.y;
        float _1605 = _1599.z;
        float _1607 = _1603 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1609 = fma(_1601, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1607);
        float _1611 = fma(_1605, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1609);
        float _1613 = -_380;
        float _1615 = _1613 + _1611;
        float _1617 = abs(_1615);
        bool _1619 = _1617 >= _376;
        bool _1621 = !_1619;
        int _1623 = _1621 ? 0 : 1;
        _1527 = _1623;
        _1529 = _1615;
        _1531 = _1595;
        _1593 = _1597;
    }
    int _1625 = _1527;
    float _1627 = _1529;
    float _1629 = _1531;
    float _1631 = _1593;
    int _1633 = _1571 & 1;
    bool _1635 = _1633 != 0;
    int _1637 = _1635 ? (-1) : 0;
    float _1639 = _1631;
    float _1641 = _1629;
    if (_1635)
    {
        bool _1643 = _1573 >= 0.0;
        bool _1645 = isnan(_1573);
        bool _1647 = _1643 || _1645;
        bool _1649 = isnan(0.0);
        bool _1651 = _1647 || _1649;
        _429 = _1651 ? (-1) : 0;
    }
    int _1653 = _429;
    int _1655 = _1653;
    if (!_1635)
    {
        float _1657 = fma(_280, -8.0, _1575);
        float _1659 = fma(_272, -8.0, _1577);
        float2 _4143 = float2(_1657, _1659);
        float3 _1661 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4143, float2(0.0), isnan(_4143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4143, float2(0.0), isnan(_4143))).xyz;
        float _1663 = _1661.x;
        float _1665 = _1661.y;
        float _1667 = _1661.z;
        float _1669 = _1665 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1671 = fma(_1663, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1669);
        float _1673 = fma(_1667, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1671);
        float _1675 = -_380;
        float _1677 = _1675 + _1673;
        bool _1679 = _1677 >= 0.0;
        bool _1681 = isnan(_1677);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan(0.0);
        bool _1687 = _1683 || _1685;
        _1587 = _1659;
        _1589 = _1657;
        _1655 = _1687 ? (-1) : 0;
    }
    float _1689 = _1587;
    float _1691 = _1589;
    int _1693 = _1655;
    int _1695 = _1625 & 1;
    bool _1697 = _1695 != 0;
    if (_1697)
    {
        bool _1699 = _1627 >= 0.0;
        bool _1701 = isnan(_1627);
        bool _1703 = _1699 || _1701;
        bool _1705 = isnan(0.0);
        bool _1707 = _1703 || _1705;
        _1637 = _1707 ? (-1) : 0;
    }
    int _1709 = _1637;
    int _1711 = _1709;
    if (!_1697)
    {
        float _1713 = fma(_280, 8.0, _1629);
        float _1715 = fma(_272, 8.0, _1631);
        float2 _4227 = float2(_1713, _1715);
        float3 _1717 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4227, float2(0.0), isnan(_4227))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4227, float2(0.0), isnan(_4227))).xyz;
        float _1719 = _1717.x;
        float _1721 = _1717.y;
        float _1723 = _1717.z;
        float _1725 = _1721 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1727 = fma(_1719, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1725);
        float _1729 = fma(_1723, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1727);
        float _1731 = -_380;
        float _1733 = _1731 + _1729;
        bool _1735 = _1733 >= 0.0;
        bool _1737 = isnan(_1733);
        bool _1739 = _1735 || _1737;
        bool _1741 = isnan(0.0);
        bool _1743 = _1739 || _1741;
        _1639 = _1715;
        _1641 = _1713;
        _1711 = _1743 ? (-1) : 0;
    }
    float _1745 = _1639;
    float _1747 = _1641;
    int _1749 = _1711;
    float _1751 = -_1689;
    float _1753 = _57 + _1751;
    float _1755 = -_57;
    float _1757 = _1755 + _1745;
    float _1759 = -_1691;
    float _1761 = _55 + _1759;
    float _1763 = -_55;
    float _1765 = _1763 + _1747;
    float _1767 = _264 * _1753;
    float _1769 = _264 * _1757;
    float _1771 = _366 * 0.75;
    float _1773 = fma(_252, _1761, _1767);
    float _1775 = fma(_252, _1765, _1769);
    float _1777 = _1773 + _1775;
    bool _1779 = _1773 < _1775;
    int _1781 = ~_1693;
    int _1783 = (_1779 ? (-1) : 0) & _1781;
    bool _1785 = _1773 >= _1775;
    bool _1787 = isnan(_1773);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1775);
    bool _1793 = _1789 || _1791;
    int _1795 = ~_1749;
    int _1797 = (_1793 ? (-1) : 0) & _1795;
    float _1799 = precise::min(_1773, _1775);
    float _1801 = 1.0 / _1777;
    int _1803 = ~_1783;
    int _1805 = _1803 & _1797;
    int _1807 = ~_1797;
    int _1809 = _1783 & _1807;
    int _1811 = _1805 | _1809;
    int _1813 = _1783 & _1797;
    int _1815 = _1811 | _1813;
    bool _1817 = _133 < _380;
    int _1819 = (_1817 ? (-1) : 0) ^ _1815;
    float _1821 = -_1799;
    float _1823 = fma(_1821, _1801, 0.5);
    float _1825 = (_1819 != 0) ? _1823 : 0.0;
    float _1827 = precise::max(_1771, _1825);
    float _1829 = _298 * _1827;
    float _1831 = fma(_264, _1829, _55);
    float _1833 = fma(_252, _1829, _57);
    float2 _4401 = float2(_1831, _1833);
    float4 _1835 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4401, float2(0.0), isnan(_4401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4401, float2(0.0), isnan(_4401))).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    out.m_32.x = _1837;
    out.m_32.y = _1839;
    out.m_32.z = _1841;
    out.m_32.w = _1843;
    return out;
}

