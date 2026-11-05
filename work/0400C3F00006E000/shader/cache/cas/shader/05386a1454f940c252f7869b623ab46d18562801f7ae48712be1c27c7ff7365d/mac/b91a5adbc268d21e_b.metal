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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c16 [[id(6)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(2)]];
    float4 m_39 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_47 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _628 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
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
        out.m_37.x = 0.0;
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
        float _1541 = as_type<float>(_100);
        out.gl_Position.z = _1541;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1610 = as_type<float>(_136);
        out.gl_Position.z = _1610;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
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
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _428 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _452 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_420, _418, _450);
    float _472 = fma(_422, _418, _452);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _470);
    float _478 = fma(_466, _358, _472);
    float _480 = fma(_468, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = _522 + _524;
    bool _528 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _530 = isnan(_522);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _540;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _546 = 1.0 / _542;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = _526 * _546;
    bool _558 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _560 = isnan(_522);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _570;
    float _574 = fma(_554, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = _568 * _550;
    float _582 = fma(_572, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = fma(_578, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _574 * _580;
    float _592 = _582 * _580;
    float _594 = _584 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _598);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _600);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _596);
    bool _608 = !_544;
    float _626;
    if (!_608)
    {
        float _610 = in.m_43.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_84);
        float _632 = 1.0 / _630;
        float _634 = _118 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _640 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _644 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _638);
    float _646 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _648 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _642);
    float _650 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _646);
    float _656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _660 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _662 = _654 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _668 = _660 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _664 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _678;
    float _682 = _668 * _668;
    float _684 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = _680 * _680;
    float _688 = fma(_672, _672, _682);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _690;
    float _694 = fma(_676, _676, _688);
    float _696 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = sqrt(_694);
    float _702 = fma(_698, -0.64999997615814208984375, 1.0);
    float _704 = rsqrt(_694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = precise::min(_658, _706);
    float _710 = _704 * _708;
    float _712 = _668 * _710;
    float _714 = _672 * _710;
    float _716 = _676 * _710;
    float _718 = -_712;
    float _720 = _668 + _718;
    float _722 = -_714;
    float _724 = _672 + _722;
    float _726 = -_716;
    float _728 = _676 + _726;
    float _730 = _720 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _732;
    float _736 = fma(_724, _724, _730);
    float _738 = fma(_734, _734, _686);
    float _740 = fma(_728, _728, _736);
    float _742 = fma(_692, _692, _738);
    float _744 = in.m_45.x;
    float _746 = in.m_45.y;
    float _748 = in.m_45.z;
    float _750 = rsqrt(_742);
    float _752 = sqrt(_740);
    float _754 = sqrt(_742);
    float _756 = _750 * (-0.20000000298023223876953125);
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _746);
    float _760 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _744);
    float _764 = _704 * _752;
    float _766 = fma(_734, _756, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _748);
    float _770 = fma(_680, _756, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _772 = _684 * _764;
    float _774 = _650 * _764;
    float _776 = _760 * _764;
    float _778 = -_770;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _772 * _758;
    float _784 = _774 * _762;
    float _786 = _776 * _768;
    float _788 = _754 * 0.066666670143604278564453125;
    float _790 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = _780 * _780;
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = precise::max(_788, 1.0);
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = precise::min(_802, 2.0);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = -_766;
    float _820 = _818 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _810 * _702;
    float _824 = _660 + _814;
    float _826 = _662 + _816;
    float _828 = _812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _830 = fma(_692, _756, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _832 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _834 = _824 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _838 = _826 + _836;
    float _840 = _664 + _828;
    float _842 = fma(_820, _820, _796);
    float _844 = fma(_834, _822, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _846 = fma(_838, _822, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _848 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _850 = _840 + _848;
    float _852 = -_830;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _856 = -_844;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = -_846;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = fma(_850, _822, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _770 + _866;
    float _870 = _858 * _858;
    float _872 = fma(_854, _854, _842);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _830 + _874;
    float _878 = fma(_862, _862, _870);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _766 + _880;
    float _884 = -_864;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _868 * _868;
    float _890 = sqrt(_872);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    float _896 = fma(_886, _886, _878);
    float _898 = fma(_882, _882, _888);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _902 = _900 != 0;
    float _904 = fma(_876, _876, _898);
    float _906 = sqrt(_896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = in.m_47.x;
    float _914 = rsqrt(_904);
    float _916 = -_890;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = in.m_43.y;
    float _924 = _906;
    float _926 = _844;
    float _928 = _660;
    if (_894)
    {
        float _930 = in.m_43.x;
        _924 = _930;
    }
    float _932 = _924;
    float _934 = _914 * _918;
    float _936 = -_934;
    float _938 = fma(_876, _936, _864);
    float _940 = -_934;
    float _942 = fma(_882, _940, _846);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _942 + _950;
    float _954 = -_934;
    float _956 = fma(_868, _954, _844);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _958;
    float _962 = _948 * _948;
    float _964 = fma(_952, _952, _962);
    float _966 = in.m_47.y;
    bool _968 = _922 > 0.5;
    float _970 = sqrt(_964);
    bool _972 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _974 = isnan(_636);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = _960 * _944;
    bool _986 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _988 = isnan(_636);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _636 + _998;
    bool _1002 = _932 > 0.5;
    bool _1004 = _1002 && _894;
    float _1006 = -_996;
    float _1008 = _1006 + 1.0;
    float _1010 = fma(_984, _1000, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1012 = _982 * _1008;
    bool _1014 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = _1010 * _1012;
    float _1018 = -_966;
    float _1020 = _1018 + 1.0;
    float _1022 = _966;
    float _1024 = _1020;
    float _1026 = _942;
    float _1028 = _970;
    if (_902)
    {
        float _1030 = _968 ? _1020 : _966;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1014)
    {
        _1024 = _938;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (!_1014)
    {
        _926 = _956;
    }
    float _1038 = _926;
    bool _1040 = !_1014;
    float _1042 = _1038;
    if (!_1040)
    {
        float _1044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1048 = _970 + _1046;
        float _1050 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = rsqrt(_964);
        float _1054 = _1048 * _1044;
        float _1056 = _1054 * 0.15915493667125701904296875;
        float _1058 = _1056 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1052 * _1066;
        float _1070 = _1064 + (-1.0);
        float _1072 = fma(_952, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_948, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = fma(_956, _1064, _1076);
        _1042 = _1078;
        _1026 = _1072;
        _1036 = _1074;
        _1028 = _1056;
    }
    float _1080 = _1042;
    float _1082 = _1026;
    float _1084 = _1036;
    float _1086 = _1028;
    float _1088 = -_712;
    float _1090 = _1088 + _1080;
    float _1092 = -_714;
    float _1094 = _1092 + _1082;
    float _1096 = _1086;
    float _1098 = _1080;
    if (_894)
    {
        _1096 = _912;
    }
    float _1100 = _1096;
    float _1102 = -_716;
    float _1104 = _1102 + _1084;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1108 = _1090 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1112 = _1094 + _1110;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1116 = _1100;
    if (_1004)
    {
        float _1118 = -_1100;
        float _1120 = _1118 + 1.0;
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1108 * _1108;
    float _1126 = -_982;
    float _1128 = _1126 + 1.0;
    if (!_894)
    {
        _1098 = _912;
    }
    float _1130 = _1098;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1134 = fma(_1112, _1112, _1124);
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1104 + _1136;
    float _1140 = _1130;
    if (_894)
    {
        _1140 = _1122;
    }
    float _1142 = _1140;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1016);
    float _1146 = fma(_1138, _1138, _1134);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1150 = sqrt(_1146);
    float _1152 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1144);
    float _1154 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1156 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1166 = _1148 * _920;
    float _1168 = _1132 * _1114;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _1184 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1186 = isnan(_1150);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1192 = _1188 || _1190;
    float _1194 = -_712;
    float _1196 = _660 + _1194;
    out.m_51.x = _1174;
    out.m_51.y = _1176;
    out.m_51.z = _1178;
    float _1198 = -_714;
    float _1200 = _662 + _1198;
    float _1202 = -_716;
    float _1204 = _664 + _1202;
    out.m_53.x = _1166;
    out.m_53.y = _1168;
    out.m_55.x = _1170;
    out.m_55.y = _1172;
    out.m_55.z = _1180;
    out.m_55.w = _1182;
    if (!_1192)
    {
        _928 = 1.0;
    }
    float _1206 = _928;
    out.m_57.w = _708;
    out.m_59.x = _774;
    bool _1208 = !_1192;
    float _1210 = _1206;
    if (!_1208)
    {
        bool _1212 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1214 = isnan(_1150);
        bool _1216 = _1212 || _1214;
        bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1220 = _1216 || _1218;
        if (!_1220)
        {
            float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1224 = _1150 + _1222;
            float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1228 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1226;
            float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1234 = 1.0 / _1228;
            float _1236 = _1224 * _1234;
            float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1210 = _1238;
            _1240 = true;
        }
        else
        {
            bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1244 = isnan(_1150);
            bool _1246 = _1242 || _1244;
            bool _1248 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1250 = _1246 || _1248;
            if (!_1250)
            {
                float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1254 = _1150 + _1252;
                float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1258 = _1256 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1262 = _1260 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1264 = 1.0 / _1258;
                float _1266 = _1254 * _1264;
                float _1268 = fma(_1266, _1262, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1210 = _1268;
                _1240 = true;
            }
            else
            {
                _1210 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1240 = false;
    float _1270 = _1210;
    float _1272 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1276 = _1090 + _1274;
    out.m_61.x = _1200;
    out.m_61.y = _1196;
    out.m_61.z = _1204;
    float _1278 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1272);
    float _1280 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1278);
    float _1282 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1286 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1282);
    float _1288 = 1.0 / _1284;
    float _1290 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1286);
    bool _1292 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1304 = _1094 + _1302;
    float _1306 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1308 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1312 = _1104 + _1310;
    float _1314 = fma(_1304, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1308 + _1284;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1322 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1324 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1326 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1322);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1332 = _1318 * _1288;
    float _1334 = _1332 * 0.5;
    float _1336 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1340 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1348);
    float _1360 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1350);
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1352);
    float _1364 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1366 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1370 = _1346;
    if (_1300)
    {
        _1370 = 1.0;
    }
    float _1372 = _1370;
    float _1374 = _1372;
    if (!_1300)
    {
        float _1376 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
        float _1382 = _1376 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1380;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1406;
        float _1410 = _1400 * _1402;
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1410;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1420 = _1404 * _1418;
        float _1422 = 1.0 / _1408;
        float _1424 = _1414 * _1416;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1428 = fma(_1424, _1420, _1426);
        float _1430 = _1428 * _1422;
        float _1432 = precise::clamp(_1430, 0.0, 1.0);
        float _1434 = -_1432;
        float _1436 = _1434 + 1.0;
        _1374 = _1436;
    }
    float _1438 = _1374;
    float _1440 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1444 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1448 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    bool _1450 = _1438 > 0.0;
    bool _1452 = isnan(_1438);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1464 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1466 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1468 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1446);
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1472 = _1464 + _1466;
    float _1474 = _1468 + _1466;
    float _1476 = _1466 * 0.5;
    float _1478 = _1472 * 0.5;
    float _1480 = _1474 * 0.5;
    float _1482 = fma(_1462, -0.5, _1476);
    out.m_63.x = _1314;
    out.m_63.y = _1306;
    out.m_63.z = _1320;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1468;
    out.gl_Position.w = _1466;
    out.m_37.x = _1470;
    out.m_65.x = _1478;
    out.m_65.y = _1482;
    out.m_65.z = _1480;
    out.m_65.w = _1466;
    if (_1458)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1484;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _628 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
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
        out.m_37.x = 0.0;
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
        float _1541 = as_type<float>(_100);
        out.gl_Position.z = _1541;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1610 = as_type<float>(_136);
        out.gl_Position.z = _1610;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
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
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _428 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _452 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_420, _418, _450);
    float _472 = fma(_422, _418, _452);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _470);
    float _478 = fma(_466, _358, _472);
    float _480 = fma(_468, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = _522 + _524;
    bool _528 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _530 = isnan(_522);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _540;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _546 = 1.0 / _542;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = _526 * _546;
    bool _558 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _560 = isnan(_522);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _570;
    float _574 = fma(_554, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = _568 * _550;
    float _582 = fma(_572, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = fma(_578, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _574 * _580;
    float _592 = _582 * _580;
    float _594 = _584 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _598);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _600);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _596);
    bool _608 = !_544;
    float _626;
    if (!_608)
    {
        float _610 = in.m_43.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_84);
        float _632 = 1.0 / _630;
        float _634 = _118 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _640 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _644 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _638);
    float _646 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _648 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _642);
    float _650 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _646);
    float _656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _660 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _662 = _654 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _668 = _660 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _664 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _678;
    float _682 = _668 * _668;
    float _684 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = _680 * _680;
    float _688 = fma(_672, _672, _682);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _690;
    float _694 = fma(_676, _676, _688);
    float _696 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = sqrt(_694);
    float _702 = fma(_698, -0.64999997615814208984375, 1.0);
    float _704 = rsqrt(_694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = precise::min(_658, _706);
    float _710 = _704 * _708;
    float _712 = _668 * _710;
    float _714 = _672 * _710;
    float _716 = _676 * _710;
    float _718 = -_712;
    float _720 = _668 + _718;
    float _722 = -_714;
    float _724 = _672 + _722;
    float _726 = -_716;
    float _728 = _676 + _726;
    float _730 = _720 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _732;
    float _736 = fma(_724, _724, _730);
    float _738 = fma(_734, _734, _686);
    float _740 = fma(_728, _728, _736);
    float _742 = fma(_692, _692, _738);
    float _744 = in.m_45.x;
    float _746 = in.m_45.y;
    float _748 = in.m_45.z;
    float _750 = rsqrt(_742);
    float _752 = sqrt(_740);
    float _754 = sqrt(_742);
    float _756 = _750 * (-0.20000000298023223876953125);
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _746);
    float _760 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _744);
    float _764 = _704 * _752;
    float _766 = fma(_734, _756, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _748);
    float _770 = fma(_680, _756, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _772 = _684 * _764;
    float _774 = _650 * _764;
    float _776 = _760 * _764;
    float _778 = -_770;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _772 * _758;
    float _784 = _774 * _762;
    float _786 = _776 * _768;
    float _788 = _754 * 0.066666670143604278564453125;
    float _790 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = _780 * _780;
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = precise::max(_788, 1.0);
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = precise::min(_802, 2.0);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = -_766;
    float _820 = _818 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _810 * _702;
    float _824 = _660 + _814;
    float _826 = _662 + _816;
    float _828 = _812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _830 = fma(_692, _756, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _832 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _834 = _824 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _838 = _826 + _836;
    float _840 = _664 + _828;
    float _842 = fma(_820, _820, _796);
    float _844 = fma(_834, _822, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _846 = fma(_838, _822, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _848 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _850 = _840 + _848;
    float _852 = -_830;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _856 = -_844;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = -_846;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = fma(_850, _822, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _770 + _866;
    float _870 = _858 * _858;
    float _872 = fma(_854, _854, _842);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _830 + _874;
    float _878 = fma(_862, _862, _870);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _766 + _880;
    float _884 = -_864;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _868 * _868;
    float _890 = sqrt(_872);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    float _896 = fma(_886, _886, _878);
    float _898 = fma(_882, _882, _888);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _902 = _900 != 0;
    float _904 = fma(_876, _876, _898);
    float _906 = sqrt(_896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = in.m_47.x;
    float _914 = rsqrt(_904);
    float _916 = -_890;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = in.m_43.y;
    float _924 = _906;
    float _926 = _844;
    float _928 = _660;
    if (_894)
    {
        float _930 = in.m_43.x;
        _924 = _930;
    }
    float _932 = _924;
    float _934 = _914 * _918;
    float _936 = -_934;
    float _938 = fma(_876, _936, _864);
    float _940 = -_934;
    float _942 = fma(_882, _940, _846);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _942 + _950;
    float _954 = -_934;
    float _956 = fma(_868, _954, _844);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _958;
    float _962 = _948 * _948;
    float _964 = fma(_952, _952, _962);
    float _966 = in.m_47.y;
    bool _968 = _922 > 0.5;
    float _970 = sqrt(_964);
    bool _972 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _974 = isnan(_636);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = _960 * _944;
    bool _986 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _988 = isnan(_636);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _636 + _998;
    bool _1002 = _932 > 0.5;
    bool _1004 = _1002 && _894;
    float _1006 = -_996;
    float _1008 = _1006 + 1.0;
    float _1010 = fma(_984, _1000, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1012 = _982 * _1008;
    bool _1014 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = _1010 * _1012;
    float _1018 = -_966;
    float _1020 = _1018 + 1.0;
    float _1022 = _966;
    float _1024 = _1020;
    float _1026 = _942;
    float _1028 = _970;
    if (_902)
    {
        float _1030 = _968 ? _1020 : _966;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1014)
    {
        _1024 = _938;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (!_1014)
    {
        _926 = _956;
    }
    float _1038 = _926;
    bool _1040 = !_1014;
    float _1042 = _1038;
    if (!_1040)
    {
        float _1044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1048 = _970 + _1046;
        float _1050 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = rsqrt(_964);
        float _1054 = _1048 * _1044;
        float _1056 = _1054 * 0.15915493667125701904296875;
        float _1058 = _1056 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1052 * _1066;
        float _1070 = _1064 + (-1.0);
        float _1072 = fma(_952, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_948, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = fma(_956, _1064, _1076);
        _1042 = _1078;
        _1026 = _1072;
        _1036 = _1074;
        _1028 = _1056;
    }
    float _1080 = _1042;
    float _1082 = _1026;
    float _1084 = _1036;
    float _1086 = _1028;
    float _1088 = -_712;
    float _1090 = _1088 + _1080;
    float _1092 = -_714;
    float _1094 = _1092 + _1082;
    float _1096 = _1086;
    float _1098 = _1080;
    if (_894)
    {
        _1096 = _912;
    }
    float _1100 = _1096;
    float _1102 = -_716;
    float _1104 = _1102 + _1084;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1108 = _1090 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1112 = _1094 + _1110;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1116 = _1100;
    if (_1004)
    {
        float _1118 = -_1100;
        float _1120 = _1118 + 1.0;
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1108 * _1108;
    float _1126 = -_982;
    float _1128 = _1126 + 1.0;
    if (!_894)
    {
        _1098 = _912;
    }
    float _1130 = _1098;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1134 = fma(_1112, _1112, _1124);
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1104 + _1136;
    float _1140 = _1130;
    if (_894)
    {
        _1140 = _1122;
    }
    float _1142 = _1140;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1016);
    float _1146 = fma(_1138, _1138, _1134);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1150 = sqrt(_1146);
    float _1152 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1144);
    float _1154 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1156 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1166 = _1148 * _920;
    float _1168 = _1132 * _1114;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _1184 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1186 = isnan(_1150);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1192 = _1188 || _1190;
    float _1194 = -_712;
    float _1196 = _660 + _1194;
    out.m_51.x = _1174;
    out.m_51.y = _1176;
    out.m_51.z = _1178;
    float _1198 = -_714;
    float _1200 = _662 + _1198;
    float _1202 = -_716;
    float _1204 = _664 + _1202;
    out.m_53.x = _1166;
    out.m_53.y = _1168;
    out.m_55.x = _1170;
    out.m_55.y = _1172;
    out.m_55.z = _1180;
    out.m_55.w = _1182;
    if (!_1192)
    {
        _928 = 1.0;
    }
    float _1206 = _928;
    out.m_57.w = _708;
    out.m_59.x = _774;
    bool _1208 = !_1192;
    float _1210 = _1206;
    if (!_1208)
    {
        bool _1212 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1214 = isnan(_1150);
        bool _1216 = _1212 || _1214;
        bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1220 = _1216 || _1218;
        if (!_1220)
        {
            float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1224 = _1150 + _1222;
            float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1228 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1226;
            float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1234 = 1.0 / _1228;
            float _1236 = _1224 * _1234;
            float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1210 = _1238;
            _1240 = true;
        }
        else
        {
            bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1244 = isnan(_1150);
            bool _1246 = _1242 || _1244;
            bool _1248 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1250 = _1246 || _1248;
            if (!_1250)
            {
                float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1254 = _1150 + _1252;
                float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1258 = _1256 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1262 = _1260 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1264 = 1.0 / _1258;
                float _1266 = _1254 * _1264;
                float _1268 = fma(_1266, _1262, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1210 = _1268;
                _1240 = true;
            }
            else
            {
                _1210 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1240 = false;
    float _1270 = _1210;
    float _1272 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1276 = _1090 + _1274;
    out.m_61.x = _1200;
    out.m_61.y = _1196;
    out.m_61.z = _1204;
    float _1278 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1272);
    float _1280 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1278);
    float _1282 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1286 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1282);
    float _1288 = 1.0 / _1284;
    float _1290 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1286);
    bool _1292 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1304 = _1094 + _1302;
    float _1306 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1308 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1312 = _1104 + _1310;
    float _1314 = fma(_1304, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1308 + _1284;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1322 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1324 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1326 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1322);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1332 = _1318 * _1288;
    float _1334 = _1332 * 0.5;
    float _1336 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1340 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1348);
    float _1360 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1350);
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1352);
    float _1364 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1366 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1370 = _1346;
    if (_1300)
    {
        _1370 = 1.0;
    }
    float _1372 = _1370;
    float _1374 = _1372;
    if (!_1300)
    {
        float _1376 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
        float _1382 = _1376 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1380;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1406;
        float _1410 = _1400 * _1402;
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1410;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1420 = _1404 * _1418;
        float _1422 = 1.0 / _1408;
        float _1424 = _1414 * _1416;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1428 = fma(_1424, _1420, _1426);
        float _1430 = _1428 * _1422;
        float _1432 = precise::clamp(_1430, 0.0, 1.0);
        float _1434 = -_1432;
        float _1436 = _1434 + 1.0;
        _1374 = _1436;
    }
    float _1438 = _1374;
    float _1440 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1444 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1448 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    bool _1450 = _1438 > 0.0;
    bool _1452 = isnan(_1438);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1464 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1466 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1468 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1446);
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1472 = _1464 + _1466;
    float _1474 = _1468 + _1466;
    float _1476 = _1466 * 0.5;
    float _1478 = _1472 * 0.5;
    float _1480 = _1474 * 0.5;
    float _1482 = fma(_1462, -0.5, _1476);
    out.m_63.x = _1314;
    out.m_63.y = _1306;
    out.m_63.z = _1320;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1468;
    out.gl_Position.w = _1466;
    out.m_37.x = _1470;
    out.m_65.x = _1478;
    out.m_65.y = _1482;
    out.m_65.z = _1480;
    out.m_65.w = _1466;
    if (_1458)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1484;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1240 = false;
    bool _628 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
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
        out.m_37.x = 0.0;
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
        float _1541 = as_type<float>(_100);
        out.gl_Position.z = _1541;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1610 = as_type<float>(_136);
        out.gl_Position.z = _1610;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
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
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _428 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _452 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = fma(_420, _418, _450);
    float _472 = fma(_422, _418, _452);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _470);
    float _478 = fma(_466, _358, _472);
    float _480 = fma(_468, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = _522 + _524;
    bool _528 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _530 = isnan(_522);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _540;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _546 = 1.0 / _542;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = _526 * _546;
    bool _558 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _560 = isnan(_522);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _570;
    float _574 = fma(_554, _556, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = _568 * _550;
    float _582 = fma(_572, _556, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = fma(_578, _556, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _574 * _580;
    float _592 = _582 * _580;
    float _594 = _584 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _598);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _600);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _596);
    bool _608 = !_544;
    float _626;
    if (!_608)
    {
        float _610 = in.m_43.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_84);
        float _632 = 1.0 / _630;
        float _634 = _118 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _640 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _644 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _638);
    float _646 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _648 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _642);
    float _650 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _646);
    float _656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _660 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _662 = _654 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _668 = _660 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _664 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _678;
    float _682 = _668 * _668;
    float _684 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = _680 * _680;
    float _688 = fma(_672, _672, _682);
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _692 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _690;
    float _694 = fma(_676, _676, _688);
    float _696 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = sqrt(_694);
    float _702 = fma(_698, -0.64999997615814208984375, 1.0);
    float _704 = rsqrt(_694);
    float _706 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = precise::min(_658, _706);
    float _710 = _704 * _708;
    float _712 = _668 * _710;
    float _714 = _672 * _710;
    float _716 = _676 * _710;
    float _718 = -_712;
    float _720 = _668 + _718;
    float _722 = -_714;
    float _724 = _672 + _722;
    float _726 = -_716;
    float _728 = _676 + _726;
    float _730 = _720 * _720;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _732;
    float _736 = fma(_724, _724, _730);
    float _738 = fma(_734, _734, _686);
    float _740 = fma(_728, _728, _736);
    float _742 = fma(_692, _692, _738);
    float _744 = in.m_45.x;
    float _746 = in.m_45.y;
    float _748 = in.m_45.z;
    float _750 = rsqrt(_742);
    float _752 = sqrt(_740);
    float _754 = sqrt(_742);
    float _756 = _750 * (-0.20000000298023223876953125);
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _746);
    float _760 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _744);
    float _764 = _704 * _752;
    float _766 = fma(_734, _756, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _748);
    float _770 = fma(_680, _756, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _772 = _684 * _764;
    float _774 = _650 * _764;
    float _776 = _760 * _764;
    float _778 = -_770;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _772 * _758;
    float _784 = _774 * _762;
    float _786 = _776 * _768;
    float _788 = _754 * 0.066666670143604278564453125;
    float _790 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = _780 * _780;
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = precise::max(_788, 1.0);
    float _804 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = precise::min(_802, 2.0);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _804);
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = -_766;
    float _820 = _818 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _810 * _702;
    float _824 = _660 + _814;
    float _826 = _662 + _816;
    float _828 = _812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _830 = fma(_692, _756, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _832 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _834 = _824 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _838 = _826 + _836;
    float _840 = _664 + _828;
    float _842 = fma(_820, _820, _796);
    float _844 = fma(_834, _822, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _846 = fma(_838, _822, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _848 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _850 = _840 + _848;
    float _852 = -_830;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _856 = -_844;
    float _858 = _856 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = -_846;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = fma(_850, _822, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _770 + _866;
    float _870 = _858 * _858;
    float _872 = fma(_854, _854, _842);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _830 + _874;
    float _878 = fma(_862, _862, _870);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _766 + _880;
    float _884 = -_864;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _868 * _868;
    float _890 = sqrt(_872);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    float _896 = fma(_886, _886, _878);
    float _898 = fma(_882, _882, _888);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _902 = _900 != 0;
    float _904 = fma(_876, _876, _898);
    float _906 = sqrt(_896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = in.m_47.x;
    float _914 = rsqrt(_904);
    float _916 = -_890;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = in.m_43.y;
    float _924 = _906;
    float _926 = _844;
    float _928 = _660;
    if (_894)
    {
        float _930 = in.m_43.x;
        _924 = _930;
    }
    float _932 = _924;
    float _934 = _914 * _918;
    float _936 = -_934;
    float _938 = fma(_876, _936, _864);
    float _940 = -_934;
    float _942 = fma(_882, _940, _846);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _952 = _942 + _950;
    float _954 = -_934;
    float _956 = fma(_868, _954, _844);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _958;
    float _962 = _948 * _948;
    float _964 = fma(_952, _952, _962);
    float _966 = in.m_47.y;
    bool _968 = _922 > 0.5;
    float _970 = sqrt(_964);
    bool _972 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _974 = isnan(_636);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = _960 * _944;
    bool _986 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _988 = isnan(_636);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _636 + _998;
    bool _1002 = _932 > 0.5;
    bool _1004 = _1002 && _894;
    float _1006 = -_996;
    float _1008 = _1006 + 1.0;
    float _1010 = fma(_984, _1000, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1012 = _982 * _1008;
    bool _1014 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = _1010 * _1012;
    float _1018 = -_966;
    float _1020 = _1018 + 1.0;
    float _1022 = _966;
    float _1024 = _1020;
    float _1026 = _942;
    float _1028 = _970;
    if (_902)
    {
        float _1030 = _968 ? _1020 : _966;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1014)
    {
        _1024 = _938;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (!_1014)
    {
        _926 = _956;
    }
    float _1038 = _926;
    bool _1040 = !_1014;
    float _1042 = _1038;
    if (!_1040)
    {
        float _1044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1048 = _970 + _1046;
        float _1050 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = rsqrt(_964);
        float _1054 = _1048 * _1044;
        float _1056 = _1054 * 0.15915493667125701904296875;
        float _1058 = _1056 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1052 * _1066;
        float _1070 = _1064 + (-1.0);
        float _1072 = fma(_952, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_948, _1068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = fma(_956, _1064, _1076);
        _1042 = _1078;
        _1026 = _1072;
        _1036 = _1074;
        _1028 = _1056;
    }
    float _1080 = _1042;
    float _1082 = _1026;
    float _1084 = _1036;
    float _1086 = _1028;
    float _1088 = -_712;
    float _1090 = _1088 + _1080;
    float _1092 = -_714;
    float _1094 = _1092 + _1082;
    float _1096 = _1086;
    float _1098 = _1080;
    if (_894)
    {
        _1096 = _912;
    }
    float _1100 = _1096;
    float _1102 = -_716;
    float _1104 = _1102 + _1084;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1108 = _1090 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1112 = _1094 + _1110;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1116 = _1100;
    if (_1004)
    {
        float _1118 = -_1100;
        float _1120 = _1118 + 1.0;
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1108 * _1108;
    float _1126 = -_982;
    float _1128 = _1126 + 1.0;
    if (!_894)
    {
        _1098 = _912;
    }
    float _1130 = _1098;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1134 = fma(_1112, _1112, _1124);
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1104 + _1136;
    float _1140 = _1130;
    if (_894)
    {
        _1140 = _1122;
    }
    float _1142 = _1140;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1016);
    float _1146 = fma(_1138, _1138, _1134);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1150 = sqrt(_1146);
    float _1152 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1144);
    float _1154 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1156 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1166 = _1148 * _920;
    float _1168 = _1132 * _1114;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _1184 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1186 = isnan(_1150);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1192 = _1188 || _1190;
    float _1194 = -_712;
    float _1196 = _660 + _1194;
    out.m_51.x = _1174;
    out.m_51.y = _1176;
    out.m_51.z = _1178;
    float _1198 = -_714;
    float _1200 = _662 + _1198;
    float _1202 = -_716;
    float _1204 = _664 + _1202;
    out.m_53.x = _1166;
    out.m_53.y = _1168;
    out.m_55.x = _1170;
    out.m_55.y = _1172;
    out.m_55.z = _1180;
    out.m_55.w = _1182;
    if (!_1192)
    {
        _928 = 1.0;
    }
    float _1206 = _928;
    out.m_57.w = _708;
    out.m_59.x = _774;
    bool _1208 = !_1192;
    float _1210 = _1206;
    if (!_1208)
    {
        bool _1212 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1214 = isnan(_1150);
        bool _1216 = _1212 || _1214;
        bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1220 = _1216 || _1218;
        if (!_1220)
        {
            float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1224 = _1150 + _1222;
            float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1228 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1226;
            float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1234 = 1.0 / _1228;
            float _1236 = _1224 * _1234;
            float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1210 = _1238;
            _1240 = true;
        }
        else
        {
            bool _1242 = _1150 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1244 = isnan(_1150);
            bool _1246 = _1242 || _1244;
            bool _1248 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1250 = _1246 || _1248;
            if (!_1250)
            {
                float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1254 = _1150 + _1252;
                float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1258 = _1256 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1262 = _1260 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1264 = 1.0 / _1258;
                float _1266 = _1254 * _1264;
                float _1268 = fma(_1266, _1262, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1210 = _1268;
                _1240 = true;
            }
            else
            {
                _1210 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1240 = false;
    float _1270 = _1210;
    float _1272 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1276 = _1090 + _1274;
    out.m_61.x = _1200;
    out.m_61.y = _1196;
    out.m_61.z = _1204;
    float _1278 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1272);
    float _1280 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1278);
    float _1282 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1286 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1282);
    float _1288 = 1.0 / _1284;
    float _1290 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1286);
    bool _1292 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1304 = _1094 + _1302;
    float _1306 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1308 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1312 = _1104 + _1310;
    float _1314 = fma(_1304, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1308 + _1284;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1322 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1324 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1326 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1322);
    float _1330 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1332 = _1318 * _1288;
    float _1334 = _1332 * 0.5;
    float _1336 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1340 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1342 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1354 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1358 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1348);
    float _1360 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1350);
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1352);
    float _1364 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1366 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1370 = _1346;
    if (_1300)
    {
        _1370 = 1.0;
    }
    float _1372 = _1370;
    float _1374 = _1372;
    if (!_1300)
    {
        float _1376 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1380 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
        float _1382 = _1376 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1380;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1406;
        float _1410 = _1400 * _1402;
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1410;
        float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1420 = _1404 * _1418;
        float _1422 = 1.0 / _1408;
        float _1424 = _1414 * _1416;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1428 = fma(_1424, _1420, _1426);
        float _1430 = _1428 * _1422;
        float _1432 = precise::clamp(_1430, 0.0, 1.0);
        float _1434 = -_1432;
        float _1436 = _1434 + 1.0;
        _1374 = _1436;
    }
    float _1438 = _1374;
    float _1440 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1444 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1448 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    bool _1450 = _1438 > 0.0;
    bool _1452 = isnan(_1438);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1462 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1464 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1466 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1468 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1446);
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1472 = _1464 + _1466;
    float _1474 = _1468 + _1466;
    float _1476 = _1466 * 0.5;
    float _1478 = _1472 * 0.5;
    float _1480 = _1474 * 0.5;
    float _1482 = fma(_1462, -0.5, _1476);
    out.m_63.x = _1314;
    out.m_63.y = _1306;
    out.m_63.z = _1320;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1468;
    out.gl_Position.w = _1466;
    out.m_37.x = _1470;
    out.m_65.x = _1478;
    out.m_65.y = _1482;
    out.m_65.z = _1480;
    out.m_65.w = _1466;
    if (_1458)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1484;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

