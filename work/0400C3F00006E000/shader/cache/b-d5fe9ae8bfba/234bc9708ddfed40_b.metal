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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _49;
    float _77 = _75 * _55;
    float _79 = _75 * _61;
    float _81 = _75 * _67;
    float _83 = _75 * _73;
    float2 _1163 = float2(_77, _79);
    float2 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1163, float2(0.0), isnan(_1163)), int2(0), component::x).xz;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _1178 = float2(_81, _83);
    float3 _95 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1178, float2(0.0), isnan(_1178)), int2(0), component::x).xzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _1192 = float2(_81, _83);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1192, float2(0.0), isnan(_1192))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1192, float2(0.0), isnan(_1192))).x;
    float _105 = precise::max(_89, _91);
    float _107 = precise::max(_97, _99);
    float _109 = precise::min(_89, _91);
    float _111 = precise::min(_97, _99);
    float _113 = precise::max(_105, _107);
    float _115 = precise::min(_109, _111);
    float _117 = precise::max(_101, _113);
    float _119 = precise::min(_101, _115);
    float _121 = _117 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _123 = -_119;
    float _125 = _117 + _123;
    float _127 = precise::max(_121, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _131 = _125 >= _127;
    bool _133 = isnan(_125);
    bool _135 = _131 || _133;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    float _141 = _127;
    float _143 = _121;
    float _145 = 0.0;
    float _147 = 0.0;
    if (!_139)
    {
        float2 _1257 = float2(_81, _83);
        float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1257, float2(0.0), isnan(_1257))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1257, float2(0.0), isnan(_1257))).xyzw;
        float _152 = _150.x;
        float _154 = _150.y;
        float _156 = _150.z;
        float _158 = _150.w;
        _141 = _152;
        _143 = _154;
        _145 = _156;
        _147 = _158;
    }
    float _160 = _141;
    float _162 = _143;
    float _164 = _145;
    float _166 = _147;
    float _168 = in.m_37.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_37.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_37.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _75 * _172;
    float _206 = -_103;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _210 = _206 + _208;
    float _212 = _75 * _178;
    float _214 = _75 * _184;
    float _216 = _75 * _190;
    float _218 = _75 * _196;
    float _220 = _75 * _202;
    float _222 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _224 = _220 * _222;
    float _226 = _216 * _222;
    float _228 = fma(_204, _210, _224);
    float _230 = _218 * _222;
    float _232 = fma(_214, _210, _226);
    float _234 = fma(_212, _210, _230);
    float _236 = 1.0 / _228;
    float _238 = _234 * _236;
    float _240 = _232 * _236;
    float _242 = -_83;
    float _244 = _242 + _238;
    float _246 = -_81;
    float _248 = _246 + _240;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _252 = _248 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _254 = _250 * _250;
    float _256 = fma(_252, _252, _254);
    bool _258 = !_139;
    float _260 = _164;
    float _262 = _160;
    float _264 = _162;
    float _266 = _166;
    if (!_258)
    {
        float2 _1421 = float2(_81, _83);
        float _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1421, float2(0.0), isnan(_1421)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1421, float2(0.0), isnan(_1421)), int2(1, -1)).x;
        float2 _1432 = float2(_81, _83);
        float _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1432, float2(0.0), isnan(_1432)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1432, float2(0.0), isnan(_1432)), int2(-1, 1)).x;
        float _272 = _99 + _89;
        float _274 = _97 + _91;
        float _276 = fma(_101, -2.0, _272);
        float _278 = fma(_101, -2.0, _274);
        float _280 = _89 + _268;
        float _282 = _99 + _268;
        float _284 = _89 + _270;
        float _286 = _99 + _270;
        float _288 = fma(_91, -2.0, _280);
        float _290 = fma(_99, -2.0, _282);
        float _292 = fma(_89, -2.0, _284);
        float _294 = fma(_97, -2.0, _286);
        float _296 = abs(_276);
        float _298 = abs(_288);
        float _300 = fma(_296, 2.0, _298);
        float _302 = abs(_278);
        float _304 = abs(_292);
        float _306 = fma(_302, 2.0, _304);
        float _308 = abs(_294);
        float _310 = _308 + _300;
        float _312 = abs(_290);
        float _314 = _312 + _306;
        bool _316 = _314 >= _310;
        float _318 = float(_316);
        bool _320 = _314 < _310;
        bool _322 = isnan(_314);
        bool _324 = _320 || _322;
        bool _326 = isnan(_310);
        bool _328 = _324 || _326;
        float _330 = float(_328);
        float _332 = _91 * _318;
        float _334 = _97 * _318;
        float _336 = _318 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _338 = _330 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _340 = fma(_89, _330, _332);
        float _342 = fma(_99, _330, _334);
        float _344 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[0].x, _336);
        float _346 = _318 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _348 = -_101;
        float _350 = _348 + _340;
        float _352 = -_101;
        float _354 = _352 + _342;
        float _356 = abs(_350);
        float _358 = abs(_354);
        bool _360 = _356 >= _358;
        float _362 = -_344;
        float _364 = _360 ? _362 : _344;
        float _366 = _364 * 0.5;
        float _368 = fma(_330, _366, _81);
        float _370 = fma(_318, _366, _83);
        float _372 = -_346;
        float _374 = _372 + _368;
        float _376 = -_338;
        float _378 = _376 + _370;
        float _380 = _346 + _368;
        float _382 = _338 + _370;
        float2 _1604 = float2(_374, _378);
        float3 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1604, float2(0.0), isnan(_1604))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1604, float2(0.0), isnan(_1604))).xyz;
        float _386 = _384.x;
        float _388 = _384.y;
        float _390 = _384.z;
        float2 _1618 = float2(_380, _382);
        float3 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1618, float2(0.0), isnan(_1618))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1618, float2(0.0), isnan(_1618))).xyz;
        float _394 = _392.x;
        float _396 = _392.y;
        float _398 = _392.z;
        float _400 = 1.0 / _125;
        float _402 = _274 + _272;
        float _404 = _282 + _284;
        float _406 = _360 ? _340 : _342;
        float _408 = abs(_350);
        float _410 = abs(_354);
        float _412 = _360 ? _408 : _410;
        float _414 = fma(_402, 2.0, _404);
        float _416 = fma(_414, -0.083333335816860198974609375, _101);
        float _418 = abs(_416);
        float _420 = _418 * _400;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        float _424 = fma(_422, 6.0, -15.0);
        float _426 = _422 * _422;
        float _428 = fma(_422, _424, 10.0);
        float _430 = _428 * _426;
        float _432 = _422 * _430;
        float _434 = _388 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _436 = _396 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _438 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[2].x, _434);
        float _440 = _101 + _406;
        float _442 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[2].x, _436);
        float _444 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[2].z, _438);
        float _446 = _440 * 0.5;
        float _448 = _412 * 0.25;
        float _450 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[2].z, _442);
        float _452 = -_446;
        float _454 = _452 + _444;
        float _456 = -_446;
        float _458 = _456 + _450;
        float _460 = abs(_454);
        bool _462 = _460 >= _448;
        float _464 = abs(_458);
        bool _466 = _464 >= _448;
        bool _468 = false;
        float _470 = _442;
        float _472 = _454;
        float _474 = _374;
        float _476 = _378;
        float _478 = _430;
        bool _480 = _462;
        float _482 = _426;
        float _484 = _380;
        float _486 = _458;
        bool _488 = _466;
        float _490 = _382;
        float _492 = _448;
        if (_462)
        {
            _468 = true;
        }
        bool _494 = _468;
        bool _496 = _494;
        if (!_462)
        {
            float _498 = -_346;
            float _500 = _498 + _374;
            float _502 = -_338;
            float _504 = _502 + _378;
            float2 _1771 = float2(_500, _504);
            float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1771, float2(0.0), isnan(_1771))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1771, float2(0.0), isnan(_1771))).xyz;
            float _508 = _506.x;
            float _510 = _506.y;
            float _512 = _506.z;
            float _514 = _510 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _516 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[2].x, _514);
            float _518 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[2].z, _516);
            float _520 = -_446;
            float _522 = _520 + _518;
            float _524 = abs(_522);
            bool _526 = _524 >= _448;
            _470 = _516;
            _496 = _526;
            _472 = _522;
            _474 = _500;
            _476 = _504;
            _478 = _518;
        }
        float _528 = _470;
        bool _530 = _496;
        float _532 = _472;
        float _534 = _474;
        float _536 = _476;
        float _538 = _478;
        float _540 = _538;
        float _542 = _528;
        float _544 = _536;
        bool _546 = _530;
        if (_466)
        {
            _480 = true;
        }
        bool _548 = _480;
        bool _550 = _548;
        if (_466)
        {
            _482 = _380;
        }
        float _552 = _482;
        float _554 = _552;
        if (_466)
        {
            _540 = _382;
        }
        float _556 = _540;
        float _558 = _556;
        if (!_466)
        {
            float _560 = _346 + _380;
            float _562 = _338 + _382;
            float2 _1852 = float2(_560, _562);
            float3 _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1852, float2(0.0), isnan(_1852))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1852, float2(0.0), isnan(_1852))).xyz;
            float _566 = _564.x;
            float _568 = _564.y;
            float _570 = _564.z;
            float _572 = _568 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _574 = fma(_566, (*spvDescriptorSet0.fp_c3)._m0[2].x, _572);
            float _576 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[2].z, _574);
            float _578 = -_446;
            float _580 = _578 + _576;
            float _582 = abs(_580);
            bool _584 = _582 >= _448;
            _542 = _566;
            _484 = _570;
            _550 = _584;
            _554 = _560;
            _558 = _562;
            _486 = _580;
        }
        float _586 = _542;
        float _588 = _484;
        bool _590 = _550;
        float _592 = _554;
        float _594 = _558;
        float _596 = _486;
        float _598 = _588;
        float _600 = _586;
        float _602 = _592;
        float _604 = _594;
        float _606 = _596;
        bool _608 = _590;
        if (_530)
        {
            _598 = _532;
        }
        float _610 = _598;
        float _612 = _610;
        if (_530)
        {
            _488 = true;
        }
        bool _614 = _488;
        bool _616 = _614;
        if (_530)
        {
            _490 = _534;
        }
        float _618 = _490;
        float _620 = _618;
        if (!_530)
        {
            float _622 = fma(_346, -1.5, _534);
            float _624 = fma(_338, -1.5, _536);
            float2 _1936 = float2(_622, _624);
            float3 _626 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1936, float2(0.0), isnan(_1936))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1936, float2(0.0), isnan(_1936))).xyz;
            float _628 = _626.x;
            float _630 = _626.y;
            float _632 = _626.z;
            float _634 = _630 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _636 = fma(_628, (*spvDescriptorSet0.fp_c3)._m0[2].x, _634);
            float _638 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[2].z, _636);
            float _640 = -_446;
            float _642 = _640 + _638;
            float _644 = abs(_642);
            bool _646 = _644 >= _448;
            _600 = _628;
            _616 = _646;
            _620 = _622;
            _544 = _624;
            _612 = _642;
        }
        float _648 = _600;
        bool _650 = _616;
        float _652 = _620;
        float _654 = _544;
        float _656 = _612;
        float _658 = _648;
        float _660 = _656;
        float _662 = _654;
        float _664 = _652;
        bool _666 = _650;
        if (_590)
        {
            _546 = true;
        }
        bool _668 = _546;
        bool _670 = _668;
        if (!_590)
        {
            float _672 = fma(_346, 1.5, _592);
            float _674 = fma(_338, 1.5, _594);
            float2 _2005 = float2(_672, _674);
            float3 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2005, float2(0.0), isnan(_2005))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2005, float2(0.0), isnan(_2005))).xyz;
            float _678 = _676.x;
            float _680 = _676.y;
            float _682 = _676.z;
            float _684 = _680 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _686 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[2].x, _684);
            float _688 = fma(_682, (*spvDescriptorSet0.fp_c3)._m0[2].z, _686);
            float _690 = -_446;
            float _692 = _690 + _688;
            float _694 = abs(_692);
            bool _696 = _694 >= _448;
            _658 = _678;
            _670 = _696;
            _602 = _672;
            _604 = _674;
            _606 = _692;
        }
        float _698 = _658;
        bool _700 = _670;
        float _702 = _602;
        float _704 = _604;
        float _706 = _606;
        float _708 = _698;
        float _710 = _706;
        float _712 = _702;
        float _714 = _704;
        int _717 = _700 ? (-1) : 0;
        if (_650)
        {
            _608 = true;
        }
        bool _719 = _608;
        bool _721 = _719;
        if (!_650)
        {
            float _723 = fma(_346, -3.0, _652);
            float _725 = fma(_338, -3.0, _654);
            float2 _2075 = float2(_723, _725);
            float3 _727 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2075, float2(0.0), isnan(_2075))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2075, float2(0.0), isnan(_2075))).xyz;
            float _729 = _727.x;
            float _731 = _727.y;
            float _733 = _727.z;
            float _735 = _731 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _737 = fma(_729, (*spvDescriptorSet0.fp_c3)._m0[2].x, _735);
            float _739 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[2].z, _737);
            float _741 = -_446;
            float _743 = _741 + _739;
            float _745 = abs(_743);
            bool _747 = _745 >= _448;
            _708 = _729;
            _721 = _747;
            _660 = _743;
            _662 = _725;
            _664 = _723;
        }
        float _749 = _708;
        bool _751 = _721;
        float _753 = _660;
        float _755 = _662;
        float _757 = _664;
        float _759 = _749;
        float _761 = _753;
        float _763 = _757;
        int _765 = _751 ? (-1) : 0;
        if (_700)
        {
            _666 = true;
        }
        bool _767 = _666;
        bool _769 = _767;
        if (!_700)
        {
            float _771 = fma(_346, 3.0, _702);
            float _773 = fma(_338, 3.0, _704);
            float2 _2144 = float2(_771, _773);
            float3 _775 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2144, float2(0.0), isnan(_2144))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2144, float2(0.0), isnan(_2144))).xyz;
            float _777 = _775.x;
            float _779 = _775.y;
            float _781 = _775.z;
            float _783 = _779 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _785 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[2].x, _783);
            float _787 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[2].z, _785);
            float _789 = -_446;
            float _791 = _789 + _787;
            float _793 = abs(_791);
            bool _795 = _793 >= _448;
            _759 = _777;
            _769 = _795;
            _710 = _791;
            _712 = _771;
            _714 = _773;
        }
        float _797 = _759;
        bool _799 = _769;
        float _801 = _710;
        float _803 = _712;
        float _805 = _714;
        float _807 = _797;
        if (_751)
        {
            bool _809 = _753 >= 0.0;
            bool _811 = isnan(_753);
            bool _813 = _809 || _811;
            bool _815 = isnan(0.0);
            bool _817 = _813 || _815;
            _717 = _817 ? (-1) : 0;
        }
        int _819 = _717;
        int _821 = _819;
        if (_751)
        {
            _761 = _755;
        }
        float _823 = _761;
        float _825 = _823;
        if (!_751)
        {
            float _827 = fma(_346, -12.0, _757);
            float _829 = fma(_338, -12.0, _755);
            float2 _2228 = float2(_827, _829);
            float3 _831 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2228, float2(0.0), isnan(_2228))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2228, float2(0.0), isnan(_2228))).xyz;
            float _833 = _831.x;
            float _835 = _831.y;
            float _837 = _831.z;
            float _839 = _835 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _841 = fma(_833, (*spvDescriptorSet0.fp_c3)._m0[2].x, _839);
            float _843 = fma(_837, (*spvDescriptorSet0.fp_c3)._m0[2].z, _841);
            float _845 = -_446;
            float _847 = _845 + _843;
            bool _849 = _847 >= 0.0;
            bool _851 = isnan(_847);
            bool _853 = _849 || _851;
            bool _855 = isnan(0.0);
            bool _857 = _853 || _855;
            _825 = _829;
            _807 = _841;
            _492 = _847;
            _763 = _827;
            _821 = _857 ? (-1) : 0;
        }
        float _859 = _825;
        float _861 = _807;
        float _863 = _492;
        float _865 = _763;
        int _867 = _821;
        float _869 = _863;
        float _871 = _861;
        if (_799)
        {
            bool _873 = _801 >= 0.0;
            bool _875 = isnan(_801);
            bool _877 = _873 || _875;
            bool _879 = isnan(0.0);
            bool _881 = _877 || _879;
            _765 = _881 ? (-1) : 0;
        }
        int _883 = _765;
        int _885 = _883;
        if (_799)
        {
            _869 = _803;
        }
        float _887 = _869;
        float _889 = _887;
        if (_799)
        {
            _871 = _805;
        }
        float _891 = _871;
        float _893 = _891;
        if (!_799)
        {
            float _895 = fma(_346, 12.0, _803);
            float _897 = fma(_338, 12.0, _805);
            float2 _2326 = float2(_895, _897);
            float3 _899 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2326, float2(0.0), isnan(_2326))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2326, float2(0.0), isnan(_2326))).xyz;
            float _901 = _899.x;
            float _903 = _899.y;
            float _905 = _899.z;
            float _907 = _903 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _909 = fma(_901, (*spvDescriptorSet0.fp_c3)._m0[2].x, _907);
            float _911 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[2].z, _909);
            float _913 = -_446;
            float _915 = _913 + _911;
            bool _917 = _915 >= 0.0;
            bool _919 = isnan(_915);
            bool _921 = _917 || _919;
            bool _923 = isnan(0.0);
            bool _925 = _921 || _923;
            _893 = _897;
            _889 = _895;
            _885 = _925 ? (-1) : 0;
        }
        float _927 = _893;
        float _929 = _889;
        int _931 = _885;
        float _933 = -_859;
        float _935 = _83 + _933;
        float _937 = -_83;
        float _939 = _937 + _927;
        float _941 = -_81;
        float _943 = _941 + _929;
        float _945 = -_865;
        float _947 = _81 + _945;
        float _949 = _330 * _935;
        float _951 = _330 * _939;
        float _953 = fma(_318, _947, _949);
        float _955 = fma(_318, _943, _951);
        float _957 = _953 + _955;
        bool _959 = _953 < _955;
        int _961 = ~_867;
        int _963 = (_959 ? (-1) : 0) & _961;
        bool _965 = _953 >= _955;
        bool _967 = isnan(_953);
        bool _969 = _965 || _967;
        bool _971 = isnan(_955);
        bool _973 = _969 || _971;
        int _975 = ~_931;
        int _977 = (_973 ? (-1) : 0) & _975;
        float _979 = 1.0 / _957;
        float _981 = precise::min(_953, _955);
        int _983 = ~_963;
        int _985 = _983 & _977;
        int _987 = ~_977;
        int _989 = _963 & _987;
        int _991 = _985 | _989;
        int _993 = _963 & _977;
        int _995 = _991 | _993;
        bool _997 = _101 < _446;
        int _999 = (_997 ? (-1) : 0) ^ _995;
        float _1001 = _432 * 0.75;
        float _1003 = -_981;
        float _1005 = fma(_1003, _979, 0.5);
        float _1007 = (_999 != 0) ? _1005 : 0.0;
        float _1009 = precise::max(_1007, _1001);
        float _1011 = _364 * _1009;
        float _1013 = fma(_330, _1011, _81);
        float _1015 = fma(_318, _1011, _83);
        float2 _2500 = float2(_81, _83);
        float4 _1017 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2500, float2(0.0), isnan(_2500))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2500, float2(0.0), isnan(_2500))).xyzw;
        float _1019 = _1017.x;
        float _1021 = _1017.y;
        float _1023 = _1017.z;
        float _1025 = _1017.w;
        float2 _2516 = float2(_1013, _1015);
        float4 _1027 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2516, float2(0.0), isnan(_2516))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2516, float2(0.0), isnan(_2516))).xyzw;
        float _1029 = _1027.x;
        float _1031 = _1027.y;
        float _1033 = _1027.z;
        float _1035 = _1027.w;
        float _1037 = -_1029;
        float _1039 = _1019 + _1037;
        float _1041 = -_1033;
        float _1043 = _1023 + _1041;
        float _1045 = -_1031;
        float _1047 = _1021 + _1045;
        float _1049 = -_1035;
        float _1051 = _1025 + _1049;
        float _1053 = fma(_1039, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1029);
        float _1055 = fma(_1043, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1033);
        float _1057 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1031);
        float _1059 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1035);
        _260 = _1055;
        _262 = _1053;
        _264 = _1057;
        _266 = _1059;
    }
    float _1061 = _260;
    float _1063 = _262;
    float _1065 = _264;
    float _1067 = _266;
    float2 _2582 = float2(_240, _238);
    float4 _1069 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2582, float2(0.0), isnan(_2582))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2582, float2(0.0), isnan(_2582))).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float _1079 = sqrt(_256);
    float _1081 = 0.0 + _1079;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = fma(_1083, -0.5, 0.5);
    float _1087 = -_1061;
    float _1089 = _1075 + _1087;
    float _1091 = -_1063;
    float _1093 = _1071 + _1091;
    float _1095 = -_1065;
    float _1097 = _1073 + _1095;
    float _1099 = -_1067;
    float _1101 = _1077 + _1099;
    float _1103 = fma(_1085, _1089, _1061);
    float _1105 = fma(_1085, _1093, _1063);
    float _1107 = fma(_1085, _1097, _1065);
    float _1109 = fma(_1085, _1101, _1067);
    out.m_42.x = _1105;
    out.m_42.y = _1107;
    out.m_42.z = _1103;
    out.m_42.w = _1109;
    return out;
}

