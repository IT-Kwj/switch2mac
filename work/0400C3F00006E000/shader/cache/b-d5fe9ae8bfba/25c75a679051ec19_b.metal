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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_39 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1069 = as_type<float>(_98);
        out.gl_Position.z = _1069;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _90 = _120;
    }
    float _122 = _90;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1139 = as_type<float>(_136);
        out.gl_Position.z = _1139;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_37.z;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_37.x;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.y;
    float _160 = 0.0;
    float _162 = _144;
    if (!_156)
    {
        float _164 = _144 * _144;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_156)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _138 * 2.0;
    float _178 = _146 * 2.0;
    float _180 = floor(_176);
    float _182 = _158 * 2.0;
    float _184 = floor(_178);
    float _186 = floor(_182);
    bool _188 = _180 >= 0.0;
    bool _190 = isnan(_180);
    bool _192 = _188 || _190;
    bool _194 = isnan(0.0);
    bool _196 = _192 || _194;
    bool _198 = _180 > 0.0;
    int _200 = _196 ? 0 : 1;
    bool _202 = !_156;
    float _204 = _174;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _144 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _144);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _144 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _162 = _258;
    }
    float _260 = _162;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _272 = _270 != 0;
    float _274 = _142 * _116;
    bool _276 = _184 > 0.0;
    float _278 = in.m_39.x;
    int _280 = ~_200;
    int _282 = _280 + 1;
    int _284 = _282 + 1;
    float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _288 = !_264;
    int _290 = _288 ? 0 : 1;
    float _292 = in.m_41.w;
    bool _294 = _184 >= 0.0;
    bool _296 = isnan(_184);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    int _304 = _284;
    if (!_198)
    {
        int _306 = ~_200;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    float _312 = in.m_43.x;
    int _314 = abs(_290);
    float _316 = exp2(_274);
    bool _318 = _186 > 0.0;
    float _320 = in.m_43.y;
    int _322 = _302 ? 0 : 1;
    float _324 = float(_310);
    float _326 = in.m_43.z;
    float _328 = float(_314);
    bool _330 = _186 >= 0.0;
    bool _332 = isnan(_186);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = in.m_43.w;
    int _342 = ~_322;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    float _348 = _328 * _324;
    int _350 = _346;
    if (!_276)
    {
        int _352 = ~_322;
        int _354 = _352 + 1;
        _350 = _354;
    }
    int _356 = _350;
    float _358 = in.m_45.x;
    float _360 = in.m_45.y;
    float _362 = in.m_45.z;
    int _364 = _338 ? 0 : 1;
    float _366 = -_316;
    float _368 = _366 + 1.0;
    float _370 = _348 * (-2.0);
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    int _392 = _376;
    if (!_318)
    {
        int _394 = ~_364;
        int _396 = _394 + 1;
        _392 = _396;
    }
    int _398 = _392;
    float _400 = _158 + _146;
    float _402 = 1.0 / _390;
    float _404 = _400 + (-1.0);
    bool _406 = !_268;
    int _408 = _406 ? 0 : 1;
    out.m_47.x = _312;
    bool _410 = !_272;
    int _412 = _410 ? 0 : 1;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    out.m_47.y = _320;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    int _424 = abs(_408);
    float _426 = in.m_41.x;
    float _428 = in.m_41.y;
    float _430 = in.m_41.z;
    int _432 = abs(_412);
    bool _434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    out.m_47.z = _326;
    float _444 = float(_424);
    float _446 = float(_432);
    float _448 = fma(_414, _370, _414);
    float _450 = float(_356);
    float _452 = in.m_39.y;
    float _454 = float(_398);
    float _456 = fma(_370, _358, _358);
    float _458 = _442 ? _368 : 0.0;
    float _460 = _158 + _138;
    float _462 = _444 * _450;
    float _464 = _446 * _454;
    if (_386)
    {
        float _466 = _458 * _402;
        _118 = _466;
    }
    float _468 = _118;
    float _470 = _146 + (-0.5);
    float _472 = _460 + (-1.0);
    float _474 = _462 * (-2.0);
    float _476 = _464 * (-2.0);
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = fma(_474, _360, _360);
    float _484 = fma(_476, _362, _362);
    bool _486 = _158 > 0.5;
    float _488 = in.m_49.x;
    float _490 = in.m_49.y;
    float _492 = in.m_49.z;
    float _494 = _158 + (-0.5);
    float _496 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _138 + _146;
    float _500 = fma(_480, _474, _480);
    float _502 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _504 = fma(_448, _468, _478);
    float _506 = _428 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = _498 + (-1.0);
    float _510 = -_452;
    float _512 = _510 + 1.0;
    float _514 = fma(_500, _468, _502);
    float _516 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _518 = _146 > 0.5;
    bool _520 = _518 && _418;
    float _522 = _514 * 0.15915493667125701904296875;
    float _524 = _452;
    float _526 = _468;
    if (_422)
    {
        float _528 = _486 ? _512 : _452;
        _524 = _528;
    }
    float _530 = _524;
    float _532 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _534 = in.m_35.x;
    float _536 = in.m_35.y;
    float _538 = in.m_35.z;
    float _540 = _138 + (-0.5);
    float _542 = _504 * 0.15915493667125701904296875;
    float _544 = fma(_532, _476, _532);
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[196].z, _484);
    float _548 = _542 * 6.283185482025146484375;
    float _550 = sin(_548);
    float _552 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _556 = fma(_544, _468, _546);
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _492);
    float _560 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * _554;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _490);
    float _566 = _542 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = 0.5;
    if (_418)
    {
        _572 = _278;
    }
    float _574 = _572;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _578 = _574;
    if (!_418)
    {
        _526 = _278;
    }
    float _580 = _526;
    float _582 = _560 * _564;
    float _584 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _586 = _580;
    if (_520)
    {
        float _588 = -_574;
        float _590 = _588 + 1.0;
        _578 = _590;
    }
    float _592 = _578;
    float _594 = _522 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = in.m_30.x;
    float _600 = in.m_30.y;
    float _602 = in.m_30.z;
    float _604 = _576 * _558;
    float _606 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _608 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_418)
    {
        _586 = _592;
    }
    float _610 = _586;
    float _612 = fma(_260, _536, _584);
    float _614 = fma(_260, _534, _606);
    float _616 = _522 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_260, _538, _608);
    bool _622 = _490 != 0.0;
    bool _624 = isnan(_490);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_51.x;
    float _634 = in.m_51.y;
    float _636 = in.m_51.z;
    bool _638 = _488 == 0.0;
    bool _640 = !_630;
    bool _642 = _638 && _640;
    out.m_47.w = _340;
    float _644 = _570 * 6.283185482025146484375;
    float _646 = cos(_644);
    bool _648 = _492 == 0.0;
    bool _650 = _648 && _642;
    float _652 = _570 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = fma(_614, _292, _598);
    float _658 = fma(_612, _292, _600);
    float _660 = _550 * _596;
    float _662 = _550 * _618;
    float _664 = _568 * _618;
    float _666 = fma(_620, _292, _602);
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = _618 * _646;
    float _672 = _568 * _596;
    float _674 = _550 * _646;
    float _676 = _568 * _646;
    float _678 = _596 * _646;
    float _680 = _632;
    float _682 = _634;
    float _684 = _636;
    if (!_650)
    {
        float _686 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _680 = _686;
    }
    float _688 = _680;
    if (!_650)
    {
        float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _634);
        _682 = _690;
    }
    float _692 = _682;
    float _694 = _676 * _604;
    float _696 = fma(_654, _664, _660);
    float _698 = fma(_654, _660, _664);
    float _700 = -_604;
    float _702 = _654 * _700;
    float _704 = -_672;
    float _706 = fma(_654, _662, _704);
    float _708 = _674 * _604;
    float _710 = -_662;
    float _712 = fma(_654, _672, _710);
    float _714 = fma(_670, _562, _702);
    float _716 = fma(_696, _562, _694);
    float _718 = fma(_706, _562, _708);
    if (!_650)
    {
        float _720 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _684 = _720;
    }
    float _722 = _684;
    float _724 = -_582;
    float _726 = fma(_678, _724, _714);
    float _728 = -_582;
    float _730 = fma(_712, _728, _716);
    float _732 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _736 = -_582;
    float _738 = fma(_698, _736, _718);
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _742 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _744 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _734);
    float _746 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _750 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _742);
    float _752 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _744);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[10].x, _746);
    float _756 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].x, _740);
    float _758 = _750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _754);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _766 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _768 = _760 + _762;
    float _770 = _610 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _758 + _764;
    float _774 = _766 * _286;
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _768 + _776;
    float _780 = _770 * _748;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _772 + _782;
    float _786 = _778 * _778;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _790 = fma(_784, _784, _786);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = sqrt(_790);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _780;
    out.m_53.y = _774;
    float _806 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    out.m_55.x = _796;
    out.m_55.y = _802;
    out.m_55.z = _804;
    out.m_55.w = _800;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _820 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _816;
    out.m_57.y = _818;
    out.m_57.z = _822;
    float _824 = _676 * _722;
    float _826 = -_722;
    float _828 = _654 * _826;
    float _830 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _832 = _674 * _722;
    float _834 = fma(_696, _688, _824);
    float _836 = fma(_670, _688, _828);
    float _838 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[9].x, _830);
    float _840 = fma(_706, _688, _832);
    float _842 = -_692;
    float _844 = fma(_712, _842, _834);
    float _846 = -_692;
    float _848 = fma(_678, _846, _836);
    float _850 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _838);
    float _852 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _854 = _844 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _844 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = -_692;
    float _862 = fma(_698, _860, _840);
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _866 = _852 + _850;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[9].z, _864);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[10].z, _870);
    float _878 = _800;
    float _880 = _772;
    float _882 = _768;
    if (!_820)
    {
        _878 = _866;
    }
    float _884 = _878;
    bool _886 = !_820;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _798 + _892;
        float _896 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_790);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_866, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_784, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_778, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _880 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _880;
    float _930 = _882;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_59.x = _874;
    out.m_59.y = _872;
    out.m_59.z = _876;
    float _938 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _934);
    float _942 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _938);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _940);
    float _950 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _972 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _966);
    float _976 = _958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _982 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].z, _974);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _968);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _980);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _992 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _926 + _994;
    float _998 = _986 + _988;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _992);
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1006 = _928 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _930 + _1008;
    float _1012 = _998 * 0.5;
    out.m_33.x = _1002;
    out.m_61.x = _1006;
    out.m_61.y = _996;
    out.m_61.z = _1010;
    out.gl_Position.x = _990;
    out.gl_Position.y = _1000;
    out.gl_Position.z = _986;
    out.gl_Position.w = _988;
    out.m_63.z = _1012;
    out.m_63.w = _988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1069 = as_type<float>(_98);
        out.gl_Position.z = _1069;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _90 = _120;
    }
    float _122 = _90;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1139 = as_type<float>(_136);
        out.gl_Position.z = _1139;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_37.z;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_37.x;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.y;
    float _160 = 0.0;
    float _162 = _144;
    if (!_156)
    {
        float _164 = _144 * _144;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_156)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _138 * 2.0;
    float _178 = _146 * 2.0;
    float _180 = floor(_176);
    float _182 = _158 * 2.0;
    float _184 = floor(_178);
    float _186 = floor(_182);
    bool _188 = _180 >= 0.0;
    bool _190 = isnan(_180);
    bool _192 = _188 || _190;
    bool _194 = isnan(0.0);
    bool _196 = _192 || _194;
    bool _198 = _180 > 0.0;
    int _200 = _196 ? 0 : 1;
    bool _202 = !_156;
    float _204 = _174;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _144 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _144);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _144 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _162 = _258;
    }
    float _260 = _162;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _272 = _270 != 0;
    float _274 = _142 * _116;
    bool _276 = _184 > 0.0;
    float _278 = in.m_39.x;
    int _280 = ~_200;
    int _282 = _280 + 1;
    int _284 = _282 + 1;
    float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _288 = !_264;
    int _290 = _288 ? 0 : 1;
    float _292 = in.m_41.w;
    bool _294 = _184 >= 0.0;
    bool _296 = isnan(_184);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    int _304 = _284;
    if (!_198)
    {
        int _306 = ~_200;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    float _312 = in.m_43.x;
    int _314 = abs(_290);
    float _316 = exp2(_274);
    bool _318 = _186 > 0.0;
    float _320 = in.m_43.y;
    int _322 = _302 ? 0 : 1;
    float _324 = float(_310);
    float _326 = in.m_43.z;
    float _328 = float(_314);
    bool _330 = _186 >= 0.0;
    bool _332 = isnan(_186);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = in.m_43.w;
    int _342 = ~_322;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    float _348 = _328 * _324;
    int _350 = _346;
    if (!_276)
    {
        int _352 = ~_322;
        int _354 = _352 + 1;
        _350 = _354;
    }
    int _356 = _350;
    float _358 = in.m_45.x;
    float _360 = in.m_45.y;
    float _362 = in.m_45.z;
    int _364 = _338 ? 0 : 1;
    float _366 = -_316;
    float _368 = _366 + 1.0;
    float _370 = _348 * (-2.0);
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    int _392 = _376;
    if (!_318)
    {
        int _394 = ~_364;
        int _396 = _394 + 1;
        _392 = _396;
    }
    int _398 = _392;
    float _400 = _158 + _146;
    float _402 = 1.0 / _390;
    float _404 = _400 + (-1.0);
    bool _406 = !_268;
    int _408 = _406 ? 0 : 1;
    out.m_47.x = _312;
    bool _410 = !_272;
    int _412 = _410 ? 0 : 1;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    out.m_47.y = _320;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    int _424 = abs(_408);
    float _426 = in.m_41.x;
    float _428 = in.m_41.y;
    float _430 = in.m_41.z;
    int _432 = abs(_412);
    bool _434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    out.m_47.z = _326;
    float _444 = float(_424);
    float _446 = float(_432);
    float _448 = fma(_414, _370, _414);
    float _450 = float(_356);
    float _452 = in.m_39.y;
    float _454 = float(_398);
    float _456 = fma(_370, _358, _358);
    float _458 = _442 ? _368 : 0.0;
    float _460 = _158 + _138;
    float _462 = _444 * _450;
    float _464 = _446 * _454;
    if (_386)
    {
        float _466 = _458 * _402;
        _118 = _466;
    }
    float _468 = _118;
    float _470 = _146 + (-0.5);
    float _472 = _460 + (-1.0);
    float _474 = _462 * (-2.0);
    float _476 = _464 * (-2.0);
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = fma(_474, _360, _360);
    float _484 = fma(_476, _362, _362);
    bool _486 = _158 > 0.5;
    float _488 = in.m_49.x;
    float _490 = in.m_49.y;
    float _492 = in.m_49.z;
    float _494 = _158 + (-0.5);
    float _496 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _138 + _146;
    float _500 = fma(_480, _474, _480);
    float _502 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _504 = fma(_448, _468, _478);
    float _506 = _428 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = _498 + (-1.0);
    float _510 = -_452;
    float _512 = _510 + 1.0;
    float _514 = fma(_500, _468, _502);
    float _516 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _518 = _146 > 0.5;
    bool _520 = _518 && _418;
    float _522 = _514 * 0.15915493667125701904296875;
    float _524 = _452;
    float _526 = _468;
    if (_422)
    {
        float _528 = _486 ? _512 : _452;
        _524 = _528;
    }
    float _530 = _524;
    float _532 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _534 = in.m_35.x;
    float _536 = in.m_35.y;
    float _538 = in.m_35.z;
    float _540 = _138 + (-0.5);
    float _542 = _504 * 0.15915493667125701904296875;
    float _544 = fma(_532, _476, _532);
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[196].z, _484);
    float _548 = _542 * 6.283185482025146484375;
    float _550 = sin(_548);
    float _552 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _556 = fma(_544, _468, _546);
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _492);
    float _560 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * _554;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _490);
    float _566 = _542 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = 0.5;
    if (_418)
    {
        _572 = _278;
    }
    float _574 = _572;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _578 = _574;
    if (!_418)
    {
        _526 = _278;
    }
    float _580 = _526;
    float _582 = _560 * _564;
    float _584 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _586 = _580;
    if (_520)
    {
        float _588 = -_574;
        float _590 = _588 + 1.0;
        _578 = _590;
    }
    float _592 = _578;
    float _594 = _522 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = in.m_30.x;
    float _600 = in.m_30.y;
    float _602 = in.m_30.z;
    float _604 = _576 * _558;
    float _606 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _608 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_418)
    {
        _586 = _592;
    }
    float _610 = _586;
    float _612 = fma(_260, _536, _584);
    float _614 = fma(_260, _534, _606);
    float _616 = _522 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_260, _538, _608);
    bool _622 = _490 != 0.0;
    bool _624 = isnan(_490);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_51.x;
    float _634 = in.m_51.y;
    float _636 = in.m_51.z;
    bool _638 = _488 == 0.0;
    bool _640 = !_630;
    bool _642 = _638 && _640;
    out.m_47.w = _340;
    float _644 = _570 * 6.283185482025146484375;
    float _646 = cos(_644);
    bool _648 = _492 == 0.0;
    bool _650 = _648 && _642;
    float _652 = _570 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = fma(_614, _292, _598);
    float _658 = fma(_612, _292, _600);
    float _660 = _550 * _596;
    float _662 = _550 * _618;
    float _664 = _568 * _618;
    float _666 = fma(_620, _292, _602);
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = _618 * _646;
    float _672 = _568 * _596;
    float _674 = _550 * _646;
    float _676 = _568 * _646;
    float _678 = _596 * _646;
    float _680 = _632;
    float _682 = _634;
    float _684 = _636;
    if (!_650)
    {
        float _686 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _680 = _686;
    }
    float _688 = _680;
    if (!_650)
    {
        float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _634);
        _682 = _690;
    }
    float _692 = _682;
    float _694 = _676 * _604;
    float _696 = fma(_654, _664, _660);
    float _698 = fma(_654, _660, _664);
    float _700 = -_604;
    float _702 = _654 * _700;
    float _704 = -_672;
    float _706 = fma(_654, _662, _704);
    float _708 = _674 * _604;
    float _710 = -_662;
    float _712 = fma(_654, _672, _710);
    float _714 = fma(_670, _562, _702);
    float _716 = fma(_696, _562, _694);
    float _718 = fma(_706, _562, _708);
    if (!_650)
    {
        float _720 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _684 = _720;
    }
    float _722 = _684;
    float _724 = -_582;
    float _726 = fma(_678, _724, _714);
    float _728 = -_582;
    float _730 = fma(_712, _728, _716);
    float _732 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _736 = -_582;
    float _738 = fma(_698, _736, _718);
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _742 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _744 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _734);
    float _746 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _750 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _742);
    float _752 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _744);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[10].x, _746);
    float _756 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].x, _740);
    float _758 = _750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _754);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _766 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _768 = _760 + _762;
    float _770 = _610 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _758 + _764;
    float _774 = _766 * _286;
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _768 + _776;
    float _780 = _770 * _748;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _772 + _782;
    float _786 = _778 * _778;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _790 = fma(_784, _784, _786);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = sqrt(_790);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _780;
    out.m_53.y = _774;
    float _806 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    out.m_55.x = _796;
    out.m_55.y = _802;
    out.m_55.z = _804;
    out.m_55.w = _800;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _820 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _816;
    out.m_57.y = _818;
    out.m_57.z = _822;
    float _824 = _676 * _722;
    float _826 = -_722;
    float _828 = _654 * _826;
    float _830 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _832 = _674 * _722;
    float _834 = fma(_696, _688, _824);
    float _836 = fma(_670, _688, _828);
    float _838 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[9].x, _830);
    float _840 = fma(_706, _688, _832);
    float _842 = -_692;
    float _844 = fma(_712, _842, _834);
    float _846 = -_692;
    float _848 = fma(_678, _846, _836);
    float _850 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _838);
    float _852 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _854 = _844 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _844 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = -_692;
    float _862 = fma(_698, _860, _840);
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _866 = _852 + _850;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[9].z, _864);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[10].z, _870);
    float _878 = _800;
    float _880 = _772;
    float _882 = _768;
    if (!_820)
    {
        _878 = _866;
    }
    float _884 = _878;
    bool _886 = !_820;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _798 + _892;
        float _896 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_790);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_866, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_784, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_778, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _880 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _880;
    float _930 = _882;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_59.x = _874;
    out.m_59.y = _872;
    out.m_59.z = _876;
    float _938 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _934);
    float _942 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _938);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _940);
    float _950 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _972 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _966);
    float _976 = _958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _982 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].z, _974);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _968);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _980);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _992 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _926 + _994;
    float _998 = _986 + _988;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _992);
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1006 = _928 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _930 + _1008;
    float _1012 = _998 * 0.5;
    out.m_33.x = _1002;
    out.m_61.x = _1006;
    out.m_61.y = _996;
    out.m_61.z = _1010;
    out.gl_Position.x = _990;
    out.gl_Position.y = _1000;
    out.gl_Position.z = _986;
    out.gl_Position.w = _988;
    out.m_63.z = _1012;
    out.m_63.w = _988;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1069 = as_type<float>(_98);
        out.gl_Position.z = _1069;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _90 = _120;
    }
    float _122 = _90;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1139 = as_type<float>(_136);
        out.gl_Position.z = _1139;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_37.z;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_37.x;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.y;
    float _160 = 0.0;
    float _162 = _144;
    if (!_156)
    {
        float _164 = _144 * _144;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_156)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _138 * 2.0;
    float _178 = _146 * 2.0;
    float _180 = floor(_176);
    float _182 = _158 * 2.0;
    float _184 = floor(_178);
    float _186 = floor(_182);
    bool _188 = _180 >= 0.0;
    bool _190 = isnan(_180);
    bool _192 = _188 || _190;
    bool _194 = isnan(0.0);
    bool _196 = _192 || _194;
    bool _198 = _180 > 0.0;
    int _200 = _196 ? 0 : 1;
    bool _202 = !_156;
    float _204 = _174;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _144 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _144);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _144 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _162 = _258;
    }
    float _260 = _162;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _272 = _270 != 0;
    float _274 = _142 * _116;
    bool _276 = _184 > 0.0;
    float _278 = in.m_39.x;
    int _280 = ~_200;
    int _282 = _280 + 1;
    int _284 = _282 + 1;
    float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _288 = !_264;
    int _290 = _288 ? 0 : 1;
    float _292 = in.m_41.w;
    bool _294 = _184 >= 0.0;
    bool _296 = isnan(_184);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    int _304 = _284;
    if (!_198)
    {
        int _306 = ~_200;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    float _312 = in.m_43.x;
    int _314 = abs(_290);
    float _316 = exp2(_274);
    bool _318 = _186 > 0.0;
    float _320 = in.m_43.y;
    int _322 = _302 ? 0 : 1;
    float _324 = float(_310);
    float _326 = in.m_43.z;
    float _328 = float(_314);
    bool _330 = _186 >= 0.0;
    bool _332 = isnan(_186);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = in.m_43.w;
    int _342 = ~_322;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    float _348 = _328 * _324;
    int _350 = _346;
    if (!_276)
    {
        int _352 = ~_322;
        int _354 = _352 + 1;
        _350 = _354;
    }
    int _356 = _350;
    float _358 = in.m_45.x;
    float _360 = in.m_45.y;
    float _362 = in.m_45.z;
    int _364 = _338 ? 0 : 1;
    float _366 = -_316;
    float _368 = _366 + 1.0;
    float _370 = _348 * (-2.0);
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    bool _378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _390 = 1.0 + _388;
    int _392 = _376;
    if (!_318)
    {
        int _394 = ~_364;
        int _396 = _394 + 1;
        _392 = _396;
    }
    int _398 = _392;
    float _400 = _158 + _146;
    float _402 = 1.0 / _390;
    float _404 = _400 + (-1.0);
    bool _406 = !_268;
    int _408 = _406 ? 0 : 1;
    out.m_47.x = _312;
    bool _410 = !_272;
    int _412 = _410 ? 0 : 1;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    out.m_47.y = _320;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    int _424 = abs(_408);
    float _426 = in.m_41.x;
    float _428 = in.m_41.y;
    float _430 = in.m_41.z;
    int _432 = abs(_412);
    bool _434 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    out.m_47.z = _326;
    float _444 = float(_424);
    float _446 = float(_432);
    float _448 = fma(_414, _370, _414);
    float _450 = float(_356);
    float _452 = in.m_39.y;
    float _454 = float(_398);
    float _456 = fma(_370, _358, _358);
    float _458 = _442 ? _368 : 0.0;
    float _460 = _158 + _138;
    float _462 = _444 * _450;
    float _464 = _446 * _454;
    if (_386)
    {
        float _466 = _458 * _402;
        _118 = _466;
    }
    float _468 = _118;
    float _470 = _146 + (-0.5);
    float _472 = _460 + (-1.0);
    float _474 = _462 * (-2.0);
    float _476 = _464 * (-2.0);
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _456);
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = fma(_474, _360, _360);
    float _484 = fma(_476, _362, _362);
    bool _486 = _158 > 0.5;
    float _488 = in.m_49.x;
    float _490 = in.m_49.y;
    float _492 = in.m_49.z;
    float _494 = _158 + (-0.5);
    float _496 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _138 + _146;
    float _500 = fma(_480, _474, _480);
    float _502 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _504 = fma(_448, _468, _478);
    float _506 = _428 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = _498 + (-1.0);
    float _510 = -_452;
    float _512 = _510 + 1.0;
    float _514 = fma(_500, _468, _502);
    float _516 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _518 = _146 > 0.5;
    bool _520 = _518 && _418;
    float _522 = _514 * 0.15915493667125701904296875;
    float _524 = _452;
    float _526 = _468;
    if (_422)
    {
        float _528 = _486 ? _512 : _452;
        _524 = _528;
    }
    float _530 = _524;
    float _532 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _534 = in.m_35.x;
    float _536 = in.m_35.y;
    float _538 = in.m_35.z;
    float _540 = _138 + (-0.5);
    float _542 = _504 * 0.15915493667125701904296875;
    float _544 = fma(_532, _476, _532);
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[196].z, _484);
    float _548 = _542 * 6.283185482025146484375;
    float _550 = sin(_548);
    float _552 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _488);
    float _556 = fma(_544, _468, _546);
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _492);
    float _560 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * _554;
    float _564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _490);
    float _566 = _542 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = 0.5;
    if (_418)
    {
        _572 = _278;
    }
    float _574 = _572;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _578 = _574;
    if (!_418)
    {
        _526 = _278;
    }
    float _580 = _526;
    float _582 = _560 * _564;
    float _584 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _586 = _580;
    if (_520)
    {
        float _588 = -_574;
        float _590 = _588 + 1.0;
        _578 = _590;
    }
    float _592 = _578;
    float _594 = _522 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = in.m_30.x;
    float _600 = in.m_30.y;
    float _602 = in.m_30.z;
    float _604 = _576 * _558;
    float _606 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _608 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_418)
    {
        _586 = _592;
    }
    float _610 = _586;
    float _612 = fma(_260, _536, _584);
    float _614 = fma(_260, _534, _606);
    float _616 = _522 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_260, _538, _608);
    bool _622 = _490 != 0.0;
    bool _624 = isnan(_490);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_51.x;
    float _634 = in.m_51.y;
    float _636 = in.m_51.z;
    bool _638 = _488 == 0.0;
    bool _640 = !_630;
    bool _642 = _638 && _640;
    out.m_47.w = _340;
    float _644 = _570 * 6.283185482025146484375;
    float _646 = cos(_644);
    bool _648 = _492 == 0.0;
    bool _650 = _648 && _642;
    float _652 = _570 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = fma(_614, _292, _598);
    float _658 = fma(_612, _292, _600);
    float _660 = _550 * _596;
    float _662 = _550 * _618;
    float _664 = _568 * _618;
    float _666 = fma(_620, _292, _602);
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = _618 * _646;
    float _672 = _568 * _596;
    float _674 = _550 * _646;
    float _676 = _568 * _646;
    float _678 = _596 * _646;
    float _680 = _632;
    float _682 = _634;
    float _684 = _636;
    if (!_650)
    {
        float _686 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _680 = _686;
    }
    float _688 = _680;
    if (!_650)
    {
        float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _634);
        _682 = _690;
    }
    float _692 = _682;
    float _694 = _676 * _604;
    float _696 = fma(_654, _664, _660);
    float _698 = fma(_654, _660, _664);
    float _700 = -_604;
    float _702 = _654 * _700;
    float _704 = -_672;
    float _706 = fma(_654, _662, _704);
    float _708 = _674 * _604;
    float _710 = -_662;
    float _712 = fma(_654, _672, _710);
    float _714 = fma(_670, _562, _702);
    float _716 = fma(_696, _562, _694);
    float _718 = fma(_706, _562, _708);
    if (!_650)
    {
        float _720 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _684 = _720;
    }
    float _722 = _684;
    float _724 = -_582;
    float _726 = fma(_678, _724, _714);
    float _728 = -_582;
    float _730 = fma(_712, _728, _716);
    float _732 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _734 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _736 = -_582;
    float _738 = fma(_698, _736, _718);
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _742 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _732);
    float _744 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _734);
    float _746 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _750 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _742);
    float _752 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _744);
    float _754 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[10].x, _746);
    float _756 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].x, _740);
    float _758 = _750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _754);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _756);
    float _766 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _768 = _760 + _762;
    float _770 = _610 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _772 = _758 + _764;
    float _774 = _766 * _286;
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _768 + _776;
    float _780 = _770 * _748;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _772 + _782;
    float _786 = _778 * _778;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _790 = fma(_784, _784, _786);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = sqrt(_790);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _780;
    out.m_53.y = _774;
    float _806 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    out.m_55.x = _796;
    out.m_55.y = _802;
    out.m_55.z = _804;
    out.m_55.w = _800;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _806);
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _820 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _822 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _816;
    out.m_57.y = _818;
    out.m_57.z = _822;
    float _824 = _676 * _722;
    float _826 = -_722;
    float _828 = _654 * _826;
    float _830 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _832 = _674 * _722;
    float _834 = fma(_696, _688, _824);
    float _836 = fma(_670, _688, _828);
    float _838 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[9].x, _830);
    float _840 = fma(_706, _688, _832);
    float _842 = -_692;
    float _844 = fma(_712, _842, _834);
    float _846 = -_692;
    float _848 = fma(_678, _846, _836);
    float _850 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _838);
    float _852 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _854 = _844 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _844 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = -_692;
    float _862 = fma(_698, _860, _840);
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _866 = _852 + _850;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[9].z, _864);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c10)._m0[10].z, _870);
    float _878 = _800;
    float _880 = _772;
    float _882 = _768;
    if (!_820)
    {
        _878 = _866;
    }
    float _884 = _878;
    bool _886 = !_820;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _798 + _892;
        float _896 = _866 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_790);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_866, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_784, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_778, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _880 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _880;
    float _930 = _882;
    float _932 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_59.x = _874;
    out.m_59.y = _872;
    out.m_59.z = _876;
    float _938 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _934);
    float _942 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _938);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _940);
    float _950 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _962 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _972 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _966);
    float _976 = _958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _982 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].z, _974);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _968);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _980);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _992 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _926 + _994;
    float _998 = _986 + _988;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _992);
    float _1002 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1006 = _928 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _930 + _1008;
    float _1012 = _998 * 0.5;
    out.m_33.x = _1002;
    out.m_61.x = _1006;
    out.m_61.y = _996;
    out.m_61.z = _1010;
    out.gl_Position.x = _990;
    out.gl_Position.y = _1000;
    out.gl_Position.z = _986;
    out.gl_Position.w = _988;
    out.m_63.z = _1012;
    out.m_63.w = _988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

