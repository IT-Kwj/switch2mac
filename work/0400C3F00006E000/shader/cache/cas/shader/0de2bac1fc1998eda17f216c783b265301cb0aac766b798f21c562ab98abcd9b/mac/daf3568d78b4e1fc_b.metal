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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texturecube_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_44.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _82 * 0.15915493667125701904296875;
    float _88 = _78 * _70;
    float _90 = _78 * _76;
    float _92 = _86 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_84, _94, _90);
    float _98 = fma(_84, _94, _88);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1095 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1095, float2(0.0), isnan(_1095))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1112 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1112, float2(0.0), isnan(_1112))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1112, float2(0.0), isnan(_1112))).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _110 * _110;
    float _124 = fma(_108, _108, _122);
    float _126 = fma(_112, _112, _124);
    float _128 = rsqrt(_126);
    float _130 = _110 * _128;
    float _132 = _108 * _128;
    float _134 = _112 * _128;
    float _136 = _130 * _130;
    float _138 = fma(_132, _132, _136);
    float _140 = sqrt(_138);
    bool _144 = _140 >= 0.00999999977648258209228515625;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan(0.00999999977648258209228515625);
    bool _152 = _148 || _150;
    float _154 = 0.0;
    float _156 = _136;
    float _158 = _98;
    float _160 = _128;
    float _162 = _140;
    if (!_152)
    {
        float _164 = fma(_134, _134, _136);
        _154 = _164;
    }
    float _166 = _154;
    float _168 = _132 * _118;
    float _170 = _130 * _118;
    float _172 = 0.0;
    if (!_152)
    {
        _172 = 0.0;
    }
    float _174 = _172;
    float _176 = _166;
    float _178 = _174;
    if (!_152)
    {
        float _180 = rsqrt(_166);
        _176 = _180;
    }
    float _182 = _176;
    if (!_152)
    {
        float _184 = _134 * _182;
        _156 = _184;
    }
    float _186 = _156;
    float _188 = _186;
    if (!_152)
    {
        float _190 = _130 * _182;
        _158 = _190;
    }
    float _192 = _158;
    float _194 = 0.0;
    float _196 = _192;
    if (!_152)
    {
        float _198 = _134 * _186;
        _194 = _198;
    }
    float _200 = _194;
    float _202 = _200;
    if (!_152)
    {
        float _204 = fma(_132, _192, -0.0);
        _160 = _204;
    }
    float _206 = _160;
    float _208 = _206;
    if (!_152)
    {
        float _210 = -_192;
        float _212 = (-0.0) + _210;
        _162 = _212;
    }
    float _214 = _162;
    float _216 = _214;
    if (!_152)
    {
        float _218 = -_192;
        float _220 = -_200;
        float _222 = fma(_130, _218, _220);
        _202 = _222;
    }
    float _224 = _202;
    float _226 = _224;
    if (!_152)
    {
        float _228 = _132 * _186;
        _196 = _228;
    }
    float _230 = _196;
    bool _232 = !_152;
    float _234 = _230;
    if (!_232)
    {
        float _236 = rsqrt(_138);
        float _238 = _130 * _236;
        float _240 = -_236;
        float _242 = _132 * _240;
        float _244 = _134 * _238;
        float _246 = _132 * _242;
        float _248 = _134 * _242;
        float _250 = _244 * _244;
        float _252 = -_246;
        float _254 = fma(_130, _238, _252);
        float _256 = fma(_248, _248, _250);
        float _258 = fma(_254, _254, _256);
        float _260 = rsqrt(_258);
        float _262 = _254 * _260;
        float _264 = _248 * _260;
        float _266 = -_244;
        float _268 = fma(_266, _260, -0.0);
        _208 = _242;
        _226 = _238;
        _188 = _268;
        _234 = 0.0;
        _178 = _264;
        _216 = _262;
    }
    float _270 = _208;
    float _272 = _226;
    float _274 = _188;
    float _276 = _234;
    float _278 = _178;
    float _280 = _216;
    float _282 = fma(_116, _270, _170);
    float _284 = _134 * _118;
    float _286 = fma(_116, _272, _168);
    float _288 = in.m_46.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_116, _276, _284);
    float _298 = fma(_120, _278, _286);
    float _300 = in.m_46.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = fma(_120, _280, _296);
    float _310 = in.m_48.w;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_48.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_298, _298, _306);
    float _324 = in.m_48.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = fma(_308, _308, _322);
    float _332 = rsqrt(_330);
    float _334 = _78 * _292;
    float _336 = -_130;
    float _338 = fma(_294, _332, _336);
    float _340 = -_132;
    float _342 = fma(_298, _332, _340);
    float _344 = _78 * _304;
    float _346 = -_134;
    float _348 = fma(_308, _332, _346);
    float _350 = fma(_338, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _352 = fma(_342, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _354 = _344 * _344;
    float _356 = fma(_348, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _358 = _350 * _350;
    float _360 = _78 * _314;
    float _362 = fma(_334, _334, _354);
    float _364 = fma(_352, _352, _358);
    float _366 = _78 * _320;
    float _368 = _78 * _328;
    float _370 = 1.0 / _360;
    float _372 = fma(_356, _356, _364);
    float _374 = sqrt(_362);
    float _376 = rsqrt(_372);
    float _378 = _366 * _370;
    float _380 = _368 * _370;
    float _382 = fma(_378, -0.5, 0.5);
    float _384 = fma(_380, 0.5, 0.5);
    float _386 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _388 = fma(_374, (*spvDescriptorSet0.fp_c4)._m0[1].x, _386);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _352 * _376;
    float _394 = _356 * _376;
    float _396 = -_392;
    float _398 = fma(_390, _396, _392);
    float _400 = -_394;
    float _402 = fma(_390, _400, _394);
    float _404 = fma(_398, 0.0199999995529651641845703125, _384);
    float _406 = fma(_402, 0.0199999995529651641845703125, _382);
    float2 _1542 = float2(_404, _406);
    float _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1542, float2(0.0), isnan(_1542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1542, float2(0.0), isnan(_1542))).x;
    float _410 = in.m_46.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = -_334;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = -_344;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _424 = _378 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _426 = _378 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _428 = _378 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _430 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[4].x, _424);
    float _432 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[5].x, _426);
    float _434 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[7].x, _428);
    float _436 = _78 * _414;
    float _438 = -_436;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _442 = _440 * _440;
    float _444 = fma(_418, _418, _442);
    float _446 = _378 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _448 = fma(_422, _422, _444);
    float _450 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[6].x, _446);
    float _452 = rsqrt(_448);
    float _454 = _418 * _452;
    float _456 = _440 * _452;
    float _458 = _422 * _452;
    float _460 = fma(_408, 2.0, -1.0);
    float _462 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[7].z, _434);
    float _464 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
    float _466 = _462 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _468 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
    float _470 = _464 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _472 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[6].z, _450);
    float _474 = _468 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _476 = 1.0 / _466;
    float _478 = _472 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _480 = _470 * _476;
    float _482 = _474 * _476;
    float _484 = _478 * _476;
    float _486 = -_436;
    float _488 = _486 + _480;
    float _490 = -_334;
    float _492 = _490 + _482;
    float _494 = -_344;
    float _496 = _494 + _484;
    float _498 = _456 * _488;
    float _500 = fma(_454, _492, _498);
    float _502 = fma(_458, _496, _500);
    bool _504 = _502 > 0.0;
    float _506 = _492;
    float _508 = _500;
    float _510 = _470;
    float _512 = _434;
    float _514 = _430;
    float _516 = _432;
    float _518 = _450;
    float _520 = _484;
    if (_504)
    {
        float2 _1730 = float2(_384, _382);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1730, float2(0.0), isnan(_1730))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1730, float2(0.0), isnan(_1730))).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        _506 = _524;
        _508 = _526;
        _510 = _528;
    }
    float _530 = _506;
    float _532 = _508;
    float _534 = _510;
    float _536 = _382;
    if (_504)
    {
        float2 _1754 = float2(_384, _382);
        float _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1754, float2(0.0), isnan(_1754))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1754, float2(0.0), isnan(_1754))).x;
        _536 = _538;
    }
    float _540 = _536;
    float _542 = _350 * _376;
    float _544 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _546 = -_542;
    float _548 = _546 + 1.0;
    float _550 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _544);
    float _552 = fma(_390, _548, _542);
    float _554 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _556 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _550);
    float _558 = -_456;
    float _560 = _552 * _558;
    float _562 = -_454;
    float _564 = fma(_398, _562, _560);
    float _566 = rsqrt(_556);
    float _568 = -_458;
    float _570 = fma(_402, _568, _564);
    float _572 = _570 + _570;
    float _574 = -_572;
    float _576 = -_454;
    float _578 = fma(_398, _574, _576);
    float _580 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _582 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _584 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _586 = -_572;
    float _588 = -_456;
    float _590 = fma(_552, _586, _588);
    float _592 = -_580;
    float _594 = _456 + _592;
    float _596 = -_582;
    float _598 = _454 + _596;
    float _600 = -_584;
    float _602 = _458 + _600;
    float _604 = -_572;
    float _606 = -_458;
    float _608 = fma(_402, _604, _606);
    float _610 = _594 * _594;
    float _612 = fma(_598, _598, _610);
    float _614 = fma(_602, _602, _612);
    float _616 = rsqrt(_614);
    float _618 = _598 * _616;
    float _620 = _594 * _616;
    float _622 = _602 * _616;
    float _624 = abs(_578);
    float _626 = abs(_590);
    float _628 = precise::max(_624, _626);
    float _630 = abs(_608);
    float _632 = precise::max(_630, _628);
    float _634 = 1.0 / _632;
    float _636 = _578 * _634;
    float _638 = _590 * _634;
    float _640 = _608 * _634;
    float4 _1918 = float4(_636, _638, _640, float(0));
    float4 _1922 = select(_1918, float4(0.0), isnan(_1918));
    float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1922.xyz, uint(rint(_1922.w)), level(_554)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1922.xyz, uint(rint(_1922.w)), level(_554)).xyz;
    float _644 = _642.x;
    float _646 = _642.y;
    float _648 = _642.z;
    float _650 = _530;
    float _652 = _532;
    float _654 = _534;
    if (!_504)
    {
        float2 _1941 = float2(_404, _406);
        float3 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1941, float2(0.0), isnan(_1941))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1941, float2(0.0), isnan(_1941))).xyz;
        float _658 = _656.x;
        float _660 = _656.y;
        float _662 = _656.z;
        _650 = _658;
        _652 = _660;
        _654 = _662;
    }
    float _664 = _650;
    float _666 = _652;
    float _668 = _654;
    float _670 = _552 * _620;
    float _672 = -_580;
    float _674 = _552 * _672;
    float _676 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _678 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _680 = fma(_398, _618, _670);
    float _682 = _552 * _456;
    float _684 = -_582;
    float _686 = fma(_398, _684, _674);
    float _688 = _676 * _676;
    float _690 = _688 * 0.5;
    float _692 = fma(_402, _622, _680);
    float _694 = fma(_398, _454, _682);
    float _696 = -_584;
    float _698 = fma(_402, _696, _686);
    float _700 = sqrt(_448);
    float _702 = precise::max(_692, 9.9999999392252902907785028219223e-09);
    float _704 = fma(_402, _458, _694);
    float _706 = fma(_678, _678, -1.0);
    float _708 = precise::max(_698, 9.9999999392252902907785028219223e-09);
    float _710 = -_690;
    float _712 = _710 + 1.0;
    float _714 = _702 * _702;
    float _716 = precise::max(_704, 9.9999999392252902907785028219223e-09);
    float _718 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _720 = 1.0 + _718;
    float _722 = fma(_708, _712, _690);
    float _724 = fma(_714, _706, 1.0);
    float _726 = 0.0 + _698;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = fma(_716, _712, _690);
    float _732 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _734 = 1.0 + _732;
    float _736 = precise::max(_724, 9.9999999392252902907785028219223e-09);
    float _738 = 1.0 / _722;
    bool _740 = _700 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _742 = isnan(_700);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _748 = _744 || _746;
    float _750 = fma(_716, -5.554729938507080078125, -6.9831600189208984375);
    float _752 = 1.0 / _736;
    float _754 = _716 * _750;
    float _756 = 1.0 / _730;
    float _758 = exp2(_754);
    float _760 = _678 * _752;
    float _762 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _764 = 1.0 + _762;
    float _766 = _760 * _760;
    float _768 = _738 * _756;
    float _770 = _766 * 0.3183098733425140380859375;
    float _772 = _728 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _774 = _770 * _768;
    float _776 = _774 * 0.25;
    float _778 = fma(_720, _758, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _780 = fma(_764, _758, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _782 = fma(_734, _758, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _784 = _728 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _786 = _778 * _776;
    float _788 = _780 * _776;
    float _790 = _728 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _792 = _782 * _776;
    float _794 = _772 * _786;
    float _796 = _784 * _788;
    float _798 = _790 * _792;
    float _800 = _792;
    float _802 = _776;
    float _804 = _664;
    float _806 = _666;
    if (_504)
    {
        float _808 = fma(_540, 2.0, -1.0);
        _800 = _808;
    }
    float _810 = _800;
    float _812 = _810;
    if (_504)
    {
        float _814 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[7].z, _434);
        _512 = _814;
    }
    float _816 = _512;
    if (_504)
    {
        float _818 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
        _514 = _818;
    }
    float _820 = _514;
    float _822 = _820;
    if (_504)
    {
        float _824 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
        _516 = _824;
    }
    float _826 = _516;
    float _828 = _826;
    if (_504)
    {
        float _830 = fma(_810, (*spvDescriptorSet0.fp_c3)._m0[6].z, _450);
        _812 = _830;
    }
    float _832 = _812;
    float _834 = _832;
    if (_504)
    {
        float _836 = _816 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _802 = _836;
    }
    float _838 = _802;
    if (_504)
    {
        float _840 = _820 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _822 = _840;
    }
    float _842 = _822;
    float _844 = _842;
    if (_504)
    {
        float _846 = _832 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _834 = _846;
    }
    float _848 = _834;
    if (_504)
    {
        float _850 = _826 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _518 = _850;
    }
    float _852 = _518;
    float _854 = _838;
    float _856 = _852;
    if (_504)
    {
        float _858 = 1.0 / _838;
        _854 = _858;
    }
    float _860 = _854;
    float _862 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _864 = fma(_80, (*spvDescriptorSet0.fp_c4)._m0[1].z, _862);
    if (_504)
    {
        float _866 = _842 * _860;
        _828 = _866;
    }
    float _868 = _828;
    float _870 = _868;
    if (_504)
    {
        float _872 = _848 * _860;
        _844 = _872;
    }
    float _874 = _844;
    float _876 = _874;
    if (_504)
    {
        float _878 = _852 * _860;
        _856 = _878;
    }
    float _880 = _856;
    float _882 = _880;
    if (!_504)
    {
        _876 = _484;
    }
    float _884 = _876;
    if (!_504)
    {
        _870 = _482;
    }
    float _886 = _870;
    if (!_504)
    {
        _882 = _480;
    }
    float _888 = _882;
    float _890 = _778 * _644;
    float _892 = _780 * _646;
    if (_748)
    {
        _520 = _668;
    }
    float _894 = _520;
    float _896 = fma(_890, (*spvDescriptorSet0.fp_c4)._m0[7].x, _794);
    float _898 = _782 * _648;
    float _900 = fma(_892, (*spvDescriptorSet0.fp_c4)._m0[7].y, _796);
    float _902 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[7].z, _798);
    float _904 = _894;
    if (!_748)
    {
        float _906 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[3].y, _884);
        float _908 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[3].y, _886);
        float _910 = -_906;
        float _912 = fma(_910, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float _914 = _908 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float2 _2366 = float2(_914, _912);
        float4 _917 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2366, float2(0.0), isnan(_2366)), int2(0), component::x).xyzw;
        float _919 = _917.x;
        float _921 = _917.y;
        float _923 = _917.z;
        float _925 = _917.w;
        float _927 = _919 + _921;
        float _929 = _923 + _927;
        float _931 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _933 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[2].x, _931);
        float _935 = precise::clamp(_933, 0.0, 1.0);
        float _937 = _925 + _929;
        float _939 = -_935;
        float _941 = _939 + 1.0;
        float _943 = fma(_937, 0.25, 1.0);
        float _945 = -_941;
        float _947 = fma(_945, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _949 = precise::clamp(_947, 0.0, 1.0);
        float _951 = _943 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _953 = _943 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _955 = _943 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _957 = _951 * _664;
        float _959 = _953 * _666;
        float _961 = _955 * _668;
        float _963 = -_957;
        float _965 = _963 + _664;
        float _967 = -_959;
        float _969 = _967 + _666;
        float _971 = -_961;
        float _973 = _971 + _668;
        float _975 = fma(_949, _965, _957);
        float _977 = fma(_949, _969, _959);
        float _979 = fma(_949, _973, _961);
        _804 = _975;
        _806 = _977;
        _904 = _979;
    }
    float _981 = _804;
    float _983 = _806;
    float _985 = _904;
    float _987 = _981 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _989 = precise::max(0.0, _864);
    float _991 = -_778;
    float _993 = _991 + 1.0;
    float _995 = _983 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _997 = -_780;
    float _999 = _997 + 1.0;
    float _1001 = -_782;
    float _1003 = _1001 + 1.0;
    float _1005 = _985 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1007 = fma(_987, _993, _896);
    float _1009 = fma(_995, _999, _900);
    float _1011 = -_989;
    float _1013 = _1011 + 1.0;
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = fma(_1005, _1003, _902);
    out.m_51.x = _1007;
    out.m_51.y = _1009;
    out.m_51.z = _1017;
    out.m_51.w = _1015;
    return out;
}

