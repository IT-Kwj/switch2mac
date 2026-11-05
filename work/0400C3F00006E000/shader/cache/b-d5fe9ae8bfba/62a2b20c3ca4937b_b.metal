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
    float4 m_53 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _768 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_90);
        out.gl_Position.z = _951;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1020 = as_type<float>(_126);
        out.gl_Position.z = _1020;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_39.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    int _146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _148 = _146 != 0;
    float _150 = _132 * _130;
    float _152 = 0.0;
    float _154 = _134;
    if (!_144)
    {
        float _156 = _134 * _134;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _150);
    float _164 = _160;
    if (!_144)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _180 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = -_178;
    float _188 = _162 + _186;
    bool _190 = !_144;
    float _192 = _168;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _134 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _134);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_144;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _134 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _154 = _246;
    }
    float _248 = _154;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_41.w;
    float _260 = in.m_32.x;
    float _262 = in.m_32.y;
    float _264 = in.m_32.z;
    bool _266 = _188 < 0.5;
    float _268 = float(_266);
    float _270 = -_188;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _274 = !_252;
    int _276 = _274 ? 0 : 1;
    float _278 = fma(_184, 0.5, 0.5);
    float _280 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = -_268;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_148;
    int _288 = _286 ? 0 : 1;
    float _290 = -_278;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_276);
    float _296 = fma(_248, _170, _280);
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _308 = abs(_288);
    float _310 = fma(_248, _172, _302);
    int _312 = abs(_300);
    float _314 = fma(_248, _174, _306);
    float _316 = float(_294);
    float _318 = float(_308);
    float _320 = abs(_272);
    float _322 = _316 * _320;
    float _324 = fma(_296, _258, _260);
    float _326 = fma(_310, _258, _262);
    float _328 = float(_312);
    float _330 = fma(_318, _292, _322);
    float _332 = fma(_314, _258, _264);
    float _334 = abs(_284);
    float _336 = fma(_328, _334, _330);
    bool _338 = !_304;
    float _340 = _324;
    float _356;
    if (!_338)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _344 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_74);
        float _362 = 1.0 / _360;
        float _364 = _108 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_41.x;
    float _370 = in.m_41.y;
    float _372 = in.m_41.z;
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = in.m_43.x;
    float _378 = in.m_43.y;
    float _380 = in.m_43.z;
    float _382 = in.m_39.y;
    float _384 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = _336 * _384;
    float _392 = _336 * _386;
    float _394 = _336 * _388;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _398 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _376);
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _380);
    float _404 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _398 * _396;
    float _410 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _404 * _400;
    float _414 = _406 * _402;
    float _416 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = _408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _422 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _424 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _420);
    float _430 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _432 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _428);
    float _438 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _444 = _436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _446 = in.m_45.x;
    float _448 = _438 + _442;
    float _450 = _440 + _444;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _448 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _450 + _460;
    float _464 = in.m_45.y;
    float _466 = 1.0 / _454;
    float _468 = _458 * _458;
    float _470 = _462 * _462;
    float _472 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _474 = _382 > 0.5;
    float _476 = _468 + _470;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _480 = _478 != 0;
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _486 = _484 != 0;
    float _488 = sqrt(_476);
    float _490 = _408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    bool _496 = _128 > 0.5;
    bool _498 = _496 && _480;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _366 + _500;
    float _504 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _490);
    float _506 = _494 * _466;
    bool _508 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_366);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[5].z, _482);
    float _522 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _504);
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _526 = fma(_506, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _528 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_366);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _546 = _522 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _548 = _488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -_464;
    float _552 = _550 + 1.0;
    float _554 = _538 * _542;
    float _556 = _544 + _546;
    float _558 = _546;
    float _560 = _446;
    float _562 = _464;
    float _564 = _544;
    float _566 = _526;
    float _568 = _554;
    float _570 = _552;
    if (!_480)
    {
        _558 = _446;
    }
    float _572 = _558;
    float _574 = _572;
    if (_498)
    {
        float _576 = -_446;
        float _578 = _576 + 1.0;
        _560 = _578;
    }
    float _580 = _560;
    if (_486)
    {
        float _582 = _474 ? _552 : _464;
        _562 = _582;
    }
    float _584 = _562;
    float _586 = _526 * _554;
    if (!_548)
    {
        _564 = _470;
    }
    float _588 = _564;
    float _590 = _588;
    if (!_548)
    {
        _566 = _468;
    }
    float _592 = _566;
    float _594 = _592;
    if (!_548)
    {
        _340 = _448;
    }
    float _596 = _340;
    float _598 = _596;
    if (!_548)
    {
        _568 = _450;
    }
    float _600 = _568;
    float _602 = _600;
    if (!_548)
    {
        _570 = _556;
    }
    float _604 = _570;
    bool _606 = !_548;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _488 + _612;
        float _616 = _556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_476);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = _618 * _632;
        float _636 = _630 + (-1.0);
        float _638 = fma(_458, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_462, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _642 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _646 = _638 + _644;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _650 = _640 + _648;
        float _652 = fma(_556, _630, _642);
        float _654 = _646 * _646;
        float _656 = _650 * _650;
        _608 = _652;
        _594 = _654;
        _590 = _656;
        _598 = _638;
        _602 = _640;
    }
    float _658 = _608;
    float _660 = _594;
    float _662 = _590;
    float _664 = _598;
    float _666 = _602;
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _670 = _658 + _668;
    float _672 = -_538;
    float _674 = _672 + 1.0;
    if (_480)
    {
        _574 = _580;
    }
    float _676 = _574;
    float _678 = fma(_670, _670, _660);
    float _680 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _682 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _686 = _678 + _662;
    float _688 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[116].x, _680);
    float _690 = _682 * _374;
    float _692 = _684 * _524;
    float _694 = sqrt(_686);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _722 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _724 = isnan(_694);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _730 = _726 || _728;
    out.m_49.x = _714;
    out.m_49.y = _716;
    out.m_49.z = _706;
    out.m_51.x = _692;
    out.m_51.y = _690;
    out.m_53.x = _710;
    out.m_53.y = _712;
    out.m_53.z = _718;
    out.m_53.w = _720;
    float _732 = _698;
    if (!_730)
    {
        _732 = 1.0;
    }
    float _734 = _732;
    bool _736 = !_730;
    float _738 = _734;
    if (!_736)
    {
        bool _740 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _742 = isnan(_694);
        bool _744 = _740 || _742;
        bool _746 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _748 = _744 || _746;
        if (!_748)
        {
            float _750 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _752 = _694 + _750;
            float _754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _756 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _754;
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _760 = _758 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _762 = 1.0 / _756;
            float _764 = _752 * _762;
            float _766 = fma(_764, _760, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _738 = _766;
            _768 = true;
        }
        else
        {
            bool _770 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _772 = isnan(_694);
            bool _774 = _770 || _772;
            bool _776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _778 = _774 || _776;
            if (!_778)
            {
                float _780 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _782 = _694 + _780;
                float _784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _786 = _784 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _790 = _788 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _792 = 1.0 / _786;
                float _794 = _782 * _792;
                float _796 = fma(_794, _790, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _738 = _796;
                _768 = true;
            }
            else
            {
                _738 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _768 = false;
    float _798 = _738;
    float _800 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _802 = _658 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _806 = _664 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _810 = _666 + _808;
    float _812 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _814 = fma(_806, _798, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _816 = fma(_810, _798, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _818 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _818);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _824);
    float _834 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _826);
    float _836 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _828);
    float _838 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _830);
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _832);
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _842 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _854 = _842 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _856 = _842 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _850);
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _852);
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _854);
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _856);
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].z, _860);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].z, _862);
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].z, _864);
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _866);
    float _876 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _868);
    float _878 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _870);
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _872);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _884 = _874 + _878;
    float _886 = _880 + _878;
    float _888 = _878 * 0.5;
    float _890 = _884 * 0.5;
    float _892 = _886 * 0.5;
    float _894 = fma(_876, -0.5, _888);
    out.m_35.x = _882;
    out.gl_Position.x = _874;
    out.gl_Position.y = _876;
    out.gl_Position.z = _880;
    out.gl_Position.w = _878;
    out.m_55.x = _890;
    out.m_55.y = _894;
    out.m_55.z = _892;
    out.m_55.w = _878;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _768 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_90);
        out.gl_Position.z = _951;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1020 = as_type<float>(_126);
        out.gl_Position.z = _1020;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_39.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    int _146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _148 = _146 != 0;
    float _150 = _132 * _130;
    float _152 = 0.0;
    float _154 = _134;
    if (!_144)
    {
        float _156 = _134 * _134;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _150);
    float _164 = _160;
    if (!_144)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _180 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = -_178;
    float _188 = _162 + _186;
    bool _190 = !_144;
    float _192 = _168;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _134 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _134);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_144;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _134 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _154 = _246;
    }
    float _248 = _154;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_41.w;
    float _260 = in.m_32.x;
    float _262 = in.m_32.y;
    float _264 = in.m_32.z;
    bool _266 = _188 < 0.5;
    float _268 = float(_266);
    float _270 = -_188;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _274 = !_252;
    int _276 = _274 ? 0 : 1;
    float _278 = fma(_184, 0.5, 0.5);
    float _280 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = -_268;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_148;
    int _288 = _286 ? 0 : 1;
    float _290 = -_278;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_276);
    float _296 = fma(_248, _170, _280);
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _308 = abs(_288);
    float _310 = fma(_248, _172, _302);
    int _312 = abs(_300);
    float _314 = fma(_248, _174, _306);
    float _316 = float(_294);
    float _318 = float(_308);
    float _320 = abs(_272);
    float _322 = _316 * _320;
    float _324 = fma(_296, _258, _260);
    float _326 = fma(_310, _258, _262);
    float _328 = float(_312);
    float _330 = fma(_318, _292, _322);
    float _332 = fma(_314, _258, _264);
    float _334 = abs(_284);
    float _336 = fma(_328, _334, _330);
    bool _338 = !_304;
    float _340 = _324;
    float _356;
    if (!_338)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _344 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_74);
        float _362 = 1.0 / _360;
        float _364 = _108 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_41.x;
    float _370 = in.m_41.y;
    float _372 = in.m_41.z;
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = in.m_43.x;
    float _378 = in.m_43.y;
    float _380 = in.m_43.z;
    float _382 = in.m_39.y;
    float _384 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = _336 * _384;
    float _392 = _336 * _386;
    float _394 = _336 * _388;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _398 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _376);
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _380);
    float _404 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _398 * _396;
    float _410 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _404 * _400;
    float _414 = _406 * _402;
    float _416 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = _408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _422 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _424 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _420);
    float _430 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _432 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _428);
    float _438 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _444 = _436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _446 = in.m_45.x;
    float _448 = _438 + _442;
    float _450 = _440 + _444;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _448 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _450 + _460;
    float _464 = in.m_45.y;
    float _466 = 1.0 / _454;
    float _468 = _458 * _458;
    float _470 = _462 * _462;
    float _472 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _474 = _382 > 0.5;
    float _476 = _468 + _470;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _480 = _478 != 0;
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _486 = _484 != 0;
    float _488 = sqrt(_476);
    float _490 = _408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    bool _496 = _128 > 0.5;
    bool _498 = _496 && _480;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _366 + _500;
    float _504 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _490);
    float _506 = _494 * _466;
    bool _508 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_366);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[5].z, _482);
    float _522 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _504);
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _526 = fma(_506, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _528 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_366);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _546 = _522 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _548 = _488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -_464;
    float _552 = _550 + 1.0;
    float _554 = _538 * _542;
    float _556 = _544 + _546;
    float _558 = _546;
    float _560 = _446;
    float _562 = _464;
    float _564 = _544;
    float _566 = _526;
    float _568 = _554;
    float _570 = _552;
    if (!_480)
    {
        _558 = _446;
    }
    float _572 = _558;
    float _574 = _572;
    if (_498)
    {
        float _576 = -_446;
        float _578 = _576 + 1.0;
        _560 = _578;
    }
    float _580 = _560;
    if (_486)
    {
        float _582 = _474 ? _552 : _464;
        _562 = _582;
    }
    float _584 = _562;
    float _586 = _526 * _554;
    if (!_548)
    {
        _564 = _470;
    }
    float _588 = _564;
    float _590 = _588;
    if (!_548)
    {
        _566 = _468;
    }
    float _592 = _566;
    float _594 = _592;
    if (!_548)
    {
        _340 = _448;
    }
    float _596 = _340;
    float _598 = _596;
    if (!_548)
    {
        _568 = _450;
    }
    float _600 = _568;
    float _602 = _600;
    if (!_548)
    {
        _570 = _556;
    }
    float _604 = _570;
    bool _606 = !_548;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _488 + _612;
        float _616 = _556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_476);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = _618 * _632;
        float _636 = _630 + (-1.0);
        float _638 = fma(_458, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_462, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _642 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _646 = _638 + _644;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _650 = _640 + _648;
        float _652 = fma(_556, _630, _642);
        float _654 = _646 * _646;
        float _656 = _650 * _650;
        _608 = _652;
        _594 = _654;
        _590 = _656;
        _598 = _638;
        _602 = _640;
    }
    float _658 = _608;
    float _660 = _594;
    float _662 = _590;
    float _664 = _598;
    float _666 = _602;
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _670 = _658 + _668;
    float _672 = -_538;
    float _674 = _672 + 1.0;
    if (_480)
    {
        _574 = _580;
    }
    float _676 = _574;
    float _678 = fma(_670, _670, _660);
    float _680 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _682 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _686 = _678 + _662;
    float _688 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[116].x, _680);
    float _690 = _682 * _374;
    float _692 = _684 * _524;
    float _694 = sqrt(_686);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _722 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _724 = isnan(_694);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _730 = _726 || _728;
    out.m_49.x = _714;
    out.m_49.y = _716;
    out.m_49.z = _706;
    out.m_51.x = _692;
    out.m_51.y = _690;
    out.m_53.x = _710;
    out.m_53.y = _712;
    out.m_53.z = _718;
    out.m_53.w = _720;
    float _732 = _698;
    if (!_730)
    {
        _732 = 1.0;
    }
    float _734 = _732;
    bool _736 = !_730;
    float _738 = _734;
    if (!_736)
    {
        bool _740 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _742 = isnan(_694);
        bool _744 = _740 || _742;
        bool _746 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _748 = _744 || _746;
        if (!_748)
        {
            float _750 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _752 = _694 + _750;
            float _754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _756 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _754;
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _760 = _758 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _762 = 1.0 / _756;
            float _764 = _752 * _762;
            float _766 = fma(_764, _760, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _738 = _766;
            _768 = true;
        }
        else
        {
            bool _770 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _772 = isnan(_694);
            bool _774 = _770 || _772;
            bool _776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _778 = _774 || _776;
            if (!_778)
            {
                float _780 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _782 = _694 + _780;
                float _784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _786 = _784 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _790 = _788 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _792 = 1.0 / _786;
                float _794 = _782 * _792;
                float _796 = fma(_794, _790, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _738 = _796;
                _768 = true;
            }
            else
            {
                _738 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _768 = false;
    float _798 = _738;
    float _800 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _802 = _658 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _806 = _664 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _810 = _666 + _808;
    float _812 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _814 = fma(_806, _798, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _816 = fma(_810, _798, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _818 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _818);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _824);
    float _834 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _826);
    float _836 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _828);
    float _838 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _830);
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _832);
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _842 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _854 = _842 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _856 = _842 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _850);
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _852);
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _854);
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _856);
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].z, _860);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].z, _862);
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].z, _864);
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _866);
    float _876 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _868);
    float _878 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _870);
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _872);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _884 = _874 + _878;
    float _886 = _880 + _878;
    float _888 = _878 * 0.5;
    float _890 = _884 * 0.5;
    float _892 = _886 * 0.5;
    float _894 = fma(_876, -0.5, _888);
    out.m_35.x = _882;
    out.gl_Position.x = _874;
    out.gl_Position.y = _876;
    out.gl_Position.z = _880;
    out.gl_Position.w = _878;
    out.m_55.x = _890;
    out.m_55.y = _894;
    out.m_55.z = _892;
    out.m_55.w = _878;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _768 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_90);
        out.gl_Position.z = _951;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1020 = as_type<float>(_126);
        out.gl_Position.z = _1020;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_39.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    int _146 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _148 = _146 != 0;
    float _150 = _132 * _130;
    float _152 = 0.0;
    float _154 = _134;
    if (!_144)
    {
        float _156 = _134 * _134;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _150);
    float _164 = _160;
    if (!_144)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _180 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = -_178;
    float _188 = _162 + _186;
    bool _190 = !_144;
    float _192 = _168;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _134 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _134);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_144;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _134 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _154 = _246;
    }
    float _248 = _154;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_41.w;
    float _260 = in.m_32.x;
    float _262 = in.m_32.y;
    float _264 = in.m_32.z;
    bool _266 = _188 < 0.5;
    float _268 = float(_266);
    float _270 = -_188;
    float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _274 = !_252;
    int _276 = _274 ? 0 : 1;
    float _278 = fma(_184, 0.5, 0.5);
    float _280 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = -_268;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_148;
    int _288 = _286 ? 0 : 1;
    float _290 = -_278;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_276);
    float _296 = fma(_248, _170, _280);
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _308 = abs(_288);
    float _310 = fma(_248, _172, _302);
    int _312 = abs(_300);
    float _314 = fma(_248, _174, _306);
    float _316 = float(_294);
    float _318 = float(_308);
    float _320 = abs(_272);
    float _322 = _316 * _320;
    float _324 = fma(_296, _258, _260);
    float _326 = fma(_310, _258, _262);
    float _328 = float(_312);
    float _330 = fma(_318, _292, _322);
    float _332 = fma(_314, _258, _264);
    float _334 = abs(_284);
    float _336 = fma(_328, _334, _330);
    bool _338 = !_304;
    float _340 = _324;
    float _356;
    if (!_338)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _344 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_74);
        float _362 = 1.0 / _360;
        float _364 = _108 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_41.x;
    float _370 = in.m_41.y;
    float _372 = in.m_41.z;
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = in.m_43.x;
    float _378 = in.m_43.y;
    float _380 = in.m_43.z;
    float _382 = in.m_39.y;
    float _384 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = _372 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = _336 * _384;
    float _392 = _336 * _386;
    float _394 = _336 * _388;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _398 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _376);
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _380);
    float _404 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _398 * _396;
    float _410 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _404 * _400;
    float _414 = _406 * _402;
    float _416 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = _408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _422 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _424 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _418);
    float _428 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _420);
    float _430 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _432 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _428);
    float _438 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _444 = _436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _446 = in.m_45.x;
    float _448 = _438 + _442;
    float _450 = _440 + _444;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _448 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _450 + _460;
    float _464 = in.m_45.y;
    float _466 = 1.0 / _454;
    float _468 = _458 * _458;
    float _470 = _462 * _462;
    float _472 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _474 = _382 > 0.5;
    float _476 = _468 + _470;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _480 = _478 != 0;
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _486 = _484 != 0;
    float _488 = sqrt(_476);
    float _490 = _408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    bool _496 = _128 > 0.5;
    bool _498 = _496 && _480;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _366 + _500;
    float _504 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[25].x, _490);
    float _506 = _494 * _466;
    bool _508 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = isnan(_366);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[5].z, _482);
    float _522 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _504);
    float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _526 = fma(_506, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _528 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_366);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _546 = _522 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _548 = _488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -_464;
    float _552 = _550 + 1.0;
    float _554 = _538 * _542;
    float _556 = _544 + _546;
    float _558 = _546;
    float _560 = _446;
    float _562 = _464;
    float _564 = _544;
    float _566 = _526;
    float _568 = _554;
    float _570 = _552;
    if (!_480)
    {
        _558 = _446;
    }
    float _572 = _558;
    float _574 = _572;
    if (_498)
    {
        float _576 = -_446;
        float _578 = _576 + 1.0;
        _560 = _578;
    }
    float _580 = _560;
    if (_486)
    {
        float _582 = _474 ? _552 : _464;
        _562 = _582;
    }
    float _584 = _562;
    float _586 = _526 * _554;
    if (!_548)
    {
        _564 = _470;
    }
    float _588 = _564;
    float _590 = _588;
    if (!_548)
    {
        _566 = _468;
    }
    float _592 = _566;
    float _594 = _592;
    if (!_548)
    {
        _340 = _448;
    }
    float _596 = _340;
    float _598 = _596;
    if (!_548)
    {
        _568 = _450;
    }
    float _600 = _568;
    float _602 = _600;
    if (!_548)
    {
        _570 = _556;
    }
    float _604 = _570;
    bool _606 = !_548;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _488 + _612;
        float _616 = _556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_476);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = _618 * _632;
        float _636 = _630 + (-1.0);
        float _638 = fma(_458, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_462, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _642 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _646 = _638 + _644;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _650 = _640 + _648;
        float _652 = fma(_556, _630, _642);
        float _654 = _646 * _646;
        float _656 = _650 * _650;
        _608 = _652;
        _594 = _654;
        _590 = _656;
        _598 = _638;
        _602 = _640;
    }
    float _658 = _608;
    float _660 = _594;
    float _662 = _590;
    float _664 = _598;
    float _666 = _602;
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _670 = _658 + _668;
    float _672 = -_538;
    float _674 = _672 + 1.0;
    if (_480)
    {
        _574 = _580;
    }
    float _676 = _574;
    float _678 = fma(_670, _670, _660);
    float _680 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _682 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _686 = _678 + _662;
    float _688 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[116].x, _680);
    float _690 = _682 * _374;
    float _692 = _684 * _524;
    float _694 = sqrt(_686);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _722 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _724 = isnan(_694);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _730 = _726 || _728;
    out.m_49.x = _714;
    out.m_49.y = _716;
    out.m_49.z = _706;
    out.m_51.x = _692;
    out.m_51.y = _690;
    out.m_53.x = _710;
    out.m_53.y = _712;
    out.m_53.z = _718;
    out.m_53.w = _720;
    float _732 = _698;
    if (!_730)
    {
        _732 = 1.0;
    }
    float _734 = _732;
    bool _736 = !_730;
    float _738 = _734;
    if (!_736)
    {
        bool _740 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _742 = isnan(_694);
        bool _744 = _740 || _742;
        bool _746 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _748 = _744 || _746;
        if (!_748)
        {
            float _750 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _752 = _694 + _750;
            float _754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _756 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _754;
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _760 = _758 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _762 = 1.0 / _756;
            float _764 = _752 * _762;
            float _766 = fma(_764, _760, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _738 = _766;
            _768 = true;
        }
        else
        {
            bool _770 = _694 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _772 = isnan(_694);
            bool _774 = _770 || _772;
            bool _776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _778 = _774 || _776;
            if (!_778)
            {
                float _780 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _782 = _694 + _780;
                float _784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _786 = _784 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _790 = _788 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _792 = 1.0 / _786;
                float _794 = _782 * _792;
                float _796 = fma(_794, _790, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _738 = _796;
                _768 = true;
            }
            else
            {
                _738 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _768 = false;
    float _798 = _738;
    float _800 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _802 = _658 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _806 = _664 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _810 = _666 + _808;
    float _812 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _814 = fma(_806, _798, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _816 = fma(_810, _798, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _818 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _818);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _824);
    float _834 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _826);
    float _836 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _828);
    float _838 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _830);
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _832);
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _842 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _854 = _842 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _856 = _842 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _850);
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _852);
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _854);
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _856);
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].z, _858);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].z, _860);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].z, _862);
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].z, _864);
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _866);
    float _876 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _868);
    float _878 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _870);
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _872);
    float _882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _884 = _874 + _878;
    float _886 = _880 + _878;
    float _888 = _878 * 0.5;
    float _890 = _884 * 0.5;
    float _892 = _886 * 0.5;
    float _894 = fma(_876, -0.5, _888);
    out.m_35.x = _882;
    out.gl_Position.x = _874;
    out.gl_Position.y = _876;
    out.gl_Position.z = _880;
    out.gl_Position.w = _878;
    out.m_55.x = _890;
    out.m_55.y = _894;
    out.m_55.z = _892;
    out.m_55.w = _878;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

