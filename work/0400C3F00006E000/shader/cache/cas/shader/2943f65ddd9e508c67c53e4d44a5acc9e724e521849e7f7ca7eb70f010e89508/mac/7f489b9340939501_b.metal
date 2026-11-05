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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_63 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_45 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _278 = false;
    bool _164 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_100);
        out.gl_Position.z = _1367;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_35.w;
    float _106 = in.m_37.w;
    bool _108 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_104;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_39.w = _106;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_84);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_33.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _102 = as_type<int>(_138);
    }
    int _140 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1441 = as_type<float>(_140);
        out.gl_Position.z = _1441;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _144 = !_142;
    float _162;
    if (!_144)
    {
        float _146 = in.m_37.x;
        float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _150 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _152 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _154 = _152 * _148;
        float _156 = floor(_154);
        float _158 = -_156;
        float _160 = _154 + _158;
        _162 = _160;
        _164 = true;
    }
    else
    {
        float _166 = float(_84);
        float _168 = 1.0 / _166;
        float _170 = _120 * _168;
        _162 = _170;
    }
    _164 = false;
    float _172 = _162;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _176 = _172 + _174;
    bool _178 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _180 = isnan(_172);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _186 = _182 || _184;
    float _188 = float(_186);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _190;
    bool _194 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _196 = isnan(_172);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -_188;
    float _208 = _206 + 1.0;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _210;
    float _214 = 1.0 / _192;
    bool _216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _218 = _204 * _208;
    float _220 = -_204;
    float _222 = _220 + 1.0;
    float _224 = _176 * _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _226;
    float _230 = fma(_212, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _232;
    float _236 = fma(_228, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _238 = fma(_234, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _240 = _230 * _218;
    float _242 = _236 * _218;
    float _244 = _238 * _218;
    float _246 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].x, _240);
    float _248 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].y, _244);
    float _250 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].z, _242);
    float _252 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].x, _246);
    float _254 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].y, _248);
    float _256 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].z, _250);
    bool _258 = !_216;
    float _276;
    if (!_258)
    {
        float _260 = in.m_37.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_84);
        float _282 = 1.0 / _280;
        float _284 = _120 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = in.m_41.x;
    float _290 = in.m_41.y;
    float _292 = in.m_41.z;
    float _294 = in.m_37.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _298 = _296 != 0;
    float _300 = in.m_30.x;
    float _302 = in.m_30.y;
    float _304 = in.m_30.z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _308 = _306 != 0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _310;
    float _314 = in.m_43.y;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _326 = _324 != 0;
    float _328 = 1.0 / _312;
    float _330 = in.m_37.x;
    float _332 = in.m_37.y;
    float _334 = 0.0;
    if (_298)
    {
        float _336 = in.m_37.y;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _342 = !_318;
    int _344 = _342 ? 0 : 1;
    float _346 = _254 * _290;
    float _348 = _256 * _292;
    float _350 = _252 * _288;
    float _352 = _294 * 2.0;
    bool _354 = _294 > 0.5;
    float _356 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _340;
    float _358 = floor(_352);
    float _360 = _302 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _302 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _302 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _366 = -_314;
    float _368 = _366 + 1.0;
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _376 = _294 + _332;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _314;
    if (_308)
    {
        float _384 = _354 ? _368 : _314;
        _382 = _384;
    }
    float _386 = _382;
    float _388 = _330 * 2.0;
    float _390 = _376 + (-1.0);
    bool _392 = _338 > 0.5;
    bool _394 = _392 && _298;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _398 = _286 + _396;
    bool _400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _408 = _404 || _406;
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = floor(_388);
    bool _414 = _358 >= 0.0;
    bool _416 = isnan(_358);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = _398 * _328;
    float _426 = _332 * 2.0;
    float _428 = in.m_43.x;
    int _430 = _422 ? 0 : 1;
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    bool _434 = _358 > 0.0;
    float _436 = _380 * _120;
    float _438 = in.m_47.x;
    float _440 = in.m_47.y;
    float _442 = in.m_47.z;
    float _444 = floor(_426);
    float _446 = _330 + _332;
    out.m_33.x = 1.0;
    bool _448 = !_322;
    int _450 = _448 ? 0 : 1;
    float _452 = _446 + (-1.0);
    bool _454 = _412 >= 0.0;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    float _464 = _332 + (-0.5);
    float _466 = exp2(_436);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _470 = _462 ? 0 : 1;
    float _472 = _386 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _474 = _412 > 0.0;
    float _476 = _294 + _330;
    float _478 = _330 + (-0.5);
    int _480 = ~_430;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _476 + (-1.0);
    int _488 = _484;
    float _490 = _478;
    if (!_434)
    {
        int _492 = ~_430;
        int _494 = _492 + 1;
        _488 = _494;
    }
    int _496 = _488;
    float _498 = _294 + (-0.5);
    bool _500 = _444 > 0.0;
    float _502 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _504 = ~_470;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    float _512 = -_466;
    float _514 = _512 + 1.0;
    int _516 = _508;
    if (!_474)
    {
        int _518 = ~_470;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _526 = _444 >= 0.0;
    bool _528 = isnan(_444);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _440);
    float _538 = _408 ? _514 : 0.0;
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _442);
    bool _542 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _544 = isnan(0.5);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _550 = _546 || _548;
    float _552 = _510 * _524;
    float _554 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _536 * _554;
    bool _564 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _566 = isnan(_286);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _540 * _356;
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = 1.0 / _560;
    float _590 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    bool _592 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_286);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _604;
    float _608 = -_574;
    float _610 = _608 + 1.0;
    float _612 = 0.0;
    float _614 = _538;
    if (_298)
    {
        _612 = _428;
    }
    float _616 = _612;
    float _618 = fma(_606, _424, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _620 = _534 ? 0 : 1;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _626;
    float _630 = _602 * _610;
    float _632 = _616;
    if (_394)
    {
        float _634 = -_616;
        float _636 = _634 + 1.0;
        _632 = _636;
    }
    float _638 = _632;
    float _640 = fma(_624, _424, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _642 = fma(_628, _424, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _618 * _630;
    if (_586)
    {
        float _646 = _538 * _588;
        _122 = _646;
    }
    float _648 = _122;
    float _650 = _640 * _630;
    float _652 = _642 * _630;
    float _654 = in.m_49.x;
    float _656 = in.m_49.y;
    float _658 = in.m_49.z;
    int _660 = abs(_450);
    float _662 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_298)
    {
        _614 = _428;
    }
    float _664 = _614;
    float _666 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = float(_660);
    float _670 = float(_522);
    float _672 = float(_496);
    int _674 = abs(_344);
    float _676 = _668 * _670;
    int _678 = ~_620;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _686 = !_326;
    int _688 = _686 ? 0 : 1;
    int _690 = _682;
    float _692 = _664;
    if (!_500)
    {
        int _694 = ~_620;
        int _696 = _694 + 1;
        _690 = _696;
    }
    int _698 = _690;
    float _700 = _676 * (-2.0);
    int _702 = abs(_688);
    float _704 = float(_674);
    float _706 = float(_702);
    float _708 = fma(_700, _656, _656);
    float _710 = float(_698);
    float _712 = fma(_410, _700, _410);
    float _714 = _704 * _672;
    float _716 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    if (_298)
    {
        _692 = _638;
    }
    float _718 = _692;
    float _720 = _706 * _710;
    float _722 = in.m_51.x;
    float _724 = in.m_51.y;
    float _726 = in.m_51.z;
    float _728 = fma(_712, _648, _716);
    float _730 = _714 * (-2.0);
    float _732 = _720 * (-2.0);
    bool _734 = _440 != 0.0;
    bool _736 = isnan(_440);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = -_602;
    float _746 = _744 + 1.0;
    float _748 = fma(_730, _654, _654);
    float _750 = fma(_732, _658, _658);
    float _752 = fma(_468, _730, _468);
    bool _754 = _438 == 0.0;
    bool _756 = !_742;
    bool _758 = _754 && _756;
    float _760 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[196].x, _748);
    float _762 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    bool _766 = _442 == 0.0;
    bool _768 = _766 && _758;
    float _770 = fma(_752, _648, _760);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _644);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = in.m_53.w;
    float _782 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _650);
    float _784 = fma(_502, _732, _502);
    float _786 = _770 * 0.15915493667125701904296875;
    float _788 = _728 * 0.15915493667125701904296875;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _792 = fma(_784, _648, _762);
    float _794 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].x, _764);
    float _796 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].y, _772);
    float _798 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = _732;
    float _804 = _770;
    float _806 = _762;
    float _808 = _722;
    if (_768)
    {
        _802 = _722;
    }
    float _810 = _802;
    float _812 = _810;
    if (_768)
    {
        _804 = _724;
    }
    float _814 = _804;
    float _816 = _786 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _814;
    if (_768)
    {
        _490 = _810;
    }
    float _822 = _490;
    float _824 = _822;
    if (!_768)
    {
        _812 = _722;
    }
    float _826 = _812;
    if (_768)
    {
        _806 = _814;
    }
    float _828 = _806;
    float _830 = _828;
    if (!_768)
    {
        _820 = _724;
    }
    float _832 = _820;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    if (_768)
    {
        _808 = _726;
    }
    float _838 = _808;
    float _840 = _776 * _726;
    float _842 = _838;
    if (!_768)
    {
        float _844 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[17].y, _726);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _778 * _826;
    if (!_768)
    {
        float _850 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _826);
        _824 = _850;
    }
    float _852 = _824;
    float _854 = _774 * _832;
    float _856 = _718 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _858 = _788 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = -_840;
    float _864 = fma(_778, _832, _862);
    float _866 = -_848;
    float _868 = fma(_774, _726, _866);
    if (!_768)
    {
        float _870 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _830 = _870;
    }
    float _872 = _830;
    float _874 = -_854;
    float _876 = fma(_776, _826, _874);
    float _878 = _472 * _790;
    float _880 = _856 * _684;
    float _882 = _864 * _780;
    float _884 = _800 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _868 * _780;
    float _890 = _876 * _780;
    float _892 = _818 * _836;
    float _894 = _798 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_55.x = _880;
    out.m_55.y = _878;
    float _896 = _786 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _818 * _860;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = _800 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _818 * _886;
    float _912 = _860 * _886;
    float _914 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _910 * _776;
    float _920 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _898 * _836;
    float _924 = _898 * _886;
    float _926 = _898 * _860;
    float _928 = _836 * _886;
    float _930 = _910 * _562;
    float _932 = _924 * _562;
    out.m_57.x = _916;
    out.m_57.y = _920;
    out.m_57.z = _902;
    float _934 = -_562;
    float _936 = _908 * _934;
    float _938 = fma(_908, _900, _922);
    float _940 = fma(_908, _922, _900);
    float _942 = -_892;
    float _944 = fma(_908, _926, _942);
    float _946 = fma(_912, _552, _936);
    float _948 = -_926;
    float _950 = fma(_908, _892, _948);
    float _952 = fma(_938, _552, _930);
    float _954 = fma(_944, _552, _932);
    float _956 = fma(_928, _576, _946);
    float _958 = -_872;
    float _960 = _908 * _958;
    float _962 = fma(_950, _576, _952);
    float _964 = fma(_940, _576, _954);
    float _966 = -_776;
    float _968 = _908 * _966;
    float _970 = fma(_912, _852, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = -_888;
    float _978 = _908 * _976;
    float _980 = fma(_912, _774, _968);
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].x, _972);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _986 = _910 * _872;
    float _988 = _924 * _872;
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].z, _982);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _994 = _910 * _888;
    float _996 = fma(_912, _882, _978);
    float _998 = _662 + _990;
    float _1000 = _924 * _776;
    float _1002 = _666 + _992;
    float _1004 = _924 * _888;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_938, _774, _918);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_938, _852, _986);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_944, _852, _988);
    float _1022 = fma(_944, _774, _1000);
    float _1024 = fma(_938, _882, _994);
    float _1026 = fma(_1014, _1014, _1018);
    float _1028 = fma(_944, _882, _1004);
    float _1030 = fma(_950, _778, _1010);
    float _1032 = _962 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = sqrt(_1026);
    float _1036 = fma(_928, _846, _970);
    float _1038 = fma(_928, _778, _980);
    float _1040 = fma(_950, _846, _1016);
    float _1042 = fma(_928, _890, _996);
    float _1044 = fma(_940, _846, _1020);
    float _1046 = fma(_950, _890, _1024);
    float _1048 = fma(_940, _778, _1022);
    float _1050 = fma(_940, _890, _1028);
    float _1052 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1054 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1056 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1058 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1052);
    float _1062 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1054);
    float _1064 = _590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1066 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1056);
    float _1070 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1058);
    float _1072 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1074 = _1064 + _1062;
    float _1076 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1072);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1076);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1086 = _1056;
    float _1088 = _1002;
    float _1090 = _998;
    float _1092 = _1008;
    float _1094 = _1014;
    if (!_1066)
    {
        _1086 = _1002;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (!_1066)
    {
        _1088 = _998;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (!_1066)
    {
        _1090 = _1074;
    }
    float _1104 = _1090;
    bool _1106 = !_1066;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1034 + _1112;
        float _1116 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = rsqrt(_1026);
        float _1120 = _1114 * _1110;
        float _1122 = _1120 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = cos(_1128);
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = _1118 * _1132;
        float _1136 = _1130 + (-1.0);
        float _1138 = fma(_1014, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1008, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = fma(_1074, _1130, _1142);
        _1098 = _1138;
        _1102 = _1140;
        _1108 = _1144;
    }
    float _1146 = _1098;
    float _1148 = _1102;
    float _1150 = _1108;
    float _1152 = _1150;
    if (_550)
    {
        _1092 = _1146;
    }
    float _1154 = _1092;
    float _1156 = _1154;
    if (_550)
    {
        _1094 = _1148;
    }
    float _1158 = _1094;
    float _1160 = _1158;
    if (!_550)
    {
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1164 = _1064 + _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1168 = _666 + _1166;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1172 = -_1064;
        float _1174 = _1172 + _1150;
        float _1176 = _1164 * _1164;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1180 = _662 + _1178;
        float _1182 = -_662;
        float _1184 = _1182 + _1148;
        float _1186 = fma(_1168, _1168, _1176);
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1190 = fma(_1180, _1180, _1186);
        float _1192 = sqrt(_1190);
        float _1194 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1196 = precise::min(_1192, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1198 = _1196 * _1188;
        float _1200 = -_666;
        float _1202 = _1200 + _1146;
        float _1204 = _1194 * _1198;
        float _1206 = fma(_1202, _1204, _666);
        float _1208 = fma(_1174, _1204, _1064);
        float _1210 = fma(_1184, _1204, _662);
        _1152 = _1208;
        _1156 = _1206;
        _1160 = _1210;
    }
    float _1212 = _1152;
    float _1214 = _1156;
    float _1216 = _1160;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1222);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1238);
    float _1270 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1274 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1284 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1080);
    float _1286 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1288 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1084);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1292 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1068);
    float _1294 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1268);
    float _1296 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1060);
    float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1070);
    float _1300 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1270);
    float _1302 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1230);
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1278);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    out.m_59.x = _1292;
    out.m_59.y = _1296;
    out.m_59.z = _1298;
    out.m_61.x = _1284;
    out.m_61.y = _1286;
    out.m_61.z = _1288;
    out.m_63.x = _1294;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1308;
    out.gl_Position.w = _1310;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _278 = false;
    bool _164 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_100);
        out.gl_Position.z = _1367;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_35.w;
    float _106 = in.m_37.w;
    bool _108 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_104;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_39.w = _106;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_84);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_33.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _102 = as_type<int>(_138);
    }
    int _140 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1441 = as_type<float>(_140);
        out.gl_Position.z = _1441;
    }
    if (_132)
    {
        return out;
    }
    bool _142 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _144 = !_142;
    float _162;
    if (!_144)
    {
        float _146 = in.m_37.x;
        float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _150 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _152 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _154 = _152 * _148;
        float _156 = floor(_154);
        float _158 = -_156;
        float _160 = _154 + _158;
        _162 = _160;
        _164 = true;
    }
    else
    {
        float _166 = float(_84);
        float _168 = 1.0 / _166;
        float _170 = _120 * _168;
        _162 = _170;
    }
    _164 = false;
    float _172 = _162;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _176 = _172 + _174;
    bool _178 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _180 = isnan(_172);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _186 = _182 || _184;
    float _188 = float(_186);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _190;
    bool _194 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _196 = isnan(_172);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -_188;
    float _208 = _206 + 1.0;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _210;
    float _214 = 1.0 / _192;
    bool _216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _218 = _204 * _208;
    float _220 = -_204;
    float _222 = _220 + 1.0;
    float _224 = _176 * _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _226;
    float _230 = fma(_212, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _232;
    float _236 = fma(_228, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _238 = fma(_234, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _240 = _230 * _218;
    float _242 = _236 * _218;
    float _244 = _238 * _218;
    float _246 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].x, _240);
    float _248 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].y, _244);
    float _250 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].z, _242);
    float _252 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].x, _246);
    float _254 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].y, _248);
    float _256 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].z, _250);
    bool _258 = !_216;
    float _276;
    if (!_258)
    {
        float _260 = in.m_37.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_84);
        float _282 = 1.0 / _280;
        float _284 = _120 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = in.m_41.x;
    float _290 = in.m_41.y;
    float _292 = in.m_41.z;
    float _294 = in.m_37.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _298 = _296 != 0;
    float _300 = in.m_30.x;
    float _302 = in.m_30.y;
    float _304 = in.m_30.z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _308 = _306 != 0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _310;
    float _314 = in.m_43.y;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _326 = _324 != 0;
    float _328 = 1.0 / _312;
    float _330 = in.m_37.x;
    float _332 = in.m_37.y;
    float _334 = 0.0;
    if (_298)
    {
        float _336 = in.m_37.y;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _342 = !_318;
    int _344 = _342 ? 0 : 1;
    float _346 = _254 * _290;
    float _348 = _256 * _292;
    float _350 = _252 * _288;
    float _352 = _294 * 2.0;
    bool _354 = _294 > 0.5;
    float _356 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _340;
    float _358 = floor(_352);
    float _360 = _302 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _302 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _302 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _366 = -_314;
    float _368 = _366 + 1.0;
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _376 = _294 + _332;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _314;
    if (_308)
    {
        float _384 = _354 ? _368 : _314;
        _382 = _384;
    }
    float _386 = _382;
    float _388 = _330 * 2.0;
    float _390 = _376 + (-1.0);
    bool _392 = _338 > 0.5;
    bool _394 = _392 && _298;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _398 = _286 + _396;
    bool _400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _408 = _404 || _406;
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = floor(_388);
    bool _414 = _358 >= 0.0;
    bool _416 = isnan(_358);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = _398 * _328;
    float _426 = _332 * 2.0;
    float _428 = in.m_43.x;
    int _430 = _422 ? 0 : 1;
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    bool _434 = _358 > 0.0;
    float _436 = _380 * _120;
    float _438 = in.m_47.x;
    float _440 = in.m_47.y;
    float _442 = in.m_47.z;
    float _444 = floor(_426);
    float _446 = _330 + _332;
    out.m_33.x = 1.0;
    bool _448 = !_322;
    int _450 = _448 ? 0 : 1;
    float _452 = _446 + (-1.0);
    bool _454 = _412 >= 0.0;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    float _464 = _332 + (-0.5);
    float _466 = exp2(_436);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _470 = _462 ? 0 : 1;
    float _472 = _386 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _474 = _412 > 0.0;
    float _476 = _294 + _330;
    float _478 = _330 + (-0.5);
    int _480 = ~_430;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _476 + (-1.0);
    int _488 = _484;
    float _490 = _478;
    if (!_434)
    {
        int _492 = ~_430;
        int _494 = _492 + 1;
        _488 = _494;
    }
    int _496 = _488;
    float _498 = _294 + (-0.5);
    bool _500 = _444 > 0.0;
    float _502 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _504 = ~_470;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    float _512 = -_466;
    float _514 = _512 + 1.0;
    int _516 = _508;
    if (!_474)
    {
        int _518 = ~_470;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _526 = _444 >= 0.0;
    bool _528 = isnan(_444);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _440);
    float _538 = _408 ? _514 : 0.0;
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _442);
    bool _542 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _544 = isnan(0.5);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _550 = _546 || _548;
    float _552 = _510 * _524;
    float _554 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _536 * _554;
    bool _564 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _566 = isnan(_286);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _540 * _356;
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = 1.0 / _560;
    float _590 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    bool _592 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_286);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _604;
    float _608 = -_574;
    float _610 = _608 + 1.0;
    float _612 = 0.0;
    float _614 = _538;
    if (_298)
    {
        _612 = _428;
    }
    float _616 = _612;
    float _618 = fma(_606, _424, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _620 = _534 ? 0 : 1;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _626;
    float _630 = _602 * _610;
    float _632 = _616;
    if (_394)
    {
        float _634 = -_616;
        float _636 = _634 + 1.0;
        _632 = _636;
    }
    float _638 = _632;
    float _640 = fma(_624, _424, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _642 = fma(_628, _424, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _618 * _630;
    if (_586)
    {
        float _646 = _538 * _588;
        _122 = _646;
    }
    float _648 = _122;
    float _650 = _640 * _630;
    float _652 = _642 * _630;
    float _654 = in.m_49.x;
    float _656 = in.m_49.y;
    float _658 = in.m_49.z;
    int _660 = abs(_450);
    float _662 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_298)
    {
        _614 = _428;
    }
    float _664 = _614;
    float _666 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = float(_660);
    float _670 = float(_522);
    float _672 = float(_496);
    int _674 = abs(_344);
    float _676 = _668 * _670;
    int _678 = ~_620;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _686 = !_326;
    int _688 = _686 ? 0 : 1;
    int _690 = _682;
    float _692 = _664;
    if (!_500)
    {
        int _694 = ~_620;
        int _696 = _694 + 1;
        _690 = _696;
    }
    int _698 = _690;
    float _700 = _676 * (-2.0);
    int _702 = abs(_688);
    float _704 = float(_674);
    float _706 = float(_702);
    float _708 = fma(_700, _656, _656);
    float _710 = float(_698);
    float _712 = fma(_410, _700, _410);
    float _714 = _704 * _672;
    float _716 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    if (_298)
    {
        _692 = _638;
    }
    float _718 = _692;
    float _720 = _706 * _710;
    float _722 = in.m_51.x;
    float _724 = in.m_51.y;
    float _726 = in.m_51.z;
    float _728 = fma(_712, _648, _716);
    float _730 = _714 * (-2.0);
    float _732 = _720 * (-2.0);
    bool _734 = _440 != 0.0;
    bool _736 = isnan(_440);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = -_602;
    float _746 = _744 + 1.0;
    float _748 = fma(_730, _654, _654);
    float _750 = fma(_732, _658, _658);
    float _752 = fma(_468, _730, _468);
    bool _754 = _438 == 0.0;
    bool _756 = !_742;
    bool _758 = _754 && _756;
    float _760 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[196].x, _748);
    float _762 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    bool _766 = _442 == 0.0;
    bool _768 = _766 && _758;
    float _770 = fma(_752, _648, _760);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _644);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = in.m_53.w;
    float _782 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _650);
    float _784 = fma(_502, _732, _502);
    float _786 = _770 * 0.15915493667125701904296875;
    float _788 = _728 * 0.15915493667125701904296875;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _792 = fma(_784, _648, _762);
    float _794 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].x, _764);
    float _796 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].y, _772);
    float _798 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = _732;
    float _804 = _770;
    float _806 = _762;
    float _808 = _722;
    if (_768)
    {
        _802 = _722;
    }
    float _810 = _802;
    float _812 = _810;
    if (_768)
    {
        _804 = _724;
    }
    float _814 = _804;
    float _816 = _786 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _814;
    if (_768)
    {
        _490 = _810;
    }
    float _822 = _490;
    float _824 = _822;
    if (!_768)
    {
        _812 = _722;
    }
    float _826 = _812;
    if (_768)
    {
        _806 = _814;
    }
    float _828 = _806;
    float _830 = _828;
    if (!_768)
    {
        _820 = _724;
    }
    float _832 = _820;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    if (_768)
    {
        _808 = _726;
    }
    float _838 = _808;
    float _840 = _776 * _726;
    float _842 = _838;
    if (!_768)
    {
        float _844 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[17].y, _726);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _778 * _826;
    if (!_768)
    {
        float _850 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _826);
        _824 = _850;
    }
    float _852 = _824;
    float _854 = _774 * _832;
    float _856 = _718 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _858 = _788 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = -_840;
    float _864 = fma(_778, _832, _862);
    float _866 = -_848;
    float _868 = fma(_774, _726, _866);
    if (!_768)
    {
        float _870 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _830 = _870;
    }
    float _872 = _830;
    float _874 = -_854;
    float _876 = fma(_776, _826, _874);
    float _878 = _472 * _790;
    float _880 = _856 * _684;
    float _882 = _864 * _780;
    float _884 = _800 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _868 * _780;
    float _890 = _876 * _780;
    float _892 = _818 * _836;
    float _894 = _798 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_55.x = _880;
    out.m_55.y = _878;
    float _896 = _786 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _818 * _860;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = _800 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _818 * _886;
    float _912 = _860 * _886;
    float _914 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _910 * _776;
    float _920 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _898 * _836;
    float _924 = _898 * _886;
    float _926 = _898 * _860;
    float _928 = _836 * _886;
    float _930 = _910 * _562;
    float _932 = _924 * _562;
    out.m_57.x = _916;
    out.m_57.y = _920;
    out.m_57.z = _902;
    float _934 = -_562;
    float _936 = _908 * _934;
    float _938 = fma(_908, _900, _922);
    float _940 = fma(_908, _922, _900);
    float _942 = -_892;
    float _944 = fma(_908, _926, _942);
    float _946 = fma(_912, _552, _936);
    float _948 = -_926;
    float _950 = fma(_908, _892, _948);
    float _952 = fma(_938, _552, _930);
    float _954 = fma(_944, _552, _932);
    float _956 = fma(_928, _576, _946);
    float _958 = -_872;
    float _960 = _908 * _958;
    float _962 = fma(_950, _576, _952);
    float _964 = fma(_940, _576, _954);
    float _966 = -_776;
    float _968 = _908 * _966;
    float _970 = fma(_912, _852, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = -_888;
    float _978 = _908 * _976;
    float _980 = fma(_912, _774, _968);
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].x, _972);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _986 = _910 * _872;
    float _988 = _924 * _872;
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].z, _982);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _994 = _910 * _888;
    float _996 = fma(_912, _882, _978);
    float _998 = _662 + _990;
    float _1000 = _924 * _776;
    float _1002 = _666 + _992;
    float _1004 = _924 * _888;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_938, _774, _918);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_938, _852, _986);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_944, _852, _988);
    float _1022 = fma(_944, _774, _1000);
    float _1024 = fma(_938, _882, _994);
    float _1026 = fma(_1014, _1014, _1018);
    float _1028 = fma(_944, _882, _1004);
    float _1030 = fma(_950, _778, _1010);
    float _1032 = _962 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = sqrt(_1026);
    float _1036 = fma(_928, _846, _970);
    float _1038 = fma(_928, _778, _980);
    float _1040 = fma(_950, _846, _1016);
    float _1042 = fma(_928, _890, _996);
    float _1044 = fma(_940, _846, _1020);
    float _1046 = fma(_950, _890, _1024);
    float _1048 = fma(_940, _778, _1022);
    float _1050 = fma(_940, _890, _1028);
    float _1052 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1054 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1056 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1058 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1052);
    float _1062 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1054);
    float _1064 = _590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1066 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1056);
    float _1070 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1058);
    float _1072 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1074 = _1064 + _1062;
    float _1076 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1072);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1076);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1086 = _1056;
    float _1088 = _1002;
    float _1090 = _998;
    float _1092 = _1008;
    float _1094 = _1014;
    if (!_1066)
    {
        _1086 = _1002;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (!_1066)
    {
        _1088 = _998;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (!_1066)
    {
        _1090 = _1074;
    }
    float _1104 = _1090;
    bool _1106 = !_1066;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1034 + _1112;
        float _1116 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = rsqrt(_1026);
        float _1120 = _1114 * _1110;
        float _1122 = _1120 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = cos(_1128);
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = _1118 * _1132;
        float _1136 = _1130 + (-1.0);
        float _1138 = fma(_1014, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1008, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = fma(_1074, _1130, _1142);
        _1098 = _1138;
        _1102 = _1140;
        _1108 = _1144;
    }
    float _1146 = _1098;
    float _1148 = _1102;
    float _1150 = _1108;
    float _1152 = _1150;
    if (_550)
    {
        _1092 = _1146;
    }
    float _1154 = _1092;
    float _1156 = _1154;
    if (_550)
    {
        _1094 = _1148;
    }
    float _1158 = _1094;
    float _1160 = _1158;
    if (!_550)
    {
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1164 = _1064 + _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1168 = _666 + _1166;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1172 = -_1064;
        float _1174 = _1172 + _1150;
        float _1176 = _1164 * _1164;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1180 = _662 + _1178;
        float _1182 = -_662;
        float _1184 = _1182 + _1148;
        float _1186 = fma(_1168, _1168, _1176);
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1190 = fma(_1180, _1180, _1186);
        float _1192 = sqrt(_1190);
        float _1194 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1196 = precise::min(_1192, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1198 = _1196 * _1188;
        float _1200 = -_666;
        float _1202 = _1200 + _1146;
        float _1204 = _1194 * _1198;
        float _1206 = fma(_1202, _1204, _666);
        float _1208 = fma(_1174, _1204, _1064);
        float _1210 = fma(_1184, _1204, _662);
        _1152 = _1208;
        _1156 = _1206;
        _1160 = _1210;
    }
    float _1212 = _1152;
    float _1214 = _1156;
    float _1216 = _1160;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1222);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1238);
    float _1270 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1274 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1284 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1080);
    float _1286 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1288 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1084);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1292 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1068);
    float _1294 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1268);
    float _1296 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1060);
    float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1070);
    float _1300 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1270);
    float _1302 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1230);
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1278);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    out.m_59.x = _1292;
    out.m_59.y = _1296;
    out.m_59.z = _1298;
    out.m_61.x = _1284;
    out.m_61.y = _1286;
    out.m_61.z = _1288;
    out.m_63.x = _1294;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1308;
    out.gl_Position.w = _1310;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _278 = false;
    bool _164 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_100);
        out.gl_Position.z = _1367;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_35.w;
    float _106 = in.m_37.w;
    bool _108 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_104;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_39.w = _106;
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_84);
        _94 = _124;
    }
    float _126 = _94;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_33.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _102 = as_type<int>(_138);
    }
    int _140 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1441 = as_type<float>(_140);
        out.gl_Position.z = _1441;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _144 = !_142;
    float _162;
    if (!_144)
    {
        float _146 = in.m_37.x;
        float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _150 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _152 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _154 = _152 * _148;
        float _156 = floor(_154);
        float _158 = -_156;
        float _160 = _154 + _158;
        _162 = _160;
        _164 = true;
    }
    else
    {
        float _166 = float(_84);
        float _168 = 1.0 / _166;
        float _170 = _120 * _168;
        _162 = _170;
    }
    _164 = false;
    float _172 = _162;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _176 = _172 + _174;
    bool _178 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _180 = isnan(_172);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _186 = _182 || _184;
    float _188 = float(_186);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _190;
    bool _194 = _172 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _196 = isnan(_172);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -_188;
    float _208 = _206 + 1.0;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _210;
    float _214 = 1.0 / _192;
    bool _216 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _218 = _204 * _208;
    float _220 = -_204;
    float _222 = _220 + 1.0;
    float _224 = _176 * _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _226;
    float _230 = fma(_212, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _232;
    float _236 = fma(_228, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _238 = fma(_234, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _240 = _230 * _218;
    float _242 = _236 * _218;
    float _244 = _238 * _218;
    float _246 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].x, _240);
    float _248 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].y, _244);
    float _250 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[143].z, _242);
    float _252 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].x, _246);
    float _254 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].y, _248);
    float _256 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[144].z, _250);
    bool _258 = !_216;
    float _276;
    if (!_258)
    {
        float _260 = in.m_37.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_84);
        float _282 = 1.0 / _280;
        float _284 = _120 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = in.m_41.x;
    float _290 = in.m_41.y;
    float _292 = in.m_41.z;
    float _294 = in.m_37.z;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _298 = _296 != 0;
    float _300 = in.m_30.x;
    float _302 = in.m_30.y;
    float _304 = in.m_30.z;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _308 = _306 != 0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _310;
    float _314 = in.m_43.y;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _326 = _324 != 0;
    float _328 = 1.0 / _312;
    float _330 = in.m_37.x;
    float _332 = in.m_37.y;
    float _334 = 0.0;
    if (_298)
    {
        float _336 = in.m_37.y;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _342 = !_318;
    int _344 = _342 ? 0 : 1;
    float _346 = _254 * _290;
    float _348 = _256 * _292;
    float _350 = _252 * _288;
    float _352 = _294 * 2.0;
    bool _354 = _294 > 0.5;
    float _356 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _340;
    float _358 = floor(_352);
    float _360 = _302 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _302 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = _302 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _366 = -_314;
    float _368 = _366 + 1.0;
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].x, _364);
    float _376 = _294 + _332;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _314;
    if (_308)
    {
        float _384 = _354 ? _368 : _314;
        _382 = _384;
    }
    float _386 = _382;
    float _388 = _330 * 2.0;
    float _390 = _376 + (-1.0);
    bool _392 = _338 > 0.5;
    bool _394 = _392 && _298;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _398 = _286 + _396;
    bool _400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _408 = _404 || _406;
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = floor(_388);
    bool _414 = _358 >= 0.0;
    bool _416 = isnan(_358);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = _398 * _328;
    float _426 = _332 * 2.0;
    float _428 = in.m_43.x;
    int _430 = _422 ? 0 : 1;
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    bool _434 = _358 > 0.0;
    float _436 = _380 * _120;
    float _438 = in.m_47.x;
    float _440 = in.m_47.y;
    float _442 = in.m_47.z;
    float _444 = floor(_426);
    float _446 = _330 + _332;
    out.m_33.x = 1.0;
    bool _448 = !_322;
    int _450 = _448 ? 0 : 1;
    float _452 = _446 + (-1.0);
    bool _454 = _412 >= 0.0;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    float _464 = _332 + (-0.5);
    float _466 = exp2(_436);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _470 = _462 ? 0 : 1;
    float _472 = _386 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _474 = _412 > 0.0;
    float _476 = _294 + _330;
    float _478 = _330 + (-0.5);
    int _480 = ~_430;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _476 + (-1.0);
    int _488 = _484;
    float _490 = _478;
    if (!_434)
    {
        int _492 = ~_430;
        int _494 = _492 + 1;
        _488 = _494;
    }
    int _496 = _488;
    float _498 = _294 + (-0.5);
    bool _500 = _444 > 0.0;
    float _502 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _504 = ~_470;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    float _512 = -_466;
    float _514 = _512 + 1.0;
    int _516 = _508;
    if (!_474)
    {
        int _518 = ~_470;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _526 = _444 >= 0.0;
    bool _528 = isnan(_444);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _440);
    float _538 = _408 ? _514 : 0.0;
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _442);
    bool _542 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _544 = isnan(0.5);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _550 = _546 || _548;
    float _552 = _510 * _524;
    float _554 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _536 * _554;
    bool _564 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _566 = isnan(_286);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _540 * _356;
    bool _578 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    float _588 = 1.0 / _560;
    float _590 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    bool _592 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_286);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _604;
    float _608 = -_574;
    float _610 = _608 + 1.0;
    float _612 = 0.0;
    float _614 = _538;
    if (_298)
    {
        _612 = _428;
    }
    float _616 = _612;
    float _618 = fma(_606, _424, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _620 = _534 ? 0 : 1;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _626;
    float _630 = _602 * _610;
    float _632 = _616;
    if (_394)
    {
        float _634 = -_616;
        float _636 = _634 + 1.0;
        _632 = _636;
    }
    float _638 = _632;
    float _640 = fma(_624, _424, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _642 = fma(_628, _424, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _618 * _630;
    if (_586)
    {
        float _646 = _538 * _588;
        _122 = _646;
    }
    float _648 = _122;
    float _650 = _640 * _630;
    float _652 = _642 * _630;
    float _654 = in.m_49.x;
    float _656 = in.m_49.y;
    float _658 = in.m_49.z;
    int _660 = abs(_450);
    float _662 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_298)
    {
        _614 = _428;
    }
    float _664 = _614;
    float _666 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = float(_660);
    float _670 = float(_522);
    float _672 = float(_496);
    int _674 = abs(_344);
    float _676 = _668 * _670;
    int _678 = ~_620;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _686 = !_326;
    int _688 = _686 ? 0 : 1;
    int _690 = _682;
    float _692 = _664;
    if (!_500)
    {
        int _694 = ~_620;
        int _696 = _694 + 1;
        _690 = _696;
    }
    int _698 = _690;
    float _700 = _676 * (-2.0);
    int _702 = abs(_688);
    float _704 = float(_674);
    float _706 = float(_702);
    float _708 = fma(_700, _656, _656);
    float _710 = float(_698);
    float _712 = fma(_410, _700, _410);
    float _714 = _704 * _672;
    float _716 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    if (_298)
    {
        _692 = _638;
    }
    float _718 = _692;
    float _720 = _706 * _710;
    float _722 = in.m_51.x;
    float _724 = in.m_51.y;
    float _726 = in.m_51.z;
    float _728 = fma(_712, _648, _716);
    float _730 = _714 * (-2.0);
    float _732 = _720 * (-2.0);
    bool _734 = _440 != 0.0;
    bool _736 = isnan(_440);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = -_602;
    float _746 = _744 + 1.0;
    float _748 = fma(_730, _654, _654);
    float _750 = fma(_732, _658, _658);
    float _752 = fma(_468, _730, _468);
    bool _754 = _438 == 0.0;
    bool _756 = !_742;
    bool _758 = _754 && _756;
    float _760 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[196].x, _748);
    float _762 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].z, _750);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    bool _766 = _442 == 0.0;
    bool _768 = _766 && _758;
    float _770 = fma(_752, _648, _760);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _644);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = in.m_53.w;
    float _782 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _650);
    float _784 = fma(_502, _732, _502);
    float _786 = _770 * 0.15915493667125701904296875;
    float _788 = _728 * 0.15915493667125701904296875;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _792 = fma(_784, _648, _762);
    float _794 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].x, _764);
    float _796 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].y, _772);
    float _798 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = _732;
    float _804 = _770;
    float _806 = _762;
    float _808 = _722;
    if (_768)
    {
        _802 = _722;
    }
    float _810 = _802;
    float _812 = _810;
    if (_768)
    {
        _804 = _724;
    }
    float _814 = _804;
    float _816 = _786 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _814;
    if (_768)
    {
        _490 = _810;
    }
    float _822 = _490;
    float _824 = _822;
    if (!_768)
    {
        _812 = _722;
    }
    float _826 = _812;
    if (_768)
    {
        _806 = _814;
    }
    float _828 = _806;
    float _830 = _828;
    if (!_768)
    {
        _820 = _724;
    }
    float _832 = _820;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    if (_768)
    {
        _808 = _726;
    }
    float _838 = _808;
    float _840 = _776 * _726;
    float _842 = _838;
    if (!_768)
    {
        float _844 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[17].y, _726);
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _778 * _826;
    if (!_768)
    {
        float _850 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _826);
        _824 = _850;
    }
    float _852 = _824;
    float _854 = _774 * _832;
    float _856 = _718 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _858 = _788 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = -_840;
    float _864 = fma(_778, _832, _862);
    float _866 = -_848;
    float _868 = fma(_774, _726, _866);
    if (!_768)
    {
        float _870 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _830 = _870;
    }
    float _872 = _830;
    float _874 = -_854;
    float _876 = fma(_776, _826, _874);
    float _878 = _472 * _790;
    float _880 = _856 * _684;
    float _882 = _864 * _780;
    float _884 = _800 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _868 * _780;
    float _890 = _876 * _780;
    float _892 = _818 * _836;
    float _894 = _798 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_55.x = _880;
    out.m_55.y = _878;
    float _896 = _786 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _818 * _860;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = _800 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _818 * _886;
    float _912 = _860 * _886;
    float _914 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _910 * _776;
    float _920 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _898 * _836;
    float _924 = _898 * _886;
    float _926 = _898 * _860;
    float _928 = _836 * _886;
    float _930 = _910 * _562;
    float _932 = _924 * _562;
    out.m_57.x = _916;
    out.m_57.y = _920;
    out.m_57.z = _902;
    float _934 = -_562;
    float _936 = _908 * _934;
    float _938 = fma(_908, _900, _922);
    float _940 = fma(_908, _922, _900);
    float _942 = -_892;
    float _944 = fma(_908, _926, _942);
    float _946 = fma(_912, _552, _936);
    float _948 = -_926;
    float _950 = fma(_908, _892, _948);
    float _952 = fma(_938, _552, _930);
    float _954 = fma(_944, _552, _932);
    float _956 = fma(_928, _576, _946);
    float _958 = -_872;
    float _960 = _908 * _958;
    float _962 = fma(_950, _576, _952);
    float _964 = fma(_940, _576, _954);
    float _966 = -_776;
    float _968 = _908 * _966;
    float _970 = fma(_912, _852, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = -_888;
    float _978 = _908 * _976;
    float _980 = fma(_912, _774, _968);
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].x, _972);
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _986 = _910 * _872;
    float _988 = _924 * _872;
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].z, _982);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _994 = _910 * _888;
    float _996 = fma(_912, _882, _978);
    float _998 = _662 + _990;
    float _1000 = _924 * _776;
    float _1002 = _666 + _992;
    float _1004 = _924 * _888;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1008 = _998 + _1006;
    float _1010 = fma(_938, _774, _918);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1002 + _1012;
    float _1016 = fma(_938, _852, _986);
    float _1018 = _1008 * _1008;
    float _1020 = fma(_944, _852, _988);
    float _1022 = fma(_944, _774, _1000);
    float _1024 = fma(_938, _882, _994);
    float _1026 = fma(_1014, _1014, _1018);
    float _1028 = fma(_944, _882, _1004);
    float _1030 = fma(_950, _778, _1010);
    float _1032 = _962 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = sqrt(_1026);
    float _1036 = fma(_928, _846, _970);
    float _1038 = fma(_928, _778, _980);
    float _1040 = fma(_950, _846, _1016);
    float _1042 = fma(_928, _890, _996);
    float _1044 = fma(_940, _846, _1020);
    float _1046 = fma(_950, _890, _1024);
    float _1048 = fma(_940, _778, _1022);
    float _1050 = fma(_940, _890, _1028);
    float _1052 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1054 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1056 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1058 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1052);
    float _1062 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1054);
    float _1064 = _590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1066 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1068 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1056);
    float _1070 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1058);
    float _1072 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1074 = _1064 + _1062;
    float _1076 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1072);
    float _1082 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1076);
    float _1084 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1086 = _1056;
    float _1088 = _1002;
    float _1090 = _998;
    float _1092 = _1008;
    float _1094 = _1014;
    if (!_1066)
    {
        _1086 = _1002;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (!_1066)
    {
        _1088 = _998;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (!_1066)
    {
        _1090 = _1074;
    }
    float _1104 = _1090;
    bool _1106 = !_1066;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1034 + _1112;
        float _1116 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = rsqrt(_1026);
        float _1120 = _1114 * _1110;
        float _1122 = _1120 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = cos(_1128);
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = _1118 * _1132;
        float _1136 = _1130 + (-1.0);
        float _1138 = fma(_1014, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1008, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = fma(_1074, _1130, _1142);
        _1098 = _1138;
        _1102 = _1140;
        _1108 = _1144;
    }
    float _1146 = _1098;
    float _1148 = _1102;
    float _1150 = _1108;
    float _1152 = _1150;
    if (_550)
    {
        _1092 = _1146;
    }
    float _1154 = _1092;
    float _1156 = _1154;
    if (_550)
    {
        _1094 = _1148;
    }
    float _1158 = _1094;
    float _1160 = _1158;
    if (!_550)
    {
        float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1164 = _1064 + _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1168 = _666 + _1166;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1172 = -_1064;
        float _1174 = _1172 + _1150;
        float _1176 = _1164 * _1164;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1180 = _662 + _1178;
        float _1182 = -_662;
        float _1184 = _1182 + _1148;
        float _1186 = fma(_1168, _1168, _1176);
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1190 = fma(_1180, _1180, _1186);
        float _1192 = sqrt(_1190);
        float _1194 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1196 = precise::min(_1192, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1198 = _1196 * _1188;
        float _1200 = -_666;
        float _1202 = _1200 + _1146;
        float _1204 = _1194 * _1198;
        float _1206 = fma(_1202, _1204, _666);
        float _1208 = fma(_1174, _1204, _1064);
        float _1210 = fma(_1184, _1204, _662);
        _1152 = _1208;
        _1156 = _1206;
        _1160 = _1210;
    }
    float _1212 = _1152;
    float _1214 = _1156;
    float _1216 = _1160;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1222);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1238);
    float _1270 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1274 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1284 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1080);
    float _1286 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1288 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1084);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1292 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1068);
    float _1294 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1268);
    float _1296 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1060);
    float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1070);
    float _1300 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1270);
    float _1302 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1230);
    float _1304 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1306 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1308 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1278);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1280);
    out.m_59.x = _1292;
    out.m_59.y = _1296;
    out.m_59.z = _1298;
    out.m_61.x = _1284;
    out.m_61.y = _1286;
    out.m_61.z = _1288;
    out.m_63.x = _1294;
    out.m_63.y = _1300;
    out.m_63.z = _1302;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1308;
    out.gl_Position.w = _1310;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

