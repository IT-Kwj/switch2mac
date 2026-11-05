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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_57 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    float _94 = _75;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1466 = as_type<float>(_102);
        out.gl_Position.z = _1466;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _106 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_75);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = in.m_39.x;
    float _118 = float(_80);
    float _120 = in.m_39.y;
    bool _122 = _84 >= _118;
    bool _124 = !_114;
    bool _126 = _122 || _124;
    if (_126)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _92;
    if (_126)
    {
        out.m_37.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _104 = as_type<int>(_130);
    }
    int _132 = _104;
    out.m_41.x = _116;
    out.m_41.y = _120;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_132);
        out.gl_Position.z = _1529;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_43.y;
    float _136 = 1.0 / _118;
    float _138 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_45.w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_32.x;
    float _154 = in.m_32.y;
    float _156 = in.m_32.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = _138;
    if (!_150)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _94 = _168;
    }
    float _170 = _94;
    float _172 = _170;
    if (!_150)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_47.y = _134;
    bool _178 = !_150;
    float _180 = _176;
    float _182 = _134;
    if (!_178)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _138 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _138);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _212;
    }
    float _214 = _180;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _164 = _236;
    }
    float _238 = _164;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = _84 * _136;
    float _256 = fma(_248, _140, _158);
    float _258 = fma(_250, _140, _160);
    float _260 = fma(_252, _140, _162);
    bool _262 = !_240;
    float _264 = _254;
    float _266 = _260;
    if (!_262)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _270 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = in.m_39.w;
    float _286 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = in.m_45.x;
    float _290 = in.m_45.y;
    float _292 = in.m_45.z;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _300 = _298 != 0;
    float _302 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _304 = 1.0 / _296;
    float _306 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _318 = _316 != 0;
    float _320 = 1.0 / _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    float _334 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _336 = _284 > 0.5;
    float _338 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _342 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _344 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _352 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _344);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = 1.0 / _350;
    float _362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = 1.0 / _356;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _382 = 0.0;
    bool _384 = _328;
    if (_318)
    {
        float _386 = in.m_39.z;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _366 * _304;
    float _392 = _370 * _320;
    float _394 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = 1.0 / _358;
    out.m_51.x = _394;
    out.m_51.y = _396;
    out.m_51.z = _398;
    float _414 = _408 * _360;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _420 = _120 > 0.5;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = _362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _410;
    float _430 = _424 * _346;
    float _432 = _372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _436 = _420;
    float _438 = _432;
    if (!_300)
    {
        _266 = _120;
    }
    float _440 = _266;
    float _442 = -_134;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _446;
    float _450 = 1.0 / _418;
    float _452 = _440;
    if (_300)
    {
        _452 = _116;
    }
    float _454 = _452;
    float _456 = _448 * _376;
    int _458 = _420 ? as_type<int>(_444) : as_type<int>(_134);
    float _460 = _412 * _402;
    float _462 = _376;
    if (!_300)
    {
        float _464 = in.m_39.z;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _352);
    float _470 = _328 ? as_type<float>(_458) : _134;
    float _472 = _428 * _404;
    if (_332)
    {
        float _474 = _336 ? _444 : _134;
        _182 = _474;
    }
    float _476 = _182;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _282 + _482;
    float _486 = -_426;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_318)
    {
        bool _490 = _388 > 0.5;
        _384 = _490;
    }
    bool _492 = _384;
    float _494 = -_432;
    float _496 = _494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = fma(_390, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _502 = _488 * _488;
    float _504 = _480 * _450;
    float _506 = 1.0 / _434;
    float _508 = -_500;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = fma(_496, _496, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _282 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _520 = _282 + _518;
    if (_314)
    {
        bool _522 = _116 > 0.5;
        _436 = _522;
    }
    bool _524 = _436;
    float _526 = fma(_510, _510, _512);
    float _528 = fma(_430, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _532 = fma(_414, _520, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _534 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _536 = isnan(_282);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = in.m_43.x;
    bool _548 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _550 = isnan(_282);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _562 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _564 = isnan(_282);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _282 + _574;
    float _578 = rsqrt(_526);
    float _580 = _506 * _400;
    float _582 = _506;
    float _584 = _466;
    float _586 = _576;
    if (!_300)
    {
        _582 = _466;
    }
    float _588 = _582;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    float _594 = _588;
    if (_300)
    {
        _594 = _120;
    }
    float _596 = _594;
    float _598 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_300)
    {
        _584 = _120;
    }
    float _600 = _584;
    float _602 = -_544;
    float _604 = _602 + 1.0;
    float _606 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = rsqrt(_468);
    float _610 = _558 * _604;
    float _612 = fma(_606, _476, -0.5);
    bool _614 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_282);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _572 * _592;
    float _628 = -_572;
    float _630 = _628 + 1.0;
    float _632 = _496 * _578;
    float _634 = _510 * _578;
    float _636 = _488 * _578;
    bool _638 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_282);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = _632 * _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _656 = _634 * _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _660 = _636 * _658;
    float _662 = -_624;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _668 = -_652;
    float _670 = fma(_634, _666, _668);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = -_656;
    float _676 = fma(_636, _672, _674);
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _680 = -_660;
    float _682 = fma(_632, _678, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = _670 * _670;
    float _688 = _624 * _630;
    bool _690 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = isnan(_282);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _648 * _664;
    float _704 = fma(_676, _676, _686);
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    bool _712 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_282);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = fma(_682, _682, _704);
    float _726 = _700 * _708;
    float _728 = -_700;
    float _730 = _728 + 1.0;
    int _732 = 0;
    float _734 = _546;
    if (_314)
    {
        float _736 = -_546;
        float _738 = _736 + 1.0;
        _732 = as_type<int>(_738);
    }
    int _740 = _732;
    float _742 = rsqrt(_724);
    float _744 = _722 * _730;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = fma(_392, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = _498 * _744;
    if (!_314)
    {
        _586 = _546;
    }
    float _754 = _586;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _460);
    float _758 = _754;
    if (_314)
    {
        float _760 = _524 ? as_type<float>(_740) : _546;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _766 = _454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = _756 * _560;
    float _770 = _560 * _608;
    float _772 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _752);
    float _774 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _682 * _742;
    float _778 = _676 * _742;
    float _780 = _670 * _742;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    float _784 = _632 * _776;
    float _786 = _636 * _778;
    float _788 = _634 * _780;
    float _790 = -_764;
    float _792 = fma(_766, 2.0, _790);
    float _794 = -_784;
    float _796 = fma(_634, _778, _794);
    float _798 = _782 * _598;
    float _800 = -_788;
    float _802 = fma(_636, _776, _800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _806 = _768 * _796;
    float _808 = -_786;
    float _810 = fma(_632, _780, _808);
    float _812 = _768 * _802;
    float _814 = _804 * _774;
    float _816 = fma(_798, _780, _806);
    float _818 = _768 * _810;
    float _820 = fma(_798, _778, _812);
    float _822 = fma(_814, _636, _816);
    float _824 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _828 = fma(_798, _776, _818);
    float _830 = fma(_814, _632, _820);
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _834 = fma(_824, -2.0, _826);
    float _836 = fma(_814, _634, _828);
    float _838 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _840 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].z, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _838);
    float _846 = _774 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _848 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _842);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _854 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _844);
    float _856 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _858 = _850 * _846;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _862 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _852);
    float _864 = fma(_750, _726, _772);
    float _866 = -_84;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[81].x, _792);
    float _870 = _598 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _872 = _856 * _770;
    float _874 = _858 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _876 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _710);
    float _878 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _880 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _834);
    float _882 = _854 * _870;
    float _884 = _858 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].y, _874);
    float _888 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _890 = 0;
    if (_318)
    {
        float _892 = -_546;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].y, _884);
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _886);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _904 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _500 + _900;
    float _910 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _914 = _432 + _906;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _908 + _916;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _922 = _914;
    float _924 = _908;
    if (_318)
    {
        float _926 = _492 ? as_type<float>(_896) : _546;
        _734 = _926;
    }
    float _928 = _734;
    float _930 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _912);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _914 + _932;
    float _936 = _918 * _918;
    float _938 = 1.0 / _920;
    float _940 = fma(_904, _928, -0.5);
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].z, _930);
    float _944 = fma(_934, _934, _936);
    float _946 = fma(_528, _702, _864);
    float _948 = _470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = _762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_944);
    float _956 = _950 + _920;
    float _958 = -_880;
    float _960 = fma(_878, _612, _958);
    float _962 = fma(_532, _688, _946);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _966 = _282 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _970 = _282 + _968;
    float _972 = _858 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _976 = _956 * _938;
    float _978 = _976 * 0.5;
    float _980 = fma(_876, _940, _868);
    float _982 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].y, _972);
    float _984 = fma(_456, _966, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    float _990 = _980 + 0.5;
    float _992 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _996 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _998 = fma(_504, _970, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1000 = _426 + _992;
    float _1002 = fma(_984, _626, _962);
    bool _1004 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1006 = isnan(0.5);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1012 = _1008 || _1010;
    bool _1014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1022 = _1018 || _1020;
    float _1024 = 1.0 / _988;
    float _1026 = _952 * _974;
    float _1028 = _960 + 0.5;
    float _1030 = fma(_998, _610, _1002);
    float _1032 = _948 * _994;
    out.m_53.x = _1026;
    out.m_53.y = _1032;
    out.m_53.z = _990;
    out.m_53.w = _1028;
    float _1034 = _1032;
    float _1036 = _990;
    float _1038 = _1026;
    float _1040 = _934;
    if (!_996)
    {
        _1034 = _1000;
    }
    float _1042 = _1034;
    bool _1044 = !_996;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _954 + _1050;
        float _1054 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = rsqrt(_944);
        float _1058 = _1052 * _1048;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1056 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_934, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_918, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1000, _1068, _1080);
        _922 = _1076;
        _924 = _1078;
        _1036 = _1080;
        _1046 = _1082;
        _1038 = _1070;
    }
    float _1084 = _922;
    float _1086 = _924;
    float _1088 = _1036;
    float _1090 = _1046;
    float _1092 = _1038;
    float _1094 = _1092;
    float _1096 = _1088;
    float _1098 = _1090;
    if (_1012)
    {
        _1094 = _1084;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (_1012)
    {
        _1096 = _1086;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    if (!_1012)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _426 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _432 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_426;
        float _1120 = _1118 + _1090;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _500 + _1124;
        float _1128 = -_500;
        float _1130 = _1128 + _1086;
        float _1132 = fma(_1114, _1114, _1122);
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1136 = fma(_1126, _1126, _1132);
        float _1138 = sqrt(_1136);
        float _1140 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1142 = precise::min(_1138, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1144 = _1142 * _1134;
        float _1146 = -_432;
        float _1148 = _1146 + _1084;
        float _1150 = _1140 * _1144;
        float _1152 = fma(_1148, _1150, _432);
        float _1154 = fma(_1120, _1150, _426);
        float _1156 = fma(_1130, _1150, _500);
        _1098 = _1154;
        _1102 = _1152;
        _1106 = _1156;
        _1040 = _1150;
    }
    float _1158 = _1098;
    float _1160 = _1102;
    float _1162 = _1106;
    float _1164 = _1040;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1030);
    float _1172 = _1164;
    if (_1022)
    {
        _438 = 1.0;
    }
    float _1174 = _438;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1178 = _1174;
    if (_1022)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1190 = _1024 * _1188;
    float _1192 = _1180;
    if (!_1022)
    {
        float _1194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1194 * 0.15915493667125701904296875;
        float _1198 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = _1196 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1198 * 0.15915493667125701904296875;
        float _1210 = _1196 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = 1.0 / _1206;
        float _1216 = _1208 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1212 * _1214;
        float _1222 = _1208 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = 1.0 / _1202;
        float _1230 = 1.0 / _1226;
        float _1232 = _1224 * _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1236 = fma(_1190, _1232, _1234);
        float _1238 = _1236 * _1228;
        float _1240 = precise::clamp(_1238, 0.0, 1.0);
        _1178 = _1240;
    }
    float _1242 = _1178;
    if (!_1022)
    {
        float _1244 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1254;
        float _1262 = _1250 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1250 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1286 = fma(_1190, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        float _1292 = -_1290;
        float _1294 = _1292 + 1.0;
        _1192 = _1294;
    }
    float _1296 = _1192;
    float _1298 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1300 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1302 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1304 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1306 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1298);
    float _1308 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1312 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1314 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1304);
    bool _1318 = _1242 > 0.0;
    bool _1320 = isnan(_1242);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1310);
    float _1330 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1312);
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1338 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1340 = _1242 * _1296;
    bool _1342 = _1296 <= 0.0;
    bool _1344 = !_1326;
    bool _1346 = _1342 || _1344;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1356 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1360 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1364 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1348);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1364 + _1372;
    float _1382 = _1368 + _1372;
    float _1384 = _1372 * 0.5;
    float _1386 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = _1380 * 0.5;
    float _1394 = _1382 * 0.5;
    float _1396 = fma(_1360, -0.5, _1384);
    out.m_55.x = _1374;
    out.m_55.y = _1386;
    out.m_55.z = _1378;
    out.m_55.w = _1388;
    out.m_57.x = _1160;
    out.m_57.y = _1158;
    out.m_57.z = _1162;
    out.m_37.x = _1390;
    out.gl_Position.x = _1364;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _1368;
    out.gl_Position.w = _1372;
    out.m_59.x = _1392;
    out.m_59.y = _1396;
    out.m_59.z = _1394;
    out.m_59.w = _1372;
    if (!_1346)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1398;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    float _94 = _75;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1466 = as_type<float>(_102);
        out.gl_Position.z = _1466;
    }
    if (!_88)
    {
        return out;
    }
    bool _106 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_75);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = in.m_39.x;
    float _118 = float(_80);
    float _120 = in.m_39.y;
    bool _122 = _84 >= _118;
    bool _124 = !_114;
    bool _126 = _122 || _124;
    if (_126)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _92;
    if (_126)
    {
        out.m_37.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _104 = as_type<int>(_130);
    }
    int _132 = _104;
    out.m_41.x = _116;
    out.m_41.y = _120;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_132);
        out.gl_Position.z = _1529;
    }
    if (_126)
    {
        return out;
    }
    float _134 = in.m_43.y;
    float _136 = 1.0 / _118;
    float _138 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_45.w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_32.x;
    float _154 = in.m_32.y;
    float _156 = in.m_32.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = _138;
    if (!_150)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _94 = _168;
    }
    float _170 = _94;
    float _172 = _170;
    if (!_150)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_47.y = _134;
    bool _178 = !_150;
    float _180 = _176;
    float _182 = _134;
    if (!_178)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _138 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _138);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _212;
    }
    float _214 = _180;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _164 = _236;
    }
    float _238 = _164;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = _84 * _136;
    float _256 = fma(_248, _140, _158);
    float _258 = fma(_250, _140, _160);
    float _260 = fma(_252, _140, _162);
    bool _262 = !_240;
    float _264 = _254;
    float _266 = _260;
    if (!_262)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _270 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = in.m_39.w;
    float _286 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = in.m_45.x;
    float _290 = in.m_45.y;
    float _292 = in.m_45.z;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _300 = _298 != 0;
    float _302 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _304 = 1.0 / _296;
    float _306 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _318 = _316 != 0;
    float _320 = 1.0 / _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    float _334 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _336 = _284 > 0.5;
    float _338 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _342 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _344 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _352 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _344);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = 1.0 / _350;
    float _362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = 1.0 / _356;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _382 = 0.0;
    bool _384 = _328;
    if (_318)
    {
        float _386 = in.m_39.z;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _366 * _304;
    float _392 = _370 * _320;
    float _394 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = 1.0 / _358;
    out.m_51.x = _394;
    out.m_51.y = _396;
    out.m_51.z = _398;
    float _414 = _408 * _360;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _420 = _120 > 0.5;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = _362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _410;
    float _430 = _424 * _346;
    float _432 = _372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _436 = _420;
    float _438 = _432;
    if (!_300)
    {
        _266 = _120;
    }
    float _440 = _266;
    float _442 = -_134;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _446;
    float _450 = 1.0 / _418;
    float _452 = _440;
    if (_300)
    {
        _452 = _116;
    }
    float _454 = _452;
    float _456 = _448 * _376;
    int _458 = _420 ? as_type<int>(_444) : as_type<int>(_134);
    float _460 = _412 * _402;
    float _462 = _376;
    if (!_300)
    {
        float _464 = in.m_39.z;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _352);
    float _470 = _328 ? as_type<float>(_458) : _134;
    float _472 = _428 * _404;
    if (_332)
    {
        float _474 = _336 ? _444 : _134;
        _182 = _474;
    }
    float _476 = _182;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _282 + _482;
    float _486 = -_426;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_318)
    {
        bool _490 = _388 > 0.5;
        _384 = _490;
    }
    bool _492 = _384;
    float _494 = -_432;
    float _496 = _494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = fma(_390, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _502 = _488 * _488;
    float _504 = _480 * _450;
    float _506 = 1.0 / _434;
    float _508 = -_500;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = fma(_496, _496, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _282 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _520 = _282 + _518;
    if (_314)
    {
        bool _522 = _116 > 0.5;
        _436 = _522;
    }
    bool _524 = _436;
    float _526 = fma(_510, _510, _512);
    float _528 = fma(_430, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _532 = fma(_414, _520, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _534 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _536 = isnan(_282);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = in.m_43.x;
    bool _548 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _550 = isnan(_282);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _562 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _564 = isnan(_282);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _282 + _574;
    float _578 = rsqrt(_526);
    float _580 = _506 * _400;
    float _582 = _506;
    float _584 = _466;
    float _586 = _576;
    if (!_300)
    {
        _582 = _466;
    }
    float _588 = _582;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    float _594 = _588;
    if (_300)
    {
        _594 = _120;
    }
    float _596 = _594;
    float _598 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_300)
    {
        _584 = _120;
    }
    float _600 = _584;
    float _602 = -_544;
    float _604 = _602 + 1.0;
    float _606 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = rsqrt(_468);
    float _610 = _558 * _604;
    float _612 = fma(_606, _476, -0.5);
    bool _614 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_282);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _572 * _592;
    float _628 = -_572;
    float _630 = _628 + 1.0;
    float _632 = _496 * _578;
    float _634 = _510 * _578;
    float _636 = _488 * _578;
    bool _638 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_282);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = _632 * _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _656 = _634 * _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _660 = _636 * _658;
    float _662 = -_624;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _668 = -_652;
    float _670 = fma(_634, _666, _668);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = -_656;
    float _676 = fma(_636, _672, _674);
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _680 = -_660;
    float _682 = fma(_632, _678, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = _670 * _670;
    float _688 = _624 * _630;
    bool _690 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = isnan(_282);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _648 * _664;
    float _704 = fma(_676, _676, _686);
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    bool _712 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_282);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = fma(_682, _682, _704);
    float _726 = _700 * _708;
    float _728 = -_700;
    float _730 = _728 + 1.0;
    int _732 = 0;
    float _734 = _546;
    if (_314)
    {
        float _736 = -_546;
        float _738 = _736 + 1.0;
        _732 = as_type<int>(_738);
    }
    int _740 = _732;
    float _742 = rsqrt(_724);
    float _744 = _722 * _730;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = fma(_392, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = _498 * _744;
    if (!_314)
    {
        _586 = _546;
    }
    float _754 = _586;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _460);
    float _758 = _754;
    if (_314)
    {
        float _760 = _524 ? as_type<float>(_740) : _546;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _766 = _454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = _756 * _560;
    float _770 = _560 * _608;
    float _772 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _752);
    float _774 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _682 * _742;
    float _778 = _676 * _742;
    float _780 = _670 * _742;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    float _784 = _632 * _776;
    float _786 = _636 * _778;
    float _788 = _634 * _780;
    float _790 = -_764;
    float _792 = fma(_766, 2.0, _790);
    float _794 = -_784;
    float _796 = fma(_634, _778, _794);
    float _798 = _782 * _598;
    float _800 = -_788;
    float _802 = fma(_636, _776, _800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _806 = _768 * _796;
    float _808 = -_786;
    float _810 = fma(_632, _780, _808);
    float _812 = _768 * _802;
    float _814 = _804 * _774;
    float _816 = fma(_798, _780, _806);
    float _818 = _768 * _810;
    float _820 = fma(_798, _778, _812);
    float _822 = fma(_814, _636, _816);
    float _824 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _828 = fma(_798, _776, _818);
    float _830 = fma(_814, _632, _820);
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _834 = fma(_824, -2.0, _826);
    float _836 = fma(_814, _634, _828);
    float _838 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _840 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].z, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _838);
    float _846 = _774 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _848 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _842);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _854 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _844);
    float _856 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _858 = _850 * _846;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _862 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _852);
    float _864 = fma(_750, _726, _772);
    float _866 = -_84;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[81].x, _792);
    float _870 = _598 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _872 = _856 * _770;
    float _874 = _858 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _876 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _710);
    float _878 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _880 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _834);
    float _882 = _854 * _870;
    float _884 = _858 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].y, _874);
    float _888 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _890 = 0;
    if (_318)
    {
        float _892 = -_546;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].y, _884);
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _886);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _904 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _500 + _900;
    float _910 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _914 = _432 + _906;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _908 + _916;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _922 = _914;
    float _924 = _908;
    if (_318)
    {
        float _926 = _492 ? as_type<float>(_896) : _546;
        _734 = _926;
    }
    float _928 = _734;
    float _930 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _912);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _914 + _932;
    float _936 = _918 * _918;
    float _938 = 1.0 / _920;
    float _940 = fma(_904, _928, -0.5);
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].z, _930);
    float _944 = fma(_934, _934, _936);
    float _946 = fma(_528, _702, _864);
    float _948 = _470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = _762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_944);
    float _956 = _950 + _920;
    float _958 = -_880;
    float _960 = fma(_878, _612, _958);
    float _962 = fma(_532, _688, _946);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _966 = _282 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _970 = _282 + _968;
    float _972 = _858 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _976 = _956 * _938;
    float _978 = _976 * 0.5;
    float _980 = fma(_876, _940, _868);
    float _982 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].y, _972);
    float _984 = fma(_456, _966, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    float _990 = _980 + 0.5;
    float _992 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _996 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _998 = fma(_504, _970, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1000 = _426 + _992;
    float _1002 = fma(_984, _626, _962);
    bool _1004 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1006 = isnan(0.5);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1012 = _1008 || _1010;
    bool _1014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1022 = _1018 || _1020;
    float _1024 = 1.0 / _988;
    float _1026 = _952 * _974;
    float _1028 = _960 + 0.5;
    float _1030 = fma(_998, _610, _1002);
    float _1032 = _948 * _994;
    out.m_53.x = _1026;
    out.m_53.y = _1032;
    out.m_53.z = _990;
    out.m_53.w = _1028;
    float _1034 = _1032;
    float _1036 = _990;
    float _1038 = _1026;
    float _1040 = _934;
    if (!_996)
    {
        _1034 = _1000;
    }
    float _1042 = _1034;
    bool _1044 = !_996;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _954 + _1050;
        float _1054 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = rsqrt(_944);
        float _1058 = _1052 * _1048;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1056 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_934, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_918, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1000, _1068, _1080);
        _922 = _1076;
        _924 = _1078;
        _1036 = _1080;
        _1046 = _1082;
        _1038 = _1070;
    }
    float _1084 = _922;
    float _1086 = _924;
    float _1088 = _1036;
    float _1090 = _1046;
    float _1092 = _1038;
    float _1094 = _1092;
    float _1096 = _1088;
    float _1098 = _1090;
    if (_1012)
    {
        _1094 = _1084;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (_1012)
    {
        _1096 = _1086;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    if (!_1012)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _426 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _432 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_426;
        float _1120 = _1118 + _1090;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _500 + _1124;
        float _1128 = -_500;
        float _1130 = _1128 + _1086;
        float _1132 = fma(_1114, _1114, _1122);
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1136 = fma(_1126, _1126, _1132);
        float _1138 = sqrt(_1136);
        float _1140 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1142 = precise::min(_1138, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1144 = _1142 * _1134;
        float _1146 = -_432;
        float _1148 = _1146 + _1084;
        float _1150 = _1140 * _1144;
        float _1152 = fma(_1148, _1150, _432);
        float _1154 = fma(_1120, _1150, _426);
        float _1156 = fma(_1130, _1150, _500);
        _1098 = _1154;
        _1102 = _1152;
        _1106 = _1156;
        _1040 = _1150;
    }
    float _1158 = _1098;
    float _1160 = _1102;
    float _1162 = _1106;
    float _1164 = _1040;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1030);
    float _1172 = _1164;
    if (_1022)
    {
        _438 = 1.0;
    }
    float _1174 = _438;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1178 = _1174;
    if (_1022)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1190 = _1024 * _1188;
    float _1192 = _1180;
    if (!_1022)
    {
        float _1194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1194 * 0.15915493667125701904296875;
        float _1198 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = _1196 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1198 * 0.15915493667125701904296875;
        float _1210 = _1196 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = 1.0 / _1206;
        float _1216 = _1208 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1212 * _1214;
        float _1222 = _1208 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = 1.0 / _1202;
        float _1230 = 1.0 / _1226;
        float _1232 = _1224 * _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1236 = fma(_1190, _1232, _1234);
        float _1238 = _1236 * _1228;
        float _1240 = precise::clamp(_1238, 0.0, 1.0);
        _1178 = _1240;
    }
    float _1242 = _1178;
    if (!_1022)
    {
        float _1244 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1254;
        float _1262 = _1250 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1250 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1286 = fma(_1190, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        float _1292 = -_1290;
        float _1294 = _1292 + 1.0;
        _1192 = _1294;
    }
    float _1296 = _1192;
    float _1298 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1300 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1302 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1304 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1306 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1298);
    float _1308 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1312 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1314 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1304);
    bool _1318 = _1242 > 0.0;
    bool _1320 = isnan(_1242);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1310);
    float _1330 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1312);
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1338 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1340 = _1242 * _1296;
    bool _1342 = _1296 <= 0.0;
    bool _1344 = !_1326;
    bool _1346 = _1342 || _1344;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1356 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1360 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1364 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1348);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1364 + _1372;
    float _1382 = _1368 + _1372;
    float _1384 = _1372 * 0.5;
    float _1386 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = _1380 * 0.5;
    float _1394 = _1382 * 0.5;
    float _1396 = fma(_1360, -0.5, _1384);
    out.m_55.x = _1374;
    out.m_55.y = _1386;
    out.m_55.z = _1378;
    out.m_55.w = _1388;
    out.m_57.x = _1160;
    out.m_57.y = _1158;
    out.m_57.z = _1162;
    out.m_37.x = _1390;
    out.gl_Position.x = _1364;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _1368;
    out.gl_Position.w = _1372;
    out.m_59.x = _1392;
    out.m_59.y = _1396;
    out.m_59.z = _1394;
    out.m_59.w = _1372;
    if (!_1346)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1398;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    float _94 = _75;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1466 = as_type<float>(_102);
        out.gl_Position.z = _1466;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _106 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_75);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = in.m_39.x;
    float _118 = float(_80);
    float _120 = in.m_39.y;
    bool _122 = _84 >= _118;
    bool _124 = !_114;
    bool _126 = _122 || _124;
    if (_126)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _92;
    if (_126)
    {
        out.m_37.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _104 = as_type<int>(_130);
    }
    int _132 = _104;
    out.m_41.x = _116;
    out.m_41.y = _120;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1529 = as_type<float>(_132);
        out.gl_Position.z = _1529;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_43.y;
    float _136 = 1.0 / _118;
    float _138 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_45.w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_32.x;
    float _154 = in.m_32.y;
    float _156 = in.m_32.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    float _164 = _138;
    if (!_150)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _94 = _168;
    }
    float _170 = _94;
    float _172 = _170;
    if (!_150)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_47.y = _134;
    bool _178 = !_150;
    float _180 = _176;
    float _182 = _134;
    if (!_178)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _138 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _138);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _212;
    }
    float _214 = _180;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _164 = _236;
    }
    float _238 = _164;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = _84 * _136;
    float _256 = fma(_248, _140, _158);
    float _258 = fma(_250, _140, _160);
    float _260 = fma(_252, _140, _162);
    bool _262 = !_240;
    float _264 = _254;
    float _266 = _260;
    if (!_262)
    {
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _270 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = in.m_39.w;
    float _286 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = in.m_45.x;
    float _290 = in.m_45.y;
    float _292 = in.m_45.z;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _300 = _298 != 0;
    float _302 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _304 = 1.0 / _296;
    float _306 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _302);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _318 = _316 != 0;
    float _320 = 1.0 / _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    float _334 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _336 = _284 > 0.5;
    float _338 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _342 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _344 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _346 = 1.0 / _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _352 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _344);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = 1.0 / _350;
    float _362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = 1.0 / _356;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _382 = 0.0;
    bool _384 = _328;
    if (_318)
    {
        float _386 = in.m_39.z;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _366 * _304;
    float _392 = _370 * _320;
    float _394 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = in.m_49.x;
    float _402 = in.m_49.y;
    float _404 = in.m_49.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = 1.0 / _358;
    out.m_51.x = _394;
    out.m_51.y = _396;
    out.m_51.z = _398;
    float _414 = _408 * _360;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _420 = _120 > 0.5;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = _362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _410;
    float _430 = _424 * _346;
    float _432 = _372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _434 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _436 = _420;
    float _438 = _432;
    if (!_300)
    {
        _266 = _120;
    }
    float _440 = _266;
    float _442 = -_134;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _446;
    float _450 = 1.0 / _418;
    float _452 = _440;
    if (_300)
    {
        _452 = _116;
    }
    float _454 = _452;
    float _456 = _448 * _376;
    int _458 = _420 ? as_type<int>(_444) : as_type<int>(_134);
    float _460 = _412 * _402;
    float _462 = _376;
    if (!_300)
    {
        float _464 = in.m_39.z;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _352);
    float _470 = _328 ? as_type<float>(_458) : _134;
    float _472 = _428 * _404;
    if (_332)
    {
        float _474 = _336 ? _444 : _134;
        _182 = _474;
    }
    float _476 = _182;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _282 + _482;
    float _486 = -_426;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_318)
    {
        bool _490 = _388 > 0.5;
        _384 = _490;
    }
    bool _492 = _384;
    float _494 = -_432;
    float _496 = _494 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = fma(_390, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _502 = _488 * _488;
    float _504 = _480 * _450;
    float _506 = 1.0 / _434;
    float _508 = -_500;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = fma(_496, _496, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _282 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _520 = _282 + _518;
    if (_314)
    {
        bool _522 = _116 > 0.5;
        _436 = _522;
    }
    bool _524 = _436;
    float _526 = fma(_510, _510, _512);
    float _528 = fma(_430, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _532 = fma(_414, _520, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _534 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _536 = isnan(_282);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = in.m_43.x;
    bool _548 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _550 = isnan(_282);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _562 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _564 = isnan(_282);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _282 + _574;
    float _578 = rsqrt(_526);
    float _580 = _506 * _400;
    float _582 = _506;
    float _584 = _466;
    float _586 = _576;
    if (!_300)
    {
        _582 = _466;
    }
    float _588 = _582;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    float _594 = _588;
    if (_300)
    {
        _594 = _120;
    }
    float _596 = _594;
    float _598 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_300)
    {
        _584 = _120;
    }
    float _600 = _584;
    float _602 = -_544;
    float _604 = _602 + 1.0;
    float _606 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = rsqrt(_468);
    float _610 = _558 * _604;
    float _612 = fma(_606, _476, -0.5);
    bool _614 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_282);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _572 * _592;
    float _628 = -_572;
    float _630 = _628 + 1.0;
    float _632 = _496 * _578;
    float _634 = _510 * _578;
    float _636 = _488 * _578;
    bool _638 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_282);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = _632 * _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _656 = _634 * _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _660 = _636 * _658;
    float _662 = -_624;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _668 = -_652;
    float _670 = fma(_634, _666, _668);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = -_656;
    float _676 = fma(_636, _672, _674);
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _680 = -_660;
    float _682 = fma(_632, _678, _680);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _686 = _670 * _670;
    float _688 = _624 * _630;
    bool _690 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = isnan(_282);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _648 * _664;
    float _704 = fma(_676, _676, _686);
    float _706 = -_648;
    float _708 = _706 + 1.0;
    float _710 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _684);
    bool _712 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_282);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = fma(_682, _682, _704);
    float _726 = _700 * _708;
    float _728 = -_700;
    float _730 = _728 + 1.0;
    int _732 = 0;
    float _734 = _546;
    if (_314)
    {
        float _736 = -_546;
        float _738 = _736 + 1.0;
        _732 = as_type<int>(_738);
    }
    int _740 = _732;
    float _742 = rsqrt(_724);
    float _744 = _722 * _730;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = fma(_392, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = _498 * _744;
    if (!_314)
    {
        _586 = _546;
    }
    float _754 = _586;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _460);
    float _758 = _754;
    if (_314)
    {
        float _760 = _524 ? as_type<float>(_740) : _546;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _766 = _454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = _756 * _560;
    float _770 = _560 * _608;
    float _772 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _752);
    float _774 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _682 * _742;
    float _778 = _676 * _742;
    float _780 = _670 * _742;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    float _784 = _632 * _776;
    float _786 = _636 * _778;
    float _788 = _634 * _780;
    float _790 = -_764;
    float _792 = fma(_766, 2.0, _790);
    float _794 = -_784;
    float _796 = fma(_634, _778, _794);
    float _798 = _782 * _598;
    float _800 = -_788;
    float _802 = fma(_636, _776, _800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _472);
    float _806 = _768 * _796;
    float _808 = -_786;
    float _810 = fma(_632, _780, _808);
    float _812 = _768 * _802;
    float _814 = _804 * _774;
    float _816 = fma(_798, _780, _806);
    float _818 = _768 * _810;
    float _820 = fma(_798, _778, _812);
    float _822 = fma(_814, _636, _816);
    float _824 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _828 = fma(_798, _776, _818);
    float _830 = fma(_814, _632, _820);
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _834 = fma(_824, -2.0, _826);
    float _836 = fma(_814, _634, _828);
    float _838 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _840 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].z, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].x, _838);
    float _846 = _774 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _848 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _842);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _854 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _844);
    float _856 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].y, _848);
    float _858 = _850 * _846;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _862 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _852);
    float _864 = fma(_750, _726, _772);
    float _866 = -_84;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[81].x, _792);
    float _870 = _598 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _872 = _856 * _770;
    float _874 = _858 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _876 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _710);
    float _878 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _880 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _834);
    float _882 = _854 * _870;
    float _884 = _858 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].y, _874);
    float _888 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _890 = 0;
    if (_318)
    {
        float _892 = -_546;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].y, _884);
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[10].x, _886);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _904 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _906 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _500 + _900;
    float _910 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _914 = _432 + _906;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _908 + _916;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _922 = _914;
    float _924 = _908;
    if (_318)
    {
        float _926 = _492 ? as_type<float>(_896) : _546;
        _734 = _926;
    }
    float _928 = _734;
    float _930 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[10].x, _912);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _914 + _932;
    float _936 = _918 * _918;
    float _938 = 1.0 / _920;
    float _940 = fma(_904, _928, -0.5);
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].z, _930);
    float _944 = fma(_934, _934, _936);
    float _946 = fma(_528, _702, _864);
    float _948 = _470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = _762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_944);
    float _956 = _950 + _920;
    float _958 = -_880;
    float _960 = fma(_878, _612, _958);
    float _962 = fma(_532, _688, _946);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _966 = _282 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _970 = _282 + _968;
    float _972 = _858 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _976 = _956 * _938;
    float _978 = _976 * 0.5;
    float _980 = fma(_876, _940, _868);
    float _982 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].y, _972);
    float _984 = fma(_456, _966, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    float _990 = _980 + 0.5;
    float _992 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _996 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _998 = fma(_504, _970, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1000 = _426 + _992;
    float _1002 = fma(_984, _626, _962);
    bool _1004 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1006 = isnan(0.5);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1012 = _1008 || _1010;
    bool _1014 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1022 = _1018 || _1020;
    float _1024 = 1.0 / _988;
    float _1026 = _952 * _974;
    float _1028 = _960 + 0.5;
    float _1030 = fma(_998, _610, _1002);
    float _1032 = _948 * _994;
    out.m_53.x = _1026;
    out.m_53.y = _1032;
    out.m_53.z = _990;
    out.m_53.w = _1028;
    float _1034 = _1032;
    float _1036 = _990;
    float _1038 = _1026;
    float _1040 = _934;
    if (!_996)
    {
        _1034 = _1000;
    }
    float _1042 = _1034;
    bool _1044 = !_996;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _954 + _1050;
        float _1054 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = rsqrt(_944);
        float _1058 = _1052 * _1048;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1056 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_934, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_918, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1000, _1068, _1080);
        _922 = _1076;
        _924 = _1078;
        _1036 = _1080;
        _1046 = _1082;
        _1038 = _1070;
    }
    float _1084 = _922;
    float _1086 = _924;
    float _1088 = _1036;
    float _1090 = _1046;
    float _1092 = _1038;
    float _1094 = _1092;
    float _1096 = _1088;
    float _1098 = _1090;
    if (_1012)
    {
        _1094 = _1084;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (_1012)
    {
        _1096 = _1086;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    if (!_1012)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _426 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _432 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_426;
        float _1120 = _1118 + _1090;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _500 + _1124;
        float _1128 = -_500;
        float _1130 = _1128 + _1086;
        float _1132 = fma(_1114, _1114, _1122);
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1136 = fma(_1126, _1126, _1132);
        float _1138 = sqrt(_1136);
        float _1140 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1142 = precise::min(_1138, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1144 = _1142 * _1134;
        float _1146 = -_432;
        float _1148 = _1146 + _1084;
        float _1150 = _1140 * _1144;
        float _1152 = fma(_1148, _1150, _432);
        float _1154 = fma(_1120, _1150, _426);
        float _1156 = fma(_1130, _1150, _500);
        _1098 = _1154;
        _1102 = _1152;
        _1106 = _1156;
        _1040 = _1150;
    }
    float _1158 = _1098;
    float _1160 = _1102;
    float _1162 = _1106;
    float _1164 = _1040;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1030);
    float _1172 = _1164;
    if (_1022)
    {
        _438 = 1.0;
    }
    float _1174 = _438;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1178 = _1174;
    if (_1022)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1176);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1190 = _1024 * _1188;
    float _1192 = _1180;
    if (!_1022)
    {
        float _1194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1194 * 0.15915493667125701904296875;
        float _1198 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = _1196 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1198 * 0.15915493667125701904296875;
        float _1210 = _1196 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = 1.0 / _1206;
        float _1216 = _1208 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1212 * _1214;
        float _1222 = _1208 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = 1.0 / _1202;
        float _1230 = 1.0 / _1226;
        float _1232 = _1224 * _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1236 = fma(_1190, _1232, _1234);
        float _1238 = _1236 * _1228;
        float _1240 = precise::clamp(_1238, 0.0, 1.0);
        _1178 = _1240;
    }
    float _1242 = _1178;
    if (!_1022)
    {
        float _1244 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1254;
        float _1262 = _1250 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1250 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1286 = fma(_1190, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        float _1292 = -_1290;
        float _1294 = _1292 + 1.0;
        _1192 = _1294;
    }
    float _1296 = _1192;
    float _1298 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1300 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1302 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1304 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1306 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1298);
    float _1308 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1312 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1314 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1304);
    bool _1318 = _1242 > 0.0;
    bool _1320 = isnan(_1242);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1310);
    float _1330 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1332 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1334 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1312);
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1338 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1340 = _1242 * _1296;
    bool _1342 = _1296 <= 0.0;
    bool _1344 = !_1326;
    bool _1346 = _1342 || _1344;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1350 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1332);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1334);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1356 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1360 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1364 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1348);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1358);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1364 + _1372;
    float _1382 = _1368 + _1372;
    float _1384 = _1372 * 0.5;
    float _1386 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = _1380 * 0.5;
    float _1394 = _1382 * 0.5;
    float _1396 = fma(_1360, -0.5, _1384);
    out.m_55.x = _1374;
    out.m_55.y = _1386;
    out.m_55.z = _1378;
    out.m_55.w = _1388;
    out.m_57.x = _1160;
    out.m_57.y = _1158;
    out.m_57.z = _1162;
    out.m_37.x = _1390;
    out.gl_Position.x = _1364;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _1368;
    out.gl_Position.w = _1372;
    out.m_59.x = _1392;
    out.m_59.y = _1396;
    out.m_59.z = _1394;
    out.m_59.w = _1372;
    if (!_1346)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1398;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

