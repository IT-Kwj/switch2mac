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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
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
        float _1482 = as_type<float>(_102);
        out.gl_Position.z = _1482;
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
        float _1545 = as_type<float>(_132);
        out.gl_Position.z = _1545;
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
    if (!_262)
    {
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _268 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _264 = _278;
    }
    float _280 = _264;
    float _282 = in.m_39.w;
    float _284 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = in.m_43.x;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _290 = _288 != 0;
    float _292 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _296 = _294 != 0;
    float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    float _312 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _314 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _318 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _314);
    float _322 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _324 = _282 > 0.5;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    float _330 = in.m_49.x;
    float _332 = in.m_49.y;
    float _334 = in.m_49.z;
    float _336 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _344 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _340;
    float _348 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _320);
    float _350 = 0.0;
    bool _352 = _306;
    float _354 = _286;
    if (_302)
    {
        float _356 = in.m_39.z;
        _350 = _356;
    }
    float _358 = _350;
    float _360 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _362 = rsqrt(_342);
    float _364 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _378 = rsqrt(_364);
    float _380 = in.m_45.x;
    float _382 = in.m_45.y;
    float _384 = in.m_45.z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _396 = rsqrt(_348);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _402 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _410 = _400 * _346;
    float _412 = _362 * _330;
    float _414 = 1.0 / _368;
    float _416 = _378 * _334;
    float _418 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    out.m_51.x = _390;
    out.m_51.y = _402;
    out.m_51.z = _404;
    bool _424 = _120 > 0.5;
    float _426 = _418 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _372;
    float _430 = _396 * _332;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _434 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_280);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = 1.0 / _422;
    float _450 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _452 = _292;
    bool _454 = _424;
    int _456 = as_type<int>(_376);
    if (!_290)
    {
        float _458 = in.m_39.z;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _464 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _466;
    float _470 = 1.0 / _394;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _472;
    float _476 = _464 * _396;
    float _478 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _482 = 1.0 / _408;
    float _484 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _496 = _488 * _428;
    float _498 = _492 * _414;
    float _500 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = -_426;
    float _504 = _502 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _510 = _474 * _448;
    float _512 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _514 = -_500;
    float _516 = _514 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _504 * _504;
    float _520 = -_134;
    float _522 = _520 + 1.0;
    float _524 = -_512;
    float _526 = _524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _528 = _508 * _482;
    float _530 = fma(_516, _516, _518);
    float _532 = _468 * _470;
    int _534 = _424 ? as_type<int>(_522) : as_type<int>(_134);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _280 + _536;
    float _540 = fma(_526, _526, _530);
    float _542 = _482;
    float _544 = _530;
    float _546 = _460;
    float _548 = _510;
    if (!_290)
    {
        _542 = _120;
    }
    float _550 = _542;
    float _552 = _306 ? as_type<float>(_534) : _134;
    float _554 = rsqrt(_540);
    float _556 = _550;
    if (_310)
    {
        float _558 = _324 ? _522 : _134;
        _182 = _558;
    }
    float _560 = _182;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _280 + _562;
    if (_302)
    {
        bool _566 = _358 > 0.5;
        _352 = _566;
    }
    bool _568 = _352;
    float _570 = fma(_496, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _280 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = _280 + _576;
    float _580 = fma(_532, _564, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_296)
    {
        bool _582 = _116 > 0.5;
        _454 = _582;
    }
    bool _584 = _454;
    float _586 = fma(_498, _574, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_290)
    {
        _556 = _116;
    }
    float _588 = _556;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _592 = _280 + _590;
    bool _594 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _596 = isnan(_280);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = fma(_528, _578, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_290)
    {
        _544 = _460;
    }
    float _608 = _544;
    float _610 = fma(_510, _592, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _612 = _608;
    if (_290)
    {
        _612 = _120;
    }
    float _614 = _612;
    float _616 = _504 * _554;
    if (_290)
    {
        _546 = _120;
    }
    float _618 = _546;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    bool _624 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _626 = isnan(_280);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = _516 * _554;
    bool _638 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _640 = isnan(_280);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _526 * _554;
    bool _652 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_280);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _634 * _622;
    float _666 = -_634;
    float _668 = _666 + 1.0;
    float _670 = -_648;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _676 = _650 * _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _680 = _616 * _678;
    float _682 = _648 * _668;
    float _684 = _662 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _688 = _636 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _692 = -_676;
    float _694 = fma(_616, _690, _692);
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_662;
    float _710 = _708 + 1.0;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _714 = -_688;
    float _716 = fma(_650, _712, _714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_680;
    float _722 = fma(_636, _718, _720);
    bool _724 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _726 = isnan(_280);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _706 * _710;
    float _738 = _716 * _716;
    float _740 = -_706;
    float _742 = _740 + 1.0;
    float _744 = fma(_376, _560, -0.5);
    if (_296)
    {
        float _746 = -_286;
        float _748 = _746 + 1.0;
        _456 = as_type<int>(_748);
    }
    int _750 = _456;
    float _752 = fma(_694, _694, _738);
    float _754 = _734 * _742;
    float _756 = -_734;
    float _758 = _756 + 1.0;
    if (!_296)
    {
        _548 = _286;
    }
    float _760 = _548;
    float _762 = fma(_722, _722, _752);
    float _764 = _760;
    if (_296)
    {
        float _766 = _584 ? as_type<float>(_750) : _286;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _444 * _758;
    float _772 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _462);
    float _774 = rsqrt(_762);
    float _776 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _570 * _770;
    float _782 = _614 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _784 = -_480;
    float _786 = fma(_776, 2.0, _784);
    float _788 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    int _790 = as_type<int>(_776);
    if (_302)
    {
        float _792 = -_286;
        float _794 = _792 + 1.0;
        _790 = as_type<int>(_794);
    }
    int _796 = _790;
    float _798 = -_84;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _804 = _280 + _802;
    float _806 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    if (_302)
    {
        float _810 = _568 ? as_type<float>(_796) : _286;
        _354 = _810;
    }
    float _812 = _354;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _416);
    float _818 = _722 * _774;
    float _820 = _694 * _774;
    float _822 = _716 * _774;
    float _824 = _808 * _464;
    float _826 = _636 * _818;
    float _828 = _616 * _820;
    float _830 = _650 * _822;
    float _832 = _814 * _494;
    float _834 = -_826;
    float _836 = fma(_650, _820, _834);
    float _838 = -_828;
    float _840 = fma(_636, _822, _838);
    float _842 = -_830;
    float _844 = fma(_616, _818, _842);
    float _846 = _816 * _478;
    float _848 = _824 * _836;
    float _850 = _824 * _840;
    float _852 = _824 * _844;
    float _854 = -_444;
    float _856 = _854 + 1.0;
    float _858 = fma(_832, _822, _848);
    float _860 = fma(_832, _818, _850);
    float _862 = fma(_832, _820, _852);
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[115].x, _780);
    float _866 = fma(_846, _616, _858);
    float _868 = fma(_846, _650, _860);
    float _870 = fma(_846, _636, _862);
    float _872 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = fma(_410, _804, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _872);
    float _882 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].y, _874);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].y, _884);
    float _894 = fma(_782, -2.0, _886);
    float _896 = _478 * _888;
    float _898 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _890);
    float _900 = _892 * _476;
    float _902 = _500 + _870;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _906 = _494 * _898;
    float _908 = _896 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _512 + _868;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].y, _904);
    float _914 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].y, _908);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _922 = _896 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _926 = fma(_586, _754, _864);
    float _928 = _902 + _920;
    float _930 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _914);
    float _932 = _910 + _924;
    float _934 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _772);
    float _938 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _930);
    float _940 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _932 + _944;
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _788);
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _954 = _928 + _952;
    float _956 = _946 * _946;
    float _958 = 1.0 / _948;
    float _960 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _962 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _964 = fma(_954, _954, _956);
    float _966 = fma(_580, _736, _926);
    float _968 = _768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _972 = sqrt(_964);
    float _974 = fma(_606, _684, _966);
    float _976 = _970 + _948;
    float _978 = fma(_940, _812, -0.5);
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].y, _922);
    float _982 = fma(_610, _682, _974);
    float _984 = -_960;
    float _986 = fma(_950, _744, _984);
    float _988 = fma(_936, _978, _800);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = _976 * _958;
    float _994 = _992 * 0.5;
    float _996 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].x, _980);
    float _998 = _426 + _866;
    float _1000 = _986 + 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1014 = _1010 || _1012;
    float _1016 = _998 + _996;
    bool _1018 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / _1004;
    bool _1022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _806 * _990;
    float _1034 = _968 * _918;
    float _1036 = _988 + 0.5;
    out.m_53.x = _1034;
    out.m_53.y = _1032;
    out.m_53.z = _1036;
    out.m_53.w = _1000;
    float _1038 = fma(_878, _664, _982);
    float _1040 = _982;
    float _1042 = _928;
    float _1044 = _932;
    float _1046 = _964;
    float _1048 = _878;
    float _1050 = _1032;
    float _1052 = _1038;
    if (!_1018)
    {
        _1040 = _1016;
    }
    float _1054 = _1040;
    bool _1056 = !_1018;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _972 + _1062;
        float _1066 = _1016 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_964);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1016, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_954, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_946, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1092;
        _1044 = _1094;
        _1058 = _1088;
        _1046 = _1068;
        _1048 = _1080;
        _1050 = _1090;
    }
    float _1096 = _1042;
    float _1098 = _1044;
    float _1100 = _1058;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1050;
    float _1108 = _1102;
    float _1110 = _1104;
    float _1112 = _1100;
    float _1114 = _1106;
    if (_1014)
    {
        _1108 = _1096;
    }
    float _1116 = _1108;
    float _1118 = _1116;
    if (_1014)
    {
        _1110 = _1098;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1014)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1126 = _426 + _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1130 = _500 + _1128;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = -_426;
        float _1136 = _1134 + _1100;
        float _1138 = _1126 * _1126;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _512 + _1140;
        float _1144 = -_512;
        float _1146 = _1144 + _1098;
        float _1148 = fma(_1130, _1130, _1138);
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1152 = fma(_1142, _1142, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1158 = precise::min(_1154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1160 = _1158 * _1150;
        float _1162 = -_500;
        float _1164 = _1162 + _1096;
        float _1166 = _1156 * _1160;
        float _1168 = fma(_1164, _1166, _500);
        float _1170 = fma(_1136, _1166, _426);
        float _1172 = fma(_1146, _1166, _512);
        _1112 = _1170;
        _1118 = _1168;
        _1122 = _1172;
        _1114 = _1154;
    }
    float _1174 = _1112;
    float _1176 = _1118;
    float _1178 = _1122;
    float _1180 = _1114;
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1038);
    float _1188 = _1180;
    if (_1030)
    {
        _1188 = 1.0;
    }
    float _1190 = _1188;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1194 = _1190;
    if (_1030)
    {
        _1052 = 1.0;
    }
    float _1196 = _1052;
    float _1198 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1206 = _1020 * _1204;
    float _1208 = _1196;
    if (!_1030)
    {
        float _1210 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1216 = _1212 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 0.15915493667125701904296875;
        float _1222 = _1212 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = 1.0 / _1218;
        float _1228 = _1220 * 6.283185482025146484375;
        float _1230 = cos(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = _1220 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1240 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1238;
        float _1242 = _1230 * _1232;
        float _1244 = 1.0 / _1240;
        float _1246 = 1.0 / _1242;
        float _1248 = _1236 * _1246;
        float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1252 = fma(_1206, _1248, _1250);
        float _1254 = _1252 * _1244;
        float _1256 = precise::clamp(_1254, 0.0, 1.0);
        _1194 = _1256;
    }
    float _1258 = _1194;
    if (!_1030)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1264 = _1260 * 0.15915493667125701904296875;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1270;
        float _1278 = _1266 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1266 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1302 = fma(_1206, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        float _1308 = -_1306;
        float _1310 = _1308 + 1.0;
        _1208 = _1310;
    }
    float _1312 = _1208;
    float _1314 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1316 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1200);
    float _1318 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1322 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1330 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1320);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1336 = _1258 > 0.0;
    bool _1338 = isnan(_1258);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1348 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1328);
    float _1352 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1354 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1356 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1358 = _1258 * _1312;
    bool _1360 = _1312 <= 0.0;
    bool _1362 = !_1344;
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1372 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1374 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1378 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1384 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1372);
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1388 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1382 + _1386;
    float _1398 = _1384 + _1386;
    float _1400 = _1386 * 0.5;
    float _1402 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * 0.5;
    float _1410 = _1398 * 0.5;
    float _1412 = fma(_1378, -0.5, _1400);
    out.m_55.x = _1402;
    out.m_55.y = _1404;
    out.m_55.z = _1406;
    out.m_55.w = _1388;
    out.m_57.x = _1176;
    out.m_57.y = _1174;
    out.m_57.z = _1178;
    out.m_37.x = _1390;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_59.x = _1408;
    out.m_59.y = _1412;
    out.m_59.z = _1410;
    out.m_59.w = _1386;
    if (!_1364)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1414;
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
        float _1482 = as_type<float>(_102);
        out.gl_Position.z = _1482;
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
        float _1545 = as_type<float>(_132);
        out.gl_Position.z = _1545;
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
    if (!_262)
    {
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _268 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _264 = _278;
    }
    float _280 = _264;
    float _282 = in.m_39.w;
    float _284 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = in.m_43.x;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _290 = _288 != 0;
    float _292 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _296 = _294 != 0;
    float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    float _312 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _314 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _318 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _314);
    float _322 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _324 = _282 > 0.5;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    float _330 = in.m_49.x;
    float _332 = in.m_49.y;
    float _334 = in.m_49.z;
    float _336 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _344 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _340;
    float _348 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _320);
    float _350 = 0.0;
    bool _352 = _306;
    float _354 = _286;
    if (_302)
    {
        float _356 = in.m_39.z;
        _350 = _356;
    }
    float _358 = _350;
    float _360 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _362 = rsqrt(_342);
    float _364 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _378 = rsqrt(_364);
    float _380 = in.m_45.x;
    float _382 = in.m_45.y;
    float _384 = in.m_45.z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _396 = rsqrt(_348);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _402 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _410 = _400 * _346;
    float _412 = _362 * _330;
    float _414 = 1.0 / _368;
    float _416 = _378 * _334;
    float _418 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    out.m_51.x = _390;
    out.m_51.y = _402;
    out.m_51.z = _404;
    bool _424 = _120 > 0.5;
    float _426 = _418 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _372;
    float _430 = _396 * _332;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _434 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_280);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = 1.0 / _422;
    float _450 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _452 = _292;
    bool _454 = _424;
    int _456 = as_type<int>(_376);
    if (!_290)
    {
        float _458 = in.m_39.z;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _464 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _466;
    float _470 = 1.0 / _394;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _472;
    float _476 = _464 * _396;
    float _478 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _482 = 1.0 / _408;
    float _484 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _496 = _488 * _428;
    float _498 = _492 * _414;
    float _500 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = -_426;
    float _504 = _502 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _510 = _474 * _448;
    float _512 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _514 = -_500;
    float _516 = _514 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _504 * _504;
    float _520 = -_134;
    float _522 = _520 + 1.0;
    float _524 = -_512;
    float _526 = _524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _528 = _508 * _482;
    float _530 = fma(_516, _516, _518);
    float _532 = _468 * _470;
    int _534 = _424 ? as_type<int>(_522) : as_type<int>(_134);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _280 + _536;
    float _540 = fma(_526, _526, _530);
    float _542 = _482;
    float _544 = _530;
    float _546 = _460;
    float _548 = _510;
    if (!_290)
    {
        _542 = _120;
    }
    float _550 = _542;
    float _552 = _306 ? as_type<float>(_534) : _134;
    float _554 = rsqrt(_540);
    float _556 = _550;
    if (_310)
    {
        float _558 = _324 ? _522 : _134;
        _182 = _558;
    }
    float _560 = _182;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _280 + _562;
    if (_302)
    {
        bool _566 = _358 > 0.5;
        _352 = _566;
    }
    bool _568 = _352;
    float _570 = fma(_496, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _280 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = _280 + _576;
    float _580 = fma(_532, _564, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_296)
    {
        bool _582 = _116 > 0.5;
        _454 = _582;
    }
    bool _584 = _454;
    float _586 = fma(_498, _574, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_290)
    {
        _556 = _116;
    }
    float _588 = _556;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _592 = _280 + _590;
    bool _594 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _596 = isnan(_280);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = fma(_528, _578, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_290)
    {
        _544 = _460;
    }
    float _608 = _544;
    float _610 = fma(_510, _592, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _612 = _608;
    if (_290)
    {
        _612 = _120;
    }
    float _614 = _612;
    float _616 = _504 * _554;
    if (_290)
    {
        _546 = _120;
    }
    float _618 = _546;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    bool _624 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _626 = isnan(_280);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = _516 * _554;
    bool _638 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _640 = isnan(_280);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _526 * _554;
    bool _652 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_280);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _634 * _622;
    float _666 = -_634;
    float _668 = _666 + 1.0;
    float _670 = -_648;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _676 = _650 * _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _680 = _616 * _678;
    float _682 = _648 * _668;
    float _684 = _662 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _688 = _636 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _692 = -_676;
    float _694 = fma(_616, _690, _692);
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_662;
    float _710 = _708 + 1.0;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _714 = -_688;
    float _716 = fma(_650, _712, _714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_680;
    float _722 = fma(_636, _718, _720);
    bool _724 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _726 = isnan(_280);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _706 * _710;
    float _738 = _716 * _716;
    float _740 = -_706;
    float _742 = _740 + 1.0;
    float _744 = fma(_376, _560, -0.5);
    if (_296)
    {
        float _746 = -_286;
        float _748 = _746 + 1.0;
        _456 = as_type<int>(_748);
    }
    int _750 = _456;
    float _752 = fma(_694, _694, _738);
    float _754 = _734 * _742;
    float _756 = -_734;
    float _758 = _756 + 1.0;
    if (!_296)
    {
        _548 = _286;
    }
    float _760 = _548;
    float _762 = fma(_722, _722, _752);
    float _764 = _760;
    if (_296)
    {
        float _766 = _584 ? as_type<float>(_750) : _286;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _444 * _758;
    float _772 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _462);
    float _774 = rsqrt(_762);
    float _776 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _570 * _770;
    float _782 = _614 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _784 = -_480;
    float _786 = fma(_776, 2.0, _784);
    float _788 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    int _790 = as_type<int>(_776);
    if (_302)
    {
        float _792 = -_286;
        float _794 = _792 + 1.0;
        _790 = as_type<int>(_794);
    }
    int _796 = _790;
    float _798 = -_84;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _804 = _280 + _802;
    float _806 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    if (_302)
    {
        float _810 = _568 ? as_type<float>(_796) : _286;
        _354 = _810;
    }
    float _812 = _354;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _416);
    float _818 = _722 * _774;
    float _820 = _694 * _774;
    float _822 = _716 * _774;
    float _824 = _808 * _464;
    float _826 = _636 * _818;
    float _828 = _616 * _820;
    float _830 = _650 * _822;
    float _832 = _814 * _494;
    float _834 = -_826;
    float _836 = fma(_650, _820, _834);
    float _838 = -_828;
    float _840 = fma(_636, _822, _838);
    float _842 = -_830;
    float _844 = fma(_616, _818, _842);
    float _846 = _816 * _478;
    float _848 = _824 * _836;
    float _850 = _824 * _840;
    float _852 = _824 * _844;
    float _854 = -_444;
    float _856 = _854 + 1.0;
    float _858 = fma(_832, _822, _848);
    float _860 = fma(_832, _818, _850);
    float _862 = fma(_832, _820, _852);
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[115].x, _780);
    float _866 = fma(_846, _616, _858);
    float _868 = fma(_846, _650, _860);
    float _870 = fma(_846, _636, _862);
    float _872 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = fma(_410, _804, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _872);
    float _882 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].y, _874);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].y, _884);
    float _894 = fma(_782, -2.0, _886);
    float _896 = _478 * _888;
    float _898 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _890);
    float _900 = _892 * _476;
    float _902 = _500 + _870;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _906 = _494 * _898;
    float _908 = _896 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _512 + _868;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].y, _904);
    float _914 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].y, _908);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _922 = _896 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _926 = fma(_586, _754, _864);
    float _928 = _902 + _920;
    float _930 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _914);
    float _932 = _910 + _924;
    float _934 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _772);
    float _938 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _930);
    float _940 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _932 + _944;
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _788);
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _954 = _928 + _952;
    float _956 = _946 * _946;
    float _958 = 1.0 / _948;
    float _960 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _962 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _964 = fma(_954, _954, _956);
    float _966 = fma(_580, _736, _926);
    float _968 = _768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _972 = sqrt(_964);
    float _974 = fma(_606, _684, _966);
    float _976 = _970 + _948;
    float _978 = fma(_940, _812, -0.5);
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].y, _922);
    float _982 = fma(_610, _682, _974);
    float _984 = -_960;
    float _986 = fma(_950, _744, _984);
    float _988 = fma(_936, _978, _800);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = _976 * _958;
    float _994 = _992 * 0.5;
    float _996 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].x, _980);
    float _998 = _426 + _866;
    float _1000 = _986 + 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1014 = _1010 || _1012;
    float _1016 = _998 + _996;
    bool _1018 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / _1004;
    bool _1022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _806 * _990;
    float _1034 = _968 * _918;
    float _1036 = _988 + 0.5;
    out.m_53.x = _1034;
    out.m_53.y = _1032;
    out.m_53.z = _1036;
    out.m_53.w = _1000;
    float _1038 = fma(_878, _664, _982);
    float _1040 = _982;
    float _1042 = _928;
    float _1044 = _932;
    float _1046 = _964;
    float _1048 = _878;
    float _1050 = _1032;
    float _1052 = _1038;
    if (!_1018)
    {
        _1040 = _1016;
    }
    float _1054 = _1040;
    bool _1056 = !_1018;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _972 + _1062;
        float _1066 = _1016 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_964);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1016, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_954, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_946, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1092;
        _1044 = _1094;
        _1058 = _1088;
        _1046 = _1068;
        _1048 = _1080;
        _1050 = _1090;
    }
    float _1096 = _1042;
    float _1098 = _1044;
    float _1100 = _1058;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1050;
    float _1108 = _1102;
    float _1110 = _1104;
    float _1112 = _1100;
    float _1114 = _1106;
    if (_1014)
    {
        _1108 = _1096;
    }
    float _1116 = _1108;
    float _1118 = _1116;
    if (_1014)
    {
        _1110 = _1098;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1014)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1126 = _426 + _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1130 = _500 + _1128;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = -_426;
        float _1136 = _1134 + _1100;
        float _1138 = _1126 * _1126;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _512 + _1140;
        float _1144 = -_512;
        float _1146 = _1144 + _1098;
        float _1148 = fma(_1130, _1130, _1138);
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1152 = fma(_1142, _1142, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1158 = precise::min(_1154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1160 = _1158 * _1150;
        float _1162 = -_500;
        float _1164 = _1162 + _1096;
        float _1166 = _1156 * _1160;
        float _1168 = fma(_1164, _1166, _500);
        float _1170 = fma(_1136, _1166, _426);
        float _1172 = fma(_1146, _1166, _512);
        _1112 = _1170;
        _1118 = _1168;
        _1122 = _1172;
        _1114 = _1154;
    }
    float _1174 = _1112;
    float _1176 = _1118;
    float _1178 = _1122;
    float _1180 = _1114;
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1038);
    float _1188 = _1180;
    if (_1030)
    {
        _1188 = 1.0;
    }
    float _1190 = _1188;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1194 = _1190;
    if (_1030)
    {
        _1052 = 1.0;
    }
    float _1196 = _1052;
    float _1198 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1206 = _1020 * _1204;
    float _1208 = _1196;
    if (!_1030)
    {
        float _1210 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1216 = _1212 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 0.15915493667125701904296875;
        float _1222 = _1212 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = 1.0 / _1218;
        float _1228 = _1220 * 6.283185482025146484375;
        float _1230 = cos(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = _1220 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1240 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1238;
        float _1242 = _1230 * _1232;
        float _1244 = 1.0 / _1240;
        float _1246 = 1.0 / _1242;
        float _1248 = _1236 * _1246;
        float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1252 = fma(_1206, _1248, _1250);
        float _1254 = _1252 * _1244;
        float _1256 = precise::clamp(_1254, 0.0, 1.0);
        _1194 = _1256;
    }
    float _1258 = _1194;
    if (!_1030)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1264 = _1260 * 0.15915493667125701904296875;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1270;
        float _1278 = _1266 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1266 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1302 = fma(_1206, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        float _1308 = -_1306;
        float _1310 = _1308 + 1.0;
        _1208 = _1310;
    }
    float _1312 = _1208;
    float _1314 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1316 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1200);
    float _1318 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1322 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1330 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1320);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1336 = _1258 > 0.0;
    bool _1338 = isnan(_1258);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1348 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1328);
    float _1352 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1354 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1356 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1358 = _1258 * _1312;
    bool _1360 = _1312 <= 0.0;
    bool _1362 = !_1344;
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1372 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1374 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1378 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1384 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1372);
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1388 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1382 + _1386;
    float _1398 = _1384 + _1386;
    float _1400 = _1386 * 0.5;
    float _1402 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * 0.5;
    float _1410 = _1398 * 0.5;
    float _1412 = fma(_1378, -0.5, _1400);
    out.m_55.x = _1402;
    out.m_55.y = _1404;
    out.m_55.z = _1406;
    out.m_55.w = _1388;
    out.m_57.x = _1176;
    out.m_57.y = _1174;
    out.m_57.z = _1178;
    out.m_37.x = _1390;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_59.x = _1408;
    out.m_59.y = _1412;
    out.m_59.z = _1410;
    out.m_59.w = _1386;
    if (!_1364)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1414;
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
        float _1482 = as_type<float>(_102);
        out.gl_Position.z = _1482;
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
        float _1545 = as_type<float>(_132);
        out.gl_Position.z = _1545;
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
    if (!_262)
    {
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _268 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].y, _84);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _264 = _278;
    }
    float _280 = _264;
    float _282 = in.m_39.w;
    float _284 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = in.m_43.x;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _290 = _288 != 0;
    float _292 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _296 = _294 != 0;
    float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    float _312 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _314 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _318 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _314);
    float _322 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _324 = _282 > 0.5;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    float _330 = in.m_49.x;
    float _332 = in.m_49.y;
    float _334 = in.m_49.z;
    float _336 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _344 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _340;
    float _348 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _320);
    float _350 = 0.0;
    bool _352 = _306;
    float _354 = _286;
    if (_302)
    {
        float _356 = in.m_39.z;
        _350 = _356;
    }
    float _358 = _350;
    float _360 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _362 = rsqrt(_342);
    float _364 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _378 = rsqrt(_364);
    float _380 = in.m_45.x;
    float _382 = in.m_45.y;
    float _384 = in.m_45.z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _396 = rsqrt(_348);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _402 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _410 = _400 * _346;
    float _412 = _362 * _330;
    float _414 = 1.0 / _368;
    float _416 = _378 * _334;
    float _418 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    out.m_51.x = _390;
    out.m_51.y = _402;
    out.m_51.z = _404;
    bool _424 = _120 > 0.5;
    float _426 = _418 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _428 = 1.0 / _372;
    float _430 = _396 * _332;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _434 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_280);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = 1.0 / _422;
    float _450 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _452 = _292;
    bool _454 = _424;
    int _456 = as_type<int>(_376);
    if (!_290)
    {
        float _458 = in.m_39.z;
        _452 = _458;
    }
    float _460 = _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _464 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _466;
    float _470 = 1.0 / _394;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _472;
    float _476 = _464 * _396;
    float _478 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _482 = 1.0 / _408;
    float _484 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _496 = _488 * _428;
    float _498 = _492 * _414;
    float _500 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = -_426;
    float _504 = _502 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _510 = _474 * _448;
    float _512 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _514 = -_500;
    float _516 = _514 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _504 * _504;
    float _520 = -_134;
    float _522 = _520 + 1.0;
    float _524 = -_512;
    float _526 = _524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _528 = _508 * _482;
    float _530 = fma(_516, _516, _518);
    float _532 = _468 * _470;
    int _534 = _424 ? as_type<int>(_522) : as_type<int>(_134);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _280 + _536;
    float _540 = fma(_526, _526, _530);
    float _542 = _482;
    float _544 = _530;
    float _546 = _460;
    float _548 = _510;
    if (!_290)
    {
        _542 = _120;
    }
    float _550 = _542;
    float _552 = _306 ? as_type<float>(_534) : _134;
    float _554 = rsqrt(_540);
    float _556 = _550;
    if (_310)
    {
        float _558 = _324 ? _522 : _134;
        _182 = _558;
    }
    float _560 = _182;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _280 + _562;
    if (_302)
    {
        bool _566 = _358 > 0.5;
        _352 = _566;
    }
    bool _568 = _352;
    float _570 = fma(_496, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _280 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = _280 + _576;
    float _580 = fma(_532, _564, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_296)
    {
        bool _582 = _116 > 0.5;
        _454 = _582;
    }
    bool _584 = _454;
    float _586 = fma(_498, _574, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_290)
    {
        _556 = _116;
    }
    float _588 = _556;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _592 = _280 + _590;
    bool _594 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _596 = isnan(_280);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = fma(_528, _578, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_290)
    {
        _544 = _460;
    }
    float _608 = _544;
    float _610 = fma(_510, _592, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _612 = _608;
    if (_290)
    {
        _612 = _120;
    }
    float _614 = _612;
    float _616 = _504 * _554;
    if (_290)
    {
        _546 = _120;
    }
    float _618 = _546;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    bool _624 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _626 = isnan(_280);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = _516 * _554;
    bool _638 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _640 = isnan(_280);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _526 * _554;
    bool _652 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_280);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _634 * _622;
    float _666 = -_634;
    float _668 = _666 + 1.0;
    float _670 = -_648;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _676 = _650 * _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _680 = _616 * _678;
    float _682 = _648 * _668;
    float _684 = _662 * _672;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _688 = _636 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _692 = -_676;
    float _694 = fma(_616, _690, _692);
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -_662;
    float _710 = _708 + 1.0;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _714 = -_688;
    float _716 = fma(_650, _712, _714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_680;
    float _722 = fma(_636, _718, _720);
    bool _724 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _726 = isnan(_280);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _706 * _710;
    float _738 = _716 * _716;
    float _740 = -_706;
    float _742 = _740 + 1.0;
    float _744 = fma(_376, _560, -0.5);
    if (_296)
    {
        float _746 = -_286;
        float _748 = _746 + 1.0;
        _456 = as_type<int>(_748);
    }
    int _750 = _456;
    float _752 = fma(_694, _694, _738);
    float _754 = _734 * _742;
    float _756 = -_734;
    float _758 = _756 + 1.0;
    if (!_296)
    {
        _548 = _286;
    }
    float _760 = _548;
    float _762 = fma(_722, _722, _752);
    float _764 = _760;
    if (_296)
    {
        float _766 = _584 ? as_type<float>(_750) : _286;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _444 * _758;
    float _772 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _462);
    float _774 = rsqrt(_762);
    float _776 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _570 * _770;
    float _782 = _614 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _784 = -_480;
    float _786 = fma(_776, 2.0, _784);
    float _788 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    int _790 = as_type<int>(_776);
    if (_302)
    {
        float _792 = -_286;
        float _794 = _792 + 1.0;
        _790 = as_type<int>(_794);
    }
    int _796 = _790;
    float _798 = -_84;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _804 = _280 + _802;
    float _806 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    if (_302)
    {
        float _810 = _568 ? as_type<float>(_796) : _286;
        _354 = _810;
    }
    float _812 = _354;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _416);
    float _818 = _722 * _774;
    float _820 = _694 * _774;
    float _822 = _716 * _774;
    float _824 = _808 * _464;
    float _826 = _636 * _818;
    float _828 = _616 * _820;
    float _830 = _650 * _822;
    float _832 = _814 * _494;
    float _834 = -_826;
    float _836 = fma(_650, _820, _834);
    float _838 = -_828;
    float _840 = fma(_636, _822, _838);
    float _842 = -_830;
    float _844 = fma(_616, _818, _842);
    float _846 = _816 * _478;
    float _848 = _824 * _836;
    float _850 = _824 * _840;
    float _852 = _824 * _844;
    float _854 = -_444;
    float _856 = _854 + 1.0;
    float _858 = fma(_832, _822, _848);
    float _860 = fma(_832, _818, _850);
    float _862 = fma(_832, _820, _852);
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[115].x, _780);
    float _866 = fma(_846, _616, _858);
    float _868 = fma(_846, _650, _860);
    float _870 = fma(_846, _636, _862);
    float _872 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _878 = fma(_410, _804, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _872);
    float _882 = _866 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].y, _874);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].y, _884);
    float _894 = fma(_782, -2.0, _886);
    float _896 = _478 * _888;
    float _898 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _890);
    float _900 = _892 * _476;
    float _902 = _500 + _870;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _906 = _494 * _898;
    float _908 = _896 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _910 = _512 + _868;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].y, _904);
    float _914 = _426 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].y, _908);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _922 = _896 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _926 = fma(_586, _754, _864);
    float _928 = _902 + _920;
    float _930 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _914);
    float _932 = _910 + _924;
    float _934 = _426 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].z, _772);
    float _938 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _930);
    float _940 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _932 + _944;
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[82].w, _788);
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _954 = _928 + _952;
    float _956 = _946 * _946;
    float _958 = 1.0 / _948;
    float _960 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _962 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _964 = fma(_954, _954, _956);
    float _966 = fma(_580, _736, _926);
    float _968 = _768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _972 = sqrt(_964);
    float _974 = fma(_606, _684, _966);
    float _976 = _970 + _948;
    float _978 = fma(_940, _812, -0.5);
    float _980 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].y, _922);
    float _982 = fma(_610, _682, _974);
    float _984 = -_960;
    float _986 = fma(_950, _744, _984);
    float _988 = fma(_936, _978, _800);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = _976 * _958;
    float _994 = _992 * 0.5;
    float _996 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].x, _980);
    float _998 = _426 + _866;
    float _1000 = _986 + 0.5;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1014 = _1010 || _1012;
    float _1016 = _998 + _996;
    bool _1018 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / _1004;
    bool _1022 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _806 * _990;
    float _1034 = _968 * _918;
    float _1036 = _988 + 0.5;
    out.m_53.x = _1034;
    out.m_53.y = _1032;
    out.m_53.z = _1036;
    out.m_53.w = _1000;
    float _1038 = fma(_878, _664, _982);
    float _1040 = _982;
    float _1042 = _928;
    float _1044 = _932;
    float _1046 = _964;
    float _1048 = _878;
    float _1050 = _1032;
    float _1052 = _1038;
    if (!_1018)
    {
        _1040 = _1016;
    }
    float _1054 = _1040;
    bool _1056 = !_1018;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _972 + _1062;
        float _1066 = _1016 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_964);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1016, _1076, _1084);
        float _1090 = _1068 * _1086;
        float _1092 = fma(_954, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_946, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1092;
        _1044 = _1094;
        _1058 = _1088;
        _1046 = _1068;
        _1048 = _1080;
        _1050 = _1090;
    }
    float _1096 = _1042;
    float _1098 = _1044;
    float _1100 = _1058;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1050;
    float _1108 = _1102;
    float _1110 = _1104;
    float _1112 = _1100;
    float _1114 = _1106;
    if (_1014)
    {
        _1108 = _1096;
    }
    float _1116 = _1108;
    float _1118 = _1116;
    if (_1014)
    {
        _1110 = _1098;
    }
    float _1120 = _1110;
    float _1122 = _1120;
    if (!_1014)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1126 = _426 + _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1130 = _500 + _1128;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = -_426;
        float _1136 = _1134 + _1100;
        float _1138 = _1126 * _1126;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1142 = _512 + _1140;
        float _1144 = -_512;
        float _1146 = _1144 + _1098;
        float _1148 = fma(_1130, _1130, _1138);
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1152 = fma(_1142, _1142, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1158 = precise::min(_1154, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1160 = _1158 * _1150;
        float _1162 = -_500;
        float _1164 = _1162 + _1096;
        float _1166 = _1156 * _1160;
        float _1168 = fma(_1164, _1166, _500);
        float _1170 = fma(_1136, _1166, _426);
        float _1172 = fma(_1146, _1166, _512);
        _1112 = _1170;
        _1118 = _1168;
        _1122 = _1172;
        _1114 = _1154;
    }
    float _1174 = _1112;
    float _1176 = _1118;
    float _1178 = _1122;
    float _1180 = _1114;
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1186 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1038);
    float _1188 = _1180;
    if (_1030)
    {
        _1188 = 1.0;
    }
    float _1190 = _1188;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1182);
    float _1194 = _1190;
    if (_1030)
    {
        _1052 = 1.0;
    }
    float _1196 = _1052;
    float _1198 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1184);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1192);
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1206 = _1020 * _1204;
    float _1208 = _1196;
    if (!_1030)
    {
        float _1210 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1216 = _1212 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 0.15915493667125701904296875;
        float _1222 = _1212 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = 1.0 / _1218;
        float _1228 = _1220 * 6.283185482025146484375;
        float _1230 = cos(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = _1220 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1240 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1238;
        float _1242 = _1230 * _1232;
        float _1244 = 1.0 / _1240;
        float _1246 = 1.0 / _1242;
        float _1248 = _1236 * _1246;
        float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1252 = fma(_1206, _1248, _1250);
        float _1254 = _1252 * _1244;
        float _1256 = precise::clamp(_1254, 0.0, 1.0);
        _1194 = _1256;
    }
    float _1258 = _1194;
    if (!_1030)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1264 = _1260 * 0.15915493667125701904296875;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1270;
        float _1278 = _1266 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1266 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1302 = fma(_1206, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        float _1308 = -_1306;
        float _1310 = _1308 + 1.0;
        _1208 = _1310;
    }
    float _1312 = _1208;
    float _1314 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1316 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1200);
    float _1318 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1322 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1330 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1320);
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1336 = _1258 > 0.0;
    bool _1338 = isnan(_1258);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1348 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1328);
    float _1352 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1354 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1356 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1358 = _1258 * _1312;
    bool _1360 = _1312 <= 0.0;
    bool _1362 = !_1344;
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1372 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1374 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1378 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1384 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1372);
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1388 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1382 + _1386;
    float _1398 = _1384 + _1386;
    float _1400 = _1386 * 0.5;
    float _1402 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 * 0.5;
    float _1410 = _1398 * 0.5;
    float _1412 = fma(_1378, -0.5, _1400);
    out.m_55.x = _1402;
    out.m_55.y = _1404;
    out.m_55.z = _1406;
    out.m_55.w = _1388;
    out.m_57.x = _1176;
    out.m_57.y = _1174;
    out.m_57.z = _1178;
    out.m_37.x = _1390;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_59.x = _1408;
    out.m_59.y = _1412;
    out.m_59.z = _1410;
    out.m_59.w = _1386;
    if (!_1364)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1414;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

