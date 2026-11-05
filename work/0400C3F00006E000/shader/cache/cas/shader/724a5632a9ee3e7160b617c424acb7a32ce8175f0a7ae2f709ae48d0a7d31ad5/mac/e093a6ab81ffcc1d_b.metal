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
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_65 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_47 [[attribute(1)]];
    float4 m_45 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_53 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
    float4 m_37 [[attribute(10)]];
    float4 m_57 [[attribute(12)]];
    float4 m_51 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _1104 = false;
    bool _726 = false;
    bool _552 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_102);
        out.gl_Position.z = _2646;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_35.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _94;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _104 = as_type<int>(_132);
    }
    int _134 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_134);
        out.gl_Position.z = _2709;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_37.w;
    float _138 = 1.0 / _108;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    float _258 = fma(_252, _136, _162);
    float _260 = _112 * _138;
    bool _262 = !_240;
    float _280;
    if (!_262)
    {
        float _264 = in.m_39.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        _280 = _260;
    }
    _282 = false;
    float _284 = _280;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _304;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _308;
    bool _332 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _334 = isnan(_284);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_342;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _312;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _352 = _284 + _350;
    float _354 = 1.0 / _300;
    float _356 = _352 * _314;
    bool _358 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _360 = isnan(_284);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _288 * _330;
    bool _372 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _374 = isnan(_284);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _292 * _348;
    bool _390 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _392 = isnan(_284);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _382 * _386;
    float _404 = -_382;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = _296 * _354;
    float _418 = _342 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _428 = _400 * _346;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _434;
    float _438 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_422, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = _326 * _432;
    float _448 = fma(_436, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _450 = fma(_414, _388, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _388, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = _438 * _446;
    float _458 = _440 * _446;
    float _460 = -_326;
    float _462 = _460 + 1.0;
    float _464 = _448 * _446;
    float _466 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_450, _428, _466);
    float _486 = fma(_454, _428, _470);
    float _488 = fma(_474, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_478, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _492 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _494 = fma(_452, _428, _468);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _418, _484);
    float _510 = fma(_498, _356, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _356, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_490, _418, _494);
    float _518 = fma(_492, _418, _486);
    float _520 = fma(_510, _402, _508);
    float _522 = fma(_512, _402, _516);
    float _524 = fma(_514, _402, _518);
    float _526 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_328;
    float _550;
    if (!_532)
    {
        float _534 = in.m_39.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        _550 = _260;
    }
    _552 = false;
    float _554 = _550;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _582 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_554);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_554);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _616 = 1.0 / _562;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _592 * _600;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _612 * _626;
    float _630 = 1.0 / _580;
    float _632 = _596 * _576;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _554 + _634;
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = fma(_632, _636, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _554 + _644;
    float _648 = _620 * _616;
    bool _650 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _652 = isnan(_554);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _662;
    float _666 = _642 * _628;
    float _668 = fma(_648, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _554 + _670;
    float _674 = -_660;
    float _676 = _674 + 1.0;
    float _678 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _666);
    float _680 = _664 * _630;
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _574 * _676;
    float _686 = fma(_668, _622, _678);
    float _688 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _684, _686);
    float _694 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[118].x, _692);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _696;
    out.m_41.y = _698;
    out.m_41.z = _702;
    out.m_41.w = _704;
    bool _706 = !_614;
    float _724;
    if (!_706)
    {
        float _708 = in.m_39.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].z, _112);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        _724 = _260;
    }
    _726 = false;
    float _728 = _724;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _760 = _728 + _758;
    bool _762 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _764 = isnan(_728);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -_772;
    float _776 = _774 + 1.0;
    float _778 = 1.0 / _736;
    float _780 = _760 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = _728 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _728 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _792 = _728 + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _796 = 1.0 / _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _800 = _728 + _798;
    float _802 = _784 * _756;
    bool _804 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _806 = isnan(_728);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = 1.0 / _750;
    float _818 = _800 * _778;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _822 = _728 + _820;
    float _824 = -_814;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _832;
    float _836 = 1.0 / _754;
    float _838 = _788 * _796;
    bool _840 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _842 = isnan(_728);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = fma(_834, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _854 = _822 * _816;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _856;
    float _860 = _850 * _826;
    float _862 = -_850;
    float _864 = _862 + 1.0;
    float _866 = fma(_830, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = fma(_858, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _870 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _872 = isnan(_728);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _772 * _864;
    float _884 = _792 * _836;
    bool _886 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _888 = isnan(_728);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = _880 * _776;
    bool _904 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _906 = isnan(_728);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_880;
    float _918 = _916 + 1.0;
    bool _920 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _922 = isnan(_728);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = _896 * _918;
    float _942 = -_896;
    float _944 = _942 + 1.0;
    float _946 = -_930;
    float _948 = _946 + 1.0;
    float _950 = fma(_934, _818, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _952 = fma(_900, _818, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _954 = _914 * _948;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = fma(_938, _818, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _962 = _930 * _944;
    float _964 = _866 * _954;
    float _966 = _868 * _954;
    float _968 = _852 * _954;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _978 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].x, _964);
    float _980 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].y, _966);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _982;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _990 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].z, _968);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _996 = fma(_950, _962, _978);
    float _998 = fma(_952, _962, _980);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1000;
    float _1004 = fma(_976, _838, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1006 = fma(_988, _838, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1008 = fma(_960, _962, _990);
    float _1010 = fma(_984, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1012 = fma(_994, _838, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1014 = fma(_972, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1016 = fma(_1002, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = fma(_1010, _940, _998);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1024;
    float _1028 = fma(_1014, _940, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1016, _940, _1008);
    float _1036 = fma(_1022, _854, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1026, _854, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1032, _854, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1042 = fma(_1004, _902, _1028);
    float _1044 = fma(_1006, _902, _1018);
    float _1046 = fma(_1012, _902, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1060 = fma(_1036, _882, _1042);
    float _1062 = fma(_1050, _884, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1064 = fma(_1054, _884, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1066 = fma(_1058, _884, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1068 = fma(_1038, _882, _1044);
    float _1070 = fma(_1040, _882, _1046);
    float _1072 = fma(_1062, _860, _1060);
    float _1074 = fma(_1064, _860, _1068);
    float _1076 = fma(_1066, _860, _1070);
    float _1078 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1072);
    float _1080 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1074);
    float _1082 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1076);
    bool _1084 = !_794;
    float _1102;
    if (!_1084)
    {
        float _1086 = in.m_39.x;
        float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1090 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1094 = _1092 * _1088;
        float _1096 = floor(_1094);
        float _1098 = -_1096;
        float _1100 = _1094 + _1098;
        _1102 = _1100;
        _1104 = true;
    }
    else
    {
        _1102 = _260;
    }
    _1104 = false;
    float _1106 = _1102;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1128 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1106);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1110;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -_1122;
    float _1148 = _1146 + 1.0;
    bool _1150 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1152 = isnan(_1106);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    bool _1162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1164 = _1138 * _1148;
    float _1166 = -_1138;
    float _1168 = _1166 + 1.0;
    float _1170 = 1.0 / _1126;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1176 = _1144 * _1140;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1180 = _1106 + _1178;
    float _1182 = -_1160;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1106 + _1188;
    float _1192 = _1122 * _1184;
    float _1194 = _1174 * _1170;
    float _1196 = _1186 * _1164;
    float _1198 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1202 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1196);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = fma(_1202, _1192, _1204);
    float _1212 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _1206;
    out.m_43.y = _1208;
    out.m_43.z = _1216;
    out.m_43.w = _1218;
    bool _1220 = !_1162;
    float _1238;
    if (!_1220)
    {
        float _1222 = in.m_39.x;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1226 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[14].x, _112);
        float _1230 = _1228 * _1224;
        float _1232 = floor(_1230);
        float _1234 = -_1232;
        float _1236 = _1230 + _1234;
        _1238 = _1236;
        _1240 = true;
    }
    else
    {
        _1238 = _260;
    }
    _1240 = false;
    float _1242 = _1238;
    float _1244 = in.m_45.x;
    float _1246 = in.m_45.y;
    float _1248 = in.m_45.z;
    float _1250 = in.m_45.w;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1254 = _1242 + _1252;
    float _1256 = in.m_47.x;
    float _1258 = in.m_47.y;
    float _1260 = in.m_47.z;
    float _1262 = in.m_47.w;
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = in.m_49.w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1292 = 1.0 / _1274;
    float _1294 = 1.0 / _1278;
    float _1296 = _256 * _1246;
    float _1298 = _256 * _1258;
    float _1300 = fma(_254, _1244, _1296);
    float _1302 = 1.0 / _1286;
    float _1304 = _256 * _1266;
    float _1306 = fma(_254, _1256, _1298);
    float _1308 = fma(_258, _1248, _1300);
    float _1310 = fma(_254, _1264, _1304);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1318 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1322 = fma(_258, _1260, _1306);
    float _1324 = fma(_258, _1268, _1310);
    float _1326 = _1308 + _1250;
    float _1328 = -_1316;
    float _1330 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1328);
    float _1332 = -_1318;
    float _1334 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1332);
    float _1336 = -_1320;
    float _1338 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1340 = _1322 + _1262;
    float _1342 = -_1326;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1324 + _1270;
    float _1348 = 1.0 / _1314;
    float _1350 = -_1340;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1344 * _1344;
    float _1356 = -_1346;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1364 = fma(_1352, _1352, _1354);
    float _1366 = 1.0 / _1282;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1370 = _1242 + _1368;
    float _1372 = fma(_1358, _1358, _1364);
    float _1374 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1376 = _1370 * _1292;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1380 = _1242 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1382;
    float _1386 = rsqrt(_1372);
    float _1388 = -_1290;
    float _1390 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1392 = -_1374;
    float _1394 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1398 = _1242 + _1396;
    float _1400 = _1380 * _1294;
    bool _1402 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1404 = isnan(_1242);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = -_1288;
    float _1416 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1418 = _1398 * _1302;
    float _1420 = 1.0 / _1362;
    float _1422 = _1254 * _1366;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1426 = _1242 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1430 = _1242 + _1428;
    bool _1432 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1434 = isnan(_1242);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = -_1412;
    float _1446 = _1444 + 1.0;
    float _1448 = _1430 * _1348;
    float _1450 = _1352 * _1386;
    float _1452 = 1.0 / _1384;
    float _1454 = _1358 * _1386;
    float _1456 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1462 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1464 = isnan(_1242);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = _1344 * _1386;
    float _1476 = fma(_1454, _1454, _1458);
    float _1478 = _1426 * _1420;
    bool _1480 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1482 = isnan(_1242);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1494 = _1242 + _1492;
    float _1496 = rsqrt(_1476);
    float _1498 = -_1456;
    float _1500 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    bool _1502 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1504 = isnan(_1242);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = -_1490;
    float _1516 = _1514 + 1.0;
    float _1518 = _1490 * _1446;
    float _1520 = _1494 * _1452;
    float _1522 = -_1460;
    float _1524 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1522);
    float _1526 = _1442 * _1516;
    float _1528 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1500);
    float _1530 = -_1442;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1524);
    bool _1536 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1538 = isnan(_1242);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -_1472;
    float _1550 = _1548 + 1.0;
    float _1552 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1554 = _1472 * _1532;
    bool _1556 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1558 = isnan(_1242);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 * _1550;
    float _1570 = _1454 * _1496;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = -_1552;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1578);
    bool _1582 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1584 = isnan(_1242);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1450 * _1496;
    float _1596 = -_1570;
    float _1598 = _1454 * _1596;
    float _1600 = _1512 * _1574;
    float _1602 = -_1512;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1576;
    float _1608 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1610 = -_1598;
    float _1612 = fma(_1450, _1594, _1610);
    float _1614 = _1474 * _1594;
    float _1616 = _1592 * _1604;
    float _1618 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1608);
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = _1612 * _1612;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1626;
    float _1630 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1634 = fma(_1614, _1614, _1624);
    float _1636 = _1566 * _1622;
    float _1638 = fma(_1628, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1640 = -_1570;
    float _1642 = _1474 * _1640;
    float _1644 = -_1630;
    float _1646 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1652 = -_1566;
    float _1654 = _1652 + 1.0;
    float _1656 = _1638 * _1636;
    float _1658 = fma(_1642, _1642, _1634);
    float _1660 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1662 = fma(_1650, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1664 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1656);
    float _1666 = rsqrt(_1658);
    float _1668 = -_1660;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1632);
    float _1672 = fma(_1662, _1616, _1664);
    float _1674 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1676;
    float _1680 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1686 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1688 = 1.0 / _1670;
    float _1690 = fma(_1678, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1692 = -_1680;
    float _1694 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1696 = -_1674;
    float _1698 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1700 = fma(_1684, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1702 = fma(_1690, _1600, _1672);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1704;
    float _1708 = -_1686;
    float _1710 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1708);
    float _1712 = _1612 * _1666;
    float _1714 = precise::clamp(_1712, 0.0, 1.0);
    float _1716 = fma(_1700, _1568, _1702);
    float _1718 = fma(_1706, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1720 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1698);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1726 = -_1714;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1718, _1554, _1716);
    float _1732 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1710);
    float _1734 = fma(_1720, _1688, -1.0);
    float _1736 = fma(_1724, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1738 = _1728 * _1688;
    float _1740 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1694);
    float _1742 = fma(_1728, _1734, 1.0);
    float _1744 = fma(_1736, _1526, _1730);
    float _1746 = _1732 * _1738;
    float _1748 = _1740 * _1738;
    float _1750 = in.m_51.x;
    float _1752 = in.m_51.y;
    float _1754 = _1742 * _1742;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1756;
    float _1760 = in.m_39.x;
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma(_1758, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1766;
    float _1770 = fma(_1748, _1748, _1762);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1772;
    float _1776 = fma(_1764, _1518, _1744);
    float _1778 = rsqrt(_1770);
    float _1780 = fma(_1768, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1782 = fma(_1774, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1784 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1794 = _1784 * 2.0;
    float _1796 = fma(_1788, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1798 = fma(_1792, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1804;
    float _1808 = fma(_1794, _1750, _260);
    float _1810 = fma(_1802, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1812 = fma(_1806, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1814 = fma(_1808, -0.25, -0.4000000059604644775390625);
    float _1816 = _1746 * _1778;
    float _1818 = _1748 * _1778;
    float _1820 = _1742 * _1778;
    float _1822 = fma(_1760, 2.0, -1.0);
    float _1824 = _1814 * _1814;
    float _1826 = -_1818;
    float _1828 = _1450 * _1826;
    float _1830 = -_1816;
    float _1832 = _1474 * _1830;
    float _1834 = _1454 * _1820;
    float _1836 = fma(_1822, _1822, _1824);
    float _1838 = -_1816;
    float _1840 = -_1828;
    float _1842 = fma(_1454, _1838, _1840);
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1848 = -_1818;
    float _1850 = -_1834;
    float _1852 = fma(_1474, _1848, _1850);
    float _1854 = -_1832;
    float _1856 = fma(_1450, _1820, _1854);
    float _1858 = _1842 * _1842;
    float _1860 = rsqrt(_1836);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1866;
    float _1870 = fma(_1852, _1852, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1872;
    float _1876 = fma(_1846, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1878 = fma(_1868, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1880 = fma(_1856, _1856, _1870);
    float _1882 = fma(_1874, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1884 = _1780 * _1636;
    float _1886 = fma(_1864, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1888 = _1782 * _1636;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1894 = rsqrt(_1880);
    float _1896 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1884);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = _1822 * _1860;
    float _1904 = _1814 * _1860;
    float _1906 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1888);
    float _1908 = fma(_1796, _1616, _1896);
    float _1910 = fma(_1900, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1912 = fma(_1892, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1914 = abs(_1902);
    float _1916 = abs(_1904);
    float _1918 = precise::max(_1914, _1916);
    float _1920 = fma(_1798, _1616, _1906);
    float _1922 = _1904 * 0.0625;
    float _1924 = fma(_1810, _1600, _1908);
    bool _1926 = _1918 >= 16.0;
    float _1928 = _1902 * 0.0625;
    float _1930 = fma(_1812, _1600, _1920);
    float _1932 = _1852 * _1894;
    float _1934 = _1856 * _1894;
    float _1936 = _1842 * _1894;
    float _1938 = _1926 ? _1928 : _1902;
    float _1940 = _1454 * _1932;
    float _1942 = _1474 * _1934;
    float _1944 = _1926 ? _1922 : _1904;
    float _1946 = _1450 * _1936;
    float _1948 = -_1940;
    float _1950 = fma(_1450, _1934, _1948);
    float _1952 = abs(_1938);
    bool _1954 = _1952 != 0.0;
    bool _1956 = isnan(_1952);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -_1942;
    float _1966 = fma(_1454, _1936, _1964);
    float _1968 = -_1946;
    float _1970 = fma(_1474, _1932, _1968);
    float _1972 = _1950 * _1950;
    float _1974 = abs(_1944);
    bool _1976 = _1974 == 0.0;
    bool _1978 = !_1962;
    bool _1980 = _1976 && _1978;
    float _1982 = in.m_53.x;
    float _1984 = in.m_53.y;
    float _1986 = abs(_1944);
    bool _1988 = _1986 == 0.0;
    float _1990 = fma(_1966, _1966, _1972);
    float _1992 = fma(_1876, _1568, _1924);
    float _1994 = fma(_1886, _1568, _1930);
    float _1996 = fma(_1970, _1970, _1990);
    float _1998 = fma(_1878, _1554, _1992);
    float _2000 = fma(_1882, _1554, _1994);
    float _2002 = rsqrt(_1996);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2004;
    bool _2008 = false;
    int _2010 = as_type<int>(_1600);
    int _2012 = as_type<int>(_1520);
    float _2014 = _1752;
    float _2016 = _1346;
    float _2018 = _1326;
    if (_1980)
    {
        bool _2020 = as_type<int>(_1944) >= 0;
        _2008 = _2020;
    }
    bool _2022 = _2008;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2024;
    float _2028 = fma(_1910, _1526, _1998);
    float _2030 = fma(_2006, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2032 = _2022 ? (-1) : 0;
    if (_1980)
    {
        int _2034 = _2022 ? 0 : 1078530011;
        _2010 = _2034;
    }
    int _2036 = _2010;
    float _2038 = fma(_2026, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    if (_1980)
    {
        int _2040 = int(0x80000000) & as_type<int>(_1938);
        int _2042 = _2036 | _2040;
        _2012 = _2042;
    }
    int _2044 = _2012;
    bool _2046 = !_1962;
    bool _2048 = _2046 && _1988;
    int _2050 = _2044;
    float _2052 = as_type<float>(_2044);
    if (!_2048)
    {
        float _2054 = abs(_1938);
        bool _2056 = _2054 != as_type<float>(0x7f800000u /* inf */);
        bool _2058 = isnan(_2054);
        bool _2060 = _2056 || _2058;
        bool _2062 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2064 = _2060 || _2062;
        float _2066 = abs(_1944);
        bool _2068 = _2066 == as_type<float>(0x7f800000u /* inf */);
        float _2070 = abs(_1944);
        bool _2072 = _2070 == as_type<float>(0x7f800000u /* inf */);
        bool _2074 = !_2064;
        bool _2076 = _2072 && _2074;
        if (_2076)
        {
            bool _2078 = as_type<int>(_1944) >= 0;
            _2032 = _2078 ? (-1) : 0;
        }
        int _2080 = _2032;
        if (_2076)
        {
            _2050 = 1075235812;
        }
        int _2082 = _2050;
        int _2084 = _2082;
        if (_2076)
        {
            int _2086 = ~_2080;
            int _2088 = (_2086 != 0) ? _2082 : 1061752795;
            _2084 = _2088;
        }
        int _2090 = _2084;
        float _2092 = as_type<float>(_2090);
        if (_2076)
        {
            int _2094 = int(0x80000000) & as_type<int>(_1938);
            int _2096 = _2090 | _2094;
            _2092 = as_type<float>(_2096);
        }
        float _2098 = _2092;
        bool _2100 = !_2064;
        bool _2102 = _2100 && _2068;
        _2052 = _2098;
        if (!_2102)
        {
            float _2104 = abs(_1938);
            float _2106 = abs(_1944);
            float _2108 = precise::max(_2104, _2106);
            float _2110 = abs(_1938);
            float _2112 = abs(_1944);
            float _2114 = precise::min(_2110, _2112);
            float _2116 = 1.0 / _2108;
            float _2118 = abs(_1938);
            float _2120 = abs(_1944);
            bool _2122 = _2118 > _2120;
            bool _2124 = as_type<int>(_1944) >= 0;
            float _2126 = _2114 * _2116;
            float _2128 = abs(_1938);
            float _2130 = abs(_1944);
            float _2132 = _2128 + _2130;
            float _2134 = _2126 * _2126;
            bool _2136 = _2132 > as_type<float>(0x7f800000u /* inf */);
            bool _2138 = isnan(_2132);
            bool _2140 = _2136 || _2138;
            bool _2142 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2144 = _2140 || _2142;
            float _2146 = _2134 + 11.33538818359375;
            float _2148 = fma(_2134, _2146, 28.84246826171875);
            float _2150 = fma(_2134, _2148, 19.6966705322265625);
            float _2152 = fma(_2134, -0.82336294651031494140625, -5.674867153167724609375);
            float _2154 = fma(_2134, _2152, -6.565555095672607421875);
            float _2156 = 1.0 / _2150;
            float _2158 = _2134 * _2154;
            float _2160 = _2126 * _2158;
            float _2162 = fma(_2160, _2156, _2126);
            int _2164 = as_type<int>(_1938) & int(0x80000000);
            float _2166 = _2162;
            _2052 = _2132;
            if (_2122)
            {
                float _2168 = -_2162;
                float _2170 = _2168 + 1.57079637050628662109375;
                _2166 = _2170;
            }
            float _2172 = _2166;
            int _2174 = as_type<int>(_2172);
            if (!_2124)
            {
                float _2176 = -_2172;
                float _2178 = _2176 + 3.1415927410125732421875;
                _2174 = as_type<int>(_2178);
            }
            int _2180 = _2174;
            if (!_2144)
            {
                int _2182 = _2164 | _2180;
                _2052 = as_type<float>(_2182);
            }
        }
    }
    float _2184 = _2052;
    float _2186 = fma(_1912, _1526, _2000);
    float _2188 = _1970 * _2002;
    float _2190 = _2184 * (-0.15915493667125701904296875);
    float _2192 = fma(_2030, _1518, _2028);
    float _2194 = fma(_2038, _1518, _2186);
    float _2196 = _1950 * _2002;
    float _2198 = _1966 * _2002;
    float _2200 = _1450 * _2188;
    float _2202 = _2190 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].z, _2194);
    float _2208 = in.m_37.x;
    float _2210 = in.m_37.y;
    float _2212 = in.m_37.z;
    float _2214 = -_1752;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2192);
    float _2220 = _1454 * _2196;
    float _2222 = -_2200;
    float _2224 = fma(_1454, _2198, _2222);
    float _2226 = fma(_2206, _1752, _2216);
    float _2228 = _2190 * 6.283185482025146484375;
    float _2230 = cos(_2228);
    float _2232 = _2206 * _1982;
    float _2234 = -_2220;
    float _2236 = fma(_1474, _2188, _2234);
    float _2238 = _1474 * _2198;
    float _2240 = _2224 * _2224;
    float _2242 = _2226 * _1984;
    float _2244 = -_2238;
    float _2246 = fma(_1450, _2196, _2244);
    out.m_55.x = _1340;
    out.m_55.y = _1326;
    out.m_55.z = _1346;
    float _2248 = _2218 * _1808;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _2242 * _2204;
    float _2254 = in.m_53.z;
    float _2256 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2258 = fma(_2246, _2246, _2250);
    float _2260 = _2242 * _2230;
    float _2262 = -_2252;
    float _2264 = fma(_2232, _2230, _2262);
    float _2266 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2268 = _2210 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2270 = fma(_2232, _2204, _2260);
    float _2272 = rsqrt(_2258);
    float _2274 = fma(_1902, _2256, _2264);
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_1904, _2256, _2270);
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2274);
    float _2284 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2278);
    float _2288 = in.m_39.z;
    float _2290 = _2276 * _2282;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2294 = _2280 * _2286;
    float _2296 = in.m_39.y;
    float _2298 = _2294 * _2188;
    float _2300 = _2290 * _2272;
    float _2302 = _2292 * _2254;
    float _2304 = _2294 * _2198;
    float _2306 = in.m_51.w;
    float _2308 = fma(_2246, _2300, _2298);
    float _2310 = _2294 * _2196;
    float _2312 = fma(_2236, _2300, _2304);
    float _2314 = in.m_57.x;
    float _2316 = fma(_1454, _2302, _2308);
    float _2318 = fma(_1450, _2302, _2312);
    float _2320 = fma(_2224, _2300, _2310);
    float _2322 = _1346 + _2316;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2326 = _1340 + _2318;
    float _2328 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2322 + _2330;
    float _2334 = in.m_57.y;
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2338 = _2326 + _2336;
    bool _2340 = _2288 > 0.5;
    float _2342 = _2332 * _2332;
    bool _2344 = _2296 > 0.5;
    float _2346 = fma(_1474, _2302, _2320);
    float _2348 = fma(_2338, _2338, _2342);
    out.m_33.x = _2328;
    float _2350 = sqrt(_2348);
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2354 = _2352 != 0;
    int _2356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2358 = _2356 != 0;
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2362 = _2360 != 0;
    out.m_59.w = _2306;
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2366 = _2364 != 0;
    out.m_59.y = _1752;
    float _2368 = -_2334;
    float _2370 = _2368 + 1.0;
    float _2372 = _2328;
    bool _2374 = _2340;
    float _2376 = _2334;
    float _2378 = _2370;
    if (!_2354)
    {
        _2372 = _2314;
    }
    float _2380 = _2372;
    float _2382 = _1326 + _2346;
    bool _2384 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2386 = _2340 ? _2370 : _2334;
    float _2388 = _2380;
    float _2390 = _2386;
    int _2392 = as_type<int>(_2350);
    int _2394 = as_type<int>(_2382);
    if (!_2354)
    {
        _2014 = _2380;
    }
    float _2396 = _2014;
    float _2398 = _2366 ? _2386 : _2334;
    float _2400 = _2396;
    if (_2354)
    {
        bool _2402 = _1760 > 0.5;
        _2374 = _2402;
    }
    bool _2404 = _2374;
    if (_2354)
    {
        _2388 = _2314;
    }
    float _2406 = _2388;
    if (_2358)
    {
        float _2408 = _2344 ? _2370 : _2334;
        _2376 = _2408;
    }
    float _2410 = _2376;
    if (!_2384)
    {
        _2390 = _2326;
    }
    float _2412 = _2390;
    float _2414 = _2412;
    if (!_2384)
    {
        _2016 = _2322;
    }
    float _2416 = _2016;
    float _2418 = _2416;
    if (!_2384)
    {
        _2018 = _2382;
    }
    float _2420 = _2018;
    bool _2422 = !_2384;
    float _2424 = _2420;
    if (!_2422)
    {
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2430 = _2350 + _2428;
        float _2432 = rsqrt(_2348);
        float _2434 = _2430 * _2426;
        float _2436 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = _2434 * 0.15915493667125701904296875;
        float _2440 = _2438 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2442 + (-1.0);
        float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = fma(_2446, _2436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2454 = fma(_2382, _2442, _2450);
        float _2456 = _2432 * _2452;
        float _2458 = fma(_2338, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2460 = fma(_2332, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2424 = _2454;
        _2392 = as_type<int>(_2452);
        _2414 = _2458;
        _2418 = _2460;
        _2378 = _2456;
    }
    float _2462 = _2424;
    int _2464 = _2392;
    float _2466 = _2414;
    float _2468 = _2418;
    float _2470 = _2378;
    int _2472 = _2464;
    float _2474 = _2470;
    if (_2354)
    {
        float _2476 = -_2406;
        float _2478 = _2476 + 1.0;
        _2472 = as_type<int>(_2478);
    }
    int _2480 = _2472;
    float _2482 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2362)
    {
        float _2484 = -_2406;
        float _2486 = _2484 + 1.0;
        _2394 = as_type<int>(_2486);
    }
    int _2488 = _2394;
    if (!_2362)
    {
        _2474 = _2406;
    }
    float _2490 = _2474;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2494 = _2490;
    if (_2354)
    {
        float _2496 = _2404 ? as_type<float>(_2480) : _2406;
        _2400 = _2496;
    }
    float _2498 = _2400;
    float _2500 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2502 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2482);
    if (_2362)
    {
        float _2504 = _2344 ? as_type<float>(_2488) : _2406;
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2500);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2508);
    float _2518 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2510);
    float _2520 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2522 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2514);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2516);
    float _2526 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2528 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2530 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2528);
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2544 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2546 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2550 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2542);
    float _2556 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2544);
    float _2558 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2538);
    float _2562 = _2550 * _2492;
    float _2564 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2556);
    float _2570 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2560);
    float _2574 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2540);
    float _2576 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2578 = _2566 + _2568;
    float _2580 = _2564 * _2536;
    float _2582 = _2570 * _2324;
    float _2584 = _2576 * _2552;
    float _2586 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2574);
    float _2588 = _2578 * 0.5;
    out.m_61.x = _2582;
    out.m_61.y = _2562;
    out.m_63.x = _2584;
    out.m_63.y = _2580;
    out.m_65.x = _2466;
    out.m_65.y = _2462;
    out.m_65.z = _2468;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2566;
    out.gl_Position.w = _2568;
    out.m_67.z = _2588;
    out.m_67.w = _2568;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _1104 = false;
    bool _726 = false;
    bool _552 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_102);
        out.gl_Position.z = _2646;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_35.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _94;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _104 = as_type<int>(_132);
    }
    int _134 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_134);
        out.gl_Position.z = _2709;
    }
    if (_128)
    {
        return out;
    }
    float _136 = in.m_37.w;
    float _138 = 1.0 / _108;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    float _258 = fma(_252, _136, _162);
    float _260 = _112 * _138;
    bool _262 = !_240;
    float _280;
    if (!_262)
    {
        float _264 = in.m_39.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        _280 = _260;
    }
    _282 = false;
    float _284 = _280;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _304;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _308;
    bool _332 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _334 = isnan(_284);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_342;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _312;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _352 = _284 + _350;
    float _354 = 1.0 / _300;
    float _356 = _352 * _314;
    bool _358 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _360 = isnan(_284);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _288 * _330;
    bool _372 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _374 = isnan(_284);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _292 * _348;
    bool _390 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _392 = isnan(_284);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _382 * _386;
    float _404 = -_382;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = _296 * _354;
    float _418 = _342 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _428 = _400 * _346;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _434;
    float _438 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_422, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = _326 * _432;
    float _448 = fma(_436, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _450 = fma(_414, _388, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _388, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = _438 * _446;
    float _458 = _440 * _446;
    float _460 = -_326;
    float _462 = _460 + 1.0;
    float _464 = _448 * _446;
    float _466 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_450, _428, _466);
    float _486 = fma(_454, _428, _470);
    float _488 = fma(_474, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_478, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _492 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _494 = fma(_452, _428, _468);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _418, _484);
    float _510 = fma(_498, _356, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _356, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_490, _418, _494);
    float _518 = fma(_492, _418, _486);
    float _520 = fma(_510, _402, _508);
    float _522 = fma(_512, _402, _516);
    float _524 = fma(_514, _402, _518);
    float _526 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_328;
    float _550;
    if (!_532)
    {
        float _534 = in.m_39.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        _550 = _260;
    }
    _552 = false;
    float _554 = _550;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _582 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_554);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_554);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _616 = 1.0 / _562;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _592 * _600;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _612 * _626;
    float _630 = 1.0 / _580;
    float _632 = _596 * _576;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _554 + _634;
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = fma(_632, _636, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _554 + _644;
    float _648 = _620 * _616;
    bool _650 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _652 = isnan(_554);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _662;
    float _666 = _642 * _628;
    float _668 = fma(_648, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _554 + _670;
    float _674 = -_660;
    float _676 = _674 + 1.0;
    float _678 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _666);
    float _680 = _664 * _630;
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _574 * _676;
    float _686 = fma(_668, _622, _678);
    float _688 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _684, _686);
    float _694 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[118].x, _692);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _696;
    out.m_41.y = _698;
    out.m_41.z = _702;
    out.m_41.w = _704;
    bool _706 = !_614;
    float _724;
    if (!_706)
    {
        float _708 = in.m_39.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].z, _112);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        _724 = _260;
    }
    _726 = false;
    float _728 = _724;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _760 = _728 + _758;
    bool _762 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _764 = isnan(_728);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -_772;
    float _776 = _774 + 1.0;
    float _778 = 1.0 / _736;
    float _780 = _760 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = _728 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _728 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _792 = _728 + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _796 = 1.0 / _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _800 = _728 + _798;
    float _802 = _784 * _756;
    bool _804 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _806 = isnan(_728);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = 1.0 / _750;
    float _818 = _800 * _778;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _822 = _728 + _820;
    float _824 = -_814;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _832;
    float _836 = 1.0 / _754;
    float _838 = _788 * _796;
    bool _840 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _842 = isnan(_728);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = fma(_834, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _854 = _822 * _816;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _856;
    float _860 = _850 * _826;
    float _862 = -_850;
    float _864 = _862 + 1.0;
    float _866 = fma(_830, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = fma(_858, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _870 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _872 = isnan(_728);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _772 * _864;
    float _884 = _792 * _836;
    bool _886 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _888 = isnan(_728);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = _880 * _776;
    bool _904 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _906 = isnan(_728);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_880;
    float _918 = _916 + 1.0;
    bool _920 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _922 = isnan(_728);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = _896 * _918;
    float _942 = -_896;
    float _944 = _942 + 1.0;
    float _946 = -_930;
    float _948 = _946 + 1.0;
    float _950 = fma(_934, _818, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _952 = fma(_900, _818, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _954 = _914 * _948;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = fma(_938, _818, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _962 = _930 * _944;
    float _964 = _866 * _954;
    float _966 = _868 * _954;
    float _968 = _852 * _954;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _978 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].x, _964);
    float _980 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].y, _966);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _982;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _990 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].z, _968);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _996 = fma(_950, _962, _978);
    float _998 = fma(_952, _962, _980);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1000;
    float _1004 = fma(_976, _838, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1006 = fma(_988, _838, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1008 = fma(_960, _962, _990);
    float _1010 = fma(_984, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1012 = fma(_994, _838, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1014 = fma(_972, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1016 = fma(_1002, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = fma(_1010, _940, _998);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1024;
    float _1028 = fma(_1014, _940, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1016, _940, _1008);
    float _1036 = fma(_1022, _854, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1026, _854, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1032, _854, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1042 = fma(_1004, _902, _1028);
    float _1044 = fma(_1006, _902, _1018);
    float _1046 = fma(_1012, _902, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1060 = fma(_1036, _882, _1042);
    float _1062 = fma(_1050, _884, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1064 = fma(_1054, _884, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1066 = fma(_1058, _884, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1068 = fma(_1038, _882, _1044);
    float _1070 = fma(_1040, _882, _1046);
    float _1072 = fma(_1062, _860, _1060);
    float _1074 = fma(_1064, _860, _1068);
    float _1076 = fma(_1066, _860, _1070);
    float _1078 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1072);
    float _1080 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1074);
    float _1082 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1076);
    bool _1084 = !_794;
    float _1102;
    if (!_1084)
    {
        float _1086 = in.m_39.x;
        float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1090 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1094 = _1092 * _1088;
        float _1096 = floor(_1094);
        float _1098 = -_1096;
        float _1100 = _1094 + _1098;
        _1102 = _1100;
        _1104 = true;
    }
    else
    {
        _1102 = _260;
    }
    _1104 = false;
    float _1106 = _1102;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1128 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1106);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1110;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -_1122;
    float _1148 = _1146 + 1.0;
    bool _1150 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1152 = isnan(_1106);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    bool _1162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1164 = _1138 * _1148;
    float _1166 = -_1138;
    float _1168 = _1166 + 1.0;
    float _1170 = 1.0 / _1126;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1176 = _1144 * _1140;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1180 = _1106 + _1178;
    float _1182 = -_1160;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1106 + _1188;
    float _1192 = _1122 * _1184;
    float _1194 = _1174 * _1170;
    float _1196 = _1186 * _1164;
    float _1198 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1202 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1196);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = fma(_1202, _1192, _1204);
    float _1212 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _1206;
    out.m_43.y = _1208;
    out.m_43.z = _1216;
    out.m_43.w = _1218;
    bool _1220 = !_1162;
    float _1238;
    if (!_1220)
    {
        float _1222 = in.m_39.x;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1226 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[14].x, _112);
        float _1230 = _1228 * _1224;
        float _1232 = floor(_1230);
        float _1234 = -_1232;
        float _1236 = _1230 + _1234;
        _1238 = _1236;
        _1240 = true;
    }
    else
    {
        _1238 = _260;
    }
    _1240 = false;
    float _1242 = _1238;
    float _1244 = in.m_45.x;
    float _1246 = in.m_45.y;
    float _1248 = in.m_45.z;
    float _1250 = in.m_45.w;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1254 = _1242 + _1252;
    float _1256 = in.m_47.x;
    float _1258 = in.m_47.y;
    float _1260 = in.m_47.z;
    float _1262 = in.m_47.w;
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = in.m_49.w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1292 = 1.0 / _1274;
    float _1294 = 1.0 / _1278;
    float _1296 = _256 * _1246;
    float _1298 = _256 * _1258;
    float _1300 = fma(_254, _1244, _1296);
    float _1302 = 1.0 / _1286;
    float _1304 = _256 * _1266;
    float _1306 = fma(_254, _1256, _1298);
    float _1308 = fma(_258, _1248, _1300);
    float _1310 = fma(_254, _1264, _1304);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1318 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1322 = fma(_258, _1260, _1306);
    float _1324 = fma(_258, _1268, _1310);
    float _1326 = _1308 + _1250;
    float _1328 = -_1316;
    float _1330 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1328);
    float _1332 = -_1318;
    float _1334 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1332);
    float _1336 = -_1320;
    float _1338 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1340 = _1322 + _1262;
    float _1342 = -_1326;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1324 + _1270;
    float _1348 = 1.0 / _1314;
    float _1350 = -_1340;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1344 * _1344;
    float _1356 = -_1346;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1364 = fma(_1352, _1352, _1354);
    float _1366 = 1.0 / _1282;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1370 = _1242 + _1368;
    float _1372 = fma(_1358, _1358, _1364);
    float _1374 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1376 = _1370 * _1292;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1380 = _1242 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1382;
    float _1386 = rsqrt(_1372);
    float _1388 = -_1290;
    float _1390 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1392 = -_1374;
    float _1394 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1398 = _1242 + _1396;
    float _1400 = _1380 * _1294;
    bool _1402 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1404 = isnan(_1242);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = -_1288;
    float _1416 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1418 = _1398 * _1302;
    float _1420 = 1.0 / _1362;
    float _1422 = _1254 * _1366;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1426 = _1242 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1430 = _1242 + _1428;
    bool _1432 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1434 = isnan(_1242);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = -_1412;
    float _1446 = _1444 + 1.0;
    float _1448 = _1430 * _1348;
    float _1450 = _1352 * _1386;
    float _1452 = 1.0 / _1384;
    float _1454 = _1358 * _1386;
    float _1456 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1462 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1464 = isnan(_1242);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = _1344 * _1386;
    float _1476 = fma(_1454, _1454, _1458);
    float _1478 = _1426 * _1420;
    bool _1480 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1482 = isnan(_1242);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1494 = _1242 + _1492;
    float _1496 = rsqrt(_1476);
    float _1498 = -_1456;
    float _1500 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    bool _1502 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1504 = isnan(_1242);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = -_1490;
    float _1516 = _1514 + 1.0;
    float _1518 = _1490 * _1446;
    float _1520 = _1494 * _1452;
    float _1522 = -_1460;
    float _1524 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1522);
    float _1526 = _1442 * _1516;
    float _1528 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1500);
    float _1530 = -_1442;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1524);
    bool _1536 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1538 = isnan(_1242);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -_1472;
    float _1550 = _1548 + 1.0;
    float _1552 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1554 = _1472 * _1532;
    bool _1556 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1558 = isnan(_1242);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 * _1550;
    float _1570 = _1454 * _1496;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = -_1552;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1578);
    bool _1582 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1584 = isnan(_1242);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1450 * _1496;
    float _1596 = -_1570;
    float _1598 = _1454 * _1596;
    float _1600 = _1512 * _1574;
    float _1602 = -_1512;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1576;
    float _1608 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1610 = -_1598;
    float _1612 = fma(_1450, _1594, _1610);
    float _1614 = _1474 * _1594;
    float _1616 = _1592 * _1604;
    float _1618 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1608);
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = _1612 * _1612;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1626;
    float _1630 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1634 = fma(_1614, _1614, _1624);
    float _1636 = _1566 * _1622;
    float _1638 = fma(_1628, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1640 = -_1570;
    float _1642 = _1474 * _1640;
    float _1644 = -_1630;
    float _1646 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1652 = -_1566;
    float _1654 = _1652 + 1.0;
    float _1656 = _1638 * _1636;
    float _1658 = fma(_1642, _1642, _1634);
    float _1660 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1662 = fma(_1650, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1664 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1656);
    float _1666 = rsqrt(_1658);
    float _1668 = -_1660;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1632);
    float _1672 = fma(_1662, _1616, _1664);
    float _1674 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1676;
    float _1680 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1686 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1688 = 1.0 / _1670;
    float _1690 = fma(_1678, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1692 = -_1680;
    float _1694 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1696 = -_1674;
    float _1698 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1700 = fma(_1684, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1702 = fma(_1690, _1600, _1672);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1704;
    float _1708 = -_1686;
    float _1710 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1708);
    float _1712 = _1612 * _1666;
    float _1714 = precise::clamp(_1712, 0.0, 1.0);
    float _1716 = fma(_1700, _1568, _1702);
    float _1718 = fma(_1706, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1720 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1698);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1726 = -_1714;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1718, _1554, _1716);
    float _1732 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1710);
    float _1734 = fma(_1720, _1688, -1.0);
    float _1736 = fma(_1724, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1738 = _1728 * _1688;
    float _1740 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1694);
    float _1742 = fma(_1728, _1734, 1.0);
    float _1744 = fma(_1736, _1526, _1730);
    float _1746 = _1732 * _1738;
    float _1748 = _1740 * _1738;
    float _1750 = in.m_51.x;
    float _1752 = in.m_51.y;
    float _1754 = _1742 * _1742;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1756;
    float _1760 = in.m_39.x;
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma(_1758, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1766;
    float _1770 = fma(_1748, _1748, _1762);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1772;
    float _1776 = fma(_1764, _1518, _1744);
    float _1778 = rsqrt(_1770);
    float _1780 = fma(_1768, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1782 = fma(_1774, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1784 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1794 = _1784 * 2.0;
    float _1796 = fma(_1788, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1798 = fma(_1792, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1804;
    float _1808 = fma(_1794, _1750, _260);
    float _1810 = fma(_1802, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1812 = fma(_1806, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1814 = fma(_1808, -0.25, -0.4000000059604644775390625);
    float _1816 = _1746 * _1778;
    float _1818 = _1748 * _1778;
    float _1820 = _1742 * _1778;
    float _1822 = fma(_1760, 2.0, -1.0);
    float _1824 = _1814 * _1814;
    float _1826 = -_1818;
    float _1828 = _1450 * _1826;
    float _1830 = -_1816;
    float _1832 = _1474 * _1830;
    float _1834 = _1454 * _1820;
    float _1836 = fma(_1822, _1822, _1824);
    float _1838 = -_1816;
    float _1840 = -_1828;
    float _1842 = fma(_1454, _1838, _1840);
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1848 = -_1818;
    float _1850 = -_1834;
    float _1852 = fma(_1474, _1848, _1850);
    float _1854 = -_1832;
    float _1856 = fma(_1450, _1820, _1854);
    float _1858 = _1842 * _1842;
    float _1860 = rsqrt(_1836);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1866;
    float _1870 = fma(_1852, _1852, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1872;
    float _1876 = fma(_1846, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1878 = fma(_1868, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1880 = fma(_1856, _1856, _1870);
    float _1882 = fma(_1874, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1884 = _1780 * _1636;
    float _1886 = fma(_1864, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1888 = _1782 * _1636;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1894 = rsqrt(_1880);
    float _1896 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1884);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = _1822 * _1860;
    float _1904 = _1814 * _1860;
    float _1906 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1888);
    float _1908 = fma(_1796, _1616, _1896);
    float _1910 = fma(_1900, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1912 = fma(_1892, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1914 = abs(_1902);
    float _1916 = abs(_1904);
    float _1918 = precise::max(_1914, _1916);
    float _1920 = fma(_1798, _1616, _1906);
    float _1922 = _1904 * 0.0625;
    float _1924 = fma(_1810, _1600, _1908);
    bool _1926 = _1918 >= 16.0;
    float _1928 = _1902 * 0.0625;
    float _1930 = fma(_1812, _1600, _1920);
    float _1932 = _1852 * _1894;
    float _1934 = _1856 * _1894;
    float _1936 = _1842 * _1894;
    float _1938 = _1926 ? _1928 : _1902;
    float _1940 = _1454 * _1932;
    float _1942 = _1474 * _1934;
    float _1944 = _1926 ? _1922 : _1904;
    float _1946 = _1450 * _1936;
    float _1948 = -_1940;
    float _1950 = fma(_1450, _1934, _1948);
    float _1952 = abs(_1938);
    bool _1954 = _1952 != 0.0;
    bool _1956 = isnan(_1952);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -_1942;
    float _1966 = fma(_1454, _1936, _1964);
    float _1968 = -_1946;
    float _1970 = fma(_1474, _1932, _1968);
    float _1972 = _1950 * _1950;
    float _1974 = abs(_1944);
    bool _1976 = _1974 == 0.0;
    bool _1978 = !_1962;
    bool _1980 = _1976 && _1978;
    float _1982 = in.m_53.x;
    float _1984 = in.m_53.y;
    float _1986 = abs(_1944);
    bool _1988 = _1986 == 0.0;
    float _1990 = fma(_1966, _1966, _1972);
    float _1992 = fma(_1876, _1568, _1924);
    float _1994 = fma(_1886, _1568, _1930);
    float _1996 = fma(_1970, _1970, _1990);
    float _1998 = fma(_1878, _1554, _1992);
    float _2000 = fma(_1882, _1554, _1994);
    float _2002 = rsqrt(_1996);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2004;
    bool _2008 = false;
    int _2010 = as_type<int>(_1600);
    int _2012 = as_type<int>(_1520);
    float _2014 = _1752;
    float _2016 = _1346;
    float _2018 = _1326;
    if (_1980)
    {
        bool _2020 = as_type<int>(_1944) >= 0;
        _2008 = _2020;
    }
    bool _2022 = _2008;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2024;
    float _2028 = fma(_1910, _1526, _1998);
    float _2030 = fma(_2006, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2032 = _2022 ? (-1) : 0;
    if (_1980)
    {
        int _2034 = _2022 ? 0 : 1078530011;
        _2010 = _2034;
    }
    int _2036 = _2010;
    float _2038 = fma(_2026, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    if (_1980)
    {
        int _2040 = int(0x80000000) & as_type<int>(_1938);
        int _2042 = _2036 | _2040;
        _2012 = _2042;
    }
    int _2044 = _2012;
    bool _2046 = !_1962;
    bool _2048 = _2046 && _1988;
    int _2050 = _2044;
    float _2052 = as_type<float>(_2044);
    if (!_2048)
    {
        float _2054 = abs(_1938);
        bool _2056 = _2054 != as_type<float>(0x7f800000u /* inf */);
        bool _2058 = isnan(_2054);
        bool _2060 = _2056 || _2058;
        bool _2062 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2064 = _2060 || _2062;
        float _2066 = abs(_1944);
        bool _2068 = _2066 == as_type<float>(0x7f800000u /* inf */);
        float _2070 = abs(_1944);
        bool _2072 = _2070 == as_type<float>(0x7f800000u /* inf */);
        bool _2074 = !_2064;
        bool _2076 = _2072 && _2074;
        if (_2076)
        {
            bool _2078 = as_type<int>(_1944) >= 0;
            _2032 = _2078 ? (-1) : 0;
        }
        int _2080 = _2032;
        if (_2076)
        {
            _2050 = 1075235812;
        }
        int _2082 = _2050;
        int _2084 = _2082;
        if (_2076)
        {
            int _2086 = ~_2080;
            int _2088 = (_2086 != 0) ? _2082 : 1061752795;
            _2084 = _2088;
        }
        int _2090 = _2084;
        float _2092 = as_type<float>(_2090);
        if (_2076)
        {
            int _2094 = int(0x80000000) & as_type<int>(_1938);
            int _2096 = _2090 | _2094;
            _2092 = as_type<float>(_2096);
        }
        float _2098 = _2092;
        bool _2100 = !_2064;
        bool _2102 = _2100 && _2068;
        _2052 = _2098;
        if (!_2102)
        {
            float _2104 = abs(_1938);
            float _2106 = abs(_1944);
            float _2108 = precise::max(_2104, _2106);
            float _2110 = abs(_1938);
            float _2112 = abs(_1944);
            float _2114 = precise::min(_2110, _2112);
            float _2116 = 1.0 / _2108;
            float _2118 = abs(_1938);
            float _2120 = abs(_1944);
            bool _2122 = _2118 > _2120;
            bool _2124 = as_type<int>(_1944) >= 0;
            float _2126 = _2114 * _2116;
            float _2128 = abs(_1938);
            float _2130 = abs(_1944);
            float _2132 = _2128 + _2130;
            float _2134 = _2126 * _2126;
            bool _2136 = _2132 > as_type<float>(0x7f800000u /* inf */);
            bool _2138 = isnan(_2132);
            bool _2140 = _2136 || _2138;
            bool _2142 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2144 = _2140 || _2142;
            float _2146 = _2134 + 11.33538818359375;
            float _2148 = fma(_2134, _2146, 28.84246826171875);
            float _2150 = fma(_2134, _2148, 19.6966705322265625);
            float _2152 = fma(_2134, -0.82336294651031494140625, -5.674867153167724609375);
            float _2154 = fma(_2134, _2152, -6.565555095672607421875);
            float _2156 = 1.0 / _2150;
            float _2158 = _2134 * _2154;
            float _2160 = _2126 * _2158;
            float _2162 = fma(_2160, _2156, _2126);
            int _2164 = as_type<int>(_1938) & int(0x80000000);
            float _2166 = _2162;
            _2052 = _2132;
            if (_2122)
            {
                float _2168 = -_2162;
                float _2170 = _2168 + 1.57079637050628662109375;
                _2166 = _2170;
            }
            float _2172 = _2166;
            int _2174 = as_type<int>(_2172);
            if (!_2124)
            {
                float _2176 = -_2172;
                float _2178 = _2176 + 3.1415927410125732421875;
                _2174 = as_type<int>(_2178);
            }
            int _2180 = _2174;
            if (!_2144)
            {
                int _2182 = _2164 | _2180;
                _2052 = as_type<float>(_2182);
            }
        }
    }
    float _2184 = _2052;
    float _2186 = fma(_1912, _1526, _2000);
    float _2188 = _1970 * _2002;
    float _2190 = _2184 * (-0.15915493667125701904296875);
    float _2192 = fma(_2030, _1518, _2028);
    float _2194 = fma(_2038, _1518, _2186);
    float _2196 = _1950 * _2002;
    float _2198 = _1966 * _2002;
    float _2200 = _1450 * _2188;
    float _2202 = _2190 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].z, _2194);
    float _2208 = in.m_37.x;
    float _2210 = in.m_37.y;
    float _2212 = in.m_37.z;
    float _2214 = -_1752;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2192);
    float _2220 = _1454 * _2196;
    float _2222 = -_2200;
    float _2224 = fma(_1454, _2198, _2222);
    float _2226 = fma(_2206, _1752, _2216);
    float _2228 = _2190 * 6.283185482025146484375;
    float _2230 = cos(_2228);
    float _2232 = _2206 * _1982;
    float _2234 = -_2220;
    float _2236 = fma(_1474, _2188, _2234);
    float _2238 = _1474 * _2198;
    float _2240 = _2224 * _2224;
    float _2242 = _2226 * _1984;
    float _2244 = -_2238;
    float _2246 = fma(_1450, _2196, _2244);
    out.m_55.x = _1340;
    out.m_55.y = _1326;
    out.m_55.z = _1346;
    float _2248 = _2218 * _1808;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _2242 * _2204;
    float _2254 = in.m_53.z;
    float _2256 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2258 = fma(_2246, _2246, _2250);
    float _2260 = _2242 * _2230;
    float _2262 = -_2252;
    float _2264 = fma(_2232, _2230, _2262);
    float _2266 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2268 = _2210 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2270 = fma(_2232, _2204, _2260);
    float _2272 = rsqrt(_2258);
    float _2274 = fma(_1902, _2256, _2264);
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_1904, _2256, _2270);
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2274);
    float _2284 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2278);
    float _2288 = in.m_39.z;
    float _2290 = _2276 * _2282;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2294 = _2280 * _2286;
    float _2296 = in.m_39.y;
    float _2298 = _2294 * _2188;
    float _2300 = _2290 * _2272;
    float _2302 = _2292 * _2254;
    float _2304 = _2294 * _2198;
    float _2306 = in.m_51.w;
    float _2308 = fma(_2246, _2300, _2298);
    float _2310 = _2294 * _2196;
    float _2312 = fma(_2236, _2300, _2304);
    float _2314 = in.m_57.x;
    float _2316 = fma(_1454, _2302, _2308);
    float _2318 = fma(_1450, _2302, _2312);
    float _2320 = fma(_2224, _2300, _2310);
    float _2322 = _1346 + _2316;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2326 = _1340 + _2318;
    float _2328 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2322 + _2330;
    float _2334 = in.m_57.y;
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2338 = _2326 + _2336;
    bool _2340 = _2288 > 0.5;
    float _2342 = _2332 * _2332;
    bool _2344 = _2296 > 0.5;
    float _2346 = fma(_1474, _2302, _2320);
    float _2348 = fma(_2338, _2338, _2342);
    out.m_33.x = _2328;
    float _2350 = sqrt(_2348);
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2354 = _2352 != 0;
    int _2356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2358 = _2356 != 0;
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2362 = _2360 != 0;
    out.m_59.w = _2306;
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2366 = _2364 != 0;
    out.m_59.y = _1752;
    float _2368 = -_2334;
    float _2370 = _2368 + 1.0;
    float _2372 = _2328;
    bool _2374 = _2340;
    float _2376 = _2334;
    float _2378 = _2370;
    if (!_2354)
    {
        _2372 = _2314;
    }
    float _2380 = _2372;
    float _2382 = _1326 + _2346;
    bool _2384 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2386 = _2340 ? _2370 : _2334;
    float _2388 = _2380;
    float _2390 = _2386;
    int _2392 = as_type<int>(_2350);
    int _2394 = as_type<int>(_2382);
    if (!_2354)
    {
        _2014 = _2380;
    }
    float _2396 = _2014;
    float _2398 = _2366 ? _2386 : _2334;
    float _2400 = _2396;
    if (_2354)
    {
        bool _2402 = _1760 > 0.5;
        _2374 = _2402;
    }
    bool _2404 = _2374;
    if (_2354)
    {
        _2388 = _2314;
    }
    float _2406 = _2388;
    if (_2358)
    {
        float _2408 = _2344 ? _2370 : _2334;
        _2376 = _2408;
    }
    float _2410 = _2376;
    if (!_2384)
    {
        _2390 = _2326;
    }
    float _2412 = _2390;
    float _2414 = _2412;
    if (!_2384)
    {
        _2016 = _2322;
    }
    float _2416 = _2016;
    float _2418 = _2416;
    if (!_2384)
    {
        _2018 = _2382;
    }
    float _2420 = _2018;
    bool _2422 = !_2384;
    float _2424 = _2420;
    if (!_2422)
    {
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2430 = _2350 + _2428;
        float _2432 = rsqrt(_2348);
        float _2434 = _2430 * _2426;
        float _2436 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = _2434 * 0.15915493667125701904296875;
        float _2440 = _2438 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2442 + (-1.0);
        float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = fma(_2446, _2436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2454 = fma(_2382, _2442, _2450);
        float _2456 = _2432 * _2452;
        float _2458 = fma(_2338, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2460 = fma(_2332, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2424 = _2454;
        _2392 = as_type<int>(_2452);
        _2414 = _2458;
        _2418 = _2460;
        _2378 = _2456;
    }
    float _2462 = _2424;
    int _2464 = _2392;
    float _2466 = _2414;
    float _2468 = _2418;
    float _2470 = _2378;
    int _2472 = _2464;
    float _2474 = _2470;
    if (_2354)
    {
        float _2476 = -_2406;
        float _2478 = _2476 + 1.0;
        _2472 = as_type<int>(_2478);
    }
    int _2480 = _2472;
    float _2482 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2362)
    {
        float _2484 = -_2406;
        float _2486 = _2484 + 1.0;
        _2394 = as_type<int>(_2486);
    }
    int _2488 = _2394;
    if (!_2362)
    {
        _2474 = _2406;
    }
    float _2490 = _2474;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2494 = _2490;
    if (_2354)
    {
        float _2496 = _2404 ? as_type<float>(_2480) : _2406;
        _2400 = _2496;
    }
    float _2498 = _2400;
    float _2500 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2502 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2482);
    if (_2362)
    {
        float _2504 = _2344 ? as_type<float>(_2488) : _2406;
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2500);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2508);
    float _2518 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2510);
    float _2520 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2522 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2514);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2516);
    float _2526 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2528 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2530 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2528);
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2544 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2546 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2550 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2542);
    float _2556 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2544);
    float _2558 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2538);
    float _2562 = _2550 * _2492;
    float _2564 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2556);
    float _2570 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2560);
    float _2574 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2540);
    float _2576 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2578 = _2566 + _2568;
    float _2580 = _2564 * _2536;
    float _2582 = _2570 * _2324;
    float _2584 = _2576 * _2552;
    float _2586 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2574);
    float _2588 = _2578 * 0.5;
    out.m_61.x = _2582;
    out.m_61.y = _2562;
    out.m_63.x = _2584;
    out.m_63.y = _2580;
    out.m_65.x = _2466;
    out.m_65.y = _2462;
    out.m_65.z = _2468;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2566;
    out.gl_Position.w = _2568;
    out.m_67.z = _2588;
    out.m_67.w = _2568;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _1104 = false;
    bool _726 = false;
    bool _552 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_102);
        out.gl_Position.z = _2646;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_35.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _94;
    if (_128)
    {
        out.m_33.x = 0.0;
    }
    if (_128)
    {
        float _132 = _130 * 5.0;
        _104 = as_type<int>(_132);
    }
    int _134 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_134);
        out.gl_Position.z = _2709;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_37.w;
    float _138 = 1.0 / _108;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    float _258 = fma(_252, _136, _162);
    float _260 = _112 * _138;
    bool _262 = !_240;
    float _280;
    if (!_262)
    {
        float _264 = in.m_39.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        _280 = _260;
    }
    _282 = false;
    float _284 = _280;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _296 = _284 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _304;
    bool _316 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_284);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _308;
    bool _332 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _334 = isnan(_284);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_342;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _312;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _352 = _284 + _350;
    float _354 = 1.0 / _300;
    float _356 = _352 * _314;
    bool _358 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _360 = isnan(_284);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _288 * _330;
    bool _372 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _374 = isnan(_284);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _292 * _348;
    bool _390 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _392 = isnan(_284);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _382 * _386;
    float _404 = -_382;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = _296 * _354;
    float _418 = _342 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _428 = _400 * _346;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _434;
    float _438 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_422, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _446 = _326 * _432;
    float _448 = fma(_436, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _450 = fma(_414, _388, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _452 = fma(_426, _388, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _454 = fma(_444, _388, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _456 = _438 * _446;
    float _458 = _440 * _446;
    float _460 = -_326;
    float _462 = _460 + 1.0;
    float _464 = _448 * _446;
    float _466 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_450, _428, _466);
    float _486 = fma(_454, _428, _470);
    float _488 = fma(_474, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_478, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _492 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _494 = fma(_452, _428, _468);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _418, _484);
    float _510 = fma(_498, _356, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _356, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_490, _418, _494);
    float _518 = fma(_492, _418, _486);
    float _520 = fma(_510, _402, _508);
    float _522 = fma(_512, _402, _516);
    float _524 = fma(_514, _402, _518);
    float _526 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_328;
    float _550;
    if (!_532)
    {
        float _534 = in.m_39.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        _550 = _260;
    }
    _552 = false;
    float _554 = _550;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _582 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_554);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _594;
    float _598 = -_574;
    float _600 = _598 + 1.0;
    bool _602 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _604 = isnan(_554);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _616 = 1.0 / _562;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = _592 * _600;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _612 * _626;
    float _630 = 1.0 / _580;
    float _632 = _596 * _576;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _554 + _634;
    float _638 = -_612;
    float _640 = _638 + 1.0;
    float _642 = fma(_632, _636, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _554 + _644;
    float _648 = _620 * _616;
    bool _650 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _652 = isnan(_554);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _662;
    float _666 = _642 * _628;
    float _668 = fma(_648, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _554 + _670;
    float _674 = -_660;
    float _676 = _674 + 1.0;
    float _678 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _666);
    float _680 = _664 * _630;
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _574 * _676;
    float _686 = fma(_668, _622, _678);
    float _688 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _684, _686);
    float _694 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[118].x, _692);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _696;
    out.m_41.y = _698;
    out.m_41.z = _702;
    out.m_41.w = _704;
    bool _706 = !_614;
    float _724;
    if (!_706)
    {
        float _708 = in.m_39.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].z, _112);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        _724 = _260;
    }
    _726 = false;
    float _728 = _724;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _760 = _728 + _758;
    bool _762 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _764 = isnan(_728);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -_772;
    float _776 = _774 + 1.0;
    float _778 = 1.0 / _736;
    float _780 = _760 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = _728 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _728 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _792 = _728 + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _796 = 1.0 / _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _800 = _728 + _798;
    float _802 = _784 * _756;
    bool _804 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _806 = isnan(_728);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = 1.0 / _750;
    float _818 = _800 * _778;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _822 = _728 + _820;
    float _824 = -_814;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _832;
    float _836 = 1.0 / _754;
    float _838 = _788 * _796;
    bool _840 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _842 = isnan(_728);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = fma(_834, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _854 = _822 * _816;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _856;
    float _860 = _850 * _826;
    float _862 = -_850;
    float _864 = _862 + 1.0;
    float _866 = fma(_830, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = fma(_858, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _870 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _872 = isnan(_728);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _772 * _864;
    float _884 = _792 * _836;
    bool _886 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _888 = isnan(_728);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _902 = _880 * _776;
    bool _904 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _906 = isnan(_728);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_880;
    float _918 = _916 + 1.0;
    bool _920 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _922 = isnan(_728);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = _896 * _918;
    float _942 = -_896;
    float _944 = _942 + 1.0;
    float _946 = -_930;
    float _948 = _946 + 1.0;
    float _950 = fma(_934, _818, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _952 = fma(_900, _818, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _954 = _914 * _948;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = fma(_938, _818, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _962 = _930 * _944;
    float _964 = _866 * _954;
    float _966 = _868 * _954;
    float _968 = _852 * _954;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _978 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].x, _964);
    float _980 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].y, _966);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _982;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _990 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[123].z, _968);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _996 = fma(_950, _962, _978);
    float _998 = fma(_952, _962, _980);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1000;
    float _1004 = fma(_976, _838, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1006 = fma(_988, _838, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1008 = fma(_960, _962, _990);
    float _1010 = fma(_984, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1012 = fma(_994, _838, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1014 = fma(_972, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1016 = fma(_1002, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = fma(_1010, _940, _998);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1024;
    float _1028 = fma(_1014, _940, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1016, _940, _1008);
    float _1036 = fma(_1022, _854, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1026, _854, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1032, _854, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1042 = fma(_1004, _902, _1028);
    float _1044 = fma(_1006, _902, _1018);
    float _1046 = fma(_1012, _902, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1060 = fma(_1036, _882, _1042);
    float _1062 = fma(_1050, _884, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1064 = fma(_1054, _884, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1066 = fma(_1058, _884, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1068 = fma(_1038, _882, _1044);
    float _1070 = fma(_1040, _882, _1046);
    float _1072 = fma(_1062, _860, _1060);
    float _1074 = fma(_1064, _860, _1068);
    float _1076 = fma(_1066, _860, _1070);
    float _1078 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1072);
    float _1080 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1074);
    float _1082 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1076);
    bool _1084 = !_794;
    float _1102;
    if (!_1084)
    {
        float _1086 = in.m_39.x;
        float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1090 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1094 = _1092 * _1088;
        float _1096 = floor(_1094);
        float _1098 = -_1096;
        float _1100 = _1094 + _1098;
        _1102 = _1100;
        _1104 = true;
    }
    else
    {
        _1102 = _260;
    }
    _1104 = false;
    float _1106 = _1102;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1128 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1106);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1110;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1142;
    float _1146 = -_1122;
    float _1148 = _1146 + 1.0;
    bool _1150 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1152 = isnan(_1106);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    bool _1162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1164 = _1138 * _1148;
    float _1166 = -_1138;
    float _1168 = _1166 + 1.0;
    float _1170 = 1.0 / _1126;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1176 = _1144 * _1140;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1180 = _1106 + _1178;
    float _1182 = -_1160;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1106 + _1188;
    float _1192 = _1122 * _1184;
    float _1194 = _1174 * _1170;
    float _1196 = _1186 * _1164;
    float _1198 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1200 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1202 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1196);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = fma(_1202, _1192, _1204);
    float _1212 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _1206;
    out.m_43.y = _1208;
    out.m_43.z = _1216;
    out.m_43.w = _1218;
    bool _1220 = !_1162;
    float _1238;
    if (!_1220)
    {
        float _1222 = in.m_39.x;
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1226 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[14].x, _112);
        float _1230 = _1228 * _1224;
        float _1232 = floor(_1230);
        float _1234 = -_1232;
        float _1236 = _1230 + _1234;
        _1238 = _1236;
        _1240 = true;
    }
    else
    {
        _1238 = _260;
    }
    _1240 = false;
    float _1242 = _1238;
    float _1244 = in.m_45.x;
    float _1246 = in.m_45.y;
    float _1248 = in.m_45.z;
    float _1250 = in.m_45.w;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1254 = _1242 + _1252;
    float _1256 = in.m_47.x;
    float _1258 = in.m_47.y;
    float _1260 = in.m_47.z;
    float _1262 = in.m_47.w;
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = in.m_49.w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1292 = 1.0 / _1274;
    float _1294 = 1.0 / _1278;
    float _1296 = _256 * _1246;
    float _1298 = _256 * _1258;
    float _1300 = fma(_254, _1244, _1296);
    float _1302 = 1.0 / _1286;
    float _1304 = _256 * _1266;
    float _1306 = fma(_254, _1256, _1298);
    float _1308 = fma(_258, _1248, _1300);
    float _1310 = fma(_254, _1264, _1304);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1318 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1322 = fma(_258, _1260, _1306);
    float _1324 = fma(_258, _1268, _1310);
    float _1326 = _1308 + _1250;
    float _1328 = -_1316;
    float _1330 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1328);
    float _1332 = -_1318;
    float _1334 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1332);
    float _1336 = -_1320;
    float _1338 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1340 = _1322 + _1262;
    float _1342 = -_1326;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1324 + _1270;
    float _1348 = 1.0 / _1314;
    float _1350 = -_1340;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1344 * _1344;
    float _1356 = -_1346;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1364 = fma(_1352, _1352, _1354);
    float _1366 = 1.0 / _1282;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1370 = _1242 + _1368;
    float _1372 = fma(_1358, _1358, _1364);
    float _1374 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1376 = _1370 * _1292;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1380 = _1242 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1382;
    float _1386 = rsqrt(_1372);
    float _1388 = -_1290;
    float _1390 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1388);
    float _1392 = -_1374;
    float _1394 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1392);
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1398 = _1242 + _1396;
    float _1400 = _1380 * _1294;
    bool _1402 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1404 = isnan(_1242);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = -_1288;
    float _1416 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1418 = _1398 * _1302;
    float _1420 = 1.0 / _1362;
    float _1422 = _1254 * _1366;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1426 = _1242 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1430 = _1242 + _1428;
    bool _1432 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1434 = isnan(_1242);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = -_1412;
    float _1446 = _1444 + 1.0;
    float _1448 = _1430 * _1348;
    float _1450 = _1352 * _1386;
    float _1452 = 1.0 / _1384;
    float _1454 = _1358 * _1386;
    float _1456 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1462 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1464 = isnan(_1242);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = _1344 * _1386;
    float _1476 = fma(_1454, _1454, _1458);
    float _1478 = _1426 * _1420;
    bool _1480 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1482 = isnan(_1242);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1494 = _1242 + _1492;
    float _1496 = rsqrt(_1476);
    float _1498 = -_1456;
    float _1500 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    bool _1502 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1504 = isnan(_1242);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = -_1490;
    float _1516 = _1514 + 1.0;
    float _1518 = _1490 * _1446;
    float _1520 = _1494 * _1452;
    float _1522 = -_1460;
    float _1524 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1522);
    float _1526 = _1442 * _1516;
    float _1528 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1500);
    float _1530 = -_1442;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1524);
    bool _1536 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1538 = isnan(_1242);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -_1472;
    float _1550 = _1548 + 1.0;
    float _1552 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1554 = _1472 * _1532;
    bool _1556 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1558 = isnan(_1242);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 * _1550;
    float _1570 = _1454 * _1496;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = -_1552;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1578);
    bool _1582 = _1242 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1584 = isnan(_1242);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1450 * _1496;
    float _1596 = -_1570;
    float _1598 = _1454 * _1596;
    float _1600 = _1512 * _1574;
    float _1602 = -_1512;
    float _1604 = _1602 + 1.0;
    float _1606 = -_1576;
    float _1608 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1610 = -_1598;
    float _1612 = fma(_1450, _1594, _1610);
    float _1614 = _1474 * _1594;
    float _1616 = _1592 * _1604;
    float _1618 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1608);
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = _1612 * _1612;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1626;
    float _1630 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1632 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1634 = fma(_1614, _1614, _1624);
    float _1636 = _1566 * _1622;
    float _1638 = fma(_1628, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1640 = -_1570;
    float _1642 = _1474 * _1640;
    float _1644 = -_1630;
    float _1646 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1652 = -_1566;
    float _1654 = _1652 + 1.0;
    float _1656 = _1638 * _1636;
    float _1658 = fma(_1642, _1642, _1634);
    float _1660 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1662 = fma(_1650, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1664 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1656);
    float _1666 = rsqrt(_1658);
    float _1668 = -_1660;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1632);
    float _1672 = fma(_1662, _1616, _1664);
    float _1674 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1676;
    float _1680 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1686 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1688 = 1.0 / _1670;
    float _1690 = fma(_1678, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1692 = -_1680;
    float _1694 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1696 = -_1674;
    float _1698 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1700 = fma(_1684, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1702 = fma(_1690, _1600, _1672);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1704;
    float _1708 = -_1686;
    float _1710 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1708);
    float _1712 = _1612 * _1666;
    float _1714 = precise::clamp(_1712, 0.0, 1.0);
    float _1716 = fma(_1700, _1568, _1702);
    float _1718 = fma(_1706, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1720 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1698);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1726 = -_1714;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1718, _1554, _1716);
    float _1732 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1710);
    float _1734 = fma(_1720, _1688, -1.0);
    float _1736 = fma(_1724, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1738 = _1728 * _1688;
    float _1740 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1694);
    float _1742 = fma(_1728, _1734, 1.0);
    float _1744 = fma(_1736, _1526, _1730);
    float _1746 = _1732 * _1738;
    float _1748 = _1740 * _1738;
    float _1750 = in.m_51.x;
    float _1752 = in.m_51.y;
    float _1754 = _1742 * _1742;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1756;
    float _1760 = in.m_39.x;
    float _1762 = fma(_1746, _1746, _1754);
    float _1764 = fma(_1758, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1766;
    float _1770 = fma(_1748, _1748, _1762);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1772;
    float _1776 = fma(_1764, _1518, _1744);
    float _1778 = rsqrt(_1770);
    float _1780 = fma(_1768, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1782 = fma(_1774, _1422, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1784 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1794 = _1784 * 2.0;
    float _1796 = fma(_1788, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1798 = fma(_1792, _1418, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1804;
    float _1808 = fma(_1794, _1750, _260);
    float _1810 = fma(_1802, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1812 = fma(_1806, _1376, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1814 = fma(_1808, -0.25, -0.4000000059604644775390625);
    float _1816 = _1746 * _1778;
    float _1818 = _1748 * _1778;
    float _1820 = _1742 * _1778;
    float _1822 = fma(_1760, 2.0, -1.0);
    float _1824 = _1814 * _1814;
    float _1826 = -_1818;
    float _1828 = _1450 * _1826;
    float _1830 = -_1816;
    float _1832 = _1474 * _1830;
    float _1834 = _1454 * _1820;
    float _1836 = fma(_1822, _1822, _1824);
    float _1838 = -_1816;
    float _1840 = -_1828;
    float _1842 = fma(_1454, _1838, _1840);
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1848 = -_1818;
    float _1850 = -_1834;
    float _1852 = fma(_1474, _1848, _1850);
    float _1854 = -_1832;
    float _1856 = fma(_1450, _1820, _1854);
    float _1858 = _1842 * _1842;
    float _1860 = rsqrt(_1836);
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1866;
    float _1870 = fma(_1852, _1852, _1858);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1872;
    float _1876 = fma(_1846, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1878 = fma(_1868, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1880 = fma(_1856, _1856, _1870);
    float _1882 = fma(_1874, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1884 = _1780 * _1636;
    float _1886 = fma(_1864, _1400, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1888 = _1782 * _1636;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1894 = rsqrt(_1880);
    float _1896 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1884);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1902 = _1822 * _1860;
    float _1904 = _1814 * _1860;
    float _1906 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1888);
    float _1908 = fma(_1796, _1616, _1896);
    float _1910 = fma(_1900, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1912 = fma(_1892, _1478, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1914 = abs(_1902);
    float _1916 = abs(_1904);
    float _1918 = precise::max(_1914, _1916);
    float _1920 = fma(_1798, _1616, _1906);
    float _1922 = _1904 * 0.0625;
    float _1924 = fma(_1810, _1600, _1908);
    bool _1926 = _1918 >= 16.0;
    float _1928 = _1902 * 0.0625;
    float _1930 = fma(_1812, _1600, _1920);
    float _1932 = _1852 * _1894;
    float _1934 = _1856 * _1894;
    float _1936 = _1842 * _1894;
    float _1938 = _1926 ? _1928 : _1902;
    float _1940 = _1454 * _1932;
    float _1942 = _1474 * _1934;
    float _1944 = _1926 ? _1922 : _1904;
    float _1946 = _1450 * _1936;
    float _1948 = -_1940;
    float _1950 = fma(_1450, _1934, _1948);
    float _1952 = abs(_1938);
    bool _1954 = _1952 != 0.0;
    bool _1956 = isnan(_1952);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = -_1942;
    float _1966 = fma(_1454, _1936, _1964);
    float _1968 = -_1946;
    float _1970 = fma(_1474, _1932, _1968);
    float _1972 = _1950 * _1950;
    float _1974 = abs(_1944);
    bool _1976 = _1974 == 0.0;
    bool _1978 = !_1962;
    bool _1980 = _1976 && _1978;
    float _1982 = in.m_53.x;
    float _1984 = in.m_53.y;
    float _1986 = abs(_1944);
    bool _1988 = _1986 == 0.0;
    float _1990 = fma(_1966, _1966, _1972);
    float _1992 = fma(_1876, _1568, _1924);
    float _1994 = fma(_1886, _1568, _1930);
    float _1996 = fma(_1970, _1970, _1990);
    float _1998 = fma(_1878, _1554, _1992);
    float _2000 = fma(_1882, _1554, _1994);
    float _2002 = rsqrt(_1996);
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2004;
    bool _2008 = false;
    int _2010 = as_type<int>(_1600);
    int _2012 = as_type<int>(_1520);
    float _2014 = _1752;
    float _2016 = _1346;
    float _2018 = _1326;
    if (_1980)
    {
        bool _2020 = as_type<int>(_1944) >= 0;
        _2008 = _2020;
    }
    bool _2022 = _2008;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _2024;
    float _2028 = fma(_1910, _1526, _1998);
    float _2030 = fma(_2006, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2032 = _2022 ? (-1) : 0;
    if (_1980)
    {
        int _2034 = _2022 ? 0 : 1078530011;
        _2010 = _2034;
    }
    int _2036 = _2010;
    float _2038 = fma(_2026, _1520, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    if (_1980)
    {
        int _2040 = int(0x80000000) & as_type<int>(_1938);
        int _2042 = _2036 | _2040;
        _2012 = _2042;
    }
    int _2044 = _2012;
    bool _2046 = !_1962;
    bool _2048 = _2046 && _1988;
    int _2050 = _2044;
    float _2052 = as_type<float>(_2044);
    if (!_2048)
    {
        float _2054 = abs(_1938);
        bool _2056 = _2054 != as_type<float>(0x7f800000u /* inf */);
        bool _2058 = isnan(_2054);
        bool _2060 = _2056 || _2058;
        bool _2062 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2064 = _2060 || _2062;
        float _2066 = abs(_1944);
        bool _2068 = _2066 == as_type<float>(0x7f800000u /* inf */);
        float _2070 = abs(_1944);
        bool _2072 = _2070 == as_type<float>(0x7f800000u /* inf */);
        bool _2074 = !_2064;
        bool _2076 = _2072 && _2074;
        if (_2076)
        {
            bool _2078 = as_type<int>(_1944) >= 0;
            _2032 = _2078 ? (-1) : 0;
        }
        int _2080 = _2032;
        if (_2076)
        {
            _2050 = 1075235812;
        }
        int _2082 = _2050;
        int _2084 = _2082;
        if (_2076)
        {
            int _2086 = ~_2080;
            int _2088 = (_2086 != 0) ? _2082 : 1061752795;
            _2084 = _2088;
        }
        int _2090 = _2084;
        float _2092 = as_type<float>(_2090);
        if (_2076)
        {
            int _2094 = int(0x80000000) & as_type<int>(_1938);
            int _2096 = _2090 | _2094;
            _2092 = as_type<float>(_2096);
        }
        float _2098 = _2092;
        bool _2100 = !_2064;
        bool _2102 = _2100 && _2068;
        _2052 = _2098;
        if (!_2102)
        {
            float _2104 = abs(_1938);
            float _2106 = abs(_1944);
            float _2108 = precise::max(_2104, _2106);
            float _2110 = abs(_1938);
            float _2112 = abs(_1944);
            float _2114 = precise::min(_2110, _2112);
            float _2116 = 1.0 / _2108;
            float _2118 = abs(_1938);
            float _2120 = abs(_1944);
            bool _2122 = _2118 > _2120;
            bool _2124 = as_type<int>(_1944) >= 0;
            float _2126 = _2114 * _2116;
            float _2128 = abs(_1938);
            float _2130 = abs(_1944);
            float _2132 = _2128 + _2130;
            float _2134 = _2126 * _2126;
            bool _2136 = _2132 > as_type<float>(0x7f800000u /* inf */);
            bool _2138 = isnan(_2132);
            bool _2140 = _2136 || _2138;
            bool _2142 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2144 = _2140 || _2142;
            float _2146 = _2134 + 11.33538818359375;
            float _2148 = fma(_2134, _2146, 28.84246826171875);
            float _2150 = fma(_2134, _2148, 19.6966705322265625);
            float _2152 = fma(_2134, -0.82336294651031494140625, -5.674867153167724609375);
            float _2154 = fma(_2134, _2152, -6.565555095672607421875);
            float _2156 = 1.0 / _2150;
            float _2158 = _2134 * _2154;
            float _2160 = _2126 * _2158;
            float _2162 = fma(_2160, _2156, _2126);
            int _2164 = as_type<int>(_1938) & int(0x80000000);
            float _2166 = _2162;
            _2052 = _2132;
            if (_2122)
            {
                float _2168 = -_2162;
                float _2170 = _2168 + 1.57079637050628662109375;
                _2166 = _2170;
            }
            float _2172 = _2166;
            int _2174 = as_type<int>(_2172);
            if (!_2124)
            {
                float _2176 = -_2172;
                float _2178 = _2176 + 3.1415927410125732421875;
                _2174 = as_type<int>(_2178);
            }
            int _2180 = _2174;
            if (!_2144)
            {
                int _2182 = _2164 | _2180;
                _2052 = as_type<float>(_2182);
            }
        }
    }
    float _2184 = _2052;
    float _2186 = fma(_1912, _1526, _2000);
    float _2188 = _1970 * _2002;
    float _2190 = _2184 * (-0.15915493667125701904296875);
    float _2192 = fma(_2030, _1518, _2028);
    float _2194 = fma(_2038, _1518, _2186);
    float _2196 = _1950 * _2002;
    float _2198 = _1966 * _2002;
    float _2200 = _1450 * _2188;
    float _2202 = _2190 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].z, _2194);
    float _2208 = in.m_37.x;
    float _2210 = in.m_37.y;
    float _2212 = in.m_37.z;
    float _2214 = -_1752;
    float _2216 = _2214 + 1.0;
    float _2218 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2192);
    float _2220 = _1454 * _2196;
    float _2222 = -_2200;
    float _2224 = fma(_1454, _2198, _2222);
    float _2226 = fma(_2206, _1752, _2216);
    float _2228 = _2190 * 6.283185482025146484375;
    float _2230 = cos(_2228);
    float _2232 = _2206 * _1982;
    float _2234 = -_2220;
    float _2236 = fma(_1474, _2188, _2234);
    float _2238 = _1474 * _2198;
    float _2240 = _2224 * _2224;
    float _2242 = _2226 * _1984;
    float _2244 = -_2238;
    float _2246 = fma(_1450, _2196, _2244);
    out.m_55.x = _1340;
    out.m_55.y = _1326;
    out.m_55.z = _1346;
    float _2248 = _2218 * _1808;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _2242 * _2204;
    float _2254 = in.m_53.z;
    float _2256 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2258 = fma(_2246, _2246, _2250);
    float _2260 = _2242 * _2230;
    float _2262 = -_2252;
    float _2264 = fma(_2232, _2230, _2262);
    float _2266 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2268 = _2210 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2270 = fma(_2232, _2204, _2260);
    float _2272 = rsqrt(_2258);
    float _2274 = fma(_1902, _2256, _2264);
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_1904, _2256, _2270);
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2274);
    float _2284 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2278);
    float _2288 = in.m_39.z;
    float _2290 = _2276 * _2282;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2294 = _2280 * _2286;
    float _2296 = in.m_39.y;
    float _2298 = _2294 * _2188;
    float _2300 = _2290 * _2272;
    float _2302 = _2292 * _2254;
    float _2304 = _2294 * _2198;
    float _2306 = in.m_51.w;
    float _2308 = fma(_2246, _2300, _2298);
    float _2310 = _2294 * _2196;
    float _2312 = fma(_2236, _2300, _2304);
    float _2314 = in.m_57.x;
    float _2316 = fma(_1454, _2302, _2308);
    float _2318 = fma(_1450, _2302, _2312);
    float _2320 = fma(_2224, _2300, _2310);
    float _2322 = _1346 + _2316;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2326 = _1340 + _2318;
    float _2328 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2322 + _2330;
    float _2334 = in.m_57.y;
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2338 = _2326 + _2336;
    bool _2340 = _2288 > 0.5;
    float _2342 = _2332 * _2332;
    bool _2344 = _2296 > 0.5;
    float _2346 = fma(_1474, _2302, _2320);
    float _2348 = fma(_2338, _2338, _2342);
    out.m_33.x = _2328;
    float _2350 = sqrt(_2348);
    int _2352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2354 = _2352 != 0;
    int _2356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2358 = _2356 != 0;
    int _2360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2362 = _2360 != 0;
    out.m_59.w = _2306;
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2366 = _2364 != 0;
    out.m_59.y = _1752;
    float _2368 = -_2334;
    float _2370 = _2368 + 1.0;
    float _2372 = _2328;
    bool _2374 = _2340;
    float _2376 = _2334;
    float _2378 = _2370;
    if (!_2354)
    {
        _2372 = _2314;
    }
    float _2380 = _2372;
    float _2382 = _1326 + _2346;
    bool _2384 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2386 = _2340 ? _2370 : _2334;
    float _2388 = _2380;
    float _2390 = _2386;
    int _2392 = as_type<int>(_2350);
    int _2394 = as_type<int>(_2382);
    if (!_2354)
    {
        _2014 = _2380;
    }
    float _2396 = _2014;
    float _2398 = _2366 ? _2386 : _2334;
    float _2400 = _2396;
    if (_2354)
    {
        bool _2402 = _1760 > 0.5;
        _2374 = _2402;
    }
    bool _2404 = _2374;
    if (_2354)
    {
        _2388 = _2314;
    }
    float _2406 = _2388;
    if (_2358)
    {
        float _2408 = _2344 ? _2370 : _2334;
        _2376 = _2408;
    }
    float _2410 = _2376;
    if (!_2384)
    {
        _2390 = _2326;
    }
    float _2412 = _2390;
    float _2414 = _2412;
    if (!_2384)
    {
        _2016 = _2322;
    }
    float _2416 = _2016;
    float _2418 = _2416;
    if (!_2384)
    {
        _2018 = _2382;
    }
    float _2420 = _2018;
    bool _2422 = !_2384;
    float _2424 = _2420;
    if (!_2422)
    {
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2430 = _2350 + _2428;
        float _2432 = rsqrt(_2348);
        float _2434 = _2430 * _2426;
        float _2436 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = _2434 * 0.15915493667125701904296875;
        float _2440 = _2438 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2442 + (-1.0);
        float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = fma(_2446, _2436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2454 = fma(_2382, _2442, _2450);
        float _2456 = _2432 * _2452;
        float _2458 = fma(_2338, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2460 = fma(_2332, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2424 = _2454;
        _2392 = as_type<int>(_2452);
        _2414 = _2458;
        _2418 = _2460;
        _2378 = _2456;
    }
    float _2462 = _2424;
    int _2464 = _2392;
    float _2466 = _2414;
    float _2468 = _2418;
    float _2470 = _2378;
    int _2472 = _2464;
    float _2474 = _2470;
    if (_2354)
    {
        float _2476 = -_2406;
        float _2478 = _2476 + 1.0;
        _2472 = as_type<int>(_2478);
    }
    int _2480 = _2472;
    float _2482 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2362)
    {
        float _2484 = -_2406;
        float _2486 = _2484 + 1.0;
        _2394 = as_type<int>(_2486);
    }
    int _2488 = _2394;
    if (!_2362)
    {
        _2474 = _2406;
    }
    float _2490 = _2474;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2494 = _2490;
    if (_2354)
    {
        float _2496 = _2404 ? as_type<float>(_2480) : _2406;
        _2400 = _2496;
    }
    float _2498 = _2400;
    float _2500 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2502 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2482);
    if (_2362)
    {
        float _2504 = _2344 ? as_type<float>(_2488) : _2406;
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2500);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2502);
    float _2514 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2508);
    float _2518 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2510);
    float _2520 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2522 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2514);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2516);
    float _2526 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2528 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2530 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = _2520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2528);
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2544 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2546 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2550 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2542);
    float _2556 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2544);
    float _2558 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2538);
    float _2562 = _2550 * _2492;
    float _2564 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2556);
    float _2570 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2560);
    float _2574 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2540);
    float _2576 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2578 = _2566 + _2568;
    float _2580 = _2564 * _2536;
    float _2582 = _2570 * _2324;
    float _2584 = _2576 * _2552;
    float _2586 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2574);
    float _2588 = _2578 * 0.5;
    out.m_61.x = _2582;
    out.m_61.y = _2562;
    out.m_63.x = _2584;
    out.m_63.y = _2580;
    out.m_65.x = _2466;
    out.m_65.y = _2462;
    out.m_65.z = _2468;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2566;
    out.gl_Position.w = _2568;
    out.m_67.z = _2588;
    out.m_67.w = _2568;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

