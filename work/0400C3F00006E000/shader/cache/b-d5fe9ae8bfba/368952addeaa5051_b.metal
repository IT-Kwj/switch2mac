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
    float4 m_43 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_55 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _928 = false;
    bool _786 = false;
    bool _564 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1771 = as_type<float>(_96);
        out.gl_Position.z = _1771;
    }
    if (!_84)
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
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_132);
        out.gl_Position.z = _1840;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_39.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_32.x;
    float _156 = in.m_32.y;
    float _158 = in.m_32.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = 1.0 / _300;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _304;
    float _342 = -_338;
    float _344 = _342 + 1.0;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _348 = 1.0 / _308;
    float _350 = _288 * _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _284 + _352;
    float _356 = 1.0 / _312;
    float _358 = _292 * _340;
    bool _360 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _362 = isnan(_284);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_370;
    float _374 = _372 + 1.0;
    float _376 = _296 * _348;
    float _378 = _354 * _356;
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = _390 * _374;
    float _398 = -_390;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = fma(_394, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = _326 * _400;
    float _414 = -_326;
    float _416 = _414 + 1.0;
    float _418 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_408, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _422 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_284);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _338 * _416;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _432 * _344;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_442, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = _418 * _448;
    float _460 = _420 * _448;
    float _462 = _410 * _448;
    float _464 = -_432;
    float _466 = _464 + 1.0;
    float _468 = in.m_39.x;
    float _470 = in.m_39.y;
    float _472 = in.m_39.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _486 = fma(_438, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _490 = fma(_476, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_452, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_454, _434, _482);
    float _498 = fma(_456, _434, _484);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = fma(_486, _434, _488);
    float _514 = fma(_502, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_490, _412, _496);
    float _522 = fma(_492, _412, _498);
    float _524 = fma(_494, _412, _512);
    float _526 = fma(_514, _396, _520);
    float _528 = fma(_516, _396, _522);
    float _530 = fma(_518, _396, _524);
    float _532 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].y, _528);
    float _536 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].z, _530);
    float _538 = _532 * _468;
    float _540 = _534 * _470;
    float _542 = _536 * _472;
    bool _544 = !_346;
    float _562;
    if (!_544)
    {
        float _546 = in.m_41.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_80);
        float _568 = 1.0 / _566;
        float _570 = _114 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = _572 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _572 + _578;
    bool _582 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _584 = isnan(_572);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = _572 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _610 = 1.0 / _596;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _614 = 1.0 / _608;
    float _616 = 1.0 / _604;
    float _618 = _576 * _610;
    bool _620 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _622 = isnan(_572);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _630 * _634;
    float _638 = _580 * _614;
    bool _640 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _642 = isnan(_572);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _652;
    bool _656 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _658 = isnan(_572);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = _600 * _616;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _686;
    float _690 = _666 * _678;
    float _692 = fma(_654, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _698 = _650 * _674;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = _694 * _690;
    float _706 = _696 * _690;
    float _708 = _692 * _690;
    float _710 = -_666;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _706);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _704);
    float _722 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _708);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _724;
    float _728 = fma(_670, _638, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _730 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _732 = fma(_702, _638, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_728, _698, _718);
    float _744 = fma(_726, _618, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _746 = fma(_736, _618, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _748 = fma(_740, _618, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _750 = fma(_730, _698, _720);
    float _752 = fma(_732, _698, _722);
    float _754 = fma(_744, _636, _742);
    float _756 = fma(_746, _636, _750);
    float _758 = fma(_748, _636, _752);
    float _760 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].x, _754);
    float _762 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].y, _756);
    float _764 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].z, _758);
    bool _766 = !_612;
    float _784;
    if (!_766)
    {
        float _768 = in.m_41.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_80);
        float _790 = 1.0 / _788;
        float _792 = _114 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _806 = isnan(_794);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _822 = isnan(_794);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    bool _836 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _838 = isnan(_794);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _802;
    float _850 = -_814;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _856 = _830 * _852;
    float _858 = -_830;
    float _860 = _858 + 1.0;
    float _862 = 1.0 / _818;
    float _864 = _834 * _848;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _870 = fma(_864, _798, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _868 * _862;
    float _874 = _870 * _856;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _794 + _880;
    float _884 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _874);
    float _888 = _814 * _878;
    float _890 = fma(_872, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _892 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = fma(_890, _888, _886);
    float _898 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[117].x, _896);
    float _904 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _894;
    out.m_43.y = _904;
    out.m_43.z = _900;
    out.m_43.w = _906;
    bool _908 = !_854;
    float _926;
    if (!_908)
    {
        float _910 = in.m_41.x;
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _914 = _910 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _918 = _916 * _912;
        float _920 = floor(_918);
        float _922 = -_920;
        float _924 = _918 + _922;
        _926 = _924;
        _928 = true;
    }
    else
    {
        float _930 = float(_80);
        float _932 = 1.0 / _930;
        float _934 = _114 * _932;
        _926 = _934;
    }
    _928 = false;
    float _936 = _926;
    float _938 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _940 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _942 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _946 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _940);
    float _948 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _950 = in.m_41.w;
    float _952 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _944);
    float _954 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _958 = _956 != 0;
    float _960 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _948);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = _954 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _966 = in.m_45.x;
    float _968 = in.m_45.y;
    float _970 = in.m_45.z;
    float _972 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = _962 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = in.m_41.x;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _972 + _984;
    float _988 = _976 * _976;
    float _990 = in.m_41.y;
    float _992 = fma(_980, _980, _988);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = _528;
    float _1000 = _962;
    if (_958)
    {
        float _1002 = in.m_41.z;
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = fma(_986, _986, _992);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = in.m_47.y;
    bool _1014 = _950 > 0.5;
    float _1016 = sqrt(_1006);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = in.m_47.x;
    float _1024 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _968);
    float _1028 = 1.0 / _1010;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1044 = _1042 != 0;
    float _1046 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1048 = 1.0 / _1020;
    float _1050 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1052 = fma(_1046, -2.0, _1040);
    float _1054 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1056 = false;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    bool _1060 = _1014;
    float _1062 = _1006;
    if (_958)
    {
        bool _1064 = _1004 > 0.5;
        _1056 = _1064;
    }
    bool _1066 = _1056;
    float _1068 = _1050 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1070 = -_1012;
    float _1072 = _1070 + 1.0;
    float _1074 = rsqrt(_1006);
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _966);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _970);
    int _1082 = _1014 ? as_type<int>(_1072) : as_type<int>(_1012);
    float _1084 = -_1078;
    float _1086 = fma(_1034, 2.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1092;
    float _1096 = _1012;
    if (!_996)
    {
        _1058 = _990;
    }
    float _1098 = _1058;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = _1090 * _1028;
    float _1104 = precise::min(_1068, _1054);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1108 = _1094 * _1048;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1112 = _936 + _1110;
    float _1114 = _1098;
    if (_1032)
    {
        bool _1116 = _982 > 0.5;
        _1060 = _1116;
    }
    bool _1118 = _1060;
    float _1120 = _1074 * _1104;
    float _1122 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1106);
    if (_996)
    {
        _1114 = _982;
    }
    float _1124 = _1114;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    int _1128 = as_type<int>(_1124);
    if (!_996)
    {
        float _1130 = in.m_41.z;
        _1126 = _1130;
    }
    float _1132 = _1126;
    float _1134 = _976 * _1120;
    float _1136 = fma(_1108, _1112, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1138 = _980 * _1120;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1142 = _936 + _1140;
    float _1144 = -_1134;
    float _1146 = _976 + _1144;
    float _1148 = _1142;
    if (!_1032)
    {
        _1062 = _1022;
    }
    float _1150 = _1062;
    float _1152 = -_1138;
    float _1154 = _980 + _1152;
    float _1156 = fma(_1102, _1142, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1146 * _1146;
    float _1160 = _1150;
    if (!_1032)
    {
        _1148 = _1150;
    }
    float _1162 = _1148;
    float _1164 = -_114;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1168 = _1162;
    if (_1032)
    {
        _1160 = _1022;
    }
    float _1170 = _1160;
    float _1172 = fma(_1154, _1154, _1158);
    float _1174 = _986 * _1120;
    float _1176 = _1038 ? as_type<float>(_1082) : _1012;
    out.m_49.w = _1104;
    float _1178 = -_1174;
    float _1180 = _986 + _1178;
    bool _1182 = _990 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1190 = _1170;
    if (_1044)
    {
        float _1192 = _1182 ? _1072 : _1012;
        _1096 = _1192;
    }
    float _1194 = _1096;
    float _1196 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1180, _1180, _1172);
    float _1200 = _1132;
    if (!_996)
    {
        _1188 = _1132;
    }
    float _1202 = _1188;
    float _1204 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1206 = _1202;
    if (_996)
    {
        _1206 = _990;
    }
    float _1208 = _1206;
    float _1210 = fma(_1176, _1196, -0.5);
    if (_996)
    {
        _1200 = _990;
    }
    float _1212 = _1200;
    float _1214 = sqrt(_1198);
    bool _1216 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1218 = isnan(_936);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1230 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1232 = isnan(_936);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1204);
    bool _1244 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1246 = isnan(_936);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = _1254 * _1258;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1274 = _1240 * _1266;
    float _1276 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1270);
    if (_1032)
    {
        float _1280 = -_1170;
        float _1282 = _1280 + 1.0;
        _1128 = as_type<int>(_1282);
    }
    int _1284 = _1128;
    float _1286 = _1136 * _1274;
    float _1288 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1272);
    float _1290 = _1074 * _1214;
    float _1292 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = fma(_1262, _1194, -0.5);
    if (_1032)
    {
        float _1296 = _1118 ? as_type<float>(_1284) : _1170;
        _1168 = _1296;
    }
    float _1298 = _1168;
    float _1300 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1052);
    float _1302 = -_1240;
    float _1304 = _1302 + 1.0;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1308 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1310 = _1292 * _1290;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1316 = fma(_1308, _1298, -0.5);
    float _1318 = _1050 * _1290;
    float _1320 = _1310 * _1026;
    float _1322 = fma(_1156, _1268, _1314);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1326 = _1024 * _1290;
    float _1328 = _1318 * _1076;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1332 = -_1324;
    float _1334 = fma(_1276, 2.0, _1332);
    float _1336 = _1326 * _1080;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1330);
    int _1342 = as_type<int>(_1324);
    if (_958)
    {
        float _1344 = -_1170;
        float _1346 = _1344 + 1.0;
        _1342 = as_type<int>(_1346);
    }
    int _1348 = _1342;
    float _1350 = fma(_1228, -2.0, _1306);
    float _1352 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1338);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1340);
    if (_958)
    {
        float _1358 = _1066 ? as_type<float>(_1348) : _1170;
        _1190 = _1358;
    }
    float _1360 = _1190;
    float _1362 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1278);
    float _1366 = -_114;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1334);
    float _1370 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1288);
    float _1372 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1376 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1378 = fma(_1362, _1360, -0.5);
    float _1380 = fma(_1352, _1316, _1166);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1384 = _972 + _1376;
    float _1386 = fma(_1364, _1378, _1368);
    float _1388 = -_1134;
    float _1390 = _962 + _1388;
    float _1392 = _964 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1396 = _1384 + _1394;
    float _1398 = -_1372;
    float _1400 = fma(_1370, _1210, _1398);
    float _1402 = _1380 + 0.5;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1392 + _1404;
    float _1408 = _1396 * _1396;
    float _1410 = -_1138;
    float _1412 = _964 + _1410;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1322);
    float _1418 = fma(_1406, _1406, _1408);
    float _1420 = _1400 + 0.5;
    float _1422 = -_1174;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1414);
    float _1428 = sqrt(_1418);
    float _1430 = -_1300;
    float _1432 = fma(_1242, _1294, _1430);
    float _1434 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1426);
    float _1436 = _1386 + 0.5;
    float _1438 = _1432 + 0.5;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = 1.0 / _1442;
    float _1450 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    out.m_51.x = _1402;
    out.m_51.y = _1438;
    out.m_51.z = _1436;
    out.m_51.w = _1420;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_53.w = _1440;
    float _1468 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _1412;
    out.m_55.y = _1390;
    out.m_55.z = _1424;
    float _1472 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1474 = _1470 + _1442;
    float _1476 = _962 + _1472;
    float _1478 = _1474 * _1448;
    float _1480 = _1478 * 0.5;
    float _1482 = _1474;
    float _1484 = _1442;
    float _1486 = _1472;
    if (!_1466)
    {
        _1482 = _1392;
    }
    float _1488 = _1482;
    float _1490 = _1488;
    if (!_1466)
    {
        _1000 = _1384;
    }
    float _1492 = _1000;
    float _1494 = _1492;
    if (!_1466)
    {
        _1484 = _1476;
    }
    float _1496 = _1484;
    bool _1498 = !_1466;
    float _1500 = _1496;
    if (!_1498)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1506 = _1428 + _1504;
        float _1508 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = rsqrt(_1418);
        float _1512 = _1506 * _1502;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = _1514 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = _1514 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 + (-1.0);
        float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = fma(_1522, _1508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = fma(_1476, _1518, _1526);
        float _1532 = _1510 * _1528;
        float _1534 = fma(_1406, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1396, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1500 = _1530;
        _1486 = _1526;
        _1490 = _1534;
        _1494 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1486;
    float _1542 = _1490;
    float _1544 = _1494;
    float _1546 = -_1134;
    float _1548 = _1546 + _1538;
    float _1550 = _1540;
    if (_1462)
    {
        _1550 = 1.0;
    }
    float _1552 = _1550;
    float _1554 = _1552;
    if (!_1462)
    {
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1560 * 6.283185482025146484375;
        float _1566 = cos(_1564);
        float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1570 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1568);
        float _1572 = _1560 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1566;
        float _1578 = _1562 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1562 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1570;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1588;
        float _1598 = 1.0 / _1594;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1590 * _1600;
        float _1604 = _1586 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1608 = fma(_1604, _1602, _1606);
        float _1610 = _1608 * _1598;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        _1554 = _1612;
    }
    float _1614 = _1554;
    float _1616 = -_1138;
    float _1618 = _1616 + _1542;
    float _1620 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -_1174;
    float _1624 = _1622 + _1544;
    float _1626 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1632 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1640 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1632);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1634);
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1636);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1648 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1650 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1666 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1662);
    float _1672 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1664);
    float _1676 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1680 = _1614 > 0.0;
    bool _1682 = isnan(_1614);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1676);
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1700 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1670);
    float _1702 = _1692 + _1694;
    float _1704 = _1696 + _1694;
    float _1706 = _1694 * 0.5;
    float _1708 = _1702 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = fma(_1700, -0.5, _1706);
    out.m_57.x = _1318;
    out.m_59.x = _1618;
    out.m_59.y = _1548;
    out.m_59.z = _1624;
    out.m_35.x = _1698;
    out.gl_Position.x = _1692;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1696;
    out.gl_Position.w = _1694;
    out.m_61.x = _1708;
    out.m_61.y = _1712;
    out.m_61.z = _1710;
    out.m_61.w = _1694;
    if (_1688)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1714;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _928 = false;
    bool _786 = false;
    bool _564 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1771 = as_type<float>(_96);
        out.gl_Position.z = _1771;
    }
    if (!_84)
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
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_132);
        out.gl_Position.z = _1840;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_39.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_32.x;
    float _156 = in.m_32.y;
    float _158 = in.m_32.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = 1.0 / _300;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _304;
    float _342 = -_338;
    float _344 = _342 + 1.0;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _348 = 1.0 / _308;
    float _350 = _288 * _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _284 + _352;
    float _356 = 1.0 / _312;
    float _358 = _292 * _340;
    bool _360 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _362 = isnan(_284);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_370;
    float _374 = _372 + 1.0;
    float _376 = _296 * _348;
    float _378 = _354 * _356;
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = _390 * _374;
    float _398 = -_390;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = fma(_394, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = _326 * _400;
    float _414 = -_326;
    float _416 = _414 + 1.0;
    float _418 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_408, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _422 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_284);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _338 * _416;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _432 * _344;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_442, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = _418 * _448;
    float _460 = _420 * _448;
    float _462 = _410 * _448;
    float _464 = -_432;
    float _466 = _464 + 1.0;
    float _468 = in.m_39.x;
    float _470 = in.m_39.y;
    float _472 = in.m_39.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _486 = fma(_438, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _490 = fma(_476, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_452, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_454, _434, _482);
    float _498 = fma(_456, _434, _484);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = fma(_486, _434, _488);
    float _514 = fma(_502, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_490, _412, _496);
    float _522 = fma(_492, _412, _498);
    float _524 = fma(_494, _412, _512);
    float _526 = fma(_514, _396, _520);
    float _528 = fma(_516, _396, _522);
    float _530 = fma(_518, _396, _524);
    float _532 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].y, _528);
    float _536 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].z, _530);
    float _538 = _532 * _468;
    float _540 = _534 * _470;
    float _542 = _536 * _472;
    bool _544 = !_346;
    float _562;
    if (!_544)
    {
        float _546 = in.m_41.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_80);
        float _568 = 1.0 / _566;
        float _570 = _114 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = _572 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _572 + _578;
    bool _582 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _584 = isnan(_572);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = _572 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _610 = 1.0 / _596;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _614 = 1.0 / _608;
    float _616 = 1.0 / _604;
    float _618 = _576 * _610;
    bool _620 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _622 = isnan(_572);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _630 * _634;
    float _638 = _580 * _614;
    bool _640 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _642 = isnan(_572);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _652;
    bool _656 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _658 = isnan(_572);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = _600 * _616;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _686;
    float _690 = _666 * _678;
    float _692 = fma(_654, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _698 = _650 * _674;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = _694 * _690;
    float _706 = _696 * _690;
    float _708 = _692 * _690;
    float _710 = -_666;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _706);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _704);
    float _722 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _708);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _724;
    float _728 = fma(_670, _638, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _730 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _732 = fma(_702, _638, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_728, _698, _718);
    float _744 = fma(_726, _618, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _746 = fma(_736, _618, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _748 = fma(_740, _618, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _750 = fma(_730, _698, _720);
    float _752 = fma(_732, _698, _722);
    float _754 = fma(_744, _636, _742);
    float _756 = fma(_746, _636, _750);
    float _758 = fma(_748, _636, _752);
    float _760 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].x, _754);
    float _762 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].y, _756);
    float _764 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].z, _758);
    bool _766 = !_612;
    float _784;
    if (!_766)
    {
        float _768 = in.m_41.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_80);
        float _790 = 1.0 / _788;
        float _792 = _114 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _806 = isnan(_794);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _822 = isnan(_794);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    bool _836 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _838 = isnan(_794);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _802;
    float _850 = -_814;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _856 = _830 * _852;
    float _858 = -_830;
    float _860 = _858 + 1.0;
    float _862 = 1.0 / _818;
    float _864 = _834 * _848;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _870 = fma(_864, _798, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _868 * _862;
    float _874 = _870 * _856;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _794 + _880;
    float _884 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _874);
    float _888 = _814 * _878;
    float _890 = fma(_872, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _892 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = fma(_890, _888, _886);
    float _898 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[117].x, _896);
    float _904 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _894;
    out.m_43.y = _904;
    out.m_43.z = _900;
    out.m_43.w = _906;
    bool _908 = !_854;
    float _926;
    if (!_908)
    {
        float _910 = in.m_41.x;
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _914 = _910 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _918 = _916 * _912;
        float _920 = floor(_918);
        float _922 = -_920;
        float _924 = _918 + _922;
        _926 = _924;
        _928 = true;
    }
    else
    {
        float _930 = float(_80);
        float _932 = 1.0 / _930;
        float _934 = _114 * _932;
        _926 = _934;
    }
    _928 = false;
    float _936 = _926;
    float _938 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _940 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _942 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _946 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _940);
    float _948 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _950 = in.m_41.w;
    float _952 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _944);
    float _954 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _958 = _956 != 0;
    float _960 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _948);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = _954 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _966 = in.m_45.x;
    float _968 = in.m_45.y;
    float _970 = in.m_45.z;
    float _972 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = _962 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = in.m_41.x;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _972 + _984;
    float _988 = _976 * _976;
    float _990 = in.m_41.y;
    float _992 = fma(_980, _980, _988);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = _528;
    float _1000 = _962;
    if (_958)
    {
        float _1002 = in.m_41.z;
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = fma(_986, _986, _992);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = in.m_47.y;
    bool _1014 = _950 > 0.5;
    float _1016 = sqrt(_1006);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = in.m_47.x;
    float _1024 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _968);
    float _1028 = 1.0 / _1010;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1044 = _1042 != 0;
    float _1046 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1048 = 1.0 / _1020;
    float _1050 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1052 = fma(_1046, -2.0, _1040);
    float _1054 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1056 = false;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    bool _1060 = _1014;
    float _1062 = _1006;
    if (_958)
    {
        bool _1064 = _1004 > 0.5;
        _1056 = _1064;
    }
    bool _1066 = _1056;
    float _1068 = _1050 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1070 = -_1012;
    float _1072 = _1070 + 1.0;
    float _1074 = rsqrt(_1006);
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _966);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _970);
    int _1082 = _1014 ? as_type<int>(_1072) : as_type<int>(_1012);
    float _1084 = -_1078;
    float _1086 = fma(_1034, 2.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1092;
    float _1096 = _1012;
    if (!_996)
    {
        _1058 = _990;
    }
    float _1098 = _1058;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = _1090 * _1028;
    float _1104 = precise::min(_1068, _1054);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1108 = _1094 * _1048;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1112 = _936 + _1110;
    float _1114 = _1098;
    if (_1032)
    {
        bool _1116 = _982 > 0.5;
        _1060 = _1116;
    }
    bool _1118 = _1060;
    float _1120 = _1074 * _1104;
    float _1122 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1106);
    if (_996)
    {
        _1114 = _982;
    }
    float _1124 = _1114;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    int _1128 = as_type<int>(_1124);
    if (!_996)
    {
        float _1130 = in.m_41.z;
        _1126 = _1130;
    }
    float _1132 = _1126;
    float _1134 = _976 * _1120;
    float _1136 = fma(_1108, _1112, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1138 = _980 * _1120;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1142 = _936 + _1140;
    float _1144 = -_1134;
    float _1146 = _976 + _1144;
    float _1148 = _1142;
    if (!_1032)
    {
        _1062 = _1022;
    }
    float _1150 = _1062;
    float _1152 = -_1138;
    float _1154 = _980 + _1152;
    float _1156 = fma(_1102, _1142, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1146 * _1146;
    float _1160 = _1150;
    if (!_1032)
    {
        _1148 = _1150;
    }
    float _1162 = _1148;
    float _1164 = -_114;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1168 = _1162;
    if (_1032)
    {
        _1160 = _1022;
    }
    float _1170 = _1160;
    float _1172 = fma(_1154, _1154, _1158);
    float _1174 = _986 * _1120;
    float _1176 = _1038 ? as_type<float>(_1082) : _1012;
    out.m_49.w = _1104;
    float _1178 = -_1174;
    float _1180 = _986 + _1178;
    bool _1182 = _990 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1190 = _1170;
    if (_1044)
    {
        float _1192 = _1182 ? _1072 : _1012;
        _1096 = _1192;
    }
    float _1194 = _1096;
    float _1196 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1180, _1180, _1172);
    float _1200 = _1132;
    if (!_996)
    {
        _1188 = _1132;
    }
    float _1202 = _1188;
    float _1204 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1206 = _1202;
    if (_996)
    {
        _1206 = _990;
    }
    float _1208 = _1206;
    float _1210 = fma(_1176, _1196, -0.5);
    if (_996)
    {
        _1200 = _990;
    }
    float _1212 = _1200;
    float _1214 = sqrt(_1198);
    bool _1216 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1218 = isnan(_936);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1230 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1232 = isnan(_936);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1204);
    bool _1244 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1246 = isnan(_936);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = _1254 * _1258;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1274 = _1240 * _1266;
    float _1276 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1270);
    if (_1032)
    {
        float _1280 = -_1170;
        float _1282 = _1280 + 1.0;
        _1128 = as_type<int>(_1282);
    }
    int _1284 = _1128;
    float _1286 = _1136 * _1274;
    float _1288 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1272);
    float _1290 = _1074 * _1214;
    float _1292 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = fma(_1262, _1194, -0.5);
    if (_1032)
    {
        float _1296 = _1118 ? as_type<float>(_1284) : _1170;
        _1168 = _1296;
    }
    float _1298 = _1168;
    float _1300 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1052);
    float _1302 = -_1240;
    float _1304 = _1302 + 1.0;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1308 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1310 = _1292 * _1290;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1316 = fma(_1308, _1298, -0.5);
    float _1318 = _1050 * _1290;
    float _1320 = _1310 * _1026;
    float _1322 = fma(_1156, _1268, _1314);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1326 = _1024 * _1290;
    float _1328 = _1318 * _1076;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1332 = -_1324;
    float _1334 = fma(_1276, 2.0, _1332);
    float _1336 = _1326 * _1080;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1330);
    int _1342 = as_type<int>(_1324);
    if (_958)
    {
        float _1344 = -_1170;
        float _1346 = _1344 + 1.0;
        _1342 = as_type<int>(_1346);
    }
    int _1348 = _1342;
    float _1350 = fma(_1228, -2.0, _1306);
    float _1352 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1338);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1340);
    if (_958)
    {
        float _1358 = _1066 ? as_type<float>(_1348) : _1170;
        _1190 = _1358;
    }
    float _1360 = _1190;
    float _1362 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1278);
    float _1366 = -_114;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1334);
    float _1370 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1288);
    float _1372 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1376 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1378 = fma(_1362, _1360, -0.5);
    float _1380 = fma(_1352, _1316, _1166);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1384 = _972 + _1376;
    float _1386 = fma(_1364, _1378, _1368);
    float _1388 = -_1134;
    float _1390 = _962 + _1388;
    float _1392 = _964 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1396 = _1384 + _1394;
    float _1398 = -_1372;
    float _1400 = fma(_1370, _1210, _1398);
    float _1402 = _1380 + 0.5;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1392 + _1404;
    float _1408 = _1396 * _1396;
    float _1410 = -_1138;
    float _1412 = _964 + _1410;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1322);
    float _1418 = fma(_1406, _1406, _1408);
    float _1420 = _1400 + 0.5;
    float _1422 = -_1174;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1414);
    float _1428 = sqrt(_1418);
    float _1430 = -_1300;
    float _1432 = fma(_1242, _1294, _1430);
    float _1434 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1426);
    float _1436 = _1386 + 0.5;
    float _1438 = _1432 + 0.5;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = 1.0 / _1442;
    float _1450 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    out.m_51.x = _1402;
    out.m_51.y = _1438;
    out.m_51.z = _1436;
    out.m_51.w = _1420;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_53.w = _1440;
    float _1468 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _1412;
    out.m_55.y = _1390;
    out.m_55.z = _1424;
    float _1472 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1474 = _1470 + _1442;
    float _1476 = _962 + _1472;
    float _1478 = _1474 * _1448;
    float _1480 = _1478 * 0.5;
    float _1482 = _1474;
    float _1484 = _1442;
    float _1486 = _1472;
    if (!_1466)
    {
        _1482 = _1392;
    }
    float _1488 = _1482;
    float _1490 = _1488;
    if (!_1466)
    {
        _1000 = _1384;
    }
    float _1492 = _1000;
    float _1494 = _1492;
    if (!_1466)
    {
        _1484 = _1476;
    }
    float _1496 = _1484;
    bool _1498 = !_1466;
    float _1500 = _1496;
    if (!_1498)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1506 = _1428 + _1504;
        float _1508 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = rsqrt(_1418);
        float _1512 = _1506 * _1502;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = _1514 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = _1514 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 + (-1.0);
        float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = fma(_1522, _1508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = fma(_1476, _1518, _1526);
        float _1532 = _1510 * _1528;
        float _1534 = fma(_1406, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1396, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1500 = _1530;
        _1486 = _1526;
        _1490 = _1534;
        _1494 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1486;
    float _1542 = _1490;
    float _1544 = _1494;
    float _1546 = -_1134;
    float _1548 = _1546 + _1538;
    float _1550 = _1540;
    if (_1462)
    {
        _1550 = 1.0;
    }
    float _1552 = _1550;
    float _1554 = _1552;
    if (!_1462)
    {
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1560 * 6.283185482025146484375;
        float _1566 = cos(_1564);
        float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1570 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1568);
        float _1572 = _1560 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1566;
        float _1578 = _1562 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1562 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1570;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1588;
        float _1598 = 1.0 / _1594;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1590 * _1600;
        float _1604 = _1586 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1608 = fma(_1604, _1602, _1606);
        float _1610 = _1608 * _1598;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        _1554 = _1612;
    }
    float _1614 = _1554;
    float _1616 = -_1138;
    float _1618 = _1616 + _1542;
    float _1620 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -_1174;
    float _1624 = _1622 + _1544;
    float _1626 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1632 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1640 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1632);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1634);
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1636);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1648 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1650 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1666 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1662);
    float _1672 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1664);
    float _1676 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1680 = _1614 > 0.0;
    bool _1682 = isnan(_1614);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1676);
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1700 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1670);
    float _1702 = _1692 + _1694;
    float _1704 = _1696 + _1694;
    float _1706 = _1694 * 0.5;
    float _1708 = _1702 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = fma(_1700, -0.5, _1706);
    out.m_57.x = _1318;
    out.m_59.x = _1618;
    out.m_59.y = _1548;
    out.m_59.z = _1624;
    out.m_35.x = _1698;
    out.gl_Position.x = _1692;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1696;
    out.gl_Position.w = _1694;
    out.m_61.x = _1708;
    out.m_61.y = _1712;
    out.m_61.z = _1710;
    out.m_61.w = _1694;
    if (_1688)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1714;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _928 = false;
    bool _786 = false;
    bool _564 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1771 = as_type<float>(_96);
        out.gl_Position.z = _1771;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_37.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_132);
        out.gl_Position.z = _1840;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_39.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_32.x;
    float _156 = in.m_32.y;
    float _158 = in.m_32.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = 1.0 / _300;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _304;
    float _342 = -_338;
    float _344 = _342 + 1.0;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _348 = 1.0 / _308;
    float _350 = _288 * _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _284 + _352;
    float _356 = 1.0 / _312;
    float _358 = _292 * _340;
    bool _360 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _362 = isnan(_284);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_370;
    float _374 = _372 + 1.0;
    float _376 = _296 * _348;
    float _378 = _354 * _356;
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = _390 * _374;
    float _398 = -_390;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = fma(_394, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = _326 * _400;
    float _414 = -_326;
    float _416 = _414 + 1.0;
    float _418 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_408, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _422 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_284);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _338 * _416;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _432 * _344;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_442, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = _418 * _448;
    float _460 = _420 * _448;
    float _462 = _410 * _448;
    float _464 = -_432;
    float _466 = _464 + 1.0;
    float _468 = in.m_39.x;
    float _470 = in.m_39.y;
    float _472 = in.m_39.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _486 = fma(_438, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _490 = fma(_476, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_452, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_454, _434, _482);
    float _498 = fma(_456, _434, _484);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = fma(_486, _434, _488);
    float _514 = fma(_502, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_506, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_510, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_490, _412, _496);
    float _522 = fma(_492, _412, _498);
    float _524 = fma(_494, _412, _512);
    float _526 = fma(_514, _396, _520);
    float _528 = fma(_516, _396, _522);
    float _530 = fma(_518, _396, _524);
    float _532 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].y, _528);
    float _536 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[147].z, _530);
    float _538 = _532 * _468;
    float _540 = _534 * _470;
    float _542 = _536 * _472;
    bool _544 = !_346;
    float _562;
    if (!_544)
    {
        float _546 = in.m_41.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_80);
        float _568 = 1.0 / _566;
        float _570 = _114 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = _572 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _580 = _572 + _578;
    bool _582 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _584 = isnan(_572);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = _572 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _610 = 1.0 / _596;
    bool _612 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _614 = 1.0 / _608;
    float _616 = 1.0 / _604;
    float _618 = _576 * _610;
    bool _620 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _622 = isnan(_572);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _630 * _634;
    float _638 = _580 * _614;
    bool _640 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _642 = isnan(_572);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _652;
    bool _656 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _658 = isnan(_572);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = _600 * _616;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _686;
    float _690 = _666 * _678;
    float _692 = fma(_654, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _698 = _650 * _674;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = _694 * _690;
    float _706 = _696 * _690;
    float _708 = _692 * _690;
    float _710 = -_666;
    float _712 = _710 + 1.0;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].x, _706);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].y, _704);
    float _722 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[107].z, _708);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _724;
    float _728 = fma(_670, _638, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _730 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _732 = fma(_702, _638, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_728, _698, _718);
    float _744 = fma(_726, _618, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _746 = fma(_736, _618, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _748 = fma(_740, _618, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _750 = fma(_730, _698, _720);
    float _752 = fma(_732, _698, _722);
    float _754 = fma(_744, _636, _742);
    float _756 = fma(_746, _636, _750);
    float _758 = fma(_748, _636, _752);
    float _760 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].x, _754);
    float _762 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].y, _756);
    float _764 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[110].z, _758);
    bool _766 = !_612;
    float _784;
    if (!_766)
    {
        float _768 = in.m_41.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_80);
        float _790 = 1.0 / _788;
        float _792 = _114 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _806 = isnan(_794);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _822 = isnan(_794);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    bool _836 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _838 = isnan(_794);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _802;
    float _850 = -_814;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _856 = _830 * _852;
    float _858 = -_830;
    float _860 = _858 + 1.0;
    float _862 = 1.0 / _818;
    float _864 = _834 * _848;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _870 = fma(_864, _798, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _868 * _862;
    float _874 = _870 * _856;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _794 + _880;
    float _884 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _874);
    float _888 = _814 * _878;
    float _890 = fma(_872, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _892 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = fma(_890, _888, _886);
    float _898 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[117].x, _896);
    float _904 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _894;
    out.m_43.y = _904;
    out.m_43.z = _900;
    out.m_43.w = _906;
    bool _908 = !_854;
    float _926;
    if (!_908)
    {
        float _910 = in.m_41.x;
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _914 = _910 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _918 = _916 * _912;
        float _920 = floor(_918);
        float _922 = -_920;
        float _924 = _918 + _922;
        _926 = _924;
        _928 = true;
    }
    else
    {
        float _930 = float(_80);
        float _932 = 1.0 / _930;
        float _934 = _114 * _932;
        _926 = _934;
    }
    _928 = false;
    float _936 = _926;
    float _938 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _940 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _942 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _938);
    float _946 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _940);
    float _948 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _950 = in.m_41.w;
    float _952 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _944);
    float _954 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _958 = _956 != 0;
    float _960 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _948);
    float _962 = _952 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _964 = _954 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _966 = in.m_45.x;
    float _968 = in.m_45.y;
    float _970 = in.m_45.z;
    float _972 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = _962 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = in.m_41.x;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _972 + _984;
    float _988 = _976 * _976;
    float _990 = in.m_41.y;
    float _992 = fma(_980, _980, _988);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = _528;
    float _1000 = _962;
    if (_958)
    {
        float _1002 = in.m_41.z;
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = fma(_986, _986, _992);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1012 = in.m_47.y;
    bool _1014 = _950 > 0.5;
    float _1016 = sqrt(_1006);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = in.m_47.x;
    float _1024 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _968);
    float _1028 = 1.0 / _1010;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1038 = _1036 != 0;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1044 = _1042 != 0;
    float _1046 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1048 = 1.0 / _1020;
    float _1050 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1052 = fma(_1046, -2.0, _1040);
    float _1054 = _1016 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1056 = false;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x;
    bool _1060 = _1014;
    float _1062 = _1006;
    if (_958)
    {
        bool _1064 = _1004 > 0.5;
        _1056 = _1064;
    }
    bool _1066 = _1056;
    float _1068 = _1050 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1070 = -_1012;
    float _1072 = _1070 + 1.0;
    float _1074 = rsqrt(_1006);
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _966);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _970);
    int _1082 = _1014 ? as_type<int>(_1072) : as_type<int>(_1012);
    float _1084 = -_1078;
    float _1086 = fma(_1034, 2.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1092;
    float _1096 = _1012;
    if (!_996)
    {
        _1058 = _990;
    }
    float _1098 = _1058;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1102 = _1090 * _1028;
    float _1104 = precise::min(_1068, _1054);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1108 = _1094 * _1048;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1112 = _936 + _1110;
    float _1114 = _1098;
    if (_1032)
    {
        bool _1116 = _982 > 0.5;
        _1060 = _1116;
    }
    bool _1118 = _1060;
    float _1120 = _1074 * _1104;
    float _1122 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1106);
    if (_996)
    {
        _1114 = _982;
    }
    float _1124 = _1114;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    int _1128 = as_type<int>(_1124);
    if (!_996)
    {
        float _1130 = in.m_41.z;
        _1126 = _1130;
    }
    float _1132 = _1126;
    float _1134 = _976 * _1120;
    float _1136 = fma(_1108, _1112, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1138 = _980 * _1120;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1142 = _936 + _1140;
    float _1144 = -_1134;
    float _1146 = _976 + _1144;
    float _1148 = _1142;
    if (!_1032)
    {
        _1062 = _1022;
    }
    float _1150 = _1062;
    float _1152 = -_1138;
    float _1154 = _980 + _1152;
    float _1156 = fma(_1102, _1142, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1146 * _1146;
    float _1160 = _1150;
    if (!_1032)
    {
        _1148 = _1150;
    }
    float _1162 = _1148;
    float _1164 = -_114;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1168 = _1162;
    if (_1032)
    {
        _1160 = _1022;
    }
    float _1170 = _1160;
    float _1172 = fma(_1154, _1154, _1158);
    float _1174 = _986 * _1120;
    float _1176 = _1038 ? as_type<float>(_1082) : _1012;
    out.m_49.w = _1104;
    float _1178 = -_1174;
    float _1180 = _986 + _1178;
    bool _1182 = _990 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1190 = _1170;
    if (_1044)
    {
        float _1192 = _1182 ? _1072 : _1012;
        _1096 = _1192;
    }
    float _1194 = _1096;
    float _1196 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1198 = fma(_1180, _1180, _1172);
    float _1200 = _1132;
    if (!_996)
    {
        _1188 = _1132;
    }
    float _1202 = _1188;
    float _1204 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1206 = _1202;
    if (_996)
    {
        _1206 = _990;
    }
    float _1208 = _1206;
    float _1210 = fma(_1176, _1196, -0.5);
    if (_996)
    {
        _1200 = _990;
    }
    float _1212 = _1200;
    float _1214 = sqrt(_1198);
    bool _1216 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1218 = isnan(_936);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1230 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1232 = isnan(_936);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1204);
    bool _1244 = _936 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1246 = isnan(_936);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = _1254 * _1258;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1274 = _1240 * _1266;
    float _1276 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1278 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1270);
    if (_1032)
    {
        float _1280 = -_1170;
        float _1282 = _1280 + 1.0;
        _1128 = as_type<int>(_1282);
    }
    int _1284 = _1128;
    float _1286 = _1136 * _1274;
    float _1288 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1272);
    float _1290 = _1074 * _1214;
    float _1292 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = fma(_1262, _1194, -0.5);
    if (_1032)
    {
        float _1296 = _1118 ? as_type<float>(_1284) : _1170;
        _1168 = _1296;
    }
    float _1298 = _1168;
    float _1300 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1052);
    float _1302 = -_1240;
    float _1304 = _1302 + 1.0;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1308 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1310 = _1292 * _1290;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1316 = fma(_1308, _1298, -0.5);
    float _1318 = _1050 * _1290;
    float _1320 = _1310 * _1026;
    float _1322 = fma(_1156, _1268, _1314);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1326 = _1024 * _1290;
    float _1328 = _1318 * _1076;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1332 = -_1324;
    float _1334 = fma(_1276, 2.0, _1332);
    float _1336 = _1326 * _1080;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1340 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1330);
    int _1342 = as_type<int>(_1324);
    if (_958)
    {
        float _1344 = -_1170;
        float _1346 = _1344 + 1.0;
        _1342 = as_type<int>(_1346);
    }
    int _1348 = _1342;
    float _1350 = fma(_1228, -2.0, _1306);
    float _1352 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1122);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1338);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1340);
    if (_958)
    {
        float _1358 = _1066 ? as_type<float>(_1348) : _1170;
        _1190 = _1358;
    }
    float _1360 = _1190;
    float _1362 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1278);
    float _1366 = -_114;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1334);
    float _1370 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1288);
    float _1372 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1376 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1378 = fma(_1362, _1360, -0.5);
    float _1380 = fma(_1352, _1316, _1166);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1384 = _972 + _1376;
    float _1386 = fma(_1364, _1378, _1368);
    float _1388 = -_1134;
    float _1390 = _962 + _1388;
    float _1392 = _964 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1396 = _1384 + _1394;
    float _1398 = -_1372;
    float _1400 = fma(_1370, _1210, _1398);
    float _1402 = _1380 + 0.5;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1392 + _1404;
    float _1408 = _1396 * _1396;
    float _1410 = -_1138;
    float _1412 = _964 + _1410;
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1416 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1322);
    float _1418 = fma(_1406, _1406, _1408);
    float _1420 = _1400 + 0.5;
    float _1422 = -_1174;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1414);
    float _1428 = sqrt(_1418);
    float _1430 = -_1300;
    float _1432 = fma(_1242, _1294, _1430);
    float _1434 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1426);
    float _1436 = _1386 + 0.5;
    float _1438 = _1432 + 0.5;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1444 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1446 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = 1.0 / _1442;
    float _1450 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1444);
    float _1452 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    out.m_51.x = _1402;
    out.m_51.y = _1438;
    out.m_51.z = _1436;
    out.m_51.w = _1420;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1450);
    bool _1466 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_53.w = _1440;
    float _1468 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_55.x = _1412;
    out.m_55.y = _1390;
    out.m_55.z = _1424;
    float _1472 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1474 = _1470 + _1442;
    float _1476 = _962 + _1472;
    float _1478 = _1474 * _1448;
    float _1480 = _1478 * 0.5;
    float _1482 = _1474;
    float _1484 = _1442;
    float _1486 = _1472;
    if (!_1466)
    {
        _1482 = _1392;
    }
    float _1488 = _1482;
    float _1490 = _1488;
    if (!_1466)
    {
        _1000 = _1384;
    }
    float _1492 = _1000;
    float _1494 = _1492;
    if (!_1466)
    {
        _1484 = _1476;
    }
    float _1496 = _1484;
    bool _1498 = !_1466;
    float _1500 = _1496;
    if (!_1498)
    {
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1506 = _1428 + _1504;
        float _1508 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = rsqrt(_1418);
        float _1512 = _1506 * _1502;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = _1514 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = _1514 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 + (-1.0);
        float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = fma(_1522, _1508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = fma(_1476, _1518, _1526);
        float _1532 = _1510 * _1528;
        float _1534 = fma(_1406, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1396, _1532, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1500 = _1530;
        _1486 = _1526;
        _1490 = _1534;
        _1494 = _1536;
    }
    float _1538 = _1500;
    float _1540 = _1486;
    float _1542 = _1490;
    float _1544 = _1494;
    float _1546 = -_1134;
    float _1548 = _1546 + _1538;
    float _1550 = _1540;
    if (_1462)
    {
        _1550 = 1.0;
    }
    float _1552 = _1550;
    float _1554 = _1552;
    if (!_1462)
    {
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1560 = _1556 * 0.15915493667125701904296875;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1560 * 6.283185482025146484375;
        float _1566 = cos(_1564);
        float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1570 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1568);
        float _1572 = _1560 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = 1.0 / _1566;
        float _1578 = _1562 * 6.283185482025146484375;
        float _1580 = cos(_1578);
        float _1582 = _1574 * _1576;
        float _1584 = _1562 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1580 * _1582;
        float _1590 = 1.0 / _1570;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1592;
        float _1596 = 1.0 / _1588;
        float _1598 = 1.0 / _1594;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1590 * _1600;
        float _1604 = _1586 * _1596;
        float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1608 = fma(_1604, _1602, _1606);
        float _1610 = _1608 * _1598;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        _1554 = _1612;
    }
    float _1614 = _1554;
    float _1616 = -_1138;
    float _1618 = _1616 + _1542;
    float _1620 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1622 = -_1174;
    float _1624 = _1622 + _1544;
    float _1626 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1620);
    float _1632 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1630);
    float _1640 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1632);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1634);
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1636);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1648 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1650 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1666 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1662);
    float _1672 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1664);
    float _1676 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1680 = _1614 > 0.0;
    bool _1682 = isnan(_1614);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1692 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
    float _1694 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1678);
    float _1696 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1676);
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1700 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1670);
    float _1702 = _1692 + _1694;
    float _1704 = _1696 + _1694;
    float _1706 = _1694 * 0.5;
    float _1708 = _1702 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = fma(_1700, -0.5, _1706);
    out.m_57.x = _1318;
    out.m_59.x = _1618;
    out.m_59.y = _1548;
    out.m_59.z = _1624;
    out.m_35.x = _1698;
    out.gl_Position.x = _1692;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1696;
    out.gl_Position.w = _1694;
    out.m_61.x = _1708;
    out.m_61.y = _1712;
    out.m_61.z = _1710;
    out.m_61.w = _1694;
    if (_1688)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1714;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

