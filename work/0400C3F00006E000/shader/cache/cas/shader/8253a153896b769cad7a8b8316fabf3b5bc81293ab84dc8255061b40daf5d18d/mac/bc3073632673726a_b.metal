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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_35 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_43 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_47 [[attribute(8)]];
    float4 m_45 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1102 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1273 = as_type<float>(_92);
        out.gl_Position.z = _1273;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1343 = as_type<float>(_130);
        out.gl_Position.z = _1343;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    float _144 = in.m_43.x;
    float _146 = in.m_43.y;
    float _148 = in.m_43.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = fma(_138, _138, _150);
    float _156 = fma(_140, _140, _152);
    float _158 = fma(_144, _144, _154);
    float _160 = _136 * _136;
    float _162 = fma(_146, _146, _156);
    float _164 = sqrt(_158);
    float _166 = fma(_142, _142, _160);
    float _168 = fma(_148, _148, _166);
    float _170 = sqrt(_162);
    float _172 = sqrt(_168);
    bool _174 = _164 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _158;
    if (!_174)
    {
        _178 = 0.0;
    }
    float _184 = _178;
    bool _186 = _172 > 0.0;
    float _188 = _172;
    float _190 = _184;
    if (_174)
    {
        float _192 = rsqrt(_158);
        _188 = _192;
    }
    float _194 = _188;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _196 = _180;
    float _198 = 0.0;
    float _200 = _196;
    if (!_174)
    {
        _198 = 0.0;
    }
    float _202 = _198;
    float _204 = 0.0;
    float _206 = _202;
    if (!_176)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = 0.0;
    float _212 = _208;
    if (!_176)
    {
        _210 = 0.0;
    }
    float _214 = _210;
    float _216 = _164;
    float _218 = _214;
    if (_176)
    {
        float _220 = rsqrt(_162);
        _216 = _220;
    }
    float _222 = _216;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_186)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (!_186)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (_186)
    {
        float _242 = rsqrt(_168);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _194;
    if (_174)
    {
        float _248 = _194 * _138;
        _190 = _248;
    }
    float _250 = _190;
    if (_174)
    {
        float _252 = _194 * _132;
        _200 = _252;
    }
    float _254 = _200;
    if (_174)
    {
        float _256 = _194 * _144;
        _206 = _256;
    }
    float _258 = _206;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_186)
    {
        _246 = 0.0;
    }
    float _262 = _246;
    float _264 = _262;
    if (_176)
    {
        float _266 = _222 * _140;
        _212 = _266;
    }
    float _268 = _212;
    if (_176)
    {
        float _270 = _222 * _134;
        _218 = _270;
    }
    float _272 = _218;
    if (_176)
    {
        float _274 = _222 * _146;
        _228 = _274;
    }
    float _276 = _228;
    if (_186)
    {
        float _278 = _244 * _142;
        _234 = _278;
    }
    float _280 = _234;
    if (_186)
    {
        float _282 = _244 * _136;
        _264 = _282;
    }
    float _284 = _264;
    if (_186)
    {
        float _286 = _244 * _148;
        _240 = _286;
    }
    float _288 = _240;
    bool _290 = !_260;
    float _308;
    if (!_290)
    {
        float _292 = in.m_45.x;
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
    float _320 = in.m_45.x;
    float _322 = in.m_45.y;
    float _324 = in.m_45.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _318 + _326;
    float _330 = in.m_47.x;
    float _332 = in.m_47.y;
    float _334 = in.m_47.z;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = 1.0 / _338;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _356 = _354 != 0;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _360 = _358 != 0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _318 + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = _318 + _368;
    float _372 = _324 * 2.0;
    float _374 = _320 * 2.0;
    float _376 = _320 + (-0.5);
    float _378 = _364 * _348;
    float _380 = floor(_372);
    float _382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _330);
    float _384 = _322 + _320;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _332);
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _334);
    float _390 = _322 * 2.0;
    float _392 = _322 + _324;
    float _394 = _324 + (-0.5);
    float _396 = floor(_374);
    float _398 = _324 + _320;
    float _400 = _384 + (-1.0);
    float _402 = _398 + (-1.0);
    float _404 = _392 + (-1.0);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    bool _412 = _380 > 0.0;
    float _414 = _370 * _366;
    bool _416 = _380 >= 0.0;
    bool _418 = isnan(_380);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _428 = !_352;
    int _430 = _428 ? 0 : 1;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = 1.0 / _346;
    bool _440 = _396 > 0.0;
    float _442 = fma(_434, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    bool _450 = _396 >= 0.0;
    bool _452 = isnan(_396);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = _448;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = floor(_390);
    float _470 = _322 + (-0.5);
    float _472 = _410 * _110;
    int _474 = abs(_430);
    float _476 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = float(_474);
    float _484 = _328 * _438;
    int _486 = _458 ? 0 : 1;
    float _488 = fma(_480, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = float(_466);
    float _492 = exp2(_472);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    bool _500 = _468 > 0.0;
    float _502 = _482 * _490;
    bool _504 = _468 >= 0.0;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = in.m_49.x;
    float _516 = in.m_49.y;
    float _518 = in.m_49.z;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    int _524 = _498;
    if (!_440)
    {
        int _526 = ~_486;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _502 * (-2.0);
    bool _534 = !_356;
    int _536 = _534 ? 0 : 1;
    float _538 = fma(_522, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _544 = abs(_536);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = float(_530);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_492;
    float _558 = _556 + 1.0;
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = 1.0 / _554;
    float _572 = float(_544);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = fma(_542, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_548, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _572 * _550;
    float _594 = _586 ? _558 : 0.0;
    float _596 = fma(_532, _514, _514);
    float _598 = fma(_576, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _600 = _592 * (-2.0);
    int _602 = _512 ? 0 : 1;
    float _604 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _596);
    bool _606 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _608 = isnan(_318);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_600, _516, _516);
    int _620 = ~_602;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    if (_568)
    {
        float _628 = _594 * _570;
        _112 = _628;
    }
    float _630 = _112;
    float _632 = fma(_406, _532, _406);
    float _634 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _636 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_318);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_616;
    float _650 = _648 + 1.0;
    float _652 = fma(_632, _630, _604);
    bool _654 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_318);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_476, _600, _476);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    bool _674 = !_360;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_666, _630, _634);
    bool _680 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_318);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _652 * 0.15915493667125701904296875;
    int _694 = abs(_676);
    if (!_500)
    {
        int _696 = ~_602;
        int _698 = _696 + 1;
        _626 = _698;
    }
    int _700 = _626;
    float _702 = _690 * _672;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _692 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _664 * _706;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _718;
    float _722 = float(_700);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    float _728 = float(_694);
    float _730 = fma(_716, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = fma(_720, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _734 = fma(_726, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _736 = _488 * _712;
    float _738 = _728 * _722;
    float _740 = _442 * _712;
    float _742 = in.m_32.x;
    float _744 = in.m_32.y;
    float _746 = in.m_32.z;
    float _748 = _538 * _712;
    float _750 = _738 * (-2.0);
    float _752 = _678 * 0.15915493667125701904296875;
    float _754 = in.m_51.x;
    float _756 = in.m_51.y;
    float _758 = in.m_51.z;
    float _760 = -_664;
    float _762 = _760 + 1.0;
    float _764 = fma(_426, _750, _426);
    float _766 = fma(_750, _518, _518);
    float _768 = _692 * 6.283185482025146484375;
    float _770 = cos(_768);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _748);
    float _776 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    float _780 = fma(_588, _702, _772);
    float _782 = fma(_598, _702, _774);
    float _784 = fma(_764, _630, _776);
    float _786 = fma(_590, _702, _778);
    float _788 = fma(_730, _668, _780);
    float _790 = fma(_734, _668, _782);
    float _792 = _784 * 0.15915493667125701904296875;
    float _794 = fma(_732, _668, _786);
    float _796 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].x, _788);
    float _798 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].z, _790);
    float _800 = _752 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _140 * _744;
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].y, _794);
    float _808 = _146 * _744;
    float _810 = _134 * _744;
    float _812 = fma(_138, _742, _804);
    float _814 = _806 * _756;
    float _816 = _798 * _758;
    float _818 = _752 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _796 * _754;
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = fma(_144, _742, _808);
    float _828 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _832 = _824 * _386;
    float _834 = fma(_142, _746, _812);
    float _836 = _792 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _828 * _388;
    float _842 = _830 * _382;
    float _844 = _710 * _802;
    float _846 = in.m_41.w;
    float _848 = _770 * _802;
    float _850 = fma(_148, _746, _826);
    float _852 = fma(_132, _742, _810);
    float _854 = _792 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _770 * _820;
    float _860 = in.m_43.w;
    float _862 = _710 * _820;
    float _864 = fma(_136, _746, _852);
    float _866 = in.m_39.w;
    float _868 = _838 * _832;
    float _870 = _802 * _838;
    float _872 = _820 * _838;
    float _874 = _770 * _868;
    float _876 = _710 * _868;
    float _878 = fma(_856, _858, _844);
    float _880 = _856 * _832;
    float _882 = fma(_856, _844, _858);
    float _884 = fma(_878, _842, _874);
    float _886 = -_862;
    float _888 = fma(_856, _848, _886);
    float _890 = -_848;
    float _892 = fma(_856, _862, _890);
    float _894 = -_880;
    float _896 = fma(_872, _842, _894);
    float _898 = _834 + _846;
    float _900 = fma(_888, _840, _884);
    float _902 = fma(_892, _842, _876);
    float _904 = fma(_870, _840, _896);
    float _906 = _850 + _860;
    float _908 = _900 * _268;
    float _910 = _900 * _276;
    float _912 = fma(_882, _840, _902);
    float _914 = _900 * _272;
    float _916 = fma(_904, _250, _908);
    float _918 = fma(_904, _258, _910);
    float _920 = _864 + _866;
    float _922 = fma(_904, _254, _914);
    float _924 = fma(_912, _280, _916);
    float _926 = fma(_912, _288, _918);
    float _928 = fma(_912, _284, _922);
    float _930 = _898 + _924;
    float _932 = _906 + _926;
    float _934 = _920 + _928;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _930 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _932 + _940;
    float _944 = _938 * _938;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = _928;
    float _956 = _866;
    float _958 = _946;
    float _960 = _930;
    float _962 = _932;
    if (!_952)
    {
        _954 = _944;
    }
    float _964 = _954;
    float _966 = _964;
    if (!_952)
    {
        _956 = _934;
    }
    float _968 = _956;
    bool _970 = !_952;
    float _972 = _968;
    if (!_970)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _978 = _950 + _976;
        float _980 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = rsqrt(_948);
        float _984 = _978 * _974;
        float _986 = _984 * 0.15915493667125701904296875;
        float _988 = _986 * 6.283185482025146484375;
        float _990 = sin(_988);
        float _992 = _986 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = fma(_990, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _998 = _982 * _996;
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_938, _998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1004 = fma(_942, _998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1006 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1010 = _1002 + _1008;
        float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1014 = _1004 + _1012;
        float _1016 = fma(_934, _994, _1006);
        float _1018 = _1010 * _1010;
        float _1020 = _1014 * _1014;
        _972 = _1016;
        _966 = _1018;
        _958 = _1020;
        _960 = _1002;
        _962 = _1004;
    }
    float _1022 = _972;
    float _1024 = _966;
    float _1026 = _958;
    float _1028 = _960;
    float _1030 = _962;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1022 + _1032;
    float _1036 = fma(_1034, _1034, _1024);
    float _1038 = _1036 + _1026;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = sqrt(_1038);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1050;
    out.m_55.y = _1052;
    out.m_55.z = _1054;
    out.m_55.w = _1044;
    bool _1056 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1058 = isnan(_1046);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1064 = _1060 || _1062;
    float _1066 = _1040;
    if (!_1064)
    {
        _1066 = 1.0;
    }
    float _1068 = _1066;
    bool _1070 = !_1064;
    float _1072 = _1068;
    if (!_1070)
    {
        bool _1074 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1076 = isnan(_1046);
        bool _1078 = _1074 || _1076;
        bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1082 = _1078 || _1080;
        if (!_1082)
        {
            float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1086 = _1046 + _1084;
            float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1090 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1096 = 1.0 / _1090;
            float _1098 = _1086 * _1096;
            float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1072 = _1100;
            _1102 = true;
        }
        else
        {
            bool _1104 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1106 = isnan(_1046);
            bool _1108 = _1104 || _1106;
            bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1112 = _1108 || _1110;
            if (!_1112)
            {
                float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1116 = _1046 + _1114;
                float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1120 = _1118 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1126 = 1.0 / _1120;
                float _1128 = _1116 * _1126;
                float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1072 = _1130;
                _1102 = true;
            }
            else
            {
                _1072 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1102 = false;
    float _1132 = _1072;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1022 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1140 = _1028 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1144 = _1030 + _1142;
    float _1146 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1148 = fma(_1140, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1150 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1152 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1162 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1154);
    float _1164 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1162);
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1200);
    float _1212 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    out.m_57.w = _1208;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1212;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1216;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1102 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1273 = as_type<float>(_92);
        out.gl_Position.z = _1273;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1343 = as_type<float>(_130);
        out.gl_Position.z = _1343;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    float _144 = in.m_43.x;
    float _146 = in.m_43.y;
    float _148 = in.m_43.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = fma(_138, _138, _150);
    float _156 = fma(_140, _140, _152);
    float _158 = fma(_144, _144, _154);
    float _160 = _136 * _136;
    float _162 = fma(_146, _146, _156);
    float _164 = sqrt(_158);
    float _166 = fma(_142, _142, _160);
    float _168 = fma(_148, _148, _166);
    float _170 = sqrt(_162);
    float _172 = sqrt(_168);
    bool _174 = _164 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _158;
    if (!_174)
    {
        _178 = 0.0;
    }
    float _184 = _178;
    bool _186 = _172 > 0.0;
    float _188 = _172;
    float _190 = _184;
    if (_174)
    {
        float _192 = rsqrt(_158);
        _188 = _192;
    }
    float _194 = _188;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _196 = _180;
    float _198 = 0.0;
    float _200 = _196;
    if (!_174)
    {
        _198 = 0.0;
    }
    float _202 = _198;
    float _204 = 0.0;
    float _206 = _202;
    if (!_176)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = 0.0;
    float _212 = _208;
    if (!_176)
    {
        _210 = 0.0;
    }
    float _214 = _210;
    float _216 = _164;
    float _218 = _214;
    if (_176)
    {
        float _220 = rsqrt(_162);
        _216 = _220;
    }
    float _222 = _216;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_186)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (!_186)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (_186)
    {
        float _242 = rsqrt(_168);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _194;
    if (_174)
    {
        float _248 = _194 * _138;
        _190 = _248;
    }
    float _250 = _190;
    if (_174)
    {
        float _252 = _194 * _132;
        _200 = _252;
    }
    float _254 = _200;
    if (_174)
    {
        float _256 = _194 * _144;
        _206 = _256;
    }
    float _258 = _206;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_186)
    {
        _246 = 0.0;
    }
    float _262 = _246;
    float _264 = _262;
    if (_176)
    {
        float _266 = _222 * _140;
        _212 = _266;
    }
    float _268 = _212;
    if (_176)
    {
        float _270 = _222 * _134;
        _218 = _270;
    }
    float _272 = _218;
    if (_176)
    {
        float _274 = _222 * _146;
        _228 = _274;
    }
    float _276 = _228;
    if (_186)
    {
        float _278 = _244 * _142;
        _234 = _278;
    }
    float _280 = _234;
    if (_186)
    {
        float _282 = _244 * _136;
        _264 = _282;
    }
    float _284 = _264;
    if (_186)
    {
        float _286 = _244 * _148;
        _240 = _286;
    }
    float _288 = _240;
    bool _290 = !_260;
    float _308;
    if (!_290)
    {
        float _292 = in.m_45.x;
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
    float _320 = in.m_45.x;
    float _322 = in.m_45.y;
    float _324 = in.m_45.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _318 + _326;
    float _330 = in.m_47.x;
    float _332 = in.m_47.y;
    float _334 = in.m_47.z;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = 1.0 / _338;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _356 = _354 != 0;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _360 = _358 != 0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _318 + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = _318 + _368;
    float _372 = _324 * 2.0;
    float _374 = _320 * 2.0;
    float _376 = _320 + (-0.5);
    float _378 = _364 * _348;
    float _380 = floor(_372);
    float _382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _330);
    float _384 = _322 + _320;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _332);
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _334);
    float _390 = _322 * 2.0;
    float _392 = _322 + _324;
    float _394 = _324 + (-0.5);
    float _396 = floor(_374);
    float _398 = _324 + _320;
    float _400 = _384 + (-1.0);
    float _402 = _398 + (-1.0);
    float _404 = _392 + (-1.0);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    bool _412 = _380 > 0.0;
    float _414 = _370 * _366;
    bool _416 = _380 >= 0.0;
    bool _418 = isnan(_380);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _428 = !_352;
    int _430 = _428 ? 0 : 1;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = 1.0 / _346;
    bool _440 = _396 > 0.0;
    float _442 = fma(_434, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    bool _450 = _396 >= 0.0;
    bool _452 = isnan(_396);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = _448;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = floor(_390);
    float _470 = _322 + (-0.5);
    float _472 = _410 * _110;
    int _474 = abs(_430);
    float _476 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = float(_474);
    float _484 = _328 * _438;
    int _486 = _458 ? 0 : 1;
    float _488 = fma(_480, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = float(_466);
    float _492 = exp2(_472);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    bool _500 = _468 > 0.0;
    float _502 = _482 * _490;
    bool _504 = _468 >= 0.0;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = in.m_49.x;
    float _516 = in.m_49.y;
    float _518 = in.m_49.z;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    int _524 = _498;
    if (!_440)
    {
        int _526 = ~_486;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _502 * (-2.0);
    bool _534 = !_356;
    int _536 = _534 ? 0 : 1;
    float _538 = fma(_522, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _544 = abs(_536);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = float(_530);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_492;
    float _558 = _556 + 1.0;
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = 1.0 / _554;
    float _572 = float(_544);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = fma(_542, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_548, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _572 * _550;
    float _594 = _586 ? _558 : 0.0;
    float _596 = fma(_532, _514, _514);
    float _598 = fma(_576, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _600 = _592 * (-2.0);
    int _602 = _512 ? 0 : 1;
    float _604 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _596);
    bool _606 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _608 = isnan(_318);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_600, _516, _516);
    int _620 = ~_602;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    if (_568)
    {
        float _628 = _594 * _570;
        _112 = _628;
    }
    float _630 = _112;
    float _632 = fma(_406, _532, _406);
    float _634 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _636 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_318);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_616;
    float _650 = _648 + 1.0;
    float _652 = fma(_632, _630, _604);
    bool _654 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_318);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_476, _600, _476);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    bool _674 = !_360;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_666, _630, _634);
    bool _680 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_318);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _652 * 0.15915493667125701904296875;
    int _694 = abs(_676);
    if (!_500)
    {
        int _696 = ~_602;
        int _698 = _696 + 1;
        _626 = _698;
    }
    int _700 = _626;
    float _702 = _690 * _672;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _692 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _664 * _706;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _718;
    float _722 = float(_700);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    float _728 = float(_694);
    float _730 = fma(_716, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = fma(_720, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _734 = fma(_726, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _736 = _488 * _712;
    float _738 = _728 * _722;
    float _740 = _442 * _712;
    float _742 = in.m_32.x;
    float _744 = in.m_32.y;
    float _746 = in.m_32.z;
    float _748 = _538 * _712;
    float _750 = _738 * (-2.0);
    float _752 = _678 * 0.15915493667125701904296875;
    float _754 = in.m_51.x;
    float _756 = in.m_51.y;
    float _758 = in.m_51.z;
    float _760 = -_664;
    float _762 = _760 + 1.0;
    float _764 = fma(_426, _750, _426);
    float _766 = fma(_750, _518, _518);
    float _768 = _692 * 6.283185482025146484375;
    float _770 = cos(_768);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _748);
    float _776 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    float _780 = fma(_588, _702, _772);
    float _782 = fma(_598, _702, _774);
    float _784 = fma(_764, _630, _776);
    float _786 = fma(_590, _702, _778);
    float _788 = fma(_730, _668, _780);
    float _790 = fma(_734, _668, _782);
    float _792 = _784 * 0.15915493667125701904296875;
    float _794 = fma(_732, _668, _786);
    float _796 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].x, _788);
    float _798 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].z, _790);
    float _800 = _752 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _140 * _744;
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].y, _794);
    float _808 = _146 * _744;
    float _810 = _134 * _744;
    float _812 = fma(_138, _742, _804);
    float _814 = _806 * _756;
    float _816 = _798 * _758;
    float _818 = _752 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _796 * _754;
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = fma(_144, _742, _808);
    float _828 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _832 = _824 * _386;
    float _834 = fma(_142, _746, _812);
    float _836 = _792 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _828 * _388;
    float _842 = _830 * _382;
    float _844 = _710 * _802;
    float _846 = in.m_41.w;
    float _848 = _770 * _802;
    float _850 = fma(_148, _746, _826);
    float _852 = fma(_132, _742, _810);
    float _854 = _792 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _770 * _820;
    float _860 = in.m_43.w;
    float _862 = _710 * _820;
    float _864 = fma(_136, _746, _852);
    float _866 = in.m_39.w;
    float _868 = _838 * _832;
    float _870 = _802 * _838;
    float _872 = _820 * _838;
    float _874 = _770 * _868;
    float _876 = _710 * _868;
    float _878 = fma(_856, _858, _844);
    float _880 = _856 * _832;
    float _882 = fma(_856, _844, _858);
    float _884 = fma(_878, _842, _874);
    float _886 = -_862;
    float _888 = fma(_856, _848, _886);
    float _890 = -_848;
    float _892 = fma(_856, _862, _890);
    float _894 = -_880;
    float _896 = fma(_872, _842, _894);
    float _898 = _834 + _846;
    float _900 = fma(_888, _840, _884);
    float _902 = fma(_892, _842, _876);
    float _904 = fma(_870, _840, _896);
    float _906 = _850 + _860;
    float _908 = _900 * _268;
    float _910 = _900 * _276;
    float _912 = fma(_882, _840, _902);
    float _914 = _900 * _272;
    float _916 = fma(_904, _250, _908);
    float _918 = fma(_904, _258, _910);
    float _920 = _864 + _866;
    float _922 = fma(_904, _254, _914);
    float _924 = fma(_912, _280, _916);
    float _926 = fma(_912, _288, _918);
    float _928 = fma(_912, _284, _922);
    float _930 = _898 + _924;
    float _932 = _906 + _926;
    float _934 = _920 + _928;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _930 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _932 + _940;
    float _944 = _938 * _938;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = _928;
    float _956 = _866;
    float _958 = _946;
    float _960 = _930;
    float _962 = _932;
    if (!_952)
    {
        _954 = _944;
    }
    float _964 = _954;
    float _966 = _964;
    if (!_952)
    {
        _956 = _934;
    }
    float _968 = _956;
    bool _970 = !_952;
    float _972 = _968;
    if (!_970)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _978 = _950 + _976;
        float _980 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = rsqrt(_948);
        float _984 = _978 * _974;
        float _986 = _984 * 0.15915493667125701904296875;
        float _988 = _986 * 6.283185482025146484375;
        float _990 = sin(_988);
        float _992 = _986 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = fma(_990, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _998 = _982 * _996;
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_938, _998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1004 = fma(_942, _998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1006 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1010 = _1002 + _1008;
        float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1014 = _1004 + _1012;
        float _1016 = fma(_934, _994, _1006);
        float _1018 = _1010 * _1010;
        float _1020 = _1014 * _1014;
        _972 = _1016;
        _966 = _1018;
        _958 = _1020;
        _960 = _1002;
        _962 = _1004;
    }
    float _1022 = _972;
    float _1024 = _966;
    float _1026 = _958;
    float _1028 = _960;
    float _1030 = _962;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1022 + _1032;
    float _1036 = fma(_1034, _1034, _1024);
    float _1038 = _1036 + _1026;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = sqrt(_1038);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1050;
    out.m_55.y = _1052;
    out.m_55.z = _1054;
    out.m_55.w = _1044;
    bool _1056 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1058 = isnan(_1046);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1064 = _1060 || _1062;
    float _1066 = _1040;
    if (!_1064)
    {
        _1066 = 1.0;
    }
    float _1068 = _1066;
    bool _1070 = !_1064;
    float _1072 = _1068;
    if (!_1070)
    {
        bool _1074 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1076 = isnan(_1046);
        bool _1078 = _1074 || _1076;
        bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1082 = _1078 || _1080;
        if (!_1082)
        {
            float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1086 = _1046 + _1084;
            float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1090 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1096 = 1.0 / _1090;
            float _1098 = _1086 * _1096;
            float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1072 = _1100;
            _1102 = true;
        }
        else
        {
            bool _1104 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1106 = isnan(_1046);
            bool _1108 = _1104 || _1106;
            bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1112 = _1108 || _1110;
            if (!_1112)
            {
                float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1116 = _1046 + _1114;
                float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1120 = _1118 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1126 = 1.0 / _1120;
                float _1128 = _1116 * _1126;
                float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1072 = _1130;
                _1102 = true;
            }
            else
            {
                _1072 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1102 = false;
    float _1132 = _1072;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1022 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1140 = _1028 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1144 = _1030 + _1142;
    float _1146 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1148 = fma(_1140, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1150 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1152 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1162 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1154);
    float _1164 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1162);
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1200);
    float _1212 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    out.m_57.w = _1208;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1212;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1216;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1102 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1273 = as_type<float>(_92);
        out.gl_Position.z = _1273;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1343 = as_type<float>(_130);
        out.gl_Position.z = _1343;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    float _144 = in.m_43.x;
    float _146 = in.m_43.y;
    float _148 = in.m_43.z;
    float _150 = _132 * _132;
    float _152 = _134 * _134;
    float _154 = fma(_138, _138, _150);
    float _156 = fma(_140, _140, _152);
    float _158 = fma(_144, _144, _154);
    float _160 = _136 * _136;
    float _162 = fma(_146, _146, _156);
    float _164 = sqrt(_158);
    float _166 = fma(_142, _142, _160);
    float _168 = fma(_148, _148, _166);
    float _170 = sqrt(_162);
    float _172 = sqrt(_168);
    bool _174 = _164 > 0.0;
    bool _176 = _170 > 0.0;
    float _178 = 0.0;
    float _180 = _170;
    float _182 = _158;
    if (!_174)
    {
        _178 = 0.0;
    }
    float _184 = _178;
    bool _186 = _172 > 0.0;
    float _188 = _172;
    float _190 = _184;
    if (_174)
    {
        float _192 = rsqrt(_158);
        _188 = _192;
    }
    float _194 = _188;
    if (!_174)
    {
        _180 = 0.0;
    }
    float _196 = _180;
    float _198 = 0.0;
    float _200 = _196;
    if (!_174)
    {
        _198 = 0.0;
    }
    float _202 = _198;
    float _204 = 0.0;
    float _206 = _202;
    if (!_176)
    {
        _204 = 0.0;
    }
    float _208 = _204;
    float _210 = 0.0;
    float _212 = _208;
    if (!_176)
    {
        _210 = 0.0;
    }
    float _214 = _210;
    float _216 = _164;
    float _218 = _214;
    if (_176)
    {
        float _220 = rsqrt(_162);
        _216 = _220;
    }
    float _222 = _216;
    if (!_176)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_186)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (!_186)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (_186)
    {
        float _242 = rsqrt(_168);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _194;
    if (_174)
    {
        float _248 = _194 * _138;
        _190 = _248;
    }
    float _250 = _190;
    if (_174)
    {
        float _252 = _194 * _132;
        _200 = _252;
    }
    float _254 = _200;
    if (_174)
    {
        float _256 = _194 * _144;
        _206 = _256;
    }
    float _258 = _206;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_186)
    {
        _246 = 0.0;
    }
    float _262 = _246;
    float _264 = _262;
    if (_176)
    {
        float _266 = _222 * _140;
        _212 = _266;
    }
    float _268 = _212;
    if (_176)
    {
        float _270 = _222 * _134;
        _218 = _270;
    }
    float _272 = _218;
    if (_176)
    {
        float _274 = _222 * _146;
        _228 = _274;
    }
    float _276 = _228;
    if (_186)
    {
        float _278 = _244 * _142;
        _234 = _278;
    }
    float _280 = _234;
    if (_186)
    {
        float _282 = _244 * _136;
        _264 = _282;
    }
    float _284 = _264;
    if (_186)
    {
        float _286 = _244 * _148;
        _240 = _286;
    }
    float _288 = _240;
    bool _290 = !_260;
    float _308;
    if (!_290)
    {
        float _292 = in.m_45.x;
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
    float _320 = in.m_45.x;
    float _322 = in.m_45.y;
    float _324 = in.m_45.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _318 + _326;
    float _330 = in.m_47.x;
    float _332 = in.m_47.y;
    float _334 = in.m_47.z;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = 1.0 / _338;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _356 = _354 != 0;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _360 = _358 != 0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _318 + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = _318 + _368;
    float _372 = _324 * 2.0;
    float _374 = _320 * 2.0;
    float _376 = _320 + (-0.5);
    float _378 = _364 * _348;
    float _380 = floor(_372);
    float _382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _330);
    float _384 = _322 + _320;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _332);
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _334);
    float _390 = _322 * 2.0;
    float _392 = _322 + _324;
    float _394 = _324 + (-0.5);
    float _396 = floor(_374);
    float _398 = _324 + _320;
    float _400 = _384 + (-1.0);
    float _402 = _398 + (-1.0);
    float _404 = _392 + (-1.0);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    bool _412 = _380 > 0.0;
    float _414 = _370 * _366;
    bool _416 = _380 >= 0.0;
    bool _418 = isnan(_380);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _428 = !_352;
    int _430 = _428 ? 0 : 1;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = 1.0 / _346;
    bool _440 = _396 > 0.0;
    float _442 = fma(_434, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    bool _450 = _396 >= 0.0;
    bool _452 = isnan(_396);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    int _460 = _448;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = floor(_390);
    float _470 = _322 + (-0.5);
    float _472 = _410 * _110;
    int _474 = abs(_430);
    float _476 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = float(_474);
    float _484 = _328 * _438;
    int _486 = _458 ? 0 : 1;
    float _488 = fma(_480, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = float(_466);
    float _492 = exp2(_472);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    bool _500 = _468 > 0.0;
    float _502 = _482 * _490;
    bool _504 = _468 >= 0.0;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = in.m_49.x;
    float _516 = in.m_49.y;
    float _518 = in.m_49.z;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    int _524 = _498;
    if (!_440)
    {
        int _526 = ~_486;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _502 * (-2.0);
    bool _534 = !_356;
    int _536 = _534 ? 0 : 1;
    float _538 = fma(_522, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _544 = abs(_536);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = float(_530);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = -_492;
    float _558 = _556 + 1.0;
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = 1.0 / _554;
    float _572 = float(_544);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = fma(_542, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_548, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _572 * _550;
    float _594 = _586 ? _558 : 0.0;
    float _596 = fma(_532, _514, _514);
    float _598 = fma(_576, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _600 = _592 * (-2.0);
    int _602 = _512 ? 0 : 1;
    float _604 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _596);
    bool _606 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _608 = isnan(_318);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_600, _516, _516);
    int _620 = ~_602;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    if (_568)
    {
        float _628 = _594 * _570;
        _112 = _628;
    }
    float _630 = _112;
    float _632 = fma(_406, _532, _406);
    float _634 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _636 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_318);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_616;
    float _650 = _648 + 1.0;
    float _652 = fma(_632, _630, _604);
    bool _654 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _656 = isnan(_318);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_476, _600, _476);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    bool _674 = !_360;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_666, _630, _634);
    bool _680 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _682 = isnan(_318);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = _652 * 0.15915493667125701904296875;
    int _694 = abs(_676);
    if (!_500)
    {
        int _696 = ~_602;
        int _698 = _696 + 1;
        _626 = _698;
    }
    int _700 = _626;
    float _702 = _690 * _672;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _692 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _664 * _706;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _718;
    float _722 = float(_700);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    float _728 = float(_694);
    float _730 = fma(_716, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = fma(_720, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _734 = fma(_726, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _736 = _488 * _712;
    float _738 = _728 * _722;
    float _740 = _442 * _712;
    float _742 = in.m_32.x;
    float _744 = in.m_32.y;
    float _746 = in.m_32.z;
    float _748 = _538 * _712;
    float _750 = _738 * (-2.0);
    float _752 = _678 * 0.15915493667125701904296875;
    float _754 = in.m_51.x;
    float _756 = in.m_51.y;
    float _758 = in.m_51.z;
    float _760 = -_664;
    float _762 = _760 + 1.0;
    float _764 = fma(_426, _750, _426);
    float _766 = fma(_750, _518, _518);
    float _768 = _692 * 6.283185482025146484375;
    float _770 = cos(_768);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _748);
    float _776 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    float _780 = fma(_588, _702, _772);
    float _782 = fma(_598, _702, _774);
    float _784 = fma(_764, _630, _776);
    float _786 = fma(_590, _702, _778);
    float _788 = fma(_730, _668, _780);
    float _790 = fma(_734, _668, _782);
    float _792 = _784 * 0.15915493667125701904296875;
    float _794 = fma(_732, _668, _786);
    float _796 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].x, _788);
    float _798 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].z, _790);
    float _800 = _752 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _140 * _744;
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[146].y, _794);
    float _808 = _146 * _744;
    float _810 = _134 * _744;
    float _812 = fma(_138, _742, _804);
    float _814 = _806 * _756;
    float _816 = _798 * _758;
    float _818 = _752 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _796 * _754;
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = fma(_144, _742, _808);
    float _828 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _832 = _824 * _386;
    float _834 = fma(_142, _746, _812);
    float _836 = _792 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _828 * _388;
    float _842 = _830 * _382;
    float _844 = _710 * _802;
    float _846 = in.m_41.w;
    float _848 = _770 * _802;
    float _850 = fma(_148, _746, _826);
    float _852 = fma(_132, _742, _810);
    float _854 = _792 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _770 * _820;
    float _860 = in.m_43.w;
    float _862 = _710 * _820;
    float _864 = fma(_136, _746, _852);
    float _866 = in.m_39.w;
    float _868 = _838 * _832;
    float _870 = _802 * _838;
    float _872 = _820 * _838;
    float _874 = _770 * _868;
    float _876 = _710 * _868;
    float _878 = fma(_856, _858, _844);
    float _880 = _856 * _832;
    float _882 = fma(_856, _844, _858);
    float _884 = fma(_878, _842, _874);
    float _886 = -_862;
    float _888 = fma(_856, _848, _886);
    float _890 = -_848;
    float _892 = fma(_856, _862, _890);
    float _894 = -_880;
    float _896 = fma(_872, _842, _894);
    float _898 = _834 + _846;
    float _900 = fma(_888, _840, _884);
    float _902 = fma(_892, _842, _876);
    float _904 = fma(_870, _840, _896);
    float _906 = _850 + _860;
    float _908 = _900 * _268;
    float _910 = _900 * _276;
    float _912 = fma(_882, _840, _902);
    float _914 = _900 * _272;
    float _916 = fma(_904, _250, _908);
    float _918 = fma(_904, _258, _910);
    float _920 = _864 + _866;
    float _922 = fma(_904, _254, _914);
    float _924 = fma(_912, _280, _916);
    float _926 = fma(_912, _288, _918);
    float _928 = fma(_912, _284, _922);
    float _930 = _898 + _924;
    float _932 = _906 + _926;
    float _934 = _920 + _928;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _930 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _932 + _940;
    float _944 = _938 * _938;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = _928;
    float _956 = _866;
    float _958 = _946;
    float _960 = _930;
    float _962 = _932;
    if (!_952)
    {
        _954 = _944;
    }
    float _964 = _954;
    float _966 = _964;
    if (!_952)
    {
        _956 = _934;
    }
    float _968 = _956;
    bool _970 = !_952;
    float _972 = _968;
    if (!_970)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _978 = _950 + _976;
        float _980 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = rsqrt(_948);
        float _984 = _978 * _974;
        float _986 = _984 * 0.15915493667125701904296875;
        float _988 = _986 * 6.283185482025146484375;
        float _990 = sin(_988);
        float _992 = _986 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = fma(_990, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _998 = _982 * _996;
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_938, _998, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1004 = fma(_942, _998, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1006 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1010 = _1002 + _1008;
        float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1014 = _1004 + _1012;
        float _1016 = fma(_934, _994, _1006);
        float _1018 = _1010 * _1010;
        float _1020 = _1014 * _1014;
        _972 = _1016;
        _966 = _1018;
        _958 = _1020;
        _960 = _1002;
        _962 = _1004;
    }
    float _1022 = _972;
    float _1024 = _966;
    float _1026 = _958;
    float _1028 = _960;
    float _1030 = _962;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1022 + _1032;
    float _1036 = fma(_1034, _1034, _1024);
    float _1038 = _1036 + _1026;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = sqrt(_1038);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1050;
    out.m_55.y = _1052;
    out.m_55.z = _1054;
    out.m_55.w = _1044;
    bool _1056 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1058 = isnan(_1046);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1064 = _1060 || _1062;
    float _1066 = _1040;
    if (!_1064)
    {
        _1066 = 1.0;
    }
    float _1068 = _1066;
    bool _1070 = !_1064;
    float _1072 = _1068;
    if (!_1070)
    {
        bool _1074 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1076 = isnan(_1046);
        bool _1078 = _1074 || _1076;
        bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1082 = _1078 || _1080;
        if (!_1082)
        {
            float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1086 = _1046 + _1084;
            float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1090 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1096 = 1.0 / _1090;
            float _1098 = _1086 * _1096;
            float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1072 = _1100;
            _1102 = true;
        }
        else
        {
            bool _1104 = _1046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1106 = isnan(_1046);
            bool _1108 = _1104 || _1106;
            bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1112 = _1108 || _1110;
            if (!_1112)
            {
                float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1116 = _1046 + _1114;
                float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1120 = _1118 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1126 = 1.0 / _1120;
                float _1128 = _1116 * _1126;
                float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1072 = _1130;
                _1102 = true;
            }
            else
            {
                _1072 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1102 = false;
    float _1132 = _1072;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1022 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1140 = _1028 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1144 = _1030 + _1142;
    float _1146 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1148 = fma(_1140, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1150 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1152 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1162 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1154);
    float _1164 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1160);
    float _1170 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1162);
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1190 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1188);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1210 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1200);
    float _1212 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    out.m_57.w = _1208;
    out.gl_Position.x = _1210;
    out.gl_Position.y = _1212;
    out.gl_Position.z = _1214;
    out.gl_Position.w = _1216;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

