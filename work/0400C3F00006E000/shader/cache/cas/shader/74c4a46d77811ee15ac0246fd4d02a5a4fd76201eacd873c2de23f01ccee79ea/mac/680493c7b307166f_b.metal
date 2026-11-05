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
    float4 m_33 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _486 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_84);
        out.gl_Position.z = _1315;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1383 = as_type<float>(_120);
        out.gl_Position.z = _1383;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = -_330;
    float _374 = _372 + 1.0;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = _350 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _392 * _390;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_370, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_426, _398, _418);
    float _444 = fma(_424, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_434, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_428, _398, _420);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_436, _398, _430);
    float _454 = fma(_444, _336, _442);
    float _456 = fma(_446, _336, _448);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_39.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _502 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _504 = isnan(_494);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _522 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _526 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _528 = 1.0 / _516;
    bool _530 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _532 = isnan(_494);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_512;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _548 = _494 + _546;
    bool _550 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _552 = isnan(_494);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_540;
    float _564 = _562 + 1.0;
    float _566 = _540 * _544;
    float _568 = 1.0 / _520;
    bool _570 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _572 = isnan(_494);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _582;
    float _586 = _560 * _564;
    float _588 = -_560;
    float _590 = _588 + 1.0;
    bool _592 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _594 = isnan(_494);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _494 + _608;
    float _612 = _580 * _590;
    bool _614 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _616 = isnan(_494);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _606;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _636 = _610 * _528;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _638;
    float _642 = _548 * _568;
    float _644 = _624 * _630;
    float _646 = 1.0 / _584;
    float _648 = fma(_640, _636, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _652 = _494 + _650;
    float _654 = -_624;
    float _656 = _654 + 1.0;
    float _658 = _648 * _644;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _494 + _660;
    float _664 = 1.0 / _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].y, _658);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _676 = fma(_668, _642, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _678;
    bool _682 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_494);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _652 * _646;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _696;
    float _700 = fma(_676, _626, _670);
    float _702 = 1.0 / _674;
    float _704 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _706;
    float _710 = -_692;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _718 = _662 * _664;
    float _720 = fma(_704, _612, _700);
    float _722 = _512 * _712;
    float _724 = 1.0 / _698;
    float _726 = in.m_37.x;
    float _728 = in.m_37.y;
    float _730 = in.m_37.z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _734 = _494 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _738 = _494 + _736;
    float _740 = in.m_41.x;
    float _742 = in.m_41.y;
    float _744 = in.m_41.z;
    float _746 = fma(_716, _718, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _748 = 1.0 / _708;
    float _750 = in.m_43.x;
    float _752 = in.m_43.y;
    float _754 = in.m_43.z;
    float _756 = _734 * _702;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _758;
    float _762 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _764 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _766 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
    float _768 = in.m_43.w;
    float _770 = _738 * _724;
    float _772 = fma(_746, _586, _720);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _494 + _774;
    bool _778 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _780 = isnan(_494);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_760, _770, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _796 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _776 * _748;
    float _800 = fma(_790, _566, _772);
    float _802 = -_788;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _756, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _808;
    float _812 = _460 * _726;
    float _814 = _692 * _804;
    float _816 = fma(_806, _722, _800);
    float _818 = fma(_810, _798, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _820 = _464 * _730;
    float _822 = _462 * _728;
    float _824 = -_752;
    float _826 = _824 + _742;
    float _828 = fma(_818, _814, _816);
    float _830 = -_750;
    float _832 = _830 + _740;
    out.m_45.x = _750;
    out.m_45.y = _752;
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].y, _828);
    float _836 = -_754;
    float _838 = _836 + _744;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _840;
    float _844 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(_834, _826, _752);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = fma(_834, _832, _750);
    float _854 = fma(_834, _838, _754);
    float _856 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _854);
    float _866 = _844 * _860;
    float _868 = _856 * _862;
    float _870 = _858 * _864;
    float _872 = fma(_850, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _876 = _866 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _880;
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _892 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _894 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _884);
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _898 = fma(_842, _636, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _900 = fma(_882, _694, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _902 = _878 + _894;
    float _904 = _892 + _896;
    float _906 = _898 * _644;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _918;
    float _922 = _910 * _910;
    float _924 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].x, _906);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _930 = fma(_920, _770, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _932 = fma(_914, _914, _922);
    float _934 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].x, _916);
    float _936 = fma(_872, _626, _924);
    float _938 = fma(_928, _756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _940 = sqrt(_932);
    float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _934);
    float _944 = fma(_890, _718, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _946 = fma(_900, _612, _936);
    float _948 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_45.w = _768;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_944, _586, _946);
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _956 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = 1.0 / _950;
    float _960 = fma(_930, _566, _952);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _962;
    float _966 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _956);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _954);
    bool _970 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = fma(_964, _798, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _974 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _966);
    float _976 = fma(_938, _722, _960);
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _980 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _982 = isnan(0.5);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _988 = _984 || _986;
    float _990 = _796 + _974;
    float _992 = fma(_972, _814, _976);
    float _994 = _978 + _950;
    bool _996 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1004 = _1000 || _1002;
    float _1006 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].x, _992);
    float _1008 = _994 * _958;
    float _1010 = _1008 * 0.5;
    float _1012 = 0.5;
    float _1014 = _814;
    float _1016 = _904;
    float _1018 = _866;
    if (!_970)
    {
        _1012 = _902;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    if (!_970)
    {
        _1014 = _990;
    }
    float _1024 = _1014;
    bool _1026 = !_970;
    float _1028 = _1024;
    if (!_1026)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1034 = _940 + _1032;
        float _1036 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = rsqrt(_932);
        float _1040 = _1034 * _1030;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 + (-1.0);
        float _1054 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = _1038 * _1054;
        float _1060 = fma(_990, _1046, _1056);
        float _1062 = fma(_914, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_910, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1016 = _1062;
        _1022 = _1064;
        _1028 = _1060;
        _1018 = _1058;
    }
    float _1066 = _1016;
    float _1068 = _1022;
    float _1070 = _1028;
    float _1072 = _1018;
    float _1074 = _1072;
    float _1076 = _1070;
    float _1078 = _1068;
    if (_988)
    {
        _1074 = _1066;
    }
    float _1080 = _1074;
    float _1082 = _1080;
    if (!_988)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _796 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _892 + _1088;
        float _1092 = -_878;
        float _1094 = _1092 + _1068;
        float _1096 = _1086 * _1086;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1100 = _878 + _1098;
        float _1102 = fma(_1090, _1090, _1096);
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1106 = fma(_1100, _1100, _1102);
        float _1108 = -_892;
        float _1110 = _1108 + _1066;
        float _1112 = sqrt(_1106);
        float _1114 = precise::min(_1112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1104;
        float _1118 = -_796;
        float _1120 = _1118 + _1070;
        float _1122 = fma(_1110, _1116, _892);
        float _1124 = fma(_1120, _1116, _796);
        float _1126 = fma(_1094, _1116, _878);
        _1076 = _1124;
        _1082 = _1122;
        _1078 = _1126;
    }
    float _1128 = _1076;
    float _1130 = _1082;
    float _1132 = _1078;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1144 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1146 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1138);
    float _1148 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1142);
    float _1152 = _1142;
    if (_1004)
    {
        _1152 = 1.0;
    }
    float _1154 = _1152;
    float _1156 = _1154;
    if (!_1004)
    {
        float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
        float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1166 = 1.0 / _1160;
        float _1168 = 1.0 / _1164;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1174 = fma(_1166, _1170, _1172);
        float _1176 = _1174 * _1168;
        float _1178 = precise::clamp(_1176, 0.0, 1.0);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1184 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1188 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1194);
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1218 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1224 = _1180 > 0.0;
    bool _1226 = isnan(_1180);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1240 = _1218 + _1238;
    float _1242 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1246 = _1234 * 0.5;
    float _1248 = _1236 + _1234;
    float _1250 = _1234 + _1240;
    float _1252 = fma(_1244, -0.5, _1246);
    float _1254 = _1248 * 0.5;
    float _1256 = _1250 * 0.5;
    out.m_47.x = _1006;
    out.m_33.x = _1242;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1234;
    out.m_49.x = _1254;
    out.m_49.y = _1252;
    out.m_49.z = _1256;
    out.m_49.w = _1234;
    if (_1232)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _486 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_84);
        out.gl_Position.z = _1315;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1383 = as_type<float>(_120);
        out.gl_Position.z = _1383;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = -_330;
    float _374 = _372 + 1.0;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = _350 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _392 * _390;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_370, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_426, _398, _418);
    float _444 = fma(_424, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_434, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_428, _398, _420);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_436, _398, _430);
    float _454 = fma(_444, _336, _442);
    float _456 = fma(_446, _336, _448);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_39.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _502 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _504 = isnan(_494);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _522 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _526 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _528 = 1.0 / _516;
    bool _530 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _532 = isnan(_494);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_512;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _548 = _494 + _546;
    bool _550 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _552 = isnan(_494);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_540;
    float _564 = _562 + 1.0;
    float _566 = _540 * _544;
    float _568 = 1.0 / _520;
    bool _570 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _572 = isnan(_494);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _582;
    float _586 = _560 * _564;
    float _588 = -_560;
    float _590 = _588 + 1.0;
    bool _592 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _594 = isnan(_494);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _494 + _608;
    float _612 = _580 * _590;
    bool _614 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _616 = isnan(_494);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _606;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _636 = _610 * _528;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _638;
    float _642 = _548 * _568;
    float _644 = _624 * _630;
    float _646 = 1.0 / _584;
    float _648 = fma(_640, _636, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _652 = _494 + _650;
    float _654 = -_624;
    float _656 = _654 + 1.0;
    float _658 = _648 * _644;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _494 + _660;
    float _664 = 1.0 / _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].y, _658);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _676 = fma(_668, _642, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _678;
    bool _682 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_494);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _652 * _646;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _696;
    float _700 = fma(_676, _626, _670);
    float _702 = 1.0 / _674;
    float _704 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _706;
    float _710 = -_692;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _718 = _662 * _664;
    float _720 = fma(_704, _612, _700);
    float _722 = _512 * _712;
    float _724 = 1.0 / _698;
    float _726 = in.m_37.x;
    float _728 = in.m_37.y;
    float _730 = in.m_37.z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _734 = _494 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _738 = _494 + _736;
    float _740 = in.m_41.x;
    float _742 = in.m_41.y;
    float _744 = in.m_41.z;
    float _746 = fma(_716, _718, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _748 = 1.0 / _708;
    float _750 = in.m_43.x;
    float _752 = in.m_43.y;
    float _754 = in.m_43.z;
    float _756 = _734 * _702;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _758;
    float _762 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _764 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _766 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
    float _768 = in.m_43.w;
    float _770 = _738 * _724;
    float _772 = fma(_746, _586, _720);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _494 + _774;
    bool _778 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _780 = isnan(_494);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_760, _770, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _796 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _776 * _748;
    float _800 = fma(_790, _566, _772);
    float _802 = -_788;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _756, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _808;
    float _812 = _460 * _726;
    float _814 = _692 * _804;
    float _816 = fma(_806, _722, _800);
    float _818 = fma(_810, _798, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _820 = _464 * _730;
    float _822 = _462 * _728;
    float _824 = -_752;
    float _826 = _824 + _742;
    float _828 = fma(_818, _814, _816);
    float _830 = -_750;
    float _832 = _830 + _740;
    out.m_45.x = _750;
    out.m_45.y = _752;
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].y, _828);
    float _836 = -_754;
    float _838 = _836 + _744;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _840;
    float _844 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(_834, _826, _752);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = fma(_834, _832, _750);
    float _854 = fma(_834, _838, _754);
    float _856 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _854);
    float _866 = _844 * _860;
    float _868 = _856 * _862;
    float _870 = _858 * _864;
    float _872 = fma(_850, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _876 = _866 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _880;
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _892 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _894 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _884);
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _898 = fma(_842, _636, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _900 = fma(_882, _694, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _902 = _878 + _894;
    float _904 = _892 + _896;
    float _906 = _898 * _644;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _918;
    float _922 = _910 * _910;
    float _924 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].x, _906);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _930 = fma(_920, _770, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _932 = fma(_914, _914, _922);
    float _934 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].x, _916);
    float _936 = fma(_872, _626, _924);
    float _938 = fma(_928, _756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _940 = sqrt(_932);
    float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _934);
    float _944 = fma(_890, _718, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _946 = fma(_900, _612, _936);
    float _948 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_45.w = _768;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_944, _586, _946);
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _956 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = 1.0 / _950;
    float _960 = fma(_930, _566, _952);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _962;
    float _966 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _956);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _954);
    bool _970 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = fma(_964, _798, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _974 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _966);
    float _976 = fma(_938, _722, _960);
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _980 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _982 = isnan(0.5);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _988 = _984 || _986;
    float _990 = _796 + _974;
    float _992 = fma(_972, _814, _976);
    float _994 = _978 + _950;
    bool _996 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1004 = _1000 || _1002;
    float _1006 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].x, _992);
    float _1008 = _994 * _958;
    float _1010 = _1008 * 0.5;
    float _1012 = 0.5;
    float _1014 = _814;
    float _1016 = _904;
    float _1018 = _866;
    if (!_970)
    {
        _1012 = _902;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    if (!_970)
    {
        _1014 = _990;
    }
    float _1024 = _1014;
    bool _1026 = !_970;
    float _1028 = _1024;
    if (!_1026)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1034 = _940 + _1032;
        float _1036 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = rsqrt(_932);
        float _1040 = _1034 * _1030;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 + (-1.0);
        float _1054 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = _1038 * _1054;
        float _1060 = fma(_990, _1046, _1056);
        float _1062 = fma(_914, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_910, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1016 = _1062;
        _1022 = _1064;
        _1028 = _1060;
        _1018 = _1058;
    }
    float _1066 = _1016;
    float _1068 = _1022;
    float _1070 = _1028;
    float _1072 = _1018;
    float _1074 = _1072;
    float _1076 = _1070;
    float _1078 = _1068;
    if (_988)
    {
        _1074 = _1066;
    }
    float _1080 = _1074;
    float _1082 = _1080;
    if (!_988)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _796 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _892 + _1088;
        float _1092 = -_878;
        float _1094 = _1092 + _1068;
        float _1096 = _1086 * _1086;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1100 = _878 + _1098;
        float _1102 = fma(_1090, _1090, _1096);
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1106 = fma(_1100, _1100, _1102);
        float _1108 = -_892;
        float _1110 = _1108 + _1066;
        float _1112 = sqrt(_1106);
        float _1114 = precise::min(_1112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1104;
        float _1118 = -_796;
        float _1120 = _1118 + _1070;
        float _1122 = fma(_1110, _1116, _892);
        float _1124 = fma(_1120, _1116, _796);
        float _1126 = fma(_1094, _1116, _878);
        _1076 = _1124;
        _1082 = _1122;
        _1078 = _1126;
    }
    float _1128 = _1076;
    float _1130 = _1082;
    float _1132 = _1078;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1144 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1146 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1138);
    float _1148 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1142);
    float _1152 = _1142;
    if (_1004)
    {
        _1152 = 1.0;
    }
    float _1154 = _1152;
    float _1156 = _1154;
    if (!_1004)
    {
        float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
        float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1166 = 1.0 / _1160;
        float _1168 = 1.0 / _1164;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1174 = fma(_1166, _1170, _1172);
        float _1176 = _1174 * _1168;
        float _1178 = precise::clamp(_1176, 0.0, 1.0);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1184 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1188 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1194);
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1218 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1224 = _1180 > 0.0;
    bool _1226 = isnan(_1180);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1240 = _1218 + _1238;
    float _1242 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1246 = _1234 * 0.5;
    float _1248 = _1236 + _1234;
    float _1250 = _1234 + _1240;
    float _1252 = fma(_1244, -0.5, _1246);
    float _1254 = _1248 * 0.5;
    float _1256 = _1250 * 0.5;
    out.m_47.x = _1006;
    out.m_33.x = _1242;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1234;
    out.m_49.x = _1254;
    out.m_49.y = _1252;
    out.m_49.z = _1256;
    out.m_49.w = _1234;
    if (_1232)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _486 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_84);
        out.gl_Position.z = _1315;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1383 = as_type<float>(_120);
        out.gl_Position.z = _1383;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = -_330;
    float _374 = _372 + 1.0;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = _350 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _392 * _390;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = fma(_370, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_426, _398, _418);
    float _444 = fma(_424, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_434, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_428, _398, _420);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_436, _398, _430);
    float _454 = fma(_444, _336, _442);
    float _456 = fma(_446, _336, _448);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_39.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _502 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _504 = isnan(_494);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _522 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _526 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _528 = 1.0 / _516;
    bool _530 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _532 = isnan(_494);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_512;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _548 = _494 + _546;
    bool _550 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _552 = isnan(_494);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_540;
    float _564 = _562 + 1.0;
    float _566 = _540 * _544;
    float _568 = 1.0 / _520;
    bool _570 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _572 = isnan(_494);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _582;
    float _586 = _560 * _564;
    float _588 = -_560;
    float _590 = _588 + 1.0;
    bool _592 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _594 = isnan(_494);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _494 + _608;
    float _612 = _580 * _590;
    bool _614 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _616 = isnan(_494);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _606;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _636 = _610 * _528;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _638;
    float _642 = _548 * _568;
    float _644 = _624 * _630;
    float _646 = 1.0 / _584;
    float _648 = fma(_640, _636, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _652 = _494 + _650;
    float _654 = -_624;
    float _656 = _654 + 1.0;
    float _658 = _648 * _644;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _494 + _660;
    float _664 = 1.0 / _634;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].y, _658);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _676 = fma(_668, _642, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _678;
    bool _682 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_494);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _652 * _646;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _696;
    float _700 = fma(_676, _626, _670);
    float _702 = 1.0 / _674;
    float _704 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _706;
    float _710 = -_692;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _718 = _662 * _664;
    float _720 = fma(_704, _612, _700);
    float _722 = _512 * _712;
    float _724 = 1.0 / _698;
    float _726 = in.m_37.x;
    float _728 = in.m_37.y;
    float _730 = in.m_37.z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _734 = _494 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _738 = _494 + _736;
    float _740 = in.m_41.x;
    float _742 = in.m_41.y;
    float _744 = in.m_41.z;
    float _746 = fma(_716, _718, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _748 = 1.0 / _708;
    float _750 = in.m_43.x;
    float _752 = in.m_43.y;
    float _754 = in.m_43.z;
    float _756 = _734 * _702;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _758;
    float _762 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _764 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _766 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
    float _768 = in.m_43.w;
    float _770 = _738 * _724;
    float _772 = fma(_746, _586, _720);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _494 + _774;
    bool _778 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _780 = isnan(_494);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_760, _770, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _796 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _776 * _748;
    float _800 = fma(_790, _566, _772);
    float _802 = -_788;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _756, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _808;
    float _812 = _460 * _726;
    float _814 = _692 * _804;
    float _816 = fma(_806, _722, _800);
    float _818 = fma(_810, _798, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _820 = _464 * _730;
    float _822 = _462 * _728;
    float _824 = -_752;
    float _826 = _824 + _742;
    float _828 = fma(_818, _814, _816);
    float _830 = -_750;
    float _832 = _830 + _740;
    out.m_45.x = _750;
    out.m_45.y = _752;
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].y, _828);
    float _836 = -_754;
    float _838 = _836 + _744;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _840;
    float _844 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(_834, _826, _752);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = fma(_834, _832, _750);
    float _854 = fma(_834, _838, _754);
    float _856 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _852);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _854);
    float _866 = _844 * _860;
    float _868 = _856 * _862;
    float _870 = _858 * _864;
    float _872 = fma(_850, _642, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _876 = _866 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _880;
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _892 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _894 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _884);
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _898 = fma(_842, _636, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _900 = fma(_882, _694, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _902 = _878 + _894;
    float _904 = _892 + _896;
    float _906 = _898 * _644;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _796 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _918;
    float _922 = _910 * _910;
    float _924 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[159].x, _906);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _930 = fma(_920, _770, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _932 = fma(_914, _914, _922);
    float _934 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].x, _916);
    float _936 = fma(_872, _626, _924);
    float _938 = fma(_928, _756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _940 = sqrt(_932);
    float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _934);
    float _944 = fma(_890, _718, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _946 = fma(_900, _612, _936);
    float _948 = _796 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_45.w = _768;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _952 = fma(_944, _586, _946);
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _956 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = 1.0 / _950;
    float _960 = fma(_930, _566, _952);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _962;
    float _966 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _956);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _954);
    bool _970 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = fma(_964, _798, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _974 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _966);
    float _976 = fma(_938, _722, _960);
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _980 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _982 = isnan(0.5);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _988 = _984 || _986;
    float _990 = _796 + _974;
    float _992 = fma(_972, _814, _976);
    float _994 = _978 + _950;
    bool _996 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1004 = _1000 || _1002;
    float _1006 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[166].x, _992);
    float _1008 = _994 * _958;
    float _1010 = _1008 * 0.5;
    float _1012 = 0.5;
    float _1014 = _814;
    float _1016 = _904;
    float _1018 = _866;
    if (!_970)
    {
        _1012 = _902;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    if (!_970)
    {
        _1014 = _990;
    }
    float _1024 = _1014;
    bool _1026 = !_970;
    float _1028 = _1024;
    if (!_1026)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1034 = _940 + _1032;
        float _1036 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = rsqrt(_932);
        float _1040 = _1034 * _1030;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 + (-1.0);
        float _1054 = fma(_1050, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = _1038 * _1054;
        float _1060 = fma(_990, _1046, _1056);
        float _1062 = fma(_914, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_910, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1016 = _1062;
        _1022 = _1064;
        _1028 = _1060;
        _1018 = _1058;
    }
    float _1066 = _1016;
    float _1068 = _1022;
    float _1070 = _1028;
    float _1072 = _1018;
    float _1074 = _1072;
    float _1076 = _1070;
    float _1078 = _1068;
    if (_988)
    {
        _1074 = _1066;
    }
    float _1080 = _1074;
    float _1082 = _1080;
    if (!_988)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _796 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _892 + _1088;
        float _1092 = -_878;
        float _1094 = _1092 + _1068;
        float _1096 = _1086 * _1086;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1100 = _878 + _1098;
        float _1102 = fma(_1090, _1090, _1096);
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1106 = fma(_1100, _1100, _1102);
        float _1108 = -_892;
        float _1110 = _1108 + _1066;
        float _1112 = sqrt(_1106);
        float _1114 = precise::min(_1112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1104;
        float _1118 = -_796;
        float _1120 = _1118 + _1070;
        float _1122 = fma(_1110, _1116, _892);
        float _1124 = fma(_1120, _1116, _796);
        float _1126 = fma(_1094, _1116, _878);
        _1076 = _1124;
        _1082 = _1122;
        _1078 = _1126;
    }
    float _1128 = _1076;
    float _1130 = _1082;
    float _1132 = _1078;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1144 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1136);
    float _1146 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1138);
    float _1148 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1142);
    float _1152 = _1142;
    if (_1004)
    {
        _1152 = 1.0;
    }
    float _1154 = _1152;
    float _1156 = _1154;
    if (!_1004)
    {
        float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1158);
        float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1166 = 1.0 / _1160;
        float _1168 = 1.0 / _1164;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1174 = fma(_1166, _1170, _1172);
        float _1176 = _1174 * _1168;
        float _1178 = precise::clamp(_1176, 0.0, 1.0);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1184 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1146);
    float _1188 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1194);
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1218 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1224 = _1180 > 0.0;
    bool _1226 = isnan(_1180);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1240 = _1218 + _1238;
    float _1242 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1246 = _1234 * 0.5;
    float _1248 = _1236 + _1234;
    float _1250 = _1234 + _1240;
    float _1252 = fma(_1244, -0.5, _1246);
    float _1254 = _1248 * 0.5;
    float _1256 = _1250 * 0.5;
    out.m_47.x = _1006;
    out.m_33.x = _1242;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1234;
    out.m_49.x = _1254;
    out.m_49.y = _1252;
    out.m_49.z = _1256;
    out.m_49.w = _1234;
    if (_1232)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

