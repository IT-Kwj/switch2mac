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
    float2 _1868 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1868, float2(0.0), isnan(_1868)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1868, float2(0.0), isnan(_1868)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _1887 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1887, float2(0.0), isnan(_1887)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1887, float2(0.0), isnan(_1887)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _1902 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1902, float2(0.0), isnan(_1902)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1902, float2(0.0), isnan(_1902)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1918 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1918, float2(0.0), isnan(_1918)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1918, float2(0.0), isnan(_1918)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1933 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1933, float2(0.0), isnan(_1933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1933, float2(0.0), isnan(_1933))).xyz;
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
        float2 _2083 = float2(_55, _57);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2083, float2(0.0), isnan(_2083)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2083, float2(0.0), isnan(_2083)), int2(1, -1)).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float2 _2098 = float2(_55, _57);
        float3 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2098, float2(0.0), isnan(_2098)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2098, float2(0.0), isnan(_2098)), int2(-1, 1)).xyz;
        float _186 = _184.x;
        float _188 = _184.y;
        float _190 = _184.z;
        float _192 = _117 + _125;
        float _194 = _119 + _123;
        float _196 = fma(_133, -2.0, _194);
        float _198 = _180 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _200 = _188 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _202 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[2].x, _198);
        float _204 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
        float _206 = fma(_133, -2.0, _192);
        float _208 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].z, _202);
        float _210 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
        float _212 = _125 + _208;
        float _214 = _125 + _210;
        float _216 = _117 + _208;
        float _218 = fma(_123, -2.0, _212);
        float _220 = fma(_125, -2.0, _214);
        float _222 = _117 + _210;
        float _224 = fma(_117, -2.0, _216);
        float _226 = abs(_206);
        float _228 = abs(_218);
        float _230 = fma(_226, 2.0, _228);
        float _232 = abs(_196);
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
        float2 _2304 = float2(_306, _310);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2304, float2(0.0), isnan(_2304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2304, float2(0.0), isnan(_2304))).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _2318 = float2(_312, _314);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2318, float2(0.0), isnan(_2318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2318, float2(0.0), isnan(_2318))).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 1.0 / _151;
        float _334 = _194 + _192;
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
        float _368 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[2].x, _366);
        float _370 = _133 + _338;
        float _372 = _328 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _374 = _344 * 0.25;
        float _376 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[2].z, _368);
        float _378 = _370 * 0.5;
        float _380 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[2].x, _372);
        float _382 = -_378;
        float _384 = _382 + _376;
        float _386 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[2].z, _380);
        float _388 = abs(_384);
        bool _390 = _388 >= _374;
        float _392 = -_378;
        float _394 = _392 + _386;
        float _396 = abs(_394);
        bool _398 = _396 >= _374;
        bool _400 = !_398;
        int _402 = _400 ? 0 : 1;
        int _404 = as_type<int>(_368);
        float _406 = _306;
        float _408 = _310;
        int _410 = as_type<int>(_386);
        float _412 = _384;
        int _414 = _402;
        float _416 = _312;
        float _418 = _314;
        int _420 = as_type<int>(_192);
        float _422 = _394;
        float _424 = _344;
        int _426 = _398 ? (-1) : 0;
        if (_390)
        {
            bool _428 = !_390;
            int _430 = _428 ? 0 : 1;
            _404 = _430;
        }
        int _432 = _404;
        int _434 = _432;
        if (!_390)
        {
            float _436 = -_278;
            float _438 = _436 + _306;
            float _440 = -_270;
            float _442 = _440 + _310;
            float2 _2482 = float2(_438, _442);
            float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2482, float2(0.0), isnan(_2482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2482, float2(0.0), isnan(_2482))).xyz;
            float _446 = _444.x;
            float _448 = _444.y;
            float _450 = _444.z;
            float _452 = _448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _454 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _452);
            float _456 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _454);
            float _458 = -_378;
            float _460 = _458 + _456;
            float _462 = abs(_460);
            bool _464 = _462 >= _374;
            bool _466 = !_464;
            int _468 = _466 ? 0 : 1;
            _434 = _468;
            _406 = _438;
            _408 = _442;
            _410 = as_type<int>(_456);
            _412 = _460;
        }
        int _470 = _434;
        float _472 = _406;
        float _474 = _408;
        int _476 = _410;
        float _478 = _412;
        int _480 = _476;
        int _482 = _470;
        float _484 = _472;
        float _486 = _474;
        float _488 = _478;
        if (!_398)
        {
            float _490 = _278 + _312;
            float _492 = _270 + _314;
            float2 _2550 = float2(_490, _492);
            float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2550, float2(0.0), isnan(_2550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2550, float2(0.0), isnan(_2550))).xyz;
            float _496 = _494.x;
            float _498 = _494.y;
            float _500 = _494.z;
            float _502 = _498 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _504 = fma(_496, (*spvDescriptorSet0.fp_c3)._m0[2].x, _502);
            float _506 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[2].z, _504);
            float _508 = -_378;
            float _510 = _508 + _506;
            float _512 = abs(_510);
            bool _514 = _512 >= _374;
            bool _516 = !_514;
            int _518 = _516 ? 0 : 1;
            _414 = _518;
            _416 = _490;
            _418 = _492;
            _420 = as_type<int>(_500);
            _422 = _510;
        }
        int _520 = _414;
        float _522 = _416;
        float _524 = _418;
        int _526 = _420;
        float _528 = _422;
        int _530 = _470 & 1;
        bool _532 = _530 != 0;
        int _534 = _526;
        float _536 = _522;
        float _538 = _524;
        float _540 = _528;
        if (!_532)
        {
            float _542 = -_278;
            float _544 = _542 + _472;
            float _546 = -_270;
            float _548 = _546 + _474;
            float2 _2625 = float2(_544, _548);
            float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2625, float2(0.0), isnan(_2625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2625, float2(0.0), isnan(_2625))).xyz;
            float _552 = _550.x;
            float _554 = _550.y;
            float _556 = _550.z;
            float _558 = _554 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _560 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[2].x, _558);
            float _562 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[2].z, _560);
            float _564 = -_378;
            float _566 = _564 + _562;
            float _568 = abs(_566);
            bool _570 = _568 >= _374;
            bool _572 = !_570;
            int _574 = _572 ? 0 : 1;
            _480 = as_type<int>(_562);
            _482 = _574;
            _484 = _544;
            _486 = _548;
            _488 = _566;
        }
        int _576 = _480;
        int _578 = _482;
        float _580 = _484;
        float _582 = _486;
        float _584 = _488;
        int _586 = _520 & 1;
        bool _588 = _586 != 0;
        int _590 = _576;
        int _592 = _578;
        float _594 = _580;
        float _596 = _582;
        float _598 = _584;
        if (_588)
        {
            _534 = _520;
        }
        int _600 = _534;
        int _602 = _600;
        if (!_588)
        {
            float _604 = _278 + _522;
            float _606 = _270 + _524;
            float2 _2703 = float2(_604, _606);
            float3 _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2703, float2(0.0), isnan(_2703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2703, float2(0.0), isnan(_2703))).xyz;
            float _610 = _608.x;
            float _612 = _608.y;
            float _614 = _608.z;
            float _616 = _612 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _618 = fma(_610, (*spvDescriptorSet0.fp_c3)._m0[2].x, _616);
            float _620 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[2].z, _618);
            float _622 = -_378;
            float _624 = _622 + _620;
            float _626 = abs(_624);
            bool _628 = _626 >= _374;
            bool _630 = !_628;
            int _632 = _630 ? 0 : 1;
            _590 = as_type<int>(_610);
            _602 = _632;
            _536 = _604;
            _538 = _606;
            _540 = _624;
        }
        int _634 = _590;
        int _636 = _602;
        float _638 = _536;
        float _640 = _538;
        float _642 = _540;
        int _644 = _578 & 1;
        bool _646 = _644 != 0;
        int _648 = _634;
        int _650 = _636;
        float _652 = _638;
        float _654 = _640;
        float _656 = _642;
        if (!_646)
        {
            float _658 = -_278;
            float _660 = _658 + _580;
            float _662 = -_270;
            float _664 = _662 + _582;
            float2 _2779 = float2(_660, _664);
            float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2779, float2(0.0), isnan(_2779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2779, float2(0.0), isnan(_2779))).xyz;
            float _668 = _666.x;
            float _670 = _666.y;
            float _672 = _666.z;
            float _674 = _670 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _676 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[2].x, _674);
            float _678 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[2].z, _676);
            float _680 = -_378;
            float _682 = _680 + _678;
            float _684 = abs(_682);
            bool _686 = _684 >= _374;
            bool _688 = !_686;
            int _690 = _688 ? 0 : 1;
            _648 = as_type<int>(_668);
            _592 = _690;
            _594 = _660;
            _596 = _664;
            _598 = _682;
        }
        int _692 = _648;
        int _694 = _592;
        float _696 = _594;
        float _698 = _596;
        float _700 = _598;
        int _702 = _636 & 1;
        bool _704 = _702 != 0;
        int _706 = _692;
        int _708 = _694;
        float _710 = _696;
        float _712 = _698;
        float _714 = _700;
        if (!_704)
        {
            float _716 = _278 + _638;
            float _718 = _270 + _640;
            float2 _2851 = float2(_716, _718);
            float3 _720 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2851, float2(0.0), isnan(_2851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2851, float2(0.0), isnan(_2851))).xyz;
            float _722 = _720.x;
            float _724 = _720.y;
            float _726 = _720.z;
            float _728 = _724 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _730 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[2].x, _728);
            float _732 = fma(_726, (*spvDescriptorSet0.fp_c3)._m0[2].z, _730);
            float _734 = -_378;
            float _736 = _734 + _732;
            float _738 = abs(_736);
            bool _740 = _738 >= _374;
            bool _742 = !_740;
            int _744 = _742 ? 0 : 1;
            _706 = as_type<int>(_722);
            _650 = _744;
            _652 = _716;
            _654 = _718;
            _656 = _736;
        }
        int _746 = _706;
        int _748 = _650;
        float _750 = _652;
        float _752 = _654;
        float _754 = _656;
        int _756 = _694 & 1;
        bool _758 = _756 != 0;
        int _760 = _746;
        int _762 = _748;
        float _764 = _750;
        float _766 = _752;
        float _768 = _754;
        if (!_758)
        {
            float _770 = -_278;
            float _772 = _770 + _696;
            float _774 = -_270;
            float _776 = _774 + _698;
            float2 _2927 = float2(_772, _776);
            float3 _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2927, float2(0.0), isnan(_2927))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2927, float2(0.0), isnan(_2927))).xyz;
            float _780 = _778.x;
            float _782 = _778.y;
            float _784 = _778.z;
            float _786 = _782 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _788 = fma(_780, (*spvDescriptorSet0.fp_c3)._m0[2].x, _786);
            float _790 = fma(_784, (*spvDescriptorSet0.fp_c3)._m0[2].z, _788);
            float _792 = -_378;
            float _794 = _792 + _790;
            float _796 = abs(_794);
            bool _798 = _796 >= _374;
            bool _800 = !_798;
            int _802 = _800 ? 0 : 1;
            _760 = as_type<int>(_780);
            _708 = _802;
            _710 = _772;
            _712 = _776;
            _714 = _794;
        }
        int _804 = _760;
        int _806 = _708;
        float _808 = _710;
        float _810 = _712;
        float _812 = _714;
        int _814 = _748 & 1;
        bool _816 = _814 != 0;
        int _818 = _804;
        int _820 = _806;
        float _822 = _808;
        float _824 = _810;
        float _826 = _812;
        if (!_816)
        {
            float _828 = _278 + _750;
            float _830 = _270 + _752;
            float2 _2999 = float2(_828, _830);
            float3 _832 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2999, float2(0.0), isnan(_2999))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2999, float2(0.0), isnan(_2999))).xyz;
            float _834 = _832.x;
            float _836 = _832.y;
            float _838 = _832.z;
            float _840 = _836 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _842 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[2].x, _840);
            float _844 = fma(_838, (*spvDescriptorSet0.fp_c3)._m0[2].z, _842);
            float _846 = -_378;
            float _848 = _846 + _844;
            float _850 = abs(_848);
            bool _852 = _850 >= _374;
            bool _854 = !_852;
            int _856 = _854 ? 0 : 1;
            _818 = as_type<int>(_834);
            _762 = _856;
            _764 = _828;
            _766 = _830;
            _768 = _848;
        }
        int _858 = _818;
        int _860 = _762;
        float _862 = _764;
        float _864 = _766;
        float _866 = _768;
        int _868 = _806 & 1;
        bool _870 = _868 != 0;
        int _872 = _858;
        int _874 = _860;
        float _876 = _862;
        float _878 = _864;
        float _880 = _866;
        if (!_870)
        {
            float _882 = -_278;
            float _884 = _882 + _808;
            float _886 = -_270;
            float _888 = _886 + _810;
            float2 _3075 = float2(_884, _888);
            float3 _890 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3075, float2(0.0), isnan(_3075))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3075, float2(0.0), isnan(_3075))).xyz;
            float _892 = _890.x;
            float _894 = _890.y;
            float _896 = _890.z;
            float _898 = _894 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _900 = fma(_892, (*spvDescriptorSet0.fp_c3)._m0[2].x, _898);
            float _902 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[2].z, _900);
            float _904 = -_378;
            float _906 = _904 + _902;
            float _908 = abs(_906);
            bool _910 = _908 >= _374;
            bool _912 = !_910;
            int _914 = _912 ? 0 : 1;
            _872 = as_type<int>(_892);
            _820 = _914;
            _822 = _884;
            _824 = _888;
            _826 = _906;
        }
        int _916 = _872;
        int _918 = _820;
        float _920 = _822;
        float _922 = _824;
        float _924 = _826;
        int _926 = _860 & 1;
        bool _928 = _926 != 0;
        int _930 = _916;
        int _932 = _918;
        float _934 = _920;
        float _936 = _922;
        float _938 = _924;
        if (!_928)
        {
            float _940 = _278 + _862;
            float _942 = _270 + _864;
            float2 _3147 = float2(_940, _942);
            float3 _944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3147, float2(0.0), isnan(_3147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3147, float2(0.0), isnan(_3147))).xyz;
            float _946 = _944.x;
            float _948 = _944.y;
            float _950 = _944.z;
            float _952 = _948 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _954 = fma(_946, (*spvDescriptorSet0.fp_c3)._m0[2].x, _952);
            float _956 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[2].z, _954);
            float _958 = -_378;
            float _960 = _958 + _956;
            float _962 = abs(_960);
            bool _964 = _962 >= _374;
            bool _966 = !_964;
            int _968 = _966 ? 0 : 1;
            _930 = as_type<int>(_946);
            _874 = _968;
            _876 = _940;
            _878 = _942;
            _880 = _960;
        }
        int _970 = _930;
        int _972 = _874;
        float _974 = _876;
        float _976 = _878;
        float _978 = _880;
        int _980 = _918 & 1;
        bool _982 = _980 != 0;
        int _984 = _970;
        int _986 = _972;
        float _988 = _974;
        float _990 = _976;
        float _992 = _978;
        if (!_982)
        {
            float _994 = fma(_278, -1.5, _920);
            float _996 = fma(_270, -1.5, _922);
            float2 _3220 = float2(_994, _996);
            float3 _998 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3220, float2(0.0), isnan(_3220))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3220, float2(0.0), isnan(_3220))).xyz;
            float _1000 = _998.x;
            float _1002 = _998.y;
            float _1004 = _998.z;
            float _1006 = _1002 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1008 = fma(_1000, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1006);
            float _1010 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1008);
            float _1012 = -_378;
            float _1014 = _1012 + _1010;
            float _1016 = abs(_1014);
            bool _1018 = _1016 >= _374;
            bool _1020 = !_1018;
            int _1022 = _1020 ? 0 : 1;
            _984 = as_type<int>(_1000);
            _932 = _1022;
            _934 = _994;
            _936 = _996;
            _938 = _1014;
        }
        int _1024 = _984;
        int _1026 = _932;
        float _1028 = _934;
        float _1030 = _936;
        float _1032 = _938;
        int _1034 = _972 & 1;
        bool _1036 = _1034 != 0;
        int _1038 = _1024;
        int _1040 = _1026;
        float _1042 = _1028;
        float _1044 = _1030;
        float _1046 = _1032;
        if (!_1036)
        {
            float _1048 = fma(_278, 1.5, _974);
            float _1050 = fma(_270, 1.5, _976);
            float2 _3293 = float2(_1048, _1050);
            float3 _1052 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3293, float2(0.0), isnan(_3293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3293, float2(0.0), isnan(_3293))).xyz;
            float _1054 = _1052.x;
            float _1056 = _1052.y;
            float _1058 = _1052.z;
            float _1060 = _1056 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1062 = fma(_1054, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1060);
            float _1064 = fma(_1058, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1062);
            float _1066 = -_378;
            float _1068 = _1066 + _1064;
            float _1070 = abs(_1068);
            bool _1072 = _1070 >= _374;
            bool _1074 = !_1072;
            int _1076 = _1074 ? 0 : 1;
            _1038 = as_type<int>(_1054);
            _986 = _1076;
            _988 = _1048;
            _990 = _1050;
            _992 = _1068;
        }
        int _1078 = _1038;
        int _1080 = _986;
        float _1082 = _988;
        float _1084 = _990;
        float _1086 = _992;
        int _1088 = _1026 & 1;
        bool _1090 = _1088 != 0;
        int _1092 = _1078;
        int _1094 = _1080;
        float _1096 = _1082;
        float _1098 = _1084;
        float _1100 = _1086;
        if (!_1090)
        {
            float _1102 = fma(_278, -2.0, _1028);
            float _1104 = fma(_270, -2.0, _1030);
            float2 _3365 = float2(_1102, _1104);
            float3 _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3365, float2(0.0), isnan(_3365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3365, float2(0.0), isnan(_3365))).xyz;
            float _1108 = _1106.x;
            float _1110 = _1106.y;
            float _1112 = _1106.z;
            float _1114 = _1110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1116 = fma(_1108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1114);
            float _1118 = fma(_1112, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1116);
            float _1120 = -_378;
            float _1122 = _1120 + _1118;
            float _1124 = abs(_1122);
            bool _1126 = _1124 >= _374;
            bool _1128 = !_1126;
            int _1130 = _1128 ? 0 : 1;
            _1092 = as_type<int>(_1108);
            _1040 = _1130;
            _1042 = _1102;
            _1044 = _1104;
            _1046 = _1122;
        }
        int _1132 = _1092;
        int _1134 = _1040;
        float _1136 = _1042;
        float _1138 = _1044;
        float _1140 = _1046;
        int _1142 = _1080 & 1;
        bool _1144 = _1142 != 0;
        int _1146 = _1132;
        int _1148 = _1134;
        float _1150 = _1136;
        float _1152 = _1138;
        float _1154 = _1140;
        if (!_1144)
        {
            float _1156 = fma(_278, 2.0, _1082);
            float _1158 = fma(_270, 2.0, _1084);
            float2 _3437 = float2(_1156, _1158);
            float3 _1160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3437, float2(0.0), isnan(_3437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3437, float2(0.0), isnan(_3437))).xyz;
            float _1162 = _1160.x;
            float _1164 = _1160.y;
            float _1166 = _1160.z;
            float _1168 = _1164 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1170 = fma(_1162, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1168);
            float _1172 = fma(_1166, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1170);
            float _1174 = -_378;
            float _1176 = _1174 + _1172;
            float _1178 = abs(_1176);
            bool _1180 = _1178 >= _374;
            bool _1182 = !_1180;
            int _1184 = _1182 ? 0 : 1;
            _1146 = as_type<int>(_1162);
            _1094 = _1184;
            _1096 = _1156;
            _1098 = _1158;
            _1100 = _1176;
        }
        int _1186 = _1146;
        int _1188 = _1094;
        float _1190 = _1096;
        float _1192 = _1098;
        float _1194 = _1100;
        int _1196 = _1134 & 1;
        bool _1198 = _1196 != 0;
        int _1200 = _1186;
        int _1202 = _1188;
        float _1204 = _1190;
        float _1206 = _1192;
        float _1208 = _1194;
        if (!_1198)
        {
            float _1210 = fma(_278, -2.0, _1136);
            float _1212 = fma(_270, -2.0, _1138);
            float2 _3509 = float2(_1210, _1212);
            float3 _1214 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3509, float2(0.0), isnan(_3509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3509, float2(0.0), isnan(_3509))).xyz;
            float _1216 = _1214.x;
            float _1218 = _1214.y;
            float _1220 = _1214.z;
            float _1222 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1224 = fma(_1216, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1222);
            float _1226 = fma(_1220, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1224);
            float _1228 = -_378;
            float _1230 = _1228 + _1226;
            float _1232 = abs(_1230);
            bool _1234 = _1232 >= _374;
            bool _1236 = !_1234;
            int _1238 = _1236 ? 0 : 1;
            _1200 = as_type<int>(_1216);
            _1148 = _1238;
            _1150 = _1210;
            _1152 = _1212;
            _1154 = _1230;
        }
        int _1240 = _1200;
        int _1242 = _1148;
        float _1244 = _1150;
        float _1246 = _1152;
        float _1248 = _1154;
        int _1250 = _1188 & 1;
        bool _1252 = _1250 != 0;
        int _1254 = _1240;
        int _1256 = _1242;
        float _1258 = _1244;
        float _1260 = _1246;
        float _1262 = _1248;
        if (!_1252)
        {
            float _1264 = fma(_278, 2.0, _1190);
            float _1266 = fma(_270, 2.0, _1192);
            float2 _3581 = float2(_1264, _1266);
            float3 _1268 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3581, float2(0.0), isnan(_3581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3581, float2(0.0), isnan(_3581))).xyz;
            float _1270 = _1268.x;
            float _1272 = _1268.y;
            float _1274 = _1268.z;
            float _1276 = _1272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1278 = fma(_1270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1276);
            float _1280 = fma(_1274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1278);
            float _1282 = -_378;
            float _1284 = _1282 + _1280;
            float _1286 = abs(_1284);
            bool _1288 = _1286 >= _374;
            bool _1290 = !_1288;
            int _1292 = _1290 ? 0 : 1;
            _1254 = as_type<int>(_1270);
            _1202 = _1292;
            _1204 = _1264;
            _1206 = _1266;
            _1208 = _1284;
        }
        int _1294 = _1254;
        int _1296 = _1202;
        float _1298 = _1204;
        float _1300 = _1206;
        float _1302 = _1208;
        int _1304 = _1242 & 1;
        bool _1306 = _1304 != 0;
        int _1308 = _1294;
        int _1310 = _1296;
        float _1312 = _1298;
        float _1314 = _1300;
        float _1316 = _1302;
        if (!_1306)
        {
            float _1318 = fma(_278, -2.0, _1244);
            float _1320 = fma(_270, -2.0, _1246);
            float2 _3653 = float2(_1318, _1320);
            float3 _1322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3653, float2(0.0), isnan(_3653))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3653, float2(0.0), isnan(_3653))).xyz;
            float _1324 = _1322.x;
            float _1326 = _1322.y;
            float _1328 = _1322.z;
            float _1330 = _1326 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1332 = fma(_1324, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1330);
            float _1334 = fma(_1328, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1332);
            float _1336 = -_378;
            float _1338 = _1336 + _1334;
            float _1340 = abs(_1338);
            bool _1342 = _1340 >= _374;
            bool _1344 = !_1342;
            int _1346 = _1344 ? 0 : 1;
            _1308 = as_type<int>(_1324);
            _1256 = _1346;
            _1258 = _1318;
            _1260 = _1320;
            _1262 = _1338;
        }
        int _1348 = _1308;
        int _1350 = _1256;
        float _1352 = _1258;
        float _1354 = _1260;
        float _1356 = _1262;
        int _1358 = _1296 & 1;
        bool _1360 = _1358 != 0;
        int _1362 = _1348;
        int _1364 = _1350;
        float _1366 = _1356;
        float _1368 = _1354;
        float _1370 = _1352;
        if (!_1360)
        {
            float _1372 = fma(_278, 2.0, _1298);
            float _1374 = fma(_270, 2.0, _1300);
            float2 _3725 = float2(_1372, _1374);
            float3 _1376 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3725, float2(0.0), isnan(_3725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3725, float2(0.0), isnan(_3725))).xyz;
            float _1378 = _1376.x;
            float _1380 = _1376.y;
            float _1382 = _1376.z;
            float _1384 = _1380 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1386 = fma(_1378, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1384);
            float _1388 = fma(_1382, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1386);
            float _1390 = -_378;
            float _1392 = _1390 + _1388;
            float _1394 = abs(_1392);
            bool _1396 = _1394 >= _374;
            bool _1398 = !_1396;
            int _1400 = _1398 ? 0 : 1;
            _1362 = as_type<int>(_1378);
            _1310 = _1400;
            _1312 = _1372;
            _1314 = _1374;
            _1316 = _1392;
        }
        int _1402 = _1362;
        int _1404 = _1310;
        float _1406 = _1312;
        float _1408 = _1314;
        float _1410 = _1316;
        int _1412 = _1350 & 1;
        bool _1414 = _1412 != 0;
        int _1416 = _1402;
        float _1418 = _1408;
        float _1420 = _1406;
        float _1422 = _1410;
        float _1424 = as_type<float>(_1404);
        if (!_1414)
        {
            float _1426 = fma(_278, -2.0, _1352);
            float _1428 = fma(_270, -2.0, _1354);
            float2 _3798 = float2(_1426, _1428);
            float3 _1430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3798, float2(0.0), isnan(_3798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3798, float2(0.0), isnan(_3798))).xyz;
            float _1432 = _1430.x;
            float _1434 = _1430.y;
            float _1436 = _1430.z;
            float _1438 = _1434 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1440 = fma(_1432, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1438);
            float _1442 = fma(_1436, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1440);
            float _1444 = -_378;
            float _1446 = _1444 + _1442;
            float _1448 = abs(_1446);
            bool _1450 = _1448 >= _374;
            bool _1452 = !_1450;
            int _1454 = _1452 ? 0 : 1;
            _1416 = as_type<int>(_1432);
            _1364 = _1454;
            _1366 = _1446;
            _1368 = _1428;
            _1370 = _1426;
        }
        int _1456 = _1416;
        int _1458 = _1364;
        float _1460 = _1366;
        float _1462 = _1368;
        float _1464 = _1370;
        int _1466 = _1404 & 1;
        bool _1468 = _1466 != 0;
        int _1470 = _1456;
        int _1472 = _1458;
        float _1474 = _1464;
        float _1476 = _1462;
        if (_1468)
        {
            _1470 = _1404;
        }
        int _1478 = _1470;
        int _1480 = _1478;
        if (!_1468)
        {
            float _1482 = fma(_278, 2.0, _1406);
            float _1484 = fma(_270, 2.0, _1408);
            float2 _3875 = float2(_1482, _1484);
            float3 _1486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3875, float2(0.0), isnan(_3875))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3875, float2(0.0), isnan(_3875))).xyz;
            float _1488 = _1486.x;
            float _1490 = _1486.y;
            float _1492 = _1486.z;
            float _1494 = _1490 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1496 = fma(_1488, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1494);
            float _1498 = fma(_1492, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1496);
            float _1500 = -_378;
            float _1502 = _1500 + _1498;
            float _1504 = abs(_1502);
            bool _1506 = _1504 >= _374;
            bool _1508 = !_1506;
            int _1510 = _1508 ? 0 : 1;
            _1480 = _1510;
            _1418 = _1484;
            _1420 = _1482;
            _1422 = _1502;
        }
        int _1512 = _1480;
        float _1514 = _1418;
        float _1516 = _1420;
        float _1518 = _1422;
        int _1520 = _1458 & 1;
        bool _1522 = _1520 != 0;
        int _1524 = _1512;
        float _1526 = _1518;
        float _1528 = _1516;
        if (_1522)
        {
            _1424 = _1460;
        }
        float _1530 = _1424;
        float _1532 = _1530;
        if (_1522)
        {
            _424 = _1462;
        }
        float _1534 = _424;
        float _1536 = _1534;
        if (!_1522)
        {
            float _1538 = fma(_278, -4.0, _1464);
            float _1540 = fma(_270, -4.0, _1462);
            float2 _3955 = float2(_1538, _1540);
            float3 _1542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3955, float2(0.0), isnan(_3955))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3955, float2(0.0), isnan(_3955))).xyz;
            float _1544 = _1542.x;
            float _1546 = _1542.y;
            float _1548 = _1542.z;
            float _1550 = _1546 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1552 = fma(_1544, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1550);
            float _1554 = fma(_1548, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1552);
            float _1556 = -_378;
            float _1558 = _1556 + _1554;
            float _1560 = abs(_1558);
            bool _1562 = _1560 >= _374;
            bool _1564 = !_1562;
            int _1566 = _1564 ? 0 : 1;
            _1472 = _1566;
            _1532 = _1558;
            _1474 = _1538;
            _1536 = _1540;
            _1476 = _1544;
        }
        int _1568 = _1472;
        float _1570 = _1532;
        float _1572 = _1474;
        float _1574 = _1536;
        float _1576 = _1476;
        int _1578 = _1512 & 1;
        bool _1580 = _1578 != 0;
        float _1582 = _1576;
        float _1584 = _1574;
        float _1586 = _1572;
        if (_1580)
        {
            _1582 = _1514;
        }
        float _1588 = _1582;
        float _1590 = _1588;
        if (!_1580)
        {
            float _1592 = fma(_278, 4.0, _1516);
            float _1594 = fma(_270, 4.0, _1514);
            float2 _4031 = float2(_1592, _1594);
            float3 _1596 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4031, float2(0.0), isnan(_4031))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4031, float2(0.0), isnan(_4031))).xyz;
            float _1598 = _1596.x;
            float _1600 = _1596.y;
            float _1602 = _1596.z;
            float _1604 = _1600 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1606 = fma(_1598, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1604);
            float _1608 = fma(_1602, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1606);
            float _1610 = -_378;
            float _1612 = _1610 + _1608;
            float _1614 = abs(_1612);
            bool _1616 = _1614 >= _374;
            bool _1618 = !_1616;
            int _1620 = _1618 ? 0 : 1;
            _1524 = _1620;
            _1526 = _1612;
            _1528 = _1592;
            _1590 = _1594;
        }
        int _1622 = _1524;
        float _1624 = _1526;
        float _1626 = _1528;
        float _1628 = _1590;
        int _1630 = _1568 & 1;
        bool _1632 = _1630 != 0;
        int _1634 = _1632 ? (-1) : 0;
        float _1636 = _1628;
        float _1638 = _1626;
        if (_1632)
        {
            bool _1640 = _1570 >= 0.0;
            bool _1642 = isnan(_1570);
            bool _1644 = _1640 || _1642;
            bool _1646 = isnan(0.0);
            bool _1648 = _1644 || _1646;
            _426 = _1648 ? (-1) : 0;
        }
        int _1650 = _426;
        int _1652 = _1650;
        if (!_1632)
        {
            float _1654 = fma(_278, -8.0, _1572);
            float _1656 = fma(_270, -8.0, _1574);
            float2 _4118 = float2(_1654, _1656);
            float3 _1658 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4118, float2(0.0), isnan(_4118))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4118, float2(0.0), isnan(_4118))).xyz;
            float _1660 = _1658.x;
            float _1662 = _1658.y;
            float _1664 = _1658.z;
            float _1666 = _1662 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1668 = fma(_1660, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1666);
            float _1670 = fma(_1664, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1668);
            float _1672 = -_378;
            float _1674 = _1672 + _1670;
            bool _1676 = _1674 >= 0.0;
            bool _1678 = isnan(_1674);
            bool _1680 = _1676 || _1678;
            bool _1682 = isnan(0.0);
            bool _1684 = _1680 || _1682;
            _1584 = _1656;
            _1586 = _1654;
            _1652 = _1684 ? (-1) : 0;
        }
        float _1686 = _1584;
        float _1688 = _1586;
        int _1690 = _1652;
        int _1692 = _1622 & 1;
        bool _1694 = _1692 != 0;
        if (_1694)
        {
            bool _1696 = _1624 >= 0.0;
            bool _1698 = isnan(_1624);
            bool _1700 = _1696 || _1698;
            bool _1702 = isnan(0.0);
            bool _1704 = _1700 || _1702;
            _1634 = _1704 ? (-1) : 0;
        }
        int _1706 = _1634;
        int _1708 = _1706;
        if (!_1694)
        {
            float _1710 = fma(_278, 8.0, _1626);
            float _1712 = fma(_270, 8.0, _1628);
            float2 _4202 = float2(_1710, _1712);
            float3 _1714 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4202, float2(0.0), isnan(_4202))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4202, float2(0.0), isnan(_4202))).xyz;
            float _1716 = _1714.x;
            float _1718 = _1714.y;
            float _1720 = _1714.z;
            float _1722 = _1718 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1724 = fma(_1716, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1722);
            float _1726 = fma(_1720, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1724);
            float _1728 = -_378;
            float _1730 = _1728 + _1726;
            bool _1732 = _1730 >= 0.0;
            bool _1734 = isnan(_1730);
            bool _1736 = _1732 || _1734;
            bool _1738 = isnan(0.0);
            bool _1740 = _1736 || _1738;
            _1636 = _1712;
            _1638 = _1710;
            _1708 = _1740 ? (-1) : 0;
        }
        float _1742 = _1636;
        float _1744 = _1638;
        int _1746 = _1708;
        float _1748 = -_1686;
        float _1750 = _57 + _1748;
        float _1752 = -_57;
        float _1754 = _1752 + _1742;
        float _1756 = -_1688;
        float _1758 = _55 + _1756;
        float _1760 = -_55;
        float _1762 = _1760 + _1744;
        float _1764 = _262 * _1750;
        float _1766 = _262 * _1754;
        float _1768 = _278 + _270;
        float _1770 = _364 * 0.75;
        float _1772 = fma(_250, _1758, _1764);
        float _1774 = fma(_250, _1762, _1766);
        float _1776 = 1.0 / _1768;
        float _1778 = _1772 + _1774;
        bool _1780 = _1772 < _1774;
        int _1782 = ~_1690;
        int _1784 = (_1780 ? (-1) : 0) & _1782;
        bool _1786 = _1772 >= _1774;
        bool _1788 = isnan(_1772);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan(_1774);
        bool _1794 = _1790 || _1792;
        int _1796 = ~_1746;
        int _1798 = (_1794 ? (-1) : 0) & _1796;
        float _1800 = precise::min(_1772, _1774);
        float _1802 = 1.0 / _1778;
        int _1804 = ~_1784;
        int _1806 = _1804 & _1798;
        int _1808 = ~_1798;
        int _1810 = _1784 & _1808;
        int _1812 = _1806 | _1810;
        int _1814 = _1784 & _1798;
        int _1816 = _1812 | _1814;
        bool _1818 = _133 < _378;
        int _1820 = (_1818 ? (-1) : 0) ^ _1816;
        float _1822 = -_1800;
        float _1824 = fma(_1822, _1802, 0.5);
        float _1826 = (_1820 != 0) ? _1824 : 0.0;
        float _1828 = precise::max(_1770, _1826);
        float _1830 = _296 * _1828;
        float _1832 = _1830 * _1776;
        _174 = as_type<int>(_1832);
    }
    int _1834 = _174;
    out.m_32.x = as_type<float>(_1834);
    out.m_32.y = as_type<float>(_1834);
    out.m_32.z = as_type<float>(_1834);
    out.m_32.w = as_type<float>(_1834);
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
    float2 _1868 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1868, float2(0.0), isnan(_1868)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1868, float2(0.0), isnan(_1868)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _1887 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1887, float2(0.0), isnan(_1887)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1887, float2(0.0), isnan(_1887)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _1902 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1902, float2(0.0), isnan(_1902)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1902, float2(0.0), isnan(_1902)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1918 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1918, float2(0.0), isnan(_1918)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1918, float2(0.0), isnan(_1918)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1933 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1933, float2(0.0), isnan(_1933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1933, float2(0.0), isnan(_1933))).xyz;
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
        float2 _2083 = float2(_55, _57);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2083, float2(0.0), isnan(_2083)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2083, float2(0.0), isnan(_2083)), int2(1, -1)).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float2 _2098 = float2(_55, _57);
        float3 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2098, float2(0.0), isnan(_2098)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2098, float2(0.0), isnan(_2098)), int2(-1, 1)).xyz;
        float _186 = _184.x;
        float _188 = _184.y;
        float _190 = _184.z;
        float _192 = _117 + _125;
        float _194 = _119 + _123;
        float _196 = fma(_133, -2.0, _194);
        float _198 = _180 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _200 = _188 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _202 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[2].x, _198);
        float _204 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
        float _206 = fma(_133, -2.0, _192);
        float _208 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].z, _202);
        float _210 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
        float _212 = _125 + _208;
        float _214 = _125 + _210;
        float _216 = _117 + _208;
        float _218 = fma(_123, -2.0, _212);
        float _220 = fma(_125, -2.0, _214);
        float _222 = _117 + _210;
        float _224 = fma(_117, -2.0, _216);
        float _226 = abs(_206);
        float _228 = abs(_218);
        float _230 = fma(_226, 2.0, _228);
        float _232 = abs(_196);
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
        float2 _2304 = float2(_306, _310);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2304, float2(0.0), isnan(_2304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2304, float2(0.0), isnan(_2304))).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _2318 = float2(_312, _314);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2318, float2(0.0), isnan(_2318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2318, float2(0.0), isnan(_2318))).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 1.0 / _151;
        float _334 = _194 + _192;
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
        float _368 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[2].x, _366);
        float _370 = _133 + _338;
        float _372 = _328 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _374 = _344 * 0.25;
        float _376 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[2].z, _368);
        float _378 = _370 * 0.5;
        float _380 = fma(_326, (*spvDescriptorSet0.fp_c3)._m0[2].x, _372);
        float _382 = -_378;
        float _384 = _382 + _376;
        float _386 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[2].z, _380);
        float _388 = abs(_384);
        bool _390 = _388 >= _374;
        float _392 = -_378;
        float _394 = _392 + _386;
        float _396 = abs(_394);
        bool _398 = _396 >= _374;
        bool _400 = !_398;
        int _402 = _400 ? 0 : 1;
        int _404 = as_type<int>(_368);
        float _406 = _306;
        float _408 = _310;
        int _410 = as_type<int>(_386);
        float _412 = _384;
        int _414 = _402;
        float _416 = _312;
        float _418 = _314;
        int _420 = as_type<int>(_192);
        float _422 = _394;
        float _424 = _344;
        int _426 = _398 ? (-1) : 0;
        if (_390)
        {
            bool _428 = !_390;
            int _430 = _428 ? 0 : 1;
            _404 = _430;
        }
        int _432 = _404;
        int _434 = _432;
        if (!_390)
        {
            float _436 = -_278;
            float _438 = _436 + _306;
            float _440 = -_270;
            float _442 = _440 + _310;
            float2 _2482 = float2(_438, _442);
            float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2482, float2(0.0), isnan(_2482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2482, float2(0.0), isnan(_2482))).xyz;
            float _446 = _444.x;
            float _448 = _444.y;
            float _450 = _444.z;
            float _452 = _448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _454 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _452);
            float _456 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _454);
            float _458 = -_378;
            float _460 = _458 + _456;
            float _462 = abs(_460);
            bool _464 = _462 >= _374;
            bool _466 = !_464;
            int _468 = _466 ? 0 : 1;
            _434 = _468;
            _406 = _438;
            _408 = _442;
            _410 = as_type<int>(_456);
            _412 = _460;
        }
        int _470 = _434;
        float _472 = _406;
        float _474 = _408;
        int _476 = _410;
        float _478 = _412;
        int _480 = _476;
        int _482 = _470;
        float _484 = _472;
        float _486 = _474;
        float _488 = _478;
        if (!_398)
        {
            float _490 = _278 + _312;
            float _492 = _270 + _314;
            float2 _2550 = float2(_490, _492);
            float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2550, float2(0.0), isnan(_2550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2550, float2(0.0), isnan(_2550))).xyz;
            float _496 = _494.x;
            float _498 = _494.y;
            float _500 = _494.z;
            float _502 = _498 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _504 = fma(_496, (*spvDescriptorSet0.fp_c3)._m0[2].x, _502);
            float _506 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[2].z, _504);
            float _508 = -_378;
            float _510 = _508 + _506;
            float _512 = abs(_510);
            bool _514 = _512 >= _374;
            bool _516 = !_514;
            int _518 = _516 ? 0 : 1;
            _414 = _518;
            _416 = _490;
            _418 = _492;
            _420 = as_type<int>(_500);
            _422 = _510;
        }
        int _520 = _414;
        float _522 = _416;
        float _524 = _418;
        int _526 = _420;
        float _528 = _422;
        int _530 = _470 & 1;
        bool _532 = _530 != 0;
        int _534 = _526;
        float _536 = _522;
        float _538 = _524;
        float _540 = _528;
        if (!_532)
        {
            float _542 = -_278;
            float _544 = _542 + _472;
            float _546 = -_270;
            float _548 = _546 + _474;
            float2 _2625 = float2(_544, _548);
            float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2625, float2(0.0), isnan(_2625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2625, float2(0.0), isnan(_2625))).xyz;
            float _552 = _550.x;
            float _554 = _550.y;
            float _556 = _550.z;
            float _558 = _554 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _560 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[2].x, _558);
            float _562 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[2].z, _560);
            float _564 = -_378;
            float _566 = _564 + _562;
            float _568 = abs(_566);
            bool _570 = _568 >= _374;
            bool _572 = !_570;
            int _574 = _572 ? 0 : 1;
            _480 = as_type<int>(_562);
            _482 = _574;
            _484 = _544;
            _486 = _548;
            _488 = _566;
        }
        int _576 = _480;
        int _578 = _482;
        float _580 = _484;
        float _582 = _486;
        float _584 = _488;
        int _586 = _520 & 1;
        bool _588 = _586 != 0;
        int _590 = _576;
        int _592 = _578;
        float _594 = _580;
        float _596 = _582;
        float _598 = _584;
        if (_588)
        {
            _534 = _520;
        }
        int _600 = _534;
        int _602 = _600;
        if (!_588)
        {
            float _604 = _278 + _522;
            float _606 = _270 + _524;
            float2 _2703 = float2(_604, _606);
            float3 _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2703, float2(0.0), isnan(_2703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2703, float2(0.0), isnan(_2703))).xyz;
            float _610 = _608.x;
            float _612 = _608.y;
            float _614 = _608.z;
            float _616 = _612 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _618 = fma(_610, (*spvDescriptorSet0.fp_c3)._m0[2].x, _616);
            float _620 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[2].z, _618);
            float _622 = -_378;
            float _624 = _622 + _620;
            float _626 = abs(_624);
            bool _628 = _626 >= _374;
            bool _630 = !_628;
            int _632 = _630 ? 0 : 1;
            _590 = as_type<int>(_610);
            _602 = _632;
            _536 = _604;
            _538 = _606;
            _540 = _624;
        }
        int _634 = _590;
        int _636 = _602;
        float _638 = _536;
        float _640 = _538;
        float _642 = _540;
        int _644 = _578 & 1;
        bool _646 = _644 != 0;
        int _648 = _634;
        int _650 = _636;
        float _652 = _638;
        float _654 = _640;
        float _656 = _642;
        if (!_646)
        {
            float _658 = -_278;
            float _660 = _658 + _580;
            float _662 = -_270;
            float _664 = _662 + _582;
            float2 _2779 = float2(_660, _664);
            float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2779, float2(0.0), isnan(_2779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2779, float2(0.0), isnan(_2779))).xyz;
            float _668 = _666.x;
            float _670 = _666.y;
            float _672 = _666.z;
            float _674 = _670 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _676 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[2].x, _674);
            float _678 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[2].z, _676);
            float _680 = -_378;
            float _682 = _680 + _678;
            float _684 = abs(_682);
            bool _686 = _684 >= _374;
            bool _688 = !_686;
            int _690 = _688 ? 0 : 1;
            _648 = as_type<int>(_668);
            _592 = _690;
            _594 = _660;
            _596 = _664;
            _598 = _682;
        }
        int _692 = _648;
        int _694 = _592;
        float _696 = _594;
        float _698 = _596;
        float _700 = _598;
        int _702 = _636 & 1;
        bool _704 = _702 != 0;
        int _706 = _692;
        int _708 = _694;
        float _710 = _696;
        float _712 = _698;
        float _714 = _700;
        if (!_704)
        {
            float _716 = _278 + _638;
            float _718 = _270 + _640;
            float2 _2851 = float2(_716, _718);
            float3 _720 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2851, float2(0.0), isnan(_2851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2851, float2(0.0), isnan(_2851))).xyz;
            float _722 = _720.x;
            float _724 = _720.y;
            float _726 = _720.z;
            float _728 = _724 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _730 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[2].x, _728);
            float _732 = fma(_726, (*spvDescriptorSet0.fp_c3)._m0[2].z, _730);
            float _734 = -_378;
            float _736 = _734 + _732;
            float _738 = abs(_736);
            bool _740 = _738 >= _374;
            bool _742 = !_740;
            int _744 = _742 ? 0 : 1;
            _706 = as_type<int>(_722);
            _650 = _744;
            _652 = _716;
            _654 = _718;
            _656 = _736;
        }
        int _746 = _706;
        int _748 = _650;
        float _750 = _652;
        float _752 = _654;
        float _754 = _656;
        int _756 = _694 & 1;
        bool _758 = _756 != 0;
        int _760 = _746;
        int _762 = _748;
        float _764 = _750;
        float _766 = _752;
        float _768 = _754;
        if (!_758)
        {
            float _770 = -_278;
            float _772 = _770 + _696;
            float _774 = -_270;
            float _776 = _774 + _698;
            float2 _2927 = float2(_772, _776);
            float3 _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2927, float2(0.0), isnan(_2927))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2927, float2(0.0), isnan(_2927))).xyz;
            float _780 = _778.x;
            float _782 = _778.y;
            float _784 = _778.z;
            float _786 = _782 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _788 = fma(_780, (*spvDescriptorSet0.fp_c3)._m0[2].x, _786);
            float _790 = fma(_784, (*spvDescriptorSet0.fp_c3)._m0[2].z, _788);
            float _792 = -_378;
            float _794 = _792 + _790;
            float _796 = abs(_794);
            bool _798 = _796 >= _374;
            bool _800 = !_798;
            int _802 = _800 ? 0 : 1;
            _760 = as_type<int>(_780);
            _708 = _802;
            _710 = _772;
            _712 = _776;
            _714 = _794;
        }
        int _804 = _760;
        int _806 = _708;
        float _808 = _710;
        float _810 = _712;
        float _812 = _714;
        int _814 = _748 & 1;
        bool _816 = _814 != 0;
        int _818 = _804;
        int _820 = _806;
        float _822 = _808;
        float _824 = _810;
        float _826 = _812;
        if (!_816)
        {
            float _828 = _278 + _750;
            float _830 = _270 + _752;
            float2 _2999 = float2(_828, _830);
            float3 _832 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2999, float2(0.0), isnan(_2999))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2999, float2(0.0), isnan(_2999))).xyz;
            float _834 = _832.x;
            float _836 = _832.y;
            float _838 = _832.z;
            float _840 = _836 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _842 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[2].x, _840);
            float _844 = fma(_838, (*spvDescriptorSet0.fp_c3)._m0[2].z, _842);
            float _846 = -_378;
            float _848 = _846 + _844;
            float _850 = abs(_848);
            bool _852 = _850 >= _374;
            bool _854 = !_852;
            int _856 = _854 ? 0 : 1;
            _818 = as_type<int>(_834);
            _762 = _856;
            _764 = _828;
            _766 = _830;
            _768 = _848;
        }
        int _858 = _818;
        int _860 = _762;
        float _862 = _764;
        float _864 = _766;
        float _866 = _768;
        int _868 = _806 & 1;
        bool _870 = _868 != 0;
        int _872 = _858;
        int _874 = _860;
        float _876 = _862;
        float _878 = _864;
        float _880 = _866;
        if (!_870)
        {
            float _882 = -_278;
            float _884 = _882 + _808;
            float _886 = -_270;
            float _888 = _886 + _810;
            float2 _3075 = float2(_884, _888);
            float3 _890 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3075, float2(0.0), isnan(_3075))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3075, float2(0.0), isnan(_3075))).xyz;
            float _892 = _890.x;
            float _894 = _890.y;
            float _896 = _890.z;
            float _898 = _894 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _900 = fma(_892, (*spvDescriptorSet0.fp_c3)._m0[2].x, _898);
            float _902 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[2].z, _900);
            float _904 = -_378;
            float _906 = _904 + _902;
            float _908 = abs(_906);
            bool _910 = _908 >= _374;
            bool _912 = !_910;
            int _914 = _912 ? 0 : 1;
            _872 = as_type<int>(_892);
            _820 = _914;
            _822 = _884;
            _824 = _888;
            _826 = _906;
        }
        int _916 = _872;
        int _918 = _820;
        float _920 = _822;
        float _922 = _824;
        float _924 = _826;
        int _926 = _860 & 1;
        bool _928 = _926 != 0;
        int _930 = _916;
        int _932 = _918;
        float _934 = _920;
        float _936 = _922;
        float _938 = _924;
        if (!_928)
        {
            float _940 = _278 + _862;
            float _942 = _270 + _864;
            float2 _3147 = float2(_940, _942);
            float3 _944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3147, float2(0.0), isnan(_3147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3147, float2(0.0), isnan(_3147))).xyz;
            float _946 = _944.x;
            float _948 = _944.y;
            float _950 = _944.z;
            float _952 = _948 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _954 = fma(_946, (*spvDescriptorSet0.fp_c3)._m0[2].x, _952);
            float _956 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[2].z, _954);
            float _958 = -_378;
            float _960 = _958 + _956;
            float _962 = abs(_960);
            bool _964 = _962 >= _374;
            bool _966 = !_964;
            int _968 = _966 ? 0 : 1;
            _930 = as_type<int>(_946);
            _874 = _968;
            _876 = _940;
            _878 = _942;
            _880 = _960;
        }
        int _970 = _930;
        int _972 = _874;
        float _974 = _876;
        float _976 = _878;
        float _978 = _880;
        int _980 = _918 & 1;
        bool _982 = _980 != 0;
        int _984 = _970;
        int _986 = _972;
        float _988 = _974;
        float _990 = _976;
        float _992 = _978;
        if (!_982)
        {
            float _994 = fma(_278, -1.5, _920);
            float _996 = fma(_270, -1.5, _922);
            float2 _3220 = float2(_994, _996);
            float3 _998 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3220, float2(0.0), isnan(_3220))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3220, float2(0.0), isnan(_3220))).xyz;
            float _1000 = _998.x;
            float _1002 = _998.y;
            float _1004 = _998.z;
            float _1006 = _1002 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1008 = fma(_1000, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1006);
            float _1010 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1008);
            float _1012 = -_378;
            float _1014 = _1012 + _1010;
            float _1016 = abs(_1014);
            bool _1018 = _1016 >= _374;
            bool _1020 = !_1018;
            int _1022 = _1020 ? 0 : 1;
            _984 = as_type<int>(_1000);
            _932 = _1022;
            _934 = _994;
            _936 = _996;
            _938 = _1014;
        }
        int _1024 = _984;
        int _1026 = _932;
        float _1028 = _934;
        float _1030 = _936;
        float _1032 = _938;
        int _1034 = _972 & 1;
        bool _1036 = _1034 != 0;
        int _1038 = _1024;
        int _1040 = _1026;
        float _1042 = _1028;
        float _1044 = _1030;
        float _1046 = _1032;
        if (!_1036)
        {
            float _1048 = fma(_278, 1.5, _974);
            float _1050 = fma(_270, 1.5, _976);
            float2 _3293 = float2(_1048, _1050);
            float3 _1052 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3293, float2(0.0), isnan(_3293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3293, float2(0.0), isnan(_3293))).xyz;
            float _1054 = _1052.x;
            float _1056 = _1052.y;
            float _1058 = _1052.z;
            float _1060 = _1056 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1062 = fma(_1054, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1060);
            float _1064 = fma(_1058, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1062);
            float _1066 = -_378;
            float _1068 = _1066 + _1064;
            float _1070 = abs(_1068);
            bool _1072 = _1070 >= _374;
            bool _1074 = !_1072;
            int _1076 = _1074 ? 0 : 1;
            _1038 = as_type<int>(_1054);
            _986 = _1076;
            _988 = _1048;
            _990 = _1050;
            _992 = _1068;
        }
        int _1078 = _1038;
        int _1080 = _986;
        float _1082 = _988;
        float _1084 = _990;
        float _1086 = _992;
        int _1088 = _1026 & 1;
        bool _1090 = _1088 != 0;
        int _1092 = _1078;
        int _1094 = _1080;
        float _1096 = _1082;
        float _1098 = _1084;
        float _1100 = _1086;
        if (!_1090)
        {
            float _1102 = fma(_278, -2.0, _1028);
            float _1104 = fma(_270, -2.0, _1030);
            float2 _3365 = float2(_1102, _1104);
            float3 _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3365, float2(0.0), isnan(_3365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3365, float2(0.0), isnan(_3365))).xyz;
            float _1108 = _1106.x;
            float _1110 = _1106.y;
            float _1112 = _1106.z;
            float _1114 = _1110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1116 = fma(_1108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1114);
            float _1118 = fma(_1112, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1116);
            float _1120 = -_378;
            float _1122 = _1120 + _1118;
            float _1124 = abs(_1122);
            bool _1126 = _1124 >= _374;
            bool _1128 = !_1126;
            int _1130 = _1128 ? 0 : 1;
            _1092 = as_type<int>(_1108);
            _1040 = _1130;
            _1042 = _1102;
            _1044 = _1104;
            _1046 = _1122;
        }
        int _1132 = _1092;
        int _1134 = _1040;
        float _1136 = _1042;
        float _1138 = _1044;
        float _1140 = _1046;
        int _1142 = _1080 & 1;
        bool _1144 = _1142 != 0;
        int _1146 = _1132;
        int _1148 = _1134;
        float _1150 = _1136;
        float _1152 = _1138;
        float _1154 = _1140;
        if (!_1144)
        {
            float _1156 = fma(_278, 2.0, _1082);
            float _1158 = fma(_270, 2.0, _1084);
            float2 _3437 = float2(_1156, _1158);
            float3 _1160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3437, float2(0.0), isnan(_3437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3437, float2(0.0), isnan(_3437))).xyz;
            float _1162 = _1160.x;
            float _1164 = _1160.y;
            float _1166 = _1160.z;
            float _1168 = _1164 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1170 = fma(_1162, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1168);
            float _1172 = fma(_1166, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1170);
            float _1174 = -_378;
            float _1176 = _1174 + _1172;
            float _1178 = abs(_1176);
            bool _1180 = _1178 >= _374;
            bool _1182 = !_1180;
            int _1184 = _1182 ? 0 : 1;
            _1146 = as_type<int>(_1162);
            _1094 = _1184;
            _1096 = _1156;
            _1098 = _1158;
            _1100 = _1176;
        }
        int _1186 = _1146;
        int _1188 = _1094;
        float _1190 = _1096;
        float _1192 = _1098;
        float _1194 = _1100;
        int _1196 = _1134 & 1;
        bool _1198 = _1196 != 0;
        int _1200 = _1186;
        int _1202 = _1188;
        float _1204 = _1190;
        float _1206 = _1192;
        float _1208 = _1194;
        if (!_1198)
        {
            float _1210 = fma(_278, -2.0, _1136);
            float _1212 = fma(_270, -2.0, _1138);
            float2 _3509 = float2(_1210, _1212);
            float3 _1214 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3509, float2(0.0), isnan(_3509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3509, float2(0.0), isnan(_3509))).xyz;
            float _1216 = _1214.x;
            float _1218 = _1214.y;
            float _1220 = _1214.z;
            float _1222 = _1218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1224 = fma(_1216, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1222);
            float _1226 = fma(_1220, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1224);
            float _1228 = -_378;
            float _1230 = _1228 + _1226;
            float _1232 = abs(_1230);
            bool _1234 = _1232 >= _374;
            bool _1236 = !_1234;
            int _1238 = _1236 ? 0 : 1;
            _1200 = as_type<int>(_1216);
            _1148 = _1238;
            _1150 = _1210;
            _1152 = _1212;
            _1154 = _1230;
        }
        int _1240 = _1200;
        int _1242 = _1148;
        float _1244 = _1150;
        float _1246 = _1152;
        float _1248 = _1154;
        int _1250 = _1188 & 1;
        bool _1252 = _1250 != 0;
        int _1254 = _1240;
        int _1256 = _1242;
        float _1258 = _1244;
        float _1260 = _1246;
        float _1262 = _1248;
        if (!_1252)
        {
            float _1264 = fma(_278, 2.0, _1190);
            float _1266 = fma(_270, 2.0, _1192);
            float2 _3581 = float2(_1264, _1266);
            float3 _1268 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3581, float2(0.0), isnan(_3581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3581, float2(0.0), isnan(_3581))).xyz;
            float _1270 = _1268.x;
            float _1272 = _1268.y;
            float _1274 = _1268.z;
            float _1276 = _1272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1278 = fma(_1270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1276);
            float _1280 = fma(_1274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1278);
            float _1282 = -_378;
            float _1284 = _1282 + _1280;
            float _1286 = abs(_1284);
            bool _1288 = _1286 >= _374;
            bool _1290 = !_1288;
            int _1292 = _1290 ? 0 : 1;
            _1254 = as_type<int>(_1270);
            _1202 = _1292;
            _1204 = _1264;
            _1206 = _1266;
            _1208 = _1284;
        }
        int _1294 = _1254;
        int _1296 = _1202;
        float _1298 = _1204;
        float _1300 = _1206;
        float _1302 = _1208;
        int _1304 = _1242 & 1;
        bool _1306 = _1304 != 0;
        int _1308 = _1294;
        int _1310 = _1296;
        float _1312 = _1298;
        float _1314 = _1300;
        float _1316 = _1302;
        if (!_1306)
        {
            float _1318 = fma(_278, -2.0, _1244);
            float _1320 = fma(_270, -2.0, _1246);
            float2 _3653 = float2(_1318, _1320);
            float3 _1322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3653, float2(0.0), isnan(_3653))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3653, float2(0.0), isnan(_3653))).xyz;
            float _1324 = _1322.x;
            float _1326 = _1322.y;
            float _1328 = _1322.z;
            float _1330 = _1326 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1332 = fma(_1324, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1330);
            float _1334 = fma(_1328, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1332);
            float _1336 = -_378;
            float _1338 = _1336 + _1334;
            float _1340 = abs(_1338);
            bool _1342 = _1340 >= _374;
            bool _1344 = !_1342;
            int _1346 = _1344 ? 0 : 1;
            _1308 = as_type<int>(_1324);
            _1256 = _1346;
            _1258 = _1318;
            _1260 = _1320;
            _1262 = _1338;
        }
        int _1348 = _1308;
        int _1350 = _1256;
        float _1352 = _1258;
        float _1354 = _1260;
        float _1356 = _1262;
        int _1358 = _1296 & 1;
        bool _1360 = _1358 != 0;
        int _1362 = _1348;
        int _1364 = _1350;
        float _1366 = _1356;
        float _1368 = _1354;
        float _1370 = _1352;
        if (!_1360)
        {
            float _1372 = fma(_278, 2.0, _1298);
            float _1374 = fma(_270, 2.0, _1300);
            float2 _3725 = float2(_1372, _1374);
            float3 _1376 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3725, float2(0.0), isnan(_3725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3725, float2(0.0), isnan(_3725))).xyz;
            float _1378 = _1376.x;
            float _1380 = _1376.y;
            float _1382 = _1376.z;
            float _1384 = _1380 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1386 = fma(_1378, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1384);
            float _1388 = fma(_1382, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1386);
            float _1390 = -_378;
            float _1392 = _1390 + _1388;
            float _1394 = abs(_1392);
            bool _1396 = _1394 >= _374;
            bool _1398 = !_1396;
            int _1400 = _1398 ? 0 : 1;
            _1362 = as_type<int>(_1378);
            _1310 = _1400;
            _1312 = _1372;
            _1314 = _1374;
            _1316 = _1392;
        }
        int _1402 = _1362;
        int _1404 = _1310;
        float _1406 = _1312;
        float _1408 = _1314;
        float _1410 = _1316;
        int _1412 = _1350 & 1;
        bool _1414 = _1412 != 0;
        int _1416 = _1402;
        float _1418 = _1408;
        float _1420 = _1406;
        float _1422 = _1410;
        float _1424 = as_type<float>(_1404);
        if (!_1414)
        {
            float _1426 = fma(_278, -2.0, _1352);
            float _1428 = fma(_270, -2.0, _1354);
            float2 _3798 = float2(_1426, _1428);
            float3 _1430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3798, float2(0.0), isnan(_3798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3798, float2(0.0), isnan(_3798))).xyz;
            float _1432 = _1430.x;
            float _1434 = _1430.y;
            float _1436 = _1430.z;
            float _1438 = _1434 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1440 = fma(_1432, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1438);
            float _1442 = fma(_1436, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1440);
            float _1444 = -_378;
            float _1446 = _1444 + _1442;
            float _1448 = abs(_1446);
            bool _1450 = _1448 >= _374;
            bool _1452 = !_1450;
            int _1454 = _1452 ? 0 : 1;
            _1416 = as_type<int>(_1432);
            _1364 = _1454;
            _1366 = _1446;
            _1368 = _1428;
            _1370 = _1426;
        }
        int _1456 = _1416;
        int _1458 = _1364;
        float _1460 = _1366;
        float _1462 = _1368;
        float _1464 = _1370;
        int _1466 = _1404 & 1;
        bool _1468 = _1466 != 0;
        int _1470 = _1456;
        int _1472 = _1458;
        float _1474 = _1464;
        float _1476 = _1462;
        if (_1468)
        {
            _1470 = _1404;
        }
        int _1478 = _1470;
        int _1480 = _1478;
        if (!_1468)
        {
            float _1482 = fma(_278, 2.0, _1406);
            float _1484 = fma(_270, 2.0, _1408);
            float2 _3875 = float2(_1482, _1484);
            float3 _1486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3875, float2(0.0), isnan(_3875))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3875, float2(0.0), isnan(_3875))).xyz;
            float _1488 = _1486.x;
            float _1490 = _1486.y;
            float _1492 = _1486.z;
            float _1494 = _1490 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1496 = fma(_1488, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1494);
            float _1498 = fma(_1492, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1496);
            float _1500 = -_378;
            float _1502 = _1500 + _1498;
            float _1504 = abs(_1502);
            bool _1506 = _1504 >= _374;
            bool _1508 = !_1506;
            int _1510 = _1508 ? 0 : 1;
            _1480 = _1510;
            _1418 = _1484;
            _1420 = _1482;
            _1422 = _1502;
        }
        int _1512 = _1480;
        float _1514 = _1418;
        float _1516 = _1420;
        float _1518 = _1422;
        int _1520 = _1458 & 1;
        bool _1522 = _1520 != 0;
        int _1524 = _1512;
        float _1526 = _1518;
        float _1528 = _1516;
        if (_1522)
        {
            _1424 = _1460;
        }
        float _1530 = _1424;
        float _1532 = _1530;
        if (_1522)
        {
            _424 = _1462;
        }
        float _1534 = _424;
        float _1536 = _1534;
        if (!_1522)
        {
            float _1538 = fma(_278, -4.0, _1464);
            float _1540 = fma(_270, -4.0, _1462);
            float2 _3955 = float2(_1538, _1540);
            float3 _1542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3955, float2(0.0), isnan(_3955))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3955, float2(0.0), isnan(_3955))).xyz;
            float _1544 = _1542.x;
            float _1546 = _1542.y;
            float _1548 = _1542.z;
            float _1550 = _1546 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1552 = fma(_1544, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1550);
            float _1554 = fma(_1548, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1552);
            float _1556 = -_378;
            float _1558 = _1556 + _1554;
            float _1560 = abs(_1558);
            bool _1562 = _1560 >= _374;
            bool _1564 = !_1562;
            int _1566 = _1564 ? 0 : 1;
            _1472 = _1566;
            _1532 = _1558;
            _1474 = _1538;
            _1536 = _1540;
            _1476 = _1544;
        }
        int _1568 = _1472;
        float _1570 = _1532;
        float _1572 = _1474;
        float _1574 = _1536;
        float _1576 = _1476;
        int _1578 = _1512 & 1;
        bool _1580 = _1578 != 0;
        float _1582 = _1576;
        float _1584 = _1574;
        float _1586 = _1572;
        if (_1580)
        {
            _1582 = _1514;
        }
        float _1588 = _1582;
        float _1590 = _1588;
        if (!_1580)
        {
            float _1592 = fma(_278, 4.0, _1516);
            float _1594 = fma(_270, 4.0, _1514);
            float2 _4031 = float2(_1592, _1594);
            float3 _1596 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4031, float2(0.0), isnan(_4031))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4031, float2(0.0), isnan(_4031))).xyz;
            float _1598 = _1596.x;
            float _1600 = _1596.y;
            float _1602 = _1596.z;
            float _1604 = _1600 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1606 = fma(_1598, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1604);
            float _1608 = fma(_1602, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1606);
            float _1610 = -_378;
            float _1612 = _1610 + _1608;
            float _1614 = abs(_1612);
            bool _1616 = _1614 >= _374;
            bool _1618 = !_1616;
            int _1620 = _1618 ? 0 : 1;
            _1524 = _1620;
            _1526 = _1612;
            _1528 = _1592;
            _1590 = _1594;
        }
        int _1622 = _1524;
        float _1624 = _1526;
        float _1626 = _1528;
        float _1628 = _1590;
        int _1630 = _1568 & 1;
        bool _1632 = _1630 != 0;
        int _1634 = _1632 ? (-1) : 0;
        float _1636 = _1628;
        float _1638 = _1626;
        if (_1632)
        {
            bool _1640 = _1570 >= 0.0;
            bool _1642 = isnan(_1570);
            bool _1644 = _1640 || _1642;
            bool _1646 = isnan(0.0);
            bool _1648 = _1644 || _1646;
            _426 = _1648 ? (-1) : 0;
        }
        int _1650 = _426;
        int _1652 = _1650;
        if (!_1632)
        {
            float _1654 = fma(_278, -8.0, _1572);
            float _1656 = fma(_270, -8.0, _1574);
            float2 _4118 = float2(_1654, _1656);
            float3 _1658 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4118, float2(0.0), isnan(_4118))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4118, float2(0.0), isnan(_4118))).xyz;
            float _1660 = _1658.x;
            float _1662 = _1658.y;
            float _1664 = _1658.z;
            float _1666 = _1662 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1668 = fma(_1660, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1666);
            float _1670 = fma(_1664, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1668);
            float _1672 = -_378;
            float _1674 = _1672 + _1670;
            bool _1676 = _1674 >= 0.0;
            bool _1678 = isnan(_1674);
            bool _1680 = _1676 || _1678;
            bool _1682 = isnan(0.0);
            bool _1684 = _1680 || _1682;
            _1584 = _1656;
            _1586 = _1654;
            _1652 = _1684 ? (-1) : 0;
        }
        float _1686 = _1584;
        float _1688 = _1586;
        int _1690 = _1652;
        int _1692 = _1622 & 1;
        bool _1694 = _1692 != 0;
        if (_1694)
        {
            bool _1696 = _1624 >= 0.0;
            bool _1698 = isnan(_1624);
            bool _1700 = _1696 || _1698;
            bool _1702 = isnan(0.0);
            bool _1704 = _1700 || _1702;
            _1634 = _1704 ? (-1) : 0;
        }
        int _1706 = _1634;
        int _1708 = _1706;
        if (!_1694)
        {
            float _1710 = fma(_278, 8.0, _1626);
            float _1712 = fma(_270, 8.0, _1628);
            float2 _4202 = float2(_1710, _1712);
            float3 _1714 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4202, float2(0.0), isnan(_4202))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4202, float2(0.0), isnan(_4202))).xyz;
            float _1716 = _1714.x;
            float _1718 = _1714.y;
            float _1720 = _1714.z;
            float _1722 = _1718 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1724 = fma(_1716, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1722);
            float _1726 = fma(_1720, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1724);
            float _1728 = -_378;
            float _1730 = _1728 + _1726;
            bool _1732 = _1730 >= 0.0;
            bool _1734 = isnan(_1730);
            bool _1736 = _1732 || _1734;
            bool _1738 = isnan(0.0);
            bool _1740 = _1736 || _1738;
            _1636 = _1712;
            _1638 = _1710;
            _1708 = _1740 ? (-1) : 0;
        }
        float _1742 = _1636;
        float _1744 = _1638;
        int _1746 = _1708;
        float _1748 = -_1686;
        float _1750 = _57 + _1748;
        float _1752 = -_57;
        float _1754 = _1752 + _1742;
        float _1756 = -_1688;
        float _1758 = _55 + _1756;
        float _1760 = -_55;
        float _1762 = _1760 + _1744;
        float _1764 = _262 * _1750;
        float _1766 = _262 * _1754;
        float _1768 = _278 + _270;
        float _1770 = _364 * 0.75;
        float _1772 = fma(_250, _1758, _1764);
        float _1774 = fma(_250, _1762, _1766);
        float _1776 = 1.0 / _1768;
        float _1778 = _1772 + _1774;
        bool _1780 = _1772 < _1774;
        int _1782 = ~_1690;
        int _1784 = (_1780 ? (-1) : 0) & _1782;
        bool _1786 = _1772 >= _1774;
        bool _1788 = isnan(_1772);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan(_1774);
        bool _1794 = _1790 || _1792;
        int _1796 = ~_1746;
        int _1798 = (_1794 ? (-1) : 0) & _1796;
        float _1800 = precise::min(_1772, _1774);
        float _1802 = 1.0 / _1778;
        int _1804 = ~_1784;
        int _1806 = _1804 & _1798;
        int _1808 = ~_1798;
        int _1810 = _1784 & _1808;
        int _1812 = _1806 | _1810;
        int _1814 = _1784 & _1798;
        int _1816 = _1812 | _1814;
        bool _1818 = _133 < _378;
        int _1820 = (_1818 ? (-1) : 0) ^ _1816;
        float _1822 = -_1800;
        float _1824 = fma(_1822, _1802, 0.5);
        float _1826 = (_1820 != 0) ? _1824 : 0.0;
        float _1828 = precise::max(_1770, _1826);
        float _1830 = _296 * _1828;
        float _1832 = _1830 * _1776;
        _174 = as_type<int>(_1832);
    }
    int _1834 = _174;
    out.m_32.x = as_type<float>(_1834);
    out.m_32.y = as_type<float>(_1834);
    out.m_32.z = as_type<float>(_1834);
    out.m_32.w = as_type<float>(_1834);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

