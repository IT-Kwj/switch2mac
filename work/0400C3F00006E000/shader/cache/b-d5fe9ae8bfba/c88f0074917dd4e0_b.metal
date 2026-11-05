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
    float4 m_49 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_51 [[user(locn6)]];
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    bool _732 = false;
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
        float _1651 = as_type<float>(_100);
        out.gl_Position.z = _1651;
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
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1719 = as_type<float>(_136);
        out.gl_Position.z = _1719;
    }
    if (_130)
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
        float _196 = exp2(_194);
        float _198 = _192 * 0.693147182464599609375;
        float _200 = 1.0 / _198;
        float _202 = 1.0 / _190;
        float _204 = _196 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _200, _140);
        float _210 = _208 * _202;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _288 + _310;
    float _314 = 1.0 / _304;
    bool _316 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_288);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -_326;
    float _336 = _334 + 1.0;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _340 = 1.0 / _308;
    float _342 = _296 * _314;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _354 * _336;
    float _358 = _292 * _328;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_354;
    float _370 = _368 + 1.0;
    float _372 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = _312 * _340;
    bool _382 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _384 = isnan(_288);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _396 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _398 = isnan(_288);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = -_392;
    float _418 = _416 + 1.0;
    float _420 = _392 * _370;
    float _422 = fma(_410, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_414, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _406 * _418;
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_406;
    float _438 = _436 + 1.0;
    float _440 = _374 * _428;
    float _442 = _394 * _428;
    float _444 = _372 * _428;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_422, _420, _454);
    float _470 = fma(_424, _420, _456);
    float _472 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_426, _420, _462);
    float _476 = fma(_464, _356, _468);
    float _478 = fma(_466, _356, _470);
    float _480 = fma(_472, _356, _474);
    float _482 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_338;
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
    bool _544 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_522);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_538;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _560;
    float _564 = 1.0 / _542;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _568 = _554 * _558;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _526 * _564;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _576;
    float _580 = fma(_562, _574, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = fma(_578, _574, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _588 = _580 * _568;
    float _590 = fma(_584, _574, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _586 * _568;
    float _594 = _590 * _568;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _588);
    float _598 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _600 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _592);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _596);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _598);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _600);
    bool _608 = !_566;
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
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _680 = 1.0 / _652;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = _668 * _680;
    float _690 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _672, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = _692 * _682;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[116].x, _700);
    float _710 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _712 = !_678;
    float _730;
    if (!_712)
    {
        float _714 = in.m_43.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_84);
        float _736 = 1.0 / _734;
        float _738 = _118 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _752 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _750);
    float _758 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _760 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _762 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _764 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _766 + _780;
    float _784 = _774 * _774;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _786;
    float _790 = _770 * _770;
    float _792 = fma(_778, _778, _784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _794;
    float _798 = fma(_788, _788, _790);
    float _800 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(_782, _782, _792);
    float _804 = _748 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _806 = fma(_796, _796, _798);
    float _808 = sqrt(_802);
    float _810 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = rsqrt(_802);
    float _814 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = sqrt(_806);
    float _818 = precise::min(_804, _814);
    float _820 = rsqrt(_806);
    float _822 = _812 * _818;
    float _824 = _774 * _822;
    float _826 = _778 * _822;
    float _828 = _816 * 0.066666670143604278564453125;
    float _830 = -_824;
    float _832 = _774 + _830;
    float _834 = -_826;
    float _836 = _778 + _834;
    float _838 = _832 * _832;
    float _840 = _782 * _822;
    float _842 = precise::max(_828, 1.0);
    float _844 = _820 * (-0.20000000298023223876953125);
    float _846 = fma(_836, _836, _838);
    float _848 = -_840;
    float _850 = _782 + _848;
    float _852 = precise::min(_842, 2.0);
    float _854 = fma(_796, _844, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _856 = fma(_850, _850, _846);
    float _858 = in.m_45.x;
    float _860 = in.m_45.y;
    float _862 = in.m_45.z;
    float _864 = sqrt(_856);
    float _866 = _812 * _864;
    float _868 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _876 = _800 * _866;
    float _878 = _748 * _866;
    float _880 = fma(_870, -0.64999997615814208984375, 1.0);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _876 * _874;
    float _886 = _810 * _866;
    float _888 = _878 * _872;
    float _890 = fma(_770, _844, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _894 = _886 * _882;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _898 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
    float _902 = fma(_788, _844, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _904 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
    float _910 = _852 * _880;
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _904);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = -_890;
    float _920 = _918 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _924 = _914 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _926 = _762 + _916;
    float _928 = -_902;
    float _930 = _928 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _764 + _922;
    float _934 = _920 * _920;
    float _936 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _938 = _926 + _936;
    float _940 = _766 + _924;
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = _932 + _942;
    float _946 = fma(_930, _930, _934);
    float _948 = fma(_938, _910, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _952 = _940 + _950;
    float _954 = fma(_944, _910, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _890 + _956;
    float _960 = -_948;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = fma(_952, _910, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _966 = -_954;
    float _968 = _966 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = -_854;
    float _972 = _970 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _974 = _962 * _962;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _902 + _976;
    float _980 = _958 * _958;
    float _982 = fma(_972, _972, _946);
    float _984 = fma(_968, _968, _974);
    float _986 = -_964;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _854 + _990;
    float _994 = fma(_978, _978, _980);
    float _996 = fma(_988, _988, _984);
    float _998 = sqrt(_982);
    float _1000 = fma(_992, _992, _994);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_47.y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = sqrt(_996);
    float _1016 = in.m_47.x;
    float _1018 = rsqrt(_1000);
    float _1020 = -_998;
    float _1022 = _1014 + _1020;
    float _1024 = _998;
    float _1026 = _1006;
    float _1028 = _1016;
    float _1030 = _948;
    float _1032 = _958;
    float _1034 = _766;
    if (_1004)
    {
        float _1036 = in.m_43.x;
        _1024 = _1036;
    }
    float _1038 = _1024;
    bool _1040 = _1012 > 0.5;
    float _1042 = _1018 * _1022;
    bool _1044 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1046 = isnan(_740);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1042;
    float _1058 = fma(_992, _1056, _964);
    float _1060 = -_1042;
    float _1062 = fma(_978, _1060, _954);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -_1006;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1074 = _1058 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1062 + _1076;
    float _1080 = -_1042;
    float _1082 = fma(_958, _1080, _948);
    float _1084 = 1.0 / _1066;
    float _1086 = _1074 * _1074;
    if (_1010)
    {
        float _1088 = _1040 ? _1070 : _1006;
        _1026 = _1088;
    }
    float _1090 = _1026;
    float _1092 = fma(_1078, _1078, _1086);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1096 = _740 + _1094;
    bool _1098 = _1038 > 0.5;
    bool _1100 = _1098 && _1004;
    float _1102 = sqrt(_1092);
    float _1104 = _1096 * _1084;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1122;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1132;
    float _1136 = fma(_1124, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1138 = _1054 * _1128;
    float _1140 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1142 = fma(_1134, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1146 = _1136 * _1138;
    float _1148 = _1140 * _1138;
    float _1150 = _1142 * _1138;
    float _1152 = _1140;
    float _1154 = _1142;
    if (!_1004)
    {
        _1152 = _1016;
    }
    float _1156 = _1152;
    float _1158 = _1156;
    if (_1100)
    {
        float _1160 = -_1016;
        float _1162 = _1160 + 1.0;
        _1028 = _1162;
    }
    float _1164 = _1028;
    if (!_1130)
    {
        _1154 = _1062;
    }
    float _1166 = _1154;
    float _1168 = _1166;
    if (!_1130)
    {
        _1030 = _1058;
    }
    float _1170 = _1030;
    float _1172 = _1170;
    if (!_1130)
    {
        _1032 = _1082;
    }
    float _1174 = _1032;
    bool _1176 = !_1130;
    float _1178 = _1174;
    if (!_1176)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1184 = _1102 + _1182;
        float _1186 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = rsqrt(_1092);
        float _1190 = _1184 * _1180;
        float _1192 = _1190 * 0.15915493667125701904296875;
        float _1194 = _1192 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1192 * 6.283185482025146484375;
        float _1200 = sin(_1198);
        float _1202 = _1196 + (-1.0);
        float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = fma(_1200, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1208 = fma(_1082, _1196, _1204);
        float _1210 = _1188 * _1206;
        float _1212 = fma(_1078, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1214 = fma(_1074, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1208;
        _1168 = _1212;
        _1172 = _1214;
    }
    float _1216 = _1178;
    float _1218 = _1168;
    float _1220 = _1172;
    float _1222 = -_824;
    float _1224 = _1222 + _1216;
    float _1226 = -_1054;
    float _1228 = _1226 + 1.0;
    float _1230 = -_826;
    float _1232 = _1230 + _1218;
    if (_1004)
    {
        _1158 = _1164;
    }
    float _1234 = _1158;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1238 = _1224 + _1236;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1232 + _1242;
    float _1246 = -_840;
    float _1248 = _1246 + _1220;
    float _1250 = _1238 * _1238;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1254 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1146);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1248 + _1256;
    float _1260 = fma(_1244, _1244, _1250);
    float _1262 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1150);
    float _1264 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1240);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1254);
    float _1268 = fma(_1258, _1258, _1260);
    float _1270 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1262);
    float _1272 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1276 = sqrt(_1268);
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1284 = _1272 * _1144;
    float _1286 = _1278 * _1252;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.x = _702;
    out.m_49.y = _704;
    out.m_49.z = _706;
    out.m_49.w = _710;
    float _1294 = -_840;
    float _1296 = _766 + _1294;
    float _1298 = -_826;
    float _1300 = _764 + _1298;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1302 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1304 = isnan(_1276);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1310 = _1306 || _1308;
    float _1312 = -_824;
    float _1314 = _762 + _1312;
    out.m_53.x = _1286;
    out.m_53.y = _1284;
    out.m_55.x = _1288;
    out.m_55.y = _1290;
    out.m_55.z = _1292;
    out.m_57.w = _818;
    if (!_1310)
    {
        _1034 = 1.0;
    }
    float _1316 = _1034;
    out.m_59.x = _878;
    bool _1318 = !_1310;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1276);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1276 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1276);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1276 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1386 = _1232 + _1384;
    float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1390 = _1248 + _1388;
    out.m_61.x = _1300;
    out.m_61.y = _1314;
    out.m_61.z = _1296;
    float _1392 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1396 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1400 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1404 = _1224 + _1402;
    float _1406 = 1.0 / _1398;
    float _1408 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1400);
    float _1410 = fma(_1404, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1412 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.5);
    bool _1420 = _1416 || _1418;
    float _1422 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1430 = _1424 + _1398;
    float _1432 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1428);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    float _1442 = _1430 * _1406;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1436);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1438);
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1460 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1456);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1460);
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1464);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1480 = _1458;
    if (_1420)
    {
        _1480 = 1.0;
    }
    float _1482 = _1480;
    float _1484 = _1482;
    if (!_1420)
    {
        float _1486 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
        float _1492 = _1486 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1492 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = 1.0 / _1496;
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1490;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = _1510 * _1512;
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1520;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1530 = _1514 * _1528;
        float _1532 = 1.0 / _1518;
        float _1534 = _1524 * _1526;
        float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1538 = fma(_1534, _1530, _1536);
        float _1540 = _1538 * _1532;
        float _1542 = precise::clamp(_1540, 0.0, 1.0);
        float _1544 = -_1542;
        float _1546 = _1544 + 1.0;
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1472);
    float _1554 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1470);
    float _1556 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1558 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    bool _1560 = _1548 > 0.0;
    bool _1562 = isnan(_1548);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    float _1570 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1572 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1574 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1554);
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1578 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1556);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1582 = _1574 + _1576;
    float _1584 = _1578 + _1576;
    float _1586 = _1576 * 0.5;
    float _1588 = _1582 * 0.5;
    float _1590 = _1584 * 0.5;
    float _1592 = fma(_1572, -0.5, _1586);
    out.m_63.x = _1422;
    out.m_63.y = _1410;
    out.m_63.z = _1432;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _1578;
    out.gl_Position.w = _1576;
    out.m_37.x = _1580;
    out.m_65.x = _1588;
    out.m_65.y = _1592;
    out.m_65.z = _1590;
    out.m_65.w = _1576;
    if (_1568)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1594;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    bool _732 = false;
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
        float _1651 = as_type<float>(_100);
        out.gl_Position.z = _1651;
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
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1719 = as_type<float>(_136);
        out.gl_Position.z = _1719;
    }
    if (_130)
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
        float _196 = exp2(_194);
        float _198 = _192 * 0.693147182464599609375;
        float _200 = 1.0 / _198;
        float _202 = 1.0 / _190;
        float _204 = _196 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _200, _140);
        float _210 = _208 * _202;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _288 + _310;
    float _314 = 1.0 / _304;
    bool _316 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_288);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -_326;
    float _336 = _334 + 1.0;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _340 = 1.0 / _308;
    float _342 = _296 * _314;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _354 * _336;
    float _358 = _292 * _328;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_354;
    float _370 = _368 + 1.0;
    float _372 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = _312 * _340;
    bool _382 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _384 = isnan(_288);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _396 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _398 = isnan(_288);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = -_392;
    float _418 = _416 + 1.0;
    float _420 = _392 * _370;
    float _422 = fma(_410, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_414, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _406 * _418;
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_406;
    float _438 = _436 + 1.0;
    float _440 = _374 * _428;
    float _442 = _394 * _428;
    float _444 = _372 * _428;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_422, _420, _454);
    float _470 = fma(_424, _420, _456);
    float _472 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_426, _420, _462);
    float _476 = fma(_464, _356, _468);
    float _478 = fma(_466, _356, _470);
    float _480 = fma(_472, _356, _474);
    float _482 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_338;
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
    bool _544 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_522);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_538;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _560;
    float _564 = 1.0 / _542;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _568 = _554 * _558;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _526 * _564;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _576;
    float _580 = fma(_562, _574, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = fma(_578, _574, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _588 = _580 * _568;
    float _590 = fma(_584, _574, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _586 * _568;
    float _594 = _590 * _568;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _588);
    float _598 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _600 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _592);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _596);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _598);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _600);
    bool _608 = !_566;
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
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _680 = 1.0 / _652;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = _668 * _680;
    float _690 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _672, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = _692 * _682;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[116].x, _700);
    float _710 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _712 = !_678;
    float _730;
    if (!_712)
    {
        float _714 = in.m_43.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_84);
        float _736 = 1.0 / _734;
        float _738 = _118 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _752 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _750);
    float _758 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _760 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _762 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _764 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _766 + _780;
    float _784 = _774 * _774;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _786;
    float _790 = _770 * _770;
    float _792 = fma(_778, _778, _784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _794;
    float _798 = fma(_788, _788, _790);
    float _800 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(_782, _782, _792);
    float _804 = _748 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _806 = fma(_796, _796, _798);
    float _808 = sqrt(_802);
    float _810 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = rsqrt(_802);
    float _814 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = sqrt(_806);
    float _818 = precise::min(_804, _814);
    float _820 = rsqrt(_806);
    float _822 = _812 * _818;
    float _824 = _774 * _822;
    float _826 = _778 * _822;
    float _828 = _816 * 0.066666670143604278564453125;
    float _830 = -_824;
    float _832 = _774 + _830;
    float _834 = -_826;
    float _836 = _778 + _834;
    float _838 = _832 * _832;
    float _840 = _782 * _822;
    float _842 = precise::max(_828, 1.0);
    float _844 = _820 * (-0.20000000298023223876953125);
    float _846 = fma(_836, _836, _838);
    float _848 = -_840;
    float _850 = _782 + _848;
    float _852 = precise::min(_842, 2.0);
    float _854 = fma(_796, _844, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _856 = fma(_850, _850, _846);
    float _858 = in.m_45.x;
    float _860 = in.m_45.y;
    float _862 = in.m_45.z;
    float _864 = sqrt(_856);
    float _866 = _812 * _864;
    float _868 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _876 = _800 * _866;
    float _878 = _748 * _866;
    float _880 = fma(_870, -0.64999997615814208984375, 1.0);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _876 * _874;
    float _886 = _810 * _866;
    float _888 = _878 * _872;
    float _890 = fma(_770, _844, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _894 = _886 * _882;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _898 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
    float _902 = fma(_788, _844, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _904 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
    float _910 = _852 * _880;
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _904);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = -_890;
    float _920 = _918 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _924 = _914 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _926 = _762 + _916;
    float _928 = -_902;
    float _930 = _928 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _764 + _922;
    float _934 = _920 * _920;
    float _936 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _938 = _926 + _936;
    float _940 = _766 + _924;
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = _932 + _942;
    float _946 = fma(_930, _930, _934);
    float _948 = fma(_938, _910, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _952 = _940 + _950;
    float _954 = fma(_944, _910, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _890 + _956;
    float _960 = -_948;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = fma(_952, _910, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _966 = -_954;
    float _968 = _966 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = -_854;
    float _972 = _970 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _974 = _962 * _962;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _902 + _976;
    float _980 = _958 * _958;
    float _982 = fma(_972, _972, _946);
    float _984 = fma(_968, _968, _974);
    float _986 = -_964;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _854 + _990;
    float _994 = fma(_978, _978, _980);
    float _996 = fma(_988, _988, _984);
    float _998 = sqrt(_982);
    float _1000 = fma(_992, _992, _994);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_47.y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = sqrt(_996);
    float _1016 = in.m_47.x;
    float _1018 = rsqrt(_1000);
    float _1020 = -_998;
    float _1022 = _1014 + _1020;
    float _1024 = _998;
    float _1026 = _1006;
    float _1028 = _1016;
    float _1030 = _948;
    float _1032 = _958;
    float _1034 = _766;
    if (_1004)
    {
        float _1036 = in.m_43.x;
        _1024 = _1036;
    }
    float _1038 = _1024;
    bool _1040 = _1012 > 0.5;
    float _1042 = _1018 * _1022;
    bool _1044 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1046 = isnan(_740);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1042;
    float _1058 = fma(_992, _1056, _964);
    float _1060 = -_1042;
    float _1062 = fma(_978, _1060, _954);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -_1006;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1074 = _1058 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1062 + _1076;
    float _1080 = -_1042;
    float _1082 = fma(_958, _1080, _948);
    float _1084 = 1.0 / _1066;
    float _1086 = _1074 * _1074;
    if (_1010)
    {
        float _1088 = _1040 ? _1070 : _1006;
        _1026 = _1088;
    }
    float _1090 = _1026;
    float _1092 = fma(_1078, _1078, _1086);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1096 = _740 + _1094;
    bool _1098 = _1038 > 0.5;
    bool _1100 = _1098 && _1004;
    float _1102 = sqrt(_1092);
    float _1104 = _1096 * _1084;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1122;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1132;
    float _1136 = fma(_1124, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1138 = _1054 * _1128;
    float _1140 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1142 = fma(_1134, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1146 = _1136 * _1138;
    float _1148 = _1140 * _1138;
    float _1150 = _1142 * _1138;
    float _1152 = _1140;
    float _1154 = _1142;
    if (!_1004)
    {
        _1152 = _1016;
    }
    float _1156 = _1152;
    float _1158 = _1156;
    if (_1100)
    {
        float _1160 = -_1016;
        float _1162 = _1160 + 1.0;
        _1028 = _1162;
    }
    float _1164 = _1028;
    if (!_1130)
    {
        _1154 = _1062;
    }
    float _1166 = _1154;
    float _1168 = _1166;
    if (!_1130)
    {
        _1030 = _1058;
    }
    float _1170 = _1030;
    float _1172 = _1170;
    if (!_1130)
    {
        _1032 = _1082;
    }
    float _1174 = _1032;
    bool _1176 = !_1130;
    float _1178 = _1174;
    if (!_1176)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1184 = _1102 + _1182;
        float _1186 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = rsqrt(_1092);
        float _1190 = _1184 * _1180;
        float _1192 = _1190 * 0.15915493667125701904296875;
        float _1194 = _1192 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1192 * 6.283185482025146484375;
        float _1200 = sin(_1198);
        float _1202 = _1196 + (-1.0);
        float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = fma(_1200, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1208 = fma(_1082, _1196, _1204);
        float _1210 = _1188 * _1206;
        float _1212 = fma(_1078, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1214 = fma(_1074, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1208;
        _1168 = _1212;
        _1172 = _1214;
    }
    float _1216 = _1178;
    float _1218 = _1168;
    float _1220 = _1172;
    float _1222 = -_824;
    float _1224 = _1222 + _1216;
    float _1226 = -_1054;
    float _1228 = _1226 + 1.0;
    float _1230 = -_826;
    float _1232 = _1230 + _1218;
    if (_1004)
    {
        _1158 = _1164;
    }
    float _1234 = _1158;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1238 = _1224 + _1236;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1232 + _1242;
    float _1246 = -_840;
    float _1248 = _1246 + _1220;
    float _1250 = _1238 * _1238;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1254 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1146);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1248 + _1256;
    float _1260 = fma(_1244, _1244, _1250);
    float _1262 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1150);
    float _1264 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1240);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1254);
    float _1268 = fma(_1258, _1258, _1260);
    float _1270 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1262);
    float _1272 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1276 = sqrt(_1268);
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1284 = _1272 * _1144;
    float _1286 = _1278 * _1252;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.x = _702;
    out.m_49.y = _704;
    out.m_49.z = _706;
    out.m_49.w = _710;
    float _1294 = -_840;
    float _1296 = _766 + _1294;
    float _1298 = -_826;
    float _1300 = _764 + _1298;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1302 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1304 = isnan(_1276);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1310 = _1306 || _1308;
    float _1312 = -_824;
    float _1314 = _762 + _1312;
    out.m_53.x = _1286;
    out.m_53.y = _1284;
    out.m_55.x = _1288;
    out.m_55.y = _1290;
    out.m_55.z = _1292;
    out.m_57.w = _818;
    if (!_1310)
    {
        _1034 = 1.0;
    }
    float _1316 = _1034;
    out.m_59.x = _878;
    bool _1318 = !_1310;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1276);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1276 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1276);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1276 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1386 = _1232 + _1384;
    float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1390 = _1248 + _1388;
    out.m_61.x = _1300;
    out.m_61.y = _1314;
    out.m_61.z = _1296;
    float _1392 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1396 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1400 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1404 = _1224 + _1402;
    float _1406 = 1.0 / _1398;
    float _1408 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1400);
    float _1410 = fma(_1404, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1412 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.5);
    bool _1420 = _1416 || _1418;
    float _1422 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1430 = _1424 + _1398;
    float _1432 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1428);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    float _1442 = _1430 * _1406;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1436);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1438);
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1460 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1456);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1460);
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1464);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1480 = _1458;
    if (_1420)
    {
        _1480 = 1.0;
    }
    float _1482 = _1480;
    float _1484 = _1482;
    if (!_1420)
    {
        float _1486 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
        float _1492 = _1486 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1492 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = 1.0 / _1496;
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1490;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = _1510 * _1512;
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1520;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1530 = _1514 * _1528;
        float _1532 = 1.0 / _1518;
        float _1534 = _1524 * _1526;
        float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1538 = fma(_1534, _1530, _1536);
        float _1540 = _1538 * _1532;
        float _1542 = precise::clamp(_1540, 0.0, 1.0);
        float _1544 = -_1542;
        float _1546 = _1544 + 1.0;
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1472);
    float _1554 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1470);
    float _1556 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1558 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    bool _1560 = _1548 > 0.0;
    bool _1562 = isnan(_1548);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    float _1570 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1572 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1574 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1554);
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1578 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1556);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1582 = _1574 + _1576;
    float _1584 = _1578 + _1576;
    float _1586 = _1576 * 0.5;
    float _1588 = _1582 * 0.5;
    float _1590 = _1584 * 0.5;
    float _1592 = fma(_1572, -0.5, _1586);
    out.m_63.x = _1422;
    out.m_63.y = _1410;
    out.m_63.z = _1432;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _1578;
    out.gl_Position.w = _1576;
    out.m_37.x = _1580;
    out.m_65.x = _1588;
    out.m_65.y = _1592;
    out.m_65.z = _1590;
    out.m_65.w = _1576;
    if (_1568)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1594;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    bool _732 = false;
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
        float _1651 = as_type<float>(_100);
        out.gl_Position.z = _1651;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    if (_114)
    {
        float _122 = float(_84);
        _120 = _122;
    }
    float _124 = _120;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    if (_130)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1719 = as_type<float>(_136);
        out.gl_Position.z = _1719;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _196 = exp2(_194);
        float _198 = _192 * 0.693147182464599609375;
        float _200 = 1.0 / _198;
        float _202 = 1.0 / _190;
        float _204 = _196 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _200, _140);
        float _210 = _208 * _202;
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
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _288 + _310;
    float _314 = 1.0 / _304;
    bool _316 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_288);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -_326;
    float _336 = _334 + 1.0;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _340 = 1.0 / _308;
    float _342 = _296 * _314;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _354 * _336;
    float _358 = _292 * _328;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_354;
    float _370 = _368 + 1.0;
    float _372 = fma(_332, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = _312 * _340;
    bool _382 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _384 = isnan(_288);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _396 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _398 = isnan(_288);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = -_392;
    float _418 = _416 + 1.0;
    float _420 = _392 * _370;
    float _422 = fma(_410, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_378, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_414, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _406 * _418;
    float _430 = in.m_41.x;
    float _432 = in.m_41.y;
    float _434 = in.m_41.z;
    float _436 = -_406;
    float _438 = _436 + 1.0;
    float _440 = _374 * _428;
    float _442 = _394 * _428;
    float _444 = _372 * _428;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_422, _420, _454);
    float _470 = fma(_424, _420, _456);
    float _472 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_426, _420, _462);
    float _476 = fma(_464, _356, _468);
    float _478 = fma(_466, _356, _470);
    float _480 = fma(_472, _356, _474);
    float _482 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _430;
    float _490 = _484 * _432;
    float _492 = _486 * _434;
    bool _494 = !_338;
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
    bool _544 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_522);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_538;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _560;
    float _564 = 1.0 / _542;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _568 = _554 * _558;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _526 * _564;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _576;
    float _580 = fma(_562, _574, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = fma(_578, _574, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _588 = _580 * _568;
    float _590 = fma(_584, _574, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _586 * _568;
    float _594 = _590 * _568;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].x, _588);
    float _598 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].y, _594);
    float _600 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[107].z, _592);
    float _602 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].x, _596);
    float _604 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].y, _598);
    float _606 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[108].z, _600);
    bool _608 = !_566;
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
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    bool _678 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _680 = 1.0 / _652;
    float _682 = _664 * _676;
    float _684 = -_664;
    float _686 = _684 + 1.0;
    float _688 = _668 * _680;
    float _690 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _692 = fma(_688, _672, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = _692 * _682;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _702 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[116].x, _700);
    float _710 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _712 = !_678;
    float _730;
    if (!_712)
    {
        float _714 = in.m_43.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_84);
        float _736 = 1.0 / _734;
        float _738 = _118 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _752 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _750);
    float _758 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _760 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _762 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _764 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _766 + _780;
    float _784 = _774 * _774;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _786;
    float _790 = _770 * _770;
    float _792 = fma(_778, _778, _784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _794;
    float _798 = fma(_788, _788, _790);
    float _800 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = fma(_782, _782, _792);
    float _804 = _748 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _806 = fma(_796, _796, _798);
    float _808 = sqrt(_802);
    float _810 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = rsqrt(_802);
    float _814 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _816 = sqrt(_806);
    float _818 = precise::min(_804, _814);
    float _820 = rsqrt(_806);
    float _822 = _812 * _818;
    float _824 = _774 * _822;
    float _826 = _778 * _822;
    float _828 = _816 * 0.066666670143604278564453125;
    float _830 = -_824;
    float _832 = _774 + _830;
    float _834 = -_826;
    float _836 = _778 + _834;
    float _838 = _832 * _832;
    float _840 = _782 * _822;
    float _842 = precise::max(_828, 1.0);
    float _844 = _820 * (-0.20000000298023223876953125);
    float _846 = fma(_836, _836, _838);
    float _848 = -_840;
    float _850 = _782 + _848;
    float _852 = precise::min(_842, 2.0);
    float _854 = fma(_796, _844, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _856 = fma(_850, _850, _846);
    float _858 = in.m_45.x;
    float _860 = in.m_45.y;
    float _862 = in.m_45.z;
    float _864 = sqrt(_856);
    float _866 = _812 * _864;
    float _868 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _876 = _800 * _866;
    float _878 = _748 * _866;
    float _880 = fma(_870, -0.64999997615814208984375, 1.0);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _876 * _874;
    float _886 = _810 * _866;
    float _888 = _878 * _872;
    float _890 = fma(_770, _844, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _894 = _886 * _882;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _898 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
    float _902 = fma(_788, _844, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _904 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
    float _910 = _852 * _880;
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _904);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = -_890;
    float _920 = _918 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _924 = _914 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _926 = _762 + _916;
    float _928 = -_902;
    float _930 = _928 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _764 + _922;
    float _934 = _920 * _920;
    float _936 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _938 = _926 + _936;
    float _940 = _766 + _924;
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = _932 + _942;
    float _946 = fma(_930, _930, _934);
    float _948 = fma(_938, _910, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _952 = _940 + _950;
    float _954 = fma(_944, _910, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _890 + _956;
    float _960 = -_948;
    float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = fma(_952, _910, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _966 = -_954;
    float _968 = _966 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = -_854;
    float _972 = _970 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _974 = _962 * _962;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _902 + _976;
    float _980 = _958 * _958;
    float _982 = fma(_972, _972, _946);
    float _984 = fma(_968, _968, _974);
    float _986 = -_964;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _854 + _990;
    float _994 = fma(_978, _978, _980);
    float _996 = fma(_988, _988, _984);
    float _998 = sqrt(_982);
    float _1000 = fma(_992, _992, _994);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_47.y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = sqrt(_996);
    float _1016 = in.m_47.x;
    float _1018 = rsqrt(_1000);
    float _1020 = -_998;
    float _1022 = _1014 + _1020;
    float _1024 = _998;
    float _1026 = _1006;
    float _1028 = _1016;
    float _1030 = _948;
    float _1032 = _958;
    float _1034 = _766;
    if (_1004)
    {
        float _1036 = in.m_43.x;
        _1024 = _1036;
    }
    float _1038 = _1024;
    bool _1040 = _1012 > 0.5;
    float _1042 = _1018 * _1022;
    bool _1044 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1046 = isnan(_740);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1042;
    float _1058 = fma(_992, _1056, _964);
    float _1060 = -_1042;
    float _1062 = fma(_978, _1060, _954);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -_1006;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1074 = _1058 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1062 + _1076;
    float _1080 = -_1042;
    float _1082 = fma(_958, _1080, _948);
    float _1084 = 1.0 / _1066;
    float _1086 = _1074 * _1074;
    if (_1010)
    {
        float _1088 = _1040 ? _1070 : _1006;
        _1026 = _1088;
    }
    float _1090 = _1026;
    float _1092 = fma(_1078, _1078, _1086);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1096 = _740 + _1094;
    bool _1098 = _1038 > 0.5;
    bool _1100 = _1098 && _1004;
    float _1102 = sqrt(_1092);
    float _1104 = _1096 * _1084;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1122;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1132;
    float _1136 = fma(_1124, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1138 = _1054 * _1128;
    float _1140 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1142 = fma(_1134, _1104, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1146 = _1136 * _1138;
    float _1148 = _1140 * _1138;
    float _1150 = _1142 * _1138;
    float _1152 = _1140;
    float _1154 = _1142;
    if (!_1004)
    {
        _1152 = _1016;
    }
    float _1156 = _1152;
    float _1158 = _1156;
    if (_1100)
    {
        float _1160 = -_1016;
        float _1162 = _1160 + 1.0;
        _1028 = _1162;
    }
    float _1164 = _1028;
    if (!_1130)
    {
        _1154 = _1062;
    }
    float _1166 = _1154;
    float _1168 = _1166;
    if (!_1130)
    {
        _1030 = _1058;
    }
    float _1170 = _1030;
    float _1172 = _1170;
    if (!_1130)
    {
        _1032 = _1082;
    }
    float _1174 = _1032;
    bool _1176 = !_1130;
    float _1178 = _1174;
    if (!_1176)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1184 = _1102 + _1182;
        float _1186 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = rsqrt(_1092);
        float _1190 = _1184 * _1180;
        float _1192 = _1190 * 0.15915493667125701904296875;
        float _1194 = _1192 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1192 * 6.283185482025146484375;
        float _1200 = sin(_1198);
        float _1202 = _1196 + (-1.0);
        float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = fma(_1200, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1208 = fma(_1082, _1196, _1204);
        float _1210 = _1188 * _1206;
        float _1212 = fma(_1078, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1214 = fma(_1074, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1208;
        _1168 = _1212;
        _1172 = _1214;
    }
    float _1216 = _1178;
    float _1218 = _1168;
    float _1220 = _1172;
    float _1222 = -_824;
    float _1224 = _1222 + _1216;
    float _1226 = -_1054;
    float _1228 = _1226 + 1.0;
    float _1230 = -_826;
    float _1232 = _1230 + _1218;
    if (_1004)
    {
        _1158 = _1164;
    }
    float _1234 = _1158;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1238 = _1224 + _1236;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1232 + _1242;
    float _1246 = -_840;
    float _1248 = _1246 + _1220;
    float _1250 = _1238 * _1238;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1254 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1146);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1248 + _1256;
    float _1260 = fma(_1244, _1244, _1250);
    float _1262 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1150);
    float _1264 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1240);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1254);
    float _1268 = fma(_1258, _1258, _1260);
    float _1270 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1262);
    float _1272 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1276 = sqrt(_1268);
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1284 = _1272 * _1144;
    float _1286 = _1278 * _1252;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.x = _702;
    out.m_49.y = _704;
    out.m_49.z = _706;
    out.m_49.w = _710;
    float _1294 = -_840;
    float _1296 = _766 + _1294;
    float _1298 = -_826;
    float _1300 = _764 + _1298;
    out.m_51.x = 1.0;
    out.m_51.y = 1.0;
    out.m_51.z = 1.0;
    bool _1302 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1304 = isnan(_1276);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1310 = _1306 || _1308;
    float _1312 = -_824;
    float _1314 = _762 + _1312;
    out.m_53.x = _1286;
    out.m_53.y = _1284;
    out.m_55.x = _1288;
    out.m_55.y = _1290;
    out.m_55.z = _1292;
    out.m_57.w = _818;
    if (!_1310)
    {
        _1034 = 1.0;
    }
    float _1316 = _1034;
    out.m_59.x = _878;
    bool _1318 = !_1310;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1276);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1276 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1276);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1276 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1386 = _1232 + _1384;
    float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1390 = _1248 + _1388;
    out.m_61.x = _1300;
    out.m_61.y = _1314;
    out.m_61.z = _1296;
    float _1392 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1396 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1400 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1404 = _1224 + _1402;
    float _1406 = 1.0 / _1398;
    float _1408 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1400);
    float _1410 = fma(_1404, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1412 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.5);
    bool _1420 = _1416 || _1418;
    float _1422 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1430 = _1424 + _1398;
    float _1432 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1428);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1434);
    float _1442 = _1430 * _1406;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1436);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1438);
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1460 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1456);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1460);
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1462);
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1464);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1480 = _1458;
    if (_1420)
    {
        _1480 = 1.0;
    }
    float _1482 = _1480;
    float _1484 = _1482;
    if (!_1420)
    {
        float _1486 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1490 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
        float _1492 = _1486 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1500 = _1498 * 0.15915493667125701904296875;
        float _1502 = _1492 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = 1.0 / _1496;
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1504 * _1506;
        float _1514 = 1.0 / _1490;
        float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1518 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1516;
        float _1520 = _1510 * _1512;
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1520;
        float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1530 = _1514 * _1528;
        float _1532 = 1.0 / _1518;
        float _1534 = _1524 * _1526;
        float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1538 = fma(_1534, _1530, _1536);
        float _1540 = _1538 * _1532;
        float _1542 = precise::clamp(_1540, 0.0, 1.0);
        float _1544 = -_1542;
        float _1546 = _1544 + 1.0;
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1472);
    float _1554 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1470);
    float _1556 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1558 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    bool _1560 = _1548 > 0.0;
    bool _1562 = isnan(_1548);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan(0.0);
    bool _1568 = _1564 || _1566;
    float _1570 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1572 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1574 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1554);
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1578 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1556);
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1582 = _1574 + _1576;
    float _1584 = _1578 + _1576;
    float _1586 = _1576 * 0.5;
    float _1588 = _1582 * 0.5;
    float _1590 = _1584 * 0.5;
    float _1592 = fma(_1572, -0.5, _1586);
    out.m_63.x = _1422;
    out.m_63.y = _1410;
    out.m_63.z = _1432;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1572;
    out.gl_Position.z = _1578;
    out.gl_Position.w = _1576;
    out.m_37.x = _1580;
    out.m_65.x = _1588;
    out.m_65.y = _1592;
    out.m_65.z = _1590;
    out.m_65.w = _1576;
    if (_1568)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1594;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

