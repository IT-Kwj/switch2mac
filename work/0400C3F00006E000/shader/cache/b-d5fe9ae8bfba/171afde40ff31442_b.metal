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
    float4 m_47 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_65 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_41 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_57 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
    float4 m_37 [[attribute(10)]];
    float4 m_55 [[attribute(12)]];
    float4 m_51 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1116 = false;
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
        float _2012 = as_type<float>(_102);
        out.gl_Position.z = _2012;
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
        float _2075 = as_type<float>(_134);
        out.gl_Position.z = _2075;
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
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
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
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    bool _320 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _322 = isnan(_284);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_330;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _308;
    float _338 = 1.0 / _300;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _342 = _284 + _340;
    float _344 = _288 * _318;
    bool _346 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _348 = isnan(_284);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _358;
    float _362 = _342 * _314;
    bool _364 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _366 = isnan(_284);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = _292 * _336;
    bool _378 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_284);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = fma(_360, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = _356 * _392;
    float _398 = -_356;
    float _400 = _398 + 1.0;
    float _402 = _296 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _404;
    bool _408 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_284);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _330 * _400;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _426 = _388 * _334;
    float _428 = -_388;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _432;
    float _436 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = _418 * _430;
    float _444 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = _394 * _442;
    float _456 = _436 * _442;
    float _458 = fma(_440, _344, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _460 = fma(_424, _344, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _462 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _464 = _444 * _442;
    float _466 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].x, _454);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].y, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _470;
    float _474 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_458, _426, _466);
    float _486 = fma(_460, _426, _468);
    float _488 = fma(_472, _402, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_462, _426, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _500 = fma(_478, _402, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _502 = fma(_482, _402, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _420, _484);
    float _510 = fma(_494, _362, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_500, _420, _486);
    float _518 = fma(_502, _420, _490);
    float _520 = fma(_510, _396, _508);
    float _522 = fma(_512, _396, _516);
    float _524 = fma(_514, _396, _518);
    float _526 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_316;
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
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_554);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = isnan(_554);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _562;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -_578;
    float _604 = _602 + 1.0;
    bool _606 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_554);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _620 = 1.0 / _566;
    float _622 = 1.0 / _582;
    float _624 = _600 * _596;
    float _626 = -_594;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _594 * _604;
    float _636 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _616 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _632 * _620;
    bool _646 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _554 + _658;
    float _662 = _636 * _638;
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _554 + _668;
    float _672 = fma(_644, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -_656;
    float _676 = _674 + 1.0;
    float _678 = _642 * _622;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _578 * _676;
    float _686 = fma(_678, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _688 = fma(_672, _634, _680);
    float _690 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _684, _688);
    float _696 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _706 = !_618;
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
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _758 = 1.0 / _744;
    bool _760 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _762 = isnan(_728);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = 1.0 / _740;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = _728 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    bool _782 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = isnan(_728);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _748;
    float _796 = _776 * _758;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _800 = _728 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _756;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _812 = _728 + _810;
    float _814 = 1.0 / _736;
    float _816 = _812 * _794;
    bool _818 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _820 = isnan(_728);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _832 = _728 + _830;
    float _834 = 1.0 / _752;
    float _836 = _800 * _808;
    float _838 = _732 * _814;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _842 = _728 + _840;
    float _844 = -_828;
    float _846 = _844 + 1.0;
    float _848 = _842 * _772;
    bool _850 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _852 = isnan(_728);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = _832 * _834;
    float _868 = fma(_780, _796, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = -_860;
    float _876 = _874 + 1.0;
    bool _878 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _880 = isnan(_728);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _828 * _876;
    float _892 = fma(_864, _796, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _894 = fma(_804, _796, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _896 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _898 = isnan(_728);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _770 * _846;
    float _910 = -_770;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _922 = -_906;
    float _924 = _922 + 1.0;
    bool _926 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _928 = isnan(_728);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _906 * _912;
    float _940 = fma(_872, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _942 = _792 * _924;
    float _944 = fma(_920, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _946 = fma(_916, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _948 = -_792;
    float _950 = _948 + 1.0;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _960;
    float _964 = _936 * _950;
    float _966 = _888 * _954;
    float _968 = -_888;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _972;
    float _976 = fma(_958, _866, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _978 = _892 * _966;
    float _980 = _894 * _966;
    float _982 = _868 * _966;
    float _984 = fma(_974, _866, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _988 = fma(_962, _866, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1006 = fma(_940, _964, _986);
    float _1008 = fma(_992, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1010 = fma(_944, _964, _994);
    float _1012 = fma(_1000, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_1004, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1016 = fma(_946, _964, _996);
    float _1018 = fma(_984, _942, _1006);
    float _1020 = in.m_37.x;
    float _1022 = in.m_37.y;
    float _1024 = in.m_37.z;
    float _1026 = fma(_976, _942, _1010);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1028;
    float _1032 = fma(_988, _942, _1016);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1034;
    float _1038 = fma(_1012, _938, _1018);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1040;
    float _1044 = fma(_1030, _838, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1046 = fma(_1036, _838, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1048 = fma(_1014, _938, _1026);
    float _1050 = fma(_1042, _838, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1064 = fma(_1008, _938, _1032);
    float _1066 = fma(_1054, _848, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1068 = fma(_1058, _848, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1070 = fma(_1044, _908, _1038);
    float _1072 = fma(_1046, _908, _1048);
    float _1074 = fma(_1062, _848, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1076 = fma(_1050, _908, _1064);
    float _1078 = fma(_1066, _890, _1070);
    float _1080 = fma(_1068, _890, _1072);
    float _1082 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1084 = fma(_1074, _890, _1076);
    float _1086 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1078);
    float _1088 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1080);
    float _1090 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1094 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1084);
    bool _1096 = !_806;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_39.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        _1114 = _260;
    }
    _1116 = false;
    float _1118 = _1114;
    float _1120 = in.m_41.x;
    float _1122 = in.m_41.y;
    float _1124 = in.m_41.z;
    float _1126 = in.m_41.w;
    float _1128 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = in.m_43.x;
    float _1134 = in.m_43.y;
    float _1136 = in.m_43.z;
    float _1138 = in.m_43.w;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = in.m_45.x;
    float _1146 = in.m_45.y;
    float _1148 = in.m_45.z;
    float _1150 = in.m_45.w;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1158 = _1156 != 0;
    out.m_47.x = _692;
    out.m_47.y = _700;
    out.m_47.z = _702;
    out.m_47.w = _704;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1162 = _1160 != 0;
    float _1164 = _256 * _1122;
    float _1166 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1168 = _256 * _1134;
    float _1170 = fma(_254, _1120, _1164);
    float _1172 = _256 * _1146;
    float _1174 = fma(_254, _1132, _1168);
    float _1176 = fma(_258, _1124, _1170);
    float _1178 = fma(_254, _1144, _1172);
    float _1180 = fma(_258, _1136, _1174);
    float _1182 = _1176 + _1126;
    float _1184 = fma(_258, _1148, _1178);
    float _1186 = _1180 + _1138;
    float _1188 = -_1182;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1192 = _1184 + _1150;
    float _1194 = -_1186;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 * _1190;
    float _1200 = -_1192;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = fma(_1196, _1196, _1198);
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    out.m_49.x = _1186;
    out.m_49.y = _1182;
    out.m_49.z = _1192;
    float _1208 = fma(_1202, _1202, _1204);
    float _1210 = -_1206;
    float _1212 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1214 = rsqrt(_1208);
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1220 = -_1216;
    float _1222 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1220);
    float _1224 = -_1218;
    float _1226 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1228 = _1196 * _1214;
    float _1230 = _1202 * _1214;
    float _1232 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1236 = _1228 * _1228;
    float _1238 = _1190 * _1214;
    float _1240 = -_1234;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1240);
    float _1244 = fma(_1230, _1230, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1250 = rsqrt(_1244);
    float _1252 = -_1246;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1258 = -_1248;
    float _1260 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1262 = -_1256;
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1262);
    float _1266 = -_1232;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1266);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1242);
    float _1272 = _1230 * _1250;
    float _1274 = _1228 * _1250;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = -_1272;
    float _1282 = _1230 * _1280;
    float _1284 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1286 = -_1272;
    float _1288 = _1238 * _1286;
    float _1290 = -_1278;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1228, _1274, _1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1238 * _1274;
    float _1302 = -_1284;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1302);
    float _1306 = _1296 * _1296;
    float _1308 = -_1298;
    float _1310 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    float _1314 = fma(_1300, _1300, _1306);
    float _1316 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1310);
    float _1318 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1320 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1288, _1288, _1314);
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1292);
    float _1326 = -_1318;
    float _1328 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1326);
    float _1330 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1332 = rsqrt(_1322);
    float _1334 = -_1312;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1324);
    float _1338 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1328);
    float _1340 = -_1330;
    float _1342 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1340);
    float _1344 = -_1320;
    float _1346 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1348 = in.m_51.y;
    float _1350 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1342);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1346);
    float _1356 = in.m_39.y;
    float _1358 = _1296 * _1332;
    float _1360 = precise::clamp(_1358, 0.0, 1.0);
    float _1362 = in.m_51.x;
    float _1364 = -_1360;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1338, _1352, -1.0);
    float _1370 = _1366 * _1352;
    float _1372 = in.m_39.z;
    float _1374 = fma(_1366, _1368, 1.0);
    float _1376 = _1350 * _1370;
    float _1378 = _1354 * _1370;
    out.m_53.y = _1348;
    float _1380 = _1374 * _1374;
    bool _1382 = _1356 > 0.5;
    float _1384 = fma(_1376, _1376, _1380);
    float _1386 = in.m_51.w;
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = -_1362;
    float _1392 = _1390 + 1.0;
    float _1394 = rsqrt(_1388);
    bool _1396 = _1372 > 0.5;
    out.m_53.w = _1386;
    float _1398 = _1378 * _1394;
    float _1400 = _1374 * _1394;
    float _1402 = _1376 * _1394;
    float _1404 = in.m_55.x;
    float _1406 = -_1398;
    float _1408 = _1228 * _1406;
    float _1410 = _1230 * _1400;
    float _1412 = -_1402;
    float _1414 = _1238 * _1412;
    float _1416 = -_1402;
    float _1418 = -_1408;
    float _1420 = fma(_1230, _1416, _1418);
    float _1422 = -_1398;
    float _1424 = -_1410;
    float _1426 = fma(_1238, _1422, _1424);
    float _1428 = -_1414;
    float _1430 = fma(_1228, _1400, _1428);
    float _1432 = _1420 * _1420;
    float _1434 = fma(_1426, _1426, _1432);
    float _1436 = fma(_1430, _1430, _1434);
    float _1438 = rsqrt(_1436);
    float _1440 = _1426 * _1438;
    float _1442 = _1430 * _1438;
    float _1444 = _1420 * _1438;
    float _1446 = _1230 * _1440;
    float _1448 = _1238 * _1442;
    float _1450 = _1228 * _1444;
    float _1452 = -_1446;
    float _1454 = fma(_1228, _1442, _1452);
    float _1456 = -_1448;
    float _1458 = fma(_1230, _1444, _1456);
    float _1460 = -_1450;
    float _1462 = fma(_1238, _1440, _1460);
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = fma(_1462, _1462, _1466);
    float _1470 = rsqrt(_1468);
    float _1472 = _1462 * _1470;
    float _1474 = _1454 * _1470;
    float _1476 = _1458 * _1470;
    float _1478 = _1228 * _1472;
    float _1480 = _1230 * _1474;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = _1238 * _1476;
    float _1490 = -_1478;
    float _1492 = fma(_1230, _1476, _1490);
    float _1494 = -_1480;
    float _1496 = fma(_1238, _1472, _1494);
    float _1498 = -_1488;
    float _1500 = fma(_1228, _1474, _1498);
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1482);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1484);
    float _1514 = -_1348;
    float _1516 = _1514 + 1.0;
    float _1518 = _1166 * _1486;
    float _1520 = _1128 * _1510;
    float _1522 = _1130 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _260 * (-1.2000000476837158203125);
    float _1528 = _1522 * _1476;
    float _1530 = _1522 * _1472;
    float _1532 = fma(_1524, _1526, _260);
    float _1534 = _1520 * _1508;
    float _1536 = _1522 * _1474;
    float _1538 = _1532 * _1532;
    float _1540 = fma(_1496, _1534, _1528);
    float _1542 = fma(_1492, _1534, _1536);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[191].y + (-500.0);
    float _1546 = _1538 * (-100.0);
    float _1548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1550 = fma(_1238, _1518, _1542);
    float _1552 = fma(_1228, _1518, _1540);
    float _1554 = fma(_1532, -800.0, _1546);
    float _1556 = _1182 + _1550;
    out.m_33.x = _1548;
    float _1558 = fma(_1500, _1534, _1530);
    float _1560 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1556);
    float _1562 = _1186 + _1552;
    float _1564 = fma(_1230, _1518, _1558);
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1560 + _1566;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[191].y + 500.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1578 = _1118 + _1576;
    float _1580 = precise::max(_1544, _1568);
    float _1582 = in.m_55.y;
    float _1584 = precise::min(_1570, _1580);
    float _1586 = _260 * _260;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1592 = _1532 * (-1900.0);
    float _1594 = 1.0 / _1574;
    float _1596 = _1586 * (-200.0);
    float _1598 = -_1544;
    float _1600 = _1598 + _1584;
    float _1602 = _260 * (-1400.0);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1562);
    float _1606 = fma(_260, -1600.0, _1596);
    float _1608 = _1600 * 0.001000000047497451305389404296875;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1186);
    float _1612 = 1.0 / _1590;
    float _1614 = fma(_1564, _1608, _1192);
    float _1616 = -_1610;
    float _1618 = _1616 + _1604;
    float _1620 = _1500;
    int _1622 = as_type<int>(_1192);
    float _1624 = _1186;
    if (_1142)
    {
        float _1626 = in.m_39.x;
        _1620 = _1626;
    }
    float _1628 = _1620;
    if (_1158)
    {
        float _1630 = -_1404;
        float _1632 = _1630 + 1.0;
        _1622 = as_type<int>(_1632);
    }
    int _1634 = _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1636;
    float _1640 = fma(_1608, _1618, _1610);
    bool _1642 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1644 = isnan(_1118);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1614 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1640 + _1662;
    float _1666 = _1638 * _1594;
    float _1668 = -_1652;
    float _1670 = _1668 + 1.0;
    float _1672 = _1660 * _1660;
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = _1656 * _1612;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1680 = _1118 + _1678;
    float _1682 = fma(_1664, _1664, _1672);
    bool _1684 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1686 = isnan(_1118);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1582;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1666, _1680, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1702 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1704 = isnan(_1118);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = sqrt(_1682);
    float _1716 = fma(_1676, _1578, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1718 = _1712;
    float _1720 = _1582;
    if (!_1158)
    {
        _1624 = _1404;
    }
    float _1722 = _1624;
    float _1724 = _1712 * _1670;
    float _1726 = -_1712;
    float _1728 = _1726 + 1.0;
    bool _1730 = false;
    float _1732 = _1722;
    if (_1142)
    {
        bool _1734 = _1628 > 0.5;
        _1730 = _1734;
    }
    bool _1736 = _1730;
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1740 = _1694 * _1728;
    int _1742 = _1396 ? as_type<int>(_1698) : as_type<int>(_1582);
    float _1744 = -_1694;
    float _1746 = _1744 + 1.0;
    if (!_1142)
    {
        _1718 = _1404;
    }
    float _1748 = _1718;
    float _1750 = _1700 * _1740;
    float _1752 = _1162 ? as_type<float>(_1742) : _1582;
    bool _1754 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1750);
    int _1758 = as_type<int>(_1750);
    float _1760 = _1748;
    if (_1154)
    {
        float _1762 = _1382 ? _1698 : _1582;
        _1720 = _1762;
    }
    float _1764 = _1720;
    float _1766 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1182);
    if (_1142)
    {
        float _1768 = -_1404;
        float _1770 = _1768 + 1.0;
        _1758 = as_type<int>(_1770);
    }
    int _1772 = _1758;
    float _1774 = as_type<float>(_1772);
    if (_1158)
    {
        float _1776 = _1382 ? as_type<float>(_1634) : _1404;
        _1732 = _1776;
    }
    float _1778 = _1732;
    float _1780 = fma(_1716, _1724, _1756);
    float _1782 = -_1766;
    float _1784 = _1782 + _1560;
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1784;
    if (_1142)
    {
        float _1790 = _1736 ? as_type<float>(_1772) : _1404;
        _1760 = _1790;
    }
    float _1792 = _1760;
    float _1794 = fma(_1608, _1784, _1766);
    float _1796 = _1792;
    if (!_1754)
    {
        _1788 = _1640;
    }
    float _1798 = _1788;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = _1798;
    if (!_1754)
    {
        _1774 = _1614;
    }
    float _1804 = _1774;
    float _1806 = _1804;
    if (!_1754)
    {
        _1796 = _1794;
    }
    float _1808 = _1796;
    bool _1810 = !_1754;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1714 + _1816;
        float _1820 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1682);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = sin(_1832);
        float _1836 = _1830 + (-1.0);
        float _1838 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1834, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1842 = fma(_1794, _1830, _1838);
        float _1844 = _1822 * _1840;
        float _1846 = fma(_1664, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1848 = fma(_1660, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1812 = _1842;
        _1802 = _1846;
        _1806 = _1848;
    }
    float _1850 = _1812;
    float _1852 = _1802;
    float _1854 = _1806;
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = _1800 * _1674;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1780);
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1870 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1868);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1886 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1888 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = _1786 * _1738;
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1900 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1904 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1906 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1894);
    out.m_59.x = _1858;
    out.m_59.y = _1892;
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1914 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1916 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1918 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1908);
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1910);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1914);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1928 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1930 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1926);
    float _1936 = _1916 * _1878;
    float _1938 = _1920 + _1922;
    float _1940 = _1918 * _1896;
    float _1942 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1934);
    float _1944 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1942);
    float _1950 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1954 = _1938 * 0.5;
    out.m_61.x = _1940;
    out.m_61.y = _1936;
    out.m_63.x = _1944;
    out.m_63.y = _1946;
    out.m_63.z = _1950;
    out.m_63.w = _1952;
    out.m_65.x = _1852;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1924;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1922;
    out.m_67.z = _1954;
    out.m_67.w = _1922;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1116 = false;
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
        float _2012 = as_type<float>(_102);
        out.gl_Position.z = _2012;
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
        float _2075 = as_type<float>(_134);
        out.gl_Position.z = _2075;
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
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
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
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    bool _320 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _322 = isnan(_284);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_330;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _308;
    float _338 = 1.0 / _300;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _342 = _284 + _340;
    float _344 = _288 * _318;
    bool _346 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _348 = isnan(_284);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _358;
    float _362 = _342 * _314;
    bool _364 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _366 = isnan(_284);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = _292 * _336;
    bool _378 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_284);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = fma(_360, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = _356 * _392;
    float _398 = -_356;
    float _400 = _398 + 1.0;
    float _402 = _296 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _404;
    bool _408 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_284);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _330 * _400;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _426 = _388 * _334;
    float _428 = -_388;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _432;
    float _436 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = _418 * _430;
    float _444 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = _394 * _442;
    float _456 = _436 * _442;
    float _458 = fma(_440, _344, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _460 = fma(_424, _344, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _462 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _464 = _444 * _442;
    float _466 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].x, _454);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].y, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _470;
    float _474 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_458, _426, _466);
    float _486 = fma(_460, _426, _468);
    float _488 = fma(_472, _402, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_462, _426, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _500 = fma(_478, _402, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _502 = fma(_482, _402, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _420, _484);
    float _510 = fma(_494, _362, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_500, _420, _486);
    float _518 = fma(_502, _420, _490);
    float _520 = fma(_510, _396, _508);
    float _522 = fma(_512, _396, _516);
    float _524 = fma(_514, _396, _518);
    float _526 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_316;
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
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_554);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = isnan(_554);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _562;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -_578;
    float _604 = _602 + 1.0;
    bool _606 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_554);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _620 = 1.0 / _566;
    float _622 = 1.0 / _582;
    float _624 = _600 * _596;
    float _626 = -_594;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _594 * _604;
    float _636 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _616 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _632 * _620;
    bool _646 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _554 + _658;
    float _662 = _636 * _638;
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _554 + _668;
    float _672 = fma(_644, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -_656;
    float _676 = _674 + 1.0;
    float _678 = _642 * _622;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _578 * _676;
    float _686 = fma(_678, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _688 = fma(_672, _634, _680);
    float _690 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _684, _688);
    float _696 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _706 = !_618;
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
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _758 = 1.0 / _744;
    bool _760 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _762 = isnan(_728);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = 1.0 / _740;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = _728 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    bool _782 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = isnan(_728);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _748;
    float _796 = _776 * _758;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _800 = _728 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _756;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _812 = _728 + _810;
    float _814 = 1.0 / _736;
    float _816 = _812 * _794;
    bool _818 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _820 = isnan(_728);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _832 = _728 + _830;
    float _834 = 1.0 / _752;
    float _836 = _800 * _808;
    float _838 = _732 * _814;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _842 = _728 + _840;
    float _844 = -_828;
    float _846 = _844 + 1.0;
    float _848 = _842 * _772;
    bool _850 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _852 = isnan(_728);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = _832 * _834;
    float _868 = fma(_780, _796, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = -_860;
    float _876 = _874 + 1.0;
    bool _878 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _880 = isnan(_728);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _828 * _876;
    float _892 = fma(_864, _796, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _894 = fma(_804, _796, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _896 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _898 = isnan(_728);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _770 * _846;
    float _910 = -_770;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _922 = -_906;
    float _924 = _922 + 1.0;
    bool _926 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _928 = isnan(_728);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _906 * _912;
    float _940 = fma(_872, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _942 = _792 * _924;
    float _944 = fma(_920, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _946 = fma(_916, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _948 = -_792;
    float _950 = _948 + 1.0;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _960;
    float _964 = _936 * _950;
    float _966 = _888 * _954;
    float _968 = -_888;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _972;
    float _976 = fma(_958, _866, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _978 = _892 * _966;
    float _980 = _894 * _966;
    float _982 = _868 * _966;
    float _984 = fma(_974, _866, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _988 = fma(_962, _866, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1006 = fma(_940, _964, _986);
    float _1008 = fma(_992, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1010 = fma(_944, _964, _994);
    float _1012 = fma(_1000, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_1004, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1016 = fma(_946, _964, _996);
    float _1018 = fma(_984, _942, _1006);
    float _1020 = in.m_37.x;
    float _1022 = in.m_37.y;
    float _1024 = in.m_37.z;
    float _1026 = fma(_976, _942, _1010);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1028;
    float _1032 = fma(_988, _942, _1016);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1034;
    float _1038 = fma(_1012, _938, _1018);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1040;
    float _1044 = fma(_1030, _838, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1046 = fma(_1036, _838, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1048 = fma(_1014, _938, _1026);
    float _1050 = fma(_1042, _838, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1064 = fma(_1008, _938, _1032);
    float _1066 = fma(_1054, _848, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1068 = fma(_1058, _848, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1070 = fma(_1044, _908, _1038);
    float _1072 = fma(_1046, _908, _1048);
    float _1074 = fma(_1062, _848, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1076 = fma(_1050, _908, _1064);
    float _1078 = fma(_1066, _890, _1070);
    float _1080 = fma(_1068, _890, _1072);
    float _1082 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1084 = fma(_1074, _890, _1076);
    float _1086 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1078);
    float _1088 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1080);
    float _1090 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1094 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1084);
    bool _1096 = !_806;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_39.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        _1114 = _260;
    }
    _1116 = false;
    float _1118 = _1114;
    float _1120 = in.m_41.x;
    float _1122 = in.m_41.y;
    float _1124 = in.m_41.z;
    float _1126 = in.m_41.w;
    float _1128 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = in.m_43.x;
    float _1134 = in.m_43.y;
    float _1136 = in.m_43.z;
    float _1138 = in.m_43.w;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = in.m_45.x;
    float _1146 = in.m_45.y;
    float _1148 = in.m_45.z;
    float _1150 = in.m_45.w;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1158 = _1156 != 0;
    out.m_47.x = _692;
    out.m_47.y = _700;
    out.m_47.z = _702;
    out.m_47.w = _704;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1162 = _1160 != 0;
    float _1164 = _256 * _1122;
    float _1166 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1168 = _256 * _1134;
    float _1170 = fma(_254, _1120, _1164);
    float _1172 = _256 * _1146;
    float _1174 = fma(_254, _1132, _1168);
    float _1176 = fma(_258, _1124, _1170);
    float _1178 = fma(_254, _1144, _1172);
    float _1180 = fma(_258, _1136, _1174);
    float _1182 = _1176 + _1126;
    float _1184 = fma(_258, _1148, _1178);
    float _1186 = _1180 + _1138;
    float _1188 = -_1182;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1192 = _1184 + _1150;
    float _1194 = -_1186;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 * _1190;
    float _1200 = -_1192;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = fma(_1196, _1196, _1198);
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    out.m_49.x = _1186;
    out.m_49.y = _1182;
    out.m_49.z = _1192;
    float _1208 = fma(_1202, _1202, _1204);
    float _1210 = -_1206;
    float _1212 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1214 = rsqrt(_1208);
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1220 = -_1216;
    float _1222 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1220);
    float _1224 = -_1218;
    float _1226 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1228 = _1196 * _1214;
    float _1230 = _1202 * _1214;
    float _1232 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1236 = _1228 * _1228;
    float _1238 = _1190 * _1214;
    float _1240 = -_1234;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1240);
    float _1244 = fma(_1230, _1230, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1250 = rsqrt(_1244);
    float _1252 = -_1246;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1258 = -_1248;
    float _1260 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1262 = -_1256;
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1262);
    float _1266 = -_1232;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1266);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1242);
    float _1272 = _1230 * _1250;
    float _1274 = _1228 * _1250;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = -_1272;
    float _1282 = _1230 * _1280;
    float _1284 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1286 = -_1272;
    float _1288 = _1238 * _1286;
    float _1290 = -_1278;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1228, _1274, _1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1238 * _1274;
    float _1302 = -_1284;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1302);
    float _1306 = _1296 * _1296;
    float _1308 = -_1298;
    float _1310 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    float _1314 = fma(_1300, _1300, _1306);
    float _1316 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1310);
    float _1318 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1320 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1288, _1288, _1314);
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1292);
    float _1326 = -_1318;
    float _1328 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1326);
    float _1330 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1332 = rsqrt(_1322);
    float _1334 = -_1312;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1324);
    float _1338 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1328);
    float _1340 = -_1330;
    float _1342 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1340);
    float _1344 = -_1320;
    float _1346 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1348 = in.m_51.y;
    float _1350 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1342);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1346);
    float _1356 = in.m_39.y;
    float _1358 = _1296 * _1332;
    float _1360 = precise::clamp(_1358, 0.0, 1.0);
    float _1362 = in.m_51.x;
    float _1364 = -_1360;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1338, _1352, -1.0);
    float _1370 = _1366 * _1352;
    float _1372 = in.m_39.z;
    float _1374 = fma(_1366, _1368, 1.0);
    float _1376 = _1350 * _1370;
    float _1378 = _1354 * _1370;
    out.m_53.y = _1348;
    float _1380 = _1374 * _1374;
    bool _1382 = _1356 > 0.5;
    float _1384 = fma(_1376, _1376, _1380);
    float _1386 = in.m_51.w;
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = -_1362;
    float _1392 = _1390 + 1.0;
    float _1394 = rsqrt(_1388);
    bool _1396 = _1372 > 0.5;
    out.m_53.w = _1386;
    float _1398 = _1378 * _1394;
    float _1400 = _1374 * _1394;
    float _1402 = _1376 * _1394;
    float _1404 = in.m_55.x;
    float _1406 = -_1398;
    float _1408 = _1228 * _1406;
    float _1410 = _1230 * _1400;
    float _1412 = -_1402;
    float _1414 = _1238 * _1412;
    float _1416 = -_1402;
    float _1418 = -_1408;
    float _1420 = fma(_1230, _1416, _1418);
    float _1422 = -_1398;
    float _1424 = -_1410;
    float _1426 = fma(_1238, _1422, _1424);
    float _1428 = -_1414;
    float _1430 = fma(_1228, _1400, _1428);
    float _1432 = _1420 * _1420;
    float _1434 = fma(_1426, _1426, _1432);
    float _1436 = fma(_1430, _1430, _1434);
    float _1438 = rsqrt(_1436);
    float _1440 = _1426 * _1438;
    float _1442 = _1430 * _1438;
    float _1444 = _1420 * _1438;
    float _1446 = _1230 * _1440;
    float _1448 = _1238 * _1442;
    float _1450 = _1228 * _1444;
    float _1452 = -_1446;
    float _1454 = fma(_1228, _1442, _1452);
    float _1456 = -_1448;
    float _1458 = fma(_1230, _1444, _1456);
    float _1460 = -_1450;
    float _1462 = fma(_1238, _1440, _1460);
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = fma(_1462, _1462, _1466);
    float _1470 = rsqrt(_1468);
    float _1472 = _1462 * _1470;
    float _1474 = _1454 * _1470;
    float _1476 = _1458 * _1470;
    float _1478 = _1228 * _1472;
    float _1480 = _1230 * _1474;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = _1238 * _1476;
    float _1490 = -_1478;
    float _1492 = fma(_1230, _1476, _1490);
    float _1494 = -_1480;
    float _1496 = fma(_1238, _1472, _1494);
    float _1498 = -_1488;
    float _1500 = fma(_1228, _1474, _1498);
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1482);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1484);
    float _1514 = -_1348;
    float _1516 = _1514 + 1.0;
    float _1518 = _1166 * _1486;
    float _1520 = _1128 * _1510;
    float _1522 = _1130 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _260 * (-1.2000000476837158203125);
    float _1528 = _1522 * _1476;
    float _1530 = _1522 * _1472;
    float _1532 = fma(_1524, _1526, _260);
    float _1534 = _1520 * _1508;
    float _1536 = _1522 * _1474;
    float _1538 = _1532 * _1532;
    float _1540 = fma(_1496, _1534, _1528);
    float _1542 = fma(_1492, _1534, _1536);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[191].y + (-500.0);
    float _1546 = _1538 * (-100.0);
    float _1548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1550 = fma(_1238, _1518, _1542);
    float _1552 = fma(_1228, _1518, _1540);
    float _1554 = fma(_1532, -800.0, _1546);
    float _1556 = _1182 + _1550;
    out.m_33.x = _1548;
    float _1558 = fma(_1500, _1534, _1530);
    float _1560 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1556);
    float _1562 = _1186 + _1552;
    float _1564 = fma(_1230, _1518, _1558);
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1560 + _1566;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[191].y + 500.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1578 = _1118 + _1576;
    float _1580 = precise::max(_1544, _1568);
    float _1582 = in.m_55.y;
    float _1584 = precise::min(_1570, _1580);
    float _1586 = _260 * _260;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1592 = _1532 * (-1900.0);
    float _1594 = 1.0 / _1574;
    float _1596 = _1586 * (-200.0);
    float _1598 = -_1544;
    float _1600 = _1598 + _1584;
    float _1602 = _260 * (-1400.0);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1562);
    float _1606 = fma(_260, -1600.0, _1596);
    float _1608 = _1600 * 0.001000000047497451305389404296875;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1186);
    float _1612 = 1.0 / _1590;
    float _1614 = fma(_1564, _1608, _1192);
    float _1616 = -_1610;
    float _1618 = _1616 + _1604;
    float _1620 = _1500;
    int _1622 = as_type<int>(_1192);
    float _1624 = _1186;
    if (_1142)
    {
        float _1626 = in.m_39.x;
        _1620 = _1626;
    }
    float _1628 = _1620;
    if (_1158)
    {
        float _1630 = -_1404;
        float _1632 = _1630 + 1.0;
        _1622 = as_type<int>(_1632);
    }
    int _1634 = _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1636;
    float _1640 = fma(_1608, _1618, _1610);
    bool _1642 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1644 = isnan(_1118);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1614 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1640 + _1662;
    float _1666 = _1638 * _1594;
    float _1668 = -_1652;
    float _1670 = _1668 + 1.0;
    float _1672 = _1660 * _1660;
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = _1656 * _1612;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1680 = _1118 + _1678;
    float _1682 = fma(_1664, _1664, _1672);
    bool _1684 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1686 = isnan(_1118);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1582;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1666, _1680, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1702 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1704 = isnan(_1118);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = sqrt(_1682);
    float _1716 = fma(_1676, _1578, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1718 = _1712;
    float _1720 = _1582;
    if (!_1158)
    {
        _1624 = _1404;
    }
    float _1722 = _1624;
    float _1724 = _1712 * _1670;
    float _1726 = -_1712;
    float _1728 = _1726 + 1.0;
    bool _1730 = false;
    float _1732 = _1722;
    if (_1142)
    {
        bool _1734 = _1628 > 0.5;
        _1730 = _1734;
    }
    bool _1736 = _1730;
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1740 = _1694 * _1728;
    int _1742 = _1396 ? as_type<int>(_1698) : as_type<int>(_1582);
    float _1744 = -_1694;
    float _1746 = _1744 + 1.0;
    if (!_1142)
    {
        _1718 = _1404;
    }
    float _1748 = _1718;
    float _1750 = _1700 * _1740;
    float _1752 = _1162 ? as_type<float>(_1742) : _1582;
    bool _1754 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1750);
    int _1758 = as_type<int>(_1750);
    float _1760 = _1748;
    if (_1154)
    {
        float _1762 = _1382 ? _1698 : _1582;
        _1720 = _1762;
    }
    float _1764 = _1720;
    float _1766 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1182);
    if (_1142)
    {
        float _1768 = -_1404;
        float _1770 = _1768 + 1.0;
        _1758 = as_type<int>(_1770);
    }
    int _1772 = _1758;
    float _1774 = as_type<float>(_1772);
    if (_1158)
    {
        float _1776 = _1382 ? as_type<float>(_1634) : _1404;
        _1732 = _1776;
    }
    float _1778 = _1732;
    float _1780 = fma(_1716, _1724, _1756);
    float _1782 = -_1766;
    float _1784 = _1782 + _1560;
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1784;
    if (_1142)
    {
        float _1790 = _1736 ? as_type<float>(_1772) : _1404;
        _1760 = _1790;
    }
    float _1792 = _1760;
    float _1794 = fma(_1608, _1784, _1766);
    float _1796 = _1792;
    if (!_1754)
    {
        _1788 = _1640;
    }
    float _1798 = _1788;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = _1798;
    if (!_1754)
    {
        _1774 = _1614;
    }
    float _1804 = _1774;
    float _1806 = _1804;
    if (!_1754)
    {
        _1796 = _1794;
    }
    float _1808 = _1796;
    bool _1810 = !_1754;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1714 + _1816;
        float _1820 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1682);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = sin(_1832);
        float _1836 = _1830 + (-1.0);
        float _1838 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1834, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1842 = fma(_1794, _1830, _1838);
        float _1844 = _1822 * _1840;
        float _1846 = fma(_1664, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1848 = fma(_1660, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1812 = _1842;
        _1802 = _1846;
        _1806 = _1848;
    }
    float _1850 = _1812;
    float _1852 = _1802;
    float _1854 = _1806;
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = _1800 * _1674;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1780);
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1870 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1868);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1886 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1888 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = _1786 * _1738;
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1900 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1904 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1906 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1894);
    out.m_59.x = _1858;
    out.m_59.y = _1892;
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1914 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1916 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1918 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1908);
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1910);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1914);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1928 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1930 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1926);
    float _1936 = _1916 * _1878;
    float _1938 = _1920 + _1922;
    float _1940 = _1918 * _1896;
    float _1942 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1934);
    float _1944 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1942);
    float _1950 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1954 = _1938 * 0.5;
    out.m_61.x = _1940;
    out.m_61.y = _1936;
    out.m_63.x = _1944;
    out.m_63.y = _1946;
    out.m_63.z = _1950;
    out.m_63.w = _1952;
    out.m_65.x = _1852;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1924;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1922;
    out.m_67.z = _1954;
    out.m_67.w = _1922;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1116 = false;
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
        float _2012 = as_type<float>(_102);
        out.gl_Position.z = _2012;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2075 = as_type<float>(_134);
        out.gl_Position.z = _2075;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
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
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    bool _320 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _322 = isnan(_284);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_330;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _308;
    float _338 = 1.0 / _300;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _342 = _284 + _340;
    float _344 = _288 * _318;
    bool _346 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _348 = isnan(_284);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _358;
    float _362 = _342 * _314;
    bool _364 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _366 = isnan(_284);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = _292 * _336;
    bool _378 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _380 = isnan(_284);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = fma(_360, _376, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = _356 * _392;
    float _398 = -_356;
    float _400 = _398 + 1.0;
    float _402 = _296 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _404;
    bool _408 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_284);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _330 * _400;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _426 = _388 * _334;
    float _428 = -_388;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _432;
    float _436 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _442 = _418 * _430;
    float _444 = fma(_434, _376, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = _394 * _442;
    float _456 = _436 * _442;
    float _458 = fma(_440, _344, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _460 = fma(_424, _344, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _462 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _464 = _444 * _442;
    float _466 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].x, _454);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].y, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _470;
    float _474 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _480;
    float _484 = fma(_458, _426, _466);
    float _486 = fma(_460, _426, _468);
    float _488 = fma(_472, _402, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _490 = fma(_462, _426, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _500 = fma(_478, _402, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _502 = fma(_482, _402, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _508 = fma(_488, _420, _484);
    float _510 = fma(_494, _362, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _512 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _514 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _516 = fma(_500, _420, _486);
    float _518 = fma(_502, _420, _490);
    float _520 = fma(_510, _396, _508);
    float _522 = fma(_512, _396, _516);
    float _524 = fma(_514, _396, _518);
    float _526 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].x, _520);
    float _528 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].y, _522);
    float _530 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[111].z, _524);
    bool _532 = !_316;
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
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_554);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _584 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = isnan(_554);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _562;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -_578;
    float _604 = _602 + 1.0;
    bool _606 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_554);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    bool _618 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _620 = 1.0 / _566;
    float _622 = 1.0 / _582;
    float _624 = _600 * _596;
    float _626 = -_594;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _594 * _604;
    float _636 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _616 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _632 * _620;
    bool _646 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = _554 + _658;
    float _662 = _636 * _638;
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _670 = _554 + _668;
    float _672 = fma(_644, _660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -_656;
    float _676 = _674 + 1.0;
    float _678 = _642 * _622;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _682 = _526 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = _578 * _676;
    float _686 = fma(_678, _670, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _688 = fma(_672, _634, _680);
    float _690 = _530 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _684, _688);
    float _696 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _706 = !_618;
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
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _758 = 1.0 / _744;
    bool _760 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _762 = isnan(_728);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = 1.0 / _740;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = _728 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    bool _782 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = isnan(_728);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _748;
    float _796 = _776 * _758;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _800 = _728 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _756;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _812 = _728 + _810;
    float _814 = 1.0 / _736;
    float _816 = _812 * _794;
    bool _818 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _820 = isnan(_728);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _832 = _728 + _830;
    float _834 = 1.0 / _752;
    float _836 = _800 * _808;
    float _838 = _732 * _814;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _842 = _728 + _840;
    float _844 = -_828;
    float _846 = _844 + 1.0;
    float _848 = _842 * _772;
    bool _850 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _852 = isnan(_728);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = _832 * _834;
    float _868 = fma(_780, _796, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = -_860;
    float _876 = _874 + 1.0;
    bool _878 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _880 = isnan(_728);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _828 * _876;
    float _892 = fma(_864, _796, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _894 = fma(_804, _796, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _896 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _898 = isnan(_728);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _770 * _846;
    float _910 = -_770;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _922 = -_906;
    float _924 = _922 + 1.0;
    bool _926 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _928 = isnan(_728);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _906 * _912;
    float _940 = fma(_872, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _942 = _792 * _924;
    float _944 = fma(_920, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _946 = fma(_916, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _948 = -_792;
    float _950 = _948 + 1.0;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _960;
    float _964 = _936 * _950;
    float _966 = _888 * _954;
    float _968 = -_888;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _972;
    float _976 = fma(_958, _866, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _978 = _892 * _966;
    float _980 = _894 * _966;
    float _982 = _868 * _966;
    float _984 = fma(_974, _866, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _988 = fma(_962, _866, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1006 = fma(_940, _964, _986);
    float _1008 = fma(_992, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1010 = fma(_944, _964, _994);
    float _1012 = fma(_1000, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_1004, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1016 = fma(_946, _964, _996);
    float _1018 = fma(_984, _942, _1006);
    float _1020 = in.m_37.x;
    float _1022 = in.m_37.y;
    float _1024 = in.m_37.z;
    float _1026 = fma(_976, _942, _1010);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1028;
    float _1032 = fma(_988, _942, _1016);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1034;
    float _1038 = fma(_1012, _938, _1018);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1040;
    float _1044 = fma(_1030, _838, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1046 = fma(_1036, _838, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1048 = fma(_1014, _938, _1026);
    float _1050 = fma(_1042, _838, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1064 = fma(_1008, _938, _1032);
    float _1066 = fma(_1054, _848, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1068 = fma(_1058, _848, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1070 = fma(_1044, _908, _1038);
    float _1072 = fma(_1046, _908, _1048);
    float _1074 = fma(_1062, _848, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1076 = fma(_1050, _908, _1064);
    float _1078 = fma(_1066, _890, _1070);
    float _1080 = fma(_1068, _890, _1072);
    float _1082 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1084 = fma(_1074, _890, _1076);
    float _1086 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1078);
    float _1088 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1080);
    float _1090 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1094 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1084);
    bool _1096 = !_806;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_39.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        _1114 = _260;
    }
    _1116 = false;
    float _1118 = _1114;
    float _1120 = in.m_41.x;
    float _1122 = in.m_41.y;
    float _1124 = in.m_41.z;
    float _1126 = in.m_41.w;
    float _1128 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = in.m_43.x;
    float _1134 = in.m_43.y;
    float _1136 = in.m_43.z;
    float _1138 = in.m_43.w;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = in.m_45.x;
    float _1146 = in.m_45.y;
    float _1148 = in.m_45.z;
    float _1150 = in.m_45.w;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1158 = _1156 != 0;
    out.m_47.x = _692;
    out.m_47.y = _700;
    out.m_47.z = _702;
    out.m_47.w = _704;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1162 = _1160 != 0;
    float _1164 = _256 * _1122;
    float _1166 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1168 = _256 * _1134;
    float _1170 = fma(_254, _1120, _1164);
    float _1172 = _256 * _1146;
    float _1174 = fma(_254, _1132, _1168);
    float _1176 = fma(_258, _1124, _1170);
    float _1178 = fma(_254, _1144, _1172);
    float _1180 = fma(_258, _1136, _1174);
    float _1182 = _1176 + _1126;
    float _1184 = fma(_258, _1148, _1178);
    float _1186 = _1180 + _1138;
    float _1188 = -_1182;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1192 = _1184 + _1150;
    float _1194 = -_1186;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 * _1190;
    float _1200 = -_1192;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = fma(_1196, _1196, _1198);
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    out.m_49.x = _1186;
    out.m_49.y = _1182;
    out.m_49.z = _1192;
    float _1208 = fma(_1202, _1202, _1204);
    float _1210 = -_1206;
    float _1212 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1210);
    float _1214 = rsqrt(_1208);
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1220 = -_1216;
    float _1222 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1220);
    float _1224 = -_1218;
    float _1226 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1228 = _1196 * _1214;
    float _1230 = _1202 * _1214;
    float _1232 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1236 = _1228 * _1228;
    float _1238 = _1190 * _1214;
    float _1240 = -_1234;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1240);
    float _1244 = fma(_1230, _1230, _1236);
    float _1246 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1250 = rsqrt(_1244);
    float _1252 = -_1246;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1258 = -_1248;
    float _1260 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1262 = -_1256;
    float _1264 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1262);
    float _1266 = -_1232;
    float _1268 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1266);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1242);
    float _1272 = _1230 * _1250;
    float _1274 = _1228 * _1250;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = -_1272;
    float _1282 = _1230 * _1280;
    float _1284 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1286 = -_1272;
    float _1288 = _1238 * _1286;
    float _1290 = -_1278;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1228, _1274, _1294);
    float _1298 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1238 * _1274;
    float _1302 = -_1284;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1302);
    float _1306 = _1296 * _1296;
    float _1308 = -_1298;
    float _1310 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1304);
    float _1314 = fma(_1300, _1300, _1306);
    float _1316 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1310);
    float _1318 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1320 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1288, _1288, _1314);
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1292);
    float _1326 = -_1318;
    float _1328 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1326);
    float _1330 = _1222 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1332 = rsqrt(_1322);
    float _1334 = -_1312;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1324);
    float _1338 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1328);
    float _1340 = -_1330;
    float _1342 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1340);
    float _1344 = -_1320;
    float _1346 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1348 = in.m_51.y;
    float _1350 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1342);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1346);
    float _1356 = in.m_39.y;
    float _1358 = _1296 * _1332;
    float _1360 = precise::clamp(_1358, 0.0, 1.0);
    float _1362 = in.m_51.x;
    float _1364 = -_1360;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1338, _1352, -1.0);
    float _1370 = _1366 * _1352;
    float _1372 = in.m_39.z;
    float _1374 = fma(_1366, _1368, 1.0);
    float _1376 = _1350 * _1370;
    float _1378 = _1354 * _1370;
    out.m_53.y = _1348;
    float _1380 = _1374 * _1374;
    bool _1382 = _1356 > 0.5;
    float _1384 = fma(_1376, _1376, _1380);
    float _1386 = in.m_51.w;
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = -_1362;
    float _1392 = _1390 + 1.0;
    float _1394 = rsqrt(_1388);
    bool _1396 = _1372 > 0.5;
    out.m_53.w = _1386;
    float _1398 = _1378 * _1394;
    float _1400 = _1374 * _1394;
    float _1402 = _1376 * _1394;
    float _1404 = in.m_55.x;
    float _1406 = -_1398;
    float _1408 = _1228 * _1406;
    float _1410 = _1230 * _1400;
    float _1412 = -_1402;
    float _1414 = _1238 * _1412;
    float _1416 = -_1402;
    float _1418 = -_1408;
    float _1420 = fma(_1230, _1416, _1418);
    float _1422 = -_1398;
    float _1424 = -_1410;
    float _1426 = fma(_1238, _1422, _1424);
    float _1428 = -_1414;
    float _1430 = fma(_1228, _1400, _1428);
    float _1432 = _1420 * _1420;
    float _1434 = fma(_1426, _1426, _1432);
    float _1436 = fma(_1430, _1430, _1434);
    float _1438 = rsqrt(_1436);
    float _1440 = _1426 * _1438;
    float _1442 = _1430 * _1438;
    float _1444 = _1420 * _1438;
    float _1446 = _1230 * _1440;
    float _1448 = _1238 * _1442;
    float _1450 = _1228 * _1444;
    float _1452 = -_1446;
    float _1454 = fma(_1228, _1442, _1452);
    float _1456 = -_1448;
    float _1458 = fma(_1230, _1444, _1456);
    float _1460 = -_1450;
    float _1462 = fma(_1238, _1440, _1460);
    float _1464 = _1454 * _1454;
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = fma(_1462, _1462, _1466);
    float _1470 = rsqrt(_1468);
    float _1472 = _1462 * _1470;
    float _1474 = _1454 * _1470;
    float _1476 = _1458 * _1470;
    float _1478 = _1228 * _1472;
    float _1480 = _1230 * _1474;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = _1238 * _1476;
    float _1490 = -_1478;
    float _1492 = fma(_1230, _1476, _1490);
    float _1494 = -_1480;
    float _1496 = fma(_1238, _1472, _1494);
    float _1498 = -_1488;
    float _1500 = fma(_1228, _1474, _1498);
    float _1502 = _1492 * _1492;
    float _1504 = fma(_1496, _1496, _1502);
    float _1506 = fma(_1500, _1500, _1504);
    float _1508 = rsqrt(_1506);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1482);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1484);
    float _1514 = -_1348;
    float _1516 = _1514 + 1.0;
    float _1518 = _1166 * _1486;
    float _1520 = _1128 * _1510;
    float _1522 = _1130 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _260 * (-1.2000000476837158203125);
    float _1528 = _1522 * _1476;
    float _1530 = _1522 * _1472;
    float _1532 = fma(_1524, _1526, _260);
    float _1534 = _1520 * _1508;
    float _1536 = _1522 * _1474;
    float _1538 = _1532 * _1532;
    float _1540 = fma(_1496, _1534, _1528);
    float _1542 = fma(_1492, _1534, _1536);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[191].y + (-500.0);
    float _1546 = _1538 * (-100.0);
    float _1548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1550 = fma(_1238, _1518, _1542);
    float _1552 = fma(_1228, _1518, _1540);
    float _1554 = fma(_1532, -800.0, _1546);
    float _1556 = _1182 + _1550;
    out.m_33.x = _1548;
    float _1558 = fma(_1500, _1534, _1530);
    float _1560 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1556);
    float _1562 = _1186 + _1552;
    float _1564 = fma(_1230, _1518, _1558);
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1560 + _1566;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[191].y + 500.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1578 = _1118 + _1576;
    float _1580 = precise::max(_1544, _1568);
    float _1582 = in.m_55.y;
    float _1584 = precise::min(_1570, _1580);
    float _1586 = _260 * _260;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1592 = _1532 * (-1900.0);
    float _1594 = 1.0 / _1574;
    float _1596 = _1586 * (-200.0);
    float _1598 = -_1544;
    float _1600 = _1598 + _1584;
    float _1602 = _260 * (-1400.0);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1562);
    float _1606 = fma(_260, -1600.0, _1596);
    float _1608 = _1600 * 0.001000000047497451305389404296875;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1186);
    float _1612 = 1.0 / _1590;
    float _1614 = fma(_1564, _1608, _1192);
    float _1616 = -_1610;
    float _1618 = _1616 + _1604;
    float _1620 = _1500;
    int _1622 = as_type<int>(_1192);
    float _1624 = _1186;
    if (_1142)
    {
        float _1626 = in.m_39.x;
        _1620 = _1626;
    }
    float _1628 = _1620;
    if (_1158)
    {
        float _1630 = -_1404;
        float _1632 = _1630 + 1.0;
        _1622 = as_type<int>(_1632);
    }
    int _1634 = _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1636;
    float _1640 = fma(_1608, _1618, _1610);
    bool _1642 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1644 = isnan(_1118);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1614 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1640 + _1662;
    float _1666 = _1638 * _1594;
    float _1668 = -_1652;
    float _1670 = _1668 + 1.0;
    float _1672 = _1660 * _1660;
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = _1656 * _1612;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1680 = _1118 + _1678;
    float _1682 = fma(_1664, _1664, _1672);
    bool _1684 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1686 = isnan(_1118);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1582;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1666, _1680, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1702 = _1118 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1704 = isnan(_1118);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = sqrt(_1682);
    float _1716 = fma(_1676, _1578, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1718 = _1712;
    float _1720 = _1582;
    if (!_1158)
    {
        _1624 = _1404;
    }
    float _1722 = _1624;
    float _1724 = _1712 * _1670;
    float _1726 = -_1712;
    float _1728 = _1726 + 1.0;
    bool _1730 = false;
    float _1732 = _1722;
    if (_1142)
    {
        bool _1734 = _1628 > 0.5;
        _1730 = _1734;
    }
    bool _1736 = _1730;
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1740 = _1694 * _1728;
    int _1742 = _1396 ? as_type<int>(_1698) : as_type<int>(_1582);
    float _1744 = -_1694;
    float _1746 = _1744 + 1.0;
    if (!_1142)
    {
        _1718 = _1404;
    }
    float _1748 = _1718;
    float _1750 = _1700 * _1740;
    float _1752 = _1162 ? as_type<float>(_1742) : _1582;
    bool _1754 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1750);
    int _1758 = as_type<int>(_1750);
    float _1760 = _1748;
    if (_1154)
    {
        float _1762 = _1382 ? _1698 : _1582;
        _1720 = _1762;
    }
    float _1764 = _1720;
    float _1766 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1182);
    if (_1142)
    {
        float _1768 = -_1404;
        float _1770 = _1768 + 1.0;
        _1758 = as_type<int>(_1770);
    }
    int _1772 = _1758;
    float _1774 = as_type<float>(_1772);
    if (_1158)
    {
        float _1776 = _1382 ? as_type<float>(_1634) : _1404;
        _1732 = _1776;
    }
    float _1778 = _1732;
    float _1780 = fma(_1716, _1724, _1756);
    float _1782 = -_1766;
    float _1784 = _1782 + _1560;
    float _1786 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1788 = _1784;
    if (_1142)
    {
        float _1790 = _1736 ? as_type<float>(_1772) : _1404;
        _1760 = _1790;
    }
    float _1792 = _1760;
    float _1794 = fma(_1608, _1784, _1766);
    float _1796 = _1792;
    if (!_1754)
    {
        _1788 = _1640;
    }
    float _1798 = _1788;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = _1798;
    if (!_1754)
    {
        _1774 = _1614;
    }
    float _1804 = _1774;
    float _1806 = _1804;
    if (!_1754)
    {
        _1796 = _1794;
    }
    float _1808 = _1796;
    bool _1810 = !_1754;
    float _1812 = _1808;
    if (!_1810)
    {
        float _1814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1818 = _1714 + _1816;
        float _1820 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = rsqrt(_1682);
        float _1824 = _1818 * _1814;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = _1826 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = _1826 * 6.283185482025146484375;
        float _1834 = sin(_1832);
        float _1836 = _1830 + (-1.0);
        float _1838 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1834, _1820, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1842 = fma(_1794, _1830, _1838);
        float _1844 = _1822 * _1840;
        float _1846 = fma(_1664, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1848 = fma(_1660, _1844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1812 = _1842;
        _1802 = _1846;
        _1806 = _1848;
    }
    float _1850 = _1812;
    float _1852 = _1802;
    float _1854 = _1806;
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = _1800 * _1674;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1780);
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1870 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1868);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1880 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1886 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1888 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1892 = _1786 * _1738;
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1888);
    float _1900 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1890);
    float _1902 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1904 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1906 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1894);
    out.m_59.x = _1858;
    out.m_59.y = _1892;
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1914 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1916 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1918 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1908);
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1910);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1914);
    float _1926 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1928 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1930 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1926);
    float _1936 = _1916 * _1878;
    float _1938 = _1920 + _1922;
    float _1940 = _1918 * _1896;
    float _1942 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1934);
    float _1944 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1942);
    float _1950 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1954 = _1938 * 0.5;
    out.m_61.x = _1940;
    out.m_61.y = _1936;
    out.m_63.x = _1944;
    out.m_63.y = _1946;
    out.m_63.z = _1950;
    out.m_63.w = _1952;
    out.m_65.x = _1852;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1924;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1922;
    out.m_67.z = _1954;
    out.m_67.w = _1922;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

