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
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_51 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1126 = false;
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
        float _1427 = as_type<float>(_100);
        out.gl_Position.z = _1427;
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
        float _1496 = as_type<float>(_136);
        out.gl_Position.z = _1496;
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
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
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
    float _524 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _530 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _534 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
    float _538 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _540 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _542 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _554 = _546 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _548 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _562 = _550 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _564;
    float _568 = _554 * _554;
    float _570 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _572 = _566 * _566;
    float _574 = fma(_558, _558, _568);
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _578 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _576;
    float _580 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_562, _562, _574);
    float _584 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = sqrt(_582);
    float _590 = fma(_586, -0.64999997615814208984375, 1.0);
    float _592 = rsqrt(_582);
    float _594 = _588 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _596 = precise::min(_538, _594);
    float _598 = _592 * _596;
    float _600 = _554 * _598;
    float _602 = _558 * _598;
    float _604 = _562 * _598;
    float _606 = -_600;
    float _608 = _554 + _606;
    float _610 = -_602;
    float _612 = _558 + _610;
    float _614 = -_604;
    float _616 = _562 + _614;
    float _618 = _608 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _620;
    float _624 = fma(_612, _612, _618);
    float _626 = fma(_622, _622, _572);
    float _628 = fma(_616, _616, _624);
    float _630 = fma(_578, _578, _626);
    float _632 = in.m_45.x;
    float _634 = in.m_45.y;
    float _636 = in.m_45.z;
    float _638 = rsqrt(_630);
    float _640 = sqrt(_628);
    float _642 = sqrt(_630);
    float _644 = _638 * (-0.20000000298023223876953125);
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _632);
    float _650 = fma(_622, _644, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _652 = _592 * _640;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _636);
    float _656 = fma(_566, _644, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _658 = fma(_578, _644, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _660 = _570 * _652;
    float _662 = _530 * _652;
    float _664 = _580 * _652;
    float _666 = _660 * _646;
    float _668 = _662 * _648;
    float _670 = _664 * _654;
    float _672 = _642 * 0.066666670143604278564453125;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _680 = -_656;
    float _682 = _680 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
    float _690 = precise::max(_672, 1.0);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
    float _698 = precise::min(_690, 2.0);
    float _700 = _692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _704 = -_650;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _682 * _682;
    float _710 = _546 + _700;
    float _712 = _698 * _590;
    float _714 = _548 + _702;
    float _716 = _696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = _710 + _718;
    float _722 = fma(_706, _706, _708);
    float _724 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _726 = _714 + _724;
    float _728 = _550 + _716;
    float _730 = fma(_720, _712, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _732 = -_658;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = fma(_726, _712, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _740 = _728 + _738;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = _656 + _746;
    float _750 = -_736;
    float _752 = _750 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = fma(_740, _712, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _756 = _744 * _744;
    float _758 = fma(_734, _734, _722);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _658 + _760;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _766 = _764 != 0;
    float _768 = fma(_752, _752, _756);
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _650 + _770;
    float _774 = -_754;
    float _776 = _774 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _748 * _748;
    float _780 = sqrt(_758);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _784 = _782 != 0;
    float _786 = fma(_776, _776, _768);
    float _788 = fma(_772, _772, _778);
    float _790 = in.m_47.x;
    float _792 = fma(_762, _762, _788);
    float _794 = sqrt(_786);
    float _796 = rsqrt(_792);
    float _798 = -_780;
    float _800 = _794 + _798;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = in.m_43.y;
    float _806 = _780;
    float _808 = _730;
    float _810 = _546;
    if (_766)
    {
        float _812 = in.m_43.x;
        _806 = _812;
    }
    float _814 = _806;
    float _816 = _796 * _800;
    float _818 = -_816;
    float _820 = fma(_762, _818, _754);
    float _822 = -_816;
    float _824 = fma(_772, _822, _736);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _824 + _834;
    float _838 = 1.0 / _828;
    float _840 = -_816;
    float _842 = fma(_748, _840, _730);
    float _844 = _832 * _832;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = fma(_836, _836, _844);
    float _852 = in.m_47.y;
    bool _854 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_522);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = sqrt(_850);
    bool _868 = _804 > 0.5;
    bool _870 = _814 > 0.5;
    bool _872 = _870 && _766;
    float _874 = -_864;
    float _876 = _874 + 1.0;
    float _878 = _848 * _838;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _522 + _880;
    bool _884 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_522);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = fma(_878, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _894 * _876;
    bool _900 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 * _898;
    float _904 = -_852;
    float _906 = _904 + 1.0;
    float _908 = _852;
    float _910 = _820;
    float _912 = _824;
    float _914 = _896;
    float _916 = _906;
    if (_784)
    {
        float _918 = _868 ? _906 : _852;
        _908 = _918;
    }
    float _920 = _908;
    if (!_900)
    {
        _808 = _820;
    }
    float _922 = _808;
    float _924 = _922;
    if (!_900)
    {
        _910 = _842;
    }
    float _926 = _910;
    bool _928 = !_900;
    float _930 = _926;
    if (!_928)
    {
        float _932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _936 = _866 + _934;
        float _938 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _936 * _932;
        float _942 = rsqrt(_850);
        float _944 = _940 * 0.15915493667125701904296875;
        float _946 = _944 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = fma(_948, _938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _942 * _954;
        float _958 = _952 + (-1.0);
        float _960 = fma(_836, _956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _962 = fma(_832, _956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _964 = _958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_842, _952, _964);
        _930 = _966;
        _912 = _960;
        _924 = _962;
        _914 = _964;
    }
    float _968 = _930;
    float _970 = _912;
    float _972 = _924;
    float _974 = _914;
    float _976 = -_600;
    float _978 = _976 + _968;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _982 = -_602;
    float _984 = _982 + _970;
    float _986 = _974;
    if (_766)
    {
        _916 = _790;
    }
    float _988 = _916;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _992 = _978 + _990;
    float _994 = -_894;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1000 = _984 + _998;
    float _1002 = -_604;
    float _1004 = _1002 + _972;
    float _1006 = _992 * _992;
    float _1008 = _988;
    if (_872)
    {
        float _1010 = -_988;
        float _1012 = _1010 + 1.0;
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _902);
    float _1018 = _920 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_1000, _1000, _1006);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1004 + _1022;
    if (!_766)
    {
        _986 = _790;
    }
    float _1026 = _986;
    out.m_49.w = _596;
    float _1028 = _1026;
    if (_766)
    {
        _1028 = _1014;
    }
    float _1030 = _1028;
    float _1032 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1016);
    float _1034 = fma(_1024, _1024, _1020);
    float _1036 = _1018 * _980;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1040 = sqrt(_1034);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1050 = _1038 * _802;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1070 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1072 = isnan(_1040);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1078 = _1074 || _1076;
    float _1080 = -_600;
    float _1082 = _546 + _1080;
    out.m_53.x = _1060;
    out.m_53.y = _1062;
    out.m_53.z = _1064;
    float _1084 = -_602;
    float _1086 = _548 + _1084;
    float _1088 = -_604;
    float _1090 = _550 + _1088;
    out.m_55.x = _1050;
    out.m_55.y = _1036;
    out.m_57.x = _1056;
    out.m_57.y = _1058;
    out.m_57.z = _1066;
    out.m_57.w = _1068;
    if (!_1078)
    {
        _810 = 1.0;
    }
    float _1092 = _810;
    out.m_59.x = _662;
    bool _1094 = !_1078;
    float _1096 = _1092;
    if (!_1094)
    {
        bool _1098 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1100 = isnan(_1040);
        bool _1102 = _1098 || _1100;
        bool _1104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1106 = _1102 || _1104;
        if (!_1106)
        {
            float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1110 = _1040 + _1108;
            float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1114 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1118 = _1116 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1120 = 1.0 / _1114;
            float _1122 = _1110 * _1120;
            float _1124 = fma(_1122, _1118, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1096 = _1124;
            _1126 = true;
        }
        else
        {
            bool _1128 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1130 = isnan(_1040);
            bool _1132 = _1128 || _1130;
            bool _1134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1136 = _1132 || _1134;
            if (!_1136)
            {
                float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1140 = _1040 + _1138;
                float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1144 = _1142 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1148 = _1146 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1150 = 1.0 / _1144;
                float _1152 = _1140 * _1150;
                float _1154 = fma(_1152, _1148, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1096 = _1154;
                _1126 = true;
            }
            else
            {
                _1096 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1126 = false;
    float _1156 = _1096;
    float _1158 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1162 = _978 + _1160;
    out.m_61.x = _1086;
    out.m_61.y = _1082;
    out.m_61.z = _1090;
    float _1164 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1166 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1168 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1172 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1168);
    float _1174 = 1.0 / _1170;
    float _1176 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1172);
    bool _1178 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.5);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1190 = _984 + _1188;
    float _1192 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1196 = _1004 + _1194;
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1200 = fma(_1190, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = fma(_1196, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1208 = _1198 + _1170;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1212 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1206);
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = _1208 * _1174;
    float _1220 = _1218 * 0.5;
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1212);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1238 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1236);
    float _1248 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1230;
    if (_1186)
    {
        _1256 = 1.0;
    }
    float _1258 = _1256;
    float _1260 = _1258;
    if (!_1186)
    {
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
        float _1268 = _1262 * 0.15915493667125701904296875;
        float _1270 = _1268 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1276 = _1274 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1272;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1266;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = _1286 * _1288;
        float _1298 = _1276 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = 1.0 / _1296;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1306 = _1290 * _1304;
        float _1308 = 1.0 / _1294;
        float _1310 = _1300 * _1302;
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1314 = fma(_1310, _1306, _1312);
        float _1316 = _1314 * _1308;
        float _1318 = precise::clamp(_1316, 0.0, 1.0);
        float _1320 = -_1318;
        float _1322 = _1320 + 1.0;
        _1260 = _1322;
    }
    float _1324 = _1260;
    float _1326 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1246);
    float _1330 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1332 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1334 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    bool _1336 = _1324 > 0.0;
    bool _1338 = isnan(_1324);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1352 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1354 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1358 = _1350 + _1352;
    float _1360 = _1354 + _1352;
    float _1362 = _1352 * 0.5;
    float _1364 = _1358 * 0.5;
    float _1366 = _1360 * 0.5;
    float _1368 = fma(_1348, -0.5, _1362);
    out.m_63.x = _1200;
    out.m_63.y = _1192;
    out.m_63.z = _1204;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1354;
    out.gl_Position.w = _1352;
    out.m_37.x = _1356;
    out.m_65.x = _1364;
    out.m_65.y = _1368;
    out.m_65.z = _1366;
    out.m_65.w = _1352;
    if (_1344)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1370;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1126 = false;
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
        float _1427 = as_type<float>(_100);
        out.gl_Position.z = _1427;
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
        float _1496 = as_type<float>(_136);
        out.gl_Position.z = _1496;
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
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
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
    float _524 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _530 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _534 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
    float _538 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _540 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _542 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _554 = _546 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _548 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _562 = _550 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _564;
    float _568 = _554 * _554;
    float _570 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _572 = _566 * _566;
    float _574 = fma(_558, _558, _568);
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _578 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _576;
    float _580 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_562, _562, _574);
    float _584 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = sqrt(_582);
    float _590 = fma(_586, -0.64999997615814208984375, 1.0);
    float _592 = rsqrt(_582);
    float _594 = _588 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _596 = precise::min(_538, _594);
    float _598 = _592 * _596;
    float _600 = _554 * _598;
    float _602 = _558 * _598;
    float _604 = _562 * _598;
    float _606 = -_600;
    float _608 = _554 + _606;
    float _610 = -_602;
    float _612 = _558 + _610;
    float _614 = -_604;
    float _616 = _562 + _614;
    float _618 = _608 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _620;
    float _624 = fma(_612, _612, _618);
    float _626 = fma(_622, _622, _572);
    float _628 = fma(_616, _616, _624);
    float _630 = fma(_578, _578, _626);
    float _632 = in.m_45.x;
    float _634 = in.m_45.y;
    float _636 = in.m_45.z;
    float _638 = rsqrt(_630);
    float _640 = sqrt(_628);
    float _642 = sqrt(_630);
    float _644 = _638 * (-0.20000000298023223876953125);
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _632);
    float _650 = fma(_622, _644, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _652 = _592 * _640;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _636);
    float _656 = fma(_566, _644, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _658 = fma(_578, _644, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _660 = _570 * _652;
    float _662 = _530 * _652;
    float _664 = _580 * _652;
    float _666 = _660 * _646;
    float _668 = _662 * _648;
    float _670 = _664 * _654;
    float _672 = _642 * 0.066666670143604278564453125;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _680 = -_656;
    float _682 = _680 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
    float _690 = precise::max(_672, 1.0);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
    float _698 = precise::min(_690, 2.0);
    float _700 = _692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _704 = -_650;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _682 * _682;
    float _710 = _546 + _700;
    float _712 = _698 * _590;
    float _714 = _548 + _702;
    float _716 = _696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = _710 + _718;
    float _722 = fma(_706, _706, _708);
    float _724 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _726 = _714 + _724;
    float _728 = _550 + _716;
    float _730 = fma(_720, _712, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _732 = -_658;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = fma(_726, _712, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _740 = _728 + _738;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = _656 + _746;
    float _750 = -_736;
    float _752 = _750 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = fma(_740, _712, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _756 = _744 * _744;
    float _758 = fma(_734, _734, _722);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _658 + _760;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _766 = _764 != 0;
    float _768 = fma(_752, _752, _756);
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _650 + _770;
    float _774 = -_754;
    float _776 = _774 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _748 * _748;
    float _780 = sqrt(_758);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _784 = _782 != 0;
    float _786 = fma(_776, _776, _768);
    float _788 = fma(_772, _772, _778);
    float _790 = in.m_47.x;
    float _792 = fma(_762, _762, _788);
    float _794 = sqrt(_786);
    float _796 = rsqrt(_792);
    float _798 = -_780;
    float _800 = _794 + _798;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = in.m_43.y;
    float _806 = _780;
    float _808 = _730;
    float _810 = _546;
    if (_766)
    {
        float _812 = in.m_43.x;
        _806 = _812;
    }
    float _814 = _806;
    float _816 = _796 * _800;
    float _818 = -_816;
    float _820 = fma(_762, _818, _754);
    float _822 = -_816;
    float _824 = fma(_772, _822, _736);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _824 + _834;
    float _838 = 1.0 / _828;
    float _840 = -_816;
    float _842 = fma(_748, _840, _730);
    float _844 = _832 * _832;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = fma(_836, _836, _844);
    float _852 = in.m_47.y;
    bool _854 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_522);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = sqrt(_850);
    bool _868 = _804 > 0.5;
    bool _870 = _814 > 0.5;
    bool _872 = _870 && _766;
    float _874 = -_864;
    float _876 = _874 + 1.0;
    float _878 = _848 * _838;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _522 + _880;
    bool _884 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_522);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = fma(_878, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _894 * _876;
    bool _900 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 * _898;
    float _904 = -_852;
    float _906 = _904 + 1.0;
    float _908 = _852;
    float _910 = _820;
    float _912 = _824;
    float _914 = _896;
    float _916 = _906;
    if (_784)
    {
        float _918 = _868 ? _906 : _852;
        _908 = _918;
    }
    float _920 = _908;
    if (!_900)
    {
        _808 = _820;
    }
    float _922 = _808;
    float _924 = _922;
    if (!_900)
    {
        _910 = _842;
    }
    float _926 = _910;
    bool _928 = !_900;
    float _930 = _926;
    if (!_928)
    {
        float _932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _936 = _866 + _934;
        float _938 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _936 * _932;
        float _942 = rsqrt(_850);
        float _944 = _940 * 0.15915493667125701904296875;
        float _946 = _944 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = fma(_948, _938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _942 * _954;
        float _958 = _952 + (-1.0);
        float _960 = fma(_836, _956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _962 = fma(_832, _956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _964 = _958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_842, _952, _964);
        _930 = _966;
        _912 = _960;
        _924 = _962;
        _914 = _964;
    }
    float _968 = _930;
    float _970 = _912;
    float _972 = _924;
    float _974 = _914;
    float _976 = -_600;
    float _978 = _976 + _968;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _982 = -_602;
    float _984 = _982 + _970;
    float _986 = _974;
    if (_766)
    {
        _916 = _790;
    }
    float _988 = _916;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _992 = _978 + _990;
    float _994 = -_894;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1000 = _984 + _998;
    float _1002 = -_604;
    float _1004 = _1002 + _972;
    float _1006 = _992 * _992;
    float _1008 = _988;
    if (_872)
    {
        float _1010 = -_988;
        float _1012 = _1010 + 1.0;
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _902);
    float _1018 = _920 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_1000, _1000, _1006);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1004 + _1022;
    if (!_766)
    {
        _986 = _790;
    }
    float _1026 = _986;
    out.m_49.w = _596;
    float _1028 = _1026;
    if (_766)
    {
        _1028 = _1014;
    }
    float _1030 = _1028;
    float _1032 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1016);
    float _1034 = fma(_1024, _1024, _1020);
    float _1036 = _1018 * _980;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1040 = sqrt(_1034);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1050 = _1038 * _802;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1070 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1072 = isnan(_1040);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1078 = _1074 || _1076;
    float _1080 = -_600;
    float _1082 = _546 + _1080;
    out.m_53.x = _1060;
    out.m_53.y = _1062;
    out.m_53.z = _1064;
    float _1084 = -_602;
    float _1086 = _548 + _1084;
    float _1088 = -_604;
    float _1090 = _550 + _1088;
    out.m_55.x = _1050;
    out.m_55.y = _1036;
    out.m_57.x = _1056;
    out.m_57.y = _1058;
    out.m_57.z = _1066;
    out.m_57.w = _1068;
    if (!_1078)
    {
        _810 = 1.0;
    }
    float _1092 = _810;
    out.m_59.x = _662;
    bool _1094 = !_1078;
    float _1096 = _1092;
    if (!_1094)
    {
        bool _1098 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1100 = isnan(_1040);
        bool _1102 = _1098 || _1100;
        bool _1104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1106 = _1102 || _1104;
        if (!_1106)
        {
            float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1110 = _1040 + _1108;
            float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1114 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1118 = _1116 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1120 = 1.0 / _1114;
            float _1122 = _1110 * _1120;
            float _1124 = fma(_1122, _1118, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1096 = _1124;
            _1126 = true;
        }
        else
        {
            bool _1128 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1130 = isnan(_1040);
            bool _1132 = _1128 || _1130;
            bool _1134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1136 = _1132 || _1134;
            if (!_1136)
            {
                float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1140 = _1040 + _1138;
                float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1144 = _1142 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1148 = _1146 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1150 = 1.0 / _1144;
                float _1152 = _1140 * _1150;
                float _1154 = fma(_1152, _1148, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1096 = _1154;
                _1126 = true;
            }
            else
            {
                _1096 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1126 = false;
    float _1156 = _1096;
    float _1158 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1162 = _978 + _1160;
    out.m_61.x = _1086;
    out.m_61.y = _1082;
    out.m_61.z = _1090;
    float _1164 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1166 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1168 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1172 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1168);
    float _1174 = 1.0 / _1170;
    float _1176 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1172);
    bool _1178 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.5);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1190 = _984 + _1188;
    float _1192 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1196 = _1004 + _1194;
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1200 = fma(_1190, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = fma(_1196, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1208 = _1198 + _1170;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1212 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1206);
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = _1208 * _1174;
    float _1220 = _1218 * 0.5;
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1212);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1238 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1236);
    float _1248 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1230;
    if (_1186)
    {
        _1256 = 1.0;
    }
    float _1258 = _1256;
    float _1260 = _1258;
    if (!_1186)
    {
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
        float _1268 = _1262 * 0.15915493667125701904296875;
        float _1270 = _1268 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1276 = _1274 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1272;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1266;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = _1286 * _1288;
        float _1298 = _1276 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = 1.0 / _1296;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1306 = _1290 * _1304;
        float _1308 = 1.0 / _1294;
        float _1310 = _1300 * _1302;
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1314 = fma(_1310, _1306, _1312);
        float _1316 = _1314 * _1308;
        float _1318 = precise::clamp(_1316, 0.0, 1.0);
        float _1320 = -_1318;
        float _1322 = _1320 + 1.0;
        _1260 = _1322;
    }
    float _1324 = _1260;
    float _1326 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1246);
    float _1330 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1332 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1334 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    bool _1336 = _1324 > 0.0;
    bool _1338 = isnan(_1324);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1352 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1354 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1358 = _1350 + _1352;
    float _1360 = _1354 + _1352;
    float _1362 = _1352 * 0.5;
    float _1364 = _1358 * 0.5;
    float _1366 = _1360 * 0.5;
    float _1368 = fma(_1348, -0.5, _1362);
    out.m_63.x = _1200;
    out.m_63.y = _1192;
    out.m_63.z = _1204;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1354;
    out.gl_Position.w = _1352;
    out.m_37.x = _1356;
    out.m_65.x = _1364;
    out.m_65.y = _1368;
    out.m_65.z = _1366;
    out.m_65.w = _1352;
    if (_1344)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1370;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1126 = false;
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
        float _1427 = as_type<float>(_100);
        out.gl_Position.z = _1427;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1496 = as_type<float>(_136);
        out.gl_Position.z = _1496;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
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
    float _524 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _530 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _534 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
    float _538 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _540 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _542 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _554 = _546 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _548 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _562 = _550 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _564;
    float _568 = _554 * _554;
    float _570 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _572 = _566 * _566;
    float _574 = fma(_558, _558, _568);
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _578 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _576;
    float _580 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_562, _562, _574);
    float _584 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = sqrt(_582);
    float _590 = fma(_586, -0.64999997615814208984375, 1.0);
    float _592 = rsqrt(_582);
    float _594 = _588 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _596 = precise::min(_538, _594);
    float _598 = _592 * _596;
    float _600 = _554 * _598;
    float _602 = _558 * _598;
    float _604 = _562 * _598;
    float _606 = -_600;
    float _608 = _554 + _606;
    float _610 = -_602;
    float _612 = _558 + _610;
    float _614 = -_604;
    float _616 = _562 + _614;
    float _618 = _608 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _620;
    float _624 = fma(_612, _612, _618);
    float _626 = fma(_622, _622, _572);
    float _628 = fma(_616, _616, _624);
    float _630 = fma(_578, _578, _626);
    float _632 = in.m_45.x;
    float _634 = in.m_45.y;
    float _636 = in.m_45.z;
    float _638 = rsqrt(_630);
    float _640 = sqrt(_628);
    float _642 = sqrt(_630);
    float _644 = _638 * (-0.20000000298023223876953125);
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _634);
    float _648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _632);
    float _650 = fma(_622, _644, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _652 = _592 * _640;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _636);
    float _656 = fma(_566, _644, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _658 = fma(_578, _644, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _660 = _570 * _652;
    float _662 = _530 * _652;
    float _664 = _580 * _652;
    float _666 = _660 * _646;
    float _668 = _662 * _648;
    float _670 = _664 * _654;
    float _672 = _642 * 0.066666670143604278564453125;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _680 = -_656;
    float _682 = _680 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
    float _690 = precise::max(_672, 1.0);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
    float _698 = precise::min(_690, 2.0);
    float _700 = _692 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _702 = _694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _704 = -_650;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _682 * _682;
    float _710 = _546 + _700;
    float _712 = _698 * _590;
    float _714 = _548 + _702;
    float _716 = _696 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = _710 + _718;
    float _722 = fma(_706, _706, _708);
    float _724 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _726 = _714 + _724;
    float _728 = _550 + _716;
    float _730 = fma(_720, _712, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _732 = -_658;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = fma(_726, _712, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _738 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _740 = _728 + _738;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = _656 + _746;
    float _750 = -_736;
    float _752 = _750 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = fma(_740, _712, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _756 = _744 * _744;
    float _758 = fma(_734, _734, _722);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _658 + _760;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _766 = _764 != 0;
    float _768 = fma(_752, _752, _756);
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _650 + _770;
    float _774 = -_754;
    float _776 = _774 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _748 * _748;
    float _780 = sqrt(_758);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _784 = _782 != 0;
    float _786 = fma(_776, _776, _768);
    float _788 = fma(_772, _772, _778);
    float _790 = in.m_47.x;
    float _792 = fma(_762, _762, _788);
    float _794 = sqrt(_786);
    float _796 = rsqrt(_792);
    float _798 = -_780;
    float _800 = _794 + _798;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = in.m_43.y;
    float _806 = _780;
    float _808 = _730;
    float _810 = _546;
    if (_766)
    {
        float _812 = in.m_43.x;
        _806 = _812;
    }
    float _814 = _806;
    float _816 = _796 * _800;
    float _818 = -_816;
    float _820 = fma(_762, _818, _754);
    float _822 = -_816;
    float _824 = fma(_772, _822, _736);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _824 + _834;
    float _838 = 1.0 / _828;
    float _840 = -_816;
    float _842 = fma(_748, _840, _730);
    float _844 = _832 * _832;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = fma(_836, _836, _844);
    float _852 = in.m_47.y;
    bool _854 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_522);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = sqrt(_850);
    bool _868 = _804 > 0.5;
    bool _870 = _814 > 0.5;
    bool _872 = _870 && _766;
    float _874 = -_864;
    float _876 = _874 + 1.0;
    float _878 = _848 * _838;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _522 + _880;
    bool _884 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_522);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = fma(_878, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _894 * _876;
    bool _900 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 * _898;
    float _904 = -_852;
    float _906 = _904 + 1.0;
    float _908 = _852;
    float _910 = _820;
    float _912 = _824;
    float _914 = _896;
    float _916 = _906;
    if (_784)
    {
        float _918 = _868 ? _906 : _852;
        _908 = _918;
    }
    float _920 = _908;
    if (!_900)
    {
        _808 = _820;
    }
    float _922 = _808;
    float _924 = _922;
    if (!_900)
    {
        _910 = _842;
    }
    float _926 = _910;
    bool _928 = !_900;
    float _930 = _926;
    if (!_928)
    {
        float _932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _936 = _866 + _934;
        float _938 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _936 * _932;
        float _942 = rsqrt(_850);
        float _944 = _940 * 0.15915493667125701904296875;
        float _946 = _944 * 6.283185482025146484375;
        float _948 = sin(_946);
        float _950 = _944 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = fma(_948, _938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _942 * _954;
        float _958 = _952 + (-1.0);
        float _960 = fma(_836, _956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _962 = fma(_832, _956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _964 = _958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = fma(_842, _952, _964);
        _930 = _966;
        _912 = _960;
        _924 = _962;
        _914 = _964;
    }
    float _968 = _930;
    float _970 = _912;
    float _972 = _924;
    float _974 = _914;
    float _976 = -_600;
    float _978 = _976 + _968;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _982 = -_602;
    float _984 = _982 + _970;
    float _986 = _974;
    if (_766)
    {
        _916 = _790;
    }
    float _988 = _916;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _992 = _978 + _990;
    float _994 = -_894;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1000 = _984 + _998;
    float _1002 = -_604;
    float _1004 = _1002 + _972;
    float _1006 = _992 * _992;
    float _1008 = _988;
    if (_872)
    {
        float _1010 = -_988;
        float _1012 = _1010 + 1.0;
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _902);
    float _1018 = _920 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_1000, _1000, _1006);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1004 + _1022;
    if (!_766)
    {
        _986 = _790;
    }
    float _1026 = _986;
    out.m_49.w = _596;
    float _1028 = _1026;
    if (_766)
    {
        _1028 = _1014;
    }
    float _1030 = _1028;
    float _1032 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1016);
    float _1034 = fma(_1024, _1024, _1020);
    float _1036 = _1018 * _980;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1040 = sqrt(_1034);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1050 = _1038 * _802;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1070 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1072 = isnan(_1040);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1078 = _1074 || _1076;
    float _1080 = -_600;
    float _1082 = _546 + _1080;
    out.m_53.x = _1060;
    out.m_53.y = _1062;
    out.m_53.z = _1064;
    float _1084 = -_602;
    float _1086 = _548 + _1084;
    float _1088 = -_604;
    float _1090 = _550 + _1088;
    out.m_55.x = _1050;
    out.m_55.y = _1036;
    out.m_57.x = _1056;
    out.m_57.y = _1058;
    out.m_57.z = _1066;
    out.m_57.w = _1068;
    if (!_1078)
    {
        _810 = 1.0;
    }
    float _1092 = _810;
    out.m_59.x = _662;
    bool _1094 = !_1078;
    float _1096 = _1092;
    if (!_1094)
    {
        bool _1098 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1100 = isnan(_1040);
        bool _1102 = _1098 || _1100;
        bool _1104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1106 = _1102 || _1104;
        if (!_1106)
        {
            float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1110 = _1040 + _1108;
            float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1114 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1118 = _1116 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1120 = 1.0 / _1114;
            float _1122 = _1110 * _1120;
            float _1124 = fma(_1122, _1118, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1096 = _1124;
            _1126 = true;
        }
        else
        {
            bool _1128 = _1040 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1130 = isnan(_1040);
            bool _1132 = _1128 || _1130;
            bool _1134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1136 = _1132 || _1134;
            if (!_1136)
            {
                float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1140 = _1040 + _1138;
                float _1142 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1144 = _1142 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1148 = _1146 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1150 = 1.0 / _1144;
                float _1152 = _1140 * _1150;
                float _1154 = fma(_1152, _1148, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1096 = _1154;
                _1126 = true;
            }
            else
            {
                _1096 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1126 = false;
    float _1156 = _1096;
    float _1158 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1162 = _978 + _1160;
    out.m_61.x = _1086;
    out.m_61.y = _1082;
    out.m_61.z = _1090;
    float _1164 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1166 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1168 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1172 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1168);
    float _1174 = 1.0 / _1170;
    float _1176 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1172);
    bool _1178 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.5);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1190 = _984 + _1188;
    float _1192 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1196 = _1004 + _1194;
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1200 = fma(_1190, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1202 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = fma(_1196, _1156, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1208 = _1198 + _1170;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1212 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1214 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1206);
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1210);
    float _1218 = _1208 * _1174;
    float _1220 = _1218 * 0.5;
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1214);
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1228 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1212);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1238 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1236);
    float _1248 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1230;
    if (_1186)
    {
        _1256 = 1.0;
    }
    float _1258 = _1256;
    float _1260 = _1258;
    if (!_1186)
    {
        float _1262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
        float _1268 = _1262 * 0.15915493667125701904296875;
        float _1270 = _1268 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1276 = _1274 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1272;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1266;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1292;
        float _1296 = _1286 * _1288;
        float _1298 = _1276 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = 1.0 / _1296;
        float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1306 = _1290 * _1304;
        float _1308 = 1.0 / _1294;
        float _1310 = _1300 * _1302;
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1314 = fma(_1310, _1306, _1312);
        float _1316 = _1314 * _1308;
        float _1318 = precise::clamp(_1316, 0.0, 1.0);
        float _1320 = -_1318;
        float _1322 = _1320 + 1.0;
        _1260 = _1322;
    }
    float _1324 = _1260;
    float _1326 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1246);
    float _1330 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1332 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1248);
    float _1334 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    bool _1336 = _1324 > 0.0;
    bool _1338 = isnan(_1324);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1352 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1354 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1358 = _1350 + _1352;
    float _1360 = _1354 + _1352;
    float _1362 = _1352 * 0.5;
    float _1364 = _1358 * 0.5;
    float _1366 = _1360 * 0.5;
    float _1368 = fma(_1348, -0.5, _1362);
    out.m_63.x = _1200;
    out.m_63.y = _1192;
    out.m_63.z = _1204;
    out.gl_Position.x = _1350;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1354;
    out.gl_Position.w = _1352;
    out.m_37.x = _1356;
    out.m_65.x = _1364;
    out.m_65.y = _1368;
    out.m_65.z = _1366;
    out.m_65.w = _1352;
    if (_1344)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1370;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

