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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_57 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _478 = false;
    bool _366 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_94);
        out.gl_Position.z = _1539;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_132);
        out.gl_Position.z = _1609;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _142 = _140 != 0;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _146 = _144 != 0;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _138 * _136;
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    bool _162 = !_142;
    int _164 = _162 ? 0 : 1;
    int _166 = abs(_164);
    float _168 = _160 * 6.283185482025146484375;
    float _170 = cos(_168);
    bool _172 = !_150;
    int _174 = _172 ? 0 : 1;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _178 = abs(_174);
    float _180 = -_158;
    float _182 = _154 + _180;
    bool _184 = !_146;
    int _186 = _184 ? 0 : 1;
    float _188 = float(_166);
    int _190 = abs(_186);
    float _192 = -_182;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _196 = fma(_170, 0.5, 0.5);
    bool _198 = _182 < 0.5;
    float _200 = float(_198);
    float _202 = abs(_194);
    float _204 = _188 * _202;
    float _206 = -_196;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_178);
    float _212 = -_200;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = float(_190);
    float _218 = fma(_210, _208, _204);
    float _220 = abs(_214);
    float _222 = fma(_216, _220, _218);
    bool _224 = !_176;
    float _240;
    if (!_224)
    {
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_78);
        float _246 = 1.0 / _244;
        float _248 = _112 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _250 + _252;
    bool _256 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_250);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = 1.0 / _270;
    bool _274 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_250);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_266;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _284 * _288;
    float _306 = -_284;
    float _308 = _306 + 1.0;
    float _310 = _254 * _272;
    float _312 = in.m_41.x;
    float _314 = in.m_41.y;
    float _316 = in.m_41.z;
    float _318 = fma(_292, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _320 = fma(_302, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _318 * _304;
    float _326 = _320 * _304;
    float _328 = _322 * _304;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _334 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].x, _330);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].y, _332);
    float _340 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].z, _334);
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    float _346 = _340 * _316;
    bool _348 = !_298;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = _374 + _376;
    bool _380 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _382 = isnan(_374);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    bool _396 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _398 = isnan(_374);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_390;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _412;
    float _416 = 1.0 / _394;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = _406 * _410;
    float _422 = -_406;
    float _424 = _422 + 1.0;
    float _426 = _378 * _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = fma(_414, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _434;
    float _438 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _440 = _432 * _420;
    float _442 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _440);
    float _446 = _442 * _420;
    float _448 = _438 * _420;
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].x, _444);
    float _452 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _446);
    float _454 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _448);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].y, _452);
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].z, _454);
    bool _460 = !_418;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_78);
        float _482 = 1.0 / _480;
        float _484 = _112 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_39.y;
    float _490 = _134 * 2.0;
    float _492 = _222 * _342;
    float _494 = _222 * _344;
    float _496 = in.m_39.z;
    float _498 = _222 * _346;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _510 = _508 != 0;
    float _512 = floor(_490);
    float _514 = in.m_32.x;
    float _516 = in.m_32.y;
    float _518 = in.m_32.z;
    float _520 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _522 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    bool _530 = _512 > 0.0;
    float _532 = _488 * 2.0;
    bool _534 = _512 >= 0.0;
    bool _536 = isnan(_512);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _496 * 2.0;
    float _546 = _488 + _496;
    float _548 = floor(_532);
    float _550 = _528 * _112;
    float _552 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _554 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _546 + (-1.0);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _564 = floor(_544);
    float _566 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    int _568 = _542 ? 0 : 1;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _572 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _574 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _578 = ~_568;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = exp2(_550);
    bool _586 = _548 > 0.0;
    float _588 = _572 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _590 = _548 >= 0.0;
    bool _592 = isnan(_548);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    int _600 = _582;
    if (!_530)
    {
        int _602 = ~_568;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _598 ? 0 : 1;
    bool _610 = _564 > 0.0;
    bool _612 = _564 >= 0.0;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = !_506;
    int _624 = _622 ? 0 : 1;
    int _626 = _620 ? 0 : 1;
    float _628 = -_584;
    float _630 = _628 + 1.0;
    int _632 = ~_608;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_586)
    {
        int _640 = ~_608;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    bool _646 = !_502;
    int _648 = _646 ? 0 : 1;
    int _650 = ~_626;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    int _656 = abs(_624);
    int _658 = _654;
    if (!_610)
    {
        int _660 = ~_626;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _668 = 1.0 + _666;
    bool _670 = !_510;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_648);
    float _676 = 1.0 / _668;
    int _678 = abs(_672);
    float _680 = float(_656);
    float _682 = in.m_43.x;
    float _684 = in.m_43.y;
    float _686 = in.m_43.z;
    float _688 = float(_606);
    bool _690 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(1.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = _680 * _688;
    float _702 = float(_674);
    float _704 = float(_664);
    bool _706 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    float _716 = float(_678);
    float _718 = _702 * _704;
    float _720 = float(_644);
    float _722 = _574 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _714 ? _630 : 0.0;
    float _726 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _700 * (-2.0);
    float _730 = _716 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    if (_698)
    {
        float _736 = _724 * _676;
        _114 = _736;
    }
    float _738 = _114;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _588 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _726 + _744;
    float _748 = _734 * _734;
    float _750 = fma(_570, _728, _570);
    float _752 = fma(_728, _684, _684);
    float _754 = fma(_742, _742, _748);
    float _756 = _488 + (-0.5);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _762 = _718 * (-2.0);
    float _764 = fma(_746, _746, _754);
    float _766 = _730 * (-2.0);
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _752);
    float _770 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = sqrt(_764);
    float _774 = fma(_766, _686, _686);
    float _776 = fma(_750, _738, _768);
    float _778 = _770 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _780 = _134 + _488;
    float _782 = fma(_762, _682, _682);
    float _784 = _134 + (-0.5);
    float _786 = _134 + _496;
    float _788 = rsqrt(_764);
    float _790 = _780 + (-1.0);
    float _792 = _786 + (-1.0);
    float _794 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = in.m_45.x;
    float _798 = in.m_45.y;
    float _800 = in.m_45.z;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = 1.0 / _760;
    float _808 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _810 = _776 * 0.15915493667125701904296875;
    float _812 = fma(_794, _762, _794);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = precise::min(_778, _808);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _822;
    float _826 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _828 = 1.0 / _804;
    float _830 = _788 * _818;
    float _832 = fma(_812, _738, _820);
    float _834 = fma(_826, _766, _826);
    float _836 = _496 + (-0.5);
    float _838 = _824 * _806;
    float _840 = _734 * _830;
    float _842 = _742 * _830;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = _746 * _830;
    float _848 = -_840;
    float _850 = _734 + _848;
    float _852 = -_842;
    float _854 = _742 + _852;
    float _856 = 1.0 / _816;
    float _858 = -_846;
    float _860 = _746 + _858;
    float _862 = _850 * _850;
    float _864 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _868 = _486 + _866;
    bool _870 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_486);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = fma(_854, _854, _862);
    float _884 = fma(_834, _738, _864);
    float _886 = _810 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = fma(_838, _868, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _892 = fma(_860, _860, _882);
    bool _894 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_486);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_880;
    float _908 = _906 + 1.0;
    bool _910 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_486);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _884 * 0.15915493667125701904296875;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = sqrt(_892);
    float _930 = _904 * _908;
    float _932 = -_920;
    float _934 = _932 + 1.0;
    bool _936 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_486);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _926 * _828;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _952 = _486 + _950;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _798);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _796);
    float _958 = _810 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_948, _952, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _800);
    out.m_47.w = _818;
    bool _966 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _968 = isnan(0.5);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _974 = _970 || _972;
    float _976 = _844 * 6.283185482025146484375;
    float _978 = sin(_976);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = _844 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _982 * _856;
    float _990 = _788 * _928;
    float _992 = _520 * _990;
    float _994 = _922 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = -_904;
    float _1000 = _998 + 1.0;
    float _1002 = _880 * _934;
    float _1004 = _992 * _954;
    float _1006 = _770 * _990;
    float _1008 = _946 * _1000;
    float _1010 = -_946;
    float _1012 = _1010 + 1.0;
    float _1014 = _978 * _888;
    float _1016 = _922 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _890 * _1008;
    float _1022 = _986 * _888;
    float _1024 = _522 * _990;
    float _1026 = _1006 * _956;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1020);
    float _1030 = _986 * _960;
    float _1032 = _1024 * _964;
    float _1034 = _996 * _1004;
    float _1036 = _888 * _996;
    float _1038 = _960 * _996;
    float _1040 = _978 * _960;
    float _1042 = _986 * _1034;
    float _1044 = fma(_962, _930, _1028);
    float _1046 = -_846;
    float _1048 = _726 + _1046;
    float _1050 = fma(_1018, _1030, _1014);
    float _1052 = -_1004;
    float _1054 = _1018 * _1052;
    float _1056 = -_1040;
    float _1058 = fma(_1018, _1022, _1056);
    float _1060 = -_1022;
    float _1062 = fma(_1018, _1040, _1060);
    float _1064 = fma(_1050, _1026, _1042);
    float _1066 = _978 * _1034;
    float _1068 = fma(_1038, _1026, _1054);
    float _1070 = fma(_1018, _1014, _1030);
    float _1072 = fma(_1058, _1032, _1064);
    float _1074 = fma(_1062, _1026, _1066);
    float _1076 = fma(_1036, _1032, _1068);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1080 = _486 + _1078;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1084 = fma(_1070, _1032, _1074);
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = fma(_988, _1080, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1082);
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1096 = fma(_1088, _1002, _1044);
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1100 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1094);
    float _1104 = -_840;
    float _1106 = _722 + _1104;
    float _1108 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1096);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1114 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _726 + _1108;
    float _1118 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1120 = _588 + _1112;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1128 = _1120 + _1126;
    float _1130 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1132 = _1124 * _1124;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = fma(_1128, _1128, _1132);
    float _1140 = -_842;
    float _1142 = _588 + _1140;
    float _1144 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _1146 = sqrt(_1138);
    float _1148 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1118);
    float _1150 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_51.x = _1142;
    out.m_51.y = _1106;
    out.m_51.z = _1048;
    float _1152 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1130);
    float _1154 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    float _1156 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    out.m_53.x = _1134;
    out.m_53.y = _1114;
    out.m_53.z = _1136;
    out.m_53.w = _1144;
    float _1158 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1160 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1168 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _722 + _1164;
    float _1172 = 1.0 / _1162;
    float _1174 = _1166 + _1162;
    float _1176 = _1134;
    float _1178 = _818;
    float _1180 = _1166;
    float _1182 = _1142;
    if (!_1168)
    {
        _1176 = _1120;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (!_1168)
    {
        _1178 = _1116;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1168)
    {
        _1180 = _1170;
    }
    float _1192 = _1180;
    bool _1194 = !_1168;
    float _1196 = _1192;
    if (!_1194)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1202 = _1146 + _1200;
        float _1204 = rsqrt(_1138);
        float _1206 = _1202 * _1198;
        float _1208 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = _1206 * 0.15915493667125701904296875;
        float _1212 = _1210 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1222 = _1204 * _1220;
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1128, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1124, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1230 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = fma(_1170, _1218, _1230);
        _1186 = _1226;
        _1196 = _1232;
        _1190 = _1228;
    }
    float _1234 = _1186;
    float _1236 = _1196;
    float _1238 = _1190;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1248 = _1244 || _1246;
    float _1250 = -_842;
    float _1252 = _1250 + _1234;
    float _1254 = -_840;
    float _1256 = _1254 + _1236;
    float _1258 = -_846;
    float _1260 = _1258 + _1238;
    float _1262 = _1174 * _1172;
    float _1264 = _1262 * 0.5;
    float _1266 = _1256;
    float _1268 = _1252;
    float _1270 = _1260;
    if (!_974)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1106 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1142 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = -_588;
        float _1284 = _1282 + _1234;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1048 + _1288;
        float _1292 = -_722;
        float _1294 = _1292 + _1236;
        float _1296 = -_726;
        float _1298 = _1296 + _1238;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1304 = fma(_1290, _1290, _1300);
        float _1306 = sqrt(_1304);
        float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1312 = _1310 * _1302;
        float _1314 = _1308 * _1312;
        float _1316 = fma(_1284, _1314, _1142);
        float _1318 = fma(_1294, _1314, _1106);
        float _1320 = fma(_1298, _1314, _1048);
        _1266 = _1318;
        _1268 = _1316;
        _1270 = _1320;
    }
    float _1322 = _1266;
    float _1324 = _1268;
    float _1326 = _1270;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1248)
    {
        _1182 = 1.0;
    }
    float _1330 = _1182;
    float _1332 = _1330;
    if (!_1248)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1338 = _1334 * 0.15915493667125701904296875;
        float _1340 = _1336 * 0.15915493667125701904296875;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1344 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1342);
        float _1346 = _1338 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        float _1350 = _1338 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        float _1354 = 1.0 / _1348;
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1352 * _1354;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1358 * _1360;
        float _1372 = 1.0 / _1344;
        float _1374 = 1.0 / _1370;
        float _1376 = 1.0 / _1368;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1380 = _1372 * _1378;
        float _1382 = _1364 * _1374;
        float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1386 = fma(_1382, _1380, _1384);
        float _1388 = _1386 * _1376;
        float _1390 = precise::clamp(_1388, 0.0, 1.0);
        _1332 = _1390;
    }
    float _1392 = _1332;
    float _1394 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1396 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1398 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1394);
    float _1404 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1396);
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1408 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1410 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1406);
    float _1416 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1422);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1430);
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1446 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1440);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1444);
    bool _1454 = _1392 > 0.0;
    bool _1456 = isnan(_1392);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(0.0);
    bool _1462 = _1458 || _1460;
    float _1464 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1468 = _1448 + _1452;
    float _1470 = _1450 + _1452;
    float _1472 = _1452 * 0.5;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1468 * 0.5;
    float _1478 = _1470 * 0.5;
    float _1480 = fma(_1466, -0.5, _1472);
    out.m_55.x = _1006;
    out.m_57.x = _1324;
    out.m_57.y = _1322;
    out.m_57.z = _1326;
    out.m_35.x = _1474;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1450;
    out.gl_Position.w = _1452;
    out.m_59.x = _1476;
    out.m_59.y = _1480;
    out.m_59.z = _1478;
    out.m_59.w = _1452;
    if (_1462)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1482;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _478 = false;
    bool _366 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_94);
        out.gl_Position.z = _1539;
    }
    if (!_82)
    {
        return out;
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_132);
        out.gl_Position.z = _1609;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _142 = _140 != 0;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _146 = _144 != 0;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _138 * _136;
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    bool _162 = !_142;
    int _164 = _162 ? 0 : 1;
    int _166 = abs(_164);
    float _168 = _160 * 6.283185482025146484375;
    float _170 = cos(_168);
    bool _172 = !_150;
    int _174 = _172 ? 0 : 1;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _178 = abs(_174);
    float _180 = -_158;
    float _182 = _154 + _180;
    bool _184 = !_146;
    int _186 = _184 ? 0 : 1;
    float _188 = float(_166);
    int _190 = abs(_186);
    float _192 = -_182;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _196 = fma(_170, 0.5, 0.5);
    bool _198 = _182 < 0.5;
    float _200 = float(_198);
    float _202 = abs(_194);
    float _204 = _188 * _202;
    float _206 = -_196;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_178);
    float _212 = -_200;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = float(_190);
    float _218 = fma(_210, _208, _204);
    float _220 = abs(_214);
    float _222 = fma(_216, _220, _218);
    bool _224 = !_176;
    float _240;
    if (!_224)
    {
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_78);
        float _246 = 1.0 / _244;
        float _248 = _112 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _250 + _252;
    bool _256 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_250);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = 1.0 / _270;
    bool _274 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_250);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_266;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _284 * _288;
    float _306 = -_284;
    float _308 = _306 + 1.0;
    float _310 = _254 * _272;
    float _312 = in.m_41.x;
    float _314 = in.m_41.y;
    float _316 = in.m_41.z;
    float _318 = fma(_292, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _320 = fma(_302, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _318 * _304;
    float _326 = _320 * _304;
    float _328 = _322 * _304;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _334 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].x, _330);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].y, _332);
    float _340 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].z, _334);
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    float _346 = _340 * _316;
    bool _348 = !_298;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = _374 + _376;
    bool _380 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _382 = isnan(_374);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    bool _396 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _398 = isnan(_374);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_390;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _412;
    float _416 = 1.0 / _394;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = _406 * _410;
    float _422 = -_406;
    float _424 = _422 + 1.0;
    float _426 = _378 * _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = fma(_414, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _434;
    float _438 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _440 = _432 * _420;
    float _442 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _440);
    float _446 = _442 * _420;
    float _448 = _438 * _420;
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].x, _444);
    float _452 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _446);
    float _454 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _448);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].y, _452);
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].z, _454);
    bool _460 = !_418;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_78);
        float _482 = 1.0 / _480;
        float _484 = _112 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_39.y;
    float _490 = _134 * 2.0;
    float _492 = _222 * _342;
    float _494 = _222 * _344;
    float _496 = in.m_39.z;
    float _498 = _222 * _346;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _510 = _508 != 0;
    float _512 = floor(_490);
    float _514 = in.m_32.x;
    float _516 = in.m_32.y;
    float _518 = in.m_32.z;
    float _520 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _522 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    bool _530 = _512 > 0.0;
    float _532 = _488 * 2.0;
    bool _534 = _512 >= 0.0;
    bool _536 = isnan(_512);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _496 * 2.0;
    float _546 = _488 + _496;
    float _548 = floor(_532);
    float _550 = _528 * _112;
    float _552 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _554 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _546 + (-1.0);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _564 = floor(_544);
    float _566 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    int _568 = _542 ? 0 : 1;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _572 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _574 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _578 = ~_568;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = exp2(_550);
    bool _586 = _548 > 0.0;
    float _588 = _572 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _590 = _548 >= 0.0;
    bool _592 = isnan(_548);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    int _600 = _582;
    if (!_530)
    {
        int _602 = ~_568;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _598 ? 0 : 1;
    bool _610 = _564 > 0.0;
    bool _612 = _564 >= 0.0;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = !_506;
    int _624 = _622 ? 0 : 1;
    int _626 = _620 ? 0 : 1;
    float _628 = -_584;
    float _630 = _628 + 1.0;
    int _632 = ~_608;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_586)
    {
        int _640 = ~_608;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    bool _646 = !_502;
    int _648 = _646 ? 0 : 1;
    int _650 = ~_626;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    int _656 = abs(_624);
    int _658 = _654;
    if (!_610)
    {
        int _660 = ~_626;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _668 = 1.0 + _666;
    bool _670 = !_510;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_648);
    float _676 = 1.0 / _668;
    int _678 = abs(_672);
    float _680 = float(_656);
    float _682 = in.m_43.x;
    float _684 = in.m_43.y;
    float _686 = in.m_43.z;
    float _688 = float(_606);
    bool _690 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(1.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = _680 * _688;
    float _702 = float(_674);
    float _704 = float(_664);
    bool _706 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    float _716 = float(_678);
    float _718 = _702 * _704;
    float _720 = float(_644);
    float _722 = _574 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _714 ? _630 : 0.0;
    float _726 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _700 * (-2.0);
    float _730 = _716 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    if (_698)
    {
        float _736 = _724 * _676;
        _114 = _736;
    }
    float _738 = _114;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _588 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _726 + _744;
    float _748 = _734 * _734;
    float _750 = fma(_570, _728, _570);
    float _752 = fma(_728, _684, _684);
    float _754 = fma(_742, _742, _748);
    float _756 = _488 + (-0.5);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _762 = _718 * (-2.0);
    float _764 = fma(_746, _746, _754);
    float _766 = _730 * (-2.0);
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _752);
    float _770 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = sqrt(_764);
    float _774 = fma(_766, _686, _686);
    float _776 = fma(_750, _738, _768);
    float _778 = _770 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _780 = _134 + _488;
    float _782 = fma(_762, _682, _682);
    float _784 = _134 + (-0.5);
    float _786 = _134 + _496;
    float _788 = rsqrt(_764);
    float _790 = _780 + (-1.0);
    float _792 = _786 + (-1.0);
    float _794 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = in.m_45.x;
    float _798 = in.m_45.y;
    float _800 = in.m_45.z;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = 1.0 / _760;
    float _808 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _810 = _776 * 0.15915493667125701904296875;
    float _812 = fma(_794, _762, _794);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = precise::min(_778, _808);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _822;
    float _826 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _828 = 1.0 / _804;
    float _830 = _788 * _818;
    float _832 = fma(_812, _738, _820);
    float _834 = fma(_826, _766, _826);
    float _836 = _496 + (-0.5);
    float _838 = _824 * _806;
    float _840 = _734 * _830;
    float _842 = _742 * _830;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = _746 * _830;
    float _848 = -_840;
    float _850 = _734 + _848;
    float _852 = -_842;
    float _854 = _742 + _852;
    float _856 = 1.0 / _816;
    float _858 = -_846;
    float _860 = _746 + _858;
    float _862 = _850 * _850;
    float _864 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _868 = _486 + _866;
    bool _870 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_486);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = fma(_854, _854, _862);
    float _884 = fma(_834, _738, _864);
    float _886 = _810 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = fma(_838, _868, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _892 = fma(_860, _860, _882);
    bool _894 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_486);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_880;
    float _908 = _906 + 1.0;
    bool _910 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_486);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _884 * 0.15915493667125701904296875;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = sqrt(_892);
    float _930 = _904 * _908;
    float _932 = -_920;
    float _934 = _932 + 1.0;
    bool _936 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_486);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _926 * _828;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _952 = _486 + _950;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _798);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _796);
    float _958 = _810 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_948, _952, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _800);
    out.m_47.w = _818;
    bool _966 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _968 = isnan(0.5);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _974 = _970 || _972;
    float _976 = _844 * 6.283185482025146484375;
    float _978 = sin(_976);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = _844 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _982 * _856;
    float _990 = _788 * _928;
    float _992 = _520 * _990;
    float _994 = _922 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = -_904;
    float _1000 = _998 + 1.0;
    float _1002 = _880 * _934;
    float _1004 = _992 * _954;
    float _1006 = _770 * _990;
    float _1008 = _946 * _1000;
    float _1010 = -_946;
    float _1012 = _1010 + 1.0;
    float _1014 = _978 * _888;
    float _1016 = _922 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _890 * _1008;
    float _1022 = _986 * _888;
    float _1024 = _522 * _990;
    float _1026 = _1006 * _956;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1020);
    float _1030 = _986 * _960;
    float _1032 = _1024 * _964;
    float _1034 = _996 * _1004;
    float _1036 = _888 * _996;
    float _1038 = _960 * _996;
    float _1040 = _978 * _960;
    float _1042 = _986 * _1034;
    float _1044 = fma(_962, _930, _1028);
    float _1046 = -_846;
    float _1048 = _726 + _1046;
    float _1050 = fma(_1018, _1030, _1014);
    float _1052 = -_1004;
    float _1054 = _1018 * _1052;
    float _1056 = -_1040;
    float _1058 = fma(_1018, _1022, _1056);
    float _1060 = -_1022;
    float _1062 = fma(_1018, _1040, _1060);
    float _1064 = fma(_1050, _1026, _1042);
    float _1066 = _978 * _1034;
    float _1068 = fma(_1038, _1026, _1054);
    float _1070 = fma(_1018, _1014, _1030);
    float _1072 = fma(_1058, _1032, _1064);
    float _1074 = fma(_1062, _1026, _1066);
    float _1076 = fma(_1036, _1032, _1068);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1080 = _486 + _1078;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1084 = fma(_1070, _1032, _1074);
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = fma(_988, _1080, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1082);
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1096 = fma(_1088, _1002, _1044);
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1100 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1094);
    float _1104 = -_840;
    float _1106 = _722 + _1104;
    float _1108 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1096);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1114 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _726 + _1108;
    float _1118 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1120 = _588 + _1112;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1128 = _1120 + _1126;
    float _1130 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1132 = _1124 * _1124;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = fma(_1128, _1128, _1132);
    float _1140 = -_842;
    float _1142 = _588 + _1140;
    float _1144 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _1146 = sqrt(_1138);
    float _1148 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1118);
    float _1150 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_51.x = _1142;
    out.m_51.y = _1106;
    out.m_51.z = _1048;
    float _1152 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1130);
    float _1154 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    float _1156 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    out.m_53.x = _1134;
    out.m_53.y = _1114;
    out.m_53.z = _1136;
    out.m_53.w = _1144;
    float _1158 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1160 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1168 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _722 + _1164;
    float _1172 = 1.0 / _1162;
    float _1174 = _1166 + _1162;
    float _1176 = _1134;
    float _1178 = _818;
    float _1180 = _1166;
    float _1182 = _1142;
    if (!_1168)
    {
        _1176 = _1120;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (!_1168)
    {
        _1178 = _1116;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1168)
    {
        _1180 = _1170;
    }
    float _1192 = _1180;
    bool _1194 = !_1168;
    float _1196 = _1192;
    if (!_1194)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1202 = _1146 + _1200;
        float _1204 = rsqrt(_1138);
        float _1206 = _1202 * _1198;
        float _1208 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = _1206 * 0.15915493667125701904296875;
        float _1212 = _1210 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1222 = _1204 * _1220;
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1128, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1124, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1230 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = fma(_1170, _1218, _1230);
        _1186 = _1226;
        _1196 = _1232;
        _1190 = _1228;
    }
    float _1234 = _1186;
    float _1236 = _1196;
    float _1238 = _1190;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1248 = _1244 || _1246;
    float _1250 = -_842;
    float _1252 = _1250 + _1234;
    float _1254 = -_840;
    float _1256 = _1254 + _1236;
    float _1258 = -_846;
    float _1260 = _1258 + _1238;
    float _1262 = _1174 * _1172;
    float _1264 = _1262 * 0.5;
    float _1266 = _1256;
    float _1268 = _1252;
    float _1270 = _1260;
    if (!_974)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1106 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1142 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = -_588;
        float _1284 = _1282 + _1234;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1048 + _1288;
        float _1292 = -_722;
        float _1294 = _1292 + _1236;
        float _1296 = -_726;
        float _1298 = _1296 + _1238;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1304 = fma(_1290, _1290, _1300);
        float _1306 = sqrt(_1304);
        float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1312 = _1310 * _1302;
        float _1314 = _1308 * _1312;
        float _1316 = fma(_1284, _1314, _1142);
        float _1318 = fma(_1294, _1314, _1106);
        float _1320 = fma(_1298, _1314, _1048);
        _1266 = _1318;
        _1268 = _1316;
        _1270 = _1320;
    }
    float _1322 = _1266;
    float _1324 = _1268;
    float _1326 = _1270;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1248)
    {
        _1182 = 1.0;
    }
    float _1330 = _1182;
    float _1332 = _1330;
    if (!_1248)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1338 = _1334 * 0.15915493667125701904296875;
        float _1340 = _1336 * 0.15915493667125701904296875;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1344 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1342);
        float _1346 = _1338 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        float _1350 = _1338 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        float _1354 = 1.0 / _1348;
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1352 * _1354;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1358 * _1360;
        float _1372 = 1.0 / _1344;
        float _1374 = 1.0 / _1370;
        float _1376 = 1.0 / _1368;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1380 = _1372 * _1378;
        float _1382 = _1364 * _1374;
        float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1386 = fma(_1382, _1380, _1384);
        float _1388 = _1386 * _1376;
        float _1390 = precise::clamp(_1388, 0.0, 1.0);
        _1332 = _1390;
    }
    float _1392 = _1332;
    float _1394 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1396 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1398 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1394);
    float _1404 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1396);
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1408 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1410 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1406);
    float _1416 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1422);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1430);
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1446 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1440);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1444);
    bool _1454 = _1392 > 0.0;
    bool _1456 = isnan(_1392);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(0.0);
    bool _1462 = _1458 || _1460;
    float _1464 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1468 = _1448 + _1452;
    float _1470 = _1450 + _1452;
    float _1472 = _1452 * 0.5;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1468 * 0.5;
    float _1478 = _1470 * 0.5;
    float _1480 = fma(_1466, -0.5, _1472);
    out.m_55.x = _1006;
    out.m_57.x = _1324;
    out.m_57.y = _1322;
    out.m_57.z = _1326;
    out.m_35.x = _1474;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1450;
    out.gl_Position.w = _1452;
    out.m_59.x = _1476;
    out.m_59.y = _1480;
    out.m_59.z = _1478;
    out.m_59.w = _1452;
    if (_1462)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1482;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _478 = false;
    bool _366 = false;
    bool _242 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1539 = as_type<float>(_94);
        out.gl_Position.z = _1539;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_132);
        out.gl_Position.z = _1609;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _142 = _140 != 0;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _146 = _144 != 0;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _138 * _136;
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    bool _162 = !_142;
    int _164 = _162 ? 0 : 1;
    int _166 = abs(_164);
    float _168 = _160 * 6.283185482025146484375;
    float _170 = cos(_168);
    bool _172 = !_150;
    int _174 = _172 ? 0 : 1;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _178 = abs(_174);
    float _180 = -_158;
    float _182 = _154 + _180;
    bool _184 = !_146;
    int _186 = _184 ? 0 : 1;
    float _188 = float(_166);
    int _190 = abs(_186);
    float _192 = -_182;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _196 = fma(_170, 0.5, 0.5);
    bool _198 = _182 < 0.5;
    float _200 = float(_198);
    float _202 = abs(_194);
    float _204 = _188 * _202;
    float _206 = -_196;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_178);
    float _212 = -_200;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = float(_190);
    float _218 = fma(_210, _208, _204);
    float _220 = abs(_214);
    float _222 = fma(_216, _220, _218);
    bool _224 = !_176;
    float _240;
    if (!_224)
    {
        float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _228 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _232 = _230 * _226;
        float _234 = floor(_232);
        float _236 = -_234;
        float _238 = _232 + _236;
        _240 = _238;
        _242 = true;
    }
    else
    {
        float _244 = float(_78);
        float _246 = 1.0 / _244;
        float _248 = _112 * _246;
        _240 = _248;
    }
    _242 = false;
    float _250 = _240;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _250 + _252;
    bool _256 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_250);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _268;
    float _272 = 1.0 / _270;
    bool _274 = _250 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_250);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_266;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _284 * _288;
    float _306 = -_284;
    float _308 = _306 + 1.0;
    float _310 = _254 * _272;
    float _312 = in.m_41.x;
    float _314 = in.m_41.y;
    float _316 = in.m_41.z;
    float _318 = fma(_292, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _320 = fma(_302, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _318 * _304;
    float _326 = _320 * _304;
    float _328 = _322 * _304;
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _332 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _334 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].x, _330);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].y, _332);
    float _340 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[144].z, _334);
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    float _346 = _340 * _316;
    bool _348 = !_298;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = _374 + _376;
    bool _380 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _382 = isnan(_374);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    bool _396 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _398 = isnan(_374);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_390;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _412;
    float _416 = 1.0 / _394;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = _406 * _410;
    float _422 = -_406;
    float _424 = _422 + 1.0;
    float _426 = _378 * _416;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = fma(_414, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _434;
    float _438 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _440 = _432 * _420;
    float _442 = fma(_436, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].x, _440);
    float _446 = _442 * _420;
    float _448 = _438 * _420;
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].x, _444);
    float _452 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].y, _446);
    float _454 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[107].z, _448);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].y, _452);
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[108].z, _454);
    bool _460 = !_418;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _134 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_78);
        float _482 = 1.0 / _480;
        float _484 = _112 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_39.y;
    float _490 = _134 * 2.0;
    float _492 = _222 * _342;
    float _494 = _222 * _344;
    float _496 = in.m_39.z;
    float _498 = _222 * _346;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _510 = _508 != 0;
    float _512 = floor(_490);
    float _514 = in.m_32.x;
    float _516 = in.m_32.y;
    float _518 = in.m_32.z;
    float _520 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _522 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = _456 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    bool _530 = _512 > 0.0;
    float _532 = _488 * 2.0;
    bool _534 = _512 >= 0.0;
    bool _536 = isnan(_512);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _496 * 2.0;
    float _546 = _488 + _496;
    float _548 = floor(_532);
    float _550 = _528 * _112;
    float _552 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _554 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _546 + (-1.0);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _564 = floor(_544);
    float _566 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    int _568 = _542 ? 0 : 1;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _572 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _574 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
    float _576 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    int _578 = ~_568;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = exp2(_550);
    bool _586 = _548 > 0.0;
    float _588 = _572 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _590 = _548 >= 0.0;
    bool _592 = isnan(_548);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    int _600 = _582;
    if (!_530)
    {
        int _602 = ~_568;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    int _608 = _598 ? 0 : 1;
    bool _610 = _564 > 0.0;
    bool _612 = _564 >= 0.0;
    bool _614 = isnan(_564);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = !_506;
    int _624 = _622 ? 0 : 1;
    int _626 = _620 ? 0 : 1;
    float _628 = -_584;
    float _630 = _628 + 1.0;
    int _632 = ~_608;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _636;
    if (!_586)
    {
        int _640 = ~_608;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    bool _646 = !_502;
    int _648 = _646 ? 0 : 1;
    int _650 = ~_626;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    int _656 = abs(_624);
    int _658 = _654;
    if (!_610)
    {
        int _660 = ~_626;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _668 = 1.0 + _666;
    bool _670 = !_510;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_648);
    float _676 = 1.0 / _668;
    int _678 = abs(_672);
    float _680 = float(_656);
    float _682 = in.m_43.x;
    float _684 = in.m_43.y;
    float _686 = in.m_43.z;
    float _688 = float(_606);
    bool _690 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(1.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = _680 * _688;
    float _702 = float(_674);
    float _704 = float(_664);
    bool _706 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    float _716 = float(_678);
    float _718 = _702 * _704;
    float _720 = float(_644);
    float _722 = _574 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = _714 ? _630 : 0.0;
    float _726 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _700 * (-2.0);
    float _730 = _716 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _722 + _732;
    if (_698)
    {
        float _736 = _724 * _676;
        _114 = _736;
    }
    float _738 = _114;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _588 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _726 + _744;
    float _748 = _734 * _734;
    float _750 = fma(_570, _728, _570);
    float _752 = fma(_728, _684, _684);
    float _754 = fma(_742, _742, _748);
    float _756 = _488 + (-0.5);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _762 = _718 * (-2.0);
    float _764 = fma(_746, _746, _754);
    float _766 = _730 * (-2.0);
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _752);
    float _770 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = sqrt(_764);
    float _774 = fma(_766, _686, _686);
    float _776 = fma(_750, _738, _768);
    float _778 = _770 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _780 = _134 + _488;
    float _782 = fma(_762, _682, _682);
    float _784 = _134 + (-0.5);
    float _786 = _134 + _496;
    float _788 = rsqrt(_764);
    float _790 = _780 + (-1.0);
    float _792 = _786 + (-1.0);
    float _794 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = in.m_45.x;
    float _798 = in.m_45.y;
    float _800 = in.m_45.z;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = 1.0 / _760;
    float _808 = _772 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _810 = _776 * 0.15915493667125701904296875;
    float _812 = fma(_794, _762, _794);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = precise::min(_778, _808);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _822;
    float _826 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _828 = 1.0 / _804;
    float _830 = _788 * _818;
    float _832 = fma(_812, _738, _820);
    float _834 = fma(_826, _766, _826);
    float _836 = _496 + (-0.5);
    float _838 = _824 * _806;
    float _840 = _734 * _830;
    float _842 = _742 * _830;
    float _844 = _832 * 0.15915493667125701904296875;
    float _846 = _746 * _830;
    float _848 = -_840;
    float _850 = _734 + _848;
    float _852 = -_842;
    float _854 = _742 + _852;
    float _856 = 1.0 / _816;
    float _858 = -_846;
    float _860 = _746 + _858;
    float _862 = _850 * _850;
    float _864 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _868 = _486 + _866;
    bool _870 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_486);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = fma(_854, _854, _862);
    float _884 = fma(_834, _738, _864);
    float _886 = _810 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = fma(_838, _868, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _892 = fma(_860, _860, _882);
    bool _894 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_486);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_880;
    float _908 = _906 + 1.0;
    bool _910 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_486);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _884 * 0.15915493667125701904296875;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _928 = sqrt(_892);
    float _930 = _904 * _908;
    float _932 = -_920;
    float _934 = _932 + 1.0;
    bool _936 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_486);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _926 * _828;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _952 = _486 + _950;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _798);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _796);
    float _958 = _810 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_948, _952, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _800);
    out.m_47.w = _818;
    bool _966 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _968 = isnan(0.5);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _974 = _970 || _972;
    float _976 = _844 * 6.283185482025146484375;
    float _978 = sin(_976);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = _844 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _982 * _856;
    float _990 = _788 * _928;
    float _992 = _520 * _990;
    float _994 = _922 * 6.283185482025146484375;
    float _996 = cos(_994);
    float _998 = -_904;
    float _1000 = _998 + 1.0;
    float _1002 = _880 * _934;
    float _1004 = _992 * _954;
    float _1006 = _770 * _990;
    float _1008 = _946 * _1000;
    float _1010 = -_946;
    float _1012 = _1010 + 1.0;
    float _1014 = _978 * _888;
    float _1016 = _922 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _890 * _1008;
    float _1022 = _986 * _888;
    float _1024 = _522 * _990;
    float _1026 = _1006 * _956;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1020);
    float _1030 = _986 * _960;
    float _1032 = _1024 * _964;
    float _1034 = _996 * _1004;
    float _1036 = _888 * _996;
    float _1038 = _960 * _996;
    float _1040 = _978 * _960;
    float _1042 = _986 * _1034;
    float _1044 = fma(_962, _930, _1028);
    float _1046 = -_846;
    float _1048 = _726 + _1046;
    float _1050 = fma(_1018, _1030, _1014);
    float _1052 = -_1004;
    float _1054 = _1018 * _1052;
    float _1056 = -_1040;
    float _1058 = fma(_1018, _1022, _1056);
    float _1060 = -_1022;
    float _1062 = fma(_1018, _1040, _1060);
    float _1064 = fma(_1050, _1026, _1042);
    float _1066 = _978 * _1034;
    float _1068 = fma(_1038, _1026, _1054);
    float _1070 = fma(_1018, _1014, _1030);
    float _1072 = fma(_1058, _1032, _1064);
    float _1074 = fma(_1062, _1026, _1066);
    float _1076 = fma(_1036, _1032, _1068);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1080 = _486 + _1078;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1084 = fma(_1070, _1032, _1074);
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = fma(_988, _1080, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1082);
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1096 = fma(_1088, _1002, _1044);
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1100 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1094);
    float _1104 = -_840;
    float _1106 = _722 + _1104;
    float _1108 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1096);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1114 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _726 + _1108;
    float _1118 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1120 = _588 + _1112;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1128 = _1120 + _1126;
    float _1130 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1132 = _1124 * _1124;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = fma(_1128, _1128, _1132);
    float _1140 = -_842;
    float _1142 = _588 + _1140;
    float _1144 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _1146 = sqrt(_1138);
    float _1148 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1118);
    float _1150 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_51.x = _1142;
    out.m_51.y = _1106;
    out.m_51.z = _1048;
    float _1152 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1130);
    float _1154 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    float _1156 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    out.m_53.x = _1134;
    out.m_53.y = _1114;
    out.m_53.z = _1136;
    out.m_53.w = _1144;
    float _1158 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1152);
    float _1160 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1168 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _722 + _1164;
    float _1172 = 1.0 / _1162;
    float _1174 = _1166 + _1162;
    float _1176 = _1134;
    float _1178 = _818;
    float _1180 = _1166;
    float _1182 = _1142;
    if (!_1168)
    {
        _1176 = _1120;
    }
    float _1184 = _1176;
    float _1186 = _1184;
    if (!_1168)
    {
        _1178 = _1116;
    }
    float _1188 = _1178;
    float _1190 = _1188;
    if (!_1168)
    {
        _1180 = _1170;
    }
    float _1192 = _1180;
    bool _1194 = !_1168;
    float _1196 = _1192;
    if (!_1194)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1202 = _1146 + _1200;
        float _1204 = rsqrt(_1138);
        float _1206 = _1202 * _1198;
        float _1208 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = _1206 * 0.15915493667125701904296875;
        float _1212 = _1210 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1222 = _1204 * _1220;
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1128, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1124, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1230 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = fma(_1170, _1218, _1230);
        _1186 = _1226;
        _1196 = _1232;
        _1190 = _1228;
    }
    float _1234 = _1186;
    float _1236 = _1196;
    float _1238 = _1190;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1248 = _1244 || _1246;
    float _1250 = -_842;
    float _1252 = _1250 + _1234;
    float _1254 = -_840;
    float _1256 = _1254 + _1236;
    float _1258 = -_846;
    float _1260 = _1258 + _1238;
    float _1262 = _1174 * _1172;
    float _1264 = _1262 * 0.5;
    float _1266 = _1256;
    float _1268 = _1252;
    float _1270 = _1260;
    if (!_974)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1106 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1142 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = -_588;
        float _1284 = _1282 + _1234;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1048 + _1288;
        float _1292 = -_722;
        float _1294 = _1292 + _1236;
        float _1296 = -_726;
        float _1298 = _1296 + _1238;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1304 = fma(_1290, _1290, _1300);
        float _1306 = sqrt(_1304);
        float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1312 = _1310 * _1302;
        float _1314 = _1308 * _1312;
        float _1316 = fma(_1284, _1314, _1142);
        float _1318 = fma(_1294, _1314, _1106);
        float _1320 = fma(_1298, _1314, _1048);
        _1266 = _1318;
        _1268 = _1316;
        _1270 = _1320;
    }
    float _1322 = _1266;
    float _1324 = _1268;
    float _1326 = _1270;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1248)
    {
        _1182 = 1.0;
    }
    float _1330 = _1182;
    float _1332 = _1330;
    if (!_1248)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1338 = _1334 * 0.15915493667125701904296875;
        float _1340 = _1336 * 0.15915493667125701904296875;
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1344 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1342);
        float _1346 = _1338 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        float _1350 = _1338 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        float _1354 = 1.0 / _1348;
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        float _1360 = _1352 * _1354;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = _1358 * _1360;
        float _1372 = 1.0 / _1344;
        float _1374 = 1.0 / _1370;
        float _1376 = 1.0 / _1368;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1380 = _1372 * _1378;
        float _1382 = _1364 * _1374;
        float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1386 = fma(_1382, _1380, _1384);
        float _1388 = _1386 * _1376;
        float _1390 = precise::clamp(_1388, 0.0, 1.0);
        _1332 = _1390;
    }
    float _1392 = _1332;
    float _1394 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1396 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1398 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1394);
    float _1404 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1396);
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1408 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1410 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1406);
    float _1416 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1420);
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1422);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1438 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1430);
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1446 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1436);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1440);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1444);
    bool _1454 = _1392 > 0.0;
    bool _1456 = isnan(_1392);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(0.0);
    bool _1462 = _1458 || _1460;
    float _1464 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1468 = _1448 + _1452;
    float _1470 = _1450 + _1452;
    float _1472 = _1452 * 0.5;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1468 * 0.5;
    float _1478 = _1470 * 0.5;
    float _1480 = fma(_1466, -0.5, _1472);
    out.m_55.x = _1006;
    out.m_57.x = _1324;
    out.m_57.y = _1322;
    out.m_57.z = _1326;
    out.m_35.x = _1474;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1450;
    out.gl_Position.w = _1452;
    out.m_59.x = _1476;
    out.m_59.y = _1480;
    out.m_59.z = _1478;
    out.m_59.w = _1452;
    if (_1462)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1482;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

