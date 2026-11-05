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
    float4 m_49 [[user(locn0)]];
    float4 m_35 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _888 = false;
    bool _148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1142 = as_type<float>(_84);
        out.gl_Position.z = _1142;
    }
    if (!_74)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_70);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_35.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1212 = as_type<float>(_124);
        out.gl_Position.z = _1212;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _128 = !_126;
    float _146;
    if (!_128)
    {
        float _130 = in.m_39.x;
        float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _134 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _138 = _136 * _132;
        float _140 = floor(_138);
        float _142 = -_140;
        float _144 = _138 + _142;
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = float(_70);
        float _152 = 1.0 / _150;
        float _154 = _102 * _152;
        _146 = _154;
    }
    _148 = false;
    float _156 = _146;
    float _158 = in.m_39.x;
    float _160 = in.m_39.y;
    float _162 = in.m_39.z;
    float _164 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _166 = _156 + _164;
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _156 + _188;
    float _192 = 1.0 / _170;
    float _194 = 1.0 / _174;
    float _196 = _162 * 2.0;
    float _198 = _158 * 2.0;
    float _200 = _162 + _158;
    float _202 = _160 + _158;
    float _204 = floor(_196);
    float _206 = _158 + (-0.5);
    float _208 = _160 * 2.0;
    float _210 = _160 + _162;
    float _212 = _162 + (-0.5);
    float _214 = _190 * _192;
    float _216 = _202 + (-1.0);
    float _218 = _200 + (-1.0);
    float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _222 = log2(_220);
    float _224 = _160 + (-0.5);
    float _226 = _210 + (-1.0);
    float _228 = _166 * _194;
    bool _230 = !_178;
    int _232 = _230 ? 0 : 1;
    float _234 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _236 = floor(_198);
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = _248 ? 0 : 1;
    float _252 = floor(_208);
    float _254 = _222 * _102;
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _258 = ~_250;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    int _268 = abs(_232);
    int _270 = _262;
    if (!_238)
    {
        int _272 = ~_250;
        int _274 = _272 + 1;
        _270 = _274;
    }
    int _276 = _270;
    float _278 = exp2(_254);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _236 > 0.0;
    float _286 = fma(_266, _214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _288 = _236 >= 0.0;
    bool _290 = isnan(_236);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    bool _304 = _252 > 0.0;
    float _306 = fma(_282, _214, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _252 >= 0.0;
    bool _310 = isnan(_252);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _320 = 1.0 + _318;
    float _322 = in.m_41.x;
    float _324 = in.m_41.y;
    float _326 = in.m_41.z;
    float _328 = fma(_302, _214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _296 ? 0 : 1;
    float _332 = 1.0 / _320;
    bool _334 = !_182;
    int _336 = _334 ? 0 : 1;
    float _338 = -_278;
    float _340 = _338 + 1.0;
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    int _358 = _346;
    if (!_284)
    {
        int _360 = ~_330;
        int _362 = _360 + 1;
        _358 = _362;
    }
    int _364 = _358;
    int _366 = abs(_336);
    float _368 = float(_268);
    float _370 = float(_276);
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = float(_366);
    float _384 = _368 * _370;
    float _386 = _380 ? _340 : 0.0;
    float _388 = float(_364);
    float _390 = _384 * (-2.0);
    int _392 = _316 ? 0 : 1;
    if (_356)
    {
        float _394 = _386 * _332;
        _106 = _394;
    }
    float _396 = _106;
    bool _398 = !_186;
    int _400 = _398 ? 0 : 1;
    float _402 = fma(_390, _322, _322);
    int _404 = ~_392;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = _382 * _388;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _416 = _408;
    if (!_304)
    {
        int _418 = ~_392;
        int _420 = _418 + 1;
        _416 = _420;
    }
    int _422 = _416;
    float _424 = fma(_298, _390, _298);
    int _426 = abs(_400);
    float _428 = fma(_414, _228, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = float(_422);
    float _432 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _434 = float(_426);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = _410 * (-2.0);
    float _446 = fma(_424, _396, _432);
    float _448 = _434 * _430;
    float _450 = fma(_438, _228, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_442, _228, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _454 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_156);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = _448 * (-2.0);
    float _468 = fma(_444, _324, _324);
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _446 * 0.15915493667125701904296875;
    float _484 = -_464;
    float _486 = _484 + 1.0;
    float _488 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].y, _468);
    float _490 = fma(_234, _444, _234);
    bool _492 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_156);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_480;
    float _506 = _504 + 1.0;
    float _508 = fma(_466, _326, _326);
    float _510 = _480 * _486;
    float _512 = fma(_490, _396, _488);
    float _514 = in.m_43.x;
    float _516 = in.m_43.y;
    float _518 = in.m_43.z;
    float _520 = _502 * _506;
    float _522 = -_502;
    float _524 = _522 + 1.0;
    float _526 = _512 * 0.15915493667125701904296875;
    float _528 = in.m_45.x;
    float _530 = in.m_45.y;
    float _532 = in.m_45.z;
    float _534 = _286 * _520;
    float _536 = _328 * _520;
    float _538 = _306 * _520;
    float _540 = fma(_256, _466, _256);
    float _542 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _550 = fma(_540, _396, _542);
    float _552 = fma(_450, _510, _544);
    float _554 = fma(_428, _510, _546);
    float _556 = fma(_452, _510, _548);
    float _558 = _550 * 0.15915493667125701904296875;
    float _560 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _562 = _482 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].x, _554);
    float _568 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].z, _556);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _514);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _516);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _518);
    float _576 = _558 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _560 * _530;
    float _582 = in.m_32.x;
    float _584 = in.m_32.y;
    float _586 = in.m_32.z;
    float _588 = _568 * _532;
    float _590 = _566 * _528;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _594 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _596 = _482 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _602 = _592 * _572;
    float _604 = _594 * _574;
    float _606 = _600 * _570;
    float _608 = _526 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _578 * _602;
    float _614 = _526 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = _598 * _612;
    float _620 = _558 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = _564 * _610;
    float _626 = _598 * _610;
    float _628 = _610 * _578;
    float _630 = _598 * _616;
    float _632 = _564 * _616;
    float _634 = _616 * _578;
    float _636 = _564 * _612;
    float _638 = _622 * _602;
    float _640 = fma(_622, _630, _624);
    float _642 = -_626;
    float _644 = fma(_622, _632, _642);
    float _646 = -_632;
    float _648 = fma(_622, _626, _646);
    float _650 = -_638;
    float _652 = fma(_634, _606, _650);
    float _654 = fma(_640, _606, _618);
    float _656 = fma(_622, _624, _630);
    float _658 = fma(_644, _606, _636);
    float _660 = fma(_628, _604, _652);
    float _662 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = fma(_648, _604, _654);
    float _668 = fma(_656, _604, _658);
    float _670 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _672 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _672);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _688 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _682);
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _696 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _698 = _686 + _690;
    float _700 = _688 + _692;
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _704 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _696);
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _698 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _716 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _704);
    float _718 = _708 * _708;
    float _720 = _712 * _712;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _718 + _720;
    float _726 = _722 + _716;
    float _728 = sqrt(_724);
    bool _730 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = _668;
    float _734 = _716;
    float _736 = _586;
    float _738 = _666;
    float _740 = _698;
    if (!_730)
    {
        _732 = _720;
    }
    float _742 = _732;
    float _744 = _742;
    if (!_730)
    {
        _734 = _718;
    }
    float _746 = _734;
    float _748 = _746;
    if (!_730)
    {
        _736 = _700;
    }
    float _750 = _736;
    float _752 = _750;
    if (!_730)
    {
        _738 = _726;
    }
    float _754 = _738;
    bool _756 = !_730;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _728 + _762;
        float _766 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_724);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = sin(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = fma(_776, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _784 = _768 * _782;
        float _786 = _780 + (-1.0);
        float _788 = fma(_708, _784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _790 = fma(_712, _784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _792 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _796 = _788 + _794;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _800 = _790 + _798;
        float _802 = fma(_726, _780, _792);
        float _804 = _796 * _796;
        float _806 = _800 * _800;
        _758 = _802;
        _748 = _804;
        _744 = _806;
        _740 = _788;
        _752 = _790;
    }
    float _808 = _758;
    float _810 = _748;
    float _812 = _744;
    float _814 = _740;
    float _816 = _752;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _820 = _808 + _818;
    float _822 = fma(_820, _820, _810);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _826 = _822 + _812;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = sqrt(_826);
    float _836 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _836;
    out.m_49.y = _838;
    out.m_49.z = _840;
    out.m_49.w = _832;
    bool _842 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _844 = isnan(_834);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _850 = _846 || _848;
    float _852 = _824;
    if (!_850)
    {
        _852 = 1.0;
    }
    float _854 = _852;
    bool _856 = !_850;
    float _858 = _854;
    if (!_856)
    {
        bool _860 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _862 = isnan(_834);
        bool _864 = _860 || _862;
        bool _866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _868 = _864 || _866;
        if (!_868)
        {
            float _870 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _872 = _834 + _870;
            float _874 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _876 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _874;
            float _878 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _880 = _878 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _882 = 1.0 / _876;
            float _884 = _872 * _882;
            float _886 = fma(_884, _880, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _858 = _886;
            _888 = true;
        }
        else
        {
            bool _890 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _892 = isnan(_834);
            bool _894 = _890 || _892;
            bool _896 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _898 = _894 || _896;
            if (!_898)
            {
                float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _902 = _834 + _900;
                float _904 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _908 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _910 = _908 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _912 = 1.0 / _906;
                float _914 = _902 * _912;
                float _916 = fma(_914, _910, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _858 = _916;
                _888 = true;
            }
            else
            {
                _858 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _888 = false;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _922 = _808 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _926 = _814 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _930 = _816 + _928;
    bool _932 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_922, _918, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _944 = fma(_926, _918, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _946 = fma(_930, _918, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _948 = _918;
    float _950 = _926;
    float _952 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_940)
    {
        _948 = _944;
    }
    float _954 = _948;
    float _956 = _954;
    if (_940)
    {
        _950 = _942;
    }
    float _958 = _950;
    float _960 = _958;
    if (_940)
    {
        _952 = _946;
    }
    float _962 = _952;
    float _964 = _962;
    if (!_940)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _722 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _686 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _688 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_686;
        float _998 = _996 + _944;
        float _1000 = -_722;
        float _1002 = _1000 + _942;
        float _1004 = _990 * _994;
        float _1006 = -_688;
        float _1008 = _1006 + _946;
        float _1010 = fma(_998, _1004, _686);
        float _1012 = fma(_1002, _1004, _722);
        float _1014 = fma(_1008, _1004, _688);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1024);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1026);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1030);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1042 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1054);
    float _1064 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1058);
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1070 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1062);
    float _1072 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1066);
    float _1076 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1068);
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1070);
    float _1082 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1084 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1074);
    float _1086 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1076);
    out.m_35.x = 1.0;
    out.m_51.w = _1078;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1080;
    out.gl_Position.w = _1086;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _888 = false;
    bool _148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1142 = as_type<float>(_84);
        out.gl_Position.z = _1142;
    }
    if (!_74)
    {
        return out;
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_70);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_35.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1212 = as_type<float>(_124);
        out.gl_Position.z = _1212;
    }
    if (_116)
    {
        return out;
    }
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _128 = !_126;
    float _146;
    if (!_128)
    {
        float _130 = in.m_39.x;
        float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _134 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _138 = _136 * _132;
        float _140 = floor(_138);
        float _142 = -_140;
        float _144 = _138 + _142;
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = float(_70);
        float _152 = 1.0 / _150;
        float _154 = _102 * _152;
        _146 = _154;
    }
    _148 = false;
    float _156 = _146;
    float _158 = in.m_39.x;
    float _160 = in.m_39.y;
    float _162 = in.m_39.z;
    float _164 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _166 = _156 + _164;
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _156 + _188;
    float _192 = 1.0 / _170;
    float _194 = 1.0 / _174;
    float _196 = _162 * 2.0;
    float _198 = _158 * 2.0;
    float _200 = _162 + _158;
    float _202 = _160 + _158;
    float _204 = floor(_196);
    float _206 = _158 + (-0.5);
    float _208 = _160 * 2.0;
    float _210 = _160 + _162;
    float _212 = _162 + (-0.5);
    float _214 = _190 * _192;
    float _216 = _202 + (-1.0);
    float _218 = _200 + (-1.0);
    float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _222 = log2(_220);
    float _224 = _160 + (-0.5);
    float _226 = _210 + (-1.0);
    float _228 = _166 * _194;
    bool _230 = !_178;
    int _232 = _230 ? 0 : 1;
    float _234 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _236 = floor(_198);
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = _248 ? 0 : 1;
    float _252 = floor(_208);
    float _254 = _222 * _102;
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _258 = ~_250;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    int _268 = abs(_232);
    int _270 = _262;
    if (!_238)
    {
        int _272 = ~_250;
        int _274 = _272 + 1;
        _270 = _274;
    }
    int _276 = _270;
    float _278 = exp2(_254);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _236 > 0.0;
    float _286 = fma(_266, _214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _288 = _236 >= 0.0;
    bool _290 = isnan(_236);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    bool _304 = _252 > 0.0;
    float _306 = fma(_282, _214, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _252 >= 0.0;
    bool _310 = isnan(_252);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _320 = 1.0 + _318;
    float _322 = in.m_41.x;
    float _324 = in.m_41.y;
    float _326 = in.m_41.z;
    float _328 = fma(_302, _214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _296 ? 0 : 1;
    float _332 = 1.0 / _320;
    bool _334 = !_182;
    int _336 = _334 ? 0 : 1;
    float _338 = -_278;
    float _340 = _338 + 1.0;
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    int _358 = _346;
    if (!_284)
    {
        int _360 = ~_330;
        int _362 = _360 + 1;
        _358 = _362;
    }
    int _364 = _358;
    int _366 = abs(_336);
    float _368 = float(_268);
    float _370 = float(_276);
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = float(_366);
    float _384 = _368 * _370;
    float _386 = _380 ? _340 : 0.0;
    float _388 = float(_364);
    float _390 = _384 * (-2.0);
    int _392 = _316 ? 0 : 1;
    if (_356)
    {
        float _394 = _386 * _332;
        _106 = _394;
    }
    float _396 = _106;
    bool _398 = !_186;
    int _400 = _398 ? 0 : 1;
    float _402 = fma(_390, _322, _322);
    int _404 = ~_392;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = _382 * _388;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _416 = _408;
    if (!_304)
    {
        int _418 = ~_392;
        int _420 = _418 + 1;
        _416 = _420;
    }
    int _422 = _416;
    float _424 = fma(_298, _390, _298);
    int _426 = abs(_400);
    float _428 = fma(_414, _228, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = float(_422);
    float _432 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _434 = float(_426);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = _410 * (-2.0);
    float _446 = fma(_424, _396, _432);
    float _448 = _434 * _430;
    float _450 = fma(_438, _228, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_442, _228, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _454 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_156);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = _448 * (-2.0);
    float _468 = fma(_444, _324, _324);
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _446 * 0.15915493667125701904296875;
    float _484 = -_464;
    float _486 = _484 + 1.0;
    float _488 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].y, _468);
    float _490 = fma(_234, _444, _234);
    bool _492 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_156);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_480;
    float _506 = _504 + 1.0;
    float _508 = fma(_466, _326, _326);
    float _510 = _480 * _486;
    float _512 = fma(_490, _396, _488);
    float _514 = in.m_43.x;
    float _516 = in.m_43.y;
    float _518 = in.m_43.z;
    float _520 = _502 * _506;
    float _522 = -_502;
    float _524 = _522 + 1.0;
    float _526 = _512 * 0.15915493667125701904296875;
    float _528 = in.m_45.x;
    float _530 = in.m_45.y;
    float _532 = in.m_45.z;
    float _534 = _286 * _520;
    float _536 = _328 * _520;
    float _538 = _306 * _520;
    float _540 = fma(_256, _466, _256);
    float _542 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _550 = fma(_540, _396, _542);
    float _552 = fma(_450, _510, _544);
    float _554 = fma(_428, _510, _546);
    float _556 = fma(_452, _510, _548);
    float _558 = _550 * 0.15915493667125701904296875;
    float _560 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _562 = _482 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].x, _554);
    float _568 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].z, _556);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _514);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _516);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _518);
    float _576 = _558 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _560 * _530;
    float _582 = in.m_32.x;
    float _584 = in.m_32.y;
    float _586 = in.m_32.z;
    float _588 = _568 * _532;
    float _590 = _566 * _528;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _594 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _596 = _482 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _602 = _592 * _572;
    float _604 = _594 * _574;
    float _606 = _600 * _570;
    float _608 = _526 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _578 * _602;
    float _614 = _526 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = _598 * _612;
    float _620 = _558 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = _564 * _610;
    float _626 = _598 * _610;
    float _628 = _610 * _578;
    float _630 = _598 * _616;
    float _632 = _564 * _616;
    float _634 = _616 * _578;
    float _636 = _564 * _612;
    float _638 = _622 * _602;
    float _640 = fma(_622, _630, _624);
    float _642 = -_626;
    float _644 = fma(_622, _632, _642);
    float _646 = -_632;
    float _648 = fma(_622, _626, _646);
    float _650 = -_638;
    float _652 = fma(_634, _606, _650);
    float _654 = fma(_640, _606, _618);
    float _656 = fma(_622, _624, _630);
    float _658 = fma(_644, _606, _636);
    float _660 = fma(_628, _604, _652);
    float _662 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = fma(_648, _604, _654);
    float _668 = fma(_656, _604, _658);
    float _670 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _672 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _672);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _688 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _682);
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _696 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _698 = _686 + _690;
    float _700 = _688 + _692;
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _704 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _696);
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _698 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _716 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _704);
    float _718 = _708 * _708;
    float _720 = _712 * _712;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _718 + _720;
    float _726 = _722 + _716;
    float _728 = sqrt(_724);
    bool _730 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = _668;
    float _734 = _716;
    float _736 = _586;
    float _738 = _666;
    float _740 = _698;
    if (!_730)
    {
        _732 = _720;
    }
    float _742 = _732;
    float _744 = _742;
    if (!_730)
    {
        _734 = _718;
    }
    float _746 = _734;
    float _748 = _746;
    if (!_730)
    {
        _736 = _700;
    }
    float _750 = _736;
    float _752 = _750;
    if (!_730)
    {
        _738 = _726;
    }
    float _754 = _738;
    bool _756 = !_730;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _728 + _762;
        float _766 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_724);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = sin(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = fma(_776, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _784 = _768 * _782;
        float _786 = _780 + (-1.0);
        float _788 = fma(_708, _784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _790 = fma(_712, _784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _792 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _796 = _788 + _794;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _800 = _790 + _798;
        float _802 = fma(_726, _780, _792);
        float _804 = _796 * _796;
        float _806 = _800 * _800;
        _758 = _802;
        _748 = _804;
        _744 = _806;
        _740 = _788;
        _752 = _790;
    }
    float _808 = _758;
    float _810 = _748;
    float _812 = _744;
    float _814 = _740;
    float _816 = _752;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _820 = _808 + _818;
    float _822 = fma(_820, _820, _810);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _826 = _822 + _812;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = sqrt(_826);
    float _836 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _836;
    out.m_49.y = _838;
    out.m_49.z = _840;
    out.m_49.w = _832;
    bool _842 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _844 = isnan(_834);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _850 = _846 || _848;
    float _852 = _824;
    if (!_850)
    {
        _852 = 1.0;
    }
    float _854 = _852;
    bool _856 = !_850;
    float _858 = _854;
    if (!_856)
    {
        bool _860 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _862 = isnan(_834);
        bool _864 = _860 || _862;
        bool _866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _868 = _864 || _866;
        if (!_868)
        {
            float _870 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _872 = _834 + _870;
            float _874 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _876 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _874;
            float _878 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _880 = _878 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _882 = 1.0 / _876;
            float _884 = _872 * _882;
            float _886 = fma(_884, _880, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _858 = _886;
            _888 = true;
        }
        else
        {
            bool _890 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _892 = isnan(_834);
            bool _894 = _890 || _892;
            bool _896 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _898 = _894 || _896;
            if (!_898)
            {
                float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _902 = _834 + _900;
                float _904 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _908 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _910 = _908 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _912 = 1.0 / _906;
                float _914 = _902 * _912;
                float _916 = fma(_914, _910, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _858 = _916;
                _888 = true;
            }
            else
            {
                _858 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _888 = false;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _922 = _808 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _926 = _814 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _930 = _816 + _928;
    bool _932 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_922, _918, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _944 = fma(_926, _918, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _946 = fma(_930, _918, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _948 = _918;
    float _950 = _926;
    float _952 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_940)
    {
        _948 = _944;
    }
    float _954 = _948;
    float _956 = _954;
    if (_940)
    {
        _950 = _942;
    }
    float _958 = _950;
    float _960 = _958;
    if (_940)
    {
        _952 = _946;
    }
    float _962 = _952;
    float _964 = _962;
    if (!_940)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _722 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _686 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _688 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_686;
        float _998 = _996 + _944;
        float _1000 = -_722;
        float _1002 = _1000 + _942;
        float _1004 = _990 * _994;
        float _1006 = -_688;
        float _1008 = _1006 + _946;
        float _1010 = fma(_998, _1004, _686);
        float _1012 = fma(_1002, _1004, _722);
        float _1014 = fma(_1008, _1004, _688);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1024);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1026);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1030);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1042 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1054);
    float _1064 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1058);
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1070 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1062);
    float _1072 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1066);
    float _1076 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1068);
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1070);
    float _1082 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1084 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1074);
    float _1086 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1076);
    out.m_35.x = 1.0;
    out.m_51.w = _1078;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1080;
    out.gl_Position.w = _1086;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _888 = false;
    bool _148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1142 = as_type<float>(_84);
        out.gl_Position.z = _1142;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_70);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_35.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1212 = as_type<float>(_124);
        out.gl_Position.z = _1212;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _128 = !_126;
    float _146;
    if (!_128)
    {
        float _130 = in.m_39.x;
        float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _134 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _138 = _136 * _132;
        float _140 = floor(_138);
        float _142 = -_140;
        float _144 = _138 + _142;
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = float(_70);
        float _152 = 1.0 / _150;
        float _154 = _102 * _152;
        _146 = _154;
    }
    _148 = false;
    float _156 = _146;
    float _158 = in.m_39.x;
    float _160 = in.m_39.y;
    float _162 = in.m_39.z;
    float _164 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _166 = _156 + _164;
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _156 + _188;
    float _192 = 1.0 / _170;
    float _194 = 1.0 / _174;
    float _196 = _162 * 2.0;
    float _198 = _158 * 2.0;
    float _200 = _162 + _158;
    float _202 = _160 + _158;
    float _204 = floor(_196);
    float _206 = _158 + (-0.5);
    float _208 = _160 * 2.0;
    float _210 = _160 + _162;
    float _212 = _162 + (-0.5);
    float _214 = _190 * _192;
    float _216 = _202 + (-1.0);
    float _218 = _200 + (-1.0);
    float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _222 = log2(_220);
    float _224 = _160 + (-0.5);
    float _226 = _210 + (-1.0);
    float _228 = _166 * _194;
    bool _230 = !_178;
    int _232 = _230 ? 0 : 1;
    float _234 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _236 = floor(_198);
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = _248 ? 0 : 1;
    float _252 = floor(_208);
    float _254 = _222 * _102;
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _258 = ~_250;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    int _268 = abs(_232);
    int _270 = _262;
    if (!_238)
    {
        int _272 = ~_250;
        int _274 = _272 + 1;
        _270 = _274;
    }
    int _276 = _270;
    float _278 = exp2(_254);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _236 > 0.0;
    float _286 = fma(_266, _214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _288 = _236 >= 0.0;
    bool _290 = isnan(_236);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    bool _304 = _252 > 0.0;
    float _306 = fma(_282, _214, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _308 = _252 >= 0.0;
    bool _310 = isnan(_252);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _320 = 1.0 + _318;
    float _322 = in.m_41.x;
    float _324 = in.m_41.y;
    float _326 = in.m_41.z;
    float _328 = fma(_302, _214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _296 ? 0 : 1;
    float _332 = 1.0 / _320;
    bool _334 = !_182;
    int _336 = _334 ? 0 : 1;
    float _338 = -_278;
    float _340 = _338 + 1.0;
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = _344 + 1;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    int _358 = _346;
    if (!_284)
    {
        int _360 = ~_330;
        int _362 = _360 + 1;
        _358 = _362;
    }
    int _364 = _358;
    int _366 = abs(_336);
    float _368 = float(_268);
    float _370 = float(_276);
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = float(_366);
    float _384 = _368 * _370;
    float _386 = _380 ? _340 : 0.0;
    float _388 = float(_364);
    float _390 = _384 * (-2.0);
    int _392 = _316 ? 0 : 1;
    if (_356)
    {
        float _394 = _386 * _332;
        _106 = _394;
    }
    float _396 = _106;
    bool _398 = !_186;
    int _400 = _398 ? 0 : 1;
    float _402 = fma(_390, _322, _322);
    int _404 = ~_392;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = _382 * _388;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _416 = _408;
    if (!_304)
    {
        int _418 = ~_392;
        int _420 = _418 + 1;
        _416 = _420;
    }
    int _422 = _416;
    float _424 = fma(_298, _390, _298);
    int _426 = abs(_400);
    float _428 = fma(_414, _228, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = float(_422);
    float _432 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _434 = float(_426);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = _410 * (-2.0);
    float _446 = fma(_424, _396, _432);
    float _448 = _434 * _430;
    float _450 = fma(_438, _228, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_442, _228, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _454 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _456 = isnan(_156);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = _448 * (-2.0);
    float _468 = fma(_444, _324, _324);
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _446 * 0.15915493667125701904296875;
    float _484 = -_464;
    float _486 = _484 + 1.0;
    float _488 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].y, _468);
    float _490 = fma(_234, _444, _234);
    bool _492 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_156);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_480;
    float _506 = _504 + 1.0;
    float _508 = fma(_466, _326, _326);
    float _510 = _480 * _486;
    float _512 = fma(_490, _396, _488);
    float _514 = in.m_43.x;
    float _516 = in.m_43.y;
    float _518 = in.m_43.z;
    float _520 = _502 * _506;
    float _522 = -_502;
    float _524 = _522 + 1.0;
    float _526 = _512 * 0.15915493667125701904296875;
    float _528 = in.m_45.x;
    float _530 = in.m_45.y;
    float _532 = in.m_45.z;
    float _534 = _286 * _520;
    float _536 = _328 * _520;
    float _538 = _306 * _520;
    float _540 = fma(_256, _466, _256);
    float _542 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _550 = fma(_540, _396, _542);
    float _552 = fma(_450, _510, _544);
    float _554 = fma(_428, _510, _546);
    float _556 = fma(_452, _510, _548);
    float _558 = _550 * 0.15915493667125701904296875;
    float _560 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _562 = _482 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].x, _554);
    float _568 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[145].z, _556);
    float _570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _514);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _516);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _518);
    float _576 = _558 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _560 * _530;
    float _582 = in.m_32.x;
    float _584 = in.m_32.y;
    float _586 = in.m_32.z;
    float _588 = _568 * _532;
    float _590 = _566 * _528;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _594 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _596 = _482 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _602 = _592 * _572;
    float _604 = _594 * _574;
    float _606 = _600 * _570;
    float _608 = _526 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = _578 * _602;
    float _614 = _526 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = _598 * _612;
    float _620 = _558 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = _564 * _610;
    float _626 = _598 * _610;
    float _628 = _610 * _578;
    float _630 = _598 * _616;
    float _632 = _564 * _616;
    float _634 = _616 * _578;
    float _636 = _564 * _612;
    float _638 = _622 * _602;
    float _640 = fma(_622, _630, _624);
    float _642 = -_626;
    float _644 = fma(_622, _632, _642);
    float _646 = -_632;
    float _648 = fma(_622, _626, _646);
    float _650 = -_638;
    float _652 = fma(_634, _606, _650);
    float _654 = fma(_640, _606, _618);
    float _656 = fma(_622, _624, _630);
    float _658 = fma(_644, _606, _636);
    float _660 = fma(_628, _604, _652);
    float _662 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = fma(_648, _604, _654);
    float _668 = fma(_656, _604, _658);
    float _670 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _672 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _680 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _672);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _688 = _680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _682);
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _696 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _698 = _686 + _690;
    float _700 = _688 + _692;
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _704 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _696);
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _698 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _716 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _704);
    float _718 = _708 * _708;
    float _720 = _712 * _712;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _718 + _720;
    float _726 = _722 + _716;
    float _728 = sqrt(_724);
    bool _730 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = _668;
    float _734 = _716;
    float _736 = _586;
    float _738 = _666;
    float _740 = _698;
    if (!_730)
    {
        _732 = _720;
    }
    float _742 = _732;
    float _744 = _742;
    if (!_730)
    {
        _734 = _718;
    }
    float _746 = _734;
    float _748 = _746;
    if (!_730)
    {
        _736 = _700;
    }
    float _750 = _736;
    float _752 = _750;
    if (!_730)
    {
        _738 = _726;
    }
    float _754 = _738;
    bool _756 = !_730;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _728 + _762;
        float _766 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_724);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = sin(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = fma(_776, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _784 = _768 * _782;
        float _786 = _780 + (-1.0);
        float _788 = fma(_708, _784, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _790 = fma(_712, _784, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _792 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _796 = _788 + _794;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _800 = _790 + _798;
        float _802 = fma(_726, _780, _792);
        float _804 = _796 * _796;
        float _806 = _800 * _800;
        _758 = _802;
        _748 = _804;
        _744 = _806;
        _740 = _788;
        _752 = _790;
    }
    float _808 = _758;
    float _810 = _748;
    float _812 = _744;
    float _814 = _740;
    float _816 = _752;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _820 = _808 + _818;
    float _822 = fma(_820, _820, _810);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _826 = _822 + _812;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = sqrt(_826);
    float _836 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _836;
    out.m_49.y = _838;
    out.m_49.z = _840;
    out.m_49.w = _832;
    bool _842 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _844 = isnan(_834);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _850 = _846 || _848;
    float _852 = _824;
    if (!_850)
    {
        _852 = 1.0;
    }
    float _854 = _852;
    bool _856 = !_850;
    float _858 = _854;
    if (!_856)
    {
        bool _860 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _862 = isnan(_834);
        bool _864 = _860 || _862;
        bool _866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _868 = _864 || _866;
        if (!_868)
        {
            float _870 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _872 = _834 + _870;
            float _874 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _876 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _874;
            float _878 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _880 = _878 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _882 = 1.0 / _876;
            float _884 = _872 * _882;
            float _886 = fma(_884, _880, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _858 = _886;
            _888 = true;
        }
        else
        {
            bool _890 = _834 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _892 = isnan(_834);
            bool _894 = _890 || _892;
            bool _896 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _898 = _894 || _896;
            if (!_898)
            {
                float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _902 = _834 + _900;
                float _904 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _908 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _910 = _908 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _912 = 1.0 / _906;
                float _914 = _902 * _912;
                float _916 = fma(_914, _910, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _858 = _916;
                _888 = true;
            }
            else
            {
                _858 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _888 = false;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _922 = _808 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _926 = _814 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _930 = _816 + _928;
    bool _932 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _934 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_922, _918, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _944 = fma(_926, _918, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _946 = fma(_930, _918, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _948 = _918;
    float _950 = _926;
    float _952 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_940)
    {
        _948 = _944;
    }
    float _954 = _948;
    float _956 = _954;
    if (_940)
    {
        _950 = _942;
    }
    float _958 = _950;
    float _960 = _958;
    if (_940)
    {
        _952 = _946;
    }
    float _962 = _952;
    float _964 = _962;
    if (!_940)
    {
        float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _968 = _722 + _966;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _972 = _686 + _970;
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _976 = _968 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _980 = _688 + _978;
        float _982 = fma(_972, _972, _976);
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _986 = fma(_980, _980, _982);
        float _988 = sqrt(_986);
        float _990 = _974 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _992 = precise::min(_988, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _994 = _992 * _984;
        float _996 = -_686;
        float _998 = _996 + _944;
        float _1000 = -_722;
        float _1002 = _1000 + _942;
        float _1004 = _990 * _994;
        float _1006 = -_688;
        float _1008 = _1006 + _946;
        float _1010 = fma(_998, _1004, _686);
        float _1012 = fma(_1002, _1004, _722);
        float _1014 = fma(_1008, _1004, _688);
        _960 = _1012;
        _956 = _1010;
        _964 = _1014;
    }
    float _1016 = _960;
    float _1018 = _956;
    float _1020 = _964;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1024);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1026);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1030);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1032);
    float _1042 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1054 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1056 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1054);
    float _1064 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1058);
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1070 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1062);
    float _1072 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1066);
    float _1076 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1068);
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1080 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1070);
    float _1082 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1084 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1074);
    float _1086 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1076);
    out.m_35.x = 1.0;
    out.m_51.w = _1078;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1080;
    out.gl_Position.w = _1086;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

