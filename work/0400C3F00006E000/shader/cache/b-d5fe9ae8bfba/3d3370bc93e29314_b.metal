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
    float2 _953 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_953, float2(0.0), isnan(_953)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_953, float2(0.0), isnan(_953)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _972 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_972, float2(0.0), isnan(_972)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_972, float2(0.0), isnan(_972)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _987 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_987, float2(0.0), isnan(_987)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_987, float2(0.0), isnan(_987)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1003 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1003, float2(0.0), isnan(_1003)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1003, float2(0.0), isnan(_1003)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1018 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1018, float2(0.0), isnan(_1018))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1018, float2(0.0), isnan(_1018))).xyz;
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
        float2 _1158 = float2(_55, _57);
        float4 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1158, float2(0.0), isnan(_1158))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1158, float2(0.0), isnan(_1158))).xyzw;
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
    float2 _1184 = float2(_55, _57);
    float3 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1184, float2(0.0), isnan(_1184)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1184, float2(0.0), isnan(_1184)), int2(1, -1)).xyz;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float2 _1199 = float2(_55, _57);
    float3 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1199, float2(0.0), isnan(_1199)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1199, float2(0.0), isnan(_1199)), int2(-1, 1)).xyz;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _119 + _123;
    float _196 = fma(_133, -2.0, _194);
    float _198 = _182 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _200 = _190 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _202 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[2].x, _198);
    float _204 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
    float _206 = _117 + _125;
    float _208 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[2].z, _202);
    float _210 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
    float _212 = fma(_133, -2.0, _206);
    float _214 = _125 + _208;
    float _216 = _125 + _210;
    float _218 = _117 + _208;
    float _220 = fma(_123, -2.0, _214);
    float _222 = fma(_125, -2.0, _216);
    float _224 = _117 + _210;
    float _226 = abs(_212);
    float _228 = abs(_220);
    float _230 = fma(_226, 2.0, _228);
    float _232 = abs(_196);
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
    float2 _1405 = float2(_308, _312);
    float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1405, float2(0.0), isnan(_1405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1405, float2(0.0), isnan(_1405))).xyz;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float2 _1419 = float2(_314, _316);
    float3 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1419, float2(0.0), isnan(_1419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1419, float2(0.0), isnan(_1419))).xyz;
    float _328 = _326.x;
    float _330 = _326.y;
    float _332 = _326.z;
    float _334 = 1.0 / _151;
    float _336 = _194 + _206;
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
    float _370 = _330 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _372 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[2].x, _368);
    float _374 = _133 + _340;
    float _376 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[2].x, _370);
    float _378 = _346 * 0.25;
    float _380 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[2].z, _372);
    float _382 = _374 * 0.5;
    float _384 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[2].z, _376);
    float _386 = -_382;
    float _388 = _386 + _380;
    float _390 = -_382;
    float _392 = _390 + _384;
    float _394 = abs(_388);
    bool _396 = _394 >= _378;
    float _398 = abs(_392);
    bool _400 = _398 >= _378;
    bool _402 = false;
    float _404 = _216;
    float _406 = _328;
    float _408 = _388;
    bool _410 = _396;
    float _412 = _360;
    float _414 = _316;
    float _416 = _392;
    bool _418 = _400;
    float _420 = _378;
    if (_396)
    {
        _402 = true;
    }
    bool _422 = _402;
    bool _424 = _422;
    if (_396)
    {
        _404 = _308;
    }
    float _426 = _404;
    float _428 = _426;
    if (_396)
    {
        _406 = _312;
    }
    float _430 = _406;
    float _432 = _430;
    if (!_396)
    {
        float _434 = -_280;
        float _436 = _434 + _308;
        float _438 = -_272;
        float _440 = _438 + _312;
        float2 _1581 = float2(_436, _440);
        float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1581, float2(0.0), isnan(_1581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1581, float2(0.0), isnan(_1581))).xyz;
        float _444 = _442.x;
        float _446 = _442.y;
        float _448 = _442.z;
        float _450 = _446 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _452 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[2].x, _450);
        float _454 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[2].z, _452);
        float _456 = -_382;
        float _458 = _456 + _454;
        float _460 = abs(_458);
        bool _462 = _460 >= _378;
        _424 = _462;
        _428 = _436;
        _432 = _440;
        _408 = _458;
    }
    bool _464 = _424;
    float _466 = _428;
    float _468 = _432;
    float _470 = _408;
    float _472 = _466;
    float _474 = _468;
    float _476 = _470;
    bool _478 = _464;
    if (_400)
    {
        _410 = true;
    }
    bool _480 = _410;
    bool _482 = _480;
    if (_400)
    {
        _412 = _314;
    }
    float _484 = _412;
    float _486 = _484;
    if (!_400)
    {
        float _488 = _280 + _314;
        float _490 = _272 + _316;
        float2 _1652 = float2(_488, _490);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1652, float2(0.0), isnan(_1652))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1652, float2(0.0), isnan(_1652))).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float _500 = _496 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _502 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[2].x, _500);
        float _504 = fma(_498, (*spvDescriptorSet0.fp_c3)._m0[2].z, _502);
        float _506 = -_382;
        float _508 = _506 + _504;
        float _510 = abs(_508);
        bool _512 = _510 >= _378;
        _482 = _512;
        _486 = _488;
        _414 = _490;
        _416 = _508;
    }
    bool _514 = _482;
    float _516 = _486;
    float _518 = _414;
    float _520 = _416;
    float _522 = _516;
    float _524 = _518;
    float _526 = _520;
    bool _528 = _514;
    if (_464)
    {
        _418 = true;
    }
    bool _530 = _418;
    bool _532 = _530;
    if (!_464)
    {
        float _534 = fma(_280, -1.5, _466);
        float _536 = fma(_272, -1.5, _468);
        float2 _1718 = float2(_534, _536);
        float3 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1718, float2(0.0), isnan(_1718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1718, float2(0.0), isnan(_1718))).xyz;
        float _540 = _538.x;
        float _542 = _538.y;
        float _544 = _538.z;
        float _546 = _542 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _548 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[2].x, _546);
        float _550 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[2].z, _548);
        float _552 = -_382;
        float _554 = _552 + _550;
        float _556 = abs(_554);
        bool _558 = _556 >= _378;
        _532 = _558;
        _472 = _534;
        _474 = _536;
        _476 = _554;
    }
    bool _560 = _532;
    float _562 = _472;
    float _564 = _474;
    float _566 = _476;
    float _568 = _566;
    float _570 = _562;
    float _572 = _564;
    bool _574 = _560;
    if (_514)
    {
        _478 = true;
    }
    bool _576 = _478;
    bool _578 = _576;
    if (!_514)
    {
        float _580 = fma(_280, 1.5, _516);
        float _582 = fma(_272, 1.5, _518);
        float2 _1784 = float2(_580, _582);
        float3 _584 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1784, float2(0.0), isnan(_1784))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1784, float2(0.0), isnan(_1784))).xyz;
        float _586 = _584.x;
        float _588 = _584.y;
        float _590 = _584.z;
        float _592 = _588 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _594 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[2].x, _592);
        float _596 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[2].z, _594);
        float _598 = -_382;
        float _600 = _598 + _596;
        float _602 = abs(_600);
        bool _604 = _602 >= _378;
        _578 = _604;
        _522 = _580;
        _524 = _582;
        _526 = _600;
    }
    bool _606 = _578;
    float _608 = _522;
    float _610 = _524;
    float _612 = _526;
    float _614 = _612;
    float _616 = _608;
    float _618 = _610;
    int _621 = _606 ? (-1) : 0;
    if (_560)
    {
        _528 = true;
    }
    bool _623 = _528;
    bool _625 = _623;
    if (!_560)
    {
        float _627 = fma(_280, -3.0, _562);
        float _629 = fma(_272, -3.0, _564);
        float2 _1851 = float2(_627, _629);
        float3 _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1851, float2(0.0), isnan(_1851))).xyz;
        float _633 = _631.x;
        float _635 = _631.y;
        float _637 = _631.z;
        float _639 = _635 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _641 = fma(_633, (*spvDescriptorSet0.fp_c3)._m0[2].x, _639);
        float _643 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[2].z, _641);
        float _645 = -_382;
        float _647 = _645 + _643;
        float _649 = abs(_647);
        bool _651 = _649 >= _378;
        _625 = _651;
        _568 = _647;
        _570 = _627;
        _572 = _629;
    }
    bool _653 = _625;
    float _655 = _568;
    float _657 = _570;
    float _659 = _572;
    float _661 = _655;
    float _663 = _659;
    int _665 = _653 ? (-1) : 0;
    if (_606)
    {
        _574 = true;
    }
    bool _667 = _574;
    bool _669 = _667;
    if (!_606)
    {
        float _671 = fma(_280, 3.0, _608);
        float _673 = fma(_272, 3.0, _610);
        float2 _1917 = float2(_671, _673);
        float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1917, float2(0.0), isnan(_1917))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1917, float2(0.0), isnan(_1917))).xyz;
        float _677 = _675.x;
        float _679 = _675.y;
        float _681 = _675.z;
        float _683 = _679 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _685 = fma(_677, (*spvDescriptorSet0.fp_c3)._m0[2].x, _683);
        float _687 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[2].z, _685);
        float _689 = -_382;
        float _691 = _689 + _687;
        float _693 = abs(_691);
        bool _695 = _693 >= _378;
        _669 = _695;
        _614 = _691;
        _616 = _671;
        _618 = _673;
    }
    bool _697 = _669;
    float _699 = _614;
    float _701 = _616;
    float _703 = _618;
    float _705 = _699;
    if (_653)
    {
        bool _707 = _655 >= 0.0;
        bool _709 = isnan(_655);
        bool _711 = _707 || _709;
        bool _713 = isnan(0.0);
        bool _715 = _711 || _713;
        _621 = _715 ? (-1) : 0;
    }
    int _717 = _621;
    int _719 = _717;
    if (_653)
    {
        _661 = _657;
    }
    float _721 = _661;
    float _723 = _721;
    if (!_653)
    {
        float _725 = fma(_280, -12.0, _657);
        float _727 = fma(_272, -12.0, _659);
        float2 _1999 = float2(_725, _727);
        float3 _729 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1999, float2(0.0), isnan(_1999))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1999, float2(0.0), isnan(_1999))).xyz;
        float _731 = _729.x;
        float _733 = _729.y;
        float _735 = _729.z;
        float _737 = _733 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _739 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[2].x, _737);
        float _741 = fma(_735, (*spvDescriptorSet0.fp_c3)._m0[2].z, _739);
        float _743 = -_382;
        float _745 = _743 + _741;
        bool _747 = _745 >= 0.0;
        bool _749 = isnan(_745);
        bool _751 = _747 || _749;
        bool _753 = isnan(0.0);
        bool _755 = _751 || _753;
        _663 = _727;
        _420 = _745;
        _723 = _725;
        _719 = _755 ? (-1) : 0;
    }
    float _757 = _663;
    float _759 = _420;
    float _761 = _723;
    int _763 = _719;
    float _765 = _759;
    if (_697)
    {
        bool _767 = _699 >= 0.0;
        bool _769 = isnan(_699);
        bool _771 = _767 || _769;
        bool _773 = isnan(0.0);
        bool _775 = _771 || _773;
        _665 = _775 ? (-1) : 0;
    }
    int _777 = _665;
    int _779 = _777;
    if (_697)
    {
        _705 = _701;
    }
    float _781 = _705;
    float _783 = _781;
    if (_697)
    {
        _765 = _703;
    }
    float _785 = _765;
    float _787 = _785;
    if (!_697)
    {
        float _789 = fma(_280, 12.0, _701);
        float _791 = fma(_272, 12.0, _703);
        float2 _2094 = float2(_789, _791);
        float3 _793 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2094, float2(0.0), isnan(_2094))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2094, float2(0.0), isnan(_2094))).xyz;
        float _795 = _793.x;
        float _797 = _793.y;
        float _799 = _793.z;
        float _801 = _797 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _803 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[2].x, _801);
        float _805 = fma(_799, (*spvDescriptorSet0.fp_c3)._m0[2].z, _803);
        float _807 = -_382;
        float _809 = _807 + _805;
        bool _811 = _809 >= 0.0;
        bool _813 = isnan(_809);
        bool _815 = _811 || _813;
        bool _817 = isnan(0.0);
        bool _819 = _815 || _817;
        _787 = _791;
        _783 = _789;
        _779 = _819 ? (-1) : 0;
    }
    float _821 = _787;
    float _823 = _783;
    int _825 = _779;
    float _827 = -_757;
    float _829 = _57 + _827;
    float _831 = -_57;
    float _833 = _831 + _821;
    float _835 = -_55;
    float _837 = _835 + _823;
    float _839 = -_761;
    float _841 = _55 + _839;
    float _843 = _264 * _829;
    float _845 = _264 * _833;
    float _847 = fma(_252, _841, _843);
    float _849 = fma(_252, _837, _845);
    float _851 = _847 + _849;
    bool _853 = _847 < _849;
    int _855 = ~_763;
    int _857 = (_853 ? (-1) : 0) & _855;
    bool _859 = _847 >= _849;
    bool _861 = isnan(_847);
    bool _863 = _859 || _861;
    bool _865 = isnan(_849);
    bool _867 = _863 || _865;
    int _869 = ~_825;
    int _871 = (_867 ? (-1) : 0) & _869;
    float _873 = 1.0 / _851;
    float _875 = precise::min(_847, _849);
    int _877 = ~_857;
    int _879 = _877 & _871;
    int _881 = ~_871;
    int _883 = _857 & _881;
    int _885 = _879 | _883;
    int _887 = _857 & _871;
    int _889 = _885 | _887;
    bool _891 = _133 < _382;
    int _893 = (_891 ? (-1) : 0) ^ _889;
    float _895 = _366 * 0.75;
    float _897 = -_875;
    float _899 = fma(_897, _873, 0.5);
    float _901 = (_893 != 0) ? _899 : 0.0;
    float _903 = precise::max(_901, _895);
    float _905 = _298 * _903;
    float _907 = fma(_264, _905, _55);
    float _909 = fma(_252, _905, _57);
    float2 _2268 = float2(_907, _909);
    float4 _911 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2268, float2(0.0), isnan(_2268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2268, float2(0.0), isnan(_2268))).xyzw;
    float _913 = _911.x;
    float _915 = _911.y;
    float _917 = _911.z;
    float _919 = _911.w;
    out.m_32.x = _913;
    out.m_32.y = _915;
    out.m_32.z = _917;
    out.m_32.w = _919;
    return out;
}

