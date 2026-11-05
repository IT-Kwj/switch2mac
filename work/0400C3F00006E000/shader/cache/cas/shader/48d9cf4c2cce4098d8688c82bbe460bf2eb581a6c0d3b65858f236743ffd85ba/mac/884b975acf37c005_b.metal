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
    float4 m_53 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_47 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _760 = false;
    bool _652 = false;
    bool _416 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    float _86 = as_type<float>(_78);
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _88 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1860 = as_type<float>(_94);
        out.gl_Position.z = _1860;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_35.w;
    float _100 = float(_78);
    float _102 = in.m_37.w;
    float _104 = 1.0 / _100;
    float _106 = -_98;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_98);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = in.m_37.z;
    float _122 = _108 * _104;
    bool _124 = _108 >= _100;
    bool _126 = !_118;
    bool _128 = _124 || _126;
    out.m_39.w = _102;
    out.m_41.x = _122;
    if (_128)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _86;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _96 = as_type<int>(_132);
    }
    int _134 = _96;
    out.m_39.z = _120;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_134);
        out.gl_Position.z = _1938;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_43.w;
    float _138 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _202;
        _182 = _214;
        _184 = _204;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _226 = _234;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _226;
    float _252 = _164;
    float _254 = _248;
    float _256 = _250;
    if (!_148)
    {
        float _258 = _108 * _108;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = _262;
    if (!_148)
    {
        _256 = _108;
    }
    float _266 = _256;
    float _268 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_148)
    {
        float _274 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_148;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _108 * _284;
        float _294 = exp2(_292);
        float _296 = _290 * 0.693147182464599609375;
        float _298 = 1.0 / _296;
        float _300 = 1.0 / _288;
        float _302 = _294 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _298, _108);
        float _308 = _306 * _300;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_148;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _108 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = fma(_252, _150, _268);
    float _340 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = fma(_252, _152, _270);
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _348 = fma(_336, _152, _340);
    float _350 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_336, _150, _344);
    float _356 = -_348;
    float _358 = _342 + _356;
    float _360 = fma(_252, _154, _350);
    float _362 = fma(_336, _154, _352);
    float _364 = fma(_338, _136, _156);
    float _366 = -_354;
    float _368 = _338 + _366;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _376 = -_362;
    float _378 = _360 + _376;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _374);
    float _386 = fma(_342, _136, _158);
    float _388 = fma(_360, _136, _160);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_37.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _122;
    }
    _416 = false;
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _418 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _418 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _418 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _440;
    float _444 = 1.0 / _442;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _448 = 1.0 / _438;
    bool _450 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _452 = isnan(_418);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _434;
    float _464 = _426 * _444;
    bool _466 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_418);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _422 * _448;
    bool _480 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _482 = isnan(_418);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = -_490;
    float _498 = _496 + 1.0;
    float _500 = _430 * _462;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _476 * _498;
    float _512 = -_476;
    float _514 = _512 + 1.0;
    float _516 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = fma(_508, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _520 = fma(_494, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _522 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _524 = isnan(_418);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _460 * _514;
    float _536 = -_460;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _532 * _538;
    float _554 = fma(_542, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _516 * _552;
    float _562 = _518 * _552;
    float _564 = _520 * _552;
    float _566 = -_532;
    float _568 = _566 + 1.0;
    float _570 = in.m_43.x;
    float _572 = in.m_43.y;
    float _574 = in.m_43.z;
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _596 = fma(_584, _464, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_588, _464, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_592, _464, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_554, _534, _576);
    float _604 = fma(_556, _534, _580);
    float _606 = fma(_558, _534, _578);
    float _608 = fma(_596, _510, _602);
    float _610 = fma(_600, _510, _604);
    float _612 = fma(_598, _510, _606);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].x, _608);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].y, _610);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].z, _612);
    float _620 = _390 * _594;
    float _622 = _392 * _594;
    float _624 = _394 * _594;
    float _626 = _614 * _570;
    float _628 = _616 * _572;
    float _630 = _618 * _574;
    bool _632 = !_446;
    float _650;
    if (!_632)
    {
        float _634 = in.m_37.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _122;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _658 = _654 + _656;
    bool _660 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _662 = isnan(_654);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    bool _676 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _678 = isnan(_654);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_670;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _692;
    float _696 = 1.0 / _674;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = _686 * _690;
    float _702 = -_686;
    float _704 = _702 + 1.0;
    float _706 = _658 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _708;
    float _712 = fma(_694, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _720 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = _712 * _700;
    float _724 = _720 * _700;
    float _726 = _718 * _700;
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _734 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].x, _728);
    float _736 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].y, _730);
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].z, _732);
    bool _740 = !_698;
    float _758;
    if (!_740)
    {
        float _742 = in.m_37.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        _758 = _122;
    }
    _760 = false;
    float _762 = _758;
    float _764 = in.m_45.y;
    float _766 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _770 = _768 != 0;
    float _772 = in.m_37.x;
    float _774 = in.m_37.y;
    float _776 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _766);
    float _784 = in.m_45.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _792 = 1.0 / _780;
    float _794 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _796 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _800 = _798 != 0;
    float _802 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _804 = _464;
    if (_770)
    {
        float _806 = in.m_37.x;
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _814 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _818 = _810 + _816;
    float _820 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    bool _822 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -_764;
    float _836 = _834 + 1.0;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _814 + _842;
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = _774 > 0.5;
    float _850 = _840 * _792;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _854 = _762 + _852;
    float _856 = -_810;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _764;
    if (_788)
    {
        float _862 = _848 ? _836 : _764;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = -_832;
    float _868 = _866 + 1.0;
    float _870 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _872 = fma(_850, _854, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_814;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _858 * _858;
    float _880 = 0.0;
    float _882 = _864;
    float _884 = _784;
    if (_770)
    {
        _880 = _784;
    }
    float _886 = _880;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _890 = _808 > 0.5;
    bool _892 = _890 && _770;
    float _894 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].x, _846);
    bool _896 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_762);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_870;
    float _910 = _908 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = fma(_876, _876, _878);
    float _914 = in.m_47.z;
    float _916 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _918 = _906 * _868;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _922 = _870 + _920;
    float _924 = fma(_910, _910, _912);
    float _926 = _912;
    float _928 = _886;
    if (!_770)
    {
        _926 = _784;
    }
    float _930 = _926;
    float _932 = in.m_47.x;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[28].z, _894);
    float _936 = _930;
    if (_892)
    {
        float _938 = -_886;
        float _940 = _938 + 1.0;
        _928 = _940;
    }
    float _942 = _928;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _946 = in.m_47.y;
    float _948 = _872 * _918;
    float _950 = -_906;
    float _952 = _950 + 1.0;
    float _954 = _942;
    if (_770)
    {
        _936 = _942;
    }
    float _956 = _936;
    float _958 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _960 = _934 >= 0.0;
    float _962 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _948);
    float _964 = _894;
    if (_800)
    {
        float _966 = rsqrt(_924);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _972 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = _970 * _888;
    float _976 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _978 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _980 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _958 * _944;
    float _984 = _888;
    float _986 = _978;
    if (_960)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _882;
    float _990 = _978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _992 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _994 = _976 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _974;
    out.m_49.y = _982;
    int _996 = as_type<int>(_988);
    if (_960)
    {
        float _998 = _988 * 5.0;
        _996 = as_type<int>(_998);
    }
    int _1000 = _996;
    float _1002 = _968;
    if (_800)
    {
        float _1004 = _968 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _954 = _1004;
    }
    float _1006 = _954;
    if (!_800)
    {
        _984 = 0.0;
        _884 = 0.0;
    }
    float _1008 = _984;
    float _1010 = _884;
    out.m_51.z = _914;
    float _1012 = _1008;
    float _1014 = _1010;
    if (!_800)
    {
        _1002 = 0.0;
    }
    float _1016 = _1002;
    float _1018 = _1016;
    if (_800)
    {
        float _1020 = _876 * _1006;
        _1012 = _1020;
    }
    float _1022 = _1012;
    if (_800)
    {
        float _1024 = _858 * _1006;
        _1018 = _1024;
    }
    float _1026 = _1018;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_1000);
        out.gl_Position.z = _3359;
    }
    out.m_51.x = _932;
    out.m_51.y = _946;
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    if (_960)
    {
        out.m_33.x = 0.0;
    }
    if (_960)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1028 = _810 + _1026;
    if (_800)
    {
        float _1030 = _910 * _1006;
        _1014 = _1030;
    }
    float _1032 = _1014;
    float _1034 = _814 + _1022;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = _1028 + _1036;
    float _1040 = _870 + _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1044 = _1034 + _1042;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1050 = _1040 + _1048;
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1046);
    float _1056 = fma(_108, 0.300000011920928955078125, -1.0);
    float _1058 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1052);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1054);
    float _1062 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1064 = sqrt(_924);
    bool _1066 = _1060 >= 0.0;
    float _1068 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1070 = _1056 * 0.15915493667125701904296875;
    float _1072 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1074 = _772 * 0.550000011920928955078125;
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1062);
    float _1078 = _122 * _122;
    float _1080 = _1070 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1086 = abs(_122);
    float _1088 = _1086 * _1078;
    float _1090 = in.m_55.x;
    float _1092 = in.m_55.y;
    float _1094 = in.m_55.z;
    if (_1066)
    {
        _986 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1096 = _986;
    float _1098 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1058);
    float _1100 = rint(_1074);
    int _1102 = as_type<int>(_1096);
    if (_1066)
    {
        float _1104 = _1096 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1066)
    {
        out.m_33.x = 0.0;
    }
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1106);
        out.gl_Position.z = _3534;
    }
    float _1108 = rsqrt(_1084);
    float _1110 = fma(_1064, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    if (_1066)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1114 = fma(_1112, -2.0, 3.0);
    float _1116 = _1112 * _1112;
    float _1118 = fma(_1082, -0.02999999932944774627685546875, 1.0);
    float _1120 = fma(_1082, -0.100000001490116119384765625, 0.5);
    float _1122 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1072);
    float _1124 = _1114 * _1116;
    float _1126 = -_914;
    float _1128 = _1126 + _932;
    float _1130 = rsqrt(_1098);
    float _1132 = -_1118;
    float _1134 = _1132 + _1120;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1138 = -_1124;
    float _1140 = _1138 + 0.5;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, _1134, _1118);
    float _1148 = _1124 * _1128;
    float _1150 = fma(_1088, _1140, 1.0);
    float _1152 = abs(_122);
    float _1154 = log2(_1152);
    float _1156 = fma(_1136, _1144, 1.0);
    float _1158 = _102 * 78.233001708984375;
    float _1160 = _1146 * _1090;
    float _1162 = _1146 * _1092;
    float _1164 = _1146 * _1094;
    float _1166 = _1148 * 0.0599999986588954925537109375;
    float _1168 = _1150 * _1156;
    float _1170 = rsqrt(_1122);
    float _1172 = fma(_932, 12.98980045318603515625, _1158);
    float _1174 = _1160 * _1108;
    float _1176 = _1166 * _1108;
    float _1178 = fma(_914, 12.98980045318603515625, _1158);
    float _1180 = _1172 * 0.15915493667125701904296875;
    float _1182 = _1162 * _1130;
    float _1184 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1192 = _1154 * 0.800000011920928955078125;
    float _1194 = _1186 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1164 * _1170;
    float _1200 = fma(_1174, _1168, _1176);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1190);
    float _1204 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1188);
    float _1206 = _1198 * _1168;
    float _1208 = _1182 * _1168;
    float _1210 = exp2(_1192);
    float _1212 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1200);
    float _1218 = _1180 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1208);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1206);
    float _1228 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1222);
    float _1230 = _1196 * 43758.546875;
    float _1232 = rsqrt(_1204);
    float _1234 = fma(12.0, _772, 24.0);
    float _1236 = fma(_774, 6.0, 12.0);
    float _1238 = fma(2.0, _772, -1.0);
    float _1240 = fma(_774, 2.0, -1.0);
    float _1242 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1228);
    float _1244 = _1210 * _1234;
    float _1246 = _1210 * _1236;
    float _1248 = floor(_1230);
    float _1250 = _1220 * 43758.546875;
    float _1252 = fma(_946, 12.98980045318603515625, _1158);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1246 * _946;
    float _1258 = _1244 * _932;
    float _1260 = _1154 * 0.5;
    float _1262 = fma(_1254, -0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    float _1266 = _1232 * _1238;
    float _1268 = floor(_1250);
    float _1270 = _620 * _1256;
    float _1272 = _624 * _1256;
    float _1274 = _1226 * _1212;
    float _1276 = fma(_620, _1258, _1270);
    float _1278 = _1264 * _1264;
    float _1280 = fma(_1264, -2.0, 3.0);
    float _1282 = rsqrt(_1214);
    float _1284 = -_1248;
    float _1286 = _1230 + _1284;
    float _1288 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_624, _1258, _1272);
    float _1294 = _1224 * _1288;
    float _1296 = _1252 * 0.15915493667125701904296875;
    float _1298 = exp2(_1260);
    float _1300 = _1216 * _1290;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = -_1268;
    float _1306 = _1250 + _1304;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = fma(_1286, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1314 = fma(_1306, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1316 = _1282 * _1240;
    float _1318 = 1.0 / _1084;
    float _1320 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1322 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1312);
    float _1324 = -_1278;
    float _1326 = fma(_1280, _1324, 1.0);
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1330 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1320);
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1334 = fma(_1298, _1310, _1292);
    float _1336 = 1.0 / _1122;
    float _1338 = fma(_1298, _1314, _1276);
    float _1340 = _1266 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1342 = _1212 * _1334;
    float _1344 = _870 + _1332;
    float _1346 = _1290 * _1338;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1350 = _1342 * _1326;
    float _1352 = _1296 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1360 = _1346 * _1326;
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1348);
    float _1364 = _814 + _1356;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = _622 * _1256;
    float _1370 = fma(_1350, _1336, _1344);
    float _1372 = fma(_1360, _1318, _1364);
    float _1374 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1376 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1378 = fma(_1366, 0.5, _1370);
    float _1380 = fma(_1362, 0.5, _1372);
    float _1382 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1374);
    float _1384 = fma(_622, _1258, _1368);
    float _1386 = _1354 * 43758.546875;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1380 + _1392;
    float _1396 = 1.0 / _1098;
    float _1398 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1376);
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1382);
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    float _1404 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1406 = fma(_1394, _1394, _1400);
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1410 = floor(_1386);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1408);
    float _1416 = _810 + _1412;
    bool _1418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.5);
    bool _1426 = _1422 || _1424;
    float _1428 = sqrt(_1406);
    float _1430 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = -_1410;
    float _1438 = _1386 + _1436;
    float _1440 = 1.0 / _1432;
    float _1442 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1458 = fma(_1298, _1454, _1384);
    bool _1460 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1432;
    float _1464 = _1288 * _1458;
    float _1466 = _1464 * _1326;
    float _1468 = _1462 * _1440;
    float _1470 = _1468 * 0.5;
    float _1472 = fma(_1466, _1396, _1416);
    float _1474 = fma(_1414, 0.5, _1472);
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1478 = _1380;
    float _1480 = _1378;
    if (!_1460)
    {
        _1476 = _1474;
    }
    float _1482 = _1476;
    bool _1484 = !_1460;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1428 + _1490;
        float _1494 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = rsqrt(_1406);
        float _1498 = _1492 * _1488;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = fma(_1508, _1494, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1516 = fma(_1474, _1504, _1512);
        float _1518 = _1496 * _1514;
        float _1520 = fma(_1394, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1390, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1520;
        _1486 = _1516;
        _1480 = _1522;
    }
    float _1524 = _1478;
    float _1526 = _1486;
    float _1528 = _1480;
    float _1530 = _1022 + _1524;
    float _1532 = _1026 + _1526;
    float _1534 = _1032 + _1528;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = _1532;
    float _1542 = _1530;
    float _1544 = _1534;
    if (!_1426)
    {
        float _1546 = _1038 * _1038;
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = -_814;
        float _1552 = _1550 + _1524;
        float _1554 = -_810;
        float _1556 = _1554 + _1526;
        float _1558 = fma(_1044, _1044, _1546);
        float _1560 = -_870;
        float _1562 = _1560 + _1528;
        float _1564 = fma(_1050, _1050, _1558);
        float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1568 = sqrt(_1564);
        float _1570 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1572 = precise::min(_1568, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1574 = _1572 * _1566;
        float _1576 = _1570 * _1574;
        float _1578 = fma(_1552, _1576, _1034);
        float _1580 = fma(_1556, _1576, _1028);
        float _1582 = fma(_1562, _1576, _1040);
        _1540 = _1580;
        _1542 = _1578;
        _1544 = _1582;
    }
    float _1584 = _1540;
    float _1586 = _1542;
    float _1588 = _1544;
    float _1590 = 1.0 / _1538;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    float _1610 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1602);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1616 = _1606;
    float _1618 = _1588;
    if (_1452)
    {
        _1616 = 1.0;
    }
    float _1620 = _1616;
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = _1620;
    if (_1452)
    {
        _1618 = 1.0;
    }
    float _1626 = _1618;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1630 = _1590 * _1628;
    float _1632 = _1626;
    if (!_1452)
    {
        float _1634 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1636 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = 1.0 / _1640;
        float _1652 = _1644 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1648 * _1650;
        float _1658 = _1644 * 6.283185482025146484375;
        float _1660 = sin(_1658);
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = _1654 * _1656;
        float _1668 = 1.0 / _1664;
        float _1670 = 1.0 / _1666;
        float _1672 = _1660 * _1670;
        float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1676 = fma(_1630, _1672, _1674);
        float _1678 = _1676 * _1668;
        float _1680 = precise::clamp(_1678, 0.0, 1.0);
        _1624 = _1680;
    }
    float _1682 = _1624;
    if (!_1452)
    {
        float _1684 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1686 = _1684 * 0.15915493667125701904296875;
        float _1688 = _1686 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        float _1692 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1694 = _1692 * 0.15915493667125701904296875;
        float _1696 = _1686 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        float _1700 = 1.0 / _1690;
        float _1702 = _1694 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = _1694 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = 1.0 / _1712;
        float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1718 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1716;
        float _1720 = 1.0 / _1718;
        float _1722 = _1710 * _1714;
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1726 = fma(_1630, _1722, _1724);
        float _1728 = _1726 * _1720;
        float _1730 = precise::clamp(_1728, 0.0, 1.0);
        float _1732 = -_1730;
        float _1734 = _1732 + 1.0;
        _1632 = _1734;
    }
    float _1736 = _1632;
    float _1738 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1742 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1746 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1744);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1748);
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    bool _1764 = _1682 > 0.0;
    bool _1766 = isnan(_1682);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1682 * _1736;
    float _1776 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1760);
    float _1780 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1762);
    bool _1782 = _1736 <= 0.0;
    bool _1784 = !_1772;
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1790 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1794 = _1778 + _1780;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1800 = _1794 * 0.5;
    out.m_57.x = _1034;
    out.m_57.y = _1028;
    out.m_57.z = _1040;
    out.m_33.x = _1798;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1780;
    out.m_59.z = _1800;
    out.m_59.w = _1780;
    if (!_1786)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1802;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _760 = false;
    bool _652 = false;
    bool _416 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    float _86 = as_type<float>(_78);
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _88 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1860 = as_type<float>(_94);
        out.gl_Position.z = _1860;
    }
    if (!_82)
    {
        return out;
    }
    float _98 = in.m_35.w;
    float _100 = float(_78);
    float _102 = in.m_37.w;
    float _104 = 1.0 / _100;
    float _106 = -_98;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_98);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = in.m_37.z;
    float _122 = _108 * _104;
    bool _124 = _108 >= _100;
    bool _126 = !_118;
    bool _128 = _124 || _126;
    out.m_39.w = _102;
    out.m_41.x = _122;
    if (_128)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _86;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _96 = as_type<int>(_132);
    }
    int _134 = _96;
    out.m_39.z = _120;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_134);
        out.gl_Position.z = _1938;
    }
    if (_128)
    {
        return out;
    }
    float _136 = in.m_43.w;
    float _138 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _202;
        _182 = _214;
        _184 = _204;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _226 = _234;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _226;
    float _252 = _164;
    float _254 = _248;
    float _256 = _250;
    if (!_148)
    {
        float _258 = _108 * _108;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = _262;
    if (!_148)
    {
        _256 = _108;
    }
    float _266 = _256;
    float _268 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_148)
    {
        float _274 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_148;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _108 * _284;
        float _294 = exp2(_292);
        float _296 = _290 * 0.693147182464599609375;
        float _298 = 1.0 / _296;
        float _300 = 1.0 / _288;
        float _302 = _294 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _298, _108);
        float _308 = _306 * _300;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_148;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _108 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = fma(_252, _150, _268);
    float _340 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = fma(_252, _152, _270);
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _348 = fma(_336, _152, _340);
    float _350 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_336, _150, _344);
    float _356 = -_348;
    float _358 = _342 + _356;
    float _360 = fma(_252, _154, _350);
    float _362 = fma(_336, _154, _352);
    float _364 = fma(_338, _136, _156);
    float _366 = -_354;
    float _368 = _338 + _366;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _376 = -_362;
    float _378 = _360 + _376;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _374);
    float _386 = fma(_342, _136, _158);
    float _388 = fma(_360, _136, _160);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_37.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _122;
    }
    _416 = false;
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _418 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _418 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _418 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _440;
    float _444 = 1.0 / _442;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _448 = 1.0 / _438;
    bool _450 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _452 = isnan(_418);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _434;
    float _464 = _426 * _444;
    bool _466 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_418);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _422 * _448;
    bool _480 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _482 = isnan(_418);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = -_490;
    float _498 = _496 + 1.0;
    float _500 = _430 * _462;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _476 * _498;
    float _512 = -_476;
    float _514 = _512 + 1.0;
    float _516 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = fma(_508, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _520 = fma(_494, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _522 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _524 = isnan(_418);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _460 * _514;
    float _536 = -_460;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _532 * _538;
    float _554 = fma(_542, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _516 * _552;
    float _562 = _518 * _552;
    float _564 = _520 * _552;
    float _566 = -_532;
    float _568 = _566 + 1.0;
    float _570 = in.m_43.x;
    float _572 = in.m_43.y;
    float _574 = in.m_43.z;
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _596 = fma(_584, _464, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_588, _464, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_592, _464, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_554, _534, _576);
    float _604 = fma(_556, _534, _580);
    float _606 = fma(_558, _534, _578);
    float _608 = fma(_596, _510, _602);
    float _610 = fma(_600, _510, _604);
    float _612 = fma(_598, _510, _606);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].x, _608);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].y, _610);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].z, _612);
    float _620 = _390 * _594;
    float _622 = _392 * _594;
    float _624 = _394 * _594;
    float _626 = _614 * _570;
    float _628 = _616 * _572;
    float _630 = _618 * _574;
    bool _632 = !_446;
    float _650;
    if (!_632)
    {
        float _634 = in.m_37.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _122;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _658 = _654 + _656;
    bool _660 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _662 = isnan(_654);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    bool _676 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _678 = isnan(_654);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_670;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _692;
    float _696 = 1.0 / _674;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = _686 * _690;
    float _702 = -_686;
    float _704 = _702 + 1.0;
    float _706 = _658 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _708;
    float _712 = fma(_694, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _720 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = _712 * _700;
    float _724 = _720 * _700;
    float _726 = _718 * _700;
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _734 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].x, _728);
    float _736 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].y, _730);
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].z, _732);
    bool _740 = !_698;
    float _758;
    if (!_740)
    {
        float _742 = in.m_37.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        _758 = _122;
    }
    _760 = false;
    float _762 = _758;
    float _764 = in.m_45.y;
    float _766 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _770 = _768 != 0;
    float _772 = in.m_37.x;
    float _774 = in.m_37.y;
    float _776 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _766);
    float _784 = in.m_45.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _792 = 1.0 / _780;
    float _794 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _796 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _800 = _798 != 0;
    float _802 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _804 = _464;
    if (_770)
    {
        float _806 = in.m_37.x;
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _814 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _818 = _810 + _816;
    float _820 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    bool _822 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -_764;
    float _836 = _834 + 1.0;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _814 + _842;
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = _774 > 0.5;
    float _850 = _840 * _792;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _854 = _762 + _852;
    float _856 = -_810;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _764;
    if (_788)
    {
        float _862 = _848 ? _836 : _764;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = -_832;
    float _868 = _866 + 1.0;
    float _870 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _872 = fma(_850, _854, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_814;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _858 * _858;
    float _880 = 0.0;
    float _882 = _864;
    float _884 = _784;
    if (_770)
    {
        _880 = _784;
    }
    float _886 = _880;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _890 = _808 > 0.5;
    bool _892 = _890 && _770;
    float _894 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].x, _846);
    bool _896 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_762);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_870;
    float _910 = _908 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = fma(_876, _876, _878);
    float _914 = in.m_47.z;
    float _916 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _918 = _906 * _868;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _922 = _870 + _920;
    float _924 = fma(_910, _910, _912);
    float _926 = _912;
    float _928 = _886;
    if (!_770)
    {
        _926 = _784;
    }
    float _930 = _926;
    float _932 = in.m_47.x;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[28].z, _894);
    float _936 = _930;
    if (_892)
    {
        float _938 = -_886;
        float _940 = _938 + 1.0;
        _928 = _940;
    }
    float _942 = _928;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _946 = in.m_47.y;
    float _948 = _872 * _918;
    float _950 = -_906;
    float _952 = _950 + 1.0;
    float _954 = _942;
    if (_770)
    {
        _936 = _942;
    }
    float _956 = _936;
    float _958 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _960 = _934 >= 0.0;
    float _962 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _948);
    float _964 = _894;
    if (_800)
    {
        float _966 = rsqrt(_924);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _972 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = _970 * _888;
    float _976 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _978 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _980 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _958 * _944;
    float _984 = _888;
    float _986 = _978;
    if (_960)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _882;
    float _990 = _978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _992 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _994 = _976 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _974;
    out.m_49.y = _982;
    int _996 = as_type<int>(_988);
    if (_960)
    {
        float _998 = _988 * 5.0;
        _996 = as_type<int>(_998);
    }
    int _1000 = _996;
    float _1002 = _968;
    if (_800)
    {
        float _1004 = _968 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _954 = _1004;
    }
    float _1006 = _954;
    if (!_800)
    {
        _984 = 0.0;
        _884 = 0.0;
    }
    float _1008 = _984;
    float _1010 = _884;
    out.m_51.z = _914;
    float _1012 = _1008;
    float _1014 = _1010;
    if (!_800)
    {
        _1002 = 0.0;
    }
    float _1016 = _1002;
    float _1018 = _1016;
    if (_800)
    {
        float _1020 = _876 * _1006;
        _1012 = _1020;
    }
    float _1022 = _1012;
    if (_800)
    {
        float _1024 = _858 * _1006;
        _1018 = _1024;
    }
    float _1026 = _1018;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_1000);
        out.gl_Position.z = _3359;
    }
    out.m_51.x = _932;
    out.m_51.y = _946;
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    if (_960)
    {
        out.m_33.x = 0.0;
    }
    if (_960)
    {
        return out;
    }
    float _1028 = _810 + _1026;
    if (_800)
    {
        float _1030 = _910 * _1006;
        _1014 = _1030;
    }
    float _1032 = _1014;
    float _1034 = _814 + _1022;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = _1028 + _1036;
    float _1040 = _870 + _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1044 = _1034 + _1042;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1050 = _1040 + _1048;
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1046);
    float _1056 = fma(_108, 0.300000011920928955078125, -1.0);
    float _1058 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1052);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1054);
    float _1062 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1064 = sqrt(_924);
    bool _1066 = _1060 >= 0.0;
    float _1068 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1070 = _1056 * 0.15915493667125701904296875;
    float _1072 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1074 = _772 * 0.550000011920928955078125;
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1062);
    float _1078 = _122 * _122;
    float _1080 = _1070 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1086 = abs(_122);
    float _1088 = _1086 * _1078;
    float _1090 = in.m_55.x;
    float _1092 = in.m_55.y;
    float _1094 = in.m_55.z;
    if (_1066)
    {
        _986 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1096 = _986;
    float _1098 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1058);
    float _1100 = rint(_1074);
    int _1102 = as_type<int>(_1096);
    if (_1066)
    {
        float _1104 = _1096 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1066)
    {
        out.m_33.x = 0.0;
    }
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1106);
        out.gl_Position.z = _3534;
    }
    float _1108 = rsqrt(_1084);
    float _1110 = fma(_1064, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    if (_1066)
    {
        return out;
    }
    float _1114 = fma(_1112, -2.0, 3.0);
    float _1116 = _1112 * _1112;
    float _1118 = fma(_1082, -0.02999999932944774627685546875, 1.0);
    float _1120 = fma(_1082, -0.100000001490116119384765625, 0.5);
    float _1122 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1072);
    float _1124 = _1114 * _1116;
    float _1126 = -_914;
    float _1128 = _1126 + _932;
    float _1130 = rsqrt(_1098);
    float _1132 = -_1118;
    float _1134 = _1132 + _1120;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1138 = -_1124;
    float _1140 = _1138 + 0.5;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, _1134, _1118);
    float _1148 = _1124 * _1128;
    float _1150 = fma(_1088, _1140, 1.0);
    float _1152 = abs(_122);
    float _1154 = log2(_1152);
    float _1156 = fma(_1136, _1144, 1.0);
    float _1158 = _102 * 78.233001708984375;
    float _1160 = _1146 * _1090;
    float _1162 = _1146 * _1092;
    float _1164 = _1146 * _1094;
    float _1166 = _1148 * 0.0599999986588954925537109375;
    float _1168 = _1150 * _1156;
    float _1170 = rsqrt(_1122);
    float _1172 = fma(_932, 12.98980045318603515625, _1158);
    float _1174 = _1160 * _1108;
    float _1176 = _1166 * _1108;
    float _1178 = fma(_914, 12.98980045318603515625, _1158);
    float _1180 = _1172 * 0.15915493667125701904296875;
    float _1182 = _1162 * _1130;
    float _1184 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1192 = _1154 * 0.800000011920928955078125;
    float _1194 = _1186 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1164 * _1170;
    float _1200 = fma(_1174, _1168, _1176);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1190);
    float _1204 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1188);
    float _1206 = _1198 * _1168;
    float _1208 = _1182 * _1168;
    float _1210 = exp2(_1192);
    float _1212 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1200);
    float _1218 = _1180 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1208);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1206);
    float _1228 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1222);
    float _1230 = _1196 * 43758.546875;
    float _1232 = rsqrt(_1204);
    float _1234 = fma(12.0, _772, 24.0);
    float _1236 = fma(_774, 6.0, 12.0);
    float _1238 = fma(2.0, _772, -1.0);
    float _1240 = fma(_774, 2.0, -1.0);
    float _1242 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1228);
    float _1244 = _1210 * _1234;
    float _1246 = _1210 * _1236;
    float _1248 = floor(_1230);
    float _1250 = _1220 * 43758.546875;
    float _1252 = fma(_946, 12.98980045318603515625, _1158);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1246 * _946;
    float _1258 = _1244 * _932;
    float _1260 = _1154 * 0.5;
    float _1262 = fma(_1254, -0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    float _1266 = _1232 * _1238;
    float _1268 = floor(_1250);
    float _1270 = _620 * _1256;
    float _1272 = _624 * _1256;
    float _1274 = _1226 * _1212;
    float _1276 = fma(_620, _1258, _1270);
    float _1278 = _1264 * _1264;
    float _1280 = fma(_1264, -2.0, 3.0);
    float _1282 = rsqrt(_1214);
    float _1284 = -_1248;
    float _1286 = _1230 + _1284;
    float _1288 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_624, _1258, _1272);
    float _1294 = _1224 * _1288;
    float _1296 = _1252 * 0.15915493667125701904296875;
    float _1298 = exp2(_1260);
    float _1300 = _1216 * _1290;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = -_1268;
    float _1306 = _1250 + _1304;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = fma(_1286, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1314 = fma(_1306, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1316 = _1282 * _1240;
    float _1318 = 1.0 / _1084;
    float _1320 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1322 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1312);
    float _1324 = -_1278;
    float _1326 = fma(_1280, _1324, 1.0);
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1330 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1320);
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1334 = fma(_1298, _1310, _1292);
    float _1336 = 1.0 / _1122;
    float _1338 = fma(_1298, _1314, _1276);
    float _1340 = _1266 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1342 = _1212 * _1334;
    float _1344 = _870 + _1332;
    float _1346 = _1290 * _1338;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1350 = _1342 * _1326;
    float _1352 = _1296 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1360 = _1346 * _1326;
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1348);
    float _1364 = _814 + _1356;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = _622 * _1256;
    float _1370 = fma(_1350, _1336, _1344);
    float _1372 = fma(_1360, _1318, _1364);
    float _1374 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1376 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1378 = fma(_1366, 0.5, _1370);
    float _1380 = fma(_1362, 0.5, _1372);
    float _1382 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1374);
    float _1384 = fma(_622, _1258, _1368);
    float _1386 = _1354 * 43758.546875;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1380 + _1392;
    float _1396 = 1.0 / _1098;
    float _1398 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1376);
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1382);
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    float _1404 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1406 = fma(_1394, _1394, _1400);
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1410 = floor(_1386);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1408);
    float _1416 = _810 + _1412;
    bool _1418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.5);
    bool _1426 = _1422 || _1424;
    float _1428 = sqrt(_1406);
    float _1430 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = -_1410;
    float _1438 = _1386 + _1436;
    float _1440 = 1.0 / _1432;
    float _1442 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1458 = fma(_1298, _1454, _1384);
    bool _1460 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1432;
    float _1464 = _1288 * _1458;
    float _1466 = _1464 * _1326;
    float _1468 = _1462 * _1440;
    float _1470 = _1468 * 0.5;
    float _1472 = fma(_1466, _1396, _1416);
    float _1474 = fma(_1414, 0.5, _1472);
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1478 = _1380;
    float _1480 = _1378;
    if (!_1460)
    {
        _1476 = _1474;
    }
    float _1482 = _1476;
    bool _1484 = !_1460;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1428 + _1490;
        float _1494 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = rsqrt(_1406);
        float _1498 = _1492 * _1488;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = fma(_1508, _1494, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1516 = fma(_1474, _1504, _1512);
        float _1518 = _1496 * _1514;
        float _1520 = fma(_1394, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1390, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1520;
        _1486 = _1516;
        _1480 = _1522;
    }
    float _1524 = _1478;
    float _1526 = _1486;
    float _1528 = _1480;
    float _1530 = _1022 + _1524;
    float _1532 = _1026 + _1526;
    float _1534 = _1032 + _1528;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = _1532;
    float _1542 = _1530;
    float _1544 = _1534;
    if (!_1426)
    {
        float _1546 = _1038 * _1038;
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = -_814;
        float _1552 = _1550 + _1524;
        float _1554 = -_810;
        float _1556 = _1554 + _1526;
        float _1558 = fma(_1044, _1044, _1546);
        float _1560 = -_870;
        float _1562 = _1560 + _1528;
        float _1564 = fma(_1050, _1050, _1558);
        float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1568 = sqrt(_1564);
        float _1570 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1572 = precise::min(_1568, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1574 = _1572 * _1566;
        float _1576 = _1570 * _1574;
        float _1578 = fma(_1552, _1576, _1034);
        float _1580 = fma(_1556, _1576, _1028);
        float _1582 = fma(_1562, _1576, _1040);
        _1540 = _1580;
        _1542 = _1578;
        _1544 = _1582;
    }
    float _1584 = _1540;
    float _1586 = _1542;
    float _1588 = _1544;
    float _1590 = 1.0 / _1538;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    float _1610 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1602);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1616 = _1606;
    float _1618 = _1588;
    if (_1452)
    {
        _1616 = 1.0;
    }
    float _1620 = _1616;
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = _1620;
    if (_1452)
    {
        _1618 = 1.0;
    }
    float _1626 = _1618;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1630 = _1590 * _1628;
    float _1632 = _1626;
    if (!_1452)
    {
        float _1634 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1636 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = 1.0 / _1640;
        float _1652 = _1644 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1648 * _1650;
        float _1658 = _1644 * 6.283185482025146484375;
        float _1660 = sin(_1658);
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = _1654 * _1656;
        float _1668 = 1.0 / _1664;
        float _1670 = 1.0 / _1666;
        float _1672 = _1660 * _1670;
        float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1676 = fma(_1630, _1672, _1674);
        float _1678 = _1676 * _1668;
        float _1680 = precise::clamp(_1678, 0.0, 1.0);
        _1624 = _1680;
    }
    float _1682 = _1624;
    if (!_1452)
    {
        float _1684 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1686 = _1684 * 0.15915493667125701904296875;
        float _1688 = _1686 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        float _1692 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1694 = _1692 * 0.15915493667125701904296875;
        float _1696 = _1686 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        float _1700 = 1.0 / _1690;
        float _1702 = _1694 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = _1694 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = 1.0 / _1712;
        float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1718 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1716;
        float _1720 = 1.0 / _1718;
        float _1722 = _1710 * _1714;
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1726 = fma(_1630, _1722, _1724);
        float _1728 = _1726 * _1720;
        float _1730 = precise::clamp(_1728, 0.0, 1.0);
        float _1732 = -_1730;
        float _1734 = _1732 + 1.0;
        _1632 = _1734;
    }
    float _1736 = _1632;
    float _1738 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1742 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1746 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1744);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1748);
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    bool _1764 = _1682 > 0.0;
    bool _1766 = isnan(_1682);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1682 * _1736;
    float _1776 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1760);
    float _1780 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1762);
    bool _1782 = _1736 <= 0.0;
    bool _1784 = !_1772;
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1790 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1794 = _1778 + _1780;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1800 = _1794 * 0.5;
    out.m_57.x = _1034;
    out.m_57.y = _1028;
    out.m_57.z = _1040;
    out.m_33.x = _1798;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1780;
    out.m_59.z = _1800;
    out.m_59.w = _1780;
    if (!_1786)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1802;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _760 = false;
    bool _652 = false;
    bool _416 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    float _86 = as_type<float>(_78);
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _88 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1860 = as_type<float>(_94);
        out.gl_Position.z = _1860;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_35.w;
    float _100 = float(_78);
    float _102 = in.m_37.w;
    float _104 = 1.0 / _100;
    float _106 = -_98;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_98);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = in.m_37.z;
    float _122 = _108 * _104;
    bool _124 = _108 >= _100;
    bool _126 = !_118;
    bool _128 = _124 || _126;
    out.m_39.w = _102;
    out.m_41.x = _122;
    if (_128)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _86;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _96 = as_type<int>(_132);
    }
    int _134 = _96;
    out.m_39.z = _120;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_134);
        out.gl_Position.z = _1938;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_43.w;
    float _138 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _202;
        _182 = _214;
        _184 = _204;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _226 = _234;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _226;
    float _252 = _164;
    float _254 = _248;
    float _256 = _250;
    if (!_148)
    {
        float _258 = _108 * _108;
        float _260 = _258 * 0.5;
        _254 = _260;
    }
    float _262 = _254;
    float _264 = _262;
    if (!_148)
    {
        _256 = _108;
    }
    float _266 = _256;
    float _268 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_148)
    {
        float _274 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_148;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _108 * _284;
        float _294 = exp2(_292);
        float _296 = _290 * 0.693147182464599609375;
        float _298 = 1.0 / _296;
        float _300 = 1.0 / _288;
        float _302 = _294 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _298, _108);
        float _308 = _306 * _300;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_148;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _108 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = fma(_252, _150, _268);
    float _340 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _342 = fma(_252, _152, _270);
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _348 = fma(_336, _152, _340);
    float _350 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_336, _150, _344);
    float _356 = -_348;
    float _358 = _342 + _356;
    float _360 = fma(_252, _154, _350);
    float _362 = fma(_336, _154, _352);
    float _364 = fma(_338, _136, _156);
    float _366 = -_354;
    float _368 = _338 + _366;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _376 = -_362;
    float _378 = _360 + _376;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _374);
    float _386 = fma(_342, _136, _158);
    float _388 = fma(_360, _136, _160);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_37.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _122;
    }
    _416 = false;
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _418 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _418 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _418 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _440;
    float _444 = 1.0 / _442;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _448 = 1.0 / _438;
    bool _450 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _452 = isnan(_418);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _434;
    float _464 = _426 * _444;
    bool _466 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_418);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _422 * _448;
    bool _480 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _482 = isnan(_418);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = -_490;
    float _498 = _496 + 1.0;
    float _500 = _430 * _462;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _476 * _498;
    float _512 = -_476;
    float _514 = _512 + 1.0;
    float _516 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = fma(_508, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _520 = fma(_494, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _522 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _524 = isnan(_418);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _460 * _514;
    float _536 = -_460;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _532 * _538;
    float _554 = fma(_542, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _516 * _552;
    float _562 = _518 * _552;
    float _564 = _520 * _552;
    float _566 = -_532;
    float _568 = _566 + 1.0;
    float _570 = in.m_43.x;
    float _572 = in.m_43.y;
    float _574 = in.m_43.z;
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _596 = fma(_584, _464, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_588, _464, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_592, _464, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_554, _534, _576);
    float _604 = fma(_556, _534, _580);
    float _606 = fma(_558, _534, _578);
    float _608 = fma(_596, _510, _602);
    float _610 = fma(_600, _510, _604);
    float _612 = fma(_598, _510, _606);
    float _614 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].x, _608);
    float _616 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].y, _610);
    float _618 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[146].z, _612);
    float _620 = _390 * _594;
    float _622 = _392 * _594;
    float _624 = _394 * _594;
    float _626 = _614 * _570;
    float _628 = _616 * _572;
    float _630 = _618 * _574;
    bool _632 = !_446;
    float _650;
    if (!_632)
    {
        float _634 = in.m_37.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _122;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _658 = _654 + _656;
    bool _660 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _662 = isnan(_654);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _672;
    bool _676 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _678 = isnan(_654);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_670;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _692;
    float _696 = 1.0 / _674;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _700 = _686 * _690;
    float _702 = -_686;
    float _704 = _702 + 1.0;
    float _706 = _658 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _708;
    float _712 = fma(_694, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _720 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = _712 * _700;
    float _724 = _720 * _700;
    float _726 = _718 * _700;
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _734 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].x, _728);
    float _736 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].y, _730);
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[108].z, _732);
    bool _740 = !_698;
    float _758;
    if (!_740)
    {
        float _742 = in.m_37.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        _758 = _122;
    }
    _760 = false;
    float _762 = _758;
    float _764 = in.m_45.y;
    float _766 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _770 = _768 != 0;
    float _772 = in.m_37.x;
    float _774 = in.m_37.y;
    float _776 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _766);
    float _784 = in.m_45.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _792 = 1.0 / _780;
    float _794 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _796 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _800 = _798 != 0;
    float _802 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _804 = _464;
    if (_770)
    {
        float _806 = in.m_37.x;
        _804 = _806;
    }
    float _808 = _804;
    float _810 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _814 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _818 = _810 + _816;
    float _820 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _812);
    bool _822 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -_764;
    float _836 = _834 + 1.0;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _814 + _842;
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = _774 > 0.5;
    float _850 = _840 * _792;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _854 = _762 + _852;
    float _856 = -_810;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _764;
    if (_788)
    {
        float _862 = _848 ? _836 : _764;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = -_832;
    float _868 = _866 + 1.0;
    float _870 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _872 = fma(_850, _854, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_814;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _858 * _858;
    float _880 = 0.0;
    float _882 = _864;
    float _884 = _784;
    if (_770)
    {
        _880 = _784;
    }
    float _886 = _880;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _890 = _808 > 0.5;
    bool _892 = _890 && _770;
    float _894 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].x, _846);
    bool _896 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_762);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_870;
    float _910 = _908 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = fma(_876, _876, _878);
    float _914 = in.m_47.z;
    float _916 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _918 = _906 * _868;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _922 = _870 + _920;
    float _924 = fma(_910, _910, _912);
    float _926 = _912;
    float _928 = _886;
    if (!_770)
    {
        _926 = _784;
    }
    float _930 = _926;
    float _932 = in.m_47.x;
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[28].z, _894);
    float _936 = _930;
    if (_892)
    {
        float _938 = -_886;
        float _940 = _938 + 1.0;
        _928 = _940;
    }
    float _942 = _928;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _946 = in.m_47.y;
    float _948 = _872 * _918;
    float _950 = -_906;
    float _952 = _950 + 1.0;
    float _954 = _942;
    if (_770)
    {
        _936 = _942;
    }
    float _956 = _936;
    float _958 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _960 = _934 >= 0.0;
    float _962 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[115].x, _948);
    float _964 = _894;
    if (_800)
    {
        float _966 = rsqrt(_924);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _972 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = _970 * _888;
    float _976 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _978 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _980 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _958 * _944;
    float _984 = _888;
    float _986 = _978;
    if (_960)
    {
        _882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _882;
    float _990 = _978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _992 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _994 = _976 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _974;
    out.m_49.y = _982;
    int _996 = as_type<int>(_988);
    if (_960)
    {
        float _998 = _988 * 5.0;
        _996 = as_type<int>(_998);
    }
    int _1000 = _996;
    float _1002 = _968;
    if (_800)
    {
        float _1004 = _968 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _954 = _1004;
    }
    float _1006 = _954;
    if (!_800)
    {
        _984 = 0.0;
        _884 = 0.0;
    }
    float _1008 = _984;
    float _1010 = _884;
    out.m_51.z = _914;
    float _1012 = _1008;
    float _1014 = _1010;
    if (!_800)
    {
        _1002 = 0.0;
    }
    float _1016 = _1002;
    float _1018 = _1016;
    if (_800)
    {
        float _1020 = _876 * _1006;
        _1012 = _1020;
    }
    float _1022 = _1012;
    if (_800)
    {
        float _1024 = _858 * _1006;
        _1018 = _1024;
    }
    float _1026 = _1018;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_1000);
        out.gl_Position.z = _3359;
    }
    out.m_51.x = _932;
    out.m_51.y = _946;
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    if (_960)
    {
        out.m_33.x = 0.0;
    }
    if (_960)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1028 = _810 + _1026;
    if (_800)
    {
        float _1030 = _910 * _1006;
        _1014 = _1030;
    }
    float _1032 = _1014;
    float _1034 = _814 + _1022;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = _1028 + _1036;
    float _1040 = _870 + _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1044 = _1034 + _1042;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1050 = _1040 + _1048;
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1046);
    float _1056 = fma(_108, 0.300000011920928955078125, -1.0);
    float _1058 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1052);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1054);
    float _1062 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1064 = sqrt(_924);
    bool _1066 = _1060 >= 0.0;
    float _1068 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1070 = _1056 * 0.15915493667125701904296875;
    float _1072 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1074 = _772 * 0.550000011920928955078125;
    float _1076 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1062);
    float _1078 = _122 * _122;
    float _1080 = _1070 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1086 = abs(_122);
    float _1088 = _1086 * _1078;
    float _1090 = in.m_55.x;
    float _1092 = in.m_55.y;
    float _1094 = in.m_55.z;
    if (_1066)
    {
        _986 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1096 = _986;
    float _1098 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1058);
    float _1100 = rint(_1074);
    int _1102 = as_type<int>(_1096);
    if (_1066)
    {
        float _1104 = _1096 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1066)
    {
        out.m_33.x = 0.0;
    }
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1106);
        out.gl_Position.z = _3534;
    }
    float _1108 = rsqrt(_1084);
    float _1110 = fma(_1064, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    if (_1066)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1114 = fma(_1112, -2.0, 3.0);
    float _1116 = _1112 * _1112;
    float _1118 = fma(_1082, -0.02999999932944774627685546875, 1.0);
    float _1120 = fma(_1082, -0.100000001490116119384765625, 0.5);
    float _1122 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1072);
    float _1124 = _1114 * _1116;
    float _1126 = -_914;
    float _1128 = _1126 + _932;
    float _1130 = rsqrt(_1098);
    float _1132 = -_1118;
    float _1134 = _1132 + _1120;
    float _1136 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1138 = -_1124;
    float _1140 = _1138 + 0.5;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, _1134, _1118);
    float _1148 = _1124 * _1128;
    float _1150 = fma(_1088, _1140, 1.0);
    float _1152 = abs(_122);
    float _1154 = log2(_1152);
    float _1156 = fma(_1136, _1144, 1.0);
    float _1158 = _102 * 78.233001708984375;
    float _1160 = _1146 * _1090;
    float _1162 = _1146 * _1092;
    float _1164 = _1146 * _1094;
    float _1166 = _1148 * 0.0599999986588954925537109375;
    float _1168 = _1150 * _1156;
    float _1170 = rsqrt(_1122);
    float _1172 = fma(_932, 12.98980045318603515625, _1158);
    float _1174 = _1160 * _1108;
    float _1176 = _1166 * _1108;
    float _1178 = fma(_914, 12.98980045318603515625, _1158);
    float _1180 = _1172 * 0.15915493667125701904296875;
    float _1182 = _1162 * _1130;
    float _1184 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1192 = _1154 * 0.800000011920928955078125;
    float _1194 = _1186 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1164 * _1170;
    float _1200 = fma(_1174, _1168, _1176);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1190);
    float _1204 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1188);
    float _1206 = _1198 * _1168;
    float _1208 = _1182 * _1168;
    float _1210 = exp2(_1192);
    float _1212 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1202);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1200);
    float _1218 = _1180 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1208);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1206);
    float _1228 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1222);
    float _1230 = _1196 * 43758.546875;
    float _1232 = rsqrt(_1204);
    float _1234 = fma(12.0, _772, 24.0);
    float _1236 = fma(_774, 6.0, 12.0);
    float _1238 = fma(2.0, _772, -1.0);
    float _1240 = fma(_774, 2.0, -1.0);
    float _1242 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1228);
    float _1244 = _1210 * _1234;
    float _1246 = _1210 * _1236;
    float _1248 = floor(_1230);
    float _1250 = _1220 * 43758.546875;
    float _1252 = fma(_946, 12.98980045318603515625, _1158);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1246 * _946;
    float _1258 = _1244 * _932;
    float _1260 = _1154 * 0.5;
    float _1262 = fma(_1254, -0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    float _1266 = _1232 * _1238;
    float _1268 = floor(_1250);
    float _1270 = _620 * _1256;
    float _1272 = _624 * _1256;
    float _1274 = _1226 * _1212;
    float _1276 = fma(_620, _1258, _1270);
    float _1278 = _1264 * _1264;
    float _1280 = fma(_1264, -2.0, 3.0);
    float _1282 = rsqrt(_1214);
    float _1284 = -_1248;
    float _1286 = _1230 + _1284;
    float _1288 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_624, _1258, _1272);
    float _1294 = _1224 * _1288;
    float _1296 = _1252 * 0.15915493667125701904296875;
    float _1298 = exp2(_1260);
    float _1300 = _1216 * _1290;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = -_1268;
    float _1306 = _1250 + _1304;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = fma(_1286, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1314 = fma(_1306, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1316 = _1282 * _1240;
    float _1318 = 1.0 / _1084;
    float _1320 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1322 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1312);
    float _1324 = -_1278;
    float _1326 = fma(_1280, _1324, 1.0);
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1330 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1320);
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1334 = fma(_1298, _1310, _1292);
    float _1336 = 1.0 / _1122;
    float _1338 = fma(_1298, _1314, _1276);
    float _1340 = _1266 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1342 = _1212 * _1334;
    float _1344 = _870 + _1332;
    float _1346 = _1290 * _1338;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1350 = _1342 * _1326;
    float _1352 = _1296 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1360 = _1346 * _1326;
    float _1362 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1348);
    float _1364 = _814 + _1356;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1358);
    float _1368 = _622 * _1256;
    float _1370 = fma(_1350, _1336, _1344);
    float _1372 = fma(_1360, _1318, _1364);
    float _1374 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1376 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1378 = fma(_1366, 0.5, _1370);
    float _1380 = fma(_1362, 0.5, _1372);
    float _1382 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1374);
    float _1384 = fma(_622, _1258, _1368);
    float _1386 = _1354 * 43758.546875;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1380 + _1392;
    float _1396 = 1.0 / _1098;
    float _1398 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1376);
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1382);
    out.m_53.x = _980;
    out.m_53.y = _990;
    out.m_53.z = _992;
    out.m_53.w = _994;
    float _1404 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1406 = fma(_1394, _1394, _1400);
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1410 = floor(_1386);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1408);
    float _1416 = _810 + _1412;
    bool _1418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.5);
    bool _1426 = _1422 || _1424;
    float _1428 = sqrt(_1406);
    float _1430 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = -_1410;
    float _1438 = _1386 + _1436;
    float _1440 = 1.0 / _1432;
    float _1442 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1458 = fma(_1298, _1454, _1384);
    bool _1460 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1432;
    float _1464 = _1288 * _1458;
    float _1466 = _1464 * _1326;
    float _1468 = _1462 * _1440;
    float _1470 = _1468 * 0.5;
    float _1472 = fma(_1466, _1396, _1416);
    float _1474 = fma(_1414, 0.5, _1472);
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1478 = _1380;
    float _1480 = _1378;
    if (!_1460)
    {
        _1476 = _1474;
    }
    float _1482 = _1476;
    bool _1484 = !_1460;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1428 + _1490;
        float _1494 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = rsqrt(_1406);
        float _1498 = _1492 * _1488;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = fma(_1508, _1494, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1516 = fma(_1474, _1504, _1512);
        float _1518 = _1496 * _1514;
        float _1520 = fma(_1394, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1390, _1518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1478 = _1520;
        _1486 = _1516;
        _1480 = _1522;
    }
    float _1524 = _1478;
    float _1526 = _1486;
    float _1528 = _1480;
    float _1530 = _1022 + _1524;
    float _1532 = _1026 + _1526;
    float _1534 = _1032 + _1528;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = _1532;
    float _1542 = _1530;
    float _1544 = _1534;
    if (!_1426)
    {
        float _1546 = _1038 * _1038;
        float _1548 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = -_814;
        float _1552 = _1550 + _1524;
        float _1554 = -_810;
        float _1556 = _1554 + _1526;
        float _1558 = fma(_1044, _1044, _1546);
        float _1560 = -_870;
        float _1562 = _1560 + _1528;
        float _1564 = fma(_1050, _1050, _1558);
        float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1568 = sqrt(_1564);
        float _1570 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1572 = precise::min(_1568, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1574 = _1572 * _1566;
        float _1576 = _1570 * _1574;
        float _1578 = fma(_1552, _1576, _1034);
        float _1580 = fma(_1556, _1576, _1028);
        float _1582 = fma(_1562, _1576, _1040);
        _1540 = _1580;
        _1542 = _1578;
        _1544 = _1582;
    }
    float _1584 = _1540;
    float _1586 = _1542;
    float _1588 = _1544;
    float _1590 = 1.0 / _1538;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1600);
    float _1610 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1602);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1616 = _1606;
    float _1618 = _1588;
    if (_1452)
    {
        _1616 = 1.0;
    }
    float _1620 = _1616;
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = _1620;
    if (_1452)
    {
        _1618 = 1.0;
    }
    float _1626 = _1618;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1630 = _1590 * _1628;
    float _1632 = _1626;
    if (!_1452)
    {
        float _1634 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1636 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = 1.0 / _1640;
        float _1652 = _1644 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1648 * _1650;
        float _1658 = _1644 * 6.283185482025146484375;
        float _1660 = sin(_1658);
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = _1654 * _1656;
        float _1668 = 1.0 / _1664;
        float _1670 = 1.0 / _1666;
        float _1672 = _1660 * _1670;
        float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1676 = fma(_1630, _1672, _1674);
        float _1678 = _1676 * _1668;
        float _1680 = precise::clamp(_1678, 0.0, 1.0);
        _1624 = _1680;
    }
    float _1682 = _1624;
    if (!_1452)
    {
        float _1684 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1686 = _1684 * 0.15915493667125701904296875;
        float _1688 = _1686 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        float _1692 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1694 = _1692 * 0.15915493667125701904296875;
        float _1696 = _1686 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        float _1700 = 1.0 / _1690;
        float _1702 = _1694 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = _1694 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = 1.0 / _1712;
        float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1718 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1716;
        float _1720 = 1.0 / _1718;
        float _1722 = _1710 * _1714;
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1726 = fma(_1630, _1722, _1724);
        float _1728 = _1726 * _1720;
        float _1730 = precise::clamp(_1728, 0.0, 1.0);
        float _1732 = -_1730;
        float _1734 = _1732 + 1.0;
        _1632 = _1734;
    }
    float _1736 = _1632;
    float _1738 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1742 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1746 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1744);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1746);
    float _1758 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1748);
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    bool _1764 = _1682 > 0.0;
    bool _1766 = isnan(_1682);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1682 * _1736;
    float _1776 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1760);
    float _1780 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1762);
    bool _1782 = _1736 <= 0.0;
    bool _1784 = !_1772;
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1756);
    float _1790 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1794 = _1778 + _1780;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1800 = _1794 * 0.5;
    out.m_57.x = _1034;
    out.m_57.y = _1028;
    out.m_57.z = _1040;
    out.m_33.x = _1798;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1780;
    out.m_59.z = _1800;
    out.m_59.w = _1780;
    if (!_1786)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1802;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

