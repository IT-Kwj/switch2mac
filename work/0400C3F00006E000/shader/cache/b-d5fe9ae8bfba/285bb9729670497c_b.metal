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
    float4 m_49 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_47 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_45 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _392 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1827 = as_type<float>(_96);
        out.gl_Position.z = _1827;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_33.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_134);
        out.gl_Position.z = _1897;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_37.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_39.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    bool _308 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _310 = isnan(_286);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = 1.0 / _306;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _332 = _318 * _322;
    float _334 = -_318;
    float _336 = _334 + 1.0;
    float _338 = _290 * _328;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    float _344 = fma(_326, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = fma(_348, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _344 * _332;
    float _356 = _352 * _332;
    float _358 = _350 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    bool _372 = !_330;
    float _390;
    if (!_372)
    {
        float _374 = in.m_39.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_80);
        float _396 = 1.0 / _394;
        float _398 = _114 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    float _402 = in.m_39.x;
    float _404 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = in.m_39.z;
    float _408 = in.m_39.w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _416 = in.m_41.w;
    float _418 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _420 = in.m_39.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    float _434 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _436 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    out.m_43.x = 1.0;
    out.m_43.y = 1.0;
    out.m_43.z = 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _444 = _402 * 2.0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _454 = _406 * 2.0;
    bool _456 = _408 > 0.5;
    float _458 = floor(_444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _460;
    float _464 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _466 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _436);
    float _468 = _420 * 2.0;
    float _470 = 0.0;
    float _472 = _416;
    float _474 = _432;
    float _476 = _420;
    if (!_424)
    {
        _470 = _420;
    }
    float _478 = _470;
    float _480 = _420 + _406;
    float _482 = floor(_454);
    float _484 = _478;
    if (_424)
    {
        _484 = _402;
    }
    float _486 = _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = _400 + _488;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _494 = _480 + (-1.0);
    float _496 = _402 + (-0.5);
    bool _498 = _458 > 0.0;
    float _500 = -_416;
    float _502 = _500 + 1.0;
    float _504 = floor(_468);
    bool _506 = _458 >= 0.0;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = _366 * _446;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _518;
    if (_412)
    {
        float _522 = _456 ? _502 : _416;
        _472 = _522;
    }
    float _524 = _472;
    bool _526 = _482 > 0.0;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    bool _532 = _482 >= 0.0;
    bool _534 = isnan(_482);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = -_432;
    float _544 = _542 + 1.0;
    bool _546 = _420 > 0.5;
    float _548 = _370 * _450;
    int _550 = _540 ? 0 : 1;
    float _552 = in.m_41.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    float _558 = 1.0 / _462;
    int _560 = _514 ? 0 : 1;
    float _562 = fma(_492, _524, -0.5);
    int _564 = _546 ? as_type<int>(_544) : as_type<int>(_432);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _566;
    bool _570 = _406 > 0.5;
    int _572 = ~_550;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = 1.0 / _440;
    int _580 = ~_560;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _402 + _406;
    float _588 = _556 ? as_type<float>(_564) : _432;
    int _590 = _576;
    int _592 = _584;
    if (_430)
    {
        float _594 = _570 ? _544 : _432;
        _474 = _594;
    }
    float _596 = _474;
    float _598 = _586 + (-1.0);
    if (!_526)
    {
        int _600 = ~_550;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_498)
    {
        int _608 = ~_560;
        int _610 = _608 + 1;
        _592 = _610;
    }
    int _612 = _592;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _624 = _622 != 0;
    bool _626 = _504 >= 0.0;
    bool _628 = isnan(_504);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = float(_612);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    int _650 = _634 ? 0 : 1;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    bool _656 = !_644;
    int _658 = _656 ? 0 : 1;
    float _660 = 0.0;
    if (_624)
    {
        float _662 = in.m_39.z;
        _660 = _662;
    }
    float _664 = _660;
    bool _666 = _504 > 0.0;
    bool _668 = !_640;
    int _670 = _668 ? 0 : 1;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _674 = _672 != 0;
    float _676 = _368 * _448;
    bool _678 = !_648;
    int _680 = _678 ? 0 : 1;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _694 = ~_650;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = in.m_47.x;
    float _702 = in.m_47.y;
    float _704 = in.m_47.z;
    int _706 = abs(_670);
    float _708 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _710 = abs(_658);
    int _712 = _698;
    bool _714 = _690;
    if (!_666)
    {
        int _716 = ~_650;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    int _722 = abs(_680);
    float _724 = _530 * _114;
    float _726 = float(_604);
    float _728 = float(_720);
    float _730 = exp2(_724);
    float _732 = as_type<float>(_720);
    float _734 = _530;
    if (!_424)
    {
        float _736 = in.m_39.z;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = float(_710);
    bool _742 = _664 > 0.5;
    bool _744 = _742 && _624;
    float _746 = float(_706);
    float _748 = _740 * _636;
    float _750 = float(_722);
    if (_624)
    {
        _734 = _552;
    }
    float _752 = _734;
    float _754 = _748 * (-2.0);
    float _756 = _746 * _726;
    float _758 = _750 * _728;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _762 = fma(_754, _702, _702);
    float _764 = _756 * (-2.0);
    float _766 = _758 * (-2.0);
    float _768 = _752;
    if (_744)
    {
        float _770 = -_752;
        float _772 = _770 + 1.0;
        _768 = _772;
    }
    float _774 = _768;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _778 = -_730;
    float _780 = _778 + 1.0;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _796 = fma(_764, _700, _700);
    float _798 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _800;
    float _804 = 0.0;
    float _806 = _738;
    if (!_424)
    {
        _804 = _738;
    }
    float _808 = _804;
    float _810 = 1.0 / _794;
    float _812 = _808;
    if (_424)
    {
        _812 = _420;
    }
    float _814 = _812;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    if (_424)
    {
        _806 = _420;
    }
    float _818 = _806;
    float _820 = _618 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _822 = _790 ? _780 : 0.0;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = 1.0 / _802;
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _846 = _842 || _844;
    float _848 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _796);
    float _850 = fma(_766, _704, _704);
    float _852 = fma(_614, _766, _614);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _858 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _862 = _400 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _490 * _836;
    float _870 = _862 * _810;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _876 = _400 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _878;
    out.m_49.x = _872;
    out.m_49.y = _866;
    out.m_49.z = _858;
    float _882 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _884 = _876 * _558;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _888 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _890 = isnan(_400);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_882, _754, _882);
    float _902 = -_898;
    float _904 = _902 + 1.0;
    float _906 = _402 + _420;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _908;
    float _912 = _906 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = fma(_916, _868, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _930 = fma(_920, _868, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _932 = fma(_910, _868, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _942 = fma(_924, _870, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _944 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _946 = fma(_936, _870, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _948 = fma(_940, _870, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _950 = _464 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _944 + _954;
    float _958 = fma(_880, _884, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _950 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = fma(_520, _884, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _970 = fma(_568, _884, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _972 = _962 * _962;
    float _974 = fma(_956, _956, _972);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _978 = fma(_966, _966, _974);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _984 = _486 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _986 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[83].z, _976);
    float _988 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _990 = rsqrt(_978);
    float _992 = -_982;
    float _994 = fma(_984, 2.0, _992);
    float _996 = fma(_824, -2.0, _886);
    float _998 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1000 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _988);
    float _1002 = -_114;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _994);
    float _1006 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _996);
    int _1008 = as_type<int>(_904);
    float _1010 = _820;
    if (_690)
    {
        float _1012 = _822 * _578;
        _116 = _1012;
    }
    float _1014 = _116;
    float _1016 = in.m_41.x;
    if (_654)
    {
        bool _1018 = _402 > 0.5;
        _714 = _1018;
    }
    bool _1020 = _714;
    float _1022 = fma(_926, _764, _926);
    bool _1024 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_400);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1038 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1040 = isnan(_400);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_1022, _1014, _848);
    bool _1052 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1054 = isnan(_400);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _962 * _990;
    float _1066 = _956 * _990;
    float _1068 = _966 * _990;
    float _1070 = _1050 * 0.15915493667125701904296875;
    float _1072 = -_1064;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = -_1068;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1088 = _1074 * _1074;
    float _1090 = -_1006;
    float _1092 = fma(_1000, _562, _1090);
    float _1094 = _898 * _1082;
    float _1096 = _1034 * _904;
    float _1098 = fma(_1078, _1078, _1088);
    float _1100 = -_1034;
    float _1102 = _1100 + 1.0;
    float _1104 = -_1066;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1108 = _1070 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = fma(_1086, _1086, _1098);
    float _1114 = _1048 * _1102;
    int _1116 = as_type<int>(_1098);
    float _1118 = _1034;
    float _1120 = _1086;
    if (_654)
    {
        float _1122 = -_1016;
        float _1124 = _1122 + 1.0;
        _1116 = as_type<int>(_1124);
    }
    int _1126 = _1116;
    if (_674)
    {
        float _1128 = -_1016;
        float _1130 = _1128 + 1.0;
        _1008 = as_type<int>(_1130);
    }
    int _1132 = _1008;
    float _1134 = -_1048;
    float _1136 = _1134 + 1.0;
    float _1138 = _928 * _1114;
    float _1140 = _930 * _1114;
    float _1142 = _932 * _1114;
    float _1144 = _420 + (-0.5);
    if (!_654)
    {
        _1118 = _1016;
    }
    float _1146 = _1118;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1140);
    float _1150 = _1146;
    if (!_674)
    {
        _476 = _1016;
    }
    float _1152 = _476;
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].y, _762);
    float _1156 = _1152;
    if (_654)
    {
        float _1158 = _1020 ? as_type<float>(_1126) : _1016;
        _1150 = _1158;
    }
    float _1160 = _1150;
    float _1162 = fma(_942, _1096, _1148);
    if (_674)
    {
        float _1164 = _546 ? as_type<float>(_1132) : _1016;
        _1156 = _1164;
    }
    float _1166 = _1156;
    float _1168 = fma(_900, _1014, _1154);
    if (!_624)
    {
        _1120 = _552;
    }
    float _1170 = _1120;
    float _1172 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1142);
    float _1174 = _1170;
    if (_624)
    {
        _1174 = _774;
    }
    float _1176 = _1174;
    float _1178 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1180 = _406 + (-0.5);
    float _1182 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1138);
    float _1184 = fma(_948, _1096, _1172);
    float _1186 = fma(_1178, _1176, -0.5);
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _850);
    float _1190 = _1168 * 0.15915493667125701904296875;
    float _1192 = fma(_968, _1094, _1162);
    float _1194 = fma(_998, _1186, _1004);
    float _1196 = fma(_852, _1014, _1188);
    float _1198 = -_1064;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1202 = sqrt(_1112);
    float _1204 = fma(_946, _1096, _1182);
    float _1206 = _1196 * 0.15915493667125701904296875;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1210 = fma(_970, _1094, _1184);
    float _1212 = -_1068;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1216 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1218 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1208);
    float _1220 = _1070 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_958, _1094, _1204);
    float _1226 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1218);
    float _1230 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1192);
    float _1232 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1224);
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1238 = _1190 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _990 * _1202;
    float _1244 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1210);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _708 * _1242;
    float _1250 = _1246 + _1236;
    float _1252 = _1190 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1248 * _816;
    float _1258 = _1206 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1222 * _1240;
    float _1264 = _1110 * _1240;
    float _1266 = _1206 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1110 * _1254;
    float _1272 = _1222 * _1254;
    float _1274 = 1.0 / _1236;
    float _1276 = _1222 * _1260;
    float _1278 = _1254 * _1260;
    float _1280 = _1110 * _1260;
    float _1282 = _1240 * _1260;
    float _1284 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1286 = fma(_1268, _1270, _1262);
    float _1288 = fma(_1268, _1262, _1270);
    float _1290 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1292 = _1284 * _1242;
    float _1294 = -_1264;
    float _1296 = fma(_1268, _1272, _1294);
    float _1298 = _1280 * _1256;
    float _1300 = _1290 * _1242;
    float _1302 = _1292 * _760;
    float _1304 = -_1272;
    float _1306 = fma(_1268, _1264, _1304);
    float _1308 = _1250 * _1274;
    float _1310 = _1308 * 0.5;
    float _1312 = _1300 * _776;
    float _1314 = _1276 * _1256;
    float _1316 = -_1256;
    float _1318 = _1268 * _1316;
    float _1320 = fma(_1286, _1302, _1298);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = fma(_1296, _1302, _1314);
    float _1328 = fma(_1278, _1302, _1318);
    float _1330 = fma(_1306, _1312, _1320);
    float _1332 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1336 = fma(_1282, _1312, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1340 = fma(_1288, _1312, _1326);
    float _1342 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1346 = _1274;
    float _1348 = _1244;
    if (!_846)
    {
        _1344 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1350 = _1344;
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1338);
    float _1354 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1342);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1356);
    float _1364 = _1350;
    if (!_846)
    {
        float _1366 = -_1350;
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = _952 + _1360;
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1376 = _944 + _1362;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = _1332 * _1334;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1392 = _1382 * _1382;
    float _1394 = _1194 + 0.5;
    float _1396 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1400 = fma(_1388, _1388, _1392);
    float _1402 = _606 * _1358;
    float _1404 = _1358;
    float _1406 = _1376;
    float _1408 = _1372;
    if (!_846)
    {
        _1404 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1410 = _1404;
    float _1412 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = sqrt(_1400);
    float _1422 = _1396 * _1378;
    float _1424 = _1410;
    if (!_846)
    {
        float _1426 = -_1410;
        float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1348 = _1428;
    }
    float _1430 = _1348;
    float _1432 = -_820;
    float _1434 = _1268 * _1432;
    float _1436 = _1280 * _820;
    float _1438 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1374);
    out.m_51.x = _1422;
    out.m_51.y = _1384;
    float _1440 = _1276 * _820;
    float _1442 = 1.0 / _1324;
    float _1444 = _1412 * _1398;
    float _1446 = _1092 + 0.5;
    float _1448 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = fma(_1278, _798, _1434);
    out.m_53.x = _1444;
    out.m_53.y = _1402;
    out.m_53.z = _1394;
    out.m_53.w = _1446;
    float _1456 = _1370;
    float _1458 = _1448;
    if (!_846)
    {
        float _1460 = 1.0 / _1370;
        _1456 = _1460;
    }
    float _1462 = _1456;
    bool _1464 = _1420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = fma(_1286, _798, _1436);
    float _1468 = fma(_1296, _798, _1440);
    out.m_55.x = _1448;
    out.m_55.y = _1450;
    out.m_55.z = _1452;
    out.m_55.w = _1390;
    float _1470 = fma(_1282, _692, _1454);
    float _1472 = fma(_1306, _692, _1466);
    if (_846)
    {
        _1010 = 1.0;
    }
    float _1474 = _1010;
    float _1476 = _1430;
    float _1478 = _1474;
    if (!_846)
    {
        float _1480 = 1.0 / _1430;
        _1476 = _1480;
    }
    float _1482 = _1476;
    if (!_846)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1350;
        float _1488 = fma(_1442, _1484, _1486);
        _1364 = _1488;
    }
    float _1490 = _1364;
    if (!_846)
    {
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1494 = -_1410;
        float _1496 = fma(_1442, _1492, _1494);
        _1424 = _1496;
    }
    float _1498 = _1424;
    float _1500 = fma(_1288, _692, _1468);
    float _1502 = _950 + _1438;
    float _1504 = _1498;
    float _1506 = _1502;
    if (!_846)
    {
        float _1508 = _1490 * _1462;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1478 = _1510;
    }
    float _1512 = _1478;
    if (!_1464)
    {
        _1458 = _1502;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_846)
    {
        float _1518 = _1498 * _1482;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1464;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1420 + _1528;
        float _1532 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = rsqrt(_1400);
        float _1536 = _1530 * _1526;
        float _1538 = _1536 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1534 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1388, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1382, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1406 = _1558;
        _1516 = _1556;
        _1408 = _1560;
    }
    float _1562 = _1406;
    float _1564 = _1516;
    float _1566 = _1408;
    float _1568 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1572 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_846)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1066;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1064;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1068;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_846)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_834)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1200 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1106 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_950;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1214 + _1624;
        float _1628 = fma(_1614, _1614, _1622);
        float _1630 = 1.0 / _1242;
        float _1632 = fma(_1626, _1626, _1628);
        float _1634 = sqrt(_1632);
        float _1636 = precise::min(_1634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1616;
        float _1640 = -_944;
        float _1642 = _1640 + _1562;
        float _1644 = _1638 * _1630;
        float _1646 = -_952;
        float _1648 = _1646 + _1566;
        float _1650 = fma(_1642, _1644, _1106);
        float _1652 = fma(_1620, _1644, _1200);
        float _1654 = fma(_1648, _1644, _1214);
        _1596 = _1652;
        _1598 = _1650;
        _1600 = _1654;
    }
    float _1656 = _1596;
    float _1658 = _1598;
    float _1660 = _1600;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1666 = _1512 > 0.0;
    bool _1668 = isnan(_1512);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1680 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1664);
    float _1682 = _1512 * _1606;
    bool _1684 = _1606 <= 0.0;
    bool _1686 = !_1674;
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1678);
    float _1692 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1694 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1680);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1702 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1694);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1708);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1724 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1714);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1722);
    float _1734 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1736 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1748 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1750 = _1736 + _1738;
    float _1752 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1660 + _1754;
    float _1758 = _1748 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1658 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1656 + _1764;
    float _1768 = _1750 * 0.5;
    out.m_57.x = _1734;
    out.m_57.y = _1742;
    out.m_57.z = _1744;
    out.m_33.x = _1758;
    out.m_59.x = _1762;
    out.m_59.y = _1766;
    out.m_59.z = _1756;
    out.gl_Position.x = _1746;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1738;
    out.m_61.z = _1768;
    out.m_61.w = _1738;
    if (!_1688)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _392 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1827 = as_type<float>(_96);
        out.gl_Position.z = _1827;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_33.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_134);
        out.gl_Position.z = _1897;
    }
    if (_126)
    {
        return out;
    }
    float _136 = in.m_37.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_39.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    bool _308 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _310 = isnan(_286);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = 1.0 / _306;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _332 = _318 * _322;
    float _334 = -_318;
    float _336 = _334 + 1.0;
    float _338 = _290 * _328;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    float _344 = fma(_326, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = fma(_348, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _344 * _332;
    float _356 = _352 * _332;
    float _358 = _350 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    bool _372 = !_330;
    float _390;
    if (!_372)
    {
        float _374 = in.m_39.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_80);
        float _396 = 1.0 / _394;
        float _398 = _114 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    float _402 = in.m_39.x;
    float _404 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = in.m_39.z;
    float _408 = in.m_39.w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _416 = in.m_41.w;
    float _418 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _420 = in.m_39.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    float _434 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _436 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    out.m_43.x = 1.0;
    out.m_43.y = 1.0;
    out.m_43.z = 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _444 = _402 * 2.0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _454 = _406 * 2.0;
    bool _456 = _408 > 0.5;
    float _458 = floor(_444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _460;
    float _464 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _466 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _436);
    float _468 = _420 * 2.0;
    float _470 = 0.0;
    float _472 = _416;
    float _474 = _432;
    float _476 = _420;
    if (!_424)
    {
        _470 = _420;
    }
    float _478 = _470;
    float _480 = _420 + _406;
    float _482 = floor(_454);
    float _484 = _478;
    if (_424)
    {
        _484 = _402;
    }
    float _486 = _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = _400 + _488;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _494 = _480 + (-1.0);
    float _496 = _402 + (-0.5);
    bool _498 = _458 > 0.0;
    float _500 = -_416;
    float _502 = _500 + 1.0;
    float _504 = floor(_468);
    bool _506 = _458 >= 0.0;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = _366 * _446;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _518;
    if (_412)
    {
        float _522 = _456 ? _502 : _416;
        _472 = _522;
    }
    float _524 = _472;
    bool _526 = _482 > 0.0;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    bool _532 = _482 >= 0.0;
    bool _534 = isnan(_482);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = -_432;
    float _544 = _542 + 1.0;
    bool _546 = _420 > 0.5;
    float _548 = _370 * _450;
    int _550 = _540 ? 0 : 1;
    float _552 = in.m_41.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    float _558 = 1.0 / _462;
    int _560 = _514 ? 0 : 1;
    float _562 = fma(_492, _524, -0.5);
    int _564 = _546 ? as_type<int>(_544) : as_type<int>(_432);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _566;
    bool _570 = _406 > 0.5;
    int _572 = ~_550;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = 1.0 / _440;
    int _580 = ~_560;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _402 + _406;
    float _588 = _556 ? as_type<float>(_564) : _432;
    int _590 = _576;
    int _592 = _584;
    if (_430)
    {
        float _594 = _570 ? _544 : _432;
        _474 = _594;
    }
    float _596 = _474;
    float _598 = _586 + (-1.0);
    if (!_526)
    {
        int _600 = ~_550;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_498)
    {
        int _608 = ~_560;
        int _610 = _608 + 1;
        _592 = _610;
    }
    int _612 = _592;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _624 = _622 != 0;
    bool _626 = _504 >= 0.0;
    bool _628 = isnan(_504);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = float(_612);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    int _650 = _634 ? 0 : 1;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    bool _656 = !_644;
    int _658 = _656 ? 0 : 1;
    float _660 = 0.0;
    if (_624)
    {
        float _662 = in.m_39.z;
        _660 = _662;
    }
    float _664 = _660;
    bool _666 = _504 > 0.0;
    bool _668 = !_640;
    int _670 = _668 ? 0 : 1;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _674 = _672 != 0;
    float _676 = _368 * _448;
    bool _678 = !_648;
    int _680 = _678 ? 0 : 1;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _694 = ~_650;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = in.m_47.x;
    float _702 = in.m_47.y;
    float _704 = in.m_47.z;
    int _706 = abs(_670);
    float _708 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _710 = abs(_658);
    int _712 = _698;
    bool _714 = _690;
    if (!_666)
    {
        int _716 = ~_650;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    int _722 = abs(_680);
    float _724 = _530 * _114;
    float _726 = float(_604);
    float _728 = float(_720);
    float _730 = exp2(_724);
    float _732 = as_type<float>(_720);
    float _734 = _530;
    if (!_424)
    {
        float _736 = in.m_39.z;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = float(_710);
    bool _742 = _664 > 0.5;
    bool _744 = _742 && _624;
    float _746 = float(_706);
    float _748 = _740 * _636;
    float _750 = float(_722);
    if (_624)
    {
        _734 = _552;
    }
    float _752 = _734;
    float _754 = _748 * (-2.0);
    float _756 = _746 * _726;
    float _758 = _750 * _728;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _762 = fma(_754, _702, _702);
    float _764 = _756 * (-2.0);
    float _766 = _758 * (-2.0);
    float _768 = _752;
    if (_744)
    {
        float _770 = -_752;
        float _772 = _770 + 1.0;
        _768 = _772;
    }
    float _774 = _768;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _778 = -_730;
    float _780 = _778 + 1.0;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _796 = fma(_764, _700, _700);
    float _798 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _800;
    float _804 = 0.0;
    float _806 = _738;
    if (!_424)
    {
        _804 = _738;
    }
    float _808 = _804;
    float _810 = 1.0 / _794;
    float _812 = _808;
    if (_424)
    {
        _812 = _420;
    }
    float _814 = _812;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    if (_424)
    {
        _806 = _420;
    }
    float _818 = _806;
    float _820 = _618 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _822 = _790 ? _780 : 0.0;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = 1.0 / _802;
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _846 = _842 || _844;
    float _848 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _796);
    float _850 = fma(_766, _704, _704);
    float _852 = fma(_614, _766, _614);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _858 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _862 = _400 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _490 * _836;
    float _870 = _862 * _810;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _876 = _400 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _878;
    out.m_49.x = _872;
    out.m_49.y = _866;
    out.m_49.z = _858;
    float _882 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _884 = _876 * _558;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _888 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _890 = isnan(_400);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_882, _754, _882);
    float _902 = -_898;
    float _904 = _902 + 1.0;
    float _906 = _402 + _420;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _908;
    float _912 = _906 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = fma(_916, _868, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _930 = fma(_920, _868, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _932 = fma(_910, _868, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _942 = fma(_924, _870, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _944 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _946 = fma(_936, _870, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _948 = fma(_940, _870, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _950 = _464 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _944 + _954;
    float _958 = fma(_880, _884, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _950 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = fma(_520, _884, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _970 = fma(_568, _884, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _972 = _962 * _962;
    float _974 = fma(_956, _956, _972);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _978 = fma(_966, _966, _974);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _984 = _486 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _986 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[83].z, _976);
    float _988 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _990 = rsqrt(_978);
    float _992 = -_982;
    float _994 = fma(_984, 2.0, _992);
    float _996 = fma(_824, -2.0, _886);
    float _998 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1000 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _988);
    float _1002 = -_114;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _994);
    float _1006 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _996);
    int _1008 = as_type<int>(_904);
    float _1010 = _820;
    if (_690)
    {
        float _1012 = _822 * _578;
        _116 = _1012;
    }
    float _1014 = _116;
    float _1016 = in.m_41.x;
    if (_654)
    {
        bool _1018 = _402 > 0.5;
        _714 = _1018;
    }
    bool _1020 = _714;
    float _1022 = fma(_926, _764, _926);
    bool _1024 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_400);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1038 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1040 = isnan(_400);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_1022, _1014, _848);
    bool _1052 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1054 = isnan(_400);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _962 * _990;
    float _1066 = _956 * _990;
    float _1068 = _966 * _990;
    float _1070 = _1050 * 0.15915493667125701904296875;
    float _1072 = -_1064;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = -_1068;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1088 = _1074 * _1074;
    float _1090 = -_1006;
    float _1092 = fma(_1000, _562, _1090);
    float _1094 = _898 * _1082;
    float _1096 = _1034 * _904;
    float _1098 = fma(_1078, _1078, _1088);
    float _1100 = -_1034;
    float _1102 = _1100 + 1.0;
    float _1104 = -_1066;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1108 = _1070 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = fma(_1086, _1086, _1098);
    float _1114 = _1048 * _1102;
    int _1116 = as_type<int>(_1098);
    float _1118 = _1034;
    float _1120 = _1086;
    if (_654)
    {
        float _1122 = -_1016;
        float _1124 = _1122 + 1.0;
        _1116 = as_type<int>(_1124);
    }
    int _1126 = _1116;
    if (_674)
    {
        float _1128 = -_1016;
        float _1130 = _1128 + 1.0;
        _1008 = as_type<int>(_1130);
    }
    int _1132 = _1008;
    float _1134 = -_1048;
    float _1136 = _1134 + 1.0;
    float _1138 = _928 * _1114;
    float _1140 = _930 * _1114;
    float _1142 = _932 * _1114;
    float _1144 = _420 + (-0.5);
    if (!_654)
    {
        _1118 = _1016;
    }
    float _1146 = _1118;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1140);
    float _1150 = _1146;
    if (!_674)
    {
        _476 = _1016;
    }
    float _1152 = _476;
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].y, _762);
    float _1156 = _1152;
    if (_654)
    {
        float _1158 = _1020 ? as_type<float>(_1126) : _1016;
        _1150 = _1158;
    }
    float _1160 = _1150;
    float _1162 = fma(_942, _1096, _1148);
    if (_674)
    {
        float _1164 = _546 ? as_type<float>(_1132) : _1016;
        _1156 = _1164;
    }
    float _1166 = _1156;
    float _1168 = fma(_900, _1014, _1154);
    if (!_624)
    {
        _1120 = _552;
    }
    float _1170 = _1120;
    float _1172 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1142);
    float _1174 = _1170;
    if (_624)
    {
        _1174 = _774;
    }
    float _1176 = _1174;
    float _1178 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1180 = _406 + (-0.5);
    float _1182 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1138);
    float _1184 = fma(_948, _1096, _1172);
    float _1186 = fma(_1178, _1176, -0.5);
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _850);
    float _1190 = _1168 * 0.15915493667125701904296875;
    float _1192 = fma(_968, _1094, _1162);
    float _1194 = fma(_998, _1186, _1004);
    float _1196 = fma(_852, _1014, _1188);
    float _1198 = -_1064;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1202 = sqrt(_1112);
    float _1204 = fma(_946, _1096, _1182);
    float _1206 = _1196 * 0.15915493667125701904296875;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1210 = fma(_970, _1094, _1184);
    float _1212 = -_1068;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1216 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1218 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1208);
    float _1220 = _1070 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_958, _1094, _1204);
    float _1226 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1218);
    float _1230 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1192);
    float _1232 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1224);
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1238 = _1190 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _990 * _1202;
    float _1244 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1210);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _708 * _1242;
    float _1250 = _1246 + _1236;
    float _1252 = _1190 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1248 * _816;
    float _1258 = _1206 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1222 * _1240;
    float _1264 = _1110 * _1240;
    float _1266 = _1206 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1110 * _1254;
    float _1272 = _1222 * _1254;
    float _1274 = 1.0 / _1236;
    float _1276 = _1222 * _1260;
    float _1278 = _1254 * _1260;
    float _1280 = _1110 * _1260;
    float _1282 = _1240 * _1260;
    float _1284 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1286 = fma(_1268, _1270, _1262);
    float _1288 = fma(_1268, _1262, _1270);
    float _1290 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1292 = _1284 * _1242;
    float _1294 = -_1264;
    float _1296 = fma(_1268, _1272, _1294);
    float _1298 = _1280 * _1256;
    float _1300 = _1290 * _1242;
    float _1302 = _1292 * _760;
    float _1304 = -_1272;
    float _1306 = fma(_1268, _1264, _1304);
    float _1308 = _1250 * _1274;
    float _1310 = _1308 * 0.5;
    float _1312 = _1300 * _776;
    float _1314 = _1276 * _1256;
    float _1316 = -_1256;
    float _1318 = _1268 * _1316;
    float _1320 = fma(_1286, _1302, _1298);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = fma(_1296, _1302, _1314);
    float _1328 = fma(_1278, _1302, _1318);
    float _1330 = fma(_1306, _1312, _1320);
    float _1332 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1336 = fma(_1282, _1312, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1340 = fma(_1288, _1312, _1326);
    float _1342 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1346 = _1274;
    float _1348 = _1244;
    if (!_846)
    {
        _1344 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1350 = _1344;
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1338);
    float _1354 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1342);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1356);
    float _1364 = _1350;
    if (!_846)
    {
        float _1366 = -_1350;
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = _952 + _1360;
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1376 = _944 + _1362;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = _1332 * _1334;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1392 = _1382 * _1382;
    float _1394 = _1194 + 0.5;
    float _1396 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1400 = fma(_1388, _1388, _1392);
    float _1402 = _606 * _1358;
    float _1404 = _1358;
    float _1406 = _1376;
    float _1408 = _1372;
    if (!_846)
    {
        _1404 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1410 = _1404;
    float _1412 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = sqrt(_1400);
    float _1422 = _1396 * _1378;
    float _1424 = _1410;
    if (!_846)
    {
        float _1426 = -_1410;
        float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1348 = _1428;
    }
    float _1430 = _1348;
    float _1432 = -_820;
    float _1434 = _1268 * _1432;
    float _1436 = _1280 * _820;
    float _1438 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1374);
    out.m_51.x = _1422;
    out.m_51.y = _1384;
    float _1440 = _1276 * _820;
    float _1442 = 1.0 / _1324;
    float _1444 = _1412 * _1398;
    float _1446 = _1092 + 0.5;
    float _1448 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = fma(_1278, _798, _1434);
    out.m_53.x = _1444;
    out.m_53.y = _1402;
    out.m_53.z = _1394;
    out.m_53.w = _1446;
    float _1456 = _1370;
    float _1458 = _1448;
    if (!_846)
    {
        float _1460 = 1.0 / _1370;
        _1456 = _1460;
    }
    float _1462 = _1456;
    bool _1464 = _1420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = fma(_1286, _798, _1436);
    float _1468 = fma(_1296, _798, _1440);
    out.m_55.x = _1448;
    out.m_55.y = _1450;
    out.m_55.z = _1452;
    out.m_55.w = _1390;
    float _1470 = fma(_1282, _692, _1454);
    float _1472 = fma(_1306, _692, _1466);
    if (_846)
    {
        _1010 = 1.0;
    }
    float _1474 = _1010;
    float _1476 = _1430;
    float _1478 = _1474;
    if (!_846)
    {
        float _1480 = 1.0 / _1430;
        _1476 = _1480;
    }
    float _1482 = _1476;
    if (!_846)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1350;
        float _1488 = fma(_1442, _1484, _1486);
        _1364 = _1488;
    }
    float _1490 = _1364;
    if (!_846)
    {
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1494 = -_1410;
        float _1496 = fma(_1442, _1492, _1494);
        _1424 = _1496;
    }
    float _1498 = _1424;
    float _1500 = fma(_1288, _692, _1468);
    float _1502 = _950 + _1438;
    float _1504 = _1498;
    float _1506 = _1502;
    if (!_846)
    {
        float _1508 = _1490 * _1462;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1478 = _1510;
    }
    float _1512 = _1478;
    if (!_1464)
    {
        _1458 = _1502;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_846)
    {
        float _1518 = _1498 * _1482;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1464;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1420 + _1528;
        float _1532 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = rsqrt(_1400);
        float _1536 = _1530 * _1526;
        float _1538 = _1536 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1534 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1388, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1382, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1406 = _1558;
        _1516 = _1556;
        _1408 = _1560;
    }
    float _1562 = _1406;
    float _1564 = _1516;
    float _1566 = _1408;
    float _1568 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1572 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_846)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1066;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1064;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1068;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_846)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_834)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1200 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1106 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_950;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1214 + _1624;
        float _1628 = fma(_1614, _1614, _1622);
        float _1630 = 1.0 / _1242;
        float _1632 = fma(_1626, _1626, _1628);
        float _1634 = sqrt(_1632);
        float _1636 = precise::min(_1634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1616;
        float _1640 = -_944;
        float _1642 = _1640 + _1562;
        float _1644 = _1638 * _1630;
        float _1646 = -_952;
        float _1648 = _1646 + _1566;
        float _1650 = fma(_1642, _1644, _1106);
        float _1652 = fma(_1620, _1644, _1200);
        float _1654 = fma(_1648, _1644, _1214);
        _1596 = _1652;
        _1598 = _1650;
        _1600 = _1654;
    }
    float _1656 = _1596;
    float _1658 = _1598;
    float _1660 = _1600;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1666 = _1512 > 0.0;
    bool _1668 = isnan(_1512);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1680 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1664);
    float _1682 = _1512 * _1606;
    bool _1684 = _1606 <= 0.0;
    bool _1686 = !_1674;
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1678);
    float _1692 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1694 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1680);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1702 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1694);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1708);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1724 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1714);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1722);
    float _1734 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1736 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1748 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1750 = _1736 + _1738;
    float _1752 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1660 + _1754;
    float _1758 = _1748 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1658 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1656 + _1764;
    float _1768 = _1750 * 0.5;
    out.m_57.x = _1734;
    out.m_57.y = _1742;
    out.m_57.z = _1744;
    out.m_33.x = _1758;
    out.m_59.x = _1762;
    out.m_59.y = _1766;
    out.m_59.z = _1756;
    out.gl_Position.x = _1746;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1738;
    out.m_61.z = _1768;
    out.m_61.w = _1738;
    if (!_1688)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _392 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1827 = as_type<float>(_96);
        out.gl_Position.z = _1827;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_33.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_134);
        out.gl_Position.z = _1897;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_37.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_39.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    bool _308 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _310 = isnan(_286);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_302;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = 1.0 / _306;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _332 = _318 * _322;
    float _334 = -_318;
    float _336 = _334 + 1.0;
    float _338 = _290 * _328;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    float _344 = fma(_326, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = fma(_348, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _344 * _332;
    float _356 = _352 * _332;
    float _358 = _350 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    bool _372 = !_330;
    float _390;
    if (!_372)
    {
        float _374 = in.m_39.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_80);
        float _396 = 1.0 / _394;
        float _398 = _114 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    float _402 = in.m_39.x;
    float _404 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = in.m_39.z;
    float _408 = in.m_39.w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _416 = in.m_41.w;
    float _418 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _420 = in.m_39.y;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    float _434 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _436 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    out.m_43.x = 1.0;
    out.m_43.y = 1.0;
    out.m_43.z = 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _444 = _402 * 2.0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _454 = _406 * 2.0;
    bool _456 = _408 > 0.5;
    float _458 = floor(_444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _460;
    float _464 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _466 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _436);
    float _468 = _420 * 2.0;
    float _470 = 0.0;
    float _472 = _416;
    float _474 = _432;
    float _476 = _420;
    if (!_424)
    {
        _470 = _420;
    }
    float _478 = _470;
    float _480 = _420 + _406;
    float _482 = floor(_454);
    float _484 = _478;
    if (_424)
    {
        _484 = _402;
    }
    float _486 = _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = _400 + _488;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _494 = _480 + (-1.0);
    float _496 = _402 + (-0.5);
    bool _498 = _458 > 0.0;
    float _500 = -_416;
    float _502 = _500 + 1.0;
    float _504 = floor(_468);
    bool _506 = _458 >= 0.0;
    bool _508 = isnan(_458);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = _366 * _446;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _518;
    if (_412)
    {
        float _522 = _456 ? _502 : _416;
        _472 = _522;
    }
    float _524 = _472;
    bool _526 = _482 > 0.0;
    float _528 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _530 = log2(_528);
    bool _532 = _482 >= 0.0;
    bool _534 = isnan(_482);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = -_432;
    float _544 = _542 + 1.0;
    bool _546 = _420 > 0.5;
    float _548 = _370 * _450;
    int _550 = _540 ? 0 : 1;
    float _552 = in.m_41.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    float _558 = 1.0 / _462;
    int _560 = _514 ? 0 : 1;
    float _562 = fma(_492, _524, -0.5);
    int _564 = _546 ? as_type<int>(_544) : as_type<int>(_432);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _566;
    bool _570 = _406 > 0.5;
    int _572 = ~_550;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = 1.0 / _440;
    int _580 = ~_560;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _402 + _406;
    float _588 = _556 ? as_type<float>(_564) : _432;
    int _590 = _576;
    int _592 = _584;
    if (_430)
    {
        float _594 = _570 ? _544 : _432;
        _474 = _594;
    }
    float _596 = _474;
    float _598 = _586 + (-1.0);
    if (!_526)
    {
        int _600 = ~_550;
        int _602 = _600 + 1;
        _590 = _602;
    }
    int _604 = _590;
    float _606 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_498)
    {
        int _608 = ~_560;
        int _610 = _608 + 1;
        _592 = _610;
    }
    int _612 = _592;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _624 = _622 != 0;
    bool _626 = _504 >= 0.0;
    bool _628 = isnan(_504);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = float(_612);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    int _650 = _634 ? 0 : 1;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    bool _656 = !_644;
    int _658 = _656 ? 0 : 1;
    float _660 = 0.0;
    if (_624)
    {
        float _662 = in.m_39.z;
        _660 = _662;
    }
    float _664 = _660;
    bool _666 = _504 > 0.0;
    bool _668 = !_640;
    int _670 = _668 ? 0 : 1;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _674 = _672 != 0;
    float _676 = _368 * _448;
    bool _678 = !_648;
    int _680 = _678 ? 0 : 1;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _694 = ~_650;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = in.m_47.x;
    float _702 = in.m_47.y;
    float _704 = in.m_47.z;
    int _706 = abs(_670);
    float _708 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _710 = abs(_658);
    int _712 = _698;
    bool _714 = _690;
    if (!_666)
    {
        int _716 = ~_650;
        int _718 = _716 + 1;
        _712 = _718;
    }
    int _720 = _712;
    int _722 = abs(_680);
    float _724 = _530 * _114;
    float _726 = float(_604);
    float _728 = float(_720);
    float _730 = exp2(_724);
    float _732 = as_type<float>(_720);
    float _734 = _530;
    if (!_424)
    {
        float _736 = in.m_39.z;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = float(_710);
    bool _742 = _664 > 0.5;
    bool _744 = _742 && _624;
    float _746 = float(_706);
    float _748 = _740 * _636;
    float _750 = float(_722);
    if (_624)
    {
        _734 = _552;
    }
    float _752 = _734;
    float _754 = _748 * (-2.0);
    float _756 = _746 * _726;
    float _758 = _750 * _728;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _762 = fma(_754, _702, _702);
    float _764 = _756 * (-2.0);
    float _766 = _758 * (-2.0);
    float _768 = _752;
    if (_744)
    {
        float _770 = -_752;
        float _772 = _770 + 1.0;
        _768 = _772;
    }
    float _774 = _768;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _778 = -_730;
    float _780 = _778 + 1.0;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _796 = fma(_764, _700, _700);
    float _798 = _616 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _800;
    float _804 = 0.0;
    float _806 = _738;
    if (!_424)
    {
        _804 = _738;
    }
    float _808 = _804;
    float _810 = 1.0 / _794;
    float _812 = _808;
    if (_424)
    {
        _812 = _420;
    }
    float _814 = _812;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    if (_424)
    {
        _806 = _420;
    }
    float _818 = _806;
    float _820 = _618 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _822 = _790 ? _780 : 0.0;
    float _824 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _826 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _828 = isnan(0.5);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _834 = _830 || _832;
    float _836 = 1.0 / _802;
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _846 = _842 || _844;
    float _848 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _796);
    float _850 = fma(_766, _704, _704);
    float _852 = fma(_614, _766, _614);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _858 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _862 = _400 + _860;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _490 * _836;
    float _870 = _862 * _810;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _876 = _400 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _878;
    out.m_49.x = _872;
    out.m_49.y = _866;
    out.m_49.z = _858;
    float _882 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _884 = _876 * _558;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _888 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _890 = isnan(_400);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_882, _754, _882);
    float _902 = -_898;
    float _904 = _902 + 1.0;
    float _906 = _402 + _420;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _908;
    float _912 = _906 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = fma(_916, _868, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _930 = fma(_920, _868, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _932 = fma(_910, _868, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _942 = fma(_924, _870, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _944 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _946 = fma(_936, _870, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _948 = fma(_940, _870, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _950 = _464 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _944 + _954;
    float _958 = fma(_880, _884, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _950 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = fma(_520, _884, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _970 = fma(_568, _884, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _972 = _962 * _962;
    float _974 = fma(_956, _956, _972);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _978 = fma(_966, _966, _974);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _984 = _486 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _986 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[83].z, _976);
    float _988 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _990 = rsqrt(_978);
    float _992 = -_982;
    float _994 = fma(_984, 2.0, _992);
    float _996 = fma(_824, -2.0, _886);
    float _998 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1000 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _988);
    float _1002 = -_114;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[81].x, _994);
    float _1006 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _996);
    int _1008 = as_type<int>(_904);
    float _1010 = _820;
    if (_690)
    {
        float _1012 = _822 * _578;
        _116 = _1012;
    }
    float _1014 = _116;
    float _1016 = in.m_41.x;
    if (_654)
    {
        bool _1018 = _402 > 0.5;
        _714 = _1018;
    }
    bool _1020 = _714;
    float _1022 = fma(_926, _764, _926);
    bool _1024 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_400);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1038 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1040 = isnan(_400);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_1022, _1014, _848);
    bool _1052 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1054 = isnan(_400);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _962 * _990;
    float _1066 = _956 * _990;
    float _1068 = _966 * _990;
    float _1070 = _1050 * 0.15915493667125701904296875;
    float _1072 = -_1064;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = -_1068;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1088 = _1074 * _1074;
    float _1090 = -_1006;
    float _1092 = fma(_1000, _562, _1090);
    float _1094 = _898 * _1082;
    float _1096 = _1034 * _904;
    float _1098 = fma(_1078, _1078, _1088);
    float _1100 = -_1034;
    float _1102 = _1100 + 1.0;
    float _1104 = -_1066;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1108 = _1070 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = fma(_1086, _1086, _1098);
    float _1114 = _1048 * _1102;
    int _1116 = as_type<int>(_1098);
    float _1118 = _1034;
    float _1120 = _1086;
    if (_654)
    {
        float _1122 = -_1016;
        float _1124 = _1122 + 1.0;
        _1116 = as_type<int>(_1124);
    }
    int _1126 = _1116;
    if (_674)
    {
        float _1128 = -_1016;
        float _1130 = _1128 + 1.0;
        _1008 = as_type<int>(_1130);
    }
    int _1132 = _1008;
    float _1134 = -_1048;
    float _1136 = _1134 + 1.0;
    float _1138 = _928 * _1114;
    float _1140 = _930 * _1114;
    float _1142 = _932 * _1114;
    float _1144 = _420 + (-0.5);
    if (!_654)
    {
        _1118 = _1016;
    }
    float _1146 = _1118;
    float _1148 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1140);
    float _1150 = _1146;
    if (!_674)
    {
        _476 = _1016;
    }
    float _1152 = _476;
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].y, _762);
    float _1156 = _1152;
    if (_654)
    {
        float _1158 = _1020 ? as_type<float>(_1126) : _1016;
        _1150 = _1158;
    }
    float _1160 = _1150;
    float _1162 = fma(_942, _1096, _1148);
    if (_674)
    {
        float _1164 = _546 ? as_type<float>(_1132) : _1016;
        _1156 = _1164;
    }
    float _1166 = _1156;
    float _1168 = fma(_900, _1014, _1154);
    if (!_624)
    {
        _1120 = _552;
    }
    float _1170 = _1120;
    float _1172 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1142);
    float _1174 = _1170;
    if (_624)
    {
        _1174 = _774;
    }
    float _1176 = _1174;
    float _1178 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1180 = _406 + (-0.5);
    float _1182 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1138);
    float _1184 = fma(_948, _1096, _1172);
    float _1186 = fma(_1178, _1176, -0.5);
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _850);
    float _1190 = _1168 * 0.15915493667125701904296875;
    float _1192 = fma(_968, _1094, _1162);
    float _1194 = fma(_998, _1186, _1004);
    float _1196 = fma(_852, _1014, _1188);
    float _1198 = -_1064;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1202 = sqrt(_1112);
    float _1204 = fma(_946, _1096, _1182);
    float _1206 = _1196 * 0.15915493667125701904296875;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1210 = fma(_970, _1094, _1184);
    float _1212 = -_1068;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1216 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1218 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1208);
    float _1220 = _1070 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_958, _1094, _1204);
    float _1226 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1218);
    float _1230 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1192);
    float _1232 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1224);
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1238 = _1190 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _990 * _1202;
    float _1244 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1210);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _708 * _1242;
    float _1250 = _1246 + _1236;
    float _1252 = _1190 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1248 * _816;
    float _1258 = _1206 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1222 * _1240;
    float _1264 = _1110 * _1240;
    float _1266 = _1206 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1110 * _1254;
    float _1272 = _1222 * _1254;
    float _1274 = 1.0 / _1236;
    float _1276 = _1222 * _1260;
    float _1278 = _1254 * _1260;
    float _1280 = _1110 * _1260;
    float _1282 = _1240 * _1260;
    float _1284 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1286 = fma(_1268, _1270, _1262);
    float _1288 = fma(_1268, _1262, _1270);
    float _1290 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1292 = _1284 * _1242;
    float _1294 = -_1264;
    float _1296 = fma(_1268, _1272, _1294);
    float _1298 = _1280 * _1256;
    float _1300 = _1290 * _1242;
    float _1302 = _1292 * _760;
    float _1304 = -_1272;
    float _1306 = fma(_1268, _1264, _1304);
    float _1308 = _1250 * _1274;
    float _1310 = _1308 * 0.5;
    float _1312 = _1300 * _776;
    float _1314 = _1276 * _1256;
    float _1316 = -_1256;
    float _1318 = _1268 * _1316;
    float _1320 = fma(_1286, _1302, _1298);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = fma(_1296, _1302, _1314);
    float _1328 = fma(_1278, _1302, _1318);
    float _1330 = fma(_1306, _1312, _1320);
    float _1332 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1336 = fma(_1282, _1312, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1340 = fma(_1288, _1312, _1326);
    float _1342 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1346 = _1274;
    float _1348 = _1244;
    if (!_846)
    {
        _1344 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1350 = _1344;
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1338);
    float _1354 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1342);
    float _1358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1360 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1356);
    float _1364 = _1350;
    if (!_846)
    {
        float _1366 = -_1350;
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = _952 + _1360;
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1376 = _944 + _1362;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = _1332 * _1334;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1392 = _1382 * _1382;
    float _1394 = _1194 + 0.5;
    float _1396 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1400 = fma(_1388, _1388, _1392);
    float _1402 = _606 * _1358;
    float _1404 = _1358;
    float _1406 = _1376;
    float _1408 = _1372;
    if (!_846)
    {
        _1404 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1410 = _1404;
    float _1412 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = sqrt(_1400);
    float _1422 = _1396 * _1378;
    float _1424 = _1410;
    if (!_846)
    {
        float _1426 = -_1410;
        float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1348 = _1428;
    }
    float _1430 = _1348;
    float _1432 = -_820;
    float _1434 = _1268 * _1432;
    float _1436 = _1280 * _820;
    float _1438 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1374);
    out.m_51.x = _1422;
    out.m_51.y = _1384;
    float _1440 = _1276 * _820;
    float _1442 = 1.0 / _1324;
    float _1444 = _1412 * _1398;
    float _1446 = _1092 + 0.5;
    float _1448 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = fma(_1278, _798, _1434);
    out.m_53.x = _1444;
    out.m_53.y = _1402;
    out.m_53.z = _1394;
    out.m_53.w = _1446;
    float _1456 = _1370;
    float _1458 = _1448;
    if (!_846)
    {
        float _1460 = 1.0 / _1370;
        _1456 = _1460;
    }
    float _1462 = _1456;
    bool _1464 = _1420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = fma(_1286, _798, _1436);
    float _1468 = fma(_1296, _798, _1440);
    out.m_55.x = _1448;
    out.m_55.y = _1450;
    out.m_55.z = _1452;
    out.m_55.w = _1390;
    float _1470 = fma(_1282, _692, _1454);
    float _1472 = fma(_1306, _692, _1466);
    if (_846)
    {
        _1010 = 1.0;
    }
    float _1474 = _1010;
    float _1476 = _1430;
    float _1478 = _1474;
    if (!_846)
    {
        float _1480 = 1.0 / _1430;
        _1476 = _1480;
    }
    float _1482 = _1476;
    if (!_846)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1350;
        float _1488 = fma(_1442, _1484, _1486);
        _1364 = _1488;
    }
    float _1490 = _1364;
    if (!_846)
    {
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1494 = -_1410;
        float _1496 = fma(_1442, _1492, _1494);
        _1424 = _1496;
    }
    float _1498 = _1424;
    float _1500 = fma(_1288, _692, _1468);
    float _1502 = _950 + _1438;
    float _1504 = _1498;
    float _1506 = _1502;
    if (!_846)
    {
        float _1508 = _1490 * _1462;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1478 = _1510;
    }
    float _1512 = _1478;
    if (!_1464)
    {
        _1458 = _1502;
    }
    float _1514 = _1458;
    float _1516 = _1514;
    if (!_846)
    {
        float _1518 = _1498 * _1482;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1464;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1420 + _1528;
        float _1532 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = rsqrt(_1400);
        float _1536 = _1530 * _1526;
        float _1538 = _1536 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1534 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1388, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1382, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1406 = _1558;
        _1516 = _1556;
        _1408 = _1560;
    }
    float _1562 = _1406;
    float _1564 = _1516;
    float _1566 = _1408;
    float _1568 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1572 = _1472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_846)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1066;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1064;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1068;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_846)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_834)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1200 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1106 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_950;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1214 + _1624;
        float _1628 = fma(_1614, _1614, _1622);
        float _1630 = 1.0 / _1242;
        float _1632 = fma(_1626, _1626, _1628);
        float _1634 = sqrt(_1632);
        float _1636 = precise::min(_1634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1616;
        float _1640 = -_944;
        float _1642 = _1640 + _1562;
        float _1644 = _1638 * _1630;
        float _1646 = -_952;
        float _1648 = _1646 + _1566;
        float _1650 = fma(_1642, _1644, _1106);
        float _1652 = fma(_1620, _1644, _1200);
        float _1654 = fma(_1648, _1644, _1214);
        _1596 = _1652;
        _1598 = _1650;
        _1600 = _1654;
    }
    float _1656 = _1596;
    float _1658 = _1598;
    float _1660 = _1600;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1666 = _1512 > 0.0;
    bool _1668 = isnan(_1512);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1680 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1664);
    float _1682 = _1512 * _1606;
    bool _1684 = _1606 <= 0.0;
    bool _1686 = !_1674;
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1678);
    float _1692 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1694 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1680);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1702 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1694);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1706);
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1708);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1724 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1714);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1722);
    float _1734 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1736 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1748 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1750 = _1736 + _1738;
    float _1752 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1660 + _1754;
    float _1758 = _1748 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1658 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1656 + _1764;
    float _1768 = _1750 * 0.5;
    out.m_57.x = _1734;
    out.m_57.y = _1742;
    out.m_57.z = _1744;
    out.m_33.x = _1758;
    out.m_59.x = _1762;
    out.m_59.y = _1766;
    out.m_59.z = _1756;
    out.gl_Position.x = _1746;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1736;
    out.gl_Position.w = _1738;
    out.m_61.z = _1768;
    out.m_61.w = _1738;
    if (!_1688)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

