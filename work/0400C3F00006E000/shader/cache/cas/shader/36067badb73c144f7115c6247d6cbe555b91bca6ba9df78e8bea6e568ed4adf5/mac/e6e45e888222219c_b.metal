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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_57 [[user(locn3), flat]];
    float4 m_39 [[user(locn4)]];
    float4 m_43 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _789 = float2(_83, _85);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_789, float2(0.0), isnan(_789))).w;
    float _89 = in.m_39.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_41.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.x;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _81 * _93;
    float _123 = _81 * _99;
    float _125 = _81 * _105;
    float _127 = -_107;
    float _129 = _127 + 1.0;
    float _131 = _121 + (-0.5);
    float _133 = _123 + (-0.5);
    float _135 = _81 * _119;
    float _137 = _131 * _131;
    float _139 = 1.0 / _125;
    float _141 = fma(_133, _133, _137);
    float _143 = rsqrt(_141);
    float _145 = _135 * _139;
    float _147 = _143 * _87;
    float _149 = _129 * _147;
    float _151 = _81 * _113;
    float _153 = _149 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _155 = _151 * _139;
    float _157 = fma(_133, _153, _123);
    float _159 = fma(_131, _153, _121);
    float2 _901 = float2(_155, _145);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_901, float2(0.0), isnan(_901))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_901, float2(0.0), isnan(_901))).x;
    float2 _909 = float2(_157, _159);
    float4 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_909, float2(0.0), isnan(_909))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_909, float2(0.0), isnan(_909))).xyzw;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float _172 = _164.w;
    float _174 = in.m_45.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_45.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_45.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_47.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_47.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_47.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_41.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _218 = _216 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _220 = 1.0 / _218;
    float _222 = _81 * _178;
    float _224 = _81 * _184;
    float _226 = _81 * _190;
    float _228 = _222 * _222;
    float _230 = fma(_224, _224, _228);
    float _232 = fma(_226, _226, _230);
    float _234 = _81 * _196;
    float _236 = rsqrt(_232);
    float _238 = in.m_49.w;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _222 * _236;
    float _246 = _81 * _202;
    float _248 = _224 * _236;
    float _250 = _226 * _236;
    float _252 = _234 * _244;
    float _254 = in.m_51.w;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = fma(_246, _248, _252);
    float _262 = _81 * _208;
    float _264 = _81 * _214;
    float _266 = in.m_53.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_262, _250, _260);
    float _274 = _264 * _139;
    float _276 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _278 = abs(_272);
    float _280 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _282 = _278 + _280;
    float _284 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _286 = fma(_274, (*spvDescriptorSet0.fp_c8)._m0[30].w, _284);
    float _288 = _282 * _220;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = fma(_290, -2.0, 3.0);
    float _294 = _290 * _290;
    float _296 = 1.0 / _286;
    float _298 = _292 * _294;
    float _300 = _81 * _258;
    float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _304 = _296 * _302;
    float _306 = _81 * _270;
    float _308 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _310 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[30].w, _308);
    float _312 = 1.0 / _310;
    float _314 = _172 * _300;
    float _316 = _81 * _242;
    float _318 = _314 * _316;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _324 = -_304;
    float _326 = fma(_312, _322, _324);
    float _328 = _326 * _276;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _320 * _330;
    float _334 = _332 * _298;
    float _336 = _334 * _306;
    bool _340 = _336 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _342 = isnan(_336);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _348 = _344 || _346;
    float _350 = in.m_55.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_55.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_55.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _304;
    if (!_348)
    {
        discard_fragment();
    }
    float _370 = _168 * _168;
    float _372 = _81 * _354;
    float _374 = _81 * _360;
    float _376 = _81 * _366;
    float _378 = _372 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _380 = _372 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _382 = _372 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _384 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[0].x, _378);
    float _386 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[1].x, _380);
    float _388 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[2].x, _382);
    float _390 = fma(_376, (*spvDescriptorSet0.fp_c8)._m0[0].z, _384);
    float _392 = fma(_376, (*spvDescriptorSet0.fp_c8)._m0[1].z, _386);
    float _394 = fma(_376, (*spvDescriptorSet0.fp_c8)._m0[2].z, _388);
    float _396 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _398 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _400 = _394 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _402 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _404 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _396);
    float _406 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _398);
    float _408 = _390 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _410 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _402);
    float _412 = 1.0 / _400;
    float _414 = _392 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _416 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _410);
    float _418 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _404);
    float _420 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _406);
    float _422 = _416 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _424 = _418 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _426 = _420 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _428 = _422 * _412;
    float _430 = -_424;
    float _432 = fma(_408, _428, _430);
    float _434 = -_426;
    float _436 = fma(_414, _428, _434);
    float _438 = _432 + _436;
    float _440 = in.m_57.x;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _444 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _442;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _448 = _446 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _450 = 1.0 / _444;
    float _452 = 1.0 / _448;
    float _454 = 1.0 / _440;
    float _456 = _438 * _454;
    float _458 = _456 * 4.0;
    float _460 = fma(_458, 0.5, 0.5);
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _462 * _462;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _470 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _468;
    float _472 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _474 = _466 + _472;
    float _476 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _478 = _466 + _476;
    float _480 = _474 * _452;
    float _482 = _478 * _450;
    float _484 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _486 = _484 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _488 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _490 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _488;
    float _492 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _494 = _492 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    bool _496 = _466 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _498 = isnan(_466);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _510 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _508;
    float _512 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _514 = _512 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    bool _516 = _466 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _518 = isnan(_466);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = fma(_470, _482, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _530 = -_506;
    float _532 = _530 + 1.0;
    float _534 = fma(_510, _482, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _536 = fma(_490, _482, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _538 = fma(_486, _480, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _540 = _526 * _532;
    float _542 = fma(_514, _480, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _544 = fma(_494, _480, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _546 = -_526;
    float _548 = _546 + 1.0;
    float _550 = _536 * _540;
    bool _552 = _466 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _554 = isnan(_466);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _528 * _540;
    float _566 = _534 * _540;
    float _568 = -_562;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, (*spvDescriptorSet0.fp_c9)._m0[123].x, _564);
    float _574 = fma(_548, (*spvDescriptorSet0.fp_c9)._m0[123].y, _566);
    float _576 = fma(_548, (*spvDescriptorSet0.fp_c9)._m0[123].z, _550);
    float _578 = _506 * _570;
    float _580 = fma(_544, _578, _576);
    float _582 = fma(_538, _578, _572);
    float _584 = fma(_542, _578, _574);
    float _586 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _588 = _466 + _586;
    float _590 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _592 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _590;
    float _594 = fma(_562, (*spvDescriptorSet0.fp_c9)._m0[125].x, _582);
    float _596 = fma(_562, (*spvDescriptorSet0.fp_c9)._m0[125].y, _584);
    float _598 = fma(_562, (*spvDescriptorSet0.fp_c9)._m0[125].z, _580);
    float _600 = 1.0 / _592;
    float _602 = _588 * _600;
    bool _604 = _466 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _606 = isnan(_466);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _618 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _616;
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _622 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _620;
    float _624 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _626 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _624;
    bool _628 = _466 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _630 = isnan(_466);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -_614;
    float _642 = _640 + 1.0;
    float _644 = fma(_618, _602, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _646 = fma(_622, _602, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _648 = fma(_626, _602, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _650 = _638 * _642;
    float _652 = -_638;
    float _654 = _652 + 1.0;
    float _656 = _644 * _650;
    float _658 = _646 * _650;
    float _660 = _648 * _650;
    float _662 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].x, _656);
    float _664 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].y, _658);
    float _666 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].z, _660);
    float _668 = fma(_614, (*spvDescriptorSet0.fp_c9)._m0[108].x, _662);
    float _670 = fma(_614, (*spvDescriptorSet0.fp_c9)._m0[108].y, _664);
    float _672 = _166 * _166;
    float _674 = fma(_614, (*spvDescriptorSet0.fp_c9)._m0[108].z, _666);
    float _676 = _170 * _170;
    float _678 = -_594;
    float _680 = _678 + _668;
    float _682 = _87 * _672;
    float _684 = _87 * _370;
    float _686 = _87 * _676;
    float _688 = -_596;
    float _690 = _688 + _670;
    float _692 = -_598;
    float _694 = _692 + _674;
    float _696 = fma(_682, _680, _594);
    float _698 = fma(_684, _690, _596);
    float _700 = fma(_686, _694, _598);
    float _702 = _696 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _704 = _698 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _706 = _700 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    if (!_348)
    {
        out.m_60.x = _702;
        out.m_60.y = _704;
        out.m_60.z = _706;
        out.m_60.w = _320;
        return out;
    }
    float _708 = _704 * 0.715200006961822509765625;
    float _710 = fma(_702, 0.2125999927520751953125, _708);
    float _712 = fma(_706, 0.072200000286102294921875, _710);
    bool _714 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _716 = 1.0 / _712;
    float _718 = 0.0 + _336;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _720;
    if (_714)
    {
        float _724 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _726 = _304 + _724;
        _368 = _726;
    }
    float _728 = _368;
    float _730 = _716 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = _728;
    if (_714)
    {
        float _736 = _728 * 8.0;
        float _738 = precise::clamp(_736, 0.0, 1.0);
        _734 = _738;
    }
    float _740 = _734;
    float _742 = fma(_732, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_714)
    {
        float _744 = _720 * _740;
        _722 = _744;
    }
    float _746 = _722;
    float _748 = _702 * _742;
    float _750 = _704 * _742;
    float _752 = _706 * _742;
    float _754 = 0.0 + _746;
    float _756 = precise::clamp(_754, 0.0, 1.0);
    out.m_60.x = _748;
    out.m_60.y = _750;
    out.m_60.z = _752;
    out.m_60.w = _756;
    return out;
}

