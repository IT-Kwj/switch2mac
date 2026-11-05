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
    float4 m_53 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
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
    float4 m_43 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1885 = as_type<float>(_96);
        out.gl_Position.z = _1885;
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
        float _1955 = as_type<float>(_134);
        out.gl_Position.z = _1955;
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
    float _356 = _350 * _332;
    float _358 = _352 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
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
    float _402 = in.m_39.z;
    float _404 = in.m_39.w;
    float _406 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _408 = in.m_39.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_41.w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _436 = _434 != 0;
    float _438 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _440 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _442 = in.m_39.y;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _426);
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _448 = _248;
    if (_418)
    {
        float _450 = in.m_39.z;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _456 = _402 * 2.0;
    bool _458 = _404 > 0.5;
    float _460 = in.m_41.z;
    float _462 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
    float _464 = _408 * 2.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _400 + _466;
    float _470 = floor(_456);
    float _472 = 0.0;
    if (!_424)
    {
        float _474 = in.m_39.z;
        _472 = _474;
    }
    float _476 = _472;
    float _478 = -_420;
    float _480 = _478 + 1.0;
    float _482 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = _400 + _484;
    float _488 = -_432;
    float _490 = _488 + 1.0;
    float _492 = _420;
    float _494 = _432;
    float _496 = _476;
    if (_412)
    {
        float _498 = _458 ? _480 : _420;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = floor(_464);
    float _504 = _442 * 2.0;
    bool _506 = _442 > 0.5;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = 0.0;
    float _514 = _442;
    if (!_424)
    {
        _512 = _442;
    }
    float _516 = _512;
    int _518 = _506 ? as_type<int>(_490) : as_type<int>(_432);
    float _520 = floor(_504);
    bool _522 = _470 > 0.0;
    bool _524 = _470 >= 0.0;
    bool _526 = isnan(_470);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = _430 ? as_type<float>(_518) : _432;
    int _536 = _532 ? 0 : 1;
    float _538 = 1.0 / _510;
    bool _540 = _502 >= 0.0;
    bool _542 = isnan(_502);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = _502 > 0.0;
    float _552 = in.m_37.x;
    float _554 = in.m_37.y;
    float _556 = in.m_37.z;
    int _558 = ~_536;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _548 ? 0 : 1;
    int _566 = _562;
    float _568 = _516;
    if (!_522)
    {
        int _570 = ~_536;
        int _572 = _570 + 1;
        _566 = _572;
    }
    int _574 = _566;
    bool _576 = _402 > 0.5;
    float _578 = in.m_43.x;
    float _580 = in.m_43.y;
    float _582 = in.m_43.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    if (_436)
    {
        float _594 = _576 ? _490 : _432;
        _494 = _594;
    }
    float _596 = _494;
    bool _598 = _520 > 0.0;
    bool _600 = _452 > 0.5;
    bool _602 = _600 && _418;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _606 = _592 ? 0 : 1;
    int _608 = ~_564;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = 0.0;
    int _622 = _612;
    int _624 = _618;
    if (_418)
    {
        _620 = _460;
    }
    float _626 = _620;
    float _628 = _368 * _554;
    float _630 = _626;
    if (!_550)
    {
        int _632 = ~_564;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    float _638 = _370 * _556;
    if (!_598)
    {
        int _640 = ~_606;
        int _642 = _640 + 1;
        _624 = _642;
    }
    int _644 = _624;
    if (_602)
    {
        float _646 = -_626;
        float _648 = _646 + 1.0;
        _630 = _648;
    }
    float _650 = _630;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = _366 * _552;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _660 = _658 != 0;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _668 = 0.0;
    if (!_424)
    {
        _668 = _476;
    }
    float _670 = _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    float _676 = _670;
    if (_424)
    {
        _568 = _408;
    }
    float _678 = _568;
    float _680 = 1.0 / _674;
    if (_424)
    {
        _676 = _442;
    }
    float _682 = _676;
    float _684 = _578 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _686 = _684;
    if (_424)
    {
        _496 = _442;
    }
    float _688 = _496;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = 1.0 / _710;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _728 = _580 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _730 = _442 + _402;
    bool _732 = !_696;
    int _734 = _732 ? 0 : 1;
    out.m_45.x = _720;
    out.m_45.y = _722;
    out.m_45.z = _724;
    float _736 = 1.0 / _692;
    bool _738 = !_700;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 + (-1.0);
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    float _754 = _408 + _402;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _764 = _760 || _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _768 = _400 + _766;
    float _770 = _468 * _718;
    float _772 = _446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = fma(_772, _500, -0.5);
    float _780 = _408 + _442;
    float _782 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = _754 + (-1.0);
    float _786 = _780 + (-1.0);
    float _788 = _768 * _680;
    float _790 = _486 * _736;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _812 = _776 * _114;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_798, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _824 = fma(_806, _770, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _826 = exp2(_812);
    float _828 = fma(_810, _770, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_822, _770, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _832;
    float _836 = fma(_802, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_816, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _840 = fma(_834, _790, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _846 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _848 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _854;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _860 = !_704;
    int _862 = _860 ? 0 : 1;
    float _864 = -_826;
    float _866 = _864 + 1.0;
    float _868 = fma(_852, _790, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = fma(_856, _790, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _882 = -_842;
    float _884 = fma(_858, 2.0, _882);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = _878 ? _866 : 0.0;
    float _890 = in.m_47.x;
    float _892 = in.m_47.y;
    float _894 = in.m_47.z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _898 = _462 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _900 = fma(_846, -2.0, _886);
    float _902 = _454 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _904 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].w, _896);
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _908 = _898 + _906;
    int _910 = abs(_734);
    float _912 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _902 + _914;
    float _918 = _908 * _908;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _932 = _912 + _930;
    float _934 = float(_910);
    float _936 = fma(_916, _916, _918);
    float _938 = float(_574);
    float _940 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _848);
    int _942 = abs(_862);
    int _944 = abs(_740);
    float _946 = _934 * _938;
    float _948 = fma(_932, _932, _936);
    float _950 = -_114;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _884);
    float _954 = float(_636);
    float _956 = _946 * (-2.0);
    float _958 = float(_944);
    float _960 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _904);
    float _962 = float(_942);
    float _964 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    float _966 = rsqrt(_948);
    bool _968 = _928;
    float _970 = _960;
    if (_928)
    {
        float _972 = _888 * _538;
        _116 = _972;
    }
    float _974 = _116;
    float _976 = fma(_956, _890, _890);
    float _978 = _408 + (-0.5);
    float _980 = _958 * _954;
    float _982 = fma(_794, _956, _794);
    if (_654)
    {
        bool _984 = _408 > 0.5;
        _968 = _984;
    }
    bool _986 = _968;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    bool _990 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _992 = isnan(_400);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = _980 * (-2.0);
    bool _1004 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1006 = isnan(_400);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_982, _974, _988);
    bool _1018 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1020 = isnan(_400);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = fma(_1002, _892, _892);
    bool _1032 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1034 = isnan(_400);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _442 + (-0.5);
    float _1046 = float(_644);
    float _1048 = fma(_782, _1002, _782);
    float _1050 = _916 * _966;
    float _1052 = -_1042;
    float _1054 = _1052 + 1.0;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1058 = _962 * _1046;
    float _1060 = -_1000;
    float _1062 = _1060 + 1.0;
    float _1064 = _1028 * _1054;
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = _1058 * (-2.0);
    float _1072 = _908 * _966;
    float _1074 = _836 * _1064;
    float _1076 = _818 * _1064;
    float _1078 = _838 * _1064;
    float _1080 = fma(_1048, _974, _1056);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1074);
    float _1088 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1076);
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1078);
    float _1092 = _1080 * 0.15915493667125701904296875;
    float _1094 = fma(_1070, _894, _894);
    float _1096 = _402 + (-0.5);
    float _1098 = -_1050;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1084 * _1084;
    float _1104 = _1014 * _1062;
    float _1106 = -_1014;
    float _1108 = _1106 + 1.0;
    float _1110 = _932 * _966;
    float _1112 = fma(_792, _1070, _792);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1116 = fma(_1100, _1100, _1102);
    float _1118 = _1042 * _1108;
    float _1120 = -_1110;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1124 = fma(_1112, _974, _1114);
    float _1126 = in.m_41.x;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = fma(_1122, _1122, _1116);
    float _1132 = fma(_824, _1118, _1086);
    float _1134 = _1016 * 0.15915493667125701904296875;
    float _1136 = _1124 * 0.15915493667125701904296875;
    float _1138 = _1122;
    int _1140 = as_type<int>(_1116);
    float _1142 = _1042;
    float _1144 = _1070;
    if (!_418)
    {
        _1138 = _460;
    }
    float _1146 = _1138;
    float _1148 = fma(_840, _1104, _1132);
    float _1150 = _1146;
    if (_418)
    {
        _1150 = _650;
    }
    float _1152 = _1150;
    float _1154 = sqrt(_1130);
    float _1156 = fma(_828, _1118, _1088);
    float _1158 = fma(_830, _1118, _1090);
    float _1160 = -_1072;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _898);
    float _1164 = -_964;
    float _1166 = fma(_960, _778, _1164);
    float _1168 = fma(_868, _1104, _1156);
    float _1170 = fma(_880, _1104, _1158);
    float _1172 = -_1050;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1176 = _1134 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1186 = -_1110;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    float _1194 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1148);
    float _1196 = _1134 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1168);
    float _1202 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1170);
    float _1204 = fma(_1184, _1152, -0.5);
    float _1206 = _966 * _1154;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1192);
    float _1210 = _1184;
    float _1212 = _1202;
    if (_654)
    {
        float _1214 = -_1126;
        float _1216 = _1214 + 1.0;
        _1140 = as_type<int>(_1216);
    }
    int _1218 = _1140;
    int _1220 = 0;
    if (_660)
    {
        float _1222 = -_1126;
        float _1224 = _1222 + 1.0;
        _1220 = as_type<int>(_1224);
    }
    int _1226 = _1220;
    float _1228 = _1092 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = fma(_940, _1204, _952);
    float _1234 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_654)
    {
        _1142 = _1126;
    }
    float _1236 = _1142;
    float _1238 = _666 * _1206;
    float _1240 = _1236;
    if (!_660)
    {
        _514 = _1126;
    }
    float _1242 = _514;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1190);
    float _1246 = _1242;
    if (_654)
    {
        float _1248 = _986 ? as_type<float>(_1218) : _1126;
        _1240 = _1248;
    }
    float _1250 = _1240;
    float _1252 = _1092 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    if (_660)
    {
        float _1256 = _506 ? as_type<float>(_1226) : _1126;
        _1246 = _1256;
    }
    float _1258 = _1246;
    float _1260 = _1238 * _664;
    float _1262 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_764)
    {
        _970 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1264 = _970;
    out.m_49.x = _1174;
    out.m_49.y = _1162;
    out.m_49.z = _1188;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1268 = _1262 + _1234;
    float _1270 = _1136 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1178 * _1230;
    float _1276 = _1198 * _1230;
    if (!_764)
    {
        _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1278 = _1210;
    float _1280 = _1278;
    if (!_764)
    {
        float _1282 = -_1264;
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1144 = _1284;
    }
    float _1286 = _1144;
    float _1288 = _1136 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1198 * _1254;
    float _1294 = _1178 * _1254;
    float _1296 = _1254 * _1272;
    float _1298 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = _1198 * _1272;
    float _1302 = 1.0 / _1234;
    float _1304 = _1178 * _1272;
    float _1306 = _1230 * _1272;
    float _1308 = fma(_1290, _1292, _1274);
    float _1310 = fma(_1290, _1274, _1292);
    float _1312 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1314 = _1298 * _1206;
    float _1316 = -_1276;
    float _1318 = fma(_1290, _1294, _1316);
    float _1320 = -_1294;
    float _1322 = fma(_1290, _1276, _1320);
    float _1324 = _1312 * _1206;
    float _1326 = _1314 * _726;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = _1324 * _662;
    float _1332 = _1300 * _1326;
    float _1334 = -_1326;
    float _1336 = _1290 * _1334;
    float _1338 = _1304 * _1326;
    float _1340 = _1268 * _1302;
    float _1342 = _1340 * 0.5;
    float _1344 = fma(_1308, _1260, _1332);
    float _1346 = fma(_1296, _1260, _1336);
    float _1348 = fma(_1318, _1260, _1338);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1350);
    float _1354 = fma(_1322, _1330, _1344);
    float _1356 = fma(_1306, _1330, _1346);
    float _1358 = fma(_1310, _1330, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1366 = _604 * _1328;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1362);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1364);
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1368);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1370);
    float _1378 = _534 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _912 + _1374;
    float _1384 = _902 + _1376;
    float _1386 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1388 = _1266 * _1360;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1384 + _1394;
    float _1398 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1392 * _1392;
    float _1404 = _1304;
    float _1406 = _1384;
    float _1408 = _1382;
    if (!_764)
    {
        float _1410 = -_1278;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1212 = _1412;
    }
    float _1414 = _1212;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1386 * _1372;
    float _1420 = fma(_1396, _1396, _1402);
    float _1422 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1424 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1426 = _1166 + 0.5;
    float _1428 = sqrt(_1420);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1388;
    out.m_51.y = _1366;
    float _1434 = -_728;
    float _1436 = _1290 * _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1440 = _1300 * _728;
    out.m_53.x = _1430;
    out.m_53.y = _1432;
    out.m_53.z = _1416;
    out.m_53.w = _1380;
    float _1442 = 1.0 / _1352;
    float _1444 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1446 = _1378 * _1400;
    float _1448 = _1232 + 0.5;
    float _1450 = _1304 * _728;
    float _1452 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1454 = fma(_1296, _684, _1436);
    float _1456 = fma(_1308, _684, _1440);
    float _1458 = _1286;
    float _1460 = _1444;
    if (!_764)
    {
        float _1462 = 1.0 / _1286;
        _1458 = _1462;
    }
    float _1464 = _1458;
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_55.x = _1418;
    out.m_55.y = _1446;
    out.m_55.z = _1448;
    out.m_55.w = _1426;
    float _1468 = fma(_1318, _684, _1450);
    float _1470 = fma(_1306, _706, _1454);
    float _1472 = fma(_1322, _706, _1456);
    if (_764)
    {
        _686 = 1.0;
    }
    float _1474 = _686;
    float _1476 = fma(_1310, _706, _1468);
    float _1478 = _1414;
    float _1480 = _1474;
    if (!_764)
    {
        float _1482 = 1.0 / _1414;
        _1478 = _1482;
    }
    float _1484 = _1478;
    if (!_764)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1488 = -_1264;
        float _1490 = fma(_1442, _1486, _1488);
        _1460 = _1490;
    }
    float _1492 = _1460;
    if (!_764)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1278;
        float _1498 = fma(_1442, _1494, _1496);
        _1280 = _1498;
    }
    float _1500 = _1280;
    float _1502 = _898 + _1452;
    float _1504 = _1500;
    float _1506 = _1502;
    if (!_764)
    {
        float _1508 = _1492 * _1464;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1480 = _1510;
    }
    float _1512 = _1480;
    if (!_1466)
    {
        _1404 = _1502;
    }
    float _1514 = _1404;
    float _1516 = _1514;
    if (!_764)
    {
        float _1518 = _1500 * _1484;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1466;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1428 + _1528;
        float _1532 = rsqrt(_1420);
        float _1534 = _1530 * _1526;
        float _1536 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1532 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1396, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1392, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    if (_764)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1050;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1072;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1110;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_764)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_752)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1162 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1174 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_898;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1188 + _1624;
        float _1628 = -_902;
        float _1630 = _1628 + _1562;
        float _1632 = -_912;
        float _1634 = _1632 + _1566;
        float _1636 = fma(_1614, _1614, _1622);
        float _1638 = fma(_1626, _1626, _1636);
        float _1640 = 1.0 / _1206;
        float _1642 = sqrt(_1638);
        float _1644 = _1620 * _1640;
        float _1646 = _1630 * _1640;
        float _1648 = _1634 * _1640;
        bool _1650 = _1642 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1652 = isnan(_1642);
        bool _1654 = _1650 || _1652;
        bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1658 = _1654 || _1656;
        float _1660 = precise::min(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1662 = _1660 * _1616;
        float _1664 = fma(_1644, _1662, _1162);
        float _1666 = fma(_1646, _1662, _1174);
        float _1668 = _1586;
        float _1670 = _1620;
        float _1672 = _1662;
        float _1674 = _1630;
        float _1676 = _1664;
        if (_1658)
        {
            float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1668 = _1678;
        }
        float _1680 = _1668;
        if (_1658)
        {
            float _1682 = precise::max(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1670 = _1682;
        }
        float _1684 = _1670;
        float _1686 = fma(_1648, _1662, _1188);
        if (!_1658)
        {
            _1672 = _1666;
        }
        float _1688 = _1672;
        float _1690 = _1680;
        float _1692 = _1688;
        if (_1658)
        {
            float _1694 = _1684 * _1680;
            _1674 = _1694;
        }
        float _1696 = _1674;
        if (!_1658)
        {
            _1690 = _1664;
        }
        float _1698 = _1690;
        float _1700 = _1698;
        if (!_1658)
        {
            _1676 = _1686;
        }
        float _1702 = _1676;
        _1600 = _1702;
        if (_1658)
        {
            float _1704 = fma(_1646, _1696, _1174);
            _1692 = _1704;
        }
        float _1706 = _1692;
        _1598 = _1706;
        if (_1658)
        {
            float _1708 = fma(_1644, _1696, _1162);
            _1700 = _1708;
        }
        float _1710 = _1700;
        _1596 = _1710;
        if (_1658)
        {
            float _1712 = fma(_1648, _1696, _1188);
            _1600 = _1712;
        }
    }
    float _1714 = _1596;
    float _1716 = _1598;
    float _1718 = _1600;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1730 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1732 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1728);
    float _1738 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1740 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1742 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    bool _1766 = _1512 > 0.0;
    bool _1768 = isnan(_1512);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.0);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1778 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1780 = _1512 * _1606;
    float _1782 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1758);
    float _1784 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1764);
    float _1786 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1788 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    bool _1790 = _1606 <= 0.0;
    bool _1792 = !_1774;
    bool _1794 = _1790 || _1792;
    float _1796 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1798 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1800 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1802 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1804 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1806 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1808 = _1786 + _1788;
    float _1810 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1814 = _1716 + _1812;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1820 = _1714 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1824 = _1718 + _1822;
    float _1826 = _1808 * 0.5;
    out.m_57.x = _1798;
    out.m_57.y = _1800;
    out.m_57.z = _1802;
    out.m_33.x = _1816;
    out.m_59.x = _1814;
    out.m_59.y = _1820;
    out.m_59.z = _1824;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1786;
    out.gl_Position.w = _1788;
    out.m_61.z = _1826;
    out.m_61.w = _1788;
    if (!_1794)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1828;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1885 = as_type<float>(_96);
        out.gl_Position.z = _1885;
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
        float _1955 = as_type<float>(_134);
        out.gl_Position.z = _1955;
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
    float _356 = _350 * _332;
    float _358 = _352 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
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
    float _402 = in.m_39.z;
    float _404 = in.m_39.w;
    float _406 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _408 = in.m_39.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_41.w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _436 = _434 != 0;
    float _438 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _440 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _442 = in.m_39.y;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _426);
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _448 = _248;
    if (_418)
    {
        float _450 = in.m_39.z;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _456 = _402 * 2.0;
    bool _458 = _404 > 0.5;
    float _460 = in.m_41.z;
    float _462 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
    float _464 = _408 * 2.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _400 + _466;
    float _470 = floor(_456);
    float _472 = 0.0;
    if (!_424)
    {
        float _474 = in.m_39.z;
        _472 = _474;
    }
    float _476 = _472;
    float _478 = -_420;
    float _480 = _478 + 1.0;
    float _482 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = _400 + _484;
    float _488 = -_432;
    float _490 = _488 + 1.0;
    float _492 = _420;
    float _494 = _432;
    float _496 = _476;
    if (_412)
    {
        float _498 = _458 ? _480 : _420;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = floor(_464);
    float _504 = _442 * 2.0;
    bool _506 = _442 > 0.5;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = 0.0;
    float _514 = _442;
    if (!_424)
    {
        _512 = _442;
    }
    float _516 = _512;
    int _518 = _506 ? as_type<int>(_490) : as_type<int>(_432);
    float _520 = floor(_504);
    bool _522 = _470 > 0.0;
    bool _524 = _470 >= 0.0;
    bool _526 = isnan(_470);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = _430 ? as_type<float>(_518) : _432;
    int _536 = _532 ? 0 : 1;
    float _538 = 1.0 / _510;
    bool _540 = _502 >= 0.0;
    bool _542 = isnan(_502);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = _502 > 0.0;
    float _552 = in.m_37.x;
    float _554 = in.m_37.y;
    float _556 = in.m_37.z;
    int _558 = ~_536;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _548 ? 0 : 1;
    int _566 = _562;
    float _568 = _516;
    if (!_522)
    {
        int _570 = ~_536;
        int _572 = _570 + 1;
        _566 = _572;
    }
    int _574 = _566;
    bool _576 = _402 > 0.5;
    float _578 = in.m_43.x;
    float _580 = in.m_43.y;
    float _582 = in.m_43.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    if (_436)
    {
        float _594 = _576 ? _490 : _432;
        _494 = _594;
    }
    float _596 = _494;
    bool _598 = _520 > 0.0;
    bool _600 = _452 > 0.5;
    bool _602 = _600 && _418;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _606 = _592 ? 0 : 1;
    int _608 = ~_564;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = 0.0;
    int _622 = _612;
    int _624 = _618;
    if (_418)
    {
        _620 = _460;
    }
    float _626 = _620;
    float _628 = _368 * _554;
    float _630 = _626;
    if (!_550)
    {
        int _632 = ~_564;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    float _638 = _370 * _556;
    if (!_598)
    {
        int _640 = ~_606;
        int _642 = _640 + 1;
        _624 = _642;
    }
    int _644 = _624;
    if (_602)
    {
        float _646 = -_626;
        float _648 = _646 + 1.0;
        _630 = _648;
    }
    float _650 = _630;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = _366 * _552;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _660 = _658 != 0;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _668 = 0.0;
    if (!_424)
    {
        _668 = _476;
    }
    float _670 = _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    float _676 = _670;
    if (_424)
    {
        _568 = _408;
    }
    float _678 = _568;
    float _680 = 1.0 / _674;
    if (_424)
    {
        _676 = _442;
    }
    float _682 = _676;
    float _684 = _578 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _686 = _684;
    if (_424)
    {
        _496 = _442;
    }
    float _688 = _496;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = 1.0 / _710;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _728 = _580 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _730 = _442 + _402;
    bool _732 = !_696;
    int _734 = _732 ? 0 : 1;
    out.m_45.x = _720;
    out.m_45.y = _722;
    out.m_45.z = _724;
    float _736 = 1.0 / _692;
    bool _738 = !_700;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 + (-1.0);
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    float _754 = _408 + _402;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _764 = _760 || _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _768 = _400 + _766;
    float _770 = _468 * _718;
    float _772 = _446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = fma(_772, _500, -0.5);
    float _780 = _408 + _442;
    float _782 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = _754 + (-1.0);
    float _786 = _780 + (-1.0);
    float _788 = _768 * _680;
    float _790 = _486 * _736;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _812 = _776 * _114;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_798, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _824 = fma(_806, _770, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _826 = exp2(_812);
    float _828 = fma(_810, _770, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_822, _770, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _832;
    float _836 = fma(_802, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_816, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _840 = fma(_834, _790, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _846 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _848 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _854;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _860 = !_704;
    int _862 = _860 ? 0 : 1;
    float _864 = -_826;
    float _866 = _864 + 1.0;
    float _868 = fma(_852, _790, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = fma(_856, _790, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _882 = -_842;
    float _884 = fma(_858, 2.0, _882);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = _878 ? _866 : 0.0;
    float _890 = in.m_47.x;
    float _892 = in.m_47.y;
    float _894 = in.m_47.z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _898 = _462 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _900 = fma(_846, -2.0, _886);
    float _902 = _454 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _904 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].w, _896);
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _908 = _898 + _906;
    int _910 = abs(_734);
    float _912 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _902 + _914;
    float _918 = _908 * _908;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _932 = _912 + _930;
    float _934 = float(_910);
    float _936 = fma(_916, _916, _918);
    float _938 = float(_574);
    float _940 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _848);
    int _942 = abs(_862);
    int _944 = abs(_740);
    float _946 = _934 * _938;
    float _948 = fma(_932, _932, _936);
    float _950 = -_114;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _884);
    float _954 = float(_636);
    float _956 = _946 * (-2.0);
    float _958 = float(_944);
    float _960 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _904);
    float _962 = float(_942);
    float _964 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    float _966 = rsqrt(_948);
    bool _968 = _928;
    float _970 = _960;
    if (_928)
    {
        float _972 = _888 * _538;
        _116 = _972;
    }
    float _974 = _116;
    float _976 = fma(_956, _890, _890);
    float _978 = _408 + (-0.5);
    float _980 = _958 * _954;
    float _982 = fma(_794, _956, _794);
    if (_654)
    {
        bool _984 = _408 > 0.5;
        _968 = _984;
    }
    bool _986 = _968;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    bool _990 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _992 = isnan(_400);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = _980 * (-2.0);
    bool _1004 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1006 = isnan(_400);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_982, _974, _988);
    bool _1018 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1020 = isnan(_400);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = fma(_1002, _892, _892);
    bool _1032 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1034 = isnan(_400);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _442 + (-0.5);
    float _1046 = float(_644);
    float _1048 = fma(_782, _1002, _782);
    float _1050 = _916 * _966;
    float _1052 = -_1042;
    float _1054 = _1052 + 1.0;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1058 = _962 * _1046;
    float _1060 = -_1000;
    float _1062 = _1060 + 1.0;
    float _1064 = _1028 * _1054;
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = _1058 * (-2.0);
    float _1072 = _908 * _966;
    float _1074 = _836 * _1064;
    float _1076 = _818 * _1064;
    float _1078 = _838 * _1064;
    float _1080 = fma(_1048, _974, _1056);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1074);
    float _1088 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1076);
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1078);
    float _1092 = _1080 * 0.15915493667125701904296875;
    float _1094 = fma(_1070, _894, _894);
    float _1096 = _402 + (-0.5);
    float _1098 = -_1050;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1084 * _1084;
    float _1104 = _1014 * _1062;
    float _1106 = -_1014;
    float _1108 = _1106 + 1.0;
    float _1110 = _932 * _966;
    float _1112 = fma(_792, _1070, _792);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1116 = fma(_1100, _1100, _1102);
    float _1118 = _1042 * _1108;
    float _1120 = -_1110;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1124 = fma(_1112, _974, _1114);
    float _1126 = in.m_41.x;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = fma(_1122, _1122, _1116);
    float _1132 = fma(_824, _1118, _1086);
    float _1134 = _1016 * 0.15915493667125701904296875;
    float _1136 = _1124 * 0.15915493667125701904296875;
    float _1138 = _1122;
    int _1140 = as_type<int>(_1116);
    float _1142 = _1042;
    float _1144 = _1070;
    if (!_418)
    {
        _1138 = _460;
    }
    float _1146 = _1138;
    float _1148 = fma(_840, _1104, _1132);
    float _1150 = _1146;
    if (_418)
    {
        _1150 = _650;
    }
    float _1152 = _1150;
    float _1154 = sqrt(_1130);
    float _1156 = fma(_828, _1118, _1088);
    float _1158 = fma(_830, _1118, _1090);
    float _1160 = -_1072;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _898);
    float _1164 = -_964;
    float _1166 = fma(_960, _778, _1164);
    float _1168 = fma(_868, _1104, _1156);
    float _1170 = fma(_880, _1104, _1158);
    float _1172 = -_1050;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1176 = _1134 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1186 = -_1110;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    float _1194 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1148);
    float _1196 = _1134 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1168);
    float _1202 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1170);
    float _1204 = fma(_1184, _1152, -0.5);
    float _1206 = _966 * _1154;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1192);
    float _1210 = _1184;
    float _1212 = _1202;
    if (_654)
    {
        float _1214 = -_1126;
        float _1216 = _1214 + 1.0;
        _1140 = as_type<int>(_1216);
    }
    int _1218 = _1140;
    int _1220 = 0;
    if (_660)
    {
        float _1222 = -_1126;
        float _1224 = _1222 + 1.0;
        _1220 = as_type<int>(_1224);
    }
    int _1226 = _1220;
    float _1228 = _1092 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = fma(_940, _1204, _952);
    float _1234 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_654)
    {
        _1142 = _1126;
    }
    float _1236 = _1142;
    float _1238 = _666 * _1206;
    float _1240 = _1236;
    if (!_660)
    {
        _514 = _1126;
    }
    float _1242 = _514;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1190);
    float _1246 = _1242;
    if (_654)
    {
        float _1248 = _986 ? as_type<float>(_1218) : _1126;
        _1240 = _1248;
    }
    float _1250 = _1240;
    float _1252 = _1092 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    if (_660)
    {
        float _1256 = _506 ? as_type<float>(_1226) : _1126;
        _1246 = _1256;
    }
    float _1258 = _1246;
    float _1260 = _1238 * _664;
    float _1262 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_764)
    {
        _970 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1264 = _970;
    out.m_49.x = _1174;
    out.m_49.y = _1162;
    out.m_49.z = _1188;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1268 = _1262 + _1234;
    float _1270 = _1136 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1178 * _1230;
    float _1276 = _1198 * _1230;
    if (!_764)
    {
        _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1278 = _1210;
    float _1280 = _1278;
    if (!_764)
    {
        float _1282 = -_1264;
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1144 = _1284;
    }
    float _1286 = _1144;
    float _1288 = _1136 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1198 * _1254;
    float _1294 = _1178 * _1254;
    float _1296 = _1254 * _1272;
    float _1298 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = _1198 * _1272;
    float _1302 = 1.0 / _1234;
    float _1304 = _1178 * _1272;
    float _1306 = _1230 * _1272;
    float _1308 = fma(_1290, _1292, _1274);
    float _1310 = fma(_1290, _1274, _1292);
    float _1312 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1314 = _1298 * _1206;
    float _1316 = -_1276;
    float _1318 = fma(_1290, _1294, _1316);
    float _1320 = -_1294;
    float _1322 = fma(_1290, _1276, _1320);
    float _1324 = _1312 * _1206;
    float _1326 = _1314 * _726;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = _1324 * _662;
    float _1332 = _1300 * _1326;
    float _1334 = -_1326;
    float _1336 = _1290 * _1334;
    float _1338 = _1304 * _1326;
    float _1340 = _1268 * _1302;
    float _1342 = _1340 * 0.5;
    float _1344 = fma(_1308, _1260, _1332);
    float _1346 = fma(_1296, _1260, _1336);
    float _1348 = fma(_1318, _1260, _1338);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1350);
    float _1354 = fma(_1322, _1330, _1344);
    float _1356 = fma(_1306, _1330, _1346);
    float _1358 = fma(_1310, _1330, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1366 = _604 * _1328;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1362);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1364);
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1368);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1370);
    float _1378 = _534 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _912 + _1374;
    float _1384 = _902 + _1376;
    float _1386 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1388 = _1266 * _1360;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1384 + _1394;
    float _1398 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1392 * _1392;
    float _1404 = _1304;
    float _1406 = _1384;
    float _1408 = _1382;
    if (!_764)
    {
        float _1410 = -_1278;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1212 = _1412;
    }
    float _1414 = _1212;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1386 * _1372;
    float _1420 = fma(_1396, _1396, _1402);
    float _1422 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1424 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1426 = _1166 + 0.5;
    float _1428 = sqrt(_1420);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1388;
    out.m_51.y = _1366;
    float _1434 = -_728;
    float _1436 = _1290 * _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1440 = _1300 * _728;
    out.m_53.x = _1430;
    out.m_53.y = _1432;
    out.m_53.z = _1416;
    out.m_53.w = _1380;
    float _1442 = 1.0 / _1352;
    float _1444 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1446 = _1378 * _1400;
    float _1448 = _1232 + 0.5;
    float _1450 = _1304 * _728;
    float _1452 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1454 = fma(_1296, _684, _1436);
    float _1456 = fma(_1308, _684, _1440);
    float _1458 = _1286;
    float _1460 = _1444;
    if (!_764)
    {
        float _1462 = 1.0 / _1286;
        _1458 = _1462;
    }
    float _1464 = _1458;
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_55.x = _1418;
    out.m_55.y = _1446;
    out.m_55.z = _1448;
    out.m_55.w = _1426;
    float _1468 = fma(_1318, _684, _1450);
    float _1470 = fma(_1306, _706, _1454);
    float _1472 = fma(_1322, _706, _1456);
    if (_764)
    {
        _686 = 1.0;
    }
    float _1474 = _686;
    float _1476 = fma(_1310, _706, _1468);
    float _1478 = _1414;
    float _1480 = _1474;
    if (!_764)
    {
        float _1482 = 1.0 / _1414;
        _1478 = _1482;
    }
    float _1484 = _1478;
    if (!_764)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1488 = -_1264;
        float _1490 = fma(_1442, _1486, _1488);
        _1460 = _1490;
    }
    float _1492 = _1460;
    if (!_764)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1278;
        float _1498 = fma(_1442, _1494, _1496);
        _1280 = _1498;
    }
    float _1500 = _1280;
    float _1502 = _898 + _1452;
    float _1504 = _1500;
    float _1506 = _1502;
    if (!_764)
    {
        float _1508 = _1492 * _1464;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1480 = _1510;
    }
    float _1512 = _1480;
    if (!_1466)
    {
        _1404 = _1502;
    }
    float _1514 = _1404;
    float _1516 = _1514;
    if (!_764)
    {
        float _1518 = _1500 * _1484;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1466;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1428 + _1528;
        float _1532 = rsqrt(_1420);
        float _1534 = _1530 * _1526;
        float _1536 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1532 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1396, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1392, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    if (_764)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1050;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1072;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1110;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_764)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_752)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1162 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1174 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_898;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1188 + _1624;
        float _1628 = -_902;
        float _1630 = _1628 + _1562;
        float _1632 = -_912;
        float _1634 = _1632 + _1566;
        float _1636 = fma(_1614, _1614, _1622);
        float _1638 = fma(_1626, _1626, _1636);
        float _1640 = 1.0 / _1206;
        float _1642 = sqrt(_1638);
        float _1644 = _1620 * _1640;
        float _1646 = _1630 * _1640;
        float _1648 = _1634 * _1640;
        bool _1650 = _1642 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1652 = isnan(_1642);
        bool _1654 = _1650 || _1652;
        bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1658 = _1654 || _1656;
        float _1660 = precise::min(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1662 = _1660 * _1616;
        float _1664 = fma(_1644, _1662, _1162);
        float _1666 = fma(_1646, _1662, _1174);
        float _1668 = _1586;
        float _1670 = _1620;
        float _1672 = _1662;
        float _1674 = _1630;
        float _1676 = _1664;
        if (_1658)
        {
            float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1668 = _1678;
        }
        float _1680 = _1668;
        if (_1658)
        {
            float _1682 = precise::max(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1670 = _1682;
        }
        float _1684 = _1670;
        float _1686 = fma(_1648, _1662, _1188);
        if (!_1658)
        {
            _1672 = _1666;
        }
        float _1688 = _1672;
        float _1690 = _1680;
        float _1692 = _1688;
        if (_1658)
        {
            float _1694 = _1684 * _1680;
            _1674 = _1694;
        }
        float _1696 = _1674;
        if (!_1658)
        {
            _1690 = _1664;
        }
        float _1698 = _1690;
        float _1700 = _1698;
        if (!_1658)
        {
            _1676 = _1686;
        }
        float _1702 = _1676;
        _1600 = _1702;
        if (_1658)
        {
            float _1704 = fma(_1646, _1696, _1174);
            _1692 = _1704;
        }
        float _1706 = _1692;
        _1598 = _1706;
        if (_1658)
        {
            float _1708 = fma(_1644, _1696, _1162);
            _1700 = _1708;
        }
        float _1710 = _1700;
        _1596 = _1710;
        if (_1658)
        {
            float _1712 = fma(_1648, _1696, _1188);
            _1600 = _1712;
        }
    }
    float _1714 = _1596;
    float _1716 = _1598;
    float _1718 = _1600;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1730 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1732 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1728);
    float _1738 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1740 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1742 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    bool _1766 = _1512 > 0.0;
    bool _1768 = isnan(_1512);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.0);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1778 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1780 = _1512 * _1606;
    float _1782 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1758);
    float _1784 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1764);
    float _1786 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1788 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    bool _1790 = _1606 <= 0.0;
    bool _1792 = !_1774;
    bool _1794 = _1790 || _1792;
    float _1796 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1798 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1800 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1802 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1804 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1806 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1808 = _1786 + _1788;
    float _1810 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1814 = _1716 + _1812;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1820 = _1714 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1824 = _1718 + _1822;
    float _1826 = _1808 * 0.5;
    out.m_57.x = _1798;
    out.m_57.y = _1800;
    out.m_57.z = _1802;
    out.m_33.x = _1816;
    out.m_59.x = _1814;
    out.m_59.y = _1820;
    out.m_59.z = _1824;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1786;
    out.gl_Position.w = _1788;
    out.m_61.z = _1826;
    out.m_61.w = _1788;
    if (!_1794)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1828;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1885 = as_type<float>(_96);
        out.gl_Position.z = _1885;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1955 = as_type<float>(_134);
        out.gl_Position.z = _1955;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _356 = _350 * _332;
    float _358 = _352 * _332;
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _364 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
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
    float _402 = in.m_39.z;
    float _404 = in.m_39.w;
    float _406 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _408 = in.m_39.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _412 = _410 != 0;
    float _414 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _418 = _416 != 0;
    float _420 = in.m_41.w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_41.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _436 = _434 != 0;
    float _438 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _440 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _414);
    float _442 = in.m_39.y;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _426);
    float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _448 = _248;
    if (_418)
    {
        float _450 = in.m_39.z;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _456 = _402 * 2.0;
    bool _458 = _404 > 0.5;
    float _460 = in.m_41.z;
    float _462 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _440);
    float _464 = _408 * 2.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _400 + _466;
    float _470 = floor(_456);
    float _472 = 0.0;
    if (!_424)
    {
        float _474 = in.m_39.z;
        _472 = _474;
    }
    float _476 = _472;
    float _478 = -_420;
    float _480 = _478 + 1.0;
    float _482 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = _400 + _484;
    float _488 = -_432;
    float _490 = _488 + 1.0;
    float _492 = _420;
    float _494 = _432;
    float _496 = _476;
    if (_412)
    {
        float _498 = _458 ? _480 : _420;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = floor(_464);
    float _504 = _442 * 2.0;
    bool _506 = _442 > 0.5;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = 0.0;
    float _514 = _442;
    if (!_424)
    {
        _512 = _442;
    }
    float _516 = _512;
    int _518 = _506 ? as_type<int>(_490) : as_type<int>(_432);
    float _520 = floor(_504);
    bool _522 = _470 > 0.0;
    bool _524 = _470 >= 0.0;
    bool _526 = isnan(_470);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = _430 ? as_type<float>(_518) : _432;
    int _536 = _532 ? 0 : 1;
    float _538 = 1.0 / _510;
    bool _540 = _502 >= 0.0;
    bool _542 = isnan(_502);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = _502 > 0.0;
    float _552 = in.m_37.x;
    float _554 = in.m_37.y;
    float _556 = in.m_37.z;
    int _558 = ~_536;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _548 ? 0 : 1;
    int _566 = _562;
    float _568 = _516;
    if (!_522)
    {
        int _570 = ~_536;
        int _572 = _570 + 1;
        _566 = _572;
    }
    int _574 = _566;
    bool _576 = _402 > 0.5;
    float _578 = in.m_43.x;
    float _580 = in.m_43.y;
    float _582 = in.m_43.z;
    bool _584 = _520 >= 0.0;
    bool _586 = isnan(_520);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    if (_436)
    {
        float _594 = _576 ? _490 : _432;
        _494 = _594;
    }
    float _596 = _494;
    bool _598 = _520 > 0.0;
    bool _600 = _452 > 0.5;
    bool _602 = _600 && _418;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _606 = _592 ? 0 : 1;
    int _608 = ~_564;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = 0.0;
    int _622 = _612;
    int _624 = _618;
    if (_418)
    {
        _620 = _460;
    }
    float _626 = _620;
    float _628 = _368 * _554;
    float _630 = _626;
    if (!_550)
    {
        int _632 = ~_564;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    float _638 = _370 * _556;
    if (!_598)
    {
        int _640 = ~_606;
        int _642 = _640 + 1;
        _624 = _642;
    }
    int _644 = _624;
    if (_602)
    {
        float _646 = -_626;
        float _648 = _646 + 1.0;
        _630 = _648;
    }
    float _650 = _630;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = _366 * _552;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _660 = _658 != 0;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _668 = 0.0;
    if (!_424)
    {
        _668 = _476;
    }
    float _670 = _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    float _676 = _670;
    if (_424)
    {
        _568 = _408;
    }
    float _678 = _568;
    float _680 = 1.0 / _674;
    if (_424)
    {
        _676 = _442;
    }
    float _682 = _676;
    float _684 = _578 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _686 = _684;
    if (_424)
    {
        _496 = _442;
    }
    float _688 = _496;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _704 = _702 != 0;
    float _706 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _718 = 1.0 / _710;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _728 = _580 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _730 = _442 + _402;
    bool _732 = !_696;
    int _734 = _732 ? 0 : 1;
    out.m_45.x = _720;
    out.m_45.y = _722;
    out.m_45.z = _724;
    float _736 = 1.0 / _692;
    bool _738 = !_700;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 + (-1.0);
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    float _754 = _408 + _402;
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _764 = _760 || _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _768 = _400 + _766;
    float _770 = _468 * _718;
    float _772 = _446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = fma(_772, _500, -0.5);
    float _780 = _408 + _442;
    float _782 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = _754 + (-1.0);
    float _786 = _780 + (-1.0);
    float _788 = _768 * _680;
    float _790 = _486 * _736;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _812 = _776 * _114;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_798, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _824 = fma(_806, _770, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _826 = exp2(_812);
    float _828 = fma(_810, _770, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_822, _770, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _832;
    float _836 = fma(_802, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_816, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _840 = fma(_834, _790, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _846 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _848 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _854;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _860 = !_704;
    int _862 = _860 ? 0 : 1;
    float _864 = -_826;
    float _866 = _864 + 1.0;
    float _868 = fma(_852, _790, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = fma(_856, _790, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _882 = -_842;
    float _884 = fma(_858, 2.0, _882);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = _878 ? _866 : 0.0;
    float _890 = in.m_47.x;
    float _892 = in.m_47.y;
    float _894 = in.m_47.z;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _898 = _462 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _900 = fma(_846, -2.0, _886);
    float _902 = _454 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _904 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].w, _896);
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _908 = _898 + _906;
    int _910 = abs(_734);
    float _912 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _916 = _902 + _914;
    float _918 = _908 * _908;
    bool _920 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _922 = isnan(1.0);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _928 = _924 || _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _932 = _912 + _930;
    float _934 = float(_910);
    float _936 = fma(_916, _916, _918);
    float _938 = float(_574);
    float _940 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _848);
    int _942 = abs(_862);
    int _944 = abs(_740);
    float _946 = _934 * _938;
    float _948 = fma(_932, _932, _936);
    float _950 = -_114;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _884);
    float _954 = float(_636);
    float _956 = _946 * (-2.0);
    float _958 = float(_944);
    float _960 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _904);
    float _962 = float(_942);
    float _964 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    float _966 = rsqrt(_948);
    bool _968 = _928;
    float _970 = _960;
    if (_928)
    {
        float _972 = _888 * _538;
        _116 = _972;
    }
    float _974 = _116;
    float _976 = fma(_956, _890, _890);
    float _978 = _408 + (-0.5);
    float _980 = _958 * _954;
    float _982 = fma(_794, _956, _794);
    if (_654)
    {
        bool _984 = _408 > 0.5;
        _968 = _984;
    }
    bool _986 = _968;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    bool _990 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _992 = isnan(_400);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = _980 * (-2.0);
    bool _1004 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1006 = isnan(_400);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_982, _974, _988);
    bool _1018 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1020 = isnan(_400);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = fma(_1002, _892, _892);
    bool _1032 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1034 = isnan(_400);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _442 + (-0.5);
    float _1046 = float(_644);
    float _1048 = fma(_782, _1002, _782);
    float _1050 = _916 * _966;
    float _1052 = -_1042;
    float _1054 = _1052 + 1.0;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1058 = _962 * _1046;
    float _1060 = -_1000;
    float _1062 = _1060 + 1.0;
    float _1064 = _1028 * _1054;
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = _1058 * (-2.0);
    float _1072 = _908 * _966;
    float _1074 = _836 * _1064;
    float _1076 = _818 * _1064;
    float _1078 = _838 * _1064;
    float _1080 = fma(_1048, _974, _1056);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1074);
    float _1088 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1076);
    float _1090 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1078);
    float _1092 = _1080 * 0.15915493667125701904296875;
    float _1094 = fma(_1070, _894, _894);
    float _1096 = _402 + (-0.5);
    float _1098 = -_1050;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _916);
    float _1102 = _1084 * _1084;
    float _1104 = _1014 * _1062;
    float _1106 = -_1014;
    float _1108 = _1106 + 1.0;
    float _1110 = _932 * _966;
    float _1112 = fma(_792, _1070, _792);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1116 = fma(_1100, _1100, _1102);
    float _1118 = _1042 * _1108;
    float _1120 = -_1110;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1124 = fma(_1112, _974, _1114);
    float _1126 = in.m_41.x;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = fma(_1122, _1122, _1116);
    float _1132 = fma(_824, _1118, _1086);
    float _1134 = _1016 * 0.15915493667125701904296875;
    float _1136 = _1124 * 0.15915493667125701904296875;
    float _1138 = _1122;
    int _1140 = as_type<int>(_1116);
    float _1142 = _1042;
    float _1144 = _1070;
    if (!_418)
    {
        _1138 = _460;
    }
    float _1146 = _1138;
    float _1148 = fma(_840, _1104, _1132);
    float _1150 = _1146;
    if (_418)
    {
        _1150 = _650;
    }
    float _1152 = _1150;
    float _1154 = sqrt(_1130);
    float _1156 = fma(_828, _1118, _1088);
    float _1158 = fma(_830, _1118, _1090);
    float _1160 = -_1072;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _898);
    float _1164 = -_964;
    float _1166 = fma(_960, _778, _1164);
    float _1168 = fma(_868, _1104, _1156);
    float _1170 = fma(_880, _1104, _1158);
    float _1172 = -_1050;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1176 = _1134 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1186 = -_1110;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    float _1194 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1148);
    float _1196 = _1134 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1168);
    float _1202 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1170);
    float _1204 = fma(_1184, _1152, -0.5);
    float _1206 = _966 * _1154;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1192);
    float _1210 = _1184;
    float _1212 = _1202;
    if (_654)
    {
        float _1214 = -_1126;
        float _1216 = _1214 + 1.0;
        _1140 = as_type<int>(_1216);
    }
    int _1218 = _1140;
    int _1220 = 0;
    if (_660)
    {
        float _1222 = -_1126;
        float _1224 = _1222 + 1.0;
        _1220 = as_type<int>(_1224);
    }
    int _1226 = _1220;
    float _1228 = _1092 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = fma(_940, _1204, _952);
    float _1234 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (!_654)
    {
        _1142 = _1126;
    }
    float _1236 = _1142;
    float _1238 = _666 * _1206;
    float _1240 = _1236;
    if (!_660)
    {
        _514 = _1126;
    }
    float _1242 = _514;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1190);
    float _1246 = _1242;
    if (_654)
    {
        float _1248 = _986 ? as_type<float>(_1218) : _1126;
        _1240 = _1248;
    }
    float _1250 = _1240;
    float _1252 = _1092 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    if (_660)
    {
        float _1256 = _506 ? as_type<float>(_1226) : _1126;
        _1246 = _1256;
    }
    float _1258 = _1246;
    float _1260 = _1238 * _664;
    float _1262 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_764)
    {
        _970 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1264 = _970;
    out.m_49.x = _1174;
    out.m_49.y = _1162;
    out.m_49.z = _1188;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1268 = _1262 + _1234;
    float _1270 = _1136 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1178 * _1230;
    float _1276 = _1198 * _1230;
    if (!_764)
    {
        _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1278 = _1210;
    float _1280 = _1278;
    if (!_764)
    {
        float _1282 = -_1264;
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1144 = _1284;
    }
    float _1286 = _1144;
    float _1288 = _1136 * 6.283185482025146484375;
    float _1290 = sin(_1288);
    float _1292 = _1198 * _1254;
    float _1294 = _1178 * _1254;
    float _1296 = _1254 * _1272;
    float _1298 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = _1198 * _1272;
    float _1302 = 1.0 / _1234;
    float _1304 = _1178 * _1272;
    float _1306 = _1230 * _1272;
    float _1308 = fma(_1290, _1292, _1274);
    float _1310 = fma(_1290, _1274, _1292);
    float _1312 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1314 = _1298 * _1206;
    float _1316 = -_1276;
    float _1318 = fma(_1290, _1294, _1316);
    float _1320 = -_1294;
    float _1322 = fma(_1290, _1276, _1320);
    float _1324 = _1312 * _1206;
    float _1326 = _1314 * _726;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = _1324 * _662;
    float _1332 = _1300 * _1326;
    float _1334 = -_1326;
    float _1336 = _1290 * _1334;
    float _1338 = _1304 * _1326;
    float _1340 = _1268 * _1302;
    float _1342 = _1340 * 0.5;
    float _1344 = fma(_1308, _1260, _1332);
    float _1346 = fma(_1296, _1260, _1336);
    float _1348 = fma(_1318, _1260, _1338);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1350);
    float _1354 = fma(_1322, _1330, _1344);
    float _1356 = fma(_1306, _1330, _1346);
    float _1358 = fma(_1310, _1330, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1366 = _604 * _1328;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1362);
    float _1370 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1364);
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1368);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1370);
    float _1378 = _534 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _912 + _1374;
    float _1384 = _902 + _1376;
    float _1386 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1388 = _1266 * _1360;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1396 = _1384 + _1394;
    float _1398 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1392 * _1392;
    float _1404 = _1304;
    float _1406 = _1384;
    float _1408 = _1382;
    if (!_764)
    {
        float _1410 = -_1278;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1212 = _1412;
    }
    float _1414 = _1212;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1386 * _1372;
    float _1420 = fma(_1396, _1396, _1402);
    float _1422 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1424 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1426 = _1166 + 0.5;
    float _1428 = sqrt(_1420);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1388;
    out.m_51.y = _1366;
    float _1434 = -_728;
    float _1436 = _1290 * _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1440 = _1300 * _728;
    out.m_53.x = _1430;
    out.m_53.y = _1432;
    out.m_53.z = _1416;
    out.m_53.w = _1380;
    float _1442 = 1.0 / _1352;
    float _1444 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1446 = _1378 * _1400;
    float _1448 = _1232 + 0.5;
    float _1450 = _1304 * _728;
    float _1452 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1454 = fma(_1296, _684, _1436);
    float _1456 = fma(_1308, _684, _1440);
    float _1458 = _1286;
    float _1460 = _1444;
    if (!_764)
    {
        float _1462 = 1.0 / _1286;
        _1458 = _1462;
    }
    float _1464 = _1458;
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_55.x = _1418;
    out.m_55.y = _1446;
    out.m_55.z = _1448;
    out.m_55.w = _1426;
    float _1468 = fma(_1318, _684, _1450);
    float _1470 = fma(_1306, _706, _1454);
    float _1472 = fma(_1322, _706, _1456);
    if (_764)
    {
        _686 = 1.0;
    }
    float _1474 = _686;
    float _1476 = fma(_1310, _706, _1468);
    float _1478 = _1414;
    float _1480 = _1474;
    if (!_764)
    {
        float _1482 = 1.0 / _1414;
        _1478 = _1482;
    }
    float _1484 = _1478;
    if (!_764)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1488 = -_1264;
        float _1490 = fma(_1442, _1486, _1488);
        _1460 = _1490;
    }
    float _1492 = _1460;
    if (!_764)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1278;
        float _1498 = fma(_1442, _1494, _1496);
        _1280 = _1498;
    }
    float _1500 = _1280;
    float _1502 = _898 + _1452;
    float _1504 = _1500;
    float _1506 = _1502;
    if (!_764)
    {
        float _1508 = _1492 * _1464;
        float _1510 = precise::clamp(_1508, 0.0, 1.0);
        _1480 = _1510;
    }
    float _1512 = _1480;
    if (!_1466)
    {
        _1404 = _1502;
    }
    float _1514 = _1404;
    float _1516 = _1514;
    if (!_764)
    {
        float _1518 = _1500 * _1484;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1504 = _1520;
    }
    float _1522 = _1504;
    bool _1524 = !_1466;
    if (!_1524)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1428 + _1528;
        float _1532 = rsqrt(_1420);
        float _1534 = _1530 * _1526;
        float _1536 = _1502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1546, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = _1532 * _1550;
        float _1556 = fma(_1502, _1542, _1552);
        float _1558 = fma(_1396, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1392, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
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
    if (_764)
    {
        _1506 = 1.0;
    }
    float _1574 = _1506;
    float _1576 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1578 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1570);
    float _1580 = -_1050;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1584 = -_1072;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1588 = -_1110;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1592 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1572);
    float _1594 = _1574;
    float _1596 = _1586;
    float _1598 = _1582;
    float _1600 = _1590;
    if (!_764)
    {
        float _1602 = -_1522;
        float _1604 = _1602 + 1.0;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_752)
    {
        float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1610 = _1162 + _1608;
        float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1614 = _1174 + _1612;
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1618 = -_898;
        float _1620 = _1618 + _1564;
        float _1622 = _1610 * _1610;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1626 = _1188 + _1624;
        float _1628 = -_902;
        float _1630 = _1628 + _1562;
        float _1632 = -_912;
        float _1634 = _1632 + _1566;
        float _1636 = fma(_1614, _1614, _1622);
        float _1638 = fma(_1626, _1626, _1636);
        float _1640 = 1.0 / _1206;
        float _1642 = sqrt(_1638);
        float _1644 = _1620 * _1640;
        float _1646 = _1630 * _1640;
        float _1648 = _1634 * _1640;
        bool _1650 = _1642 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1652 = isnan(_1642);
        bool _1654 = _1650 || _1652;
        bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1658 = _1654 || _1656;
        float _1660 = precise::min(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1662 = _1660 * _1616;
        float _1664 = fma(_1644, _1662, _1162);
        float _1666 = fma(_1646, _1662, _1174);
        float _1668 = _1586;
        float _1670 = _1620;
        float _1672 = _1662;
        float _1674 = _1630;
        float _1676 = _1664;
        if (_1658)
        {
            float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1668 = _1678;
        }
        float _1680 = _1668;
        if (_1658)
        {
            float _1682 = precise::max(_1642, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1670 = _1682;
        }
        float _1684 = _1670;
        float _1686 = fma(_1648, _1662, _1188);
        if (!_1658)
        {
            _1672 = _1666;
        }
        float _1688 = _1672;
        float _1690 = _1680;
        float _1692 = _1688;
        if (_1658)
        {
            float _1694 = _1684 * _1680;
            _1674 = _1694;
        }
        float _1696 = _1674;
        if (!_1658)
        {
            _1690 = _1664;
        }
        float _1698 = _1690;
        float _1700 = _1698;
        if (!_1658)
        {
            _1676 = _1686;
        }
        float _1702 = _1676;
        _1600 = _1702;
        if (_1658)
        {
            float _1704 = fma(_1646, _1696, _1174);
            _1692 = _1704;
        }
        float _1706 = _1692;
        _1598 = _1706;
        if (_1658)
        {
            float _1708 = fma(_1644, _1696, _1162);
            _1700 = _1708;
        }
        float _1710 = _1700;
        _1596 = _1710;
        if (_1658)
        {
            float _1712 = fma(_1648, _1696, _1188);
            _1600 = _1712;
        }
    }
    float _1714 = _1596;
    float _1716 = _1598;
    float _1718 = _1600;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1730 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1732 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1728);
    float _1738 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1740 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1742 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    bool _1766 = _1512 > 0.0;
    bool _1768 = isnan(_1512);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.0);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1778 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1780 = _1512 * _1606;
    float _1782 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1758);
    float _1784 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1764);
    float _1786 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1788 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    bool _1790 = _1606 <= 0.0;
    bool _1792 = !_1774;
    bool _1794 = _1790 || _1792;
    float _1796 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1782);
    float _1798 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1576);
    float _1800 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1578);
    float _1802 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1592);
    float _1804 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1806 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1808 = _1786 + _1788;
    float _1810 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1814 = _1716 + _1812;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1820 = _1714 + _1818;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1824 = _1718 + _1822;
    float _1826 = _1808 * 0.5;
    out.m_57.x = _1798;
    out.m_57.y = _1800;
    out.m_57.z = _1802;
    out.m_33.x = _1816;
    out.m_59.x = _1814;
    out.m_59.y = _1820;
    out.m_59.z = _1824;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1786;
    out.gl_Position.w = _1788;
    out.m_61.z = _1826;
    out.m_61.w = _1788;
    if (!_1794)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1828;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

