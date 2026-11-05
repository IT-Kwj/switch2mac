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
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_44.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _78 * _70;
    float _88 = _82 * 0.15915493667125701904296875;
    float _90 = _78 * _76;
    float _92 = _88 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_84, _94, _86);
    float _98 = fma(_84, _94, _90);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1179 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1179, float2(0.0), isnan(_1179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1179, float2(0.0), isnan(_1179))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1196 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1196, float2(0.0), isnan(_1196))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1196, float2(0.0), isnan(_1196))).xyz;
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
    float _156 = _128;
    float _158 = _136;
    float _160 = _140;
    if (!_152)
    {
        float _162 = fma(_134, _134, _136);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = _132 * _118;
    float _168 = _130 * _118;
    if (!_152)
    {
        _156 = 0.0;
    }
    float _170 = _156;
    float _172 = _98;
    float _174 = _170;
    if (!_152)
    {
        float _176 = rsqrt(_164);
        _172 = _176;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_152)
    {
        float _182 = _134 * _178;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = _184;
    if (!_152)
    {
        float _188 = _130 * _178;
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    float _194 = _190;
    if (!_152)
    {
        float _196 = _134 * _184;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = 0.0;
    float _202 = _198;
    if (!_152)
    {
        float _204 = fma(_132, _190, -0.0);
        _200 = _204;
    }
    float _206 = _200;
    float _208 = _206;
    if (!_152)
    {
        float _210 = _132 * _184;
        _160 = _210;
    }
    float _212 = _160;
    float _214 = _212;
    if (!_152)
    {
        float _216 = -_190;
        float _218 = -_198;
        float _220 = fma(_130, _216, _218);
        _202 = _220;
    }
    float _222 = _202;
    float _224 = _222;
    if (!_152)
    {
        float _226 = -_190;
        float _228 = (-0.0) + _226;
        _194 = _228;
    }
    float _230 = _194;
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
        float _262 = _248 * _260;
        float _264 = _254 * _260;
        float _266 = -_244;
        float _268 = fma(_266, _260, -0.0);
        _208 = _242;
        _224 = _238;
        _186 = _268;
        _214 = 0.0;
        _174 = _262;
        _234 = _264;
    }
    float _270 = _208;
    float _272 = _224;
    float _274 = _186;
    float _276 = _214;
    float _278 = _174;
    float _280 = _234;
    float _282 = fma(_116, _270, _168);
    float _284 = _134 * _118;
    float _286 = fma(_116, _272, _166);
    float _288 = in.m_46.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_116, _276, _284);
    float _298 = fma(_120, _278, _286);
    float _300 = _294 * _294;
    float _302 = fma(_120, _280, _296);
    float _304 = in.m_46.w;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = fma(_298, _298, _300);
    float _312 = in.m_46.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = fma(_302, _302, _310);
    float _320 = rsqrt(_318);
    float _322 = -_130;
    float _324 = fma(_294, _320, _322);
    float _326 = -_132;
    float _328 = fma(_298, _320, _326);
    float _330 = -_134;
    float _332 = fma(_302, _320, _330);
    float _334 = fma(_324, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _336 = fma(_328, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _338 = _78 * _308;
    float _340 = fma(_332, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _342 = _334 * _334;
    float _344 = _78 * _316;
    float _346 = _78 * _292;
    float _348 = fma(_336, _336, _342);
    float _350 = 1.0 / _338;
    float _352 = fma(_340, _340, _348);
    float _354 = rsqrt(_352);
    float _356 = _344 * _350;
    float _358 = _346 * _350;
    float _360 = fma(_356, 0.5, 0.5);
    float _362 = fma(_358, -0.5, 0.5);
    float _364 = _336 * _354;
    float _366 = _340 * _354;
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float _370 = fma(_366, 0.0199999995529651641845703125, _362);
    float2 _1575 = float2(_368, _370);
    float _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1575, float2(0.0), isnan(_1575))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1575, float2(0.0), isnan(_1575))).x;
    float _374 = in.m_48.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_48.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_48.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = _358 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _394 = _358 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _396 = _358 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _398 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _400 = _334 * _354;
    float _402 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _398);
    float _404 = _78 * _378;
    float _406 = _78 * _384;
    float _408 = _78 * _390;
    float _410 = -_404;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _414 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _402);
    float _416 = -_406;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = _412 * _412;
    float _422 = -_408;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _426 = fma(_418, _418, _420);
    float _428 = rsqrt(_414);
    float _430 = fma(_424, _424, _426);
    float _432 = rsqrt(_430);
    float _434 = _428 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _436 = _428 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _438 = _428 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _440 = _412 * _432;
    float _442 = _418 * _432;
    float _444 = _424 * _432;
    float _446 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[6].x, _394);
    float _448 = -_434;
    float _450 = _440 + _448;
    float _452 = -_436;
    float _454 = _442 + _452;
    float _456 = -_438;
    float _458 = _444 + _456;
    float _460 = _450 * _450;
    float _462 = fma(_454, _454, _460);
    float _464 = fma(_458, _458, _462);
    float _466 = _358 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _468 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[4].x, _466);
    float _470 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
    float _472 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[7].x, _396);
    float _474 = rsqrt(_464);
    float _476 = _454 * _474;
    float _478 = _450 * _474;
    float _480 = _458 * _474;
    float _482 = fma(_372, 2.0, -1.0);
    float _484 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[7].z, _472);
    float _486 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
    float _488 = _484 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[4].z, _468);
    float _492 = _486 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _494 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[6].z, _446);
    float _496 = _490 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _498 = 1.0 / _488;
    float _500 = _494 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _502 = _492 * _498;
    float _504 = _496 * _498;
    float _506 = _500 * _498;
    float _508 = -_404;
    float _510 = _508 + _502;
    float _512 = -_406;
    float _514 = _512 + _504;
    float _516 = -_408;
    float _518 = _516 + _506;
    float _520 = _440 * _510;
    float _522 = fma(_442, _514, _520);
    float _524 = fma(_444, _518, _522);
    bool _526 = _524 > 0.0;
    float _528 = _524;
    float _530 = _520;
    float _532 = _492;
    float _534 = _472;
    float _536 = _470;
    float _538 = _468;
    float _540 = _404;
    float _542 = _406;
    float _544 = _408;
    if (_526)
    {
        float2 _1855 = float2(_360, _362);
        float3 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1855, float2(0.0), isnan(_1855))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1855, float2(0.0), isnan(_1855))).xyz;
        float _548 = _546.x;
        float _550 = _546.y;
        float _552 = _546.z;
        _528 = _548;
        _530 = _550;
        _532 = _552;
    }
    float _554 = _528;
    float _556 = _530;
    float _558 = _532;
    float _560 = _360;
    if (_526)
    {
        float2 _1879 = float2(_360, _362);
        float _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1879, float2(0.0), isnan(_1879))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1879, float2(0.0), isnan(_1879))).x;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = -_440;
    float _568 = _400 * _566;
    float _570 = -_434;
    float _572 = _400 * _570;
    float _574 = _400 * _478;
    float _576 = _400 * _440;
    float _578 = -_442;
    float _580 = fma(_364, _578, _568);
    float _582 = -_436;
    float _584 = fma(_364, _582, _572);
    float _586 = fma(_364, _476, _574);
    float _588 = -_444;
    float _590 = fma(_366, _588, _580);
    float _592 = -_438;
    float _594 = fma(_366, _592, _584);
    float _596 = fma(_366, _480, _586);
    float _598 = _590 + _590;
    float _600 = -_598;
    float _602 = -_440;
    float _604 = fma(_400, _600, _602);
    float _606 = -_598;
    float _608 = -_442;
    float _610 = fma(_364, _606, _608);
    float _612 = -_598;
    float _614 = -_444;
    float _616 = fma(_366, _612, _614);
    float _618 = abs(_610);
    float _620 = abs(_604);
    float _622 = precise::max(_618, _620);
    float _624 = abs(_616);
    float _626 = precise::max(_624, _622);
    float _628 = 1.0 / _626;
    float _630 = _610 * _628;
    float _632 = _604 * _628;
    float _634 = _616 * _628;
    float _636 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1995 = float4(_630, _632, _634, float(0));
    float4 _1999 = select(_1995, float4(0.0), isnan(_1995));
    float3 _638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1999.xyz, uint(rint(_1999.w)), level(_636)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1999.xyz, uint(rint(_1999.w)), level(_636)).xyz;
    float _640 = _638.x;
    float _642 = _638.y;
    float _644 = _638.z;
    float _646 = _554;
    float _648 = _556;
    float _650 = _558;
    if (!_526)
    {
        float2 _2018 = float2(_368, _370);
        float3 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2018, float2(0.0), isnan(_2018))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2018, float2(0.0), isnan(_2018))).xyz;
        float _654 = _652.x;
        float _656 = _652.y;
        float _658 = _652.z;
        _646 = _654;
        _648 = _656;
        _650 = _658;
    }
    float _660 = _646;
    float _662 = _648;
    float _664 = _650;
    float _666 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _668 = precise::max(_596, 9.9999999392252902907785028219223e-09);
    float _670 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _672 = fma(_364, _442, _576);
    float _674 = _666 * _666;
    float _676 = _674 * 0.5;
    float _678 = precise::max(_594, 9.9999999392252902907785028219223e-09);
    float _680 = fma(_670, _670, -1.0);
    float _682 = _668 * _668;
    float _684 = fma(_366, _444, _672);
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = fma(_682, _680, 1.0);
    float _692 = 0.0 + _594;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = precise::max(_684, 9.9999999392252902907785028219223e-09);
    float _698 = sqrt(_430);
    float _700 = precise::max(_690, 9.9999999392252902907785028219223e-09);
    float _702 = fma(_678, _688, _676);
    float _704 = fma(_696, _688, _676);
    float _706 = fma(_696, -5.554729938507080078125, -6.9831600189208984375);
    float _708 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _710 = 1.0 + _708;
    float _712 = 1.0 / _700;
    float _714 = _696 * _706;
    float _716 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _718 = 1.0 + _716;
    float _720 = 1.0 / _702;
    bool _722 = _698 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _724 = isnan(_698);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _730 = _726 || _728;
    float _732 = 1.0 / _704;
    float _734 = _670 * _712;
    float _736 = _734 * _734;
    float _738 = exp2(_714);
    float _740 = _736 * 0.3183098733425140380859375;
    float _742 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _744 = _720 * _732;
    float _746 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _748 = 1.0 + _746;
    float _750 = _740 * _744;
    float _752 = _750 * 0.25;
    float _754 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _756 = fma(_748, _738, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _758 = fma(_718, _738, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _760 = fma(_710, _738, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _762 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _764 = _756 * _752;
    float _766 = _758 * _752;
    float _768 = _760 * _752;
    float _770 = _754 * _764;
    float _772 = _762 * _766;
    float _774 = _742 * _768;
    float _776 = _764;
    float _778 = _768;
    float _780 = _660;
    float _782 = _662;
    float _784 = _664;
    if (_526)
    {
        float _786 = fma(_564, 2.0, -1.0);
        _776 = _786;
    }
    float _788 = _776;
    float _790 = _788;
    if (_526)
    {
        float _792 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[7].z, _472);
        _534 = _792;
    }
    float _794 = _534;
    float _796 = _794;
    if (_526)
    {
        float _798 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
        _536 = _798;
    }
    float _800 = _536;
    float _802 = _800;
    if (_526)
    {
        float _804 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[4].z, _468);
        _538 = _804;
    }
    float _806 = _538;
    float _808 = _806;
    if (_526)
    {
        float _810 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[6].z, _446);
        _790 = _810;
    }
    float _812 = _790;
    float _814 = _812;
    if (_526)
    {
        float _816 = _794 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _796 = _816;
    }
    float _818 = _796;
    if (_526)
    {
        float _820 = _800 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = _822;
    if (_526)
    {
        float _826 = _806 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _808 = _826;
    }
    float _828 = _808;
    float _830 = _766;
    float _832 = _828;
    if (_526)
    {
        float _834 = 1.0 / _818;
        _830 = _834;
    }
    float _836 = _830;
    if (_526)
    {
        float _838 = _822 * _836;
        _778 = _838;
    }
    float _840 = _778;
    float _842 = _840;
    if (_526)
    {
        float _844 = _812 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _824 = _844;
    }
    float _846 = _824;
    if (_526)
    {
        float _848 = _828 * _836;
        _814 = _848;
    }
    float _850 = _814;
    float _852 = _850;
    if (_526)
    {
        float _854 = -_404;
        float _856 = _854 + _840;
        _540 = _856;
    }
    float _858 = _540;
    float _860 = _858;
    if (!_526)
    {
        _860 = _510;
    }
    float _862 = _860;
    if (_526)
    {
        float _864 = _846 * _836;
        _832 = _864;
    }
    float _866 = _832;
    float _868 = _866;
    if (_526)
    {
        float _870 = -_406;
        float _872 = _870 + _850;
        _542 = _872;
    }
    float _874 = _542;
    float _876 = _874;
    if (!_526)
    {
        _876 = _514;
    }
    float _878 = _876;
    float _880 = _862 * _862;
    if (_526)
    {
        float _882 = -_408;
        float _884 = _882 + _866;
        _544 = _884;
    }
    float _886 = _544;
    float _888 = _886;
    if (!_526)
    {
        _888 = _518;
    }
    float _890 = _888;
    float _892 = fma(_878, _878, _880);
    if (!_526)
    {
        _852 = _504;
    }
    float _894 = _852;
    if (!_526)
    {
        _842 = _502;
    }
    float _896 = _842;
    float _898 = fma(_890, _890, _892);
    if (!_526)
    {
        _868 = _506;
    }
    float _900 = _868;
    float _902 = sqrt(_898);
    float _904 = _756 * _640;
    float _906 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[7].x, _770);
    if (!_730)
    {
        float _908 = fma(_896, (*spvDescriptorSet0.fp_c4)._m0[3].y, _900);
        float _910 = fma(_896, (*spvDescriptorSet0.fp_c4)._m0[3].y, _894);
        float _912 = -_908;
        float _914 = fma(_912, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float _916 = _910 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float2 _2448 = float2(_916, _914);
        float4 _919 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2448, float2(0.0), isnan(_2448)), int2(0), component::x).xyzw;
        float _921 = _919.x;
        float _923 = _919.y;
        float _925 = _919.z;
        float _927 = _919.w;
        float _929 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _931 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[2].x, _929);
        float _933 = precise::clamp(_931, 0.0, 1.0);
        float _935 = -_933;
        float _937 = _935 + 1.0;
        float _939 = -_937;
        float _941 = fma(_939, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _943 = precise::clamp(_941, 0.0, 1.0);
        float _945 = _921 + _923;
        float _947 = _925 + _945;
        float _949 = _927 + _947;
        float _951 = fma(_949, 0.25, 1.0);
        float _953 = _951 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _955 = _951 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _957 = _951 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _959 = _953 * _660;
        float _961 = _955 * _662;
        float _963 = _957 * _664;
        float _965 = -_959;
        float _967 = _965 + _660;
        float _969 = -_961;
        float _971 = _969 + _662;
        float _973 = -_963;
        float _975 = _973 + _664;
        float _977 = fma(_943, _967, _959);
        float _979 = fma(_943, _971, _961);
        float _981 = fma(_943, _975, _963);
        _780 = _977;
        _782 = _979;
        _784 = _981;
    }
    float _983 = _780;
    float _985 = _782;
    float _987 = _784;
    float _989 = -_756;
    float _991 = _989 + 1.0;
    float _993 = _983 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _995 = _758 * _642;
    float _997 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _999 = _902 + _997;
    float _1001 = _760 * _644;
    float _1003 = fma(_993, _991, _906);
    float _1005 = fma(_995, (*spvDescriptorSet0.fp_c4)._m0[7].y, _772);
    float _1007 = -_758;
    float _1009 = _1007 + 1.0;
    float _1011 = _999 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1013 = precise::clamp(_1011, 0.0, 1.0);
    float _1015 = _985 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1017 = fma(_1001, (*spvDescriptorSet0.fp_c4)._m0[7].z, _774);
    float _1019 = -_760;
    float _1021 = _1019 + 1.0;
    float _1023 = _987 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1025 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1027 = _1003 + _1025;
    float _1029 = _1013 * 3.0;
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = fma(_1015, _1009, _1005);
    float _1035 = fma(_1023, _1021, _1017);
    float _1037 = abs(_1013);
    float _1039 = log2(_1037);
    float _1041 = fma(_1031, _1027, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1043 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1045 = _1033 + _1043;
    float _1047 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1049 = _1035 + _1047;
    float _1051 = -_1013;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_1031, _1045, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1057 = fma(_1031, _1049, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1059 = precise::max(_1041, 9.9999999392252902907785028219223e-09);
    float _1061 = precise::max(_1055, 9.9999999392252902907785028219223e-09);
    float _1063 = precise::max(_1057, 9.9999999392252902907785028219223e-09);
    float _1065 = sqrt(_1059);
    float _1067 = _1039 * 0.100000001490116119384765625;
    float _1069 = sqrt(_1061);
    float _1071 = sqrt(_1063);
    float _1073 = fma(_1053, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1065);
    float _1075 = -_1073;
    float _1077 = _1041 + _1075;
    float _1079 = exp2(_1067);
    float _1081 = fma(_1053, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1069);
    float _1083 = -_1081;
    float _1085 = _1055 + _1083;
    float _1087 = fma(_1053, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1071);
    float _1089 = _1013 * 5.0;
    float _1091 = -_1087;
    float _1093 = _1057 + _1091;
    float _1095 = fma(_1079, _1077, _1073);
    float _1097 = fma(_1079, _1085, _1081);
    float _1099 = fma(_1079, _1093, _1087);
    float _1101 = precise::min(_1089, 1.0);
    out.m_51.x = _1095;
    out.m_51.y = _1097;
    out.m_51.z = _1099;
    out.m_51.w = _1101;
    return out;
}

