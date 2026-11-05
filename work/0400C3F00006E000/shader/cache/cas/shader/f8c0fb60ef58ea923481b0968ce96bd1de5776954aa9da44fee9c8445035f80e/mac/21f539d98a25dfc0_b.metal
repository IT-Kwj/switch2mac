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
    float4 m_35 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
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
    bool _1050 = false;
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
        float _1304 = as_type<float>(_84);
        out.gl_Position.z = _1304;
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
        float _1374 = as_type<float>(_124);
        out.gl_Position.z = _1374;
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
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _190 = _188 != 0;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _156 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _156 + _196;
    float _200 = 1.0 / _170;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _206 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = _156 + _216;
    float _220 = 1.0 / _174;
    float _222 = _166 * _102;
    bool _224 = !_182;
    int _226 = _224 ? 0 : 1;
    float _228 = _162 + _158;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _232 = 1.0 + _230;
    float _234 = 1.0 / _178;
    float _236 = _194 * _200;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _156 + _238;
    float _242 = _228 + (-1.0);
    float _244 = _160 + _162;
    float _246 = _162 + (-0.5);
    float _248 = _162 * 2.0;
    bool _250 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _252 = isnan(1.0);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _258 = _254 || _256;
    float _260 = _198 * _220;
    float _262 = exp2(_222);
    float _264 = _158 * 2.0;
    float _266 = _160 * 2.0;
    float _268 = _160 + _158;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _156 + _270;
    float _274 = _240 * _234;
    float _276 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _278 = 1.0 / _232;
    float _280 = _268 + (-1.0);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    float _286 = -_262;
    float _288 = _286 + 1.0;
    float _290 = floor(_248);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = _214 ? _288 : 0.0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = fma(_294, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = 1.0 / _284;
    if (_258)
    {
        float _316 = _304 * _278;
        _106 = _316;
    }
    float _318 = _106;
    float _320 = fma(_308, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_298, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = 1.0 / _204;
    bool _330 = _290 > 0.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _336 = _290 >= 0.0;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_334, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _350 = _344 ? 0 : 1;
    float _352 = floor(_264);
    float _354 = _158 + (-0.5);
    float _356 = _160 + (-0.5);
    float _358 = _244 + (-1.0);
    float _360 = _218 * _314;
    float _362 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _364 = floor(_266);
    float _366 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _368 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_156);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _272 * _328;
    bool _382 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_156);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _352 > 0.0;
    float _408 = -_392;
    float _410 = _408 + 1.0;
    bool _412 = _352 >= 0.0;
    bool _414 = isnan(_352);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    bool _426 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_156);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = _392 * _404;
    float _444 = fma(_400, _380, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _446 = _364 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    bool _452 = _364 >= 0.0;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_440, _380, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_396, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_468, _380, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_424, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_464, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = _436 * _410;
    bool _494 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_156);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _450;
    bool _508 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_156);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_480;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = in.m_41.x;
    float _530 = in.m_41.y;
    float _532 = in.m_41.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    int _538 = abs(_226);
    float _540 = _518 * _522;
    float _542 = -_518;
    float _544 = _542 + 1.0;
    float _546 = fma(_526, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _548 = ~_350;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = fma(_536, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = _504 * _544;
    int _558 = _552;
    if (!_330)
    {
        int _560 = ~_350;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = -_504;
    float _568 = _566 + 1.0;
    float _570 = float(_538);
    float _572 = _310 * _556;
    float _574 = float(_564);
    float _576 = _322 * _556;
    bool _578 = !_186;
    int _580 = _578 ? 0 : 1;
    float _582 = _346 * _556;
    int _584 = _420 ? 0 : 1;
    float _586 = _570 * _574;
    int _588 = abs(_580);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    int _592 = ~_584;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    int _600 = _596;
    if (!_406)
    {
        int _602 = ~_584;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _586 * (-2.0);
    float _610 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _582);
    bool _612 = !_190;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_608, _528, _528);
    float _618 = float(_588);
    float _620 = fma(_366, _608, _366);
    float _622 = float(_606);
    float _624 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    int _626 = _460 ? 0 : 1;
    float _628 = fma(_348, _540, _610);
    int _630 = abs(_614);
    float _632 = _618 * _622;
    int _634 = ~_626;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_620, _318, _624);
    int _642 = _638;
    if (!_446)
    {
        int _644 = ~_626;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = _632 * (-2.0);
    float _652 = fma(_312, _540, _590);
    float _654 = fma(_650, _530, _530);
    float _656 = float(_630);
    float _658 = fma(_362, _650, _362);
    float _660 = float(_648);
    float _662 = fma(_320, _540, _598);
    float _664 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_490, _506, _628);
    float _672 = _656 * _660;
    float _674 = fma(_658, _318, _664);
    float _676 = in.m_43.x;
    float _678 = in.m_43.y;
    float _680 = in.m_43.z;
    float _682 = fma(_484, _506, _652);
    float _684 = _672 * (-2.0);
    float _686 = fma(_488, _506, _662);
    float _688 = in.m_45.x;
    float _690 = in.m_45.y;
    float _692 = in.m_45.z;
    float _694 = fma(_444, _492, _682);
    float _696 = fma(_684, _532, _532);
    float _698 = fma(_276, _684, _276);
    float _700 = fma(_482, _492, _686);
    float _702 = fma(_668, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _704 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _706 = fma(_486, _492, _670);
    float _708 = _640 * 0.15915493667125701904296875;
    float _710 = _674 * 0.15915493667125701904296875;
    float _712 = fma(_698, _318, _704);
    float _714 = fma(_554, _442, _700);
    float _716 = fma(_546, _442, _694);
    float _718 = _712 * 0.15915493667125701904296875;
    float _720 = fma(_702, _442, _706);
    float _722 = _708 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].x, _716);
    float _728 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].y, _714);
    float _730 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].z, _720);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _738 = in.m_32.x;
    float _740 = in.m_32.y;
    float _742 = in.m_32.z;
    float _744 = _708 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _728 * _690;
    float _750 = _726 * _688;
    float _752 = _730 * _692;
    float _754 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _756 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _760 = _710 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _754 * _734;
    float _766 = _756 * _732;
    float _768 = _758 * _736;
    float _770 = _710 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _718 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _746 * _762;
    float _780 = _724 * _762;
    float _782 = _718 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _724 * _772;
    float _788 = _746 * _772;
    float _790 = _776 * _764;
    float _792 = _772 * _776;
    float _794 = _762 * _776;
    float _796 = _746 * _790;
    float _798 = _724 * _790;
    float _800 = -_778;
    float _802 = fma(_784, _786, _800);
    float _804 = -_786;
    float _806 = fma(_784, _778, _804);
    float _808 = fma(_784, _788, _780);
    float _810 = _784 * _764;
    float _812 = fma(_784, _780, _788);
    float _814 = fma(_802, _766, _798);
    float _816 = fma(_808, _766, _796);
    float _818 = -_810;
    float _820 = fma(_792, _766, _818);
    float _822 = _740 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _824 = _740 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _826 = fma(_806, _768, _816);
    float _828 = fma(_812, _768, _814);
    float _830 = fma(_794, _768, _820);
    float _832 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[4].x, _822);
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[6].x, _824);
    float _836 = _826 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _838 = _826 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _840 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[4].z, _832);
    float _842 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[6].z, _834);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _846 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].x, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _846);
    float _856 = _740 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _826 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _848 + _852;
    float _862 = _850 + _854;
    float _864 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _870 = _860 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _874 = _862 + _872;
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[5].z, _864);
    float _878 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _880 = _870 * _870;
    float _882 = _874 * _874;
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _880 + _882;
    float _888 = _884 + _878;
    float _890 = sqrt(_886);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = _830;
    float _896 = _878;
    float _898 = _742;
    float _900 = _828;
    float _902 = _860;
    if (!_892)
    {
        _894 = _882;
    }
    float _904 = _894;
    float _906 = _904;
    if (!_892)
    {
        _896 = _880;
    }
    float _908 = _896;
    float _910 = _908;
    if (!_892)
    {
        _898 = _862;
    }
    float _912 = _898;
    float _914 = _912;
    if (!_892)
    {
        _900 = _888;
    }
    float _916 = _900;
    bool _918 = !_892;
    float _920 = _916;
    if (!_918)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _890 + _924;
        float _928 = rsqrt(_886);
        float _930 = _926 * _922;
        float _932 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = _930 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _928 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_870, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_874, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _958 = _950 + _956;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _962 = _952 + _960;
        float _964 = fma(_888, _942, _954);
        float _966 = _958 * _958;
        float _968 = _962 * _962;
        _920 = _964;
        _910 = _966;
        _906 = _968;
        _902 = _950;
        _914 = _952;
    }
    float _970 = _920;
    float _972 = _910;
    float _974 = _906;
    float _976 = _902;
    float _978 = _914;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _982 = _970 + _980;
    float _984 = fma(_982, _982, _972);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _988 = _984 + _974;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _996 = sqrt(_988);
    float _998 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _998;
    out.m_49.y = _1000;
    out.m_49.z = _1002;
    out.m_49.w = _994;
    bool _1004 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1006 = isnan(_996);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1012 = _1008 || _1010;
    float _1014 = _986;
    if (!_1012)
    {
        _1014 = 1.0;
    }
    float _1016 = _1014;
    bool _1018 = !_1012;
    float _1020 = _1016;
    if (!_1018)
    {
        bool _1022 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1024 = isnan(_996);
        bool _1026 = _1022 || _1024;
        bool _1028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1030 = _1026 || _1028;
        if (!_1030)
        {
            float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1034 = _996 + _1032;
            float _1036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1038 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1036;
            float _1040 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1042 = _1040 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1044 = 1.0 / _1038;
            float _1046 = _1034 * _1044;
            float _1048 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1020 = _1048;
            _1050 = true;
        }
        else
        {
            bool _1052 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1054 = isnan(_996);
            bool _1056 = _1052 || _1054;
            bool _1058 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1060 = _1056 || _1058;
            if (!_1060)
            {
                float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1064 = _996 + _1062;
                float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1072 = _1070 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1074 = 1.0 / _1068;
                float _1076 = _1064 * _1074;
                float _1078 = fma(_1076, _1072, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1020 = _1078;
                _1050 = true;
            }
            else
            {
                _1020 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1050 = false;
    float _1080 = _1020;
    float _1082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1084 = _970 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1088 = _976 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1092 = _978 + _1090;
    bool _1094 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    float _1104 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1106 = fma(_1088, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1108 = fma(_1092, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1110 = _1080;
    float _1112 = _1088;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1102)
    {
        _1110 = _1106;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    if (_1102)
    {
        _1112 = _1104;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1102)
    {
        _1114 = _1108;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1102)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1130 = _884 + _1128;
        float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1134 = _848 + _1132;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = _1130 * _1130;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _850 + _1140;
        float _1144 = fma(_1134, _1134, _1138);
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1148 = fma(_1142, _1142, _1144);
        float _1150 = sqrt(_1148);
        float _1152 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1146;
        float _1158 = -_848;
        float _1160 = _1158 + _1106;
        float _1162 = -_884;
        float _1164 = _1162 + _1104;
        float _1166 = _1152 * _1156;
        float _1168 = -_850;
        float _1170 = _1168 + _1108;
        float _1172 = fma(_1160, _1166, _848);
        float _1174 = fma(_1164, _1166, _884);
        float _1176 = fma(_1170, _1166, _850);
        _1122 = _1174;
        _1118 = _1172;
        _1126 = _1176;
    }
    float _1178 = _1122;
    float _1180 = _1118;
    float _1182 = _1126;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1194);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1196);
    float _1206 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1226);
    float _1236 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1228);
    float _1238 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1234);
    float _1246 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1236);
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    out.m_35.x = 1.0;
    out.m_51.w = _1240;
    out.gl_Position.x = _1244;
    out.gl_Position.y = _1246;
    out.gl_Position.z = _1242;
    out.gl_Position.w = _1248;
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
    bool _1050 = false;
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
        float _1304 = as_type<float>(_84);
        out.gl_Position.z = _1304;
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
        float _1374 = as_type<float>(_124);
        out.gl_Position.z = _1374;
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
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _190 = _188 != 0;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _156 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _156 + _196;
    float _200 = 1.0 / _170;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _206 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = _156 + _216;
    float _220 = 1.0 / _174;
    float _222 = _166 * _102;
    bool _224 = !_182;
    int _226 = _224 ? 0 : 1;
    float _228 = _162 + _158;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _232 = 1.0 + _230;
    float _234 = 1.0 / _178;
    float _236 = _194 * _200;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _156 + _238;
    float _242 = _228 + (-1.0);
    float _244 = _160 + _162;
    float _246 = _162 + (-0.5);
    float _248 = _162 * 2.0;
    bool _250 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _252 = isnan(1.0);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _258 = _254 || _256;
    float _260 = _198 * _220;
    float _262 = exp2(_222);
    float _264 = _158 * 2.0;
    float _266 = _160 * 2.0;
    float _268 = _160 + _158;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _156 + _270;
    float _274 = _240 * _234;
    float _276 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _278 = 1.0 / _232;
    float _280 = _268 + (-1.0);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    float _286 = -_262;
    float _288 = _286 + 1.0;
    float _290 = floor(_248);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = _214 ? _288 : 0.0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = fma(_294, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = 1.0 / _284;
    if (_258)
    {
        float _316 = _304 * _278;
        _106 = _316;
    }
    float _318 = _106;
    float _320 = fma(_308, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_298, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = 1.0 / _204;
    bool _330 = _290 > 0.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _336 = _290 >= 0.0;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_334, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _350 = _344 ? 0 : 1;
    float _352 = floor(_264);
    float _354 = _158 + (-0.5);
    float _356 = _160 + (-0.5);
    float _358 = _244 + (-1.0);
    float _360 = _218 * _314;
    float _362 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _364 = floor(_266);
    float _366 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _368 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_156);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _272 * _328;
    bool _382 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_156);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _352 > 0.0;
    float _408 = -_392;
    float _410 = _408 + 1.0;
    bool _412 = _352 >= 0.0;
    bool _414 = isnan(_352);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    bool _426 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_156);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = _392 * _404;
    float _444 = fma(_400, _380, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _446 = _364 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    bool _452 = _364 >= 0.0;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_440, _380, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_396, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_468, _380, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_424, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_464, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = _436 * _410;
    bool _494 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_156);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _450;
    bool _508 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_156);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_480;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = in.m_41.x;
    float _530 = in.m_41.y;
    float _532 = in.m_41.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    int _538 = abs(_226);
    float _540 = _518 * _522;
    float _542 = -_518;
    float _544 = _542 + 1.0;
    float _546 = fma(_526, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _548 = ~_350;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = fma(_536, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = _504 * _544;
    int _558 = _552;
    if (!_330)
    {
        int _560 = ~_350;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = -_504;
    float _568 = _566 + 1.0;
    float _570 = float(_538);
    float _572 = _310 * _556;
    float _574 = float(_564);
    float _576 = _322 * _556;
    bool _578 = !_186;
    int _580 = _578 ? 0 : 1;
    float _582 = _346 * _556;
    int _584 = _420 ? 0 : 1;
    float _586 = _570 * _574;
    int _588 = abs(_580);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    int _592 = ~_584;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    int _600 = _596;
    if (!_406)
    {
        int _602 = ~_584;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _586 * (-2.0);
    float _610 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _582);
    bool _612 = !_190;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_608, _528, _528);
    float _618 = float(_588);
    float _620 = fma(_366, _608, _366);
    float _622 = float(_606);
    float _624 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    int _626 = _460 ? 0 : 1;
    float _628 = fma(_348, _540, _610);
    int _630 = abs(_614);
    float _632 = _618 * _622;
    int _634 = ~_626;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_620, _318, _624);
    int _642 = _638;
    if (!_446)
    {
        int _644 = ~_626;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = _632 * (-2.0);
    float _652 = fma(_312, _540, _590);
    float _654 = fma(_650, _530, _530);
    float _656 = float(_630);
    float _658 = fma(_362, _650, _362);
    float _660 = float(_648);
    float _662 = fma(_320, _540, _598);
    float _664 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_490, _506, _628);
    float _672 = _656 * _660;
    float _674 = fma(_658, _318, _664);
    float _676 = in.m_43.x;
    float _678 = in.m_43.y;
    float _680 = in.m_43.z;
    float _682 = fma(_484, _506, _652);
    float _684 = _672 * (-2.0);
    float _686 = fma(_488, _506, _662);
    float _688 = in.m_45.x;
    float _690 = in.m_45.y;
    float _692 = in.m_45.z;
    float _694 = fma(_444, _492, _682);
    float _696 = fma(_684, _532, _532);
    float _698 = fma(_276, _684, _276);
    float _700 = fma(_482, _492, _686);
    float _702 = fma(_668, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _704 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _706 = fma(_486, _492, _670);
    float _708 = _640 * 0.15915493667125701904296875;
    float _710 = _674 * 0.15915493667125701904296875;
    float _712 = fma(_698, _318, _704);
    float _714 = fma(_554, _442, _700);
    float _716 = fma(_546, _442, _694);
    float _718 = _712 * 0.15915493667125701904296875;
    float _720 = fma(_702, _442, _706);
    float _722 = _708 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].x, _716);
    float _728 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].y, _714);
    float _730 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].z, _720);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _738 = in.m_32.x;
    float _740 = in.m_32.y;
    float _742 = in.m_32.z;
    float _744 = _708 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _728 * _690;
    float _750 = _726 * _688;
    float _752 = _730 * _692;
    float _754 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _756 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _760 = _710 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _754 * _734;
    float _766 = _756 * _732;
    float _768 = _758 * _736;
    float _770 = _710 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _718 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _746 * _762;
    float _780 = _724 * _762;
    float _782 = _718 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _724 * _772;
    float _788 = _746 * _772;
    float _790 = _776 * _764;
    float _792 = _772 * _776;
    float _794 = _762 * _776;
    float _796 = _746 * _790;
    float _798 = _724 * _790;
    float _800 = -_778;
    float _802 = fma(_784, _786, _800);
    float _804 = -_786;
    float _806 = fma(_784, _778, _804);
    float _808 = fma(_784, _788, _780);
    float _810 = _784 * _764;
    float _812 = fma(_784, _780, _788);
    float _814 = fma(_802, _766, _798);
    float _816 = fma(_808, _766, _796);
    float _818 = -_810;
    float _820 = fma(_792, _766, _818);
    float _822 = _740 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _824 = _740 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _826 = fma(_806, _768, _816);
    float _828 = fma(_812, _768, _814);
    float _830 = fma(_794, _768, _820);
    float _832 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[4].x, _822);
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[6].x, _824);
    float _836 = _826 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _838 = _826 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _840 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[4].z, _832);
    float _842 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[6].z, _834);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _846 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].x, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _846);
    float _856 = _740 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _826 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _848 + _852;
    float _862 = _850 + _854;
    float _864 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _870 = _860 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _874 = _862 + _872;
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[5].z, _864);
    float _878 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _880 = _870 * _870;
    float _882 = _874 * _874;
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _880 + _882;
    float _888 = _884 + _878;
    float _890 = sqrt(_886);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = _830;
    float _896 = _878;
    float _898 = _742;
    float _900 = _828;
    float _902 = _860;
    if (!_892)
    {
        _894 = _882;
    }
    float _904 = _894;
    float _906 = _904;
    if (!_892)
    {
        _896 = _880;
    }
    float _908 = _896;
    float _910 = _908;
    if (!_892)
    {
        _898 = _862;
    }
    float _912 = _898;
    float _914 = _912;
    if (!_892)
    {
        _900 = _888;
    }
    float _916 = _900;
    bool _918 = !_892;
    float _920 = _916;
    if (!_918)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _890 + _924;
        float _928 = rsqrt(_886);
        float _930 = _926 * _922;
        float _932 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = _930 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _928 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_870, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_874, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _958 = _950 + _956;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _962 = _952 + _960;
        float _964 = fma(_888, _942, _954);
        float _966 = _958 * _958;
        float _968 = _962 * _962;
        _920 = _964;
        _910 = _966;
        _906 = _968;
        _902 = _950;
        _914 = _952;
    }
    float _970 = _920;
    float _972 = _910;
    float _974 = _906;
    float _976 = _902;
    float _978 = _914;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _982 = _970 + _980;
    float _984 = fma(_982, _982, _972);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _988 = _984 + _974;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _996 = sqrt(_988);
    float _998 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _998;
    out.m_49.y = _1000;
    out.m_49.z = _1002;
    out.m_49.w = _994;
    bool _1004 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1006 = isnan(_996);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1012 = _1008 || _1010;
    float _1014 = _986;
    if (!_1012)
    {
        _1014 = 1.0;
    }
    float _1016 = _1014;
    bool _1018 = !_1012;
    float _1020 = _1016;
    if (!_1018)
    {
        bool _1022 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1024 = isnan(_996);
        bool _1026 = _1022 || _1024;
        bool _1028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1030 = _1026 || _1028;
        if (!_1030)
        {
            float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1034 = _996 + _1032;
            float _1036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1038 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1036;
            float _1040 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1042 = _1040 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1044 = 1.0 / _1038;
            float _1046 = _1034 * _1044;
            float _1048 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1020 = _1048;
            _1050 = true;
        }
        else
        {
            bool _1052 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1054 = isnan(_996);
            bool _1056 = _1052 || _1054;
            bool _1058 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1060 = _1056 || _1058;
            if (!_1060)
            {
                float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1064 = _996 + _1062;
                float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1072 = _1070 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1074 = 1.0 / _1068;
                float _1076 = _1064 * _1074;
                float _1078 = fma(_1076, _1072, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1020 = _1078;
                _1050 = true;
            }
            else
            {
                _1020 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1050 = false;
    float _1080 = _1020;
    float _1082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1084 = _970 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1088 = _976 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1092 = _978 + _1090;
    bool _1094 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    float _1104 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1106 = fma(_1088, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1108 = fma(_1092, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1110 = _1080;
    float _1112 = _1088;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1102)
    {
        _1110 = _1106;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    if (_1102)
    {
        _1112 = _1104;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1102)
    {
        _1114 = _1108;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1102)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1130 = _884 + _1128;
        float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1134 = _848 + _1132;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = _1130 * _1130;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _850 + _1140;
        float _1144 = fma(_1134, _1134, _1138);
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1148 = fma(_1142, _1142, _1144);
        float _1150 = sqrt(_1148);
        float _1152 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1146;
        float _1158 = -_848;
        float _1160 = _1158 + _1106;
        float _1162 = -_884;
        float _1164 = _1162 + _1104;
        float _1166 = _1152 * _1156;
        float _1168 = -_850;
        float _1170 = _1168 + _1108;
        float _1172 = fma(_1160, _1166, _848);
        float _1174 = fma(_1164, _1166, _884);
        float _1176 = fma(_1170, _1166, _850);
        _1122 = _1174;
        _1118 = _1172;
        _1126 = _1176;
    }
    float _1178 = _1122;
    float _1180 = _1118;
    float _1182 = _1126;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1194);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1196);
    float _1206 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1226);
    float _1236 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1228);
    float _1238 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1234);
    float _1246 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1236);
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    out.m_35.x = 1.0;
    out.m_51.w = _1240;
    out.gl_Position.x = _1244;
    out.gl_Position.y = _1246;
    out.gl_Position.z = _1242;
    out.gl_Position.w = _1248;
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
    bool _1050 = false;
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
        float _1304 = as_type<float>(_84);
        out.gl_Position.z = _1304;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1374 = as_type<float>(_124);
        out.gl_Position.z = _1374;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _168;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _174 = _172 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _190 = _188 != 0;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _156 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _156 + _196;
    float _200 = 1.0 / _170;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _206 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(0.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = _156 + _216;
    float _220 = 1.0 / _174;
    float _222 = _166 * _102;
    bool _224 = !_182;
    int _226 = _224 ? 0 : 1;
    float _228 = _162 + _158;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _232 = 1.0 + _230;
    float _234 = 1.0 / _178;
    float _236 = _194 * _200;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _156 + _238;
    float _242 = _228 + (-1.0);
    float _244 = _160 + _162;
    float _246 = _162 + (-0.5);
    float _248 = _162 * 2.0;
    bool _250 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _252 = isnan(1.0);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _258 = _254 || _256;
    float _260 = _198 * _220;
    float _262 = exp2(_222);
    float _264 = _158 * 2.0;
    float _266 = _160 * 2.0;
    float _268 = _160 + _158;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _156 + _270;
    float _274 = _240 * _234;
    float _276 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _278 = 1.0 / _232;
    float _280 = _268 + (-1.0);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    float _286 = -_262;
    float _288 = _286 + 1.0;
    float _290 = floor(_248);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = _214 ? _288 : 0.0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = fma(_294, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = 1.0 / _284;
    if (_258)
    {
        float _316 = _304 * _278;
        _106 = _316;
    }
    float _318 = _106;
    float _320 = fma(_308, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_298, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = 1.0 / _204;
    bool _330 = _290 > 0.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _336 = _290 >= 0.0;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_334, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _350 = _344 ? 0 : 1;
    float _352 = floor(_264);
    float _354 = _158 + (-0.5);
    float _356 = _160 + (-0.5);
    float _358 = _244 + (-1.0);
    float _360 = _218 * _314;
    float _362 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _364 = floor(_266);
    float _366 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _368 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_156);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _272 * _328;
    bool _382 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_156);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _352 > 0.0;
    float _408 = -_392;
    float _410 = _408 + 1.0;
    bool _412 = _352 >= 0.0;
    bool _414 = isnan(_352);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    bool _426 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_156);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = _392 * _404;
    float _444 = fma(_400, _380, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _446 = _364 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    bool _452 = _364 >= 0.0;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _470 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _472 = isnan(_156);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_440, _380, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_396, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_468, _380, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_424, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_464, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = _436 * _410;
    bool _494 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_156);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _450;
    bool _508 = _156 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_156);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_480;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = in.m_41.x;
    float _530 = in.m_41.y;
    float _532 = in.m_41.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    int _538 = abs(_226);
    float _540 = _518 * _522;
    float _542 = -_518;
    float _544 = _542 + 1.0;
    float _546 = fma(_526, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _548 = ~_350;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = fma(_536, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = _504 * _544;
    int _558 = _552;
    if (!_330)
    {
        int _560 = ~_350;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = -_504;
    float _568 = _566 + 1.0;
    float _570 = float(_538);
    float _572 = _310 * _556;
    float _574 = float(_564);
    float _576 = _322 * _556;
    bool _578 = !_186;
    int _580 = _578 ? 0 : 1;
    float _582 = _346 * _556;
    int _584 = _420 ? 0 : 1;
    float _586 = _570 * _574;
    int _588 = abs(_580);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    int _592 = ~_584;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    int _600 = _596;
    if (!_406)
    {
        int _602 = ~_584;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _586 * (-2.0);
    float _610 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _582);
    bool _612 = !_190;
    int _614 = _612 ? 0 : 1;
    float _616 = fma(_608, _528, _528);
    float _618 = float(_588);
    float _620 = fma(_366, _608, _366);
    float _622 = float(_606);
    float _624 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    int _626 = _460 ? 0 : 1;
    float _628 = fma(_348, _540, _610);
    int _630 = abs(_614);
    float _632 = _618 * _622;
    int _634 = ~_626;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_620, _318, _624);
    int _642 = _638;
    if (!_446)
    {
        int _644 = ~_626;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = _632 * (-2.0);
    float _652 = fma(_312, _540, _590);
    float _654 = fma(_650, _530, _530);
    float _656 = float(_630);
    float _658 = fma(_362, _650, _362);
    float _660 = float(_648);
    float _662 = fma(_320, _540, _598);
    float _664 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_490, _506, _628);
    float _672 = _656 * _660;
    float _674 = fma(_658, _318, _664);
    float _676 = in.m_43.x;
    float _678 = in.m_43.y;
    float _680 = in.m_43.z;
    float _682 = fma(_484, _506, _652);
    float _684 = _672 * (-2.0);
    float _686 = fma(_488, _506, _662);
    float _688 = in.m_45.x;
    float _690 = in.m_45.y;
    float _692 = in.m_45.z;
    float _694 = fma(_444, _492, _682);
    float _696 = fma(_684, _532, _532);
    float _698 = fma(_276, _684, _276);
    float _700 = fma(_482, _492, _686);
    float _702 = fma(_668, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _704 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _706 = fma(_486, _492, _670);
    float _708 = _640 * 0.15915493667125701904296875;
    float _710 = _674 * 0.15915493667125701904296875;
    float _712 = fma(_698, _318, _704);
    float _714 = fma(_554, _442, _700);
    float _716 = fma(_546, _442, _694);
    float _718 = _712 * 0.15915493667125701904296875;
    float _720 = fma(_702, _442, _706);
    float _722 = _708 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].x, _716);
    float _728 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].y, _714);
    float _730 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[148].z, _720);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _738 = in.m_32.x;
    float _740 = in.m_32.y;
    float _742 = in.m_32.z;
    float _744 = _708 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = _728 * _690;
    float _750 = _726 * _688;
    float _752 = _730 * _692;
    float _754 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _756 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _760 = _710 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _754 * _734;
    float _766 = _756 * _732;
    float _768 = _758 * _736;
    float _770 = _710 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _718 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _746 * _762;
    float _780 = _724 * _762;
    float _782 = _718 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _724 * _772;
    float _788 = _746 * _772;
    float _790 = _776 * _764;
    float _792 = _772 * _776;
    float _794 = _762 * _776;
    float _796 = _746 * _790;
    float _798 = _724 * _790;
    float _800 = -_778;
    float _802 = fma(_784, _786, _800);
    float _804 = -_786;
    float _806 = fma(_784, _778, _804);
    float _808 = fma(_784, _788, _780);
    float _810 = _784 * _764;
    float _812 = fma(_784, _780, _788);
    float _814 = fma(_802, _766, _798);
    float _816 = fma(_808, _766, _796);
    float _818 = -_810;
    float _820 = fma(_792, _766, _818);
    float _822 = _740 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _824 = _740 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _826 = fma(_806, _768, _816);
    float _828 = fma(_812, _768, _814);
    float _830 = fma(_794, _768, _820);
    float _832 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[4].x, _822);
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[6].x, _824);
    float _836 = _826 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _838 = _826 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _840 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[4].z, _832);
    float _842 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[6].z, _834);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _846 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[10].x, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _846);
    float _856 = _740 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = _826 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _860 = _848 + _852;
    float _862 = _850 + _854;
    float _864 = fma(_738, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[9].x, _858);
    float _868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _870 = _860 + _868;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _874 = _862 + _872;
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[5].z, _864);
    float _878 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _880 = _870 * _870;
    float _882 = _874 * _874;
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _886 = _880 + _882;
    float _888 = _884 + _878;
    float _890 = sqrt(_886);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = _830;
    float _896 = _878;
    float _898 = _742;
    float _900 = _828;
    float _902 = _860;
    if (!_892)
    {
        _894 = _882;
    }
    float _904 = _894;
    float _906 = _904;
    if (!_892)
    {
        _896 = _880;
    }
    float _908 = _896;
    float _910 = _908;
    if (!_892)
    {
        _898 = _862;
    }
    float _912 = _898;
    float _914 = _912;
    if (!_892)
    {
        _900 = _888;
    }
    float _916 = _900;
    bool _918 = !_892;
    float _920 = _916;
    if (!_918)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _926 = _890 + _924;
        float _928 = rsqrt(_886);
        float _930 = _926 * _922;
        float _932 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = _930 * 0.15915493667125701904296875;
        float _936 = _934 * 6.283185482025146484375;
        float _938 = sin(_936);
        float _940 = _934 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = fma(_938, _932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _946 = _928 * _944;
        float _948 = _942 + (-1.0);
        float _950 = fma(_870, _946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _952 = fma(_874, _946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _958 = _950 + _956;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _962 = _952 + _960;
        float _964 = fma(_888, _942, _954);
        float _966 = _958 * _958;
        float _968 = _962 * _962;
        _920 = _964;
        _910 = _966;
        _906 = _968;
        _902 = _950;
        _914 = _952;
    }
    float _970 = _920;
    float _972 = _910;
    float _974 = _906;
    float _976 = _902;
    float _978 = _914;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _982 = _970 + _980;
    float _984 = fma(_982, _982, _972);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _988 = _984 + _974;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _996 = sqrt(_988);
    float _998 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    out.m_49.x = _998;
    out.m_49.y = _1000;
    out.m_49.z = _1002;
    out.m_49.w = _994;
    bool _1004 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1006 = isnan(_996);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1012 = _1008 || _1010;
    float _1014 = _986;
    if (!_1012)
    {
        _1014 = 1.0;
    }
    float _1016 = _1014;
    bool _1018 = !_1012;
    float _1020 = _1016;
    if (!_1018)
    {
        bool _1022 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1024 = isnan(_996);
        bool _1026 = _1022 || _1024;
        bool _1028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1030 = _1026 || _1028;
        if (!_1030)
        {
            float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1034 = _996 + _1032;
            float _1036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1038 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1036;
            float _1040 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1042 = _1040 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1044 = 1.0 / _1038;
            float _1046 = _1034 * _1044;
            float _1048 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1020 = _1048;
            _1050 = true;
        }
        else
        {
            bool _1052 = _996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1054 = isnan(_996);
            bool _1056 = _1052 || _1054;
            bool _1058 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1060 = _1056 || _1058;
            if (!_1060)
            {
                float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1064 = _996 + _1062;
                float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1072 = _1070 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1074 = 1.0 / _1068;
                float _1076 = _1064 * _1074;
                float _1078 = fma(_1076, _1072, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1020 = _1078;
                _1050 = true;
            }
            else
            {
                _1020 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1050 = false;
    float _1080 = _1020;
    float _1082 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1084 = _970 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1088 = _976 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1092 = _978 + _1090;
    bool _1094 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    float _1104 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1106 = fma(_1088, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1108 = fma(_1092, _1080, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1110 = _1080;
    float _1112 = _1088;
    float _1114 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1102)
    {
        _1110 = _1106;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    if (_1102)
    {
        _1112 = _1104;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1102)
    {
        _1114 = _1108;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1102)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1130 = _884 + _1128;
        float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1134 = _848 + _1132;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = _1130 * _1130;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _850 + _1140;
        float _1144 = fma(_1134, _1134, _1138);
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1148 = fma(_1142, _1142, _1144);
        float _1150 = sqrt(_1148);
        float _1152 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1146;
        float _1158 = -_848;
        float _1160 = _1158 + _1106;
        float _1162 = -_884;
        float _1164 = _1162 + _1104;
        float _1166 = _1152 * _1156;
        float _1168 = -_850;
        float _1170 = _1168 + _1108;
        float _1172 = fma(_1160, _1166, _848);
        float _1174 = fma(_1164, _1166, _884);
        float _1176 = fma(_1170, _1166, _850);
        _1122 = _1174;
        _1118 = _1172;
        _1126 = _1176;
    }
    float _1178 = _1122;
    float _1180 = _1118;
    float _1182 = _1126;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1184);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1198 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1194);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1196);
    float _1206 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1220);
    float _1230 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1226);
    float _1236 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1228);
    float _1238 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1234);
    float _1246 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1236);
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    out.m_35.x = 1.0;
    out.m_51.w = _1240;
    out.gl_Position.x = _1244;
    out.gl_Position.y = _1246;
    out.gl_Position.z = _1242;
    out.gl_Position.w = _1248;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

