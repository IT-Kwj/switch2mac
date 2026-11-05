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
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_37 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _909 = as_type<float>(_82);
        out.gl_Position.z = _909;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _978 = as_type<float>(_120);
        out.gl_Position.z = _978;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _162 = _152 + _160;
    float _164 = in.m_35.x;
    float _166 = in.m_35.y;
    float _168 = in.m_35.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    float _184 = 1.0 / _176;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = in.m_37.y;
    float _200 = 1.0 / _172;
    float _202 = _158 * 2.0;
    float _204 = _156 + _158;
    float _206 = _154 + (-0.5);
    float _208 = 1.0 / _182;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    float _216 = _158 + (-0.5);
    float _218 = _156 + (-0.5);
    float _220 = _154 * 2.0;
    out.m_39.x = _178;
    float _222 = floor(_202);
    float _224 = _158 + _154;
    float _226 = _156 + _154;
    float _228 = _156 * 2.0;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _152 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _152 + _234;
    float _238 = _224 + (-1.0);
    float _240 = _226 + (-1.0);
    float _242 = _232 * _184;
    float _244 = floor(_228);
    float _246 = _236 * _200;
    float _248 = _204 + (-1.0);
    float _250 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_39.y = _198;
    bool _252 = _222 > 0.0;
    float _254 = floor(_220);
    bool _256 = _222 >= 0.0;
    bool _258 = isnan(_222);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    int _272 = _264 ? 0 : 1;
    float _274 = _162 * _208;
    float _276 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = ~_272;
    int _280 = _278 + 1;
    int _282 = _280 + 1;
    float _284 = fma(_270, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _286 = _244 >= 0.0;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _300 = _282;
    if (!_252)
    {
        int _302 = ~_272;
        int _304 = _302 + 1;
        _300 = _304;
    }
    int _306 = _300;
    float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _310 = log2(_308);
    bool _312 = _244 > 0.0;
    float _314 = fma(_298, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _316 = !_188;
    int _318 = _316 ? 0 : 1;
    int _320 = _294 ? 0 : 1;
    int _322 = abs(_318);
    bool _324 = _254 > 0.0;
    bool _326 = _254 >= 0.0;
    bool _328 = isnan(_254);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _310 * _100;
    float _338 = float(_322);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = float(_306);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = exp2(_336);
    int _352 = ~_320;
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    float _358 = fma(_342, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _360 = _356;
    if (!_312)
    {
        int _362 = ~_320;
        int _364 = _362 + 1;
        _360 = _364;
    }
    int _366 = _360;
    float _368 = _338 * _344;
    float _370 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = in.m_41.x;
    float _374 = in.m_41.y;
    float _376 = in.m_41.z;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    bool _392 = !_196;
    int _394 = _392 ? 0 : 1;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = 1.0 / _390;
    int _410 = abs(_394);
    float _412 = fma(_398, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_402, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_350;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _422 = _368 * (-2.0);
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = float(_410);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = float(_366);
    float _446 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = _432 ? _418 : 0.0;
    float _450 = fma(_442, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _452 = _334 ? 0 : 1;
    float _454 = _438 * _444;
    float _456 = fma(_422, _372, _372);
    bool _458 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_152);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    if (_386)
    {
        float _470 = _448 * _408;
        _104 = _470;
    }
    float _472 = _104;
    int _474 = ~_452;
    int _476 = _474 + 1;
    int _478 = _476 + 1;
    float _480 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    int _482 = _478;
    if (!_324)
    {
        int _484 = ~_452;
        int _486 = _484 + 1;
        _482 = _486;
    }
    int _488 = _482;
    float _490 = fma(_250, _422, _250);
    bool _492 = !_192;
    int _494 = _492 ? 0 : 1;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    bool _500 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_152);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_490, _472, _480);
    int _514 = abs(_494);
    float _516 = _454 * (-2.0);
    bool _518 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _520 = isnan(_152);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _510 * _498;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_152);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_516, _376, _376);
    float _550 = _528 * _534;
    float _552 = float(_488);
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = float(_514);
    float _560 = fma(_266, _516, _266);
    float _562 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _548);
    float _564 = _546 * _556;
    float _566 = _512 * 0.15915493667125701904296875;
    float _568 = _558 * _552;
    float _570 = fma(_560, _472, _562);
    float _572 = _370 * _564;
    float _574 = in.m_26.x;
    float _576 = in.m_26.y;
    float _578 = in.m_26.z;
    float _580 = _568 * (-2.0);
    float _582 = _358 * _564;
    float _584 = _284 * _564;
    float _586 = -_546;
    float _588 = _586 + 1.0;
    float _590 = fma(_580, _374, _374);
    float _592 = _570 * 0.15915493667125701904296875;
    float _594 = in.m_43.x;
    float _596 = in.m_43.y;
    float _598 = in.m_43.z;
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _602 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _572);
    float _604 = fma(_276, _580, _276);
    float _606 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _608 = fma(_412, _550, _600);
    float _610 = fma(_414, _550, _602);
    float _612 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _614 = fma(_604, _472, _606);
    float _616 = fma(_420, _530, _608);
    float _618 = _566 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = fma(_446, _530, _610);
    float _624 = _614 * 0.15915493667125701904296875;
    float _626 = fma(_314, _550, _612);
    float _628 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _622);
    float _630 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _566 * 6.283185482025146484375;
    float _634 = cos(_632);
    float _636 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _616);
    float _642 = fma(_450, _530, _626);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _646 = _628 * _596;
    float _648 = _640 * _594;
    float _650 = _592 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _642);
    float _656 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _662 = _654 * _598;
    float _664 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _666 = _658 * _210;
    float _668 = _592 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = _656 * _212;
    float _674 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _678 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _680 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _682 = _674 * _214;
    float _684 = _676 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _686 = _624 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _620 * _652;
    float _692 = _634 * _652;
    float _694 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _696 = in.m_37.z;
    float _698 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = _624 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _634 * _670;
    float _706 = _620 * _670;
    float _708 = fma(_688, _690, _704);
    float _710 = -_692;
    float _712 = fma(_688, _706, _710);
    float _714 = -_706;
    float _716 = fma(_688, _692, _714);
    float _718 = _708 * _672;
    float _720 = _712 * _672;
    float _722 = _702 * _666;
    float _724 = _688 * _666;
    float _726 = fma(_688, _704, _690);
    float _728 = _620 * _702;
    float _730 = fma(_652, _722, _718);
    float _732 = fma(_670, _722, _720);
    float _734 = _634 * _702;
    float _736 = -_724;
    float _738 = fma(_728, _672, _736);
    float _740 = fma(_716, _682, _730);
    float _742 = fma(_726, _682, _732);
    out.m_39.z = _696;
    float _744 = fma(_734, _682, _738);
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _752 = in.m_37.w;
    float _754 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _746);
    float _756 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _748);
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _750);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _758);
    float _766 = _684 + _760;
    float _768 = _694 + _762;
    float _770 = _698 + _764;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = _766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _778 = _766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = _766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _782 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _774);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _776);
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _780);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _784);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _788);
    float _798 = _790 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _806 = _798 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _808 = _798 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _810 = _798 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _812 = _798 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _812);
    float _822 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _814);
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _816);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _818);
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _820);
    float _830 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _822);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _824);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _826);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _828);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_39.w = _752;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 + _836;
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _846 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _848;
    out.m_45.y = _844;
    out.m_45.z = _850;
    out.m_45.w = _772;
    out.gl_Position.x = _834;
    out.gl_Position.y = _830;
    out.gl_Position.z = _832;
    out.gl_Position.w = _836;
    out.m_47.z = _852;
    out.m_47.w = _836;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _909 = as_type<float>(_82);
        out.gl_Position.z = _909;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _978 = as_type<float>(_120);
        out.gl_Position.z = _978;
    }
    if (_114)
    {
        return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _162 = _152 + _160;
    float _164 = in.m_35.x;
    float _166 = in.m_35.y;
    float _168 = in.m_35.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    float _184 = 1.0 / _176;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = in.m_37.y;
    float _200 = 1.0 / _172;
    float _202 = _158 * 2.0;
    float _204 = _156 + _158;
    float _206 = _154 + (-0.5);
    float _208 = 1.0 / _182;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    float _216 = _158 + (-0.5);
    float _218 = _156 + (-0.5);
    float _220 = _154 * 2.0;
    out.m_39.x = _178;
    float _222 = floor(_202);
    float _224 = _158 + _154;
    float _226 = _156 + _154;
    float _228 = _156 * 2.0;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _152 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _152 + _234;
    float _238 = _224 + (-1.0);
    float _240 = _226 + (-1.0);
    float _242 = _232 * _184;
    float _244 = floor(_228);
    float _246 = _236 * _200;
    float _248 = _204 + (-1.0);
    float _250 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_39.y = _198;
    bool _252 = _222 > 0.0;
    float _254 = floor(_220);
    bool _256 = _222 >= 0.0;
    bool _258 = isnan(_222);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    int _272 = _264 ? 0 : 1;
    float _274 = _162 * _208;
    float _276 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = ~_272;
    int _280 = _278 + 1;
    int _282 = _280 + 1;
    float _284 = fma(_270, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _286 = _244 >= 0.0;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _300 = _282;
    if (!_252)
    {
        int _302 = ~_272;
        int _304 = _302 + 1;
        _300 = _304;
    }
    int _306 = _300;
    float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _310 = log2(_308);
    bool _312 = _244 > 0.0;
    float _314 = fma(_298, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _316 = !_188;
    int _318 = _316 ? 0 : 1;
    int _320 = _294 ? 0 : 1;
    int _322 = abs(_318);
    bool _324 = _254 > 0.0;
    bool _326 = _254 >= 0.0;
    bool _328 = isnan(_254);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _310 * _100;
    float _338 = float(_322);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = float(_306);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = exp2(_336);
    int _352 = ~_320;
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    float _358 = fma(_342, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _360 = _356;
    if (!_312)
    {
        int _362 = ~_320;
        int _364 = _362 + 1;
        _360 = _364;
    }
    int _366 = _360;
    float _368 = _338 * _344;
    float _370 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = in.m_41.x;
    float _374 = in.m_41.y;
    float _376 = in.m_41.z;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    bool _392 = !_196;
    int _394 = _392 ? 0 : 1;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = 1.0 / _390;
    int _410 = abs(_394);
    float _412 = fma(_398, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_402, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_350;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _422 = _368 * (-2.0);
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = float(_410);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = float(_366);
    float _446 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = _432 ? _418 : 0.0;
    float _450 = fma(_442, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _452 = _334 ? 0 : 1;
    float _454 = _438 * _444;
    float _456 = fma(_422, _372, _372);
    bool _458 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_152);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    if (_386)
    {
        float _470 = _448 * _408;
        _104 = _470;
    }
    float _472 = _104;
    int _474 = ~_452;
    int _476 = _474 + 1;
    int _478 = _476 + 1;
    float _480 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    int _482 = _478;
    if (!_324)
    {
        int _484 = ~_452;
        int _486 = _484 + 1;
        _482 = _486;
    }
    int _488 = _482;
    float _490 = fma(_250, _422, _250);
    bool _492 = !_192;
    int _494 = _492 ? 0 : 1;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    bool _500 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_152);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_490, _472, _480);
    int _514 = abs(_494);
    float _516 = _454 * (-2.0);
    bool _518 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _520 = isnan(_152);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _510 * _498;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_152);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_516, _376, _376);
    float _550 = _528 * _534;
    float _552 = float(_488);
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = float(_514);
    float _560 = fma(_266, _516, _266);
    float _562 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _548);
    float _564 = _546 * _556;
    float _566 = _512 * 0.15915493667125701904296875;
    float _568 = _558 * _552;
    float _570 = fma(_560, _472, _562);
    float _572 = _370 * _564;
    float _574 = in.m_26.x;
    float _576 = in.m_26.y;
    float _578 = in.m_26.z;
    float _580 = _568 * (-2.0);
    float _582 = _358 * _564;
    float _584 = _284 * _564;
    float _586 = -_546;
    float _588 = _586 + 1.0;
    float _590 = fma(_580, _374, _374);
    float _592 = _570 * 0.15915493667125701904296875;
    float _594 = in.m_43.x;
    float _596 = in.m_43.y;
    float _598 = in.m_43.z;
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _602 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _572);
    float _604 = fma(_276, _580, _276);
    float _606 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _608 = fma(_412, _550, _600);
    float _610 = fma(_414, _550, _602);
    float _612 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _614 = fma(_604, _472, _606);
    float _616 = fma(_420, _530, _608);
    float _618 = _566 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = fma(_446, _530, _610);
    float _624 = _614 * 0.15915493667125701904296875;
    float _626 = fma(_314, _550, _612);
    float _628 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _622);
    float _630 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _566 * 6.283185482025146484375;
    float _634 = cos(_632);
    float _636 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _616);
    float _642 = fma(_450, _530, _626);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _646 = _628 * _596;
    float _648 = _640 * _594;
    float _650 = _592 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _642);
    float _656 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _662 = _654 * _598;
    float _664 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _666 = _658 * _210;
    float _668 = _592 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = _656 * _212;
    float _674 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _678 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _680 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _682 = _674 * _214;
    float _684 = _676 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _686 = _624 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _620 * _652;
    float _692 = _634 * _652;
    float _694 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _696 = in.m_37.z;
    float _698 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = _624 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _634 * _670;
    float _706 = _620 * _670;
    float _708 = fma(_688, _690, _704);
    float _710 = -_692;
    float _712 = fma(_688, _706, _710);
    float _714 = -_706;
    float _716 = fma(_688, _692, _714);
    float _718 = _708 * _672;
    float _720 = _712 * _672;
    float _722 = _702 * _666;
    float _724 = _688 * _666;
    float _726 = fma(_688, _704, _690);
    float _728 = _620 * _702;
    float _730 = fma(_652, _722, _718);
    float _732 = fma(_670, _722, _720);
    float _734 = _634 * _702;
    float _736 = -_724;
    float _738 = fma(_728, _672, _736);
    float _740 = fma(_716, _682, _730);
    float _742 = fma(_726, _682, _732);
    out.m_39.z = _696;
    float _744 = fma(_734, _682, _738);
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _752 = in.m_37.w;
    float _754 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _746);
    float _756 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _748);
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _750);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _758);
    float _766 = _684 + _760;
    float _768 = _694 + _762;
    float _770 = _698 + _764;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = _766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _778 = _766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = _766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _782 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _774);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _776);
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _780);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _784);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _788);
    float _798 = _790 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _806 = _798 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _808 = _798 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _810 = _798 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _812 = _798 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _812);
    float _822 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _814);
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _816);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _818);
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _820);
    float _830 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _822);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _824);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _826);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _828);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_39.w = _752;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 + _836;
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _846 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _848;
    out.m_45.y = _844;
    out.m_45.z = _850;
    out.m_45.w = _772;
    out.gl_Position.x = _834;
    out.gl_Position.y = _830;
    out.gl_Position.z = _832;
    out.gl_Position.w = _836;
    out.m_47.z = _852;
    out.m_47.w = _836;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _909 = as_type<float>(_82);
        out.gl_Position.z = _909;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _978 = as_type<float>(_120);
        out.gl_Position.z = _978;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _162 = _152 + _160;
    float _164 = in.m_35.x;
    float _166 = in.m_35.y;
    float _168 = in.m_35.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    float _184 = 1.0 / _176;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = in.m_37.y;
    float _200 = 1.0 / _172;
    float _202 = _158 * 2.0;
    float _204 = _156 + _158;
    float _206 = _154 + (-0.5);
    float _208 = 1.0 / _182;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    float _216 = _158 + (-0.5);
    float _218 = _156 + (-0.5);
    float _220 = _154 * 2.0;
    out.m_39.x = _178;
    float _222 = floor(_202);
    float _224 = _158 + _154;
    float _226 = _156 + _154;
    float _228 = _156 * 2.0;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _152 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _152 + _234;
    float _238 = _224 + (-1.0);
    float _240 = _226 + (-1.0);
    float _242 = _232 * _184;
    float _244 = floor(_228);
    float _246 = _236 * _200;
    float _248 = _204 + (-1.0);
    float _250 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_39.y = _198;
    bool _252 = _222 > 0.0;
    float _254 = floor(_220);
    bool _256 = _222 >= 0.0;
    bool _258 = isnan(_222);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    int _272 = _264 ? 0 : 1;
    float _274 = _162 * _208;
    float _276 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = ~_272;
    int _280 = _278 + 1;
    int _282 = _280 + 1;
    float _284 = fma(_270, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _286 = _244 >= 0.0;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _300 = _282;
    if (!_252)
    {
        int _302 = ~_272;
        int _304 = _302 + 1;
        _300 = _304;
    }
    int _306 = _300;
    float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _310 = log2(_308);
    bool _312 = _244 > 0.0;
    float _314 = fma(_298, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _316 = !_188;
    int _318 = _316 ? 0 : 1;
    int _320 = _294 ? 0 : 1;
    int _322 = abs(_318);
    bool _324 = _254 > 0.0;
    bool _326 = _254 >= 0.0;
    bool _328 = isnan(_254);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _310 * _100;
    float _338 = float(_322);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = float(_306);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = exp2(_336);
    int _352 = ~_320;
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    float _358 = fma(_342, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _360 = _356;
    if (!_312)
    {
        int _362 = ~_320;
        int _364 = _362 + 1;
        _360 = _364;
    }
    int _366 = _360;
    float _368 = _338 * _344;
    float _370 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = in.m_41.x;
    float _374 = in.m_41.y;
    float _376 = in.m_41.z;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    bool _392 = !_196;
    int _394 = _392 ? 0 : 1;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = 1.0 / _390;
    int _410 = abs(_394);
    float _412 = fma(_398, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_402, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = -_350;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _422 = _368 * (-2.0);
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = float(_410);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = float(_366);
    float _446 = fma(_436, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = _432 ? _418 : 0.0;
    float _450 = fma(_442, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _452 = _334 ? 0 : 1;
    float _454 = _438 * _444;
    float _456 = fma(_422, _372, _372);
    bool _458 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _460 = isnan(_152);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    if (_386)
    {
        float _470 = _448 * _408;
        _104 = _470;
    }
    float _472 = _104;
    int _474 = ~_452;
    int _476 = _474 + 1;
    int _478 = _476 + 1;
    float _480 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    int _482 = _478;
    if (!_324)
    {
        int _484 = ~_452;
        int _486 = _484 + 1;
        _482 = _486;
    }
    int _488 = _482;
    float _490 = fma(_250, _422, _250);
    bool _492 = !_192;
    int _494 = _492 ? 0 : 1;
    float _496 = -_468;
    float _498 = _496 + 1.0;
    bool _500 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_152);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_490, _472, _480);
    int _514 = abs(_494);
    float _516 = _454 * (-2.0);
    bool _518 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _520 = isnan(_152);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _510 * _498;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_152);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_516, _376, _376);
    float _550 = _528 * _534;
    float _552 = float(_488);
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = float(_514);
    float _560 = fma(_266, _516, _266);
    float _562 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].z, _548);
    float _564 = _546 * _556;
    float _566 = _512 * 0.15915493667125701904296875;
    float _568 = _558 * _552;
    float _570 = fma(_560, _472, _562);
    float _572 = _370 * _564;
    float _574 = in.m_26.x;
    float _576 = in.m_26.y;
    float _578 = in.m_26.z;
    float _580 = _568 * (-2.0);
    float _582 = _358 * _564;
    float _584 = _284 * _564;
    float _586 = -_546;
    float _588 = _586 + 1.0;
    float _590 = fma(_580, _374, _374);
    float _592 = _570 * 0.15915493667125701904296875;
    float _594 = in.m_43.x;
    float _596 = in.m_43.y;
    float _598 = in.m_43.z;
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _602 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _572);
    float _604 = fma(_276, _580, _276);
    float _606 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _608 = fma(_412, _550, _600);
    float _610 = fma(_414, _550, _602);
    float _612 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _614 = fma(_604, _472, _606);
    float _616 = fma(_420, _530, _608);
    float _618 = _566 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = fma(_446, _530, _610);
    float _624 = _614 * 0.15915493667125701904296875;
    float _626 = fma(_314, _550, _612);
    float _628 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].y, _622);
    float _630 = _576 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _566 * 6.283185482025146484375;
    float _634 = cos(_632);
    float _636 = _576 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _576 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].x, _616);
    float _642 = fma(_450, _530, _626);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _646 = _628 * _596;
    float _648 = _640 * _594;
    float _650 = _592 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[146].z, _642);
    float _656 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _662 = _654 * _598;
    float _664 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _666 = _658 * _210;
    float _668 = _592 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = _656 * _212;
    float _674 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _678 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _644);
    float _680 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _682 = _674 * _214;
    float _684 = _676 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _686 = _624 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _620 * _652;
    float _692 = _634 * _652;
    float _694 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _696 = in.m_37.z;
    float _698 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = _624 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _634 * _670;
    float _706 = _620 * _670;
    float _708 = fma(_688, _690, _704);
    float _710 = -_692;
    float _712 = fma(_688, _706, _710);
    float _714 = -_706;
    float _716 = fma(_688, _692, _714);
    float _718 = _708 * _672;
    float _720 = _712 * _672;
    float _722 = _702 * _666;
    float _724 = _688 * _666;
    float _726 = fma(_688, _704, _690);
    float _728 = _620 * _702;
    float _730 = fma(_652, _722, _718);
    float _732 = fma(_670, _722, _720);
    float _734 = _634 * _702;
    float _736 = -_724;
    float _738 = fma(_728, _672, _736);
    float _740 = fma(_716, _682, _730);
    float _742 = fma(_726, _682, _732);
    out.m_39.z = _696;
    float _744 = fma(_734, _682, _738);
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _750 = _740 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _752 = in.m_37.w;
    float _754 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _746);
    float _756 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _748);
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _750);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _758);
    float _766 = _684 + _760;
    float _768 = _694 + _762;
    float _770 = _698 + _764;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = _766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _778 = _766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _780 = _766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _782 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _774);
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _776);
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _780);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _782);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _784);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _788);
    float _798 = _790 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _806 = _798 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _808 = _798 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _810 = _798 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _812 = _798 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _812);
    float _822 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _814);
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _816);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _818);
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _820);
    float _830 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _822);
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _824);
    float _834 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _826);
    float _836 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _828);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_39.w = _752;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _832 + _836;
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _846 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _848;
    out.m_45.y = _844;
    out.m_45.z = _850;
    out.m_45.w = _772;
    out.gl_Position.x = _834;
    out.gl_Position.y = _830;
    out.gl_Position.z = _832;
    out.gl_Position.w = _836;
    out.m_47.z = _852;
    out.m_47.w = _836;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

