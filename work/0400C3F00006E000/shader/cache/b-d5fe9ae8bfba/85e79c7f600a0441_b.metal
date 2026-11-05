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
    float4 m_57 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_51 [[attribute(9)]];
    uint4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1132 = false;
    bool _328 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_37.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = 0.0;
    float _118 = _114;
    if (_110)
    {
        float _120 = float(_82);
        _116 = _120;
    }
    float _122 = _116;
    bool _124 = _114 >= _122;
    bool _126 = !_110;
    bool _128 = _124 || _126;
    float _130 = 0.0;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_35.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _98 = as_type<int>(_134);
    }
    int _136 = _98;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_136);
        out.gl_Position.z = _1371;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _140 = !_138;
    float _158;
    if (!_140)
    {
        float _142 = in.m_39.x;
        float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _146 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _148 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _150 = _148 * _144;
        float _152 = floor(_150);
        float _154 = -_152;
        float _156 = _150 + _154;
        _158 = _156;
        _160 = true;
    }
    else
    {
        float _162 = float(_82);
        float _164 = 1.0 / _162;
        float _166 = _114 * _164;
        _158 = _166;
    }
    _160 = false;
    float _168 = _158;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = _168 + _170;
    bool _174 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _176 = isnan(_168);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _182 = _178 || _180;
    float _184 = float(_182);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _168 + _186;
    bool _190 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _192 = isnan(_168);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_168);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -_184;
    float _224 = _222 + 1.0;
    float _226 = 1.0 / _208;
    float _228 = _220 * _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _204;
    float _242 = _200 * _232;
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _188 * _226;
    float _250 = _172 * _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = fma(_236, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _262 = fma(_254, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = fma(_258, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _260 * _242;
    float _268 = _262 * _242;
    float _270 = _264 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _284 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _286 = fma(_274, _248, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _288 = fma(_278, _248, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _290 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _292 = fma(_282, _248, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _294 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _296 = fma(_286, _228, _284);
    float _298 = fma(_288, _228, _290);
    float _300 = fma(_292, _228, _294);
    float _302 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].x, _296);
    float _304 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].y, _298);
    float _306 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].z, _300);
    bool _308 = !_238;
    float _326;
    if (!_308)
    {
        float _310 = in.m_39.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_82);
        float _332 = 1.0 / _330;
        float _334 = _114 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = in.m_39.z;
    float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _342 = log2(_340);
    float _344 = in.m_39.x;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_39.y;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _342 * _114;
    float _372 = exp2(_370);
    float _374 = _338 * 2.0;
    float _376 = _344 * 2.0;
    float _378 = floor(_374);
    float _380 = _358 + _338;
    float _382 = _358 * 2.0;
    float _384 = -_372;
    float _386 = _384 + 1.0;
    float _388 = floor(_376);
    float _390 = _368 ? _386 : 0.0;
    bool _392 = _378 > 0.0;
    float _394 = _380 + (-1.0);
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _344 + _358;
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _410 = _404 ? 0 : 1;
    float _412 = _406 + (-1.0);
    bool _414 = _388 > 0.0;
    float _416 = floor(_382);
    int _418 = ~_410;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _426 = _388 >= 0.0;
    bool _428 = isnan(_388);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _438 = 1.0 + _436;
    bool _440 = !_348;
    int _442 = _440 ? 0 : 1;
    int _444 = _422;
    float _446 = _344;
    if (!_392)
    {
        int _448 = ~_410;
        int _450 = _448 + 1;
        _444 = _450;
    }
    int _452 = _444;
    float _454 = 1.0 / _438;
    float _456 = in.m_41.x;
    float _458 = in.m_41.y;
    float _460 = in.m_41.z;
    int _462 = abs(_442);
    int _464 = _434 ? 0 : 1;
    bool _466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(1.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    bool _476 = !_352;
    int _478 = _476 ? 0 : 1;
    float _480 = float(_462);
    float _482 = float(_452);
    int _484 = ~_464;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = abs(_478);
    float _492 = _480 * _482;
    int _494 = _488;
    if (!_414)
    {
        int _496 = ~_464;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    if (_474)
    {
        float _502 = _390 * _454;
        _118 = _502;
    }
    float _504 = _118;
    bool _506 = _416 > 0.0;
    float _508 = _492 * (-2.0);
    float _510 = float(_490);
    float _512 = _344 + (-0.5);
    float _514 = float(_500);
    bool _516 = _416 >= 0.0;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_508, _456, _456);
    bool _528 = !_356;
    int _530 = _528 ? 0 : 1;
    float _532 = _510 * _514;
    int _534 = _524 ? 0 : 1;
    float _536 = fma(_424, _508, _424);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].x, _526);
    float _540 = _532 * (-2.0);
    int _542 = abs(_530);
    float _544 = _358 + (-0.5);
    int _546 = ~_534;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_540, _458, _458);
    int _554 = _550;
    bool _556 = _524;
    if (!_506)
    {
        int _558 = ~_534;
        int _560 = _558 + 1;
        _554 = _560;
    }
    int _562 = _554;
    float _564 = fma(_536, _504, _538);
    float _566 = float(_542);
    float _568 = fma(_408, _540, _408);
    float _570 = float(_562);
    float _572 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _552);
    float _574 = _344 + _338;
    float _576 = _564 * 0.15915493667125701904296875;
    float _578 = _566 * _570;
    float _580 = fma(_568, _504, _572);
    float _582 = _574 + (-1.0);
    float _584 = in.m_43.x;
    float _586 = in.m_43.y;
    float _588 = in.m_43.z;
    float _590 = _578 * (-2.0);
    float _592 = _576 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = in.m_45.x;
    float _600 = in.m_45.y;
    float _602 = in.m_45.z;
    float _604 = fma(_590, _460, _460);
    float _606 = _338 + (-0.5);
    float _608 = fma(_596, _590, _596);
    float _610 = _580 * 0.15915493667125701904296875;
    bool _612 = _358 > 0.5;
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _604);
    float _616 = _576 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_608, _504, _614);
    bool _622 = _338 > 0.5;
    float _624 = _610 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = _620 * 0.15915493667125701904296875;
    float _630 = _306 * _588;
    float _632 = _304 * _586;
    float _634 = _302 * _584;
    float _636 = _610 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _646 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _650 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _628 * 6.283185482025146484375;
    float _654 = cos(_652);
    float _656 = _646 * _642;
    float _658 = _648 * _644;
    float _660 = _650 * _640;
    float _662 = in.m_32.x;
    float _664 = in.m_32.y;
    float _666 = in.m_32.z;
    float _668 = _618 * _626;
    float _670 = _594 * _626;
    float _672 = _628 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _594 * _638;
    float _678 = _618 * _638;
    float _680 = _654 * _656;
    float _682 = _626 * _654;
    float _684 = _638 * _654;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _688 = _618 * _680;
    float _690 = _594 * _680;
    float _692 = as_type<float>(in.m_49.z);
    float _694 = -_668;
    float _696 = fma(_674, _676, _694);
    float _698 = -_676;
    float _700 = fma(_674, _668, _698);
    float _702 = fma(_674, _678, _670);
    float _704 = _674 * _656;
    float _706 = fma(_674, _670, _678);
    float _708 = fma(_696, _660, _690);
    float _710 = fma(_702, _660, _688);
    float _712 = -_704;
    float _714 = fma(_684, _660, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = fma(_706, _658, _708);
    float _720 = fma(_700, _658, _710);
    float _722 = fma(_682, _658, _714);
    float _724 = _664 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _726 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _728 = _720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _732 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _724);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _730);
    float _740 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    float _742 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _736);
    float _746 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _750 = as_type<float>(in.m_49.x);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _756 = as_type<float>(in.m_49.y);
    float _758 = _742 + _752;
    float _760 = _748 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _766 = in.m_51.y;
    float _768 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _770 = _758 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _774 = _760 + _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _764;
    float _782 = _770 * _770;
    float _784 = _774 * _774;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _788 = _786 != 0;
    float _790 = _664 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _794 = _792 != 0;
    float _796 = _782 + _784;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    float _802 = in.m_51.x;
    float _804 = sqrt(_796);
    float _806 = _720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_53.z = _692;
    int _808 = as_type<int>(_774);
    int _810 = as_type<int>(_692);
    if (_778)
    {
        bool _812 = _344 > 0.5;
        _556 = _812;
    }
    bool _814 = _556;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _816;
    float _820 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    out.m_53.x = _750;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _336 + _822;
    float _826 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _806);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = -_766;
    float _832 = _830 + 1.0;
    bool _834 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _836 = isnan(_336);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _818 * _780;
    float _848 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    bool _850 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_336);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _864 = _622 ? _832 : _766;
    float _866 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _868 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -_860;
    float _872 = _870 + 1.0;
    float _874 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = _848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.y = _756;
    float _878 = _844 * _872;
    float _880 = _766;
    float _882 = _878;
    float _884 = _832;
    float _886 = _864;
    float _888 = _866;
    float _890 = _874;
    float _892 = _876;
    if (!_778)
    {
        _446 = _802;
    }
    float _894 = _446;
    float _896 = _874 + _876;
    float _898 = _866 * _878;
    float _900 = _794 ? _864 : _766;
    float _902 = _894;
    if (_800)
    {
        float _904 = _612 ? _832 : _766;
        _880 = _904;
    }
    float _906 = _880;
    if (!_868)
    {
        _882 = _784;
    }
    float _908 = _882;
    float _910 = _908;
    if (!_868)
    {
        _884 = _782;
    }
    float _912 = _884;
    float _914 = _912;
    if (!_868)
    {
        _886 = _758;
    }
    float _916 = _886;
    float _918 = _916;
    if (!_868)
    {
        _888 = _760;
    }
    float _920 = _888;
    float _922 = _920;
    if (!_868)
    {
        _890 = _896;
    }
    float _924 = _890;
    bool _926 = !_868;
    float _928 = _924;
    if (!_926)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _804 + _932;
        float _936 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = rsqrt(_796);
        float _940 = _934 * _930;
        float _942 = _940 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _954 = _938 * _952;
        float _956 = _950 + (-1.0);
        float _958 = fma(_770, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_774, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _962 = _956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _966 = _958 + _964;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _970 = _960 + _968;
        float _972 = fma(_896, _950, _962);
        float _974 = _966 * _966;
        float _976 = _970 * _970;
        _928 = _972;
        _914 = _974;
        _910 = _976;
        _808 = as_type<int>(_970);
        _892 = _942;
        _918 = _958;
        _922 = _960;
    }
    float _978 = _928;
    float _980 = _914;
    float _982 = _910;
    int _984 = _808;
    float _986 = _892;
    float _988 = _918;
    float _990 = _922;
    float _992 = -_844;
    float _994 = _992 + 1.0;
    float _996 = _986;
    int _998 = _984;
    if (_788)
    {
        float _1000 = -_802;
        float _1002 = _1000 + 1.0;
        _810 = as_type<int>(_1002);
    }
    int _1004 = _810;
    float _1006 = _900 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    if (!_788)
    {
        _996 = _802;
    }
    float _1008 = _996;
    float _1010 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _978 + _1012;
    float _1016 = _1008;
    if (_788)
    {
        float _1018 = _612 ? as_type<float>(_1004) : _802;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = as_type<float>(in.m_49.w);
    float _1026 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1028 = _1006 * _862;
    float _1030 = fma(_1014, _1014, _980);
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_778)
    {
        float _1034 = -_802;
        float _1036 = _1034 + 1.0;
        _998 = as_type<int>(_1036);
    }
    int _1038 = _998;
    float _1040 = _1030 + _982;
    float _1042 = _1022 * _686;
    if (_778)
    {
        float _1044 = _814 ? as_type<float>(_1038) : _802;
        _902 = _1044;
    }
    float _1046 = _902;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1058 = sqrt(_1040);
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1054 * _1032;
    float _1084 = _1064 * _1050;
    out.m_53.w = _1024;
    bool _1086 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1088 = isnan(_1058);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1094 = _1090 || _1092;
    out.m_55.x = _1076;
    out.m_55.y = _1078;
    out.m_55.z = _1068;
    out.m_57.x = _1070;
    out.m_57.y = _1072;
    out.m_57.z = _1074;
    out.m_57.w = _1080;
    out.m_59.x = _1082;
    out.m_59.y = _1042;
    float _1096 = _1054;
    if (!_1094)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    out.m_61.x = _1084;
    out.m_61.y = _1028;
    bool _1100 = !_1094;
    float _1102 = _1098;
    if (!_1100)
    {
        bool _1104 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1106 = isnan(_1058);
        bool _1108 = _1104 || _1106;
        bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1112 = _1108 || _1110;
        if (!_1112)
        {
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1116 = _1058 + _1114;
            float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1120 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1126 = 1.0 / _1120;
            float _1128 = _1116 * _1126;
            float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1102 = _1130;
            _1132 = true;
        }
        else
        {
            bool _1134 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1136 = isnan(_1058);
            bool _1138 = _1134 || _1136;
            bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1142 = _1138 || _1140;
            if (!_1142)
            {
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1146 = _1058 + _1144;
                float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1150 = _1148 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1154 = _1152 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1156 = 1.0 / _1150;
                float _1158 = _1146 * _1156;
                float _1160 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1102 = _1160;
                _1132 = true;
            }
            else
            {
                _1102 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1132 = false;
    float _1162 = _1102;
    float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1166 = _978 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1170 = _988 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1174 = _990 + _1172;
    float _1176 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = fma(_1170, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1180 = fma(_1174, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1218);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1222);
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1224);
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1226);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1238 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1232);
    float _1244 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1246 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    out.m_63.w = _1238;
    out.gl_Position.x = _1240;
    out.gl_Position.y = _1242;
    out.gl_Position.z = _1244;
    out.gl_Position.w = _1246;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1132 = false;
    bool _328 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        return out;
    }
    float _100 = in.m_37.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = 0.0;
    float _118 = _114;
    if (_110)
    {
        float _120 = float(_82);
        _116 = _120;
    }
    float _122 = _116;
    bool _124 = _114 >= _122;
    bool _126 = !_110;
    bool _128 = _124 || _126;
    float _130 = 0.0;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_35.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _98 = as_type<int>(_134);
    }
    int _136 = _98;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_136);
        out.gl_Position.z = _1371;
    }
    if (_128)
    {
        return out;
    }
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _140 = !_138;
    float _158;
    if (!_140)
    {
        float _142 = in.m_39.x;
        float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _146 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _148 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _150 = _148 * _144;
        float _152 = floor(_150);
        float _154 = -_152;
        float _156 = _150 + _154;
        _158 = _156;
        _160 = true;
    }
    else
    {
        float _162 = float(_82);
        float _164 = 1.0 / _162;
        float _166 = _114 * _164;
        _158 = _166;
    }
    _160 = false;
    float _168 = _158;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = _168 + _170;
    bool _174 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _176 = isnan(_168);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _182 = _178 || _180;
    float _184 = float(_182);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _168 + _186;
    bool _190 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _192 = isnan(_168);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_168);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -_184;
    float _224 = _222 + 1.0;
    float _226 = 1.0 / _208;
    float _228 = _220 * _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _204;
    float _242 = _200 * _232;
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _188 * _226;
    float _250 = _172 * _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = fma(_236, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _262 = fma(_254, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = fma(_258, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _260 * _242;
    float _268 = _262 * _242;
    float _270 = _264 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _284 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _286 = fma(_274, _248, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _288 = fma(_278, _248, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _290 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _292 = fma(_282, _248, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _294 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _296 = fma(_286, _228, _284);
    float _298 = fma(_288, _228, _290);
    float _300 = fma(_292, _228, _294);
    float _302 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].x, _296);
    float _304 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].y, _298);
    float _306 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].z, _300);
    bool _308 = !_238;
    float _326;
    if (!_308)
    {
        float _310 = in.m_39.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_82);
        float _332 = 1.0 / _330;
        float _334 = _114 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = in.m_39.z;
    float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _342 = log2(_340);
    float _344 = in.m_39.x;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_39.y;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _342 * _114;
    float _372 = exp2(_370);
    float _374 = _338 * 2.0;
    float _376 = _344 * 2.0;
    float _378 = floor(_374);
    float _380 = _358 + _338;
    float _382 = _358 * 2.0;
    float _384 = -_372;
    float _386 = _384 + 1.0;
    float _388 = floor(_376);
    float _390 = _368 ? _386 : 0.0;
    bool _392 = _378 > 0.0;
    float _394 = _380 + (-1.0);
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _344 + _358;
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _410 = _404 ? 0 : 1;
    float _412 = _406 + (-1.0);
    bool _414 = _388 > 0.0;
    float _416 = floor(_382);
    int _418 = ~_410;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _426 = _388 >= 0.0;
    bool _428 = isnan(_388);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _438 = 1.0 + _436;
    bool _440 = !_348;
    int _442 = _440 ? 0 : 1;
    int _444 = _422;
    float _446 = _344;
    if (!_392)
    {
        int _448 = ~_410;
        int _450 = _448 + 1;
        _444 = _450;
    }
    int _452 = _444;
    float _454 = 1.0 / _438;
    float _456 = in.m_41.x;
    float _458 = in.m_41.y;
    float _460 = in.m_41.z;
    int _462 = abs(_442);
    int _464 = _434 ? 0 : 1;
    bool _466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(1.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    bool _476 = !_352;
    int _478 = _476 ? 0 : 1;
    float _480 = float(_462);
    float _482 = float(_452);
    int _484 = ~_464;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = abs(_478);
    float _492 = _480 * _482;
    int _494 = _488;
    if (!_414)
    {
        int _496 = ~_464;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    if (_474)
    {
        float _502 = _390 * _454;
        _118 = _502;
    }
    float _504 = _118;
    bool _506 = _416 > 0.0;
    float _508 = _492 * (-2.0);
    float _510 = float(_490);
    float _512 = _344 + (-0.5);
    float _514 = float(_500);
    bool _516 = _416 >= 0.0;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_508, _456, _456);
    bool _528 = !_356;
    int _530 = _528 ? 0 : 1;
    float _532 = _510 * _514;
    int _534 = _524 ? 0 : 1;
    float _536 = fma(_424, _508, _424);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].x, _526);
    float _540 = _532 * (-2.0);
    int _542 = abs(_530);
    float _544 = _358 + (-0.5);
    int _546 = ~_534;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_540, _458, _458);
    int _554 = _550;
    bool _556 = _524;
    if (!_506)
    {
        int _558 = ~_534;
        int _560 = _558 + 1;
        _554 = _560;
    }
    int _562 = _554;
    float _564 = fma(_536, _504, _538);
    float _566 = float(_542);
    float _568 = fma(_408, _540, _408);
    float _570 = float(_562);
    float _572 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _552);
    float _574 = _344 + _338;
    float _576 = _564 * 0.15915493667125701904296875;
    float _578 = _566 * _570;
    float _580 = fma(_568, _504, _572);
    float _582 = _574 + (-1.0);
    float _584 = in.m_43.x;
    float _586 = in.m_43.y;
    float _588 = in.m_43.z;
    float _590 = _578 * (-2.0);
    float _592 = _576 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = in.m_45.x;
    float _600 = in.m_45.y;
    float _602 = in.m_45.z;
    float _604 = fma(_590, _460, _460);
    float _606 = _338 + (-0.5);
    float _608 = fma(_596, _590, _596);
    float _610 = _580 * 0.15915493667125701904296875;
    bool _612 = _358 > 0.5;
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _604);
    float _616 = _576 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_608, _504, _614);
    bool _622 = _338 > 0.5;
    float _624 = _610 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = _620 * 0.15915493667125701904296875;
    float _630 = _306 * _588;
    float _632 = _304 * _586;
    float _634 = _302 * _584;
    float _636 = _610 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _646 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _650 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _628 * 6.283185482025146484375;
    float _654 = cos(_652);
    float _656 = _646 * _642;
    float _658 = _648 * _644;
    float _660 = _650 * _640;
    float _662 = in.m_32.x;
    float _664 = in.m_32.y;
    float _666 = in.m_32.z;
    float _668 = _618 * _626;
    float _670 = _594 * _626;
    float _672 = _628 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _594 * _638;
    float _678 = _618 * _638;
    float _680 = _654 * _656;
    float _682 = _626 * _654;
    float _684 = _638 * _654;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _688 = _618 * _680;
    float _690 = _594 * _680;
    float _692 = as_type<float>(in.m_49.z);
    float _694 = -_668;
    float _696 = fma(_674, _676, _694);
    float _698 = -_676;
    float _700 = fma(_674, _668, _698);
    float _702 = fma(_674, _678, _670);
    float _704 = _674 * _656;
    float _706 = fma(_674, _670, _678);
    float _708 = fma(_696, _660, _690);
    float _710 = fma(_702, _660, _688);
    float _712 = -_704;
    float _714 = fma(_684, _660, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = fma(_706, _658, _708);
    float _720 = fma(_700, _658, _710);
    float _722 = fma(_682, _658, _714);
    float _724 = _664 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _726 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _728 = _720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _732 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _724);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _730);
    float _740 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    float _742 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _736);
    float _746 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _750 = as_type<float>(in.m_49.x);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _756 = as_type<float>(in.m_49.y);
    float _758 = _742 + _752;
    float _760 = _748 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _766 = in.m_51.y;
    float _768 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _770 = _758 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _774 = _760 + _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _764;
    float _782 = _770 * _770;
    float _784 = _774 * _774;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _788 = _786 != 0;
    float _790 = _664 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _794 = _792 != 0;
    float _796 = _782 + _784;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    float _802 = in.m_51.x;
    float _804 = sqrt(_796);
    float _806 = _720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_53.z = _692;
    int _808 = as_type<int>(_774);
    int _810 = as_type<int>(_692);
    if (_778)
    {
        bool _812 = _344 > 0.5;
        _556 = _812;
    }
    bool _814 = _556;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _816;
    float _820 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    out.m_53.x = _750;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _336 + _822;
    float _826 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _806);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = -_766;
    float _832 = _830 + 1.0;
    bool _834 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _836 = isnan(_336);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _818 * _780;
    float _848 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    bool _850 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_336);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _864 = _622 ? _832 : _766;
    float _866 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _868 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -_860;
    float _872 = _870 + 1.0;
    float _874 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = _848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.y = _756;
    float _878 = _844 * _872;
    float _880 = _766;
    float _882 = _878;
    float _884 = _832;
    float _886 = _864;
    float _888 = _866;
    float _890 = _874;
    float _892 = _876;
    if (!_778)
    {
        _446 = _802;
    }
    float _894 = _446;
    float _896 = _874 + _876;
    float _898 = _866 * _878;
    float _900 = _794 ? _864 : _766;
    float _902 = _894;
    if (_800)
    {
        float _904 = _612 ? _832 : _766;
        _880 = _904;
    }
    float _906 = _880;
    if (!_868)
    {
        _882 = _784;
    }
    float _908 = _882;
    float _910 = _908;
    if (!_868)
    {
        _884 = _782;
    }
    float _912 = _884;
    float _914 = _912;
    if (!_868)
    {
        _886 = _758;
    }
    float _916 = _886;
    float _918 = _916;
    if (!_868)
    {
        _888 = _760;
    }
    float _920 = _888;
    float _922 = _920;
    if (!_868)
    {
        _890 = _896;
    }
    float _924 = _890;
    bool _926 = !_868;
    float _928 = _924;
    if (!_926)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _804 + _932;
        float _936 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = rsqrt(_796);
        float _940 = _934 * _930;
        float _942 = _940 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _954 = _938 * _952;
        float _956 = _950 + (-1.0);
        float _958 = fma(_770, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_774, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _962 = _956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _966 = _958 + _964;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _970 = _960 + _968;
        float _972 = fma(_896, _950, _962);
        float _974 = _966 * _966;
        float _976 = _970 * _970;
        _928 = _972;
        _914 = _974;
        _910 = _976;
        _808 = as_type<int>(_970);
        _892 = _942;
        _918 = _958;
        _922 = _960;
    }
    float _978 = _928;
    float _980 = _914;
    float _982 = _910;
    int _984 = _808;
    float _986 = _892;
    float _988 = _918;
    float _990 = _922;
    float _992 = -_844;
    float _994 = _992 + 1.0;
    float _996 = _986;
    int _998 = _984;
    if (_788)
    {
        float _1000 = -_802;
        float _1002 = _1000 + 1.0;
        _810 = as_type<int>(_1002);
    }
    int _1004 = _810;
    float _1006 = _900 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    if (!_788)
    {
        _996 = _802;
    }
    float _1008 = _996;
    float _1010 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _978 + _1012;
    float _1016 = _1008;
    if (_788)
    {
        float _1018 = _612 ? as_type<float>(_1004) : _802;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = as_type<float>(in.m_49.w);
    float _1026 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1028 = _1006 * _862;
    float _1030 = fma(_1014, _1014, _980);
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_778)
    {
        float _1034 = -_802;
        float _1036 = _1034 + 1.0;
        _998 = as_type<int>(_1036);
    }
    int _1038 = _998;
    float _1040 = _1030 + _982;
    float _1042 = _1022 * _686;
    if (_778)
    {
        float _1044 = _814 ? as_type<float>(_1038) : _802;
        _902 = _1044;
    }
    float _1046 = _902;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1058 = sqrt(_1040);
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1054 * _1032;
    float _1084 = _1064 * _1050;
    out.m_53.w = _1024;
    bool _1086 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1088 = isnan(_1058);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1094 = _1090 || _1092;
    out.m_55.x = _1076;
    out.m_55.y = _1078;
    out.m_55.z = _1068;
    out.m_57.x = _1070;
    out.m_57.y = _1072;
    out.m_57.z = _1074;
    out.m_57.w = _1080;
    out.m_59.x = _1082;
    out.m_59.y = _1042;
    float _1096 = _1054;
    if (!_1094)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    out.m_61.x = _1084;
    out.m_61.y = _1028;
    bool _1100 = !_1094;
    float _1102 = _1098;
    if (!_1100)
    {
        bool _1104 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1106 = isnan(_1058);
        bool _1108 = _1104 || _1106;
        bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1112 = _1108 || _1110;
        if (!_1112)
        {
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1116 = _1058 + _1114;
            float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1120 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1126 = 1.0 / _1120;
            float _1128 = _1116 * _1126;
            float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1102 = _1130;
            _1132 = true;
        }
        else
        {
            bool _1134 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1136 = isnan(_1058);
            bool _1138 = _1134 || _1136;
            bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1142 = _1138 || _1140;
            if (!_1142)
            {
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1146 = _1058 + _1144;
                float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1150 = _1148 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1154 = _1152 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1156 = 1.0 / _1150;
                float _1158 = _1146 * _1156;
                float _1160 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1102 = _1160;
                _1132 = true;
            }
            else
            {
                _1102 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1132 = false;
    float _1162 = _1102;
    float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1166 = _978 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1170 = _988 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1174 = _990 + _1172;
    float _1176 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = fma(_1170, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1180 = fma(_1174, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1218);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1222);
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1224);
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1226);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1238 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1232);
    float _1244 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1246 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    out.m_63.w = _1238;
    out.gl_Position.x = _1240;
    out.gl_Position.y = _1242;
    out.gl_Position.z = _1244;
    out.gl_Position.w = _1246;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1132 = false;
    bool _328 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_37.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = 0.0;
    float _118 = _114;
    if (_110)
    {
        float _120 = float(_82);
        _116 = _120;
    }
    float _122 = _116;
    bool _124 = _114 >= _122;
    bool _126 = !_110;
    bool _128 = _124 || _126;
    float _130 = 0.0;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_35.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _98 = as_type<int>(_134);
    }
    int _136 = _98;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_136);
        out.gl_Position.z = _1371;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _140 = !_138;
    float _158;
    if (!_140)
    {
        float _142 = in.m_39.x;
        float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _146 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _148 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _150 = _148 * _144;
        float _152 = floor(_150);
        float _154 = -_152;
        float _156 = _150 + _154;
        _158 = _156;
        _160 = true;
    }
    else
    {
        float _162 = float(_82);
        float _164 = 1.0 / _162;
        float _166 = _114 * _164;
        _158 = _166;
    }
    _160 = false;
    float _168 = _158;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = _168 + _170;
    bool _174 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _176 = isnan(_168);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _182 = _178 || _180;
    float _184 = float(_182);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _188 = _168 + _186;
    bool _190 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _192 = isnan(_168);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = _168 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_168);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -_184;
    float _224 = _222 + 1.0;
    float _226 = 1.0 / _208;
    float _228 = _220 * _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _204;
    float _242 = _200 * _232;
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _188 * _226;
    float _250 = _172 * _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _256;
    float _260 = fma(_236, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _262 = fma(_254, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = fma(_258, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _260 * _242;
    float _268 = _262 * _242;
    float _270 = _264 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _284 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _286 = fma(_274, _248, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _288 = fma(_278, _248, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _290 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _292 = fma(_282, _248, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _294 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _296 = fma(_286, _228, _284);
    float _298 = fma(_288, _228, _290);
    float _300 = fma(_292, _228, _294);
    float _302 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].x, _296);
    float _304 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].y, _298);
    float _306 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[145].z, _300);
    bool _308 = !_238;
    float _326;
    if (!_308)
    {
        float _310 = in.m_39.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_82);
        float _332 = 1.0 / _330;
        float _334 = _114 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = in.m_39.z;
    float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _342 = log2(_340);
    float _344 = in.m_39.x;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_39.y;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _342 * _114;
    float _372 = exp2(_370);
    float _374 = _338 * 2.0;
    float _376 = _344 * 2.0;
    float _378 = floor(_374);
    float _380 = _358 + _338;
    float _382 = _358 * 2.0;
    float _384 = -_372;
    float _386 = _384 + 1.0;
    float _388 = floor(_376);
    float _390 = _368 ? _386 : 0.0;
    bool _392 = _378 > 0.0;
    float _394 = _380 + (-1.0);
    bool _396 = _378 >= 0.0;
    bool _398 = isnan(_378);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _344 + _358;
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _410 = _404 ? 0 : 1;
    float _412 = _406 + (-1.0);
    bool _414 = _388 > 0.0;
    float _416 = floor(_382);
    int _418 = ~_410;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _426 = _388 >= 0.0;
    bool _428 = isnan(_388);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _438 = 1.0 + _436;
    bool _440 = !_348;
    int _442 = _440 ? 0 : 1;
    int _444 = _422;
    float _446 = _344;
    if (!_392)
    {
        int _448 = ~_410;
        int _450 = _448 + 1;
        _444 = _450;
    }
    int _452 = _444;
    float _454 = 1.0 / _438;
    float _456 = in.m_41.x;
    float _458 = in.m_41.y;
    float _460 = in.m_41.z;
    int _462 = abs(_442);
    int _464 = _434 ? 0 : 1;
    bool _466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(1.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    bool _476 = !_352;
    int _478 = _476 ? 0 : 1;
    float _480 = float(_462);
    float _482 = float(_452);
    int _484 = ~_464;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = abs(_478);
    float _492 = _480 * _482;
    int _494 = _488;
    if (!_414)
    {
        int _496 = ~_464;
        int _498 = _496 + 1;
        _494 = _498;
    }
    int _500 = _494;
    if (_474)
    {
        float _502 = _390 * _454;
        _118 = _502;
    }
    float _504 = _118;
    bool _506 = _416 > 0.0;
    float _508 = _492 * (-2.0);
    float _510 = float(_490);
    float _512 = _344 + (-0.5);
    float _514 = float(_500);
    bool _516 = _416 >= 0.0;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_508, _456, _456);
    bool _528 = !_356;
    int _530 = _528 ? 0 : 1;
    float _532 = _510 * _514;
    int _534 = _524 ? 0 : 1;
    float _536 = fma(_424, _508, _424);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].x, _526);
    float _540 = _532 * (-2.0);
    int _542 = abs(_530);
    float _544 = _358 + (-0.5);
    int _546 = ~_534;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    float _552 = fma(_540, _458, _458);
    int _554 = _550;
    bool _556 = _524;
    if (!_506)
    {
        int _558 = ~_534;
        int _560 = _558 + 1;
        _554 = _560;
    }
    int _562 = _554;
    float _564 = fma(_536, _504, _538);
    float _566 = float(_542);
    float _568 = fma(_408, _540, _408);
    float _570 = float(_562);
    float _572 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _552);
    float _574 = _344 + _338;
    float _576 = _564 * 0.15915493667125701904296875;
    float _578 = _566 * _570;
    float _580 = fma(_568, _504, _572);
    float _582 = _574 + (-1.0);
    float _584 = in.m_43.x;
    float _586 = in.m_43.y;
    float _588 = in.m_43.z;
    float _590 = _578 * (-2.0);
    float _592 = _576 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = in.m_45.x;
    float _600 = in.m_45.y;
    float _602 = in.m_45.z;
    float _604 = fma(_590, _460, _460);
    float _606 = _338 + (-0.5);
    float _608 = fma(_596, _590, _596);
    float _610 = _580 * 0.15915493667125701904296875;
    bool _612 = _358 > 0.5;
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _604);
    float _616 = _576 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = fma(_608, _504, _614);
    bool _622 = _338 > 0.5;
    float _624 = _610 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = _620 * 0.15915493667125701904296875;
    float _630 = _306 * _588;
    float _632 = _304 * _586;
    float _634 = _302 * _584;
    float _636 = _610 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _598);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _602);
    float _646 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _650 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = _628 * 6.283185482025146484375;
    float _654 = cos(_652);
    float _656 = _646 * _642;
    float _658 = _648 * _644;
    float _660 = _650 * _640;
    float _662 = in.m_32.x;
    float _664 = in.m_32.y;
    float _666 = in.m_32.z;
    float _668 = _618 * _626;
    float _670 = _594 * _626;
    float _672 = _628 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _594 * _638;
    float _678 = _618 * _638;
    float _680 = _654 * _656;
    float _682 = _626 * _654;
    float _684 = _638 * _654;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _688 = _618 * _680;
    float _690 = _594 * _680;
    float _692 = as_type<float>(in.m_49.z);
    float _694 = -_668;
    float _696 = fma(_674, _676, _694);
    float _698 = -_676;
    float _700 = fma(_674, _668, _698);
    float _702 = fma(_674, _678, _670);
    float _704 = _674 * _656;
    float _706 = fma(_674, _670, _678);
    float _708 = fma(_696, _660, _690);
    float _710 = fma(_702, _660, _688);
    float _712 = -_704;
    float _714 = fma(_684, _660, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = fma(_706, _658, _708);
    float _720 = fma(_700, _658, _710);
    float _722 = fma(_682, _658, _714);
    float _724 = _664 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _726 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _728 = _720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _732 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _724);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _730);
    float _740 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[6].z, _732);
    float _742 = _734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[24].z, _736);
    float _746 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _748 = _740 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _750 = as_type<float>(in.m_49.x);
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _756 = as_type<float>(in.m_49.y);
    float _758 = _742 + _752;
    float _760 = _748 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _766 = in.m_51.y;
    float _768 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _770 = _758 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _774 = _760 + _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _764;
    float _782 = _770 * _770;
    float _784 = _774 * _774;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _788 = _786 != 0;
    float _790 = _664 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _794 = _792 != 0;
    float _796 = _782 + _784;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    float _802 = in.m_51.x;
    float _804 = sqrt(_796);
    float _806 = _720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_53.z = _692;
    int _808 = as_type<int>(_774);
    int _810 = as_type<int>(_692);
    if (_778)
    {
        bool _812 = _344 > 0.5;
        _556 = _812;
    }
    bool _814 = _556;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _816;
    float _820 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    out.m_53.x = _750;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _336 + _822;
    float _826 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _806);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = -_766;
    float _832 = _830 + 1.0;
    bool _834 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _836 = isnan(_336);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _818 * _780;
    float _848 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    bool _850 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_336);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _864 = _622 ? _832 : _766;
    float _866 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _868 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -_860;
    float _872 = _870 + 1.0;
    float _874 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = _848 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.y = _756;
    float _878 = _844 * _872;
    float _880 = _766;
    float _882 = _878;
    float _884 = _832;
    float _886 = _864;
    float _888 = _866;
    float _890 = _874;
    float _892 = _876;
    if (!_778)
    {
        _446 = _802;
    }
    float _894 = _446;
    float _896 = _874 + _876;
    float _898 = _866 * _878;
    float _900 = _794 ? _864 : _766;
    float _902 = _894;
    if (_800)
    {
        float _904 = _612 ? _832 : _766;
        _880 = _904;
    }
    float _906 = _880;
    if (!_868)
    {
        _882 = _784;
    }
    float _908 = _882;
    float _910 = _908;
    if (!_868)
    {
        _884 = _782;
    }
    float _912 = _884;
    float _914 = _912;
    if (!_868)
    {
        _886 = _758;
    }
    float _916 = _886;
    float _918 = _916;
    if (!_868)
    {
        _888 = _760;
    }
    float _920 = _888;
    float _922 = _920;
    if (!_868)
    {
        _890 = _896;
    }
    float _924 = _890;
    bool _926 = !_868;
    float _928 = _924;
    if (!_926)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _804 + _932;
        float _936 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = rsqrt(_796);
        float _940 = _934 * _930;
        float _942 = _940 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _954 = _938 * _952;
        float _956 = _950 + (-1.0);
        float _958 = fma(_770, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_774, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _962 = _956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _966 = _958 + _964;
        float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _970 = _960 + _968;
        float _972 = fma(_896, _950, _962);
        float _974 = _966 * _966;
        float _976 = _970 * _970;
        _928 = _972;
        _914 = _974;
        _910 = _976;
        _808 = as_type<int>(_970);
        _892 = _942;
        _918 = _958;
        _922 = _960;
    }
    float _978 = _928;
    float _980 = _914;
    float _982 = _910;
    int _984 = _808;
    float _986 = _892;
    float _988 = _918;
    float _990 = _922;
    float _992 = -_844;
    float _994 = _992 + 1.0;
    float _996 = _986;
    int _998 = _984;
    if (_788)
    {
        float _1000 = -_802;
        float _1002 = _1000 + 1.0;
        _810 = as_type<int>(_1002);
    }
    int _1004 = _810;
    float _1006 = _900 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    if (!_788)
    {
        _996 = _802;
    }
    float _1008 = _996;
    float _1010 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _978 + _1012;
    float _1016 = _1008;
    if (_788)
    {
        float _1018 = _612 ? as_type<float>(_1004) : _802;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = as_type<float>(in.m_49.w);
    float _1026 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1028 = _1006 * _862;
    float _1030 = fma(_1014, _1014, _980);
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_778)
    {
        float _1034 = -_802;
        float _1036 = _1034 + 1.0;
        _998 = as_type<int>(_1036);
    }
    int _1038 = _998;
    float _1040 = _1030 + _982;
    float _1042 = _1022 * _686;
    if (_778)
    {
        float _1044 = _814 ? as_type<float>(_1038) : _802;
        _902 = _1044;
    }
    float _1046 = _902;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1058 = sqrt(_1040);
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1054 * _1032;
    float _1084 = _1064 * _1050;
    out.m_53.w = _1024;
    bool _1086 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1088 = isnan(_1058);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1094 = _1090 || _1092;
    out.m_55.x = _1076;
    out.m_55.y = _1078;
    out.m_55.z = _1068;
    out.m_57.x = _1070;
    out.m_57.y = _1072;
    out.m_57.z = _1074;
    out.m_57.w = _1080;
    out.m_59.x = _1082;
    out.m_59.y = _1042;
    float _1096 = _1054;
    if (!_1094)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    out.m_61.x = _1084;
    out.m_61.y = _1028;
    bool _1100 = !_1094;
    float _1102 = _1098;
    if (!_1100)
    {
        bool _1104 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1106 = isnan(_1058);
        bool _1108 = _1104 || _1106;
        bool _1110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1112 = _1108 || _1110;
        if (!_1112)
        {
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1116 = _1058 + _1114;
            float _1118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1120 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1126 = 1.0 / _1120;
            float _1128 = _1116 * _1126;
            float _1130 = fma(_1128, _1124, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1102 = _1130;
            _1132 = true;
        }
        else
        {
            bool _1134 = _1058 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1136 = isnan(_1058);
            bool _1138 = _1134 || _1136;
            bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1142 = _1138 || _1140;
            if (!_1142)
            {
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1146 = _1058 + _1144;
                float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1150 = _1148 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1154 = _1152 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1156 = 1.0 / _1150;
                float _1158 = _1146 * _1156;
                float _1160 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1102 = _1160;
                _1132 = true;
            }
            else
            {
                _1102 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1132 = false;
    float _1162 = _1102;
    float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1166 = _978 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1170 = _988 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1174 = _990 + _1172;
    float _1176 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = fma(_1170, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1180 = fma(_1174, _1162, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1192 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1200 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1192);
    float _1202 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1204 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1218);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1222);
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1224);
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1226);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1228);
    float _1238 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1240 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1232);
    float _1244 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1246 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    out.m_63.w = _1238;
    out.gl_Position.x = _1240;
    out.gl_Position.y = _1242;
    out.gl_Position.z = _1244;
    out.gl_Position.w = _1246;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

