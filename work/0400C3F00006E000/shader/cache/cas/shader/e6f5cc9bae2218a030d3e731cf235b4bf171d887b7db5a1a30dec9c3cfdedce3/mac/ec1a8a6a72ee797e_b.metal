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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_67 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_43 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_32 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_39 [[attribute(8)]];
    float4 m_45 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
    float4 m_57 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = in.m_32.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_110);
        out.gl_Position.z = _1714;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    bool _134 = _130;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    int _142 = _140;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_140);
        out.gl_Position.z = _1772;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_39.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_39.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_39.w;
    float _170 = _144 * 2.0;
    bool _172 = _144 > 0.5;
    float _174 = in.m_43.x;
    float _176 = in.m_43.y;
    float _178 = in.m_43.z;
    float _180 = 0.0;
    int _182 = as_type<int>(_170);
    float _184 = _146;
    float _186 = _144;
    if (!_162)
    {
        _180 = _144;
    }
    float _188 = _180;
    float _190 = _148 * 2.0;
    float _192 = floor(_170);
    float _194 = _188;
    if (_152)
    {
        bool _196 = _148 > 0.5;
        _134 = _196;
    }
    bool _198 = _134;
    float _200 = in.m_45.x;
    float _202 = in.m_45.y;
    float _204 = in.m_45.z;
    float _206 = _158 * 2.0;
    float _208 = 0.0;
    if (!_162)
    {
        _208 = _158;
    }
    float _210 = _208;
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = _210;
    float _220 = _164;
    if (_156)
    {
        float _222 = -_164;
        float _224 = _222 + 1.0;
        _142 = as_type<int>(_224);
    }
    int _226 = _142;
    float _228 = floor(_190);
    if (_152)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _182 = as_type<int>(_232);
    }
    int _234 = _182;
    float _236 = 0.0;
    if (!_152)
    {
        _236 = _164;
    }
    float _238 = _236;
    float _240 = -_166;
    float _242 = _240 + 1.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _166;
    if (!_156)
    {
        _244 = _164;
    }
    float _250 = _244;
    float _252 = _250;
    if (_152)
    {
        float _254 = _198 ? as_type<float>(_234) : _164;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = floor(_206);
    bool _260 = _192 >= 0.0;
    bool _262 = isnan(_192);
    bool _264 = _260 || _262;
    bool _266 = isnan(0.0);
    bool _268 = _264 || _266;
    if (_156)
    {
        float _270 = _172 ? as_type<float>(_226) : _164;
        _252 = _270;
    }
    float _272 = _252;
    int _274 = _268 ? 0 : 1;
    bool _276 = _192 > 0.0;
    bool _278 = _228 >= 0.0;
    bool _280 = isnan(_228);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = _228 > 0.0;
    float _290 = in.m_49.x;
    float _292 = in.m_49.y;
    float _294 = in.m_49.z;
    int _296 = _286 ? 0 : 1;
    bool _298 = _258 > 0.0;
    bool _300 = _258 >= 0.0;
    bool _302 = isnan(_258);
    bool _304 = _300 || _302;
    bool _306 = isnan(0.0);
    bool _308 = _304 || _306;
    float _310 = in.m_51.x;
    float _312 = in.m_51.y;
    float _314 = in.m_51.z;
    bool _316 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _320 = _316 || _318;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    int _326 = ~_296;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _308 ? 0 : 1;
    int _334 = _330;
    if (!_288)
    {
        int _336 = ~_296;
        int _338 = _336 + 1;
        _334 = _338;
    }
    int _340 = _334;
    bool _342 = _158 > 0.5;
    int _344 = ~_274;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = 0.0;
    int _352 = _348;
    if (!_162)
    {
        _350 = _148;
    }
    float _354 = _350;
    float _356 = 0.0;
    float _358 = _354;
    if (!_324)
    {
        float _360 = _146 * _146;
        float _362 = _360 * 0.5;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    float _368 = _364;
    if (!_162)
    {
        _366 = _210;
    }
    float _370 = _366;
    float _372 = 0.0;
    float _374 = _370;
    if (!_162)
    {
        _372 = _188;
    }
    float _376 = _372;
    float _378 = _376;
    if (!_324)
    {
        float _380 = _364 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _380;
    }
    float _382 = _368;
    float _384 = 0.0;
    float _386 = _382;
    if (_162)
    {
        _384 = _158;
    }
    float _388 = _384;
    float _390 = 0.0;
    float _392 = _388;
    if (_162)
    {
        _390 = _148;
    }
    float _394 = _390;
    float _396 = 0.0;
    float _398 = _394;
    if (_162)
    {
        _396 = _144;
    }
    float _400 = _396;
    int _402 = ~_332;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    float _408 = _400;
    int _410 = _406;
    if (!_276)
    {
        int _412 = ~_274;
        int _414 = _412 + 1;
        _352 = _414;
    }
    int _416 = _352;
    if (_162)
    {
        _374 = _148;
    }
    float _418 = _374;
    if (_162)
    {
        _218 = _148;
    }
    float _420 = _218;
    if (!_162)
    {
        _392 = _148;
    }
    float _422 = _392;
    if (_162)
    {
        _358 = _144;
    }
    float _424 = _358;
    if (_162)
    {
        _378 = _158;
    }
    float _426 = _378;
    if (_162)
    {
        _194 = _158;
    }
    float _428 = _194;
    if (!_162)
    {
        _398 = _144;
    }
    float _430 = _398;
    if (!_162)
    {
        _408 = _158;
    }
    float _432 = _408;
    if (!_298)
    {
        int _434 = ~_332;
        int _436 = _434 + 1;
        _410 = _436;
    }
    int _438 = _410;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    int _444 = _342 ? as_type<int>(_242) : as_type<int>(_166);
    bool _446 = !_324;
    float _448 = _310;
    float _450 = _290;
    float _452 = _174;
    if (!_446)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _146 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _146);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _482;
    }
    float _484 = _386;
    bool _486 = !_324;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _146 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _184 = _506;
    }
    float _508 = _184;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _442 ? as_type<float>(_444) : _166;
    float _526 = _292 * _292;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _530 = _528 != 0;
    float _532 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _536 = _534 != 0;
    float _538 = fma(_312, _312, _526);
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = _290 * _290;
    float _546 = fma(_176, _176, _538);
    bool _548 = !_512;
    int _550 = _548 ? 0 : 1;
    float _552 = fma(_310, _310, _544);
    bool _554 = _168 > 0.5;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = fma(_174, _174, _552);
    float _560 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _564 = sqrt(_558);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _572 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _574 = fma(_562, -2.0, _566);
    float _576 = _158 + _148;
    float _578 = sqrt(_546);
    float _580 = -_556;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    bool _586 = !_520;
    int _588 = _586 ? 0 : 1;
    float _590 = _576 + (-1.0);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = !_516;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_45.w;
    float _602 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[84].z, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 > 0.0;
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _610 = in.m_30.x;
    float _612 = in.m_30.y;
    float _614 = in.m_30.z;
    bool _616 = _578 > 0.0;
    float _618 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _620 = in.m_32.x;
    float _622 = in.m_32.y;
    float _624 = in.m_32.z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _628 = _426 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _632 = -_626;
    float _634 = fma(_618, 2.0, _632);
    float _636 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    float _642 = fma(_628, -2.0, _630);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _646 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _648 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _650 = -_644;
    float _652 = fma(_636, 2.0, _650);
    float _654 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _656 = abs(_598);
    float _658 = -_94;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[81].x, _634);
    float _662 = float(_438);
    float _664 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _666 = float(_340);
    float _668 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[84].x, _602);
    float _670 = -_94;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _652);
    float _674 = float(_416);
    float _676 = fma(_508, _620, _646);
    float _678 = fma(_508, _622, _648);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _682 = _422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _684 = fma(_508, _624, _654);
    float _686 = fma(_678, _600, _612);
    float _688 = float(_656);
    float _690 = fma(_682, -2.0, _680);
    float _692 = fma(_676, _600, _610);
    float _694 = fma(_684, _600, _614);
    float _696 = _640 * _94;
    float _698 = in.m_51.w;
    float _700 = _686 * _312;
    float _702 = _686 * _292;
    float _704 = _686 * _176;
    float _706 = in.m_49.w;
    float _708 = exp2(_696);
    float _710 = fma(_692, _310, _700);
    float _712 = fma(_692, _290, _702);
    float _714 = fma(_692, _174, _704);
    int _716 = abs(_550);
    float _718 = in.m_53.x;
    float _720 = in.m_53.y;
    float _722 = in.m_53.z;
    float _724 = fma(_694, _314, _710);
    int _726 = abs(_588);
    float _728 = fma(_694, _294, _712);
    float _730 = float(_716);
    float _732 = in.m_43.w;
    float _734 = float(_726);
    float _736 = _688 * _666;
    float _738 = fma(_694, _178, _714);
    float _740 = _730 * _674;
    float _742 = -_708;
    float _744 = _742 + 1.0;
    float _746 = _734 * _662;
    float _748 = _740 * (-2.0);
    float _750 = _724 + _698;
    float _752 = _746 * (-2.0);
    float _754 = _728 + _706;
    int _756 = _172 ? as_type<int>(_242) : as_type<int>(_166);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _760 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _754 + _770;
    float _774 = fma(_752, _722, _722);
    float _776 = _768 ? _744 : 0.0;
    float _778 = _294 * _294;
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _792 = 1.0 + _790;
    float _794 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _758);
    float _796 = fma(_314, _314, _778);
    float _798 = 1.0 / _792;
    float _800 = fma(_178, _178, _796);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _804 = _738 + _732;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _808 = _772 * _772;
    float _810 = sqrt(_800);
    float _812 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _814 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _608);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _750 + _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _826 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _802);
    float _828 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _804 + _830;
    float _834 = fma(_818, _818, _808);
    float _836 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[89].z, _822);
    float _840 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _824);
    float _842 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].z, _826);
    float _844 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _846 = fma(_832, _832, _834);
    float _848 = -_94;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    float _852 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].w, _840);
    float _854 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _856 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _642);
    float _858 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[89].x, _838);
    float _860 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[86].y, _690);
    if (_788)
    {
        float _862 = _776 * _798;
        _102 = _862;
    }
    float _864 = _102;
    bool _866 = _810 > 0.0;
    float _868 = rsqrt(_846);
    float _870 = _144 + _148;
    float _872 = fma(_748, _718, _718);
    float _874 = _148 + (-0.5);
    float _876 = _158 + _144;
    float _878 = fma(_604, _748, _604);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    float _882 = _876 + (-1.0);
    float _884 = _870 + (-1.0);
    float _886 = _736 * (-2.0);
    float _888 = fma(_878, _864, _880);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _720, _720);
    float _898 = _888 * 0.15915493667125701904296875;
    float _900 = _158 + (-0.5);
    float _902 = _772 * _868;
    float _904 = fma(_892, _886, _892);
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _896);
    float _910 = _818 * _868;
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _916 = _536 ? as_type<float>(_756) : _166;
    out.m_55.y = _166;
    float _918 = -_910;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _922 = _914 * _914;
    bool _924 = _158 > 0.5;
    bool _926 = _924 && _530;
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _932 = fma(_920, _920, _922);
    float _934 = fma(_904, _864, _908);
    float _936 = _864;
    if (_542)
    {
        float _938 = _554 ? _242 : _166;
        _248 = _938;
    }
    float _940 = _248;
    float _942 = _832 * _868;
    float _944 = fma(_928, _524, -0.5);
    float _946 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _948 = _144 + (-0.5);
    float _950 = -_942;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _954 = fma(_894, _752, _894);
    float _956 = fma(_946, _256, -0.5);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _960 = fma(_952, _952, _932);
    out.m_55.x = _164;
    float _962 = fma(_844, _956, _850);
    float _964 = _956;
    if (!_530)
    {
        _964 = _164;
    }
    float _966 = _964;
    float _968 = _934 * 0.15915493667125701904296875;
    float _970 = fma(_954, _864, _958);
    float _972 = sqrt(_960);
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _976 = -_664;
    float _978 = fma(_812, _944, _976);
    float _980 = _966;
    if (_926)
    {
        float _982 = -_164;
        float _984 = _982 + 1.0;
        _220 = _984;
    }
    float _986 = _220;
    float _988 = _970 * 0.15915493667125701904296875;
    float _990 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _992 = _986;
    if (!_606)
    {
        _186 = 0.0;
    }
    float _994 = _186;
    float _996 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _998 = _558;
    float _1000 = _994;
    float _1002 = _996;
    if (_606)
    {
        float _1004 = rsqrt(_558);
        _998 = _1004;
    }
    float _1006 = _998;
    if (_530)
    {
        _980 = _986;
    }
    float _1008 = _980;
    float _1010 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_606)
    {
        _936 = 0.0;
    }
    float _1012 = _936;
    float _1014 = _668 * (-0.15915493667125701904296875);
    float _1016 = _1012;
    if (!_606)
    {
        _992 = 0.0;
    }
    float _1018 = _992;
    float _1020 = fma(_974, _1008, -0.5);
    float _1022 = _858 * (-0.15915493667125701904296875);
    float _1024 = _546;
    float _1026 = _1018;
    if (_616)
    {
        float _1028 = rsqrt(_546);
        _1024 = _1028;
    }
    float _1030 = _1024;
    float _1032 = _868 * _972;
    float _1034 = _990 * _1032;
    float _1036 = _800;
    if (_866)
    {
        float _1038 = rsqrt(_800);
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_606)
    {
        float _1042 = _1006 * _310;
        _1000 = _1042;
    }
    float _1044 = _1000;
    if (_606)
    {
        float _1046 = _1006 * _290;
        _1016 = _1046;
    }
    float _1048 = _1016;
    float _1050 = _1048;
    if (_606)
    {
        float _1052 = _1006 * _174;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (!_616)
    {
        _448 = 0.0;
    }
    float _1056 = _448;
    float _1058 = _1034 * _570;
    float _1060 = _1056;
    if (!_866)
    {
        _450 = 0.0;
    }
    float _1062 = _450;
    float _1064 = _968 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1062;
    if (!_616)
    {
        _452 = 0.0;
    }
    float _1070 = _452;
    float _1072 = _1070;
    if (_616)
    {
        float _1074 = _1030 * _176;
        _1060 = _1074;
    }
    float _1076 = _1060;
    if (_616)
    {
        float _1078 = _1030 * _312;
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _996 * _1032;
    float _1084 = _1010 * _1032;
    if (!_866)
    {
        _1002 = 0.0;
    }
    float _1086 = _1002;
    float _1088 = _898 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = _1086;
    if (_866)
    {
        float _1094 = _1040 * _314;
        _1068 = _1094;
    }
    float _1096 = _1068;
    float _1098 = _1082 * _568;
    float _1100 = _1084 * _584;
    if (_866)
    {
        float _1102 = _1040 * _178;
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = in.m_57.w;
    float _1108 = _898 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _968 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = _1090 * _1066;
    float _1118 = _988 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1110 * _1066;
    out.m_59.w = _1106;
    float _1124 = _988 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1110 * _1114;
    float _1130 = _1120 * _1058;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1134 = _1110 * _1130;
    float _1136 = fma(_1126, _1128, _1116);
    float _1138 = fma(_1126, _1116, _1128);
    float _1140 = _1066 * _1120;
    float _1142 = _1114 * _1120;
    float _1144 = _1090 * _1114;
    float _1146 = fma(_1136, _1098, _1134);
    float _1148 = -_1058;
    float _1150 = _1126 * _1148;
    float _1152 = _1090 * _1130;
    float _1154 = -_1144;
    float _1156 = fma(_1126, _1122, _1154);
    float _1158 = -_1122;
    float _1160 = fma(_1126, _1144, _1158);
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1164 = fma(_1142, _1098, _1150);
    float _1166 = fma(_1156, _1100, _1146);
    float _1168 = fma(_1160, _1098, _1152);
    float _1170 = -_902;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1174 = fma(_1140, _1100, _1164);
    float _1176 = _1166 * _1080;
    float _1178 = _1166 * _1076;
    float _1180 = _1014 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_1138, _1100, _1168);
    float _1186 = fma(_1174, _1044, _1176);
    float _1188 = fma(_1174, _1054, _1178);
    float _1190 = -_910;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1194 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1196 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1184, _1104, _1188);
    float _1200 = _1014 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = -_942;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1194);
    float _1210 = fma(_1196, _940, -0.5);
    float _1212 = fma(_1184, _1096, _1186);
    float _1214 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1216 = _804 + _1198;
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1208);
    float _1220 = _750 + _1212;
    float _1222 = _1182 * _1210;
    float _1224 = fma(_1214, _272, -0.5);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1234 = _1178;
    float _1236 = _1216;
    float _1238 = _1220;
    float _1240 = _1228;
    if (!_616)
    {
        _1234 = 0.0;
    }
    float _1242 = _1234;
    float _1244 = _1242;
    if (_616)
    {
        float _1246 = _1030 * _292;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = _1202 * _1210;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1254 = _1220 + _1252;
    float _1256 = _1228 * _1228;
    float _1258 = 1.0 / _1230;
    float _1260 = fma(_1182, _1224, _1250);
    float _1262 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1232);
    float _1264 = -_1222;
    float _1266 = fma(_1202, _1224, _1264);
    float _1268 = fma(_1254, _1254, _1256);
    float _1270 = -_856;
    float _1272 = fma(_854, _1260, _1270);
    float _1274 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1278 = fma(_814, _1266, _660);
    float _1280 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1282 = _962 + 0.5;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1286 = _978 + 0.5;
    float _1288 = _1280 + _1230;
    float _1290 = _1278 + 0.5;
    float _1292 = sqrt(_1268);
    float _1294 = _1272 + 0.5;
    float _1296 = _1288 * _1258;
    float _1298 = _1296 * 0.5;
    out.m_61.w = _1284;
    float _1300 = _1166 * _1248;
    float _1302 = _1256;
    if (!_866)
    {
        _1302 = 0.0;
    }
    float _1304 = _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = _1022 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    out.m_63.x = _1282;
    out.m_63.y = _1286;
    out.m_63.z = _1290;
    out.m_63.w = _1294;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1316 = _1304;
    if (_866)
    {
        float _1318 = _1040 * _294;
        _1316 = _1318;
    }
    float _1320 = _1316;
    float _1322 = fma(_1174, _1048, _1300);
    bool _1324 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1332 = _1328 || _1330;
    float _1334 = fma(_916, _1314, -0.5);
    float _1336 = _1022 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1184, _1320, _1322);
    float _1344 = _754 + _1342;
    float _1346 = 1.0 / _1308;
    float _1348 = _1312 * _1334;
    float _1350 = _1338 * _1334;
    float _1352 = -_1348;
    float _1354 = fma(_1338, _1020, _1352);
    float _1356 = fma(_1312, _1020, _1350);
    float _1358 = fma(_842, _1354, _672);
    float _1360 = _1354;
    if (!_1340)
    {
        _1360 = _1344;
    }
    float _1362 = _1360;
    float _1364 = -_860;
    float _1366 = fma(_852, _1356, _1364);
    bool _1368 = !_1340;
    float _1370 = _1362;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1292 + _1374;
        float _1378 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = rsqrt(_1268);
        float _1382 = _1376 * _1372;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1344, _1388, _1396);
        float _1402 = _1380 * _1398;
        float _1404 = fma(_1254, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1228, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1050 = _1402;
        _1370 = _1400;
        _1236 = _1406;
        _1238 = _1404;
    }
    float _1408 = _1050;
    float _1410 = _1370;
    float _1412 = _1236;
    float _1414 = _1238;
    float _1416 = _1408;
    if (_1332)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    float _1420 = _1358 + 0.5;
    float _1422 = _1418;
    if (_1332)
    {
        _1240 = 1.0;
    }
    float _1424 = _1240;
    float _1426 = _1366 + 0.5;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1346 * _1428;
    float _1432 = _1424;
    if (!_1332)
    {
        float _1434 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 0.15915493667125701904296875;
        float _1446 = _1436 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = 1.0 / _1442;
        float _1452 = _1444 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        float _1456 = _1448 * _1450;
        float _1458 = _1444 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1464 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1462;
        float _1466 = _1454 * _1456;
        float _1468 = 1.0 / _1464;
        float _1470 = 1.0 / _1466;
        float _1472 = _1460 * _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1476 = fma(_1430, _1472, _1474);
        float _1478 = _1476 * _1468;
        float _1480 = precise::clamp(_1478, 0.0, 1.0);
        _1422 = _1480;
    }
    float _1482 = _1422;
    if (!_1332)
    {
        float _1484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = _1484 * 0.15915493667125701904296875;
        float _1490 = _1486 * 0.15915493667125701904296875;
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = 1.0 / _1494;
        float _1502 = _1490 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1498 * _1500;
        float _1508 = _1490 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1512;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = 1.0 / _1518;
        float _1522 = _1510 * _1514;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = fma(_1430, _1522, _1524);
        float _1528 = _1526 * _1520;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        float _1532 = -_1530;
        float _1534 = _1532 + 1.0;
        _1432 = _1534;
    }
    float _1536 = _1432;
    bool _1538 = _1482 > 0.0;
    bool _1540 = isnan(_1482);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = -_902;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1552 = _1482 * _1536;
    float _1554 = -_942;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    bool _1558 = _1536 <= 0.0;
    bool _1560 = !_1546;
    bool _1562 = _1558 || _1560;
    float _1564 = -_910;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1568 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1570 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1572 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1568);
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1570);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1572);
    out.m_65.x = _1420;
    out.m_65.y = _1426;
    float _1582 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1576);
    float _1584 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1586 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1588 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1586);
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1604);
    float _1614 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1606);
    float _1618 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1620 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1610);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1624 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1622);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1636 = _1628 + _1630;
    float _1638 = _1632 + _1630;
    float _1640 = _1630 * 0.5;
    float _1642 = _1636 * 0.5;
    float _1644 = _1638 * 0.5;
    float _1646 = fma(_1626, -0.5, _1640);
    out.m_67.x = _1566;
    out.m_67.y = _1550;
    out.m_67.z = _1556;
    out.m_37.x = _1634;
    out.gl_Position.x = _1628;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1630;
    out.m_69.x = _1642;
    out.m_69.y = _1646;
    out.m_69.z = _1644;
    out.m_69.w = _1630;
    if (!_1562)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1648;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = in.m_32.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_110);
        out.gl_Position.z = _1714;
    }
    if (!_98)
    {
        return out;
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    bool _134 = _130;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    int _142 = _140;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_140);
        out.gl_Position.z = _1772;
    }
    if (_130)
    {
        return out;
    }
    float _144 = in.m_39.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_39.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_39.w;
    float _170 = _144 * 2.0;
    bool _172 = _144 > 0.5;
    float _174 = in.m_43.x;
    float _176 = in.m_43.y;
    float _178 = in.m_43.z;
    float _180 = 0.0;
    int _182 = as_type<int>(_170);
    float _184 = _146;
    float _186 = _144;
    if (!_162)
    {
        _180 = _144;
    }
    float _188 = _180;
    float _190 = _148 * 2.0;
    float _192 = floor(_170);
    float _194 = _188;
    if (_152)
    {
        bool _196 = _148 > 0.5;
        _134 = _196;
    }
    bool _198 = _134;
    float _200 = in.m_45.x;
    float _202 = in.m_45.y;
    float _204 = in.m_45.z;
    float _206 = _158 * 2.0;
    float _208 = 0.0;
    if (!_162)
    {
        _208 = _158;
    }
    float _210 = _208;
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = _210;
    float _220 = _164;
    if (_156)
    {
        float _222 = -_164;
        float _224 = _222 + 1.0;
        _142 = as_type<int>(_224);
    }
    int _226 = _142;
    float _228 = floor(_190);
    if (_152)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _182 = as_type<int>(_232);
    }
    int _234 = _182;
    float _236 = 0.0;
    if (!_152)
    {
        _236 = _164;
    }
    float _238 = _236;
    float _240 = -_166;
    float _242 = _240 + 1.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _166;
    if (!_156)
    {
        _244 = _164;
    }
    float _250 = _244;
    float _252 = _250;
    if (_152)
    {
        float _254 = _198 ? as_type<float>(_234) : _164;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = floor(_206);
    bool _260 = _192 >= 0.0;
    bool _262 = isnan(_192);
    bool _264 = _260 || _262;
    bool _266 = isnan(0.0);
    bool _268 = _264 || _266;
    if (_156)
    {
        float _270 = _172 ? as_type<float>(_226) : _164;
        _252 = _270;
    }
    float _272 = _252;
    int _274 = _268 ? 0 : 1;
    bool _276 = _192 > 0.0;
    bool _278 = _228 >= 0.0;
    bool _280 = isnan(_228);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = _228 > 0.0;
    float _290 = in.m_49.x;
    float _292 = in.m_49.y;
    float _294 = in.m_49.z;
    int _296 = _286 ? 0 : 1;
    bool _298 = _258 > 0.0;
    bool _300 = _258 >= 0.0;
    bool _302 = isnan(_258);
    bool _304 = _300 || _302;
    bool _306 = isnan(0.0);
    bool _308 = _304 || _306;
    float _310 = in.m_51.x;
    float _312 = in.m_51.y;
    float _314 = in.m_51.z;
    bool _316 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _320 = _316 || _318;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    int _326 = ~_296;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _308 ? 0 : 1;
    int _334 = _330;
    if (!_288)
    {
        int _336 = ~_296;
        int _338 = _336 + 1;
        _334 = _338;
    }
    int _340 = _334;
    bool _342 = _158 > 0.5;
    int _344 = ~_274;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = 0.0;
    int _352 = _348;
    if (!_162)
    {
        _350 = _148;
    }
    float _354 = _350;
    float _356 = 0.0;
    float _358 = _354;
    if (!_324)
    {
        float _360 = _146 * _146;
        float _362 = _360 * 0.5;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    float _368 = _364;
    if (!_162)
    {
        _366 = _210;
    }
    float _370 = _366;
    float _372 = 0.0;
    float _374 = _370;
    if (!_162)
    {
        _372 = _188;
    }
    float _376 = _372;
    float _378 = _376;
    if (!_324)
    {
        float _380 = _364 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _380;
    }
    float _382 = _368;
    float _384 = 0.0;
    float _386 = _382;
    if (_162)
    {
        _384 = _158;
    }
    float _388 = _384;
    float _390 = 0.0;
    float _392 = _388;
    if (_162)
    {
        _390 = _148;
    }
    float _394 = _390;
    float _396 = 0.0;
    float _398 = _394;
    if (_162)
    {
        _396 = _144;
    }
    float _400 = _396;
    int _402 = ~_332;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    float _408 = _400;
    int _410 = _406;
    if (!_276)
    {
        int _412 = ~_274;
        int _414 = _412 + 1;
        _352 = _414;
    }
    int _416 = _352;
    if (_162)
    {
        _374 = _148;
    }
    float _418 = _374;
    if (_162)
    {
        _218 = _148;
    }
    float _420 = _218;
    if (!_162)
    {
        _392 = _148;
    }
    float _422 = _392;
    if (_162)
    {
        _358 = _144;
    }
    float _424 = _358;
    if (_162)
    {
        _378 = _158;
    }
    float _426 = _378;
    if (_162)
    {
        _194 = _158;
    }
    float _428 = _194;
    if (!_162)
    {
        _398 = _144;
    }
    float _430 = _398;
    if (!_162)
    {
        _408 = _158;
    }
    float _432 = _408;
    if (!_298)
    {
        int _434 = ~_332;
        int _436 = _434 + 1;
        _410 = _436;
    }
    int _438 = _410;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    int _444 = _342 ? as_type<int>(_242) : as_type<int>(_166);
    bool _446 = !_324;
    float _448 = _310;
    float _450 = _290;
    float _452 = _174;
    if (!_446)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _146 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _146);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _482;
    }
    float _484 = _386;
    bool _486 = !_324;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _146 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _184 = _506;
    }
    float _508 = _184;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _442 ? as_type<float>(_444) : _166;
    float _526 = _292 * _292;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _530 = _528 != 0;
    float _532 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _536 = _534 != 0;
    float _538 = fma(_312, _312, _526);
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = _290 * _290;
    float _546 = fma(_176, _176, _538);
    bool _548 = !_512;
    int _550 = _548 ? 0 : 1;
    float _552 = fma(_310, _310, _544);
    bool _554 = _168 > 0.5;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = fma(_174, _174, _552);
    float _560 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _564 = sqrt(_558);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _572 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _574 = fma(_562, -2.0, _566);
    float _576 = _158 + _148;
    float _578 = sqrt(_546);
    float _580 = -_556;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    bool _586 = !_520;
    int _588 = _586 ? 0 : 1;
    float _590 = _576 + (-1.0);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = !_516;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_45.w;
    float _602 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[84].z, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 > 0.0;
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _610 = in.m_30.x;
    float _612 = in.m_30.y;
    float _614 = in.m_30.z;
    bool _616 = _578 > 0.0;
    float _618 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _620 = in.m_32.x;
    float _622 = in.m_32.y;
    float _624 = in.m_32.z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _628 = _426 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _632 = -_626;
    float _634 = fma(_618, 2.0, _632);
    float _636 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    float _642 = fma(_628, -2.0, _630);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _646 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _648 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _650 = -_644;
    float _652 = fma(_636, 2.0, _650);
    float _654 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _656 = abs(_598);
    float _658 = -_94;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[81].x, _634);
    float _662 = float(_438);
    float _664 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _666 = float(_340);
    float _668 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[84].x, _602);
    float _670 = -_94;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _652);
    float _674 = float(_416);
    float _676 = fma(_508, _620, _646);
    float _678 = fma(_508, _622, _648);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _682 = _422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _684 = fma(_508, _624, _654);
    float _686 = fma(_678, _600, _612);
    float _688 = float(_656);
    float _690 = fma(_682, -2.0, _680);
    float _692 = fma(_676, _600, _610);
    float _694 = fma(_684, _600, _614);
    float _696 = _640 * _94;
    float _698 = in.m_51.w;
    float _700 = _686 * _312;
    float _702 = _686 * _292;
    float _704 = _686 * _176;
    float _706 = in.m_49.w;
    float _708 = exp2(_696);
    float _710 = fma(_692, _310, _700);
    float _712 = fma(_692, _290, _702);
    float _714 = fma(_692, _174, _704);
    int _716 = abs(_550);
    float _718 = in.m_53.x;
    float _720 = in.m_53.y;
    float _722 = in.m_53.z;
    float _724 = fma(_694, _314, _710);
    int _726 = abs(_588);
    float _728 = fma(_694, _294, _712);
    float _730 = float(_716);
    float _732 = in.m_43.w;
    float _734 = float(_726);
    float _736 = _688 * _666;
    float _738 = fma(_694, _178, _714);
    float _740 = _730 * _674;
    float _742 = -_708;
    float _744 = _742 + 1.0;
    float _746 = _734 * _662;
    float _748 = _740 * (-2.0);
    float _750 = _724 + _698;
    float _752 = _746 * (-2.0);
    float _754 = _728 + _706;
    int _756 = _172 ? as_type<int>(_242) : as_type<int>(_166);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _760 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _754 + _770;
    float _774 = fma(_752, _722, _722);
    float _776 = _768 ? _744 : 0.0;
    float _778 = _294 * _294;
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _792 = 1.0 + _790;
    float _794 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _758);
    float _796 = fma(_314, _314, _778);
    float _798 = 1.0 / _792;
    float _800 = fma(_178, _178, _796);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _804 = _738 + _732;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _808 = _772 * _772;
    float _810 = sqrt(_800);
    float _812 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _814 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _608);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _750 + _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _826 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _802);
    float _828 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _804 + _830;
    float _834 = fma(_818, _818, _808);
    float _836 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[89].z, _822);
    float _840 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _824);
    float _842 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].z, _826);
    float _844 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _846 = fma(_832, _832, _834);
    float _848 = -_94;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    float _852 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].w, _840);
    float _854 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _856 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _642);
    float _858 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[89].x, _838);
    float _860 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[86].y, _690);
    if (_788)
    {
        float _862 = _776 * _798;
        _102 = _862;
    }
    float _864 = _102;
    bool _866 = _810 > 0.0;
    float _868 = rsqrt(_846);
    float _870 = _144 + _148;
    float _872 = fma(_748, _718, _718);
    float _874 = _148 + (-0.5);
    float _876 = _158 + _144;
    float _878 = fma(_604, _748, _604);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    float _882 = _876 + (-1.0);
    float _884 = _870 + (-1.0);
    float _886 = _736 * (-2.0);
    float _888 = fma(_878, _864, _880);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _720, _720);
    float _898 = _888 * 0.15915493667125701904296875;
    float _900 = _158 + (-0.5);
    float _902 = _772 * _868;
    float _904 = fma(_892, _886, _892);
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _896);
    float _910 = _818 * _868;
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _916 = _536 ? as_type<float>(_756) : _166;
    out.m_55.y = _166;
    float _918 = -_910;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _922 = _914 * _914;
    bool _924 = _158 > 0.5;
    bool _926 = _924 && _530;
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _932 = fma(_920, _920, _922);
    float _934 = fma(_904, _864, _908);
    float _936 = _864;
    if (_542)
    {
        float _938 = _554 ? _242 : _166;
        _248 = _938;
    }
    float _940 = _248;
    float _942 = _832 * _868;
    float _944 = fma(_928, _524, -0.5);
    float _946 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _948 = _144 + (-0.5);
    float _950 = -_942;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _954 = fma(_894, _752, _894);
    float _956 = fma(_946, _256, -0.5);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _960 = fma(_952, _952, _932);
    out.m_55.x = _164;
    float _962 = fma(_844, _956, _850);
    float _964 = _956;
    if (!_530)
    {
        _964 = _164;
    }
    float _966 = _964;
    float _968 = _934 * 0.15915493667125701904296875;
    float _970 = fma(_954, _864, _958);
    float _972 = sqrt(_960);
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _976 = -_664;
    float _978 = fma(_812, _944, _976);
    float _980 = _966;
    if (_926)
    {
        float _982 = -_164;
        float _984 = _982 + 1.0;
        _220 = _984;
    }
    float _986 = _220;
    float _988 = _970 * 0.15915493667125701904296875;
    float _990 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _992 = _986;
    if (!_606)
    {
        _186 = 0.0;
    }
    float _994 = _186;
    float _996 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _998 = _558;
    float _1000 = _994;
    float _1002 = _996;
    if (_606)
    {
        float _1004 = rsqrt(_558);
        _998 = _1004;
    }
    float _1006 = _998;
    if (_530)
    {
        _980 = _986;
    }
    float _1008 = _980;
    float _1010 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_606)
    {
        _936 = 0.0;
    }
    float _1012 = _936;
    float _1014 = _668 * (-0.15915493667125701904296875);
    float _1016 = _1012;
    if (!_606)
    {
        _992 = 0.0;
    }
    float _1018 = _992;
    float _1020 = fma(_974, _1008, -0.5);
    float _1022 = _858 * (-0.15915493667125701904296875);
    float _1024 = _546;
    float _1026 = _1018;
    if (_616)
    {
        float _1028 = rsqrt(_546);
        _1024 = _1028;
    }
    float _1030 = _1024;
    float _1032 = _868 * _972;
    float _1034 = _990 * _1032;
    float _1036 = _800;
    if (_866)
    {
        float _1038 = rsqrt(_800);
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_606)
    {
        float _1042 = _1006 * _310;
        _1000 = _1042;
    }
    float _1044 = _1000;
    if (_606)
    {
        float _1046 = _1006 * _290;
        _1016 = _1046;
    }
    float _1048 = _1016;
    float _1050 = _1048;
    if (_606)
    {
        float _1052 = _1006 * _174;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (!_616)
    {
        _448 = 0.0;
    }
    float _1056 = _448;
    float _1058 = _1034 * _570;
    float _1060 = _1056;
    if (!_866)
    {
        _450 = 0.0;
    }
    float _1062 = _450;
    float _1064 = _968 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1062;
    if (!_616)
    {
        _452 = 0.0;
    }
    float _1070 = _452;
    float _1072 = _1070;
    if (_616)
    {
        float _1074 = _1030 * _176;
        _1060 = _1074;
    }
    float _1076 = _1060;
    if (_616)
    {
        float _1078 = _1030 * _312;
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _996 * _1032;
    float _1084 = _1010 * _1032;
    if (!_866)
    {
        _1002 = 0.0;
    }
    float _1086 = _1002;
    float _1088 = _898 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = _1086;
    if (_866)
    {
        float _1094 = _1040 * _314;
        _1068 = _1094;
    }
    float _1096 = _1068;
    float _1098 = _1082 * _568;
    float _1100 = _1084 * _584;
    if (_866)
    {
        float _1102 = _1040 * _178;
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = in.m_57.w;
    float _1108 = _898 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _968 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = _1090 * _1066;
    float _1118 = _988 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1110 * _1066;
    out.m_59.w = _1106;
    float _1124 = _988 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1110 * _1114;
    float _1130 = _1120 * _1058;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1134 = _1110 * _1130;
    float _1136 = fma(_1126, _1128, _1116);
    float _1138 = fma(_1126, _1116, _1128);
    float _1140 = _1066 * _1120;
    float _1142 = _1114 * _1120;
    float _1144 = _1090 * _1114;
    float _1146 = fma(_1136, _1098, _1134);
    float _1148 = -_1058;
    float _1150 = _1126 * _1148;
    float _1152 = _1090 * _1130;
    float _1154 = -_1144;
    float _1156 = fma(_1126, _1122, _1154);
    float _1158 = -_1122;
    float _1160 = fma(_1126, _1144, _1158);
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1164 = fma(_1142, _1098, _1150);
    float _1166 = fma(_1156, _1100, _1146);
    float _1168 = fma(_1160, _1098, _1152);
    float _1170 = -_902;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1174 = fma(_1140, _1100, _1164);
    float _1176 = _1166 * _1080;
    float _1178 = _1166 * _1076;
    float _1180 = _1014 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_1138, _1100, _1168);
    float _1186 = fma(_1174, _1044, _1176);
    float _1188 = fma(_1174, _1054, _1178);
    float _1190 = -_910;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1194 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1196 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1184, _1104, _1188);
    float _1200 = _1014 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = -_942;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1194);
    float _1210 = fma(_1196, _940, -0.5);
    float _1212 = fma(_1184, _1096, _1186);
    float _1214 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1216 = _804 + _1198;
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1208);
    float _1220 = _750 + _1212;
    float _1222 = _1182 * _1210;
    float _1224 = fma(_1214, _272, -0.5);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1234 = _1178;
    float _1236 = _1216;
    float _1238 = _1220;
    float _1240 = _1228;
    if (!_616)
    {
        _1234 = 0.0;
    }
    float _1242 = _1234;
    float _1244 = _1242;
    if (_616)
    {
        float _1246 = _1030 * _292;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = _1202 * _1210;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1254 = _1220 + _1252;
    float _1256 = _1228 * _1228;
    float _1258 = 1.0 / _1230;
    float _1260 = fma(_1182, _1224, _1250);
    float _1262 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1232);
    float _1264 = -_1222;
    float _1266 = fma(_1202, _1224, _1264);
    float _1268 = fma(_1254, _1254, _1256);
    float _1270 = -_856;
    float _1272 = fma(_854, _1260, _1270);
    float _1274 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1278 = fma(_814, _1266, _660);
    float _1280 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1282 = _962 + 0.5;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1286 = _978 + 0.5;
    float _1288 = _1280 + _1230;
    float _1290 = _1278 + 0.5;
    float _1292 = sqrt(_1268);
    float _1294 = _1272 + 0.5;
    float _1296 = _1288 * _1258;
    float _1298 = _1296 * 0.5;
    out.m_61.w = _1284;
    float _1300 = _1166 * _1248;
    float _1302 = _1256;
    if (!_866)
    {
        _1302 = 0.0;
    }
    float _1304 = _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = _1022 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    out.m_63.x = _1282;
    out.m_63.y = _1286;
    out.m_63.z = _1290;
    out.m_63.w = _1294;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1316 = _1304;
    if (_866)
    {
        float _1318 = _1040 * _294;
        _1316 = _1318;
    }
    float _1320 = _1316;
    float _1322 = fma(_1174, _1048, _1300);
    bool _1324 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1332 = _1328 || _1330;
    float _1334 = fma(_916, _1314, -0.5);
    float _1336 = _1022 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1184, _1320, _1322);
    float _1344 = _754 + _1342;
    float _1346 = 1.0 / _1308;
    float _1348 = _1312 * _1334;
    float _1350 = _1338 * _1334;
    float _1352 = -_1348;
    float _1354 = fma(_1338, _1020, _1352);
    float _1356 = fma(_1312, _1020, _1350);
    float _1358 = fma(_842, _1354, _672);
    float _1360 = _1354;
    if (!_1340)
    {
        _1360 = _1344;
    }
    float _1362 = _1360;
    float _1364 = -_860;
    float _1366 = fma(_852, _1356, _1364);
    bool _1368 = !_1340;
    float _1370 = _1362;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1292 + _1374;
        float _1378 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = rsqrt(_1268);
        float _1382 = _1376 * _1372;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1344, _1388, _1396);
        float _1402 = _1380 * _1398;
        float _1404 = fma(_1254, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1228, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1050 = _1402;
        _1370 = _1400;
        _1236 = _1406;
        _1238 = _1404;
    }
    float _1408 = _1050;
    float _1410 = _1370;
    float _1412 = _1236;
    float _1414 = _1238;
    float _1416 = _1408;
    if (_1332)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    float _1420 = _1358 + 0.5;
    float _1422 = _1418;
    if (_1332)
    {
        _1240 = 1.0;
    }
    float _1424 = _1240;
    float _1426 = _1366 + 0.5;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1346 * _1428;
    float _1432 = _1424;
    if (!_1332)
    {
        float _1434 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 0.15915493667125701904296875;
        float _1446 = _1436 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = 1.0 / _1442;
        float _1452 = _1444 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        float _1456 = _1448 * _1450;
        float _1458 = _1444 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1464 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1462;
        float _1466 = _1454 * _1456;
        float _1468 = 1.0 / _1464;
        float _1470 = 1.0 / _1466;
        float _1472 = _1460 * _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1476 = fma(_1430, _1472, _1474);
        float _1478 = _1476 * _1468;
        float _1480 = precise::clamp(_1478, 0.0, 1.0);
        _1422 = _1480;
    }
    float _1482 = _1422;
    if (!_1332)
    {
        float _1484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = _1484 * 0.15915493667125701904296875;
        float _1490 = _1486 * 0.15915493667125701904296875;
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = 1.0 / _1494;
        float _1502 = _1490 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1498 * _1500;
        float _1508 = _1490 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1512;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = 1.0 / _1518;
        float _1522 = _1510 * _1514;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = fma(_1430, _1522, _1524);
        float _1528 = _1526 * _1520;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        float _1532 = -_1530;
        float _1534 = _1532 + 1.0;
        _1432 = _1534;
    }
    float _1536 = _1432;
    bool _1538 = _1482 > 0.0;
    bool _1540 = isnan(_1482);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = -_902;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1552 = _1482 * _1536;
    float _1554 = -_942;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    bool _1558 = _1536 <= 0.0;
    bool _1560 = !_1546;
    bool _1562 = _1558 || _1560;
    float _1564 = -_910;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1568 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1570 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1572 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1568);
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1570);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1572);
    out.m_65.x = _1420;
    out.m_65.y = _1426;
    float _1582 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1576);
    float _1584 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1586 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1588 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1586);
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1604);
    float _1614 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1606);
    float _1618 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1620 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1610);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1624 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1622);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1636 = _1628 + _1630;
    float _1638 = _1632 + _1630;
    float _1640 = _1630 * 0.5;
    float _1642 = _1636 * 0.5;
    float _1644 = _1638 * 0.5;
    float _1646 = fma(_1626, -0.5, _1640);
    out.m_67.x = _1566;
    out.m_67.y = _1550;
    out.m_67.z = _1556;
    out.m_37.x = _1634;
    out.gl_Position.x = _1628;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1630;
    out.m_69.x = _1642;
    out.m_69.y = _1646;
    out.m_69.z = _1644;
    out.m_69.w = _1630;
    if (!_1562)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1648;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = in.m_32.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_110);
        out.gl_Position.z = _1714;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    bool _134 = _130;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _138 = _136 * 5.0;
        _112 = as_type<int>(_138);
    }
    int _140 = _112;
    int _142 = _140;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_140);
        out.gl_Position.z = _1772;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_39.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_39.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_39.w;
    float _170 = _144 * 2.0;
    bool _172 = _144 > 0.5;
    float _174 = in.m_43.x;
    float _176 = in.m_43.y;
    float _178 = in.m_43.z;
    float _180 = 0.0;
    int _182 = as_type<int>(_170);
    float _184 = _146;
    float _186 = _144;
    if (!_162)
    {
        _180 = _144;
    }
    float _188 = _180;
    float _190 = _148 * 2.0;
    float _192 = floor(_170);
    float _194 = _188;
    if (_152)
    {
        bool _196 = _148 > 0.5;
        _134 = _196;
    }
    bool _198 = _134;
    float _200 = in.m_45.x;
    float _202 = in.m_45.y;
    float _204 = in.m_45.z;
    float _206 = _158 * 2.0;
    float _208 = 0.0;
    if (!_162)
    {
        _208 = _158;
    }
    float _210 = _208;
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = _210;
    float _220 = _164;
    if (_156)
    {
        float _222 = -_164;
        float _224 = _222 + 1.0;
        _142 = as_type<int>(_224);
    }
    int _226 = _142;
    float _228 = floor(_190);
    if (_152)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _182 = as_type<int>(_232);
    }
    int _234 = _182;
    float _236 = 0.0;
    if (!_152)
    {
        _236 = _164;
    }
    float _238 = _236;
    float _240 = -_166;
    float _242 = _240 + 1.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _166;
    if (!_156)
    {
        _244 = _164;
    }
    float _250 = _244;
    float _252 = _250;
    if (_152)
    {
        float _254 = _198 ? as_type<float>(_234) : _164;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = floor(_206);
    bool _260 = _192 >= 0.0;
    bool _262 = isnan(_192);
    bool _264 = _260 || _262;
    bool _266 = isnan(0.0);
    bool _268 = _264 || _266;
    if (_156)
    {
        float _270 = _172 ? as_type<float>(_226) : _164;
        _252 = _270;
    }
    float _272 = _252;
    int _274 = _268 ? 0 : 1;
    bool _276 = _192 > 0.0;
    bool _278 = _228 >= 0.0;
    bool _280 = isnan(_228);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    bool _288 = _228 > 0.0;
    float _290 = in.m_49.x;
    float _292 = in.m_49.y;
    float _294 = in.m_49.z;
    int _296 = _286 ? 0 : 1;
    bool _298 = _258 > 0.0;
    bool _300 = _258 >= 0.0;
    bool _302 = isnan(_258);
    bool _304 = _300 || _302;
    bool _306 = isnan(0.0);
    bool _308 = _304 || _306;
    float _310 = in.m_51.x;
    float _312 = in.m_51.y;
    float _314 = in.m_51.z;
    bool _316 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _320 = _316 || _318;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    int _326 = ~_296;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _308 ? 0 : 1;
    int _334 = _330;
    if (!_288)
    {
        int _336 = ~_296;
        int _338 = _336 + 1;
        _334 = _338;
    }
    int _340 = _334;
    bool _342 = _158 > 0.5;
    int _344 = ~_274;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = 0.0;
    int _352 = _348;
    if (!_162)
    {
        _350 = _148;
    }
    float _354 = _350;
    float _356 = 0.0;
    float _358 = _354;
    if (!_324)
    {
        float _360 = _146 * _146;
        float _362 = _360 * 0.5;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    float _368 = _364;
    if (!_162)
    {
        _366 = _210;
    }
    float _370 = _366;
    float _372 = 0.0;
    float _374 = _370;
    if (!_162)
    {
        _372 = _188;
    }
    float _376 = _372;
    float _378 = _376;
    if (!_324)
    {
        float _380 = _364 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _380;
    }
    float _382 = _368;
    float _384 = 0.0;
    float _386 = _382;
    if (_162)
    {
        _384 = _158;
    }
    float _388 = _384;
    float _390 = 0.0;
    float _392 = _388;
    if (_162)
    {
        _390 = _148;
    }
    float _394 = _390;
    float _396 = 0.0;
    float _398 = _394;
    if (_162)
    {
        _396 = _144;
    }
    float _400 = _396;
    int _402 = ~_332;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    float _408 = _400;
    int _410 = _406;
    if (!_276)
    {
        int _412 = ~_274;
        int _414 = _412 + 1;
        _352 = _414;
    }
    int _416 = _352;
    if (_162)
    {
        _374 = _148;
    }
    float _418 = _374;
    if (_162)
    {
        _218 = _148;
    }
    float _420 = _218;
    if (!_162)
    {
        _392 = _148;
    }
    float _422 = _392;
    if (_162)
    {
        _358 = _144;
    }
    float _424 = _358;
    if (_162)
    {
        _378 = _158;
    }
    float _426 = _378;
    if (_162)
    {
        _194 = _158;
    }
    float _428 = _194;
    if (!_162)
    {
        _398 = _144;
    }
    float _430 = _398;
    if (!_162)
    {
        _408 = _158;
    }
    float _432 = _408;
    if (!_298)
    {
        int _434 = ~_332;
        int _436 = _434 + 1;
        _410 = _436;
    }
    int _438 = _410;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    int _444 = _342 ? as_type<int>(_242) : as_type<int>(_166);
    bool _446 = !_324;
    float _448 = _310;
    float _450 = _290;
    float _452 = _174;
    if (!_446)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _146 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _146);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _482;
    }
    float _484 = _386;
    bool _486 = !_324;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _146 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _184 = _506;
    }
    float _508 = _184;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _442 ? as_type<float>(_444) : _166;
    float _526 = _292 * _292;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _530 = _528 != 0;
    float _532 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _536 = _534 != 0;
    float _538 = fma(_312, _312, _526);
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = _290 * _290;
    float _546 = fma(_176, _176, _538);
    bool _548 = !_512;
    int _550 = _548 ? 0 : 1;
    float _552 = fma(_310, _310, _544);
    bool _554 = _168 > 0.5;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = fma(_174, _174, _552);
    float _560 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _564 = sqrt(_558);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _572 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _574 = fma(_562, -2.0, _566);
    float _576 = _158 + _148;
    float _578 = sqrt(_546);
    float _580 = -_556;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    bool _586 = !_520;
    int _588 = _586 ? 0 : 1;
    float _590 = _576 + (-1.0);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = !_516;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_45.w;
    float _602 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[84].z, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 > 0.0;
    float _608 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _610 = in.m_30.x;
    float _612 = in.m_30.y;
    float _614 = in.m_30.z;
    bool _616 = _578 > 0.0;
    float _618 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _620 = in.m_32.x;
    float _622 = in.m_32.y;
    float _624 = in.m_32.z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _628 = _426 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _632 = -_626;
    float _634 = fma(_618, 2.0, _632);
    float _636 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _638 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _640 = log2(_638);
    float _642 = fma(_628, -2.0, _630);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _646 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _648 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _650 = -_644;
    float _652 = fma(_636, 2.0, _650);
    float _654 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _656 = abs(_598);
    float _658 = -_94;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[81].x, _634);
    float _662 = float(_438);
    float _664 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _574);
    float _666 = float(_340);
    float _668 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[84].x, _602);
    float _670 = -_94;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _652);
    float _674 = float(_416);
    float _676 = fma(_508, _620, _646);
    float _678 = fma(_508, _622, _648);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _682 = _422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _684 = fma(_508, _624, _654);
    float _686 = fma(_678, _600, _612);
    float _688 = float(_656);
    float _690 = fma(_682, -2.0, _680);
    float _692 = fma(_676, _600, _610);
    float _694 = fma(_684, _600, _614);
    float _696 = _640 * _94;
    float _698 = in.m_51.w;
    float _700 = _686 * _312;
    float _702 = _686 * _292;
    float _704 = _686 * _176;
    float _706 = in.m_49.w;
    float _708 = exp2(_696);
    float _710 = fma(_692, _310, _700);
    float _712 = fma(_692, _290, _702);
    float _714 = fma(_692, _174, _704);
    int _716 = abs(_550);
    float _718 = in.m_53.x;
    float _720 = in.m_53.y;
    float _722 = in.m_53.z;
    float _724 = fma(_694, _314, _710);
    int _726 = abs(_588);
    float _728 = fma(_694, _294, _712);
    float _730 = float(_716);
    float _732 = in.m_43.w;
    float _734 = float(_726);
    float _736 = _688 * _666;
    float _738 = fma(_694, _178, _714);
    float _740 = _730 * _674;
    float _742 = -_708;
    float _744 = _742 + 1.0;
    float _746 = _734 * _662;
    float _748 = _740 * (-2.0);
    float _750 = _724 + _698;
    float _752 = _746 * (-2.0);
    float _754 = _728 + _706;
    int _756 = _172 ? as_type<int>(_242) : as_type<int>(_166);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _760 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _754 + _770;
    float _774 = fma(_752, _722, _722);
    float _776 = _768 ? _744 : 0.0;
    float _778 = _294 * _294;
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _792 = 1.0 + _790;
    float _794 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _758);
    float _796 = fma(_314, _314, _778);
    float _798 = 1.0 / _792;
    float _800 = fma(_178, _178, _796);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _804 = _738 + _732;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _808 = _772 * _772;
    float _810 = sqrt(_800);
    float _812 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _794);
    float _814 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _608);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _750 + _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _826 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _802);
    float _828 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _804 + _830;
    float _834 = fma(_818, _818, _808);
    float _836 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[89].z, _822);
    float _840 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _824);
    float _842 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].z, _826);
    float _844 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _828);
    float _846 = fma(_832, _832, _834);
    float _848 = -_94;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    float _852 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[87].w, _840);
    float _854 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _856 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _642);
    float _858 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[89].x, _838);
    float _860 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[86].y, _690);
    if (_788)
    {
        float _862 = _776 * _798;
        _102 = _862;
    }
    float _864 = _102;
    bool _866 = _810 > 0.0;
    float _868 = rsqrt(_846);
    float _870 = _144 + _148;
    float _872 = fma(_748, _718, _718);
    float _874 = _148 + (-0.5);
    float _876 = _158 + _144;
    float _878 = fma(_604, _748, _604);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    float _882 = _876 + (-1.0);
    float _884 = _870 + (-1.0);
    float _886 = _736 * (-2.0);
    float _888 = fma(_878, _864, _880);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _720, _720);
    float _898 = _888 * 0.15915493667125701904296875;
    float _900 = _158 + (-0.5);
    float _902 = _772 * _868;
    float _904 = fma(_892, _886, _892);
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _908 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _896);
    float _910 = _818 * _868;
    float _912 = -_902;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _916 = _536 ? as_type<float>(_756) : _166;
    out.m_55.y = _166;
    float _918 = -_910;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _922 = _914 * _914;
    bool _924 = _158 > 0.5;
    bool _926 = _924 && _530;
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _932 = fma(_920, _920, _922);
    float _934 = fma(_904, _864, _908);
    float _936 = _864;
    if (_542)
    {
        float _938 = _554 ? _242 : _166;
        _248 = _938;
    }
    float _940 = _248;
    float _942 = _832 * _868;
    float _944 = fma(_928, _524, -0.5);
    float _946 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _948 = _144 + (-0.5);
    float _950 = -_942;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _954 = fma(_894, _752, _894);
    float _956 = fma(_946, _256, -0.5);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _960 = fma(_952, _952, _932);
    out.m_55.x = _164;
    float _962 = fma(_844, _956, _850);
    float _964 = _956;
    if (!_530)
    {
        _964 = _164;
    }
    float _966 = _964;
    float _968 = _934 * 0.15915493667125701904296875;
    float _970 = fma(_954, _864, _958);
    float _972 = sqrt(_960);
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _976 = -_664;
    float _978 = fma(_812, _944, _976);
    float _980 = _966;
    if (_926)
    {
        float _982 = -_164;
        float _984 = _982 + 1.0;
        _220 = _984;
    }
    float _986 = _220;
    float _988 = _970 * 0.15915493667125701904296875;
    float _990 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _992 = _986;
    if (!_606)
    {
        _186 = 0.0;
    }
    float _994 = _186;
    float _996 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _998 = _558;
    float _1000 = _994;
    float _1002 = _996;
    if (_606)
    {
        float _1004 = rsqrt(_558);
        _998 = _1004;
    }
    float _1006 = _998;
    if (_530)
    {
        _980 = _986;
    }
    float _1008 = _980;
    float _1010 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_606)
    {
        _936 = 0.0;
    }
    float _1012 = _936;
    float _1014 = _668 * (-0.15915493667125701904296875);
    float _1016 = _1012;
    if (!_606)
    {
        _992 = 0.0;
    }
    float _1018 = _992;
    float _1020 = fma(_974, _1008, -0.5);
    float _1022 = _858 * (-0.15915493667125701904296875);
    float _1024 = _546;
    float _1026 = _1018;
    if (_616)
    {
        float _1028 = rsqrt(_546);
        _1024 = _1028;
    }
    float _1030 = _1024;
    float _1032 = _868 * _972;
    float _1034 = _990 * _1032;
    float _1036 = _800;
    if (_866)
    {
        float _1038 = rsqrt(_800);
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_606)
    {
        float _1042 = _1006 * _310;
        _1000 = _1042;
    }
    float _1044 = _1000;
    if (_606)
    {
        float _1046 = _1006 * _290;
        _1016 = _1046;
    }
    float _1048 = _1016;
    float _1050 = _1048;
    if (_606)
    {
        float _1052 = _1006 * _174;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (!_616)
    {
        _448 = 0.0;
    }
    float _1056 = _448;
    float _1058 = _1034 * _570;
    float _1060 = _1056;
    if (!_866)
    {
        _450 = 0.0;
    }
    float _1062 = _450;
    float _1064 = _968 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1062;
    if (!_616)
    {
        _452 = 0.0;
    }
    float _1070 = _452;
    float _1072 = _1070;
    if (_616)
    {
        float _1074 = _1030 * _176;
        _1060 = _1074;
    }
    float _1076 = _1060;
    if (_616)
    {
        float _1078 = _1030 * _312;
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = _996 * _1032;
    float _1084 = _1010 * _1032;
    if (!_866)
    {
        _1002 = 0.0;
    }
    float _1086 = _1002;
    float _1088 = _898 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = _1086;
    if (_866)
    {
        float _1094 = _1040 * _314;
        _1068 = _1094;
    }
    float _1096 = _1068;
    float _1098 = _1082 * _568;
    float _1100 = _1084 * _584;
    if (_866)
    {
        float _1102 = _1040 * _178;
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = in.m_57.w;
    float _1108 = _898 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _968 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = _1090 * _1066;
    float _1118 = _988 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1110 * _1066;
    out.m_59.w = _1106;
    float _1124 = _988 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1110 * _1114;
    float _1130 = _1120 * _1058;
    float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1134 = _1110 * _1130;
    float _1136 = fma(_1126, _1128, _1116);
    float _1138 = fma(_1126, _1116, _1128);
    float _1140 = _1066 * _1120;
    float _1142 = _1114 * _1120;
    float _1144 = _1090 * _1114;
    float _1146 = fma(_1136, _1098, _1134);
    float _1148 = -_1058;
    float _1150 = _1126 * _1148;
    float _1152 = _1090 * _1130;
    float _1154 = -_1144;
    float _1156 = fma(_1126, _1122, _1154);
    float _1158 = -_1122;
    float _1160 = fma(_1126, _1144, _1158);
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1164 = fma(_1142, _1098, _1150);
    float _1166 = fma(_1156, _1100, _1146);
    float _1168 = fma(_1160, _1098, _1152);
    float _1170 = -_902;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1174 = fma(_1140, _1100, _1164);
    float _1176 = _1166 * _1080;
    float _1178 = _1166 * _1076;
    float _1180 = _1014 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = fma(_1138, _1100, _1168);
    float _1186 = fma(_1174, _1044, _1176);
    float _1188 = fma(_1174, _1054, _1178);
    float _1190 = -_910;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1194 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1196 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1184, _1104, _1188);
    float _1200 = _1014 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = -_942;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1194);
    float _1210 = fma(_1196, _940, -0.5);
    float _1212 = fma(_1184, _1096, _1186);
    float _1214 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1216 = _804 + _1198;
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1208);
    float _1220 = _750 + _1212;
    float _1222 = _1182 * _1210;
    float _1224 = fma(_1214, _272, -0.5);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1234 = _1178;
    float _1236 = _1216;
    float _1238 = _1220;
    float _1240 = _1228;
    if (!_616)
    {
        _1234 = 0.0;
    }
    float _1242 = _1234;
    float _1244 = _1242;
    if (_616)
    {
        float _1246 = _1030 * _292;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = _1202 * _1210;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1254 = _1220 + _1252;
    float _1256 = _1228 * _1228;
    float _1258 = 1.0 / _1230;
    float _1260 = fma(_1182, _1224, _1250);
    float _1262 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1232);
    float _1264 = -_1222;
    float _1266 = fma(_1202, _1224, _1264);
    float _1268 = fma(_1254, _1254, _1256);
    float _1270 = -_856;
    float _1272 = fma(_854, _1260, _1270);
    float _1274 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1278 = fma(_814, _1266, _660);
    float _1280 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1282 = _962 + 0.5;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1286 = _978 + 0.5;
    float _1288 = _1280 + _1230;
    float _1290 = _1278 + 0.5;
    float _1292 = sqrt(_1268);
    float _1294 = _1272 + 0.5;
    float _1296 = _1288 * _1258;
    float _1298 = _1296 * 0.5;
    out.m_61.w = _1284;
    float _1300 = _1166 * _1248;
    float _1302 = _1256;
    if (!_866)
    {
        _1302 = 0.0;
    }
    float _1304 = _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = _1022 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    out.m_63.x = _1282;
    out.m_63.y = _1286;
    out.m_63.z = _1290;
    out.m_63.w = _1294;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1316 = _1304;
    if (_866)
    {
        float _1318 = _1040 * _294;
        _1316 = _1318;
    }
    float _1320 = _1316;
    float _1322 = fma(_1174, _1048, _1300);
    bool _1324 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1332 = _1328 || _1330;
    float _1334 = fma(_916, _1314, -0.5);
    float _1336 = _1022 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = fma(_1184, _1320, _1322);
    float _1344 = _754 + _1342;
    float _1346 = 1.0 / _1308;
    float _1348 = _1312 * _1334;
    float _1350 = _1338 * _1334;
    float _1352 = -_1348;
    float _1354 = fma(_1338, _1020, _1352);
    float _1356 = fma(_1312, _1020, _1350);
    float _1358 = fma(_842, _1354, _672);
    float _1360 = _1354;
    if (!_1340)
    {
        _1360 = _1344;
    }
    float _1362 = _1360;
    float _1364 = -_860;
    float _1366 = fma(_852, _1356, _1364);
    bool _1368 = !_1340;
    float _1370 = _1362;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1292 + _1374;
        float _1378 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = rsqrt(_1268);
        float _1382 = _1376 * _1372;
        float _1384 = _1382 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1388 + (-1.0);
        float _1396 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = fma(_1392, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1400 = fma(_1344, _1388, _1396);
        float _1402 = _1380 * _1398;
        float _1404 = fma(_1254, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1406 = fma(_1228, _1402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1050 = _1402;
        _1370 = _1400;
        _1236 = _1406;
        _1238 = _1404;
    }
    float _1408 = _1050;
    float _1410 = _1370;
    float _1412 = _1236;
    float _1414 = _1238;
    float _1416 = _1408;
    if (_1332)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    float _1420 = _1358 + 0.5;
    float _1422 = _1418;
    if (_1332)
    {
        _1240 = 1.0;
    }
    float _1424 = _1240;
    float _1426 = _1366 + 0.5;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1346 * _1428;
    float _1432 = _1424;
    if (!_1332)
    {
        float _1434 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = _1436 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 0.15915493667125701904296875;
        float _1446 = _1436 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = 1.0 / _1442;
        float _1452 = _1444 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        float _1456 = _1448 * _1450;
        float _1458 = _1444 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1464 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1462;
        float _1466 = _1454 * _1456;
        float _1468 = 1.0 / _1464;
        float _1470 = 1.0 / _1466;
        float _1472 = _1460 * _1470;
        float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1476 = fma(_1430, _1472, _1474);
        float _1478 = _1476 * _1468;
        float _1480 = precise::clamp(_1478, 0.0, 1.0);
        _1422 = _1480;
    }
    float _1482 = _1422;
    if (!_1332)
    {
        float _1484 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1488 = _1484 * 0.15915493667125701904296875;
        float _1490 = _1486 * 0.15915493667125701904296875;
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * 6.283185482025146484375;
        float _1498 = sin(_1496);
        float _1500 = 1.0 / _1494;
        float _1502 = _1490 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1498 * _1500;
        float _1508 = _1490 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1512;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = 1.0 / _1518;
        float _1522 = _1510 * _1514;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = fma(_1430, _1522, _1524);
        float _1528 = _1526 * _1520;
        float _1530 = precise::clamp(_1528, 0.0, 1.0);
        float _1532 = -_1530;
        float _1534 = _1532 + 1.0;
        _1432 = _1534;
    }
    float _1536 = _1432;
    bool _1538 = _1482 > 0.0;
    bool _1540 = isnan(_1482);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = -_902;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1552 = _1482 * _1536;
    float _1554 = -_942;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    bool _1558 = _1536 <= 0.0;
    bool _1560 = !_1546;
    bool _1562 = _1558 || _1560;
    float _1564 = -_910;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1568 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1570 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1572 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1568);
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1570);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1572);
    out.m_65.x = _1420;
    out.m_65.y = _1426;
    float _1582 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1576);
    float _1584 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1578);
    float _1586 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1588 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1586);
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1604);
    float _1614 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1606);
    float _1618 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1620 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1610);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1612);
    float _1624 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1622);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1620);
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1636 = _1628 + _1630;
    float _1638 = _1632 + _1630;
    float _1640 = _1630 * 0.5;
    float _1642 = _1636 * 0.5;
    float _1644 = _1638 * 0.5;
    float _1646 = fma(_1626, -0.5, _1640);
    out.m_67.x = _1566;
    out.m_67.y = _1550;
    out.m_67.z = _1556;
    out.m_37.x = _1634;
    out.gl_Position.x = _1628;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1630;
    out.m_69.x = _1642;
    out.m_69.y = _1646;
    out.m_69.z = _1644;
    out.m_69.w = _1630;
    if (!_1562)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1648;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

