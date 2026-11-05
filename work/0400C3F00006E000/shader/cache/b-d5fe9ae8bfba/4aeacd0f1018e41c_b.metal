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
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_42.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _82 = _80 * 0.15915493667125701904296875;
    float _84 = _76 * _68;
    float _86 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _88 = _76 * _74;
    float _90 = _82 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_86, _92, _88);
    float _96 = fma(_86, _92, _84);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _850 = float2(_96, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_850, float2(0.0), isnan(_850))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _867 = float2(_100, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_867, float2(0.0), isnan(_867))).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _108 * _108;
    float _122 = fma(_106, _106, _120);
    float _124 = fma(_110, _110, _122);
    float _126 = rsqrt(_124);
    float _128 = _108 * _126;
    float _130 = _106 * _126;
    float _132 = _110 * _126;
    float _134 = _128 * _128;
    float _136 = fma(_130, _130, _134);
    float _138 = sqrt(_136);
    bool _142 = _138 >= 0.00999999977648258209228515625;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan(0.00999999977648258209228515625);
    bool _150 = _146 || _148;
    float _152 = 0.0;
    float _154 = _134;
    float _156 = _126;
    float _158 = _138;
    if (!_150)
    {
        float _160 = fma(_132, _132, _134);
        _152 = _160;
    }
    float _162 = _152;
    float _164 = _130 * _116;
    float _166 = _128 * _116;
    float _168 = 0.0;
    if (!_150)
    {
        _168 = 0.0;
    }
    float _170 = _168;
    float _172 = _96;
    float _174 = _170;
    if (!_150)
    {
        float _176 = rsqrt(_162);
        _172 = _176;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_150)
    {
        float _182 = _132 * _178;
        _154 = _182;
    }
    float _184 = _154;
    float _186 = _184;
    if (!_150)
    {
        float _188 = _128 * _178;
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    float _194 = _190;
    if (!_150)
    {
        float _196 = _132 * _184;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = _198;
    if (!_150)
    {
        float _202 = fma(_130, _190, -0.0);
        _156 = _202;
    }
    float _204 = _156;
    float _206 = _204;
    if (!_150)
    {
        float _208 = -_190;
        float _210 = (-0.0) + _208;
        _158 = _210;
    }
    float _212 = _158;
    float _214 = _212;
    if (!_150)
    {
        float _216 = -_190;
        float _218 = -_198;
        float _220 = fma(_128, _216, _218);
        _200 = _220;
    }
    float _222 = _200;
    float _224 = _222;
    if (!_150)
    {
        float _226 = _130 * _184;
        _194 = _226;
    }
    float _228 = _194;
    bool _230 = !_150;
    float _232 = _228;
    if (!_230)
    {
        float _234 = rsqrt(_136);
        float _236 = _128 * _234;
        float _238 = -_234;
        float _240 = _130 * _238;
        float _242 = _132 * _236;
        float _244 = _130 * _240;
        float _246 = _132 * _240;
        float _248 = _242 * _242;
        float _250 = -_244;
        float _252 = fma(_128, _236, _250);
        float _254 = fma(_246, _246, _248);
        float _256 = fma(_252, _252, _254);
        float _258 = rsqrt(_256);
        float _260 = _252 * _258;
        float _262 = _246 * _258;
        float _264 = -_242;
        float _266 = fma(_264, _258, -0.0);
        _206 = _240;
        _224 = _236;
        _186 = _266;
        _232 = 0.0;
        _174 = _262;
        _214 = _260;
    }
    float _268 = _206;
    float _270 = _224;
    float _272 = _186;
    float _274 = _232;
    float _276 = _174;
    float _278 = _214;
    float _280 = fma(_114, _268, _166);
    float _282 = _132 * _116;
    float _284 = fma(_114, _270, _164);
    float _286 = in.m_44.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_118, _272, _280);
    float _294 = fma(_114, _274, _282);
    float _296 = fma(_118, _276, _284);
    float _298 = in.m_44.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _292 * _292;
    float _306 = fma(_118, _278, _294);
    float _308 = in.m_44.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_296, _296, _304);
    float _316 = fma(_306, _306, _314);
    float _318 = rsqrt(_316);
    float _320 = -_128;
    float _322 = fma(_292, _318, _320);
    float _324 = -_130;
    float _326 = fma(_296, _318, _324);
    float _328 = -_132;
    float _330 = fma(_306, _318, _328);
    float _332 = _76 * _302;
    float _334 = fma(_322, (*spvDescriptorSet0.fp_c4)._m0[0].z, _128);
    float _336 = fma(_326, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _338 = _76 * _290;
    float _340 = fma(_330, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _342 = _334 * _334;
    float _344 = _76 * _312;
    float _346 = fma(_336, _336, _342);
    float _348 = 1.0 / _338;
    float _350 = fma(_340, _340, _346);
    float _352 = rsqrt(_350);
    float _354 = _332 * _348;
    float _356 = _344 * _348;
    float _358 = fma(_354, 0.5, 0.5);
    float _360 = fma(_356, -0.5, 0.5);
    float _362 = _336 * _352;
    float _364 = _340 * _352;
    float _366 = fma(_362, 0.0199999995529651641845703125, _358);
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float2 _1246 = float2(_366, _368);
    float _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1246, float2(0.0), isnan(_1246))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1246, float2(0.0), isnan(_1246))).x;
    float _372 = in.m_46.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_46.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_46.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _392 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _394 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _398 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _390);
    float _400 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
    float _402 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _394);
    float _404 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _396);
    float _406 = _76 * _376;
    float _408 = _76 * _382;
    float _410 = _76 * _388;
    float _412 = -_406;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _424 = _414 * _414;
    float _426 = fma(_418, _418, _424);
    float _428 = fma(_422, _422, _426);
    float _430 = rsqrt(_428);
    float _432 = _418 * _430;
    float _434 = _414 * _430;
    float _436 = _422 * _430;
    float _438 = fma(_370, 2.0, -1.0);
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[7].z, _398);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[5].z, _400);
    float _444 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[4].z, _402);
    float _446 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[6].z, _404);
    float _448 = _440 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _450 = _442 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _452 = _444 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _454 = _446 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _456 = 1.0 / _448;
    float _458 = -_406;
    float _460 = fma(_450, _456, _458);
    float _462 = -_408;
    float _464 = fma(_452, _456, _462);
    float _466 = -_410;
    float _468 = fma(_454, _456, _466);
    float _470 = _434 * _460;
    float _472 = fma(_432, _464, _470);
    float _474 = fma(_436, _468, _472);
    bool _476 = _474 > 0.0;
    float _478 = _470;
    float _480 = _358;
    float _482 = _472;
    if (_476)
    {
        float2 _1443 = float2(_358, _360);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1443, float2(0.0), isnan(_1443))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1443, float2(0.0), isnan(_1443))).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        _478 = _486;
        _480 = _488;
        _482 = _490;
    }
    float _492 = _478;
    float _494 = _480;
    float _496 = _482;
    float _498 = _334 * _352;
    float _500 = -_434;
    float _502 = _498 * _500;
    float _504 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _506 = -_432;
    float _508 = fma(_362, _506, _502);
    float _510 = -_436;
    float _512 = fma(_364, _510, _508);
    float _514 = _512 + _512;
    float _516 = -_514;
    float _518 = -_434;
    float _520 = fma(_498, _516, _518);
    float _522 = -_514;
    float _524 = -_432;
    float _526 = fma(_362, _522, _524);
    float _528 = -_514;
    float _530 = -_436;
    float _532 = fma(_364, _528, _530);
    float _534 = abs(_526);
    float _536 = abs(_520);
    float _538 = precise::max(_534, _536);
    float _540 = abs(_532);
    float _542 = precise::max(_540, _538);
    float _544 = 1.0 / _542;
    float _546 = _526 * _544;
    float _548 = _520 * _544;
    float _550 = _532 * _544;
    float4 _1541 = float4(_546, _548, _550, float(0));
    float4 _1545 = select(_1541, float4(0.0), isnan(_1541));
    float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1545.xyz, uint(rint(_1545.w)), level(_504)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1545.xyz, uint(rint(_1545.w)), level(_504)).xyz;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = _552.z;
    float _560 = _492;
    float _562 = _494;
    float _564 = _496;
    if (!_476)
    {
        float2 _1564 = float2(_366, _368);
        float3 _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1564, float2(0.0), isnan(_1564))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1564, float2(0.0), isnan(_1564))).xyz;
        float _568 = _566.x;
        float _570 = _566.y;
        float _572 = _566.z;
        _560 = _568;
        _562 = _570;
        _564 = _572;
    }
    float _574 = _560;
    float _576 = _562;
    float _578 = _564;
    float _580 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _582 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _584 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _586 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _584);
    float _588 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _586);
    float _590 = rsqrt(_588);
    float _592 = _590 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _594 = _590 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _596 = -_592;
    float _598 = _434 + _596;
    float _600 = _590 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _602 = -_594;
    float _604 = _432 + _602;
    float _606 = -_592;
    float _608 = _498 * _606;
    float _610 = _598 * _598;
    float _612 = -_600;
    float _614 = _436 + _612;
    float _616 = -_594;
    float _618 = fma(_362, _616, _608);
    float _620 = fma(_604, _604, _610);
    float _622 = -_600;
    float _624 = fma(_364, _622, _618);
    float _626 = fma(_614, _614, _620);
    float _628 = rsqrt(_626);
    float _630 = _598 * _628;
    float _632 = _604 * _628;
    float _634 = _614 * _628;
    float _636 = _580 * _580;
    float _638 = _636 * 0.5;
    float _640 = _498 * _630;
    float _642 = _498 * _434;
    float _644 = fma(_582, _582, -1.0);
    float _646 = precise::max(_624, 9.9999999392252902907785028219223e-09);
    float _648 = fma(_362, _632, _640);
    float _650 = fma(_362, _432, _642);
    float _652 = -_638;
    float _654 = _652 + 1.0;
    float _656 = fma(_364, _634, _648);
    float _658 = fma(_364, _436, _650);
    float _660 = fma(_646, _654, _638);
    float _662 = 0.0 + _624;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    float _666 = precise::max(_656, 9.9999999392252902907785028219223e-09);
    float _668 = precise::max(_658, 9.9999999392252902907785028219223e-09);
    float _670 = 1.0 / _660;
    float _672 = _666 * _666;
    float _674 = fma(_668, _654, _638);
    float _676 = fma(_668, -5.554729938507080078125, -6.9831600189208984375);
    float _678 = fma(_672, _644, 1.0);
    float _680 = _668 * _676;
    float _682 = 1.0 / _674;
    float _684 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _686 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _688 = 1.0 + _686;
    float _690 = 1.0 / _684;
    float _692 = exp2(_680);
    float _694 = _582 * _690;
    float _696 = _670 * _682;
    float _698 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _700 = 1.0 + _698;
    float _702 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _704 = 1.0 + _702;
    float _706 = _694 * _694;
    float _708 = _706 * 0.3183098733425140380859375;
    float _710 = fma(_688, _692, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _712 = fma(_704, _692, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _714 = fma(_700, _692, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _716 = _708 * _696;
    float _718 = _716 * 0.25;
    float _720 = _664 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _722 = _664 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _724 = _664 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _726 = _710 * _718;
    float _728 = _712 * _718;
    float _730 = _714 * _718;
    float _732 = _720 * _726;
    float _734 = _724 * _728;
    float _736 = _722 * _730;
    float _738 = -_714;
    float _740 = _738 + 1.0;
    float _742 = -_712;
    float _744 = _742 + 1.0;
    float _746 = _710 * _554;
    float _748 = _712 * _558;
    float _750 = _714 * _556;
    float _752 = fma(_746, (*spvDescriptorSet0.fp_c4)._m0[7].x, _732);
    float _754 = fma(_748, (*spvDescriptorSet0.fp_c4)._m0[7].z, _734);
    float _756 = fma(_750, (*spvDescriptorSet0.fp_c4)._m0[7].y, _736);
    float _758 = -_710;
    float _760 = _758 + 1.0;
    float _762 = _574 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _764 = _576 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _766 = _578 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _768 = fma(_762, _760, _752);
    float _770 = fma(_764, _740, _756);
    float _772 = fma(_766, _744, _754);
    out.m_49.x = _768;
    out.m_49.y = _770;
    out.m_49.z = _772;
    out.m_49.w = 1.0;
    return out;
}

