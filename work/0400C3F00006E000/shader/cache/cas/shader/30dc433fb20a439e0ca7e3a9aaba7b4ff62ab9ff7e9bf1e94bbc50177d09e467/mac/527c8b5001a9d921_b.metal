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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_53 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_45 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_49 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
    float4 m_47 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _310 = false;
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
        float _1150 = as_type<float>(_92);
        out.gl_Position.z = _1150;
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
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1220 = as_type<float>(_130);
        out.gl_Position.z = _1220;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = in.m_41.x;
    float _146 = in.m_41.y;
    float _148 = in.m_41.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = fma(_138, _138, _150);
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = sqrt(_162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    bool _174 = _168 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _162;
    float _184 = _164;
    float _186 = _166;
    if (_174)
    {
        float _188 = rsqrt(_162);
        _178 = _188;
    }
    float _190 = _178;
    float _192 = 0.0;
    if (!_174)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _172 > 0.0;
    float _198 = _172;
    float _200 = _194;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _202 = _180;
    float _204 = 0.0;
    float _206 = _202;
    if (!_174)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = _168;
    float _212 = _208;
    if (_176)
    {
        float _214 = rsqrt(_164);
        _210 = _214;
    }
    float _216 = _210;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _218 = _198;
    float _220 = _218;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _222 = _182;
    float _224 = 0.0;
    float _226 = _222;
    if (!_176)
    {
        _224 = 0.0;
    }
    float _228 = _224;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_166);
        _230 = _234;
    }
    float _236 = _230;
    if (_174)
    {
        float _238 = _190 * _138;
        _200 = _238;
    }
    float _240 = _200;
    if (_174)
    {
        float _242 = _190 * _132;
        _206 = _242;
    }
    float _244 = _206;
    if (_174)
    {
        float _246 = _190 * _144;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _252 = _184;
    float _254 = 0.0;
    float _256 = _252;
    if (!_196)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _258;
    if (_176)
    {
        float _262 = _216 * _140;
        _220 = _262;
    }
    float _264 = _220;
    if (!_196)
    {
        _186 = 0.0;
    }
    float _266 = _186;
    float _268 = _266;
    if (_176)
    {
        float _270 = _216 * _134;
        _226 = _270;
    }
    float _272 = _226;
    if (_176)
    {
        float _274 = _216 * _146;
        _232 = _274;
    }
    float _276 = _232;
    if (_196)
    {
        float _278 = _236 * _142;
        _256 = _278;
    }
    float _280 = _256;
    if (_196)
    {
        float _282 = _236 * _136;
        _268 = _282;
    }
    float _284 = _268;
    if (_196)
    {
        float _286 = _236 * _148;
        _260 = _286;
    }
    float _288 = _260;
    bool _290 = !_250;
    float _308;
    if (!_290)
    {
        float _292 = in.m_43.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_76);
        float _314 = 1.0 / _312;
        float _316 = _110 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_43.z;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _318 + _322;
    float _326 = in.m_43.x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = in.m_43.y;
    float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _348 = log2(_346);
    bool _350 = !_342;
    int _352 = _350 ? 0 : 1;
    int _354 = abs(_352);
    float _356 = 1.0 / _330;
    float _358 = float(_354);
    float _360 = _320 * 2.0;
    float _362 = _326 * 2.0;
    float _364 = _326 + _320;
    float _366 = floor(_360);
    float _368 = _344 * 2.0;
    float _370 = _364 + (-1.0);
    float _372 = _324 * _356;
    float _374 = floor(_362);
    float _376 = floor(_368);
    bool _378 = _366 > 0.0;
    bool _380 = _366 >= 0.0;
    bool _382 = isnan(_366);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = _344 + _320;
    float _392 = _320 + (-0.5);
    int _394 = _388 ? 0 : 1;
    float _396 = _390 + (-1.0);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _400 = !_334;
    int _402 = _400 ? 0 : 1;
    bool _404 = _374 > 0.0;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _408 = _374 >= 0.0;
    bool _410 = isnan(_374);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = ~_394;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_402);
    int _426 = _422;
    if (!_378)
    {
        int _428 = ~_394;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    bool _434 = _376 > 0.0;
    bool _436 = _376 >= 0.0;
    bool _438 = isnan(_376);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _348 * _110;
    float _448 = float(_424);
    float _450 = float(_432);
    float _452 = exp2(_446);
    int _454 = _416 ? 0 : 1;
    float _456 = _448 * _450;
    int _458 = _444 ? 0 : 1;
    float _460 = in.m_45.x;
    float _462 = in.m_45.y;
    float _464 = in.m_45.z;
    int _466 = ~_454;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * (-2.0);
    int _474 = _470;
    if (!_404)
    {
        int _476 = ~_454;
        int _478 = _476 + 1;
        _474 = _478;
    }
    int _480 = _474;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    int _486 = ~_458;
    int _488 = _486 + 1;
    int _490 = _488 + 1;
    float _492 = _326 + _344;
    int _494 = _490;
    if (!_434)
    {
        int _496 = ~_458;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    float _502 = 1.0 / _484;
    bool _504 = !_338;
    int _506 = _504 ? 0 : 1;
    float _508 = -_452;
    float _510 = _508 + 1.0;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _492 + (-1.0);
    int _524 = abs(_506);
    float _526 = _344 + (-0.5);
    bool _528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = float(_524);
    float _540 = float(_480);
    float _542 = _536 ? _510 : 0.0;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = float(_500);
    float _548 = _538 * _540;
    float _550 = _326 + (-0.5);
    if (_520)
    {
        float _552 = _542 * _502;
        _112 = _552;
    }
    float _554 = _112;
    bool _556 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _558 = isnan(_318);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _548 * (-2.0);
    float _570 = fma(_472, _460, _460);
    float _572 = _358 * _546;
    float _574 = fma(_544, _472, _544);
    float _576 = fma(_568, _462, _462);
    float _578 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _580 = _572 * (-2.0);
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _576);
    float _584 = fma(_574, _554, _578);
    float _586 = fma(_406, _568, _406);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _588;
    float _592 = fma(_580, _464, _464);
    float _594 = fma(_398, _580, _398);
    bool _596 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_318);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _584 * 0.15915493667125701904296875;
    float _610 = fma(_590, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[196].z, _592);
    float _614 = in.m_47.x;
    float _616 = in.m_47.y;
    float _618 = in.m_47.z;
    float _620 = -_606;
    float _622 = _620 + 1.0;
    float _624 = in.m_49.x;
    float _626 = in.m_49.y;
    float _628 = in.m_49.z;
    float _630 = fma(_586, _554, _582);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _632;
    float _636 = _566 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = fma(_634, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _646 = -_566;
    float _648 = _646 + 1.0;
    float _650 = fma(_640, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _652 = _610 * _636;
    float _654 = in.m_30.x;
    float _656 = in.m_30.y;
    float _658 = in.m_30.z;
    float _660 = fma(_594, _554, _612);
    float _662 = _644 * _636;
    float _664 = _650 * _636;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _668 = _660 * 0.15915493667125701904296875;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].z, _664);
    float _674 = _608 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].x, _666);
    float _680 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].y, _670);
    float _682 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].z, _672);
    float _684 = _678 * _614;
    float _686 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _624);
    float _690 = _608 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _680 * _616;
    float _696 = _682 * _618;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _626);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _706 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _642 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _702 * _698;
    float _714 = _704 * _700;
    float _716 = _140 * _656;
    float _718 = _706 * _688;
    float _720 = _686 * _326;
    float _722 = _146 * _656;
    float _724 = fma(_138, _654, _716);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _134 * _656;
    float _732 = fma(_144, _654, _722);
    float _734 = fma(_142, _658, _724);
    bool _736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _738 = isnan(0.5);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _744 = _740 || _742;
    float _746 = fma(_132, _654, _730);
    float _748 = fma(_148, _658, _732);
    float _750 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _668 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _692 * _710;
    float _758 = _676 * _710;
    float _760 = fma(_136, _658, _746);
    float _762 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _668 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _692 * _728;
    float _770 = _676 * _728;
    float _772 = _710 * _754;
    float _774 = _728 * _754;
    float _776 = _754 * _712;
    float _778 = trunc(_720);
    int _780 = int(_778);
    float _782 = _692 * _776;
    float _784 = _676 * _776;
    float _786 = fma(_766, _768, _758);
    float _788 = -_712;
    float _790 = _766 * _788;
    float _792 = -_756;
    float _794 = fma(_766, _770, _792);
    float _796 = -_770;
    float _798 = fma(_766, _756, _796);
    float _800 = fma(_786, _718, _782);
    float _802 = fma(_774, _718, _790);
    float _804 = fma(_766, _758, _768);
    float _806 = fma(_794, _718, _784);
    float _808 = fma(_798, _714, _800);
    float _810 = fma(_772, _714, _802);
    float _812 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_804, _714, _806);
    float _816 = _808 * _276;
    float _818 = _808 * _264;
    int _820 = _780 << 4;
    int _822 = _820 + 1712;
    float _824 = _808 * _272;
    float _826 = fma(_810, _248, _816);
    float _828 = fma(_810, _240, _818);
    int _830 = _822 + 8;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    float _841 = fma(_810, _244, _824);
    float _843 = fma(_814, _288, _826);
    float _845 = fma(_814, _280, _828);
    float _847 = fma(_814, _284, _841);
    float _849 = _812 + _843;
    float _851 = _750 + _845;
    uint _853 = uint(int(uint(_822) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[int(_863)][_865];
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _849 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _851 + _873;
    float _877 = _762 + _847;
    float _879 = _871 * _871;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    float _881 = fma(_875, _875, _879);
    float _883 = sqrt(_881);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = _841;
    float _889 = 0.5;
    float _891 = _879;
    if (!_885)
    {
        _887 = _851;
    }
    float _893 = _887;
    float _895 = _893;
    if (!_885)
    {
        _889 = _849;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_885)
    {
        _891 = _877;
    }
    float _901 = _891;
    bool _903 = !_885;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _883 + _909;
        float _913 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_881);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = cos(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _923 + (-1.0);
        float _931 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = fma(_927, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = fma(_877, _923, _931);
        float _937 = _915 * _933;
        float _939 = fma(_875, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _941 = fma(_871, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _905 = _935;
        _899 = _941;
        _895 = _939;
    }
    float _943 = _905;
    float _945 = _899;
    float _947 = _895;
    float _949 = _943;
    float _951 = _947;
    float _953 = _945;
    if (!_744)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _762 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _750 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _965 = -_762;
        float _967 = _965 + _943;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _812 + _971;
        float _975 = -_812;
        float _977 = _975 + _945;
        float _979 = fma(_961, _961, _969);
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _983 = fma(_973, _973, _979);
        float _985 = sqrt(_983);
        float _987 = _963 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _989 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _981;
        float _993 = -_750;
        float _995 = _993 + _947;
        float _997 = _987 * _991;
        float _999 = fma(_995, _997, _750);
        float _1001 = fma(_967, _997, _762);
        float _1003 = fma(_977, _997, _812);
        _949 = _1001;
        _951 = _999;
        _953 = _1003;
    }
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1033 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_33.x = 1.0;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1047);
    float _1057 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1049);
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1063 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1055);
    float _1067 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1061);
    float _1073 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1057);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1065);
    float _1077 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1081 = _1073 + _1075;
    float _1083 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * 0.5;
    out.m_53.w = _1083;
    out.m_55.x = _1087;
    out.m_55.y = _1089;
    out.m_55.z = _1091;
    out.m_55.w = _1085;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1071;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _1075;
    out.m_57.z = _1093;
    out.m_57.w = _1075;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _310 = false;
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
        float _1150 = as_type<float>(_92);
        out.gl_Position.z = _1150;
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
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1220 = as_type<float>(_130);
        out.gl_Position.z = _1220;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = in.m_41.x;
    float _146 = in.m_41.y;
    float _148 = in.m_41.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = fma(_138, _138, _150);
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = sqrt(_162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    bool _174 = _168 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _162;
    float _184 = _164;
    float _186 = _166;
    if (_174)
    {
        float _188 = rsqrt(_162);
        _178 = _188;
    }
    float _190 = _178;
    float _192 = 0.0;
    if (!_174)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _172 > 0.0;
    float _198 = _172;
    float _200 = _194;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _202 = _180;
    float _204 = 0.0;
    float _206 = _202;
    if (!_174)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = _168;
    float _212 = _208;
    if (_176)
    {
        float _214 = rsqrt(_164);
        _210 = _214;
    }
    float _216 = _210;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _218 = _198;
    float _220 = _218;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _222 = _182;
    float _224 = 0.0;
    float _226 = _222;
    if (!_176)
    {
        _224 = 0.0;
    }
    float _228 = _224;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_166);
        _230 = _234;
    }
    float _236 = _230;
    if (_174)
    {
        float _238 = _190 * _138;
        _200 = _238;
    }
    float _240 = _200;
    if (_174)
    {
        float _242 = _190 * _132;
        _206 = _242;
    }
    float _244 = _206;
    if (_174)
    {
        float _246 = _190 * _144;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _252 = _184;
    float _254 = 0.0;
    float _256 = _252;
    if (!_196)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _258;
    if (_176)
    {
        float _262 = _216 * _140;
        _220 = _262;
    }
    float _264 = _220;
    if (!_196)
    {
        _186 = 0.0;
    }
    float _266 = _186;
    float _268 = _266;
    if (_176)
    {
        float _270 = _216 * _134;
        _226 = _270;
    }
    float _272 = _226;
    if (_176)
    {
        float _274 = _216 * _146;
        _232 = _274;
    }
    float _276 = _232;
    if (_196)
    {
        float _278 = _236 * _142;
        _256 = _278;
    }
    float _280 = _256;
    if (_196)
    {
        float _282 = _236 * _136;
        _268 = _282;
    }
    float _284 = _268;
    if (_196)
    {
        float _286 = _236 * _148;
        _260 = _286;
    }
    float _288 = _260;
    bool _290 = !_250;
    float _308;
    if (!_290)
    {
        float _292 = in.m_43.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_76);
        float _314 = 1.0 / _312;
        float _316 = _110 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_43.z;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _318 + _322;
    float _326 = in.m_43.x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = in.m_43.y;
    float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _348 = log2(_346);
    bool _350 = !_342;
    int _352 = _350 ? 0 : 1;
    int _354 = abs(_352);
    float _356 = 1.0 / _330;
    float _358 = float(_354);
    float _360 = _320 * 2.0;
    float _362 = _326 * 2.0;
    float _364 = _326 + _320;
    float _366 = floor(_360);
    float _368 = _344 * 2.0;
    float _370 = _364 + (-1.0);
    float _372 = _324 * _356;
    float _374 = floor(_362);
    float _376 = floor(_368);
    bool _378 = _366 > 0.0;
    bool _380 = _366 >= 0.0;
    bool _382 = isnan(_366);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = _344 + _320;
    float _392 = _320 + (-0.5);
    int _394 = _388 ? 0 : 1;
    float _396 = _390 + (-1.0);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _400 = !_334;
    int _402 = _400 ? 0 : 1;
    bool _404 = _374 > 0.0;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _408 = _374 >= 0.0;
    bool _410 = isnan(_374);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = ~_394;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_402);
    int _426 = _422;
    if (!_378)
    {
        int _428 = ~_394;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    bool _434 = _376 > 0.0;
    bool _436 = _376 >= 0.0;
    bool _438 = isnan(_376);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _348 * _110;
    float _448 = float(_424);
    float _450 = float(_432);
    float _452 = exp2(_446);
    int _454 = _416 ? 0 : 1;
    float _456 = _448 * _450;
    int _458 = _444 ? 0 : 1;
    float _460 = in.m_45.x;
    float _462 = in.m_45.y;
    float _464 = in.m_45.z;
    int _466 = ~_454;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * (-2.0);
    int _474 = _470;
    if (!_404)
    {
        int _476 = ~_454;
        int _478 = _476 + 1;
        _474 = _478;
    }
    int _480 = _474;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    int _486 = ~_458;
    int _488 = _486 + 1;
    int _490 = _488 + 1;
    float _492 = _326 + _344;
    int _494 = _490;
    if (!_434)
    {
        int _496 = ~_458;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    float _502 = 1.0 / _484;
    bool _504 = !_338;
    int _506 = _504 ? 0 : 1;
    float _508 = -_452;
    float _510 = _508 + 1.0;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _492 + (-1.0);
    int _524 = abs(_506);
    float _526 = _344 + (-0.5);
    bool _528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = float(_524);
    float _540 = float(_480);
    float _542 = _536 ? _510 : 0.0;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = float(_500);
    float _548 = _538 * _540;
    float _550 = _326 + (-0.5);
    if (_520)
    {
        float _552 = _542 * _502;
        _112 = _552;
    }
    float _554 = _112;
    bool _556 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _558 = isnan(_318);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _548 * (-2.0);
    float _570 = fma(_472, _460, _460);
    float _572 = _358 * _546;
    float _574 = fma(_544, _472, _544);
    float _576 = fma(_568, _462, _462);
    float _578 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _580 = _572 * (-2.0);
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _576);
    float _584 = fma(_574, _554, _578);
    float _586 = fma(_406, _568, _406);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _588;
    float _592 = fma(_580, _464, _464);
    float _594 = fma(_398, _580, _398);
    bool _596 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_318);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _584 * 0.15915493667125701904296875;
    float _610 = fma(_590, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[196].z, _592);
    float _614 = in.m_47.x;
    float _616 = in.m_47.y;
    float _618 = in.m_47.z;
    float _620 = -_606;
    float _622 = _620 + 1.0;
    float _624 = in.m_49.x;
    float _626 = in.m_49.y;
    float _628 = in.m_49.z;
    float _630 = fma(_586, _554, _582);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _632;
    float _636 = _566 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = fma(_634, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _646 = -_566;
    float _648 = _646 + 1.0;
    float _650 = fma(_640, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _652 = _610 * _636;
    float _654 = in.m_30.x;
    float _656 = in.m_30.y;
    float _658 = in.m_30.z;
    float _660 = fma(_594, _554, _612);
    float _662 = _644 * _636;
    float _664 = _650 * _636;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _668 = _660 * 0.15915493667125701904296875;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].z, _664);
    float _674 = _608 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].x, _666);
    float _680 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].y, _670);
    float _682 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].z, _672);
    float _684 = _678 * _614;
    float _686 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _624);
    float _690 = _608 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _680 * _616;
    float _696 = _682 * _618;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _626);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _706 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _642 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _702 * _698;
    float _714 = _704 * _700;
    float _716 = _140 * _656;
    float _718 = _706 * _688;
    float _720 = _686 * _326;
    float _722 = _146 * _656;
    float _724 = fma(_138, _654, _716);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _134 * _656;
    float _732 = fma(_144, _654, _722);
    float _734 = fma(_142, _658, _724);
    bool _736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _738 = isnan(0.5);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _744 = _740 || _742;
    float _746 = fma(_132, _654, _730);
    float _748 = fma(_148, _658, _732);
    float _750 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _668 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _692 * _710;
    float _758 = _676 * _710;
    float _760 = fma(_136, _658, _746);
    float _762 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _668 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _692 * _728;
    float _770 = _676 * _728;
    float _772 = _710 * _754;
    float _774 = _728 * _754;
    float _776 = _754 * _712;
    float _778 = trunc(_720);
    int _780 = int(_778);
    float _782 = _692 * _776;
    float _784 = _676 * _776;
    float _786 = fma(_766, _768, _758);
    float _788 = -_712;
    float _790 = _766 * _788;
    float _792 = -_756;
    float _794 = fma(_766, _770, _792);
    float _796 = -_770;
    float _798 = fma(_766, _756, _796);
    float _800 = fma(_786, _718, _782);
    float _802 = fma(_774, _718, _790);
    float _804 = fma(_766, _758, _768);
    float _806 = fma(_794, _718, _784);
    float _808 = fma(_798, _714, _800);
    float _810 = fma(_772, _714, _802);
    float _812 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_804, _714, _806);
    float _816 = _808 * _276;
    float _818 = _808 * _264;
    int _820 = _780 << 4;
    int _822 = _820 + 1712;
    float _824 = _808 * _272;
    float _826 = fma(_810, _248, _816);
    float _828 = fma(_810, _240, _818);
    int _830 = _822 + 8;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    float _841 = fma(_810, _244, _824);
    float _843 = fma(_814, _288, _826);
    float _845 = fma(_814, _280, _828);
    float _847 = fma(_814, _284, _841);
    float _849 = _812 + _843;
    float _851 = _750 + _845;
    uint _853 = uint(int(uint(_822) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[int(_863)][_865];
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _849 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _851 + _873;
    float _877 = _762 + _847;
    float _879 = _871 * _871;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    float _881 = fma(_875, _875, _879);
    float _883 = sqrt(_881);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = _841;
    float _889 = 0.5;
    float _891 = _879;
    if (!_885)
    {
        _887 = _851;
    }
    float _893 = _887;
    float _895 = _893;
    if (!_885)
    {
        _889 = _849;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_885)
    {
        _891 = _877;
    }
    float _901 = _891;
    bool _903 = !_885;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _883 + _909;
        float _913 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_881);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = cos(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _923 + (-1.0);
        float _931 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = fma(_927, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = fma(_877, _923, _931);
        float _937 = _915 * _933;
        float _939 = fma(_875, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _941 = fma(_871, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _905 = _935;
        _899 = _941;
        _895 = _939;
    }
    float _943 = _905;
    float _945 = _899;
    float _947 = _895;
    float _949 = _943;
    float _951 = _947;
    float _953 = _945;
    if (!_744)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _762 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _750 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _965 = -_762;
        float _967 = _965 + _943;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _812 + _971;
        float _975 = -_812;
        float _977 = _975 + _945;
        float _979 = fma(_961, _961, _969);
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _983 = fma(_973, _973, _979);
        float _985 = sqrt(_983);
        float _987 = _963 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _989 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _981;
        float _993 = -_750;
        float _995 = _993 + _947;
        float _997 = _987 * _991;
        float _999 = fma(_995, _997, _750);
        float _1001 = fma(_967, _997, _762);
        float _1003 = fma(_977, _997, _812);
        _949 = _1001;
        _951 = _999;
        _953 = _1003;
    }
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1033 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_33.x = 1.0;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1047);
    float _1057 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1049);
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1063 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1055);
    float _1067 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1061);
    float _1073 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1057);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1065);
    float _1077 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1081 = _1073 + _1075;
    float _1083 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * 0.5;
    out.m_53.w = _1083;
    out.m_55.x = _1087;
    out.m_55.y = _1089;
    out.m_55.z = _1091;
    out.m_55.w = _1085;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1071;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _1075;
    out.m_57.z = _1093;
    out.m_57.w = _1075;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _310 = false;
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
        float _1150 = as_type<float>(_92);
        out.gl_Position.z = _1150;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1220 = as_type<float>(_130);
        out.gl_Position.z = _1220;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = in.m_41.x;
    float _146 = in.m_41.y;
    float _148 = in.m_41.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = fma(_138, _138, _150);
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = sqrt(_162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    bool _174 = _168 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _162;
    float _184 = _164;
    float _186 = _166;
    if (_174)
    {
        float _188 = rsqrt(_162);
        _178 = _188;
    }
    float _190 = _178;
    float _192 = 0.0;
    if (!_174)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _172 > 0.0;
    float _198 = _172;
    float _200 = _194;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _202 = _180;
    float _204 = 0.0;
    float _206 = _202;
    if (!_174)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = _168;
    float _212 = _208;
    if (_176)
    {
        float _214 = rsqrt(_164);
        _210 = _214;
    }
    float _216 = _210;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _218 = _198;
    float _220 = _218;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _222 = _182;
    float _224 = 0.0;
    float _226 = _222;
    if (!_176)
    {
        _224 = 0.0;
    }
    float _228 = _224;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_166);
        _230 = _234;
    }
    float _236 = _230;
    if (_174)
    {
        float _238 = _190 * _138;
        _200 = _238;
    }
    float _240 = _200;
    if (_174)
    {
        float _242 = _190 * _132;
        _206 = _242;
    }
    float _244 = _206;
    if (_174)
    {
        float _246 = _190 * _144;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _252 = _184;
    float _254 = 0.0;
    float _256 = _252;
    if (!_196)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = _258;
    if (_176)
    {
        float _262 = _216 * _140;
        _220 = _262;
    }
    float _264 = _220;
    if (!_196)
    {
        _186 = 0.0;
    }
    float _266 = _186;
    float _268 = _266;
    if (_176)
    {
        float _270 = _216 * _134;
        _226 = _270;
    }
    float _272 = _226;
    if (_176)
    {
        float _274 = _216 * _146;
        _232 = _274;
    }
    float _276 = _232;
    if (_196)
    {
        float _278 = _236 * _142;
        _256 = _278;
    }
    float _280 = _256;
    if (_196)
    {
        float _282 = _236 * _136;
        _268 = _282;
    }
    float _284 = _268;
    if (_196)
    {
        float _286 = _236 * _148;
        _260 = _286;
    }
    float _288 = _260;
    bool _290 = !_250;
    float _308;
    if (!_290)
    {
        float _292 = in.m_43.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_76);
        float _314 = 1.0 / _312;
        float _316 = _110 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_43.z;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _318 + _322;
    float _326 = in.m_43.x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = in.m_43.y;
    float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _348 = log2(_346);
    bool _350 = !_342;
    int _352 = _350 ? 0 : 1;
    int _354 = abs(_352);
    float _356 = 1.0 / _330;
    float _358 = float(_354);
    float _360 = _320 * 2.0;
    float _362 = _326 * 2.0;
    float _364 = _326 + _320;
    float _366 = floor(_360);
    float _368 = _344 * 2.0;
    float _370 = _364 + (-1.0);
    float _372 = _324 * _356;
    float _374 = floor(_362);
    float _376 = floor(_368);
    bool _378 = _366 > 0.0;
    bool _380 = _366 >= 0.0;
    bool _382 = isnan(_366);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = _344 + _320;
    float _392 = _320 + (-0.5);
    int _394 = _388 ? 0 : 1;
    float _396 = _390 + (-1.0);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _400 = !_334;
    int _402 = _400 ? 0 : 1;
    bool _404 = _374 > 0.0;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _408 = _374 >= 0.0;
    bool _410 = isnan(_374);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    int _418 = ~_394;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_402);
    int _426 = _422;
    if (!_378)
    {
        int _428 = ~_394;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    bool _434 = _376 > 0.0;
    bool _436 = _376 >= 0.0;
    bool _438 = isnan(_376);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _348 * _110;
    float _448 = float(_424);
    float _450 = float(_432);
    float _452 = exp2(_446);
    int _454 = _416 ? 0 : 1;
    float _456 = _448 * _450;
    int _458 = _444 ? 0 : 1;
    float _460 = in.m_45.x;
    float _462 = in.m_45.y;
    float _464 = in.m_45.z;
    int _466 = ~_454;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * (-2.0);
    int _474 = _470;
    if (!_404)
    {
        int _476 = ~_454;
        int _478 = _476 + 1;
        _474 = _478;
    }
    int _480 = _474;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    int _486 = ~_458;
    int _488 = _486 + 1;
    int _490 = _488 + 1;
    float _492 = _326 + _344;
    int _494 = _490;
    if (!_434)
    {
        int _496 = ~_458;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    float _502 = 1.0 / _484;
    bool _504 = !_338;
    int _506 = _504 ? 0 : 1;
    float _508 = -_452;
    float _510 = _508 + 1.0;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _492 + (-1.0);
    int _524 = abs(_506);
    float _526 = _344 + (-0.5);
    bool _528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = float(_524);
    float _540 = float(_480);
    float _542 = _536 ? _510 : 0.0;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = float(_500);
    float _548 = _538 * _540;
    float _550 = _326 + (-0.5);
    if (_520)
    {
        float _552 = _542 * _502;
        _112 = _552;
    }
    float _554 = _112;
    bool _556 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _558 = isnan(_318);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _548 * (-2.0);
    float _570 = fma(_472, _460, _460);
    float _572 = _358 * _546;
    float _574 = fma(_544, _472, _544);
    float _576 = fma(_568, _462, _462);
    float _578 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].x, _570);
    float _580 = _572 * (-2.0);
    float _582 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _576);
    float _584 = fma(_574, _554, _578);
    float _586 = fma(_406, _568, _406);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _588;
    float _592 = fma(_580, _464, _464);
    float _594 = fma(_398, _580, _398);
    bool _596 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_318);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _584 * 0.15915493667125701904296875;
    float _610 = fma(_590, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[196].z, _592);
    float _614 = in.m_47.x;
    float _616 = in.m_47.y;
    float _618 = in.m_47.z;
    float _620 = -_606;
    float _622 = _620 + 1.0;
    float _624 = in.m_49.x;
    float _626 = in.m_49.y;
    float _628 = in.m_49.z;
    float _630 = fma(_586, _554, _582);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _632;
    float _636 = _566 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = fma(_634, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _646 = -_566;
    float _648 = _646 + 1.0;
    float _650 = fma(_640, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _652 = _610 * _636;
    float _654 = in.m_30.x;
    float _656 = in.m_30.y;
    float _658 = in.m_30.z;
    float _660 = fma(_594, _554, _612);
    float _662 = _644 * _636;
    float _664 = _650 * _636;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _668 = _660 * 0.15915493667125701904296875;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[143].z, _664);
    float _674 = _608 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].x, _666);
    float _680 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].y, _670);
    float _682 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[144].z, _672);
    float _684 = _678 * _614;
    float _686 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _624);
    float _690 = _608 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _680 * _616;
    float _696 = _682 * _618;
    float _698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _626);
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _706 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _642 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _702 * _698;
    float _714 = _704 * _700;
    float _716 = _140 * _656;
    float _718 = _706 * _688;
    float _720 = _686 * _326;
    float _722 = _146 * _656;
    float _724 = fma(_138, _654, _716);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _134 * _656;
    float _732 = fma(_144, _654, _722);
    float _734 = fma(_142, _658, _724);
    bool _736 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _738 = isnan(0.5);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _744 = _740 || _742;
    float _746 = fma(_132, _654, _730);
    float _748 = fma(_148, _658, _732);
    float _750 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _668 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _692 * _710;
    float _758 = _676 * _710;
    float _760 = fma(_136, _658, _746);
    float _762 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _668 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _692 * _728;
    float _770 = _676 * _728;
    float _772 = _710 * _754;
    float _774 = _728 * _754;
    float _776 = _754 * _712;
    float _778 = trunc(_720);
    int _780 = int(_778);
    float _782 = _692 * _776;
    float _784 = _676 * _776;
    float _786 = fma(_766, _768, _758);
    float _788 = -_712;
    float _790 = _766 * _788;
    float _792 = -_756;
    float _794 = fma(_766, _770, _792);
    float _796 = -_770;
    float _798 = fma(_766, _756, _796);
    float _800 = fma(_786, _718, _782);
    float _802 = fma(_774, _718, _790);
    float _804 = fma(_766, _758, _768);
    float _806 = fma(_794, _718, _784);
    float _808 = fma(_798, _714, _800);
    float _810 = fma(_772, _714, _802);
    float _812 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_804, _714, _806);
    float _816 = _808 * _276;
    float _818 = _808 * _264;
    int _820 = _780 << 4;
    int _822 = _820 + 1712;
    float _824 = _808 * _272;
    float _826 = fma(_810, _248, _816);
    float _828 = fma(_810, _240, _818);
    int _830 = _822 + 8;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    float _841 = fma(_810, _244, _824);
    float _843 = fma(_814, _288, _826);
    float _845 = fma(_814, _280, _828);
    float _847 = fma(_814, _284, _841);
    float _849 = _812 + _843;
    float _851 = _750 + _845;
    uint _853 = uint(int(uint(_822) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[int(_863)][_865];
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _849 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _851 + _873;
    float _877 = _762 + _847;
    float _879 = _871 * _871;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    float _881 = fma(_875, _875, _879);
    float _883 = sqrt(_881);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = _841;
    float _889 = 0.5;
    float _891 = _879;
    if (!_885)
    {
        _887 = _851;
    }
    float _893 = _887;
    float _895 = _893;
    if (!_885)
    {
        _889 = _849;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_885)
    {
        _891 = _877;
    }
    float _901 = _891;
    bool _903 = !_885;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _883 + _909;
        float _913 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_881);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = cos(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _923 + (-1.0);
        float _931 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = fma(_927, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _935 = fma(_877, _923, _931);
        float _937 = _915 * _933;
        float _939 = fma(_875, _937, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _941 = fma(_871, _937, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _905 = _935;
        _899 = _941;
        _895 = _939;
    }
    float _943 = _905;
    float _945 = _899;
    float _947 = _895;
    float _949 = _943;
    float _951 = _947;
    float _953 = _945;
    if (!_744)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _762 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _750 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _965 = -_762;
        float _967 = _965 + _943;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _812 + _971;
        float _975 = -_812;
        float _977 = _975 + _945;
        float _979 = fma(_961, _961, _969);
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _983 = fma(_973, _973, _979);
        float _985 = sqrt(_983);
        float _987 = _963 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _989 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _981;
        float _993 = -_750;
        float _995 = _993 + _947;
        float _997 = _987 * _991;
        float _999 = fma(_995, _997, _750);
        float _1001 = fma(_967, _997, _762);
        float _1003 = fma(_977, _997, _812);
        _949 = _1001;
        _951 = _999;
        _953 = _1003;
    }
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1027 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1031 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1033 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_33.x = 1.0;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1049 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1041);
    float _1051 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1047);
    float _1057 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1049);
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1061 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1063 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1055);
    float _1067 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1059);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1061);
    float _1073 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1057);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1065);
    float _1077 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _839 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1081 = _1073 + _1075;
    float _1083 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * 0.5;
    out.m_53.w = _1083;
    out.m_55.x = _1087;
    out.m_55.y = _1089;
    out.m_55.z = _1091;
    out.m_55.w = _1085;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1071;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _1075;
    out.m_57.z = _1093;
    out.m_57.w = _1075;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

