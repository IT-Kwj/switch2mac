#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_33 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_30 [[attribute(6)]];
    float4 m_35 [[attribute(7)]];
    float4 m_47 [[attribute(9)]];
    float4 m_45 [[attribute(10)]];
    float4 m_49 [[attribute(11)]];
    float4 m_51 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1179 = as_type<float>(_92);
        out.gl_Position.z = _1179;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _86 = _112;
    }
    float _114 = _86;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_128);
        out.gl_Position.z = _1250;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.z;
    bool _134 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _136 = in.m_39.z;
    float _138 = in.m_37.y;
    float _140 = in.m_41.z;
    float _142 = in.m_39.y;
    float _144 = in.m_41.y;
    float _146 = _132 * _132;
    float _148 = in.m_37.x;
    float _150 = fma(_136, _136, _146);
    float _152 = in.m_39.x;
    float _154 = _138 * _138;
    float _156 = in.m_41.x;
    float _158 = fma(_140, _140, _150);
    float _160 = fma(_142, _142, _154);
    float _162 = sqrt(_158);
    float _164 = fma(_144, _144, _160);
    float _166 = in.m_43.x;
    float _168 = in.m_43.y;
    float _170 = in.m_43.z;
    float _172 = sqrt(_164);
    bool _174 = _162 > 0.0;
    bool _176 = _172 > 0.0;
    float _178 = _172;
    float _180 = _158;
    float _182 = _148;
    if (_174)
    {
        float _184 = rsqrt(_158);
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _138 * _168;
    float _190 = _142 * _168;
    float _192 = _144 * _168;
    float _194 = _190;
    float _196 = _188;
    if (!_174)
    {
        _130 = 0.0;
    }
    float _198 = _130;
    float _200 = fma(_166, _148, _188);
    float _202 = fma(_166, _152, _190);
    float _204 = fma(_166, _156, _192);
    float _206 = _164;
    float _208 = _198;
    if (_176)
    {
        float _210 = rsqrt(_164);
        _206 = _210;
    }
    float _212 = _206;
    float _214 = 0.0;
    float _216 = 0.0;
    if (!_176)
    {
        _214 = 0.0;
        _216 = 0.0;
    }
    float _218 = _214;
    float _220 = _216;
    float _222 = _218;
    float _224 = _220;
    if (!_174)
    {
        _180 = 0.0;
        _194 = 0.0;
    }
    float _226 = _180;
    float _228 = _194;
    float _230 = _226;
    float _232 = _228;
    if (!_176)
    {
        _196 = 0.0;
    }
    float _234 = _196;
    float _236 = fma(_132, _170, _200);
    float _238 = fma(_136, _170, _202);
    float _240 = fma(_140, _170, _204);
    float _242 = _186;
    float _244 = _234;
    if (_174)
    {
        float _246 = _186 * 0.001000000047497451305389404296875;
        _242 = _246;
    }
    float _248 = _242;
    if (_174)
    {
        float _250 = _136 * _248;
        _230 = _250;
    }
    float _252 = _230;
    if (_174)
    {
        float _254 = _132 * _248;
        _232 = _254;
    }
    float _256 = _232;
    if (_174)
    {
        float _258 = _140 * _248;
        _208 = _258;
    }
    float _260 = _208;
    if (_176)
    {
        float _262 = _212 * _142;
        _244 = _262;
    }
    float _264 = _244;
    float _266 = _264;
    if (_176)
    {
        float _268 = _212 * _138;
        _222 = _268;
    }
    float _270 = _222;
    float _272 = _270;
    if (_176)
    {
        float _274 = _212 * _144;
        _224 = _274;
    }
    float _276 = _224;
    bool _278 = !_134;
    float _280 = _276;
    float _298;
    if (!_278)
    {
        float _282 = in.m_45.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_76);
        float _304 = 1.0 / _302;
        float _306 = _110 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = in.m_30.x;
    float _312 = in.m_30.y;
    float _314 = in.m_30.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _308 + _316;
    float _320 = in.m_45.x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _354;
    float _358 = _142 * _312;
    float _360 = _144 * _312;
    float _362 = 1.0 / _332;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _308 + _364;
    float _368 = fma(_152, _310, _358);
    float _370 = fma(_156, _310, _360);
    float _372 = fma(_320, 0.2000000476837158203125, 0.89999997615814208984375);
    float _374 = _320 * 100.0;
    float _376 = in.m_47.x;
    float _378 = in.m_47.y;
    float _380 = in.m_47.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _308 + _382;
    float _386 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _388 = _366 * _352;
    float _390 = fma(_110, 0.00999999977648258209228515625, _374);
    float _392 = fma(_110, _386, _374);
    float _394 = _384 * _346;
    float _396 = _318 * _362;
    float _398 = fma(_136, _314, _368);
    float _400 = fma(_140, _314, _370);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = _236 * _236;
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_238, _238, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_240, _240, _422);
    bool _438 = _376 > 0.0;
    float _440 = abs(_376);
    float _442 = -_440;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[191].y, _392);
    bool _446 = _376 >= 0.0;
    bool _448 = isnan(_376);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _458 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_308);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = rsqrt(_436);
    int _472 = _454 ? 0 : 1;
    float _474 = _444 * 0.15915493667125701904296875;
    bool _476 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_308);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = fma(_430, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _490 = ~_472;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    float _496 = fma(_434, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    int _502 = _494;
    float _504 = _312;
    float _506 = _314;
    if (!_438)
    {
        int _508 = ~_472;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = -_486;
    float _516 = _514 + 1.0;
    bool _518 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_308);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _474 * 6.283185482025146484375;
    float _532 = cos(_530);
    float _534 = _390 * 0.15915493667125701904296875;
    float _536 = _344 * _516;
    float _538 = abs(_376);
    float _540 = -_538;
    float _542 = _540 + 1.0;
    float _544 = _528 * _500;
    float _546 = _236 * _470;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _238 * _470;
    float _554 = _474 * 6.283185482025146484375;
    float _556 = sin(_554);
    float _558 = _486 * _550;
    float _560 = fma(_350, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = -_542;
    float _564 = fma(_562, _542, 1.0);
    float _566 = _240 * _470;
    float _568 = float(_512);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _570;
    float _574 = _534 * 6.283185482025146484375;
    float _576 = sin(_574);
    float _578 = _418 * _536;
    float _580 = _546 * _270;
    float _582 = _532 * _564;
    float _584 = _416 * _536;
    float _586 = _420 * _536;
    float _588 = fma(_552, _264, _580);
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _592 = _568 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _594 = fma(_566, _276, _588);
    float _596 = _590 * 0.15915493667125701904296875;
    float _598 = -_344;
    float _600 = _598 + 1.0;
    float _602 = _556 * _592;
    float _604 = _582 * _592;
    float _606 = abs(_594);
    bool _608 = _606 > 0.99989998340606689453125;
    float _610 = fma(_576, 2.0, 2.0);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _596 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    float _622 = fma(_572, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _626 = fma(_356, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = _602 * 0.15915493667125701904296875;
    float _630 = _596 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = _604 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _636 = fma(_456, _558, _618);
    float _638 = fma(_488, _558, _620);
    float _640 = fma(_496, _558, _624);
    if (_608)
    {
        float _642 = _264 + _252;
        _266 = _642;
    }
    float _644 = _266;
    if (_608)
    {
        float _646 = _270 + _256;
        _272 = _646;
    }
    float _648 = _272;
    if (_608)
    {
        float _650 = _276 + _260;
        _280 = _650;
    }
    float _652 = _280;
    float _654 = _628 * 6.283185482025146484375;
    float _656 = cos(_654);
    float _658 = in.m_49.x;
    float _660 = in.m_49.y;
    float _662 = in.m_49.z;
    float _664 = _634 * 0.15915493667125701904296875;
    float _666 = fma(_612, 0.949999988079071044921875, -1.0);
    float _668 = fma(_626, _544, _640);
    float _670 = -_644;
    float _672 = _566 * _670;
    float _674 = fma(_622, _544, _636);
    float _676 = _628 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _682 = fma(_560, _544, _638);
    float _684 = -_652;
    float _686 = _546 * _684;
    float _688 = -_648;
    float _690 = _552 * _688;
    float _692 = -_652;
    float _694 = -_672;
    float _696 = fma(_552, _692, _694);
    float _698 = _616 * _380;
    float _700 = in.m_51.x;
    float _702 = _664 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _392 * 0.15915493667125701904296875;
    float _708 = -_644;
    float _710 = -_690;
    float _712 = fma(_546, _708, _710);
    float _714 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _674);
    float _716 = -_648;
    float _718 = -_686;
    float _720 = fma(_566, _716, _718);
    float _722 = _696 * _696;
    float _724 = fma(_632, _378, _698);
    float _726 = _632 * _380;
    float _728 = _664 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _656 * _376;
    float _734 = _714 * _658;
    float _736 = -_726;
    float _738 = fma(_616, _378, _736);
    float _740 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _682);
    float _742 = fma(_724, _678, _732);
    float _744 = _678 * _376;
    float _746 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _668);
    float _748 = _738 * _704;
    float _750 = fma(_720, _720, _722);
    float _752 = _706 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = _740 * _660;
    float _758 = -_744;
    float _760 = fma(_724, _656, _758);
    float _762 = fma(_712, _712, _750);
    float _764 = _746 * _662;
    float _766 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _738 * _730;
    float _770 = -_748;
    float _772 = fma(_742, _730, _770);
    float _774 = -_760;
    float _776 = _774 + _380;
    float _778 = rsqrt(_762);
    float _780 = fma(_742, _704, _768);
    float _782 = -_772;
    float _784 = _782 + _376;
    float _786 = fma(_776, _700, _760);
    float _788 = in.m_41.w;
    float _790 = -_780;
    float _792 = _790 + _378;
    float _794 = fma(_784, _700, _772);
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[191].w, _786);
    float _798 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = fma(_792, _700, _780);
    float _802 = -_376;
    float _804 = _794 + _802;
    float _806 = -_380;
    float _808 = _796 + _806;
    float _810 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = -_378;
    float _814 = _800 + _812;
    float _816 = fma(_680, _804, _376);
    float _818 = _720 * _778;
    float _820 = fma(_680, _814, _378);
    float _822 = in.m_39.w;
    float _824 = _696 * _778;
    float _826 = fma(_680, _808, _380);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _816);
    float _832 = _712 * _778;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _826);
    float _836 = _766 * _828;
    float _838 = _798 * _830;
    float _840 = _552 * _824;
    float _842 = _810 * _834;
    float _844 = _836 * _566;
    float _846 = _546 * _832;
    float _848 = -_840;
    float _850 = fma(_546, _818, _848);
    float _852 = _836 * _552;
    float _854 = fma(_838, _832, _844);
    float _856 = _400 + _788;
    float _858 = -_846;
    float _860 = fma(_566, _824, _858);
    float _862 = fma(_838, _818, _852);
    float _864 = fma(_842, _850, _854);
    float _866 = _138 * _312;
    float _868 = _566 * _818;
    float _870 = fma(_842, _860, _862);
    float _872 = _856 + _864;
    float _874 = _398 + _822;
    float _876 = in.m_37.w;
    float _878 = fma(_148, _310, _866);
    float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _882 = _872 + _880;
    float _884 = _874 + _870;
    float _886 = in.m_51.w;
    float _888 = _836 * _546;
    float _890 = _882 * _882;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _884 + _892;
    float _896 = fma(_132, _314, _878);
    float _898 = -_868;
    float _900 = fma(_552, _832, _898);
    float _902 = fma(_838, _824, _888);
    float _904 = fma(_894, _894, _890);
    bool _906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _908 = isnan(0.5);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _914 = _910 || _912;
    float _916 = fma(_842, _900, _902);
    float _918 = sqrt(_904);
    float _920 = _896 + _876;
    float _922 = _920 + _916;
    bool _924 = _918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_924)
    {
        _182 = _884;
    }
    float _926 = _182;
    float _928 = _926;
    if (!_924)
    {
        _504 = _872;
    }
    float _930 = _504;
    float _932 = _930;
    if (!_924)
    {
        _506 = _922;
    }
    float _934 = _506;
    bool _936 = !_924;
    float _938 = _934;
    if (!_936)
    {
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _944 = _918 + _942;
        float _946 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = _944 * _940;
        float _950 = rsqrt(_904);
        float _952 = _948 * 0.15915493667125701904296875;
        float _954 = _952 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        float _962 = _956 + (-1.0);
        float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_960, _946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _968 = fma(_922, _956, _964);
        float _970 = _950 * _966;
        float _972 = fma(_894, _970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _974 = fma(_882, _970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _968;
        _932 = _974;
        _928 = _972;
    }
    float _976 = _938;
    float _978 = _932;
    float _980 = _928;
    float _982 = _976;
    float _984 = _980;
    float _986 = _978;
    if (!_914)
    {
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _990 = _920 + _988;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _994 = _874 + _992;
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _998 = -_920;
        float _1000 = _998 + _976;
        float _1002 = _990 * _990;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1006 = _856 + _1004;
        float _1008 = -_856;
        float _1010 = _1008 + _978;
        float _1012 = fma(_994, _994, _1002);
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = fma(_1006, _1006, _1012);
        float _1018 = sqrt(_1016);
        float _1020 = _996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1022 = precise::min(_1018, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1024 = _1022 * _1014;
        float _1026 = -_874;
        float _1028 = _1026 + _980;
        float _1030 = _1020 * _1024;
        float _1032 = fma(_1028, _1030, _874);
        float _1034 = fma(_1000, _1030, _920);
        float _1036 = fma(_1010, _1030, _856);
        _982 = _1034;
        _984 = _1032;
        _986 = _1036;
    }
    float _1038 = _982;
    float _1040 = _984;
    float _1042 = _986;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1044);
    float _1054 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1046);
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1048);
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1052);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1066 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1058);
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_53.w = _886;
    float _1074 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1074);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1080);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1106 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1120 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1094);
    float _1122 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    out.m_33.x = 1.0;
    out.m_55.w = _1106;
    out.m_57.x = _1110;
    out.m_57.y = _1112;
    out.m_57.z = _1114;
    out.m_57.w = _1108;
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1179 = as_type<float>(_92);
        out.gl_Position.z = _1179;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _86 = _112;
    }
    float _114 = _86;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_128);
        out.gl_Position.z = _1250;
    }
    if (_120)
    {
        return out;
    }
    float _132 = in.m_37.z;
    bool _134 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _136 = in.m_39.z;
    float _138 = in.m_37.y;
    float _140 = in.m_41.z;
    float _142 = in.m_39.y;
    float _144 = in.m_41.y;
    float _146 = _132 * _132;
    float _148 = in.m_37.x;
    float _150 = fma(_136, _136, _146);
    float _152 = in.m_39.x;
    float _154 = _138 * _138;
    float _156 = in.m_41.x;
    float _158 = fma(_140, _140, _150);
    float _160 = fma(_142, _142, _154);
    float _162 = sqrt(_158);
    float _164 = fma(_144, _144, _160);
    float _166 = in.m_43.x;
    float _168 = in.m_43.y;
    float _170 = in.m_43.z;
    float _172 = sqrt(_164);
    bool _174 = _162 > 0.0;
    bool _176 = _172 > 0.0;
    float _178 = _172;
    float _180 = _158;
    float _182 = _148;
    if (_174)
    {
        float _184 = rsqrt(_158);
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _138 * _168;
    float _190 = _142 * _168;
    float _192 = _144 * _168;
    float _194 = _190;
    float _196 = _188;
    if (!_174)
    {
        _130 = 0.0;
    }
    float _198 = _130;
    float _200 = fma(_166, _148, _188);
    float _202 = fma(_166, _152, _190);
    float _204 = fma(_166, _156, _192);
    float _206 = _164;
    float _208 = _198;
    if (_176)
    {
        float _210 = rsqrt(_164);
        _206 = _210;
    }
    float _212 = _206;
    float _214 = 0.0;
    float _216 = 0.0;
    if (!_176)
    {
        _214 = 0.0;
        _216 = 0.0;
    }
    float _218 = _214;
    float _220 = _216;
    float _222 = _218;
    float _224 = _220;
    if (!_174)
    {
        _180 = 0.0;
        _194 = 0.0;
    }
    float _226 = _180;
    float _228 = _194;
    float _230 = _226;
    float _232 = _228;
    if (!_176)
    {
        _196 = 0.0;
    }
    float _234 = _196;
    float _236 = fma(_132, _170, _200);
    float _238 = fma(_136, _170, _202);
    float _240 = fma(_140, _170, _204);
    float _242 = _186;
    float _244 = _234;
    if (_174)
    {
        float _246 = _186 * 0.001000000047497451305389404296875;
        _242 = _246;
    }
    float _248 = _242;
    if (_174)
    {
        float _250 = _136 * _248;
        _230 = _250;
    }
    float _252 = _230;
    if (_174)
    {
        float _254 = _132 * _248;
        _232 = _254;
    }
    float _256 = _232;
    if (_174)
    {
        float _258 = _140 * _248;
        _208 = _258;
    }
    float _260 = _208;
    if (_176)
    {
        float _262 = _212 * _142;
        _244 = _262;
    }
    float _264 = _244;
    float _266 = _264;
    if (_176)
    {
        float _268 = _212 * _138;
        _222 = _268;
    }
    float _270 = _222;
    float _272 = _270;
    if (_176)
    {
        float _274 = _212 * _144;
        _224 = _274;
    }
    float _276 = _224;
    bool _278 = !_134;
    float _280 = _276;
    float _298;
    if (!_278)
    {
        float _282 = in.m_45.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_76);
        float _304 = 1.0 / _302;
        float _306 = _110 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = in.m_30.x;
    float _312 = in.m_30.y;
    float _314 = in.m_30.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _308 + _316;
    float _320 = in.m_45.x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _354;
    float _358 = _142 * _312;
    float _360 = _144 * _312;
    float _362 = 1.0 / _332;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _308 + _364;
    float _368 = fma(_152, _310, _358);
    float _370 = fma(_156, _310, _360);
    float _372 = fma(_320, 0.2000000476837158203125, 0.89999997615814208984375);
    float _374 = _320 * 100.0;
    float _376 = in.m_47.x;
    float _378 = in.m_47.y;
    float _380 = in.m_47.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _308 + _382;
    float _386 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _388 = _366 * _352;
    float _390 = fma(_110, 0.00999999977648258209228515625, _374);
    float _392 = fma(_110, _386, _374);
    float _394 = _384 * _346;
    float _396 = _318 * _362;
    float _398 = fma(_136, _314, _368);
    float _400 = fma(_140, _314, _370);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = _236 * _236;
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_238, _238, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_240, _240, _422);
    bool _438 = _376 > 0.0;
    float _440 = abs(_376);
    float _442 = -_440;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[191].y, _392);
    bool _446 = _376 >= 0.0;
    bool _448 = isnan(_376);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _458 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_308);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = rsqrt(_436);
    int _472 = _454 ? 0 : 1;
    float _474 = _444 * 0.15915493667125701904296875;
    bool _476 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_308);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = fma(_430, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _490 = ~_472;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    float _496 = fma(_434, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    int _502 = _494;
    float _504 = _312;
    float _506 = _314;
    if (!_438)
    {
        int _508 = ~_472;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = -_486;
    float _516 = _514 + 1.0;
    bool _518 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_308);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _474 * 6.283185482025146484375;
    float _532 = cos(_530);
    float _534 = _390 * 0.15915493667125701904296875;
    float _536 = _344 * _516;
    float _538 = abs(_376);
    float _540 = -_538;
    float _542 = _540 + 1.0;
    float _544 = _528 * _500;
    float _546 = _236 * _470;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _238 * _470;
    float _554 = _474 * 6.283185482025146484375;
    float _556 = sin(_554);
    float _558 = _486 * _550;
    float _560 = fma(_350, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = -_542;
    float _564 = fma(_562, _542, 1.0);
    float _566 = _240 * _470;
    float _568 = float(_512);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _570;
    float _574 = _534 * 6.283185482025146484375;
    float _576 = sin(_574);
    float _578 = _418 * _536;
    float _580 = _546 * _270;
    float _582 = _532 * _564;
    float _584 = _416 * _536;
    float _586 = _420 * _536;
    float _588 = fma(_552, _264, _580);
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _592 = _568 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _594 = fma(_566, _276, _588);
    float _596 = _590 * 0.15915493667125701904296875;
    float _598 = -_344;
    float _600 = _598 + 1.0;
    float _602 = _556 * _592;
    float _604 = _582 * _592;
    float _606 = abs(_594);
    bool _608 = _606 > 0.99989998340606689453125;
    float _610 = fma(_576, 2.0, 2.0);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _596 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    float _622 = fma(_572, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _626 = fma(_356, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = _602 * 0.15915493667125701904296875;
    float _630 = _596 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = _604 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _636 = fma(_456, _558, _618);
    float _638 = fma(_488, _558, _620);
    float _640 = fma(_496, _558, _624);
    if (_608)
    {
        float _642 = _264 + _252;
        _266 = _642;
    }
    float _644 = _266;
    if (_608)
    {
        float _646 = _270 + _256;
        _272 = _646;
    }
    float _648 = _272;
    if (_608)
    {
        float _650 = _276 + _260;
        _280 = _650;
    }
    float _652 = _280;
    float _654 = _628 * 6.283185482025146484375;
    float _656 = cos(_654);
    float _658 = in.m_49.x;
    float _660 = in.m_49.y;
    float _662 = in.m_49.z;
    float _664 = _634 * 0.15915493667125701904296875;
    float _666 = fma(_612, 0.949999988079071044921875, -1.0);
    float _668 = fma(_626, _544, _640);
    float _670 = -_644;
    float _672 = _566 * _670;
    float _674 = fma(_622, _544, _636);
    float _676 = _628 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _682 = fma(_560, _544, _638);
    float _684 = -_652;
    float _686 = _546 * _684;
    float _688 = -_648;
    float _690 = _552 * _688;
    float _692 = -_652;
    float _694 = -_672;
    float _696 = fma(_552, _692, _694);
    float _698 = _616 * _380;
    float _700 = in.m_51.x;
    float _702 = _664 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _392 * 0.15915493667125701904296875;
    float _708 = -_644;
    float _710 = -_690;
    float _712 = fma(_546, _708, _710);
    float _714 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _674);
    float _716 = -_648;
    float _718 = -_686;
    float _720 = fma(_566, _716, _718);
    float _722 = _696 * _696;
    float _724 = fma(_632, _378, _698);
    float _726 = _632 * _380;
    float _728 = _664 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _656 * _376;
    float _734 = _714 * _658;
    float _736 = -_726;
    float _738 = fma(_616, _378, _736);
    float _740 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _682);
    float _742 = fma(_724, _678, _732);
    float _744 = _678 * _376;
    float _746 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _668);
    float _748 = _738 * _704;
    float _750 = fma(_720, _720, _722);
    float _752 = _706 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = _740 * _660;
    float _758 = -_744;
    float _760 = fma(_724, _656, _758);
    float _762 = fma(_712, _712, _750);
    float _764 = _746 * _662;
    float _766 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _738 * _730;
    float _770 = -_748;
    float _772 = fma(_742, _730, _770);
    float _774 = -_760;
    float _776 = _774 + _380;
    float _778 = rsqrt(_762);
    float _780 = fma(_742, _704, _768);
    float _782 = -_772;
    float _784 = _782 + _376;
    float _786 = fma(_776, _700, _760);
    float _788 = in.m_41.w;
    float _790 = -_780;
    float _792 = _790 + _378;
    float _794 = fma(_784, _700, _772);
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[191].w, _786);
    float _798 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = fma(_792, _700, _780);
    float _802 = -_376;
    float _804 = _794 + _802;
    float _806 = -_380;
    float _808 = _796 + _806;
    float _810 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = -_378;
    float _814 = _800 + _812;
    float _816 = fma(_680, _804, _376);
    float _818 = _720 * _778;
    float _820 = fma(_680, _814, _378);
    float _822 = in.m_39.w;
    float _824 = _696 * _778;
    float _826 = fma(_680, _808, _380);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _816);
    float _832 = _712 * _778;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _826);
    float _836 = _766 * _828;
    float _838 = _798 * _830;
    float _840 = _552 * _824;
    float _842 = _810 * _834;
    float _844 = _836 * _566;
    float _846 = _546 * _832;
    float _848 = -_840;
    float _850 = fma(_546, _818, _848);
    float _852 = _836 * _552;
    float _854 = fma(_838, _832, _844);
    float _856 = _400 + _788;
    float _858 = -_846;
    float _860 = fma(_566, _824, _858);
    float _862 = fma(_838, _818, _852);
    float _864 = fma(_842, _850, _854);
    float _866 = _138 * _312;
    float _868 = _566 * _818;
    float _870 = fma(_842, _860, _862);
    float _872 = _856 + _864;
    float _874 = _398 + _822;
    float _876 = in.m_37.w;
    float _878 = fma(_148, _310, _866);
    float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _882 = _872 + _880;
    float _884 = _874 + _870;
    float _886 = in.m_51.w;
    float _888 = _836 * _546;
    float _890 = _882 * _882;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _884 + _892;
    float _896 = fma(_132, _314, _878);
    float _898 = -_868;
    float _900 = fma(_552, _832, _898);
    float _902 = fma(_838, _824, _888);
    float _904 = fma(_894, _894, _890);
    bool _906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _908 = isnan(0.5);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _914 = _910 || _912;
    float _916 = fma(_842, _900, _902);
    float _918 = sqrt(_904);
    float _920 = _896 + _876;
    float _922 = _920 + _916;
    bool _924 = _918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_924)
    {
        _182 = _884;
    }
    float _926 = _182;
    float _928 = _926;
    if (!_924)
    {
        _504 = _872;
    }
    float _930 = _504;
    float _932 = _930;
    if (!_924)
    {
        _506 = _922;
    }
    float _934 = _506;
    bool _936 = !_924;
    float _938 = _934;
    if (!_936)
    {
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _944 = _918 + _942;
        float _946 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = _944 * _940;
        float _950 = rsqrt(_904);
        float _952 = _948 * 0.15915493667125701904296875;
        float _954 = _952 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        float _962 = _956 + (-1.0);
        float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_960, _946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _968 = fma(_922, _956, _964);
        float _970 = _950 * _966;
        float _972 = fma(_894, _970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _974 = fma(_882, _970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _968;
        _932 = _974;
        _928 = _972;
    }
    float _976 = _938;
    float _978 = _932;
    float _980 = _928;
    float _982 = _976;
    float _984 = _980;
    float _986 = _978;
    if (!_914)
    {
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _990 = _920 + _988;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _994 = _874 + _992;
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _998 = -_920;
        float _1000 = _998 + _976;
        float _1002 = _990 * _990;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1006 = _856 + _1004;
        float _1008 = -_856;
        float _1010 = _1008 + _978;
        float _1012 = fma(_994, _994, _1002);
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = fma(_1006, _1006, _1012);
        float _1018 = sqrt(_1016);
        float _1020 = _996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1022 = precise::min(_1018, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1024 = _1022 * _1014;
        float _1026 = -_874;
        float _1028 = _1026 + _980;
        float _1030 = _1020 * _1024;
        float _1032 = fma(_1028, _1030, _874);
        float _1034 = fma(_1000, _1030, _920);
        float _1036 = fma(_1010, _1030, _856);
        _982 = _1034;
        _984 = _1032;
        _986 = _1036;
    }
    float _1038 = _982;
    float _1040 = _984;
    float _1042 = _986;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1044);
    float _1054 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1046);
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1048);
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1052);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1066 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1058);
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_53.w = _886;
    float _1074 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1074);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1080);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1106 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1120 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1094);
    float _1122 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    out.m_33.x = 1.0;
    out.m_55.w = _1106;
    out.m_57.x = _1110;
    out.m_57.y = _1112;
    out.m_57.z = _1114;
    out.m_57.w = _1108;
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1179 = as_type<float>(_92);
        out.gl_Position.z = _1179;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _86 = _112;
    }
    float _114 = _86;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_128);
        out.gl_Position.z = _1250;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.z;
    bool _134 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _136 = in.m_39.z;
    float _138 = in.m_37.y;
    float _140 = in.m_41.z;
    float _142 = in.m_39.y;
    float _144 = in.m_41.y;
    float _146 = _132 * _132;
    float _148 = in.m_37.x;
    float _150 = fma(_136, _136, _146);
    float _152 = in.m_39.x;
    float _154 = _138 * _138;
    float _156 = in.m_41.x;
    float _158 = fma(_140, _140, _150);
    float _160 = fma(_142, _142, _154);
    float _162 = sqrt(_158);
    float _164 = fma(_144, _144, _160);
    float _166 = in.m_43.x;
    float _168 = in.m_43.y;
    float _170 = in.m_43.z;
    float _172 = sqrt(_164);
    bool _174 = _162 > 0.0;
    bool _176 = _172 > 0.0;
    float _178 = _172;
    float _180 = _158;
    float _182 = _148;
    if (_174)
    {
        float _184 = rsqrt(_158);
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _138 * _168;
    float _190 = _142 * _168;
    float _192 = _144 * _168;
    float _194 = _190;
    float _196 = _188;
    if (!_174)
    {
        _130 = 0.0;
    }
    float _198 = _130;
    float _200 = fma(_166, _148, _188);
    float _202 = fma(_166, _152, _190);
    float _204 = fma(_166, _156, _192);
    float _206 = _164;
    float _208 = _198;
    if (_176)
    {
        float _210 = rsqrt(_164);
        _206 = _210;
    }
    float _212 = _206;
    float _214 = 0.0;
    float _216 = 0.0;
    if (!_176)
    {
        _214 = 0.0;
        _216 = 0.0;
    }
    float _218 = _214;
    float _220 = _216;
    float _222 = _218;
    float _224 = _220;
    if (!_174)
    {
        _180 = 0.0;
        _194 = 0.0;
    }
    float _226 = _180;
    float _228 = _194;
    float _230 = _226;
    float _232 = _228;
    if (!_176)
    {
        _196 = 0.0;
    }
    float _234 = _196;
    float _236 = fma(_132, _170, _200);
    float _238 = fma(_136, _170, _202);
    float _240 = fma(_140, _170, _204);
    float _242 = _186;
    float _244 = _234;
    if (_174)
    {
        float _246 = _186 * 0.001000000047497451305389404296875;
        _242 = _246;
    }
    float _248 = _242;
    if (_174)
    {
        float _250 = _136 * _248;
        _230 = _250;
    }
    float _252 = _230;
    if (_174)
    {
        float _254 = _132 * _248;
        _232 = _254;
    }
    float _256 = _232;
    if (_174)
    {
        float _258 = _140 * _248;
        _208 = _258;
    }
    float _260 = _208;
    if (_176)
    {
        float _262 = _212 * _142;
        _244 = _262;
    }
    float _264 = _244;
    float _266 = _264;
    if (_176)
    {
        float _268 = _212 * _138;
        _222 = _268;
    }
    float _270 = _222;
    float _272 = _270;
    if (_176)
    {
        float _274 = _212 * _144;
        _224 = _274;
    }
    float _276 = _224;
    bool _278 = !_134;
    float _280 = _276;
    float _298;
    if (!_278)
    {
        float _282 = in.m_45.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_76);
        float _304 = 1.0 / _302;
        float _306 = _110 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = in.m_30.x;
    float _312 = in.m_30.y;
    float _314 = in.m_30.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _308 + _316;
    float _320 = in.m_45.x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    bool _334 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_308);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _354;
    float _358 = _142 * _312;
    float _360 = _144 * _312;
    float _362 = 1.0 / _332;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _308 + _364;
    float _368 = fma(_152, _310, _358);
    float _370 = fma(_156, _310, _360);
    float _372 = fma(_320, 0.2000000476837158203125, 0.89999997615814208984375);
    float _374 = _320 * 100.0;
    float _376 = in.m_47.x;
    float _378 = in.m_47.y;
    float _380 = in.m_47.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _308 + _382;
    float _386 = _372 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _388 = _366 * _352;
    float _390 = fma(_110, 0.00999999977648258209228515625, _374);
    float _392 = fma(_110, _386, _374);
    float _394 = _384 * _346;
    float _396 = _318 * _362;
    float _398 = fma(_136, _314, _368);
    float _400 = fma(_140, _314, _370);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = _236 * _236;
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_238, _238, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_240, _240, _422);
    bool _438 = _376 > 0.0;
    float _440 = abs(_376);
    float _442 = -_440;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[191].y, _392);
    bool _446 = _376 >= 0.0;
    bool _448 = isnan(_376);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _458 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_308);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = rsqrt(_436);
    int _472 = _454 ? 0 : 1;
    float _474 = _444 * 0.15915493667125701904296875;
    bool _476 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_308);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = fma(_430, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _490 = ~_472;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    float _496 = fma(_434, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = -_468;
    float _500 = _498 + 1.0;
    int _502 = _494;
    float _504 = _312;
    float _506 = _314;
    if (!_438)
    {
        int _508 = ~_472;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = -_486;
    float _516 = _514 + 1.0;
    bool _518 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_308);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _474 * 6.283185482025146484375;
    float _532 = cos(_530);
    float _534 = _390 * 0.15915493667125701904296875;
    float _536 = _344 * _516;
    float _538 = abs(_376);
    float _540 = -_538;
    float _542 = _540 + 1.0;
    float _544 = _528 * _500;
    float _546 = _236 * _470;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _238 * _470;
    float _554 = _474 * 6.283185482025146484375;
    float _556 = sin(_554);
    float _558 = _486 * _550;
    float _560 = fma(_350, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = -_542;
    float _564 = fma(_562, _542, 1.0);
    float _566 = _240 * _470;
    float _568 = float(_512);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _570;
    float _574 = _534 * 6.283185482025146484375;
    float _576 = sin(_574);
    float _578 = _418 * _536;
    float _580 = _546 * _270;
    float _582 = _532 * _564;
    float _584 = _416 * _536;
    float _586 = _420 * _536;
    float _588 = fma(_552, _264, _580);
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _592 = _568 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _594 = fma(_566, _276, _588);
    float _596 = _590 * 0.15915493667125701904296875;
    float _598 = -_344;
    float _600 = _598 + 1.0;
    float _602 = _556 * _592;
    float _604 = _582 * _592;
    float _606 = abs(_594);
    bool _608 = _606 > 0.99989998340606689453125;
    float _610 = fma(_576, 2.0, 2.0);
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _596 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    float _622 = fma(_572, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _626 = fma(_356, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = _602 * 0.15915493667125701904296875;
    float _630 = _596 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = _604 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _636 = fma(_456, _558, _618);
    float _638 = fma(_488, _558, _620);
    float _640 = fma(_496, _558, _624);
    if (_608)
    {
        float _642 = _264 + _252;
        _266 = _642;
    }
    float _644 = _266;
    if (_608)
    {
        float _646 = _270 + _256;
        _272 = _646;
    }
    float _648 = _272;
    if (_608)
    {
        float _650 = _276 + _260;
        _280 = _650;
    }
    float _652 = _280;
    float _654 = _628 * 6.283185482025146484375;
    float _656 = cos(_654);
    float _658 = in.m_49.x;
    float _660 = in.m_49.y;
    float _662 = in.m_49.z;
    float _664 = _634 * 0.15915493667125701904296875;
    float _666 = fma(_612, 0.949999988079071044921875, -1.0);
    float _668 = fma(_626, _544, _640);
    float _670 = -_644;
    float _672 = _566 * _670;
    float _674 = fma(_622, _544, _636);
    float _676 = _628 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _682 = fma(_560, _544, _638);
    float _684 = -_652;
    float _686 = _546 * _684;
    float _688 = -_648;
    float _690 = _552 * _688;
    float _692 = -_652;
    float _694 = -_672;
    float _696 = fma(_552, _692, _694);
    float _698 = _616 * _380;
    float _700 = in.m_51.x;
    float _702 = _664 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _392 * 0.15915493667125701904296875;
    float _708 = -_644;
    float _710 = -_690;
    float _712 = fma(_546, _708, _710);
    float _714 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _674);
    float _716 = -_648;
    float _718 = -_686;
    float _720 = fma(_566, _716, _718);
    float _722 = _696 * _696;
    float _724 = fma(_632, _378, _698);
    float _726 = _632 * _380;
    float _728 = _664 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _656 * _376;
    float _734 = _714 * _658;
    float _736 = -_726;
    float _738 = fma(_616, _378, _736);
    float _740 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _682);
    float _742 = fma(_724, _678, _732);
    float _744 = _678 * _376;
    float _746 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _668);
    float _748 = _738 * _704;
    float _750 = fma(_720, _720, _722);
    float _752 = _706 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = _740 * _660;
    float _758 = -_744;
    float _760 = fma(_724, _656, _758);
    float _762 = fma(_712, _712, _750);
    float _764 = _746 * _662;
    float _766 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _738 * _730;
    float _770 = -_748;
    float _772 = fma(_742, _730, _770);
    float _774 = -_760;
    float _776 = _774 + _380;
    float _778 = rsqrt(_762);
    float _780 = fma(_742, _704, _768);
    float _782 = -_772;
    float _784 = _782 + _376;
    float _786 = fma(_776, _700, _760);
    float _788 = in.m_41.w;
    float _790 = -_780;
    float _792 = _790 + _378;
    float _794 = fma(_784, _700, _772);
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[191].w, _786);
    float _798 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = fma(_792, _700, _780);
    float _802 = -_376;
    float _804 = _794 + _802;
    float _806 = -_380;
    float _808 = _796 + _806;
    float _810 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = -_378;
    float _814 = _800 + _812;
    float _816 = fma(_680, _804, _376);
    float _818 = _720 * _778;
    float _820 = fma(_680, _814, _378);
    float _822 = in.m_39.w;
    float _824 = _696 * _778;
    float _826 = fma(_680, _808, _380);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _816);
    float _832 = _712 * _778;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _826);
    float _836 = _766 * _828;
    float _838 = _798 * _830;
    float _840 = _552 * _824;
    float _842 = _810 * _834;
    float _844 = _836 * _566;
    float _846 = _546 * _832;
    float _848 = -_840;
    float _850 = fma(_546, _818, _848);
    float _852 = _836 * _552;
    float _854 = fma(_838, _832, _844);
    float _856 = _400 + _788;
    float _858 = -_846;
    float _860 = fma(_566, _824, _858);
    float _862 = fma(_838, _818, _852);
    float _864 = fma(_842, _850, _854);
    float _866 = _138 * _312;
    float _868 = _566 * _818;
    float _870 = fma(_842, _860, _862);
    float _872 = _856 + _864;
    float _874 = _398 + _822;
    float _876 = in.m_37.w;
    float _878 = fma(_148, _310, _866);
    float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _882 = _872 + _880;
    float _884 = _874 + _870;
    float _886 = in.m_51.w;
    float _888 = _836 * _546;
    float _890 = _882 * _882;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _884 + _892;
    float _896 = fma(_132, _314, _878);
    float _898 = -_868;
    float _900 = fma(_552, _832, _898);
    float _902 = fma(_838, _824, _888);
    float _904 = fma(_894, _894, _890);
    bool _906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _908 = isnan(0.5);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _914 = _910 || _912;
    float _916 = fma(_842, _900, _902);
    float _918 = sqrt(_904);
    float _920 = _896 + _876;
    float _922 = _920 + _916;
    bool _924 = _918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_924)
    {
        _182 = _884;
    }
    float _926 = _182;
    float _928 = _926;
    if (!_924)
    {
        _504 = _872;
    }
    float _930 = _504;
    float _932 = _930;
    if (!_924)
    {
        _506 = _922;
    }
    float _934 = _506;
    bool _936 = !_924;
    float _938 = _934;
    if (!_936)
    {
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _944 = _918 + _942;
        float _946 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = _944 * _940;
        float _950 = rsqrt(_904);
        float _952 = _948 * 0.15915493667125701904296875;
        float _954 = _952 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _952 * 6.283185482025146484375;
        float _960 = sin(_958);
        float _962 = _956 + (-1.0);
        float _964 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_960, _946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _968 = fma(_922, _956, _964);
        float _970 = _950 * _966;
        float _972 = fma(_894, _970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _974 = fma(_882, _970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _968;
        _932 = _974;
        _928 = _972;
    }
    float _976 = _938;
    float _978 = _932;
    float _980 = _928;
    float _982 = _976;
    float _984 = _980;
    float _986 = _978;
    if (!_914)
    {
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _990 = _920 + _988;
        float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _994 = _874 + _992;
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _998 = -_920;
        float _1000 = _998 + _976;
        float _1002 = _990 * _990;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1006 = _856 + _1004;
        float _1008 = -_856;
        float _1010 = _1008 + _978;
        float _1012 = fma(_994, _994, _1002);
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = fma(_1006, _1006, _1012);
        float _1018 = sqrt(_1016);
        float _1020 = _996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1022 = precise::min(_1018, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1024 = _1022 * _1014;
        float _1026 = -_874;
        float _1028 = _1026 + _980;
        float _1030 = _1020 * _1024;
        float _1032 = fma(_1028, _1030, _874);
        float _1034 = fma(_1000, _1030, _920);
        float _1036 = fma(_1010, _1030, _856);
        _982 = _1034;
        _984 = _1032;
        _986 = _1036;
    }
    float _1038 = _982;
    float _1040 = _984;
    float _1042 = _986;
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1044);
    float _1054 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1046);
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1048);
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1052);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1066 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1058);
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_53.w = _886;
    float _1074 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1074);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1080);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1082);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1084);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1086);
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1106 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1090);
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1120 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1094);
    float _1122 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    out.m_33.x = 1.0;
    out.m_55.w = _1106;
    out.m_57.x = _1110;
    out.m_57.y = _1112;
    out.m_57.z = _1114;
    out.m_57.w = _1108;
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

