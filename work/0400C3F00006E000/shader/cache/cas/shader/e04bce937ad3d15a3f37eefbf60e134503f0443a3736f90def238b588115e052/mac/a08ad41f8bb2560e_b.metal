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
    float2 _944 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _963 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_963, float2(0.0), isnan(_963)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_963, float2(0.0), isnan(_963)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _978 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_978, float2(0.0), isnan(_978)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_978, float2(0.0), isnan(_978)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _994 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_994, float2(0.0), isnan(_994)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_994, float2(0.0), isnan(_994)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1009 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1009, float2(0.0), isnan(_1009))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1009, float2(0.0), isnan(_1009))).xyz;
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
    int _168 = as_type<int>(_147);
    if (!_165)
    {
        _168 = 0;
    }
    int _170 = _168;
    bool _172 = !_165;
    int _174 = _170;
    if (!_172)
    {
        float2 _1159 = float2(_55, _57);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1159, float2(0.0), isnan(_1159)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1159, float2(0.0), isnan(_1159)), int2(1, -1)).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float2 _1174 = float2(_55, _57);
        float3 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1174, float2(0.0), isnan(_1174)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1174, float2(0.0), isnan(_1174)), int2(-1, 1)).xyz;
        float _186 = _184.x;
        float _188 = _184.y;
        float _190 = _184.z;
        float _192 = _119 + _123;
        float _194 = fma(_133, -2.0, _192);
        float _196 = _180 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _198 = _188 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _200 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[2].x, _196);
        float _202 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].x, _198);
        float _204 = _117 + _125;
        float _206 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].z, _200);
        float _208 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[2].z, _202);
        float _210 = fma(_133, -2.0, _204);
        float _212 = _125 + _206;
        float _214 = _125 + _208;
        float _216 = _117 + _206;
        float _218 = fma(_123, -2.0, _212);
        float _220 = fma(_125, -2.0, _214);
        float _222 = _117 + _208;
        float _224 = fma(_117, -2.0, _216);
        float _226 = abs(_210);
        float _228 = abs(_218);
        float _230 = fma(_226, 2.0, _228);
        float _232 = abs(_194);
        float _234 = abs(_220);
        float _236 = fma(_232, 2.0, _234);
        float _238 = fma(_119, -2.0, _222);
        float _240 = abs(_224);
        float _242 = _240 + _236;
        float _244 = abs(_238);
        float _246 = _244 + _230;
        bool _248 = _242 >= _246;
        float _250 = float(_248);
        bool _252 = _242 < _246;
        bool _254 = isnan(_242);
        bool _256 = _252 || _254;
        bool _258 = isnan(_246);
        bool _260 = _256 || _258;
        float _262 = float(_260);
        float _264 = _123 * _250;
        float _266 = _119 * _250;
        float _268 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _270 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _272 = fma(_125, _262, _264);
        float _274 = fma(_117, _262, _266);
        float _276 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
        float _278 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _280 = -_133;
        float _282 = _280 + _272;
        float _284 = -_133;
        float _286 = _284 + _274;
        float _288 = abs(_282);
        float _290 = abs(_286);
        bool _292 = _288 >= _290;
        float _294 = -_276;
        float _296 = _292 ? _294 : _276;
        float _298 = _296 * 0.5;
        float _300 = fma(_262, _298, _55);
        float _302 = fma(_250, _298, _57);
        float _304 = -_278;
        float _306 = _304 + _300;
        float _308 = -_270;
        float _310 = _308 + _302;
        float _312 = _278 + _300;
        float _314 = _270 + _302;
        float2 _1380 = float2(_306, _310);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1380, float2(0.0), isnan(_1380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1380, float2(0.0), isnan(_1380))).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _1394 = float2(_312, _314);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1394, float2(0.0), isnan(_1394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1394, float2(0.0), isnan(_1394))).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 1.0 / _151;
        float _334 = _192 + _204;
        float _336 = _216 + _214;
        float _338 = _292 ? _272 : _274;
        float _340 = abs(_282);
        float _342 = abs(_286);
        float _344 = _292 ? _340 : _342;
        float _346 = fma(_334, 2.0, _336);
        float _348 = fma(_346, -0.083333335816860198974609375, _133);
        float _350 = abs(_348);
        float _352 = _350 * _332;
        float _354 = precise::clamp(_352, 0.0, 1.0);
        float _356 = fma(_354, 6.0, -15.0);
        float _358 = _354 * _354;
        float _360 = fma(_354, _356, 10.0);
        float _362 = _360 * _358;
        float _364 = _354 * _362;
        float _366 = _320 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _368 = _328 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _370 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[2].x, _366);
        float _372 = _133 + _338;
        float _374 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[2].x, _368);
        float _376 = _344 * 0.25;
        float _378 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[2].z, _370);
        float _380 = _372 * 0.5;
        float _382 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[2].z, _374);
        float _384 = -_380;
        float _386 = _384 + _378;
        float _388 = -_380;
        float _390 = _388 + _382;
        float _392 = abs(_386);
        bool _394 = _392 >= _376;
        float _396 = abs(_390);
        bool _398 = _396 >= _376;
        bool _400 = false;
        float _402 = _214;
        float _404 = _326;
        float _406 = _386;
        bool _408 = _394;
        float _410 = _358;
        float _412 = _314;
        float _414 = _390;
        bool _416 = _398;
        float _418 = _376;
        if (_394)
        {
            _400 = true;
        }
        bool _420 = _400;
        bool _422 = _420;
        if (_394)
        {
            _402 = _306;
        }
        float _424 = _402;
        float _426 = _424;
        if (_394)
        {
            _404 = _310;
        }
        float _428 = _404;
        float _430 = _428;
        if (!_394)
        {
            float _432 = -_278;
            float _434 = _432 + _306;
            float _436 = -_270;
            float _438 = _436 + _310;
            float2 _1556 = float2(_434, _438);
            float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1556, float2(0.0), isnan(_1556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1556, float2(0.0), isnan(_1556))).xyz;
            float _442 = _440.x;
            float _444 = _440.y;
            float _446 = _440.z;
            float _448 = _444 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _450 = fma(_442, (*spvDescriptorSet0.fp_c3)._m0[2].x, _448);
            float _452 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].z, _450);
            float _454 = -_380;
            float _456 = _454 + _452;
            float _458 = abs(_456);
            bool _460 = _458 >= _376;
            _422 = _460;
            _426 = _434;
            _430 = _438;
            _406 = _456;
        }
        bool _462 = _422;
        float _464 = _426;
        float _466 = _430;
        float _468 = _406;
        float _470 = _464;
        float _472 = _466;
        float _474 = _468;
        bool _476 = _462;
        if (_398)
        {
            _408 = true;
        }
        bool _478 = _408;
        bool _480 = _478;
        if (_398)
        {
            _410 = _312;
        }
        float _482 = _410;
        float _484 = _482;
        if (!_398)
        {
            float _486 = _278 + _312;
            float _488 = _270 + _314;
            float2 _1627 = float2(_486, _488);
            float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1627, float2(0.0), isnan(_1627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1627, float2(0.0), isnan(_1627))).xyz;
            float _492 = _490.x;
            float _494 = _490.y;
            float _496 = _490.z;
            float _498 = _494 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _500 = fma(_492, (*spvDescriptorSet0.fp_c3)._m0[2].x, _498);
            float _502 = fma(_496, (*spvDescriptorSet0.fp_c3)._m0[2].z, _500);
            float _504 = -_380;
            float _506 = _504 + _502;
            float _508 = abs(_506);
            bool _510 = _508 >= _376;
            _480 = _510;
            _484 = _486;
            _412 = _488;
            _414 = _506;
        }
        bool _512 = _480;
        float _514 = _484;
        float _516 = _412;
        float _518 = _414;
        float _520 = _514;
        float _522 = _516;
        float _524 = _518;
        bool _526 = _512;
        if (_462)
        {
            _416 = true;
        }
        bool _528 = _416;
        bool _530 = _528;
        if (!_462)
        {
            float _532 = fma(_278, -1.5, _464);
            float _534 = fma(_270, -1.5, _466);
            float2 _1693 = float2(_532, _534);
            float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1693, float2(0.0), isnan(_1693))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1693, float2(0.0), isnan(_1693))).xyz;
            float _538 = _536.x;
            float _540 = _536.y;
            float _542 = _536.z;
            float _544 = _540 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _546 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].x, _544);
            float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
            float _550 = -_380;
            float _552 = _550 + _548;
            float _554 = abs(_552);
            bool _556 = _554 >= _376;
            _530 = _556;
            _470 = _532;
            _472 = _534;
            _474 = _552;
        }
        bool _558 = _530;
        float _560 = _470;
        float _562 = _472;
        float _564 = _474;
        float _566 = _564;
        float _568 = _560;
        float _570 = _562;
        bool _572 = _558;
        if (_512)
        {
            _476 = true;
        }
        bool _574 = _476;
        bool _576 = _574;
        if (!_512)
        {
            float _578 = fma(_278, 1.5, _514);
            float _580 = fma(_270, 1.5, _516);
            float2 _1759 = float2(_578, _580);
            float3 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1759, float2(0.0), isnan(_1759))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1759, float2(0.0), isnan(_1759))).xyz;
            float _584 = _582.x;
            float _586 = _582.y;
            float _588 = _582.z;
            float _590 = _586 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _592 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[2].x, _590);
            float _594 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[2].z, _592);
            float _596 = -_380;
            float _598 = _596 + _594;
            float _600 = abs(_598);
            bool _602 = _600 >= _376;
            _576 = _602;
            _520 = _578;
            _522 = _580;
            _524 = _598;
        }
        bool _604 = _576;
        float _606 = _520;
        float _608 = _522;
        float _610 = _524;
        float _612 = _610;
        float _614 = _606;
        float _616 = _608;
        int _618 = _604 ? (-1) : 0;
        if (_558)
        {
            _526 = true;
        }
        bool _620 = _526;
        bool _622 = _620;
        if (!_558)
        {
            float _624 = fma(_278, -3.0, _560);
            float _626 = fma(_270, -3.0, _562);
            float2 _1826 = float2(_624, _626);
            float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1826, float2(0.0), isnan(_1826))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1826, float2(0.0), isnan(_1826))).xyz;
            float _630 = _628.x;
            float _632 = _628.y;
            float _634 = _628.z;
            float _636 = _632 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _638 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[2].x, _636);
            float _640 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[2].z, _638);
            float _642 = -_380;
            float _644 = _642 + _640;
            float _646 = abs(_644);
            bool _648 = _646 >= _376;
            _622 = _648;
            _566 = _644;
            _568 = _624;
            _570 = _626;
        }
        bool _650 = _622;
        float _652 = _566;
        float _654 = _568;
        float _656 = _570;
        float _658 = _652;
        float _660 = _656;
        int _662 = _650 ? (-1) : 0;
        if (_604)
        {
            _572 = true;
        }
        bool _664 = _572;
        bool _666 = _664;
        if (!_604)
        {
            float _668 = fma(_278, 3.0, _606);
            float _670 = fma(_270, 3.0, _608);
            float2 _1892 = float2(_668, _670);
            float3 _672 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1892, float2(0.0), isnan(_1892))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1892, float2(0.0), isnan(_1892))).xyz;
            float _674 = _672.x;
            float _676 = _672.y;
            float _678 = _672.z;
            float _680 = _676 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _682 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[2].x, _680);
            float _684 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[2].z, _682);
            float _686 = -_380;
            float _688 = _686 + _684;
            float _690 = abs(_688);
            bool _692 = _690 >= _376;
            _666 = _692;
            _612 = _688;
            _614 = _668;
            _616 = _670;
        }
        bool _694 = _666;
        float _696 = _612;
        float _698 = _614;
        float _700 = _616;
        float _702 = _696;
        if (_650)
        {
            bool _704 = _652 >= 0.0;
            bool _706 = isnan(_652);
            bool _708 = _704 || _706;
            bool _710 = isnan(0.0);
            bool _712 = _708 || _710;
            _618 = _712 ? (-1) : 0;
        }
        int _714 = _618;
        int _716 = _714;
        if (_650)
        {
            _658 = _654;
        }
        float _718 = _658;
        float _720 = _718;
        if (!_650)
        {
            float _722 = fma(_278, -12.0, _654);
            float _724 = fma(_270, -12.0, _656);
            float2 _1974 = float2(_722, _724);
            float3 _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1974, float2(0.0), isnan(_1974))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1974, float2(0.0), isnan(_1974))).xyz;
            float _728 = _726.x;
            float _730 = _726.y;
            float _732 = _726.z;
            float _734 = _730 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _736 = fma(_728, (*spvDescriptorSet0.fp_c3)._m0[2].x, _734);
            float _738 = fma(_732, (*spvDescriptorSet0.fp_c3)._m0[2].z, _736);
            float _740 = -_380;
            float _742 = _740 + _738;
            bool _744 = _742 >= 0.0;
            bool _746 = isnan(_742);
            bool _748 = _744 || _746;
            bool _750 = isnan(0.0);
            bool _752 = _748 || _750;
            _660 = _724;
            _418 = _742;
            _720 = _722;
            _716 = _752 ? (-1) : 0;
        }
        float _754 = _660;
        float _756 = _418;
        float _758 = _720;
        int _760 = _716;
        float _762 = _756;
        if (_694)
        {
            bool _764 = _696 >= 0.0;
            bool _766 = isnan(_696);
            bool _768 = _764 || _766;
            bool _770 = isnan(0.0);
            bool _772 = _768 || _770;
            _662 = _772 ? (-1) : 0;
        }
        int _774 = _662;
        int _776 = _774;
        if (_694)
        {
            _702 = _698;
        }
        float _778 = _702;
        float _780 = _778;
        if (_694)
        {
            _762 = _700;
        }
        float _782 = _762;
        float _784 = _782;
        if (!_694)
        {
            float _786 = fma(_278, 12.0, _698);
            float _788 = fma(_270, 12.0, _700);
            float2 _2069 = float2(_786, _788);
            float3 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2069, float2(0.0), isnan(_2069))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2069, float2(0.0), isnan(_2069))).xyz;
            float _792 = _790.x;
            float _794 = _790.y;
            float _796 = _790.z;
            float _798 = _794 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _800 = fma(_792, (*spvDescriptorSet0.fp_c3)._m0[2].x, _798);
            float _802 = fma(_796, (*spvDescriptorSet0.fp_c3)._m0[2].z, _800);
            float _804 = -_380;
            float _806 = _804 + _802;
            bool _808 = _806 >= 0.0;
            bool _810 = isnan(_806);
            bool _812 = _808 || _810;
            bool _814 = isnan(0.0);
            bool _816 = _812 || _814;
            _784 = _788;
            _780 = _786;
            _776 = _816 ? (-1) : 0;
        }
        float _818 = _784;
        float _820 = _780;
        int _822 = _776;
        float _824 = -_754;
        float _826 = _57 + _824;
        float _828 = -_57;
        float _830 = _828 + _818;
        float _832 = -_758;
        float _834 = _55 + _832;
        float _836 = -_55;
        float _838 = _836 + _820;
        float _840 = _262 * _826;
        float _842 = _262 * _830;
        float _844 = _278 + _270;
        float _846 = fma(_250, _834, _840);
        float _848 = fma(_250, _838, _842);
        float _850 = 1.0 / _844;
        float _852 = _846 + _848;
        bool _854 = _846 < _848;
        int _856 = ~_760;
        int _858 = (_854 ? (-1) : 0) & _856;
        bool _860 = _846 >= _848;
        bool _862 = isnan(_846);
        bool _864 = _860 || _862;
        bool _866 = isnan(_848);
        bool _868 = _864 || _866;
        int _870 = ~_822;
        int _872 = (_868 ? (-1) : 0) & _870;
        float _874 = precise::min(_846, _848);
        float _876 = 1.0 / _852;
        int _878 = ~_858;
        int _880 = _878 & _872;
        int _882 = ~_872;
        int _884 = _858 & _882;
        int _886 = _880 | _884;
        int _888 = _858 & _872;
        int _890 = _886 | _888;
        bool _892 = _133 < _380;
        int _894 = (_892 ? (-1) : 0) ^ _890;
        float _896 = _364 * 0.75;
        float _898 = -_874;
        float _900 = fma(_898, _876, 0.5);
        float _902 = (_894 != 0) ? _900 : 0.0;
        float _904 = precise::max(_902, _896);
        float _906 = _296 * _904;
        float _908 = _906 * _850;
        _174 = as_type<int>(_908);
    }
    int _910 = _174;
    out.m_32.x = as_type<float>(_910);
    out.m_32.y = as_type<float>(_910);
    out.m_32.z = as_type<float>(_910);
    out.m_32.w = as_type<float>(_910);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _944 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _963 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_963, float2(0.0), isnan(_963)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_963, float2(0.0), isnan(_963)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _978 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_978, float2(0.0), isnan(_978)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_978, float2(0.0), isnan(_978)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _994 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_994, float2(0.0), isnan(_994)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_994, float2(0.0), isnan(_994)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1009 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1009, float2(0.0), isnan(_1009))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1009, float2(0.0), isnan(_1009))).xyz;
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
    int _168 = as_type<int>(_147);
    if (!_165)
    {
        _168 = 0;
    }
    int _170 = _168;
    bool _172 = !_165;
    int _174 = _170;
    if (!_172)
    {
        float2 _1159 = float2(_55, _57);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1159, float2(0.0), isnan(_1159)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1159, float2(0.0), isnan(_1159)), int2(1, -1)).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float2 _1174 = float2(_55, _57);
        float3 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1174, float2(0.0), isnan(_1174)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1174, float2(0.0), isnan(_1174)), int2(-1, 1)).xyz;
        float _186 = _184.x;
        float _188 = _184.y;
        float _190 = _184.z;
        float _192 = _119 + _123;
        float _194 = fma(_133, -2.0, _192);
        float _196 = _180 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _198 = _188 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _200 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[2].x, _196);
        float _202 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].x, _198);
        float _204 = _117 + _125;
        float _206 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].z, _200);
        float _208 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[2].z, _202);
        float _210 = fma(_133, -2.0, _204);
        float _212 = _125 + _206;
        float _214 = _125 + _208;
        float _216 = _117 + _206;
        float _218 = fma(_123, -2.0, _212);
        float _220 = fma(_125, -2.0, _214);
        float _222 = _117 + _208;
        float _224 = fma(_117, -2.0, _216);
        float _226 = abs(_210);
        float _228 = abs(_218);
        float _230 = fma(_226, 2.0, _228);
        float _232 = abs(_194);
        float _234 = abs(_220);
        float _236 = fma(_232, 2.0, _234);
        float _238 = fma(_119, -2.0, _222);
        float _240 = abs(_224);
        float _242 = _240 + _236;
        float _244 = abs(_238);
        float _246 = _244 + _230;
        bool _248 = _242 >= _246;
        float _250 = float(_248);
        bool _252 = _242 < _246;
        bool _254 = isnan(_242);
        bool _256 = _252 || _254;
        bool _258 = isnan(_246);
        bool _260 = _256 || _258;
        float _262 = float(_260);
        float _264 = _123 * _250;
        float _266 = _119 * _250;
        float _268 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _270 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _272 = fma(_125, _262, _264);
        float _274 = fma(_117, _262, _266);
        float _276 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
        float _278 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _280 = -_133;
        float _282 = _280 + _272;
        float _284 = -_133;
        float _286 = _284 + _274;
        float _288 = abs(_282);
        float _290 = abs(_286);
        bool _292 = _288 >= _290;
        float _294 = -_276;
        float _296 = _292 ? _294 : _276;
        float _298 = _296 * 0.5;
        float _300 = fma(_262, _298, _55);
        float _302 = fma(_250, _298, _57);
        float _304 = -_278;
        float _306 = _304 + _300;
        float _308 = -_270;
        float _310 = _308 + _302;
        float _312 = _278 + _300;
        float _314 = _270 + _302;
        float2 _1380 = float2(_306, _310);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1380, float2(0.0), isnan(_1380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1380, float2(0.0), isnan(_1380))).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _1394 = float2(_312, _314);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1394, float2(0.0), isnan(_1394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1394, float2(0.0), isnan(_1394))).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 1.0 / _151;
        float _334 = _192 + _204;
        float _336 = _216 + _214;
        float _338 = _292 ? _272 : _274;
        float _340 = abs(_282);
        float _342 = abs(_286);
        float _344 = _292 ? _340 : _342;
        float _346 = fma(_334, 2.0, _336);
        float _348 = fma(_346, -0.083333335816860198974609375, _133);
        float _350 = abs(_348);
        float _352 = _350 * _332;
        float _354 = precise::clamp(_352, 0.0, 1.0);
        float _356 = fma(_354, 6.0, -15.0);
        float _358 = _354 * _354;
        float _360 = fma(_354, _356, 10.0);
        float _362 = _360 * _358;
        float _364 = _354 * _362;
        float _366 = _320 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _368 = _328 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _370 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[2].x, _366);
        float _372 = _133 + _338;
        float _374 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[2].x, _368);
        float _376 = _344 * 0.25;
        float _378 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[2].z, _370);
        float _380 = _372 * 0.5;
        float _382 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[2].z, _374);
        float _384 = -_380;
        float _386 = _384 + _378;
        float _388 = -_380;
        float _390 = _388 + _382;
        float _392 = abs(_386);
        bool _394 = _392 >= _376;
        float _396 = abs(_390);
        bool _398 = _396 >= _376;
        bool _400 = false;
        float _402 = _214;
        float _404 = _326;
        float _406 = _386;
        bool _408 = _394;
        float _410 = _358;
        float _412 = _314;
        float _414 = _390;
        bool _416 = _398;
        float _418 = _376;
        if (_394)
        {
            _400 = true;
        }
        bool _420 = _400;
        bool _422 = _420;
        if (_394)
        {
            _402 = _306;
        }
        float _424 = _402;
        float _426 = _424;
        if (_394)
        {
            _404 = _310;
        }
        float _428 = _404;
        float _430 = _428;
        if (!_394)
        {
            float _432 = -_278;
            float _434 = _432 + _306;
            float _436 = -_270;
            float _438 = _436 + _310;
            float2 _1556 = float2(_434, _438);
            float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1556, float2(0.0), isnan(_1556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1556, float2(0.0), isnan(_1556))).xyz;
            float _442 = _440.x;
            float _444 = _440.y;
            float _446 = _440.z;
            float _448 = _444 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _450 = fma(_442, (*spvDescriptorSet0.fp_c3)._m0[2].x, _448);
            float _452 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].z, _450);
            float _454 = -_380;
            float _456 = _454 + _452;
            float _458 = abs(_456);
            bool _460 = _458 >= _376;
            _422 = _460;
            _426 = _434;
            _430 = _438;
            _406 = _456;
        }
        bool _462 = _422;
        float _464 = _426;
        float _466 = _430;
        float _468 = _406;
        float _470 = _464;
        float _472 = _466;
        float _474 = _468;
        bool _476 = _462;
        if (_398)
        {
            _408 = true;
        }
        bool _478 = _408;
        bool _480 = _478;
        if (_398)
        {
            _410 = _312;
        }
        float _482 = _410;
        float _484 = _482;
        if (!_398)
        {
            float _486 = _278 + _312;
            float _488 = _270 + _314;
            float2 _1627 = float2(_486, _488);
            float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1627, float2(0.0), isnan(_1627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1627, float2(0.0), isnan(_1627))).xyz;
            float _492 = _490.x;
            float _494 = _490.y;
            float _496 = _490.z;
            float _498 = _494 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _500 = fma(_492, (*spvDescriptorSet0.fp_c3)._m0[2].x, _498);
            float _502 = fma(_496, (*spvDescriptorSet0.fp_c3)._m0[2].z, _500);
            float _504 = -_380;
            float _506 = _504 + _502;
            float _508 = abs(_506);
            bool _510 = _508 >= _376;
            _480 = _510;
            _484 = _486;
            _412 = _488;
            _414 = _506;
        }
        bool _512 = _480;
        float _514 = _484;
        float _516 = _412;
        float _518 = _414;
        float _520 = _514;
        float _522 = _516;
        float _524 = _518;
        bool _526 = _512;
        if (_462)
        {
            _416 = true;
        }
        bool _528 = _416;
        bool _530 = _528;
        if (!_462)
        {
            float _532 = fma(_278, -1.5, _464);
            float _534 = fma(_270, -1.5, _466);
            float2 _1693 = float2(_532, _534);
            float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1693, float2(0.0), isnan(_1693))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1693, float2(0.0), isnan(_1693))).xyz;
            float _538 = _536.x;
            float _540 = _536.y;
            float _542 = _536.z;
            float _544 = _540 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _546 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].x, _544);
            float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
            float _550 = -_380;
            float _552 = _550 + _548;
            float _554 = abs(_552);
            bool _556 = _554 >= _376;
            _530 = _556;
            _470 = _532;
            _472 = _534;
            _474 = _552;
        }
        bool _558 = _530;
        float _560 = _470;
        float _562 = _472;
        float _564 = _474;
        float _566 = _564;
        float _568 = _560;
        float _570 = _562;
        bool _572 = _558;
        if (_512)
        {
            _476 = true;
        }
        bool _574 = _476;
        bool _576 = _574;
        if (!_512)
        {
            float _578 = fma(_278, 1.5, _514);
            float _580 = fma(_270, 1.5, _516);
            float2 _1759 = float2(_578, _580);
            float3 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1759, float2(0.0), isnan(_1759))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1759, float2(0.0), isnan(_1759))).xyz;
            float _584 = _582.x;
            float _586 = _582.y;
            float _588 = _582.z;
            float _590 = _586 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _592 = fma(_584, (*spvDescriptorSet0.fp_c3)._m0[2].x, _590);
            float _594 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[2].z, _592);
            float _596 = -_380;
            float _598 = _596 + _594;
            float _600 = abs(_598);
            bool _602 = _600 >= _376;
            _576 = _602;
            _520 = _578;
            _522 = _580;
            _524 = _598;
        }
        bool _604 = _576;
        float _606 = _520;
        float _608 = _522;
        float _610 = _524;
        float _612 = _610;
        float _614 = _606;
        float _616 = _608;
        int _618 = _604 ? (-1) : 0;
        if (_558)
        {
            _526 = true;
        }
        bool _620 = _526;
        bool _622 = _620;
        if (!_558)
        {
            float _624 = fma(_278, -3.0, _560);
            float _626 = fma(_270, -3.0, _562);
            float2 _1826 = float2(_624, _626);
            float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1826, float2(0.0), isnan(_1826))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1826, float2(0.0), isnan(_1826))).xyz;
            float _630 = _628.x;
            float _632 = _628.y;
            float _634 = _628.z;
            float _636 = _632 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _638 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[2].x, _636);
            float _640 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[2].z, _638);
            float _642 = -_380;
            float _644 = _642 + _640;
            float _646 = abs(_644);
            bool _648 = _646 >= _376;
            _622 = _648;
            _566 = _644;
            _568 = _624;
            _570 = _626;
        }
        bool _650 = _622;
        float _652 = _566;
        float _654 = _568;
        float _656 = _570;
        float _658 = _652;
        float _660 = _656;
        int _662 = _650 ? (-1) : 0;
        if (_604)
        {
            _572 = true;
        }
        bool _664 = _572;
        bool _666 = _664;
        if (!_604)
        {
            float _668 = fma(_278, 3.0, _606);
            float _670 = fma(_270, 3.0, _608);
            float2 _1892 = float2(_668, _670);
            float3 _672 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1892, float2(0.0), isnan(_1892))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1892, float2(0.0), isnan(_1892))).xyz;
            float _674 = _672.x;
            float _676 = _672.y;
            float _678 = _672.z;
            float _680 = _676 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _682 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[2].x, _680);
            float _684 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[2].z, _682);
            float _686 = -_380;
            float _688 = _686 + _684;
            float _690 = abs(_688);
            bool _692 = _690 >= _376;
            _666 = _692;
            _612 = _688;
            _614 = _668;
            _616 = _670;
        }
        bool _694 = _666;
        float _696 = _612;
        float _698 = _614;
        float _700 = _616;
        float _702 = _696;
        if (_650)
        {
            bool _704 = _652 >= 0.0;
            bool _706 = isnan(_652);
            bool _708 = _704 || _706;
            bool _710 = isnan(0.0);
            bool _712 = _708 || _710;
            _618 = _712 ? (-1) : 0;
        }
        int _714 = _618;
        int _716 = _714;
        if (_650)
        {
            _658 = _654;
        }
        float _718 = _658;
        float _720 = _718;
        if (!_650)
        {
            float _722 = fma(_278, -12.0, _654);
            float _724 = fma(_270, -12.0, _656);
            float2 _1974 = float2(_722, _724);
            float3 _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1974, float2(0.0), isnan(_1974))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1974, float2(0.0), isnan(_1974))).xyz;
            float _728 = _726.x;
            float _730 = _726.y;
            float _732 = _726.z;
            float _734 = _730 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _736 = fma(_728, (*spvDescriptorSet0.fp_c3)._m0[2].x, _734);
            float _738 = fma(_732, (*spvDescriptorSet0.fp_c3)._m0[2].z, _736);
            float _740 = -_380;
            float _742 = _740 + _738;
            bool _744 = _742 >= 0.0;
            bool _746 = isnan(_742);
            bool _748 = _744 || _746;
            bool _750 = isnan(0.0);
            bool _752 = _748 || _750;
            _660 = _724;
            _418 = _742;
            _720 = _722;
            _716 = _752 ? (-1) : 0;
        }
        float _754 = _660;
        float _756 = _418;
        float _758 = _720;
        int _760 = _716;
        float _762 = _756;
        if (_694)
        {
            bool _764 = _696 >= 0.0;
            bool _766 = isnan(_696);
            bool _768 = _764 || _766;
            bool _770 = isnan(0.0);
            bool _772 = _768 || _770;
            _662 = _772 ? (-1) : 0;
        }
        int _774 = _662;
        int _776 = _774;
        if (_694)
        {
            _702 = _698;
        }
        float _778 = _702;
        float _780 = _778;
        if (_694)
        {
            _762 = _700;
        }
        float _782 = _762;
        float _784 = _782;
        if (!_694)
        {
            float _786 = fma(_278, 12.0, _698);
            float _788 = fma(_270, 12.0, _700);
            float2 _2069 = float2(_786, _788);
            float3 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2069, float2(0.0), isnan(_2069))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2069, float2(0.0), isnan(_2069))).xyz;
            float _792 = _790.x;
            float _794 = _790.y;
            float _796 = _790.z;
            float _798 = _794 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _800 = fma(_792, (*spvDescriptorSet0.fp_c3)._m0[2].x, _798);
            float _802 = fma(_796, (*spvDescriptorSet0.fp_c3)._m0[2].z, _800);
            float _804 = -_380;
            float _806 = _804 + _802;
            bool _808 = _806 >= 0.0;
            bool _810 = isnan(_806);
            bool _812 = _808 || _810;
            bool _814 = isnan(0.0);
            bool _816 = _812 || _814;
            _784 = _788;
            _780 = _786;
            _776 = _816 ? (-1) : 0;
        }
        float _818 = _784;
        float _820 = _780;
        int _822 = _776;
        float _824 = -_754;
        float _826 = _57 + _824;
        float _828 = -_57;
        float _830 = _828 + _818;
        float _832 = -_758;
        float _834 = _55 + _832;
        float _836 = -_55;
        float _838 = _836 + _820;
        float _840 = _262 * _826;
        float _842 = _262 * _830;
        float _844 = _278 + _270;
        float _846 = fma(_250, _834, _840);
        float _848 = fma(_250, _838, _842);
        float _850 = 1.0 / _844;
        float _852 = _846 + _848;
        bool _854 = _846 < _848;
        int _856 = ~_760;
        int _858 = (_854 ? (-1) : 0) & _856;
        bool _860 = _846 >= _848;
        bool _862 = isnan(_846);
        bool _864 = _860 || _862;
        bool _866 = isnan(_848);
        bool _868 = _864 || _866;
        int _870 = ~_822;
        int _872 = (_868 ? (-1) : 0) & _870;
        float _874 = precise::min(_846, _848);
        float _876 = 1.0 / _852;
        int _878 = ~_858;
        int _880 = _878 & _872;
        int _882 = ~_872;
        int _884 = _858 & _882;
        int _886 = _880 | _884;
        int _888 = _858 & _872;
        int _890 = _886 | _888;
        bool _892 = _133 < _380;
        int _894 = (_892 ? (-1) : 0) ^ _890;
        float _896 = _364 * 0.75;
        float _898 = -_874;
        float _900 = fma(_898, _876, 0.5);
        float _902 = (_894 != 0) ? _900 : 0.0;
        float _904 = precise::max(_902, _896);
        float _906 = _296 * _904;
        float _908 = _906 * _850;
        _174 = as_type<int>(_908);
    }
    int _910 = _174;
    out.m_32.x = as_type<float>(_910);
    out.m_32.y = as_type<float>(_910);
    out.m_32.z = as_type<float>(_910);
    out.m_32.w = as_type<float>(_910);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

