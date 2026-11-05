#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    texture2d<float> fp_t_tcb_14 [[id(4)]];
    sampler fp_t_tcb_14Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_18 [[id(12)]];
    sampler fp_t_tcb_18Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_10 [[id(14)]];
    sampler fp_t_tcb_10Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_8 [[id(16)]];
    sampler fp_t_tcb_8Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_1C [[id(18)]];
    sampler fp_t_tcb_1CSmplr [[id(19)]];
    texture2d<float> fp_t_tcb_12 [[id(20)]];
    sampler fp_t_tcb_12Smplr [[id(21)]];
    texture2d<float> fp_t_tcb_16 [[id(22)]];
    sampler fp_t_tcb_16Smplr [[id(23)]];
    texture2d_array<float> fp_t_tcb_1A [[id(24)]];
    sampler fp_t_tcb_1ASmplr [[id(25)]];
    sampler fp_t_tcb_14Smplr_w [[id(26)]];
    sampler fp_t_tcb_ASmplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    sampler fp_t_tcb_18Smplr_w [[id(30)]];
    sampler fp_t_tcb_10Smplr_w [[id(31)]];
    sampler fp_t_tcb_8Smplr_w [[id(32)]];
    sampler fp_t_tcb_1CSmplr_w [[id(33)]];
    sampler fp_t_tcb_12Smplr_w [[id(34)]];
    sampler fp_t_tcb_16Smplr_w [[id(35)]];
    sampler fp_t_tcb_1ASmplr_w [[id(36)]];
    constant dm_border_t* dm_border [[id(37)]];
};

struct main0_out
{
    float4 m_69 [[color(0)]];
    float4 m_71 [[color(1)]];
};

struct main0_in
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_58.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_58.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _1311 = float2(_94, _96);
    float2 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1311, float2(0.0), isnan(_1311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1311, float2(0.0), isnan(_1311))).xy;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = in.m_60.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_62.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_60.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_62.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_60.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_62.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_64.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_64.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_64.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_60.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _92 * _110;
    float _168 = _92 * _116;
    float _170 = _92 * _122;
    float _172 = _92 * _128;
    float _174 = _166 * _166;
    float _176 = _168 * _168;
    float _178 = _92 * _134;
    float _180 = _92 * _140;
    float _182 = fma(_170, _170, _174);
    float _184 = fma(_172, _172, _176);
    float _186 = _92 * _146;
    float _188 = _92 * _164;
    float _190 = fma(_178, _178, _182);
    float _192 = fma(_180, _180, _184);
    float _194 = _92 * _152;
    float _196 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _198 = _186 + _196;
    float _200 = _92 * _158;
    float _202 = rsqrt(_192);
    float _204 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _206 = _194 + _204;
    float _208 = _198 * _198;
    float _210 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _212 = _200 + _210;
    float _214 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _216 = _194 + _214;
    float _218 = fma(_206, _206, _208);
    float _220 = rsqrt(_190);
    float _222 = fma(_212, _212, _218);
    float _224 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _226 = _200 + _224;
    float _228 = _226 * _226;
    float _230 = _172 * _202;
    float _232 = _180 * _202;
    float _234 = _168 * _202;
    float _236 = sqrt(_222);
    float _238 = fma(_216, _216, _228);
    float _240 = _178 * _220;
    float _242 = _170 * _220;
    float _244 = _166 * _220;
    float _246 = sqrt(_238);
    float _248 = _230 * _240;
    float _250 = _234 * _242;
    float _252 = _232 * _244;
    float _254 = -_248;
    float _256 = fma(_232, _242, _254);
    float _258 = -_252;
    float _260 = fma(_234, _240, _258);
    float _262 = spvFAdd(_236, 9.9999997473787516355514526367188e-06);
    float _264 = _188 * _256;
    float _266 = -_250;
    float _268 = fma(_230, _244, _266);
    float _270 = _188 * _260;
    float _272 = 1.0 / _262;
    float _274 = _264 * _264;
    float _276 = _188 * _268;
    bool _280 = _246 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _282 = fma(_270, _270, _274);
    float _284 = fma(_276, _276, _282);
    float _286 = rsqrt(_284);
    float _288 = _198 * _272;
    float _290 = _206 * _272;
    float _292 = _212 * _272;
    float _294 = _242 * _290;
    float _296 = _282;
    float _298 = _272;
    float _300 = _290;
    if (_280)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _296 = _302;
    }
    float _304 = _296;
    float _306 = -_288;
    float _308 = -_294;
    float _310 = fma(_244, _306, _308);
    float _312 = -_292;
    float _314 = fma(_240, _312, _310);
    float _316 = _264 * _286;
    float _318 = _270 * _286;
    float _320 = _276 * _286;
    float _322 = _288 * _316;
    float _324 = fma(_290, _318, _322);
    float _326 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _328 = _246 + _326;
    float _330 = _314 * (-0.5);
    float _332 = fma(_292, _320, _324);
    float _334 = _304;
    float _336 = _322;
    if (_280)
    {
        float _338 = _328 * _304;
        _334 = _338;
    }
    float _340 = _334;
    float _342 = fma(_94, 2.5, _330);
    float _344 = _332 * (-0.5);
    float _346 = 0.0;
    if (_280)
    {
        float _348 = _340 * 0.15915493667125701904296875;
        _346 = _348;
    }
    float _350 = _346;
    float _352 = fma(_96, 2.5, _344);
    float _354 = _328;
    float _356 = _352;
    if (_280)
    {
        float _358 = _350 * 6.283185482025146484375;
        float _360 = cos(_358);
        _354 = _360;
    }
    float _362 = _354;
    float _364 = fma(_102, 0.25, _342);
    float _366 = fma(_104, 0.25, _352);
    float2 _1700 = float2(_364, _366);
    float2 _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1700, float2(0.0), isnan(_1700))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1700, float2(0.0), isnan(_1700))).xy;
    float _370 = _368.x;
    float _372 = _368.y;
    float2 _1712 = float2(_94, _96);
    float _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1712, float2(0.0), isnan(_1712))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1712, float2(0.0), isnan(_1712))).x;
    float _376 = _340;
    if (_280)
    {
        float _378 = _350 * 6.283185482025146484375;
        float _380 = sin(_378);
        _376 = _380;
    }
    float _382 = _376;
    if (_280)
    {
        float _384 = _186 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _336 = _384;
    }
    float _386 = _336;
    float _388 = 0.0;
    float _390 = _386;
    if (_280)
    {
        float _392 = _362 + (-1.0);
        _388 = _392;
    }
    float _394 = _388;
    if (!_280)
    {
        _356 = _186;
    }
    float _396 = _356;
    float _398 = _396;
    if (_280)
    {
        float _400 = _394 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _298 = _400;
    }
    float _402 = _298;
    float _404 = _238;
    if (_280)
    {
        float _406 = rsqrt(_238);
        _404 = _406;
    }
    float _408 = _404;
    if (_280)
    {
        float _410 = fma(_186, _362, _402);
        _398 = _410;
    }
    float _412 = _398;
    float _414 = _382;
    if (_280)
    {
        float _416 = fma(_382, _386, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _414 = _416;
    }
    float _418 = _414;
    float _420 = _418;
    if (!_280)
    {
        _390 = _194;
    }
    float _422 = _390;
    float _424 = 0.0;
    float _426 = _422;
    if (_280)
    {
        float _428 = _408 * _418;
        _424 = _428;
    }
    float _430 = _424;
    if (!_280)
    {
        _420 = _200;
    }
    float _432 = _420;
    float _434 = _432;
    if (_280)
    {
        float _436 = fma(_216, _430, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _426 = _436;
    }
    float _438 = _426;
    float _440 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _442 = _412 + _440;
    float _444 = _442;
    if (_280)
    {
        float _446 = fma(_226, _430, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _434 = _446;
    }
    float _448 = _434;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _452 = _438 + _450;
    float _454 = _442 * _442;
    float _456 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _458 = _448 + _456;
    float _460 = fma(_452, _452, _454);
    float _462 = fma(_458, _458, _460);
    float _464 = rsqrt(_462);
    float _466 = _464 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _468 = _452 * _466;
    float _470 = _458 * _466;
    float _472 = _468 * _468;
    float _474 = _470 * _470;
    float _476 = _472 + _474;
    float _478 = sqrt(_476);
    bool _480 = _478 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _482 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _484 = _478 + _482;
    float _486 = _350;
    float _488 = _476;
    float _490 = _464;
    float _492 = _466;
    float _494 = _468;
    float _496 = _472;
    float _498 = _474;
    if (_480)
    {
        float _500 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _486 = _500;
    }
    float _502 = _486;
    if (_480)
    {
        float _504 = rsqrt(_476);
        _488 = _504;
    }
    float _506 = _488;
    if (_480)
    {
        float _508 = _484 * _502;
        _490 = _508;
    }
    float _510 = _490;
    float _512 = 0.0;
    if (_480)
    {
        float _514 = _510 * 0.15915493667125701904296875;
        _512 = _514;
    }
    float _516 = _512;
    float _518 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _520 = _484;
    if (_480)
    {
        float _522 = _516 * 6.283185482025146484375;
        float _524 = sin(_522);
        _520 = _524;
    }
    float _526 = _520;
    float _528 = precise::max(0.0, _518);
    float _530 = _510;
    if (_480)
    {
        float _532 = _516 * 6.283185482025146484375;
        float _534 = cos(_532);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = -_466;
    float _540 = -_528;
    float _542 = fma(_442, _538, _540);
    if (_480)
    {
        float _544 = _542 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _444 = _544;
    }
    float _546 = _444;
    float _548 = _526;
    float _550 = _546;
    if (_480)
    {
        float _552 = fma(_526, _546, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _548 = _552;
    }
    float _554 = _548;
    float _556 = _554;
    if (_480)
    {
        float _558 = _506 * _554;
        _556 = _558;
    }
    float _560 = _556;
    float _562 = _536;
    if (_480)
    {
        float _564 = _536 + (-1.0);
        _550 = _564;
    }
    float _566 = _550;
    float _568 = _566;
    if (_480)
    {
        float _570 = _566 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _492 = _570;
    }
    float _572 = _492;
    if (!_480)
    {
        _568 = _542;
    }
    float _574 = _568;
    float _576 = _574;
    if (_480)
    {
        float _578 = fma(_542, _536, _572);
        _576 = _578;
    }
    float _580 = _576;
    if (!_480)
    {
        _562 = _468;
    }
    float _582 = _562;
    float _584 = _582;
    if (_480)
    {
        float _586 = _468 * _560;
        _584 = _586;
    }
    float _588 = _584;
    if (!_480)
    {
        _494 = _470;
    }
    float _590 = _494;
    float _592 = _590;
    if (_480)
    {
        float _594 = _470 * _560;
        _592 = _594;
    }
    float _596 = _592;
    if (_480)
    {
        float _598 = _588 * _588;
        _496 = _598;
    }
    float _600 = _496;
    if (_480)
    {
        float _602 = _596 * _596;
        _498 = _602;
    }
    float _604 = _498;
    float _606 = fma(_580, _580, _600);
    float _608 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _610 = fma(_236, (*spvDescriptorSet0.fp_c9)._m0[63].x, _608);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _606 + _604;
    float _616 = -_612;
    float _618 = _616 + 1.0;
    float _620 = rsqrt(_614);
    float _622 = abs(_618);
    float _624 = log2(_622);
    float _626 = _620 * _588;
    float _628 = _620 * _596;
    float _630 = _620 * _580;
    float _632 = _626 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _634 = _624 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _636 = -_632;
    float _638 = fma(_630, (*spvDescriptorSet0.fp_c9)._m0[69].y, _636);
    float _640 = exp2(_634);
    float _642 = -_628;
    float _644 = fma(_642, (*spvDescriptorSet0.fp_c9)._m0[69].z, _638);
    float _646 = fma(_372, 2.007874011993408203125, -1.007874011993408203125);
    float _648 = fma(_370, 2.007874011993408203125, -1.007874011993408203125);
    float _650 = _646 * _646;
    float _652 = _276 * _646;
    float _654 = fma(_648, _648, _650);
    float _656 = fma(_240, _648, _652);
    float _658 = -_654;
    float _660 = _658 + 1.0;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = _630 + 1.0;
    float _666 = -_630;
    float _668 = fma(_640, _664, _666);
    float _670 = sqrt(_662);
    float _672 = _264 * _646;
    float _674 = fma(_644, 0.5, 0.5);
    float _676 = _270 * _646;
    float _678 = fma(_644, -0.5, 0.5);
    float _680 = fma(_244, _648, _672);
    float _682 = _234 * _288;
    float _684 = fma(_242, _648, _676);
    float _686 = fma(_668, 0.5, 0.5);
    float _688 = sqrt(_678);
    float _690 = fma(_230, _290, _682);
    float _692 = fma(_232, _292, _690);
    float _694 = fma(_234, _670, _680);
    float _696 = fma(_230, _670, _684);
    float _698 = fma(_232, _670, _656);
    float _700 = _694 * _694;
    float _702 = fma(_674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_696, _696, _700);
    float _706 = fma(_674, _702, -0.212114393711090087890625);
    float _708 = in.m_58.z;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    float _714 = fma(_698, _698, _704);
    float _716 = _688 * 0.636619746685028076171875;
    float _718 = fma(_674, _706, 1.570728778839111328125);
    float _720 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _96);
    float _722 = rsqrt(_714);
    float _724 = -_718;
    float _726 = fma(_716, _724, 1.0);
    float _728 = in.m_58.w;
    float _730 = gl_FragCoord.w;
    float _732 = _728 * _730;
    float _734 = _694 * _722;
    float _736 = _696 * _722;
    float _738 = _698 * _722;
    float _740 = _288 * _734;
    float _742 = fma(_290, _736, _740);
    float _744 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _96);
    float _746 = fma(_292, _738, _742);
    float _748 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _374);
    float _750 = fma(_314, -0.25, _94);
    float _752 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _746);
    float _754 = _692 + _748;
    float _756 = _92 * _712;
    float _758 = fma(_332, -0.25, _744);
    float _760 = _92 * _732;
    float2 _2327 = float2(_94, _744);
    float _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2327, float2(0.0), isnan(_2327))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2327, float2(0.0), isnan(_2327))).x;
    float2 _2335 = float2(_94, _720);
    float _764 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2335, float2(0.0), isnan(_2335))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2335, float2(0.0), isnan(_2335))).y;
    float2 _2343 = float2(_750, _758);
    float _766 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2343, float2(0.0), isnan(_2343))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2343, float2(0.0), isnan(_2343))).x;
    float2 _2351 = float2(_756, _760);
    float3 _770 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2351, float2(0.0), isnan(_2351))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2351, float2(0.0), isnan(_2351))).xyz;
    float _772 = _770.x;
    float _774 = _770.y;
    float _776 = _770.z;
    float2 _2365 = float2(_726, _686);
    float3 _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2365, float2(0.0), isnan(_2365))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2365, float2(0.0), isnan(_2365))).xyz;
    float _780 = _778.x;
    float _782 = _778.y;
    float _784 = _778.z;
    float2 _2378 = float2(_752, 0.0);
    float3 _786 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2378, float2(0.0), isnan(_2378))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2378, float2(0.0), isnan(_2378))).xyz;
    float _788 = _786.x;
    float _790 = _786.y;
    float _792 = _786.z;
    float2 _2391 = float2(_754, 0.0);
    float3 _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2391, float2(0.0), isnan(_2391))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2391, float2(0.0), isnan(_2391))).xyz;
    float _796 = _794.x;
    float _798 = _794.y;
    float _800 = _794.z;
    float _802 = _186 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _804 = _186 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _806 = _288 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _808 = fma(_194, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _802);
    float _810 = fma(_194, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _804);
    float _812 = fma(_200, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _808);
    float _814 = fma(_200, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _810);
    float _816 = fma(_290, (*spvDescriptorSet0.fp_c9)._m0[69].x, _806);
    float _818 = _812 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _820 = _814 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _822 = in.m_66.x;
    float _824 = gl_FragCoord.w;
    float _826 = _822 * _824;
    float _828 = fma(_292, (*spvDescriptorSet0.fp_c9)._m0[69].z, _816);
    float _830 = trunc(_818);
    int _833 = int(_830);
    float _835 = trunc(_820);
    int _837 = int(_835);
    int _839 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _841 = _833 + _839;
    int _843 = _841 + 1;
    bool _845 = _843 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _847 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _849 = _837 + _847;
    int _851 = _849 + 1;
    int _853 = _843 | _851;
    bool _855 = _853 < 0;
    bool _857 = _855 || _845;
    bool _859 = _851 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _861 = _859 || _857;
    if (_861)
    {
        _300 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _863 = _300;
    float _865 = _863;
    if (!_861)
    {
        int _867 = _851 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _869 = _867 + _843;
        float _871 = floor(_820);
        int _873 = _869 << 2;
        int _875 = _869 >> 2;
        int _877 = 12 & _873;
        int _879 = _875 << 4;
        int _881 = _879 + _877;
        float _883 = floor(_818);
        int _885 = _881 + 16256;
        uint _888 = uint(int(uint(_885) >> uint(2)));
        uint _890 = uint(int(uint(int(_888)) >> uint(2)));
        int _892 = int(_888) & 3;
        float _894 = (*spvDescriptorSet0.fp_c9)._m0[int(_890)][_892];
        float _896 = -_871;
        float _898 = _820 + _896;
        float _900 = -_883;
        float _902 = _818 + _900;
        float _904 = rint(_894);
        float _906 = precise::max(_904, 0.0);
        uint _908 = uint(_906);
        uint _910 = clamp(_908, 0u, 65535u);
        float3 _2587 = float3(_902, _898, float(int(_910)));
        float3 _2591 = select(_2587, float3(0.0), isnan(_2587));
        float _912 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, _2591.xy, uint(rint(_2591.z))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, _2591.xy, uint(rint(_2591.z))).x;
        int _914 = _869 << 4;
        int _916 = _914 + 17904;
        int _918 = _881 + 24304;
        uint _920 = uint(int(uint(_918) >> uint(2)));
        uint _922 = uint(int(uint(int(_920)) >> uint(2)));
        int _924 = int(_920) & 3;
        float _926 = (*spvDescriptorSet0.fp_c9)._m0[int(_922)][_924];
        uint _928 = uint(int(uint(_916) >> uint(2)));
        uint _930 = uint(int(uint(int(_928)) >> uint(2)));
        int _932 = int(_928) & 3;
        float _934 = (*spvDescriptorSet0.fp_c9)._m0[int(_930)][_932];
        int _936 = int(_928) + 1;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        int _940 = _936 & 3;
        float _942 = (*spvDescriptorSet0.fp_c9)._m0[int(_938)][_940];
        int _944 = _916 + 8;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        uint _948 = uint(int(uint(int(_946)) >> uint(2)));
        int _950 = int(_946) & 3;
        float _952 = (*spvDescriptorSet0.fp_c9)._m0[int(_948)][_950];
        int _954 = int(_946) + 1;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        int _958 = _954 & 3;
        float _960 = (*spvDescriptorSet0.fp_c9)._m0[int(_956)][_958];
        float _962 = _186 * _942;
        float _964 = fma(_194, _934, _962);
        float _966 = 1.0 / _926;
        float _968 = fma(_200, _952, _964);
        float _970 = _968 + _960;
        float _972 = precise::clamp(_970, 0.0, 1.0);
        float _974 = _926 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _976 = -_972;
        float _978 = _976 + _912;
        float _980 = fma(_966, (*spvDescriptorSet0.fp_c13)._m0[4].w, _978);
        float _982 = _974 * _980;
        float _984 = exp2(_982);
        float _986 = 0.0 + _984;
        float _988 = precise::clamp(_986, 0.0, 1.0);
        float _990 = precise::min(_988, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _865 = _990;
    }
    float _992 = _865;
    float _994 = in.m_66.w;
    float _996 = gl_FragCoord.w;
    float _998 = _994 * _996;
    float _1000 = in.m_66.y;
    float _1002 = gl_FragCoord.w;
    float _1004 = _1000 * _1002;
    float _1006 = in.m_66.z;
    float _1008 = gl_FragCoord.w;
    float _1010 = _1006 * _1008;
    float _1012 = abs(_198);
    bool _1014 = _1012 > 0.00999999977648258209228515625;
    float _1016 = fma(_828, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1018 = _92 * _826;
    float _1020 = _1014 ? _198 : 0.00999999977648258209228515625;
    float _1022 = fma(_1016, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1024 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1026 = _766 * 0.25;
    float _1028 = _1020 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1030 = precise::min((*spvDescriptorSet0.fp_c9)._m0[27].w, 1.0);
    float _1032 = abs(_1022);
    float _1034 = log2(_1032);
    float _1036 = fma(_792, 0.125, _776);
    float _1038 = _624 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1040 = precise::max(_1028, -127.0);
    float _1042 = _1030 * 0.31830990314483642578125;
    float _1044 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1046 = fma(_1044, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1048 = _798 * 0.0452399961650371551513671875;
    float _1050 = _796 * 0.0452399961650371551513671875;
    float _1052 = -_1040;
    float _1054 = exp2(_1052);
    float _1056 = -_1024;
    float _1058 = exp2(_1056);
    float _1060 = _1034 * 1.5;
    float _1062 = _92 * _998;
    float _1064 = _92 * _1004;
    float _1066 = _92 * _1010;
    float _1068 = _1018 * _1042;
    float _1070 = -_1062;
    float _1072 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1074 = _1070 + _1072;
    float _1076 = _1064 * _1042;
    float _1078 = 1.0 / _1040;
    float _1080 = -_1054;
    float _1082 = _1080 + 1.0;
    float _1084 = _1066 * _1042;
    float _1086 = _1074 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1088 = precise::clamp(_1086, 0.0, 1.0);
    float _1090 = -_992;
    float _1092 = _1090 + 1.0;
    float _1094 = fma(_790, 0.125, _774);
    float _1096 = fma(_788, 0.125, _772);
    float _1098 = _1048 * _1076;
    float _1100 = exp2(_1060);
    float _1102 = _1058 * _1082;
    float _1104 = precise::max(_762, _1026);
    float _1106 = fma(_1088, _1092, _992);
    float _1108 = _1050 * _1068;
    float _1110 = _790 + _1104;
    float _1112 = _1102 * _1078;
    float _1114 = _788 + _1104;
    float _1116 = exp2(_1038);
    float _1118 = precise::min(_1106, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1120 = fma(_1104, _1114, _1096);
    float _1122 = _1100 * 12.56637096405029296875;
    float _1124 = fma(_1104, _1110, _1094);
    float _1126 = _792 + _1104;
    float _1128 = fma(_764, _788, _1120);
    float _1130 = 1.0 / _1122;
    float _1132 = fma(_764, _790, _1124);
    float _1134 = fma(_1104, _1126, _1036);
    float _1136 = _236 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1138 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1140 = _1132 * 0.17880000174045562744140625;
    float _1142 = fma(_764, _792, _1134);
    float _1144 = _1112 * _1136;
    float _1146 = fma(_1128, 0.053149998188018798828125, _1140);
    float _1148 = precise::max(0.0, _1108);
    float _1150 = fma(_1142, 0.01805000007152557373046875, _1146);
    float _1152 = -_1144;
    float _1154 = exp2(_1152);
    float _1156 = _1046 * _1130;
    float _1158 = 1.0 / _1150;
    float _1160 = -_1154;
    float _1162 = _1160 + 1.0;
    float _1164 = _1162 * _1156;
    float _1166 = _1158 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1168 = -_1116;
    float _1170 = _1168 + 1.0;
    float _1172 = _1118 * _1164;
    float _1174 = _1138 * _1166;
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = _1170 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1180 = fma(_1176, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1182 = -_1178;
    float _1184 = _1182 + 1.0;
    float _1186 = _1178 * _1154;
    float _1188 = precise::min(_1166, _1180);
    float _1190 = _1154 * _1184;
    float _1192 = _1172 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1194 = _1172 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1196 = _1172 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1198 = _1188 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1200 = fma(_782, _1186, _1192);
    float _1202 = fma(_780, _1186, _1194);
    float _1204 = fma(_784, _1186, _1196);
    float _1206 = fma(_1180, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1198);
    float _1208 = _800 * 0.0452399961650371551513671875;
    float _1210 = fma(_1190, _1148, _1202);
    float _1212 = _1128 * _1206;
    float _1214 = _1212 * 0.25;
    float _1216 = _1132 * _1206;
    float _1218 = _1216 * 0.25;
    float _1220 = _1142 * _1206;
    float _1222 = _1220 * 0.25;
    float _1224 = precise::max(0.0, _1098);
    float _1226 = _1214 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1228 = _1218 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1230 = _1222 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1232 = _1208 * _1084;
    float _1234 = fma(_1190, _1224, _1200);
    float _1236 = precise::max(0.0, _1226);
    float _1238 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1240 = _236 + _1238;
    float _1242 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1244 = _236 + _1242;
    float _1246 = precise::max(0.0, _1228);
    float _1248 = precise::max(0.0, _1230);
    float _1250 = _1240 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = precise::max(0.0, _1232);
    float _1256 = _1190 * _1236;
    float _1258 = _1244 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1260 = precise::clamp(_1258, 0.0, 1.0);
    float _1262 = _1190 * _1246;
    float _1264 = _1190 * _1248;
    float _1266 = fma(_1190, _1254, _1204);
    float _1268 = fma(_1252, _1256, _1210);
    float _1270 = fma(_1260, _1256, _1210);
    float _1272 = fma(_1252, _1262, _1234);
    float _1274 = fma(_1260, _1262, _1234);
    float _1276 = fma(_1252, _1264, _1266);
    float _1278 = fma(_1260, _1264, _1266);
    out.m_69.x = _1268;
    out.m_69.y = _1272;
    out.m_69.z = _1276;
    out.m_69.w = 1.0;
    out.m_71.x = _1270;
    out.m_71.y = _1274;
    out.m_71.z = _1278;
    out.m_71.w = 1.0;
    return out;
}

