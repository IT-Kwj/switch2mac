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
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _900 = false;
    bool _758 = false;
    bool _644 = false;
    bool _552 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_84);
        out.gl_Position.z = _1533;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_120);
        out.gl_Position.z = _1602;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _302 = 1.0 / _288;
    bool _304 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _306 = isnan(_272);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _292;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _276 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _272 + _340;
    float _344 = 1.0 / _300;
    float _346 = _280 * _328;
    bool _348 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_272);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _284 * _336;
    float _366 = _342 * _344;
    bool _368 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_272);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _378 * _362;
    float _386 = -_378;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _314 * _388;
    float _402 = -_314;
    float _404 = _402 + 1.0;
    float _406 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _410 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_272);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _326 * _404;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = _420 * _332;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = _406 * _436;
    float _448 = _408 * _436;
    float _450 = _398 * _436;
    float _452 = -_420;
    float _454 = _452 + 1.0;
    float _456 = in.m_33.x;
    float _458 = in.m_33.y;
    float _460 = in.m_33.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _474 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_440, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _482 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = fma(_442, _422, _470);
    float _486 = fma(_444, _422, _472);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _500 = fma(_474, _422, _476);
    float _502 = fma(_490, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _504 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _506 = fma(_480, _400, _486);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _510 = fma(_482, _400, _500);
    float _512 = fma(_478, _400, _484);
    float _514 = fma(_504, _384, _506);
    float _516 = fma(_508, _384, _510);
    float _518 = fma(_502, _384, _512);
    float _520 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _514);
    float _522 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _516);
    float _524 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = _520 * _458;
    float _528 = _522 * _460;
    float _530 = _524 * _456;
    bool _532 = !_334;
    float _550;
    if (!_532)
    {
        float _534 = in.m_35.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_68);
        float _556 = 1.0 / _554;
        float _558 = _102 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _592 * _604;
    float _614 = fma(_612, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _614 * _606;
    float _618 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _616);
    float _620 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _618);
    float _622 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _622;
    bool _624 = !_602;
    float _642;
    if (!_624)
    {
        float _626 = in.m_35.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_68);
        float _648 = 1.0 / _646;
        float _650 = _102 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _652 + _654;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_668;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _690;
    float _694 = 1.0 / _672;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _698 = _684 * _688;
    float _700 = -_684;
    float _702 = _700 + 1.0;
    float _704 = _656 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _706;
    float _710 = fma(_692, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _712;
    float _716 = fma(_708, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _718 = _710 * _698;
    float _720 = fma(_714, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _722 = _716 * _698;
    float _724 = _720 * _698;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].x, _718);
    float _728 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].y, _724);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].z, _722);
    float _732 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].x, _726);
    float _734 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].y, _728);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].z, _730);
    bool _738 = !_696;
    float _756;
    if (!_738)
    {
        float _740 = in.m_35.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_68);
        float _762 = 1.0 / _760;
        float _764 = _102 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _794 = isnan(_766);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _804;
    bool _808 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _810 = isnan(_766);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _774;
    float _822 = -_786;
    float _824 = _822 + 1.0;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _828 = _802 * _824;
    float _830 = -_802;
    float _832 = _830 + 1.0;
    float _834 = 1.0 / _790;
    float _836 = _806 * _820;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _842 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _844 = _840 * _834;
    float _846 = _842 * _828;
    float _848 = -_818;
    float _850 = _848 + 1.0;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _854 = _766 + _852;
    float _856 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[131].x, _846);
    float _860 = _786 * _850;
    float _862 = fma(_844, _854, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _864 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_862, _860, _858);
    float _870 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[133].x, _868);
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _866;
    out.m_39.y = _876;
    out.m_39.z = _872;
    out.m_39.w = _878;
    bool _880 = !_826;
    float _898;
    if (!_880)
    {
        float _882 = in.m_35.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_68);
        float _904 = 1.0 / _902;
        float _906 = _102 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = in.m_41.x;
    float _912 = in.m_41.y;
    float _914 = in.m_41.z;
    float _916 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = in.m_35.x;
    float _922 = in.m_35.y;
    float _924 = in.m_35.z;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _928 = _926 != 0;
    float _930 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _934 = _932 != 0;
    float _936 = in.m_43.y;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _940 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _942 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _944 = in.m_43.x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_928)
    {
        float _952 = in.m_35.x;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _966 = 1.0 / _948;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _970 = _922 > 0.5;
    float _972 = -_936;
    float _974 = _972 + 1.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _984 = _936;
    if (_934)
    {
        float _986 = _970 ? _974 : _936;
        _984 = _986;
    }
    float _988 = _984;
    float _990 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[79].z, _976);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _998 = 1.0 / _958;
    float _1000 = -_968;
    float _1002 = fma(_990, 2.0, _1000);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1004);
    float _1010 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _996;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = fma(_1010, -2.0, _978);
    float _1024 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1028 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _1030 = _1024 * _962;
    float _1032 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1036;
    float _1040 = 1.0 / _982;
    float _1042 = _1034 * _960;
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _940);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1052 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _992);
    float _1054 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1056 = 1.0 / _1016;
    bool _1058 = _954 > 0.5;
    bool _1060 = _1058 && _928;
    float _1062 = _1032 * _964;
    float _1064 = _1052 * (-0.15915493667125701904296875);
    float _1066 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1068 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1072 = _1038 * _966;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1074;
    float _1078 = _1050 * _1040;
    float _1080 = _1076 * _998;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1086 = 1.0 / _1020;
    bool _1088 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1090 = isnan(_908);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = 1.0 / _1084;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1114 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1116 = _1104 * _1012;
    float _1118 = _1108 * _1056;
    float _1120 = _1112 * _1086;
    bool _1122 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1124 = isnan(_908);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1098;
    float _1136 = _1134 + 1.0;
    float _1138 = fma(_1114, _988, -0.5);
    float _1140 = -_102;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1144 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1008);
    float _1146 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    bool _1152 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1154 = isnan(_908);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = _1132 * _1136;
    float _1166 = -_1132;
    float _1168 = _1166 + 1.0;
    bool _1170 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1172 = isnan(_908);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1150 * _1100;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _908 + _1184;
    float _1188 = _1162 * _1168;
    float _1190 = -_1162;
    float _1192 = _1190 + 1.0;
    bool _1194 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1196 = isnan(_908);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1072, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1212 = _1180 * _1192;
    bool _1214 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1216 = isnan(_908);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1204 * _1208;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1230 = _908 + _1228;
    float _1232 = -_1204;
    float _1234 = _1232 + 1.0;
    bool _1236 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1238 = isnan(_908);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1250 = _908 + _1248;
    float _1252 = fma(_1080, _1230, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1254 = _1224 * _1234;
    float _1256 = -_1224;
    float _1258 = _1256 + 1.0;
    bool _1260 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1262 = isnan(_908);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1078, _1250, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1280 = _908 + _1278;
    float _1282 = _1246 * _1258;
    float _1284 = _1270 * _1274;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1290 = _908 + _1288;
    float _1292 = fma(_1116, _1280, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = _1210 * _1284;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = _908 + _1296;
    float _1300 = fma(_1118, _1290, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1302 = -_1270;
    float _1304 = _1302 + 1.0;
    float _1306 = _1290;
    float _1308 = _1118;
    if (_928)
    {
        _1306 = _944;
    }
    float _1310 = _1306;
    float _1312 = _1064 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = fma(_1120, _1298, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1318 = _1310;
    if (!_928)
    {
        _1308 = _944;
    }
    float _1320 = _1308;
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1294);
    float _1324 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1320;
    if (_1060)
    {
        float _1328 = -_1310;
        float _1330 = _1328 + 1.0;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1336 = _908 + _1334;
    float _1338 = fma(_1276, _1282, _1322);
    float _1340 = _1064 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    if (_928)
    {
        _1326 = _1332;
    }
    float _1348 = _1326;
    float _1350 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1352 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1354 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1356 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1346);
    float _1358 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1350);
    float _1360 = fma(_1352, _1348, -0.5);
    float _1362 = _1314 * _1138;
    float _1364 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = fma(_1252, _1254, _1338);
    float _1370 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1358);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1374 = -_1362;
    float _1376 = fma(_1342, _1360, _1374);
    float _1378 = _1066 + _1366;
    float _1380 = _1342 * _1138;
    float _1382 = fma(_1292, _1226, _1368);
    float _1384 = fma(_1144, _1376, _1142);
    float _1386 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1388 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1390 = _1068 + _1372;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = fma(_1182, _1336, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1396 = fma(_1314, _1360, _1380);
    float _1398 = fma(_1300, _1212, _1382);
    float _1400 = _1386 + _1388;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1406 = -_1054;
    float _1408 = fma(_1146, _1396, _1406);
    float _1410 = fma(_1316, _1188, _1398);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1418 = fma(_1394, _1164, _1410);
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1440 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1434);
    float _1446 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1438);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1460 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1464 = _1384 + 0.5;
    float _1466 = _1408 + 0.5;
    float _1468 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1418);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1458);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1476 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    out.m_45.x = _1390;
    out.m_45.y = _1378;
    out.m_45.z = _1400;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1464;
    out.m_47.y = _1466;
    out.m_49.x = _1468;
    out.gl_Position.x = _1472;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1474;
    out.gl_Position.w = _1476;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _900 = false;
    bool _758 = false;
    bool _644 = false;
    bool _552 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_84);
        out.gl_Position.z = _1533;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_120);
        out.gl_Position.z = _1602;
    }
    if (_112)
    {
        return out;
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _302 = 1.0 / _288;
    bool _304 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _306 = isnan(_272);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _292;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _276 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _272 + _340;
    float _344 = 1.0 / _300;
    float _346 = _280 * _328;
    bool _348 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_272);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _284 * _336;
    float _366 = _342 * _344;
    bool _368 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_272);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _378 * _362;
    float _386 = -_378;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _314 * _388;
    float _402 = -_314;
    float _404 = _402 + 1.0;
    float _406 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _410 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_272);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _326 * _404;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = _420 * _332;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = _406 * _436;
    float _448 = _408 * _436;
    float _450 = _398 * _436;
    float _452 = -_420;
    float _454 = _452 + 1.0;
    float _456 = in.m_33.x;
    float _458 = in.m_33.y;
    float _460 = in.m_33.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _474 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_440, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _482 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = fma(_442, _422, _470);
    float _486 = fma(_444, _422, _472);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _500 = fma(_474, _422, _476);
    float _502 = fma(_490, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _504 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _506 = fma(_480, _400, _486);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _510 = fma(_482, _400, _500);
    float _512 = fma(_478, _400, _484);
    float _514 = fma(_504, _384, _506);
    float _516 = fma(_508, _384, _510);
    float _518 = fma(_502, _384, _512);
    float _520 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _514);
    float _522 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _516);
    float _524 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = _520 * _458;
    float _528 = _522 * _460;
    float _530 = _524 * _456;
    bool _532 = !_334;
    float _550;
    if (!_532)
    {
        float _534 = in.m_35.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_68);
        float _556 = 1.0 / _554;
        float _558 = _102 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _592 * _604;
    float _614 = fma(_612, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _614 * _606;
    float _618 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _616);
    float _620 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _618);
    float _622 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _622;
    bool _624 = !_602;
    float _642;
    if (!_624)
    {
        float _626 = in.m_35.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_68);
        float _648 = 1.0 / _646;
        float _650 = _102 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _652 + _654;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_668;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _690;
    float _694 = 1.0 / _672;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _698 = _684 * _688;
    float _700 = -_684;
    float _702 = _700 + 1.0;
    float _704 = _656 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _706;
    float _710 = fma(_692, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _712;
    float _716 = fma(_708, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _718 = _710 * _698;
    float _720 = fma(_714, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _722 = _716 * _698;
    float _724 = _720 * _698;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].x, _718);
    float _728 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].y, _724);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].z, _722);
    float _732 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].x, _726);
    float _734 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].y, _728);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].z, _730);
    bool _738 = !_696;
    float _756;
    if (!_738)
    {
        float _740 = in.m_35.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_68);
        float _762 = 1.0 / _760;
        float _764 = _102 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _794 = isnan(_766);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _804;
    bool _808 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _810 = isnan(_766);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _774;
    float _822 = -_786;
    float _824 = _822 + 1.0;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _828 = _802 * _824;
    float _830 = -_802;
    float _832 = _830 + 1.0;
    float _834 = 1.0 / _790;
    float _836 = _806 * _820;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _842 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _844 = _840 * _834;
    float _846 = _842 * _828;
    float _848 = -_818;
    float _850 = _848 + 1.0;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _854 = _766 + _852;
    float _856 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[131].x, _846);
    float _860 = _786 * _850;
    float _862 = fma(_844, _854, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _864 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_862, _860, _858);
    float _870 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[133].x, _868);
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _866;
    out.m_39.y = _876;
    out.m_39.z = _872;
    out.m_39.w = _878;
    bool _880 = !_826;
    float _898;
    if (!_880)
    {
        float _882 = in.m_35.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_68);
        float _904 = 1.0 / _902;
        float _906 = _102 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = in.m_41.x;
    float _912 = in.m_41.y;
    float _914 = in.m_41.z;
    float _916 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = in.m_35.x;
    float _922 = in.m_35.y;
    float _924 = in.m_35.z;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _928 = _926 != 0;
    float _930 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _934 = _932 != 0;
    float _936 = in.m_43.y;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _940 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _942 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _944 = in.m_43.x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_928)
    {
        float _952 = in.m_35.x;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _966 = 1.0 / _948;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _970 = _922 > 0.5;
    float _972 = -_936;
    float _974 = _972 + 1.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _984 = _936;
    if (_934)
    {
        float _986 = _970 ? _974 : _936;
        _984 = _986;
    }
    float _988 = _984;
    float _990 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[79].z, _976);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _998 = 1.0 / _958;
    float _1000 = -_968;
    float _1002 = fma(_990, 2.0, _1000);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1004);
    float _1010 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _996;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = fma(_1010, -2.0, _978);
    float _1024 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1028 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _1030 = _1024 * _962;
    float _1032 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1036;
    float _1040 = 1.0 / _982;
    float _1042 = _1034 * _960;
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _940);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1052 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _992);
    float _1054 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1056 = 1.0 / _1016;
    bool _1058 = _954 > 0.5;
    bool _1060 = _1058 && _928;
    float _1062 = _1032 * _964;
    float _1064 = _1052 * (-0.15915493667125701904296875);
    float _1066 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1068 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1072 = _1038 * _966;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1074;
    float _1078 = _1050 * _1040;
    float _1080 = _1076 * _998;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1086 = 1.0 / _1020;
    bool _1088 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1090 = isnan(_908);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = 1.0 / _1084;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1114 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1116 = _1104 * _1012;
    float _1118 = _1108 * _1056;
    float _1120 = _1112 * _1086;
    bool _1122 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1124 = isnan(_908);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1098;
    float _1136 = _1134 + 1.0;
    float _1138 = fma(_1114, _988, -0.5);
    float _1140 = -_102;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1144 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1008);
    float _1146 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    bool _1152 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1154 = isnan(_908);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = _1132 * _1136;
    float _1166 = -_1132;
    float _1168 = _1166 + 1.0;
    bool _1170 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1172 = isnan(_908);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1150 * _1100;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _908 + _1184;
    float _1188 = _1162 * _1168;
    float _1190 = -_1162;
    float _1192 = _1190 + 1.0;
    bool _1194 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1196 = isnan(_908);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1072, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1212 = _1180 * _1192;
    bool _1214 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1216 = isnan(_908);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1204 * _1208;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1230 = _908 + _1228;
    float _1232 = -_1204;
    float _1234 = _1232 + 1.0;
    bool _1236 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1238 = isnan(_908);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1250 = _908 + _1248;
    float _1252 = fma(_1080, _1230, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1254 = _1224 * _1234;
    float _1256 = -_1224;
    float _1258 = _1256 + 1.0;
    bool _1260 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1262 = isnan(_908);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1078, _1250, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1280 = _908 + _1278;
    float _1282 = _1246 * _1258;
    float _1284 = _1270 * _1274;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1290 = _908 + _1288;
    float _1292 = fma(_1116, _1280, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = _1210 * _1284;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = _908 + _1296;
    float _1300 = fma(_1118, _1290, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1302 = -_1270;
    float _1304 = _1302 + 1.0;
    float _1306 = _1290;
    float _1308 = _1118;
    if (_928)
    {
        _1306 = _944;
    }
    float _1310 = _1306;
    float _1312 = _1064 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = fma(_1120, _1298, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1318 = _1310;
    if (!_928)
    {
        _1308 = _944;
    }
    float _1320 = _1308;
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1294);
    float _1324 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1320;
    if (_1060)
    {
        float _1328 = -_1310;
        float _1330 = _1328 + 1.0;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1336 = _908 + _1334;
    float _1338 = fma(_1276, _1282, _1322);
    float _1340 = _1064 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    if (_928)
    {
        _1326 = _1332;
    }
    float _1348 = _1326;
    float _1350 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1352 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1354 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1356 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1346);
    float _1358 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1350);
    float _1360 = fma(_1352, _1348, -0.5);
    float _1362 = _1314 * _1138;
    float _1364 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = fma(_1252, _1254, _1338);
    float _1370 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1358);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1374 = -_1362;
    float _1376 = fma(_1342, _1360, _1374);
    float _1378 = _1066 + _1366;
    float _1380 = _1342 * _1138;
    float _1382 = fma(_1292, _1226, _1368);
    float _1384 = fma(_1144, _1376, _1142);
    float _1386 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1388 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1390 = _1068 + _1372;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = fma(_1182, _1336, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1396 = fma(_1314, _1360, _1380);
    float _1398 = fma(_1300, _1212, _1382);
    float _1400 = _1386 + _1388;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1406 = -_1054;
    float _1408 = fma(_1146, _1396, _1406);
    float _1410 = fma(_1316, _1188, _1398);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1418 = fma(_1394, _1164, _1410);
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1440 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1434);
    float _1446 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1438);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1460 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1464 = _1384 + 0.5;
    float _1466 = _1408 + 0.5;
    float _1468 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1418);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1458);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1476 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    out.m_45.x = _1390;
    out.m_45.y = _1378;
    out.m_45.z = _1400;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1464;
    out.m_47.y = _1466;
    out.m_49.x = _1468;
    out.gl_Position.x = _1472;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1474;
    out.gl_Position.w = _1476;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _900 = false;
    bool _758 = false;
    bool _644 = false;
    bool _552 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_84);
        out.gl_Position.z = _1533;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_120);
        out.gl_Position.z = _1602;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _272 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _302 = 1.0 / _288;
    bool _304 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _306 = isnan(_272);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    bool _316 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _318 = isnan(_272);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _292;
    float _330 = -_326;
    float _332 = _330 + 1.0;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _276 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _272 + _340;
    float _344 = 1.0 / _300;
    float _346 = _280 * _328;
    bool _348 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_272);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _284 * _336;
    float _366 = _342 * _344;
    bool _368 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_272);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _378 * _362;
    float _386 = -_378;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _314 * _388;
    float _402 = -_314;
    float _404 = _402 + 1.0;
    float _406 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _410 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_272);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _326 * _404;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = _420 * _332;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = _406 * _436;
    float _448 = _408 * _436;
    float _450 = _398 * _436;
    float _452 = -_420;
    float _454 = _452 + 1.0;
    float _456 = in.m_33.x;
    float _458 = in.m_33.y;
    float _460 = in.m_33.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _474 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_440, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _482 = fma(_468, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = fma(_442, _422, _470);
    float _486 = fma(_444, _422, _472);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _500 = fma(_474, _422, _476);
    float _502 = fma(_490, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _504 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _506 = fma(_480, _400, _486);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _510 = fma(_482, _400, _500);
    float _512 = fma(_478, _400, _484);
    float _514 = fma(_504, _384, _506);
    float _516 = fma(_508, _384, _510);
    float _518 = fma(_502, _384, _512);
    float _520 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _514);
    float _522 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _516);
    float _524 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = _520 * _458;
    float _528 = _522 * _460;
    float _530 = _524 * _456;
    bool _532 = !_334;
    float _550;
    if (!_532)
    {
        float _534 = in.m_35.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_68);
        float _556 = 1.0 / _554;
        float _558 = _102 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _580 = isnan(_560);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _560 + _594;
    float _598 = -_572;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _604 = 1.0 / _576;
    float _606 = _588 * _600;
    float _608 = -_588;
    float _610 = _608 + 1.0;
    float _612 = _592 * _604;
    float _614 = fma(_612, _596, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _616 = _614 * _606;
    float _618 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _616);
    float _620 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[116].x, _618);
    float _622 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _622;
    bool _624 = !_602;
    float _642;
    if (!_624)
    {
        float _626 = in.m_35.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_68);
        float _648 = 1.0 / _646;
        float _650 = _102 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _652 + _654;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_668;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _690;
    float _694 = 1.0 / _672;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _698 = _684 * _688;
    float _700 = -_684;
    float _702 = _700 + 1.0;
    float _704 = _656 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _706;
    float _710 = fma(_692, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _712;
    float _716 = fma(_708, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _718 = _710 * _698;
    float _720 = fma(_714, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _722 = _716 * _698;
    float _724 = _720 * _698;
    float _726 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].x, _718);
    float _728 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].y, _724);
    float _730 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[123].z, _722);
    float _732 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].x, _726);
    float _734 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].y, _728);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[124].z, _730);
    bool _738 = !_696;
    float _756;
    if (!_738)
    {
        float _740 = in.m_35.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_68);
        float _762 = 1.0 / _760;
        float _764 = _102 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _794 = isnan(_766);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _804;
    bool _808 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _810 = isnan(_766);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _774;
    float _822 = -_786;
    float _824 = _822 + 1.0;
    bool _826 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _828 = _802 * _824;
    float _830 = -_802;
    float _832 = _830 + 1.0;
    float _834 = 1.0 / _790;
    float _836 = _806 * _820;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _842 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _844 = _840 * _834;
    float _846 = _842 * _828;
    float _848 = -_818;
    float _850 = _848 + 1.0;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _854 = _766 + _852;
    float _856 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[131].x, _846);
    float _860 = _786 * _850;
    float _862 = fma(_844, _854, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _864 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _866 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_862, _860, _858);
    float _870 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[133].x, _868);
    float _876 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _866;
    out.m_39.y = _876;
    out.m_39.z = _872;
    out.m_39.w = _878;
    bool _880 = !_826;
    float _898;
    if (!_880)
    {
        float _882 = in.m_35.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_68);
        float _904 = 1.0 / _902;
        float _906 = _102 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = in.m_41.x;
    float _912 = in.m_41.y;
    float _914 = in.m_41.z;
    float _916 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = in.m_35.x;
    float _922 = in.m_35.y;
    float _924 = in.m_35.z;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _928 = _926 != 0;
    float _930 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _934 = _932 != 0;
    float _936 = in.m_43.y;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _940 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _942 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _944 = in.m_43.x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_928)
    {
        float _952 = in.m_35.x;
        _950 = _952;
    }
    float _954 = _950;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _966 = 1.0 / _948;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _970 = _922 > 0.5;
    float _972 = -_936;
    float _974 = _972 + 1.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _984 = _936;
    if (_934)
    {
        float _986 = _970 ? _974 : _936;
        _984 = _986;
    }
    float _988 = _984;
    float _990 = _920 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _992 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[79].z, _976);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _998 = 1.0 / _958;
    float _1000 = -_968;
    float _1002 = fma(_990, 2.0, _1000);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1004);
    float _1010 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _996;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = fma(_1010, -2.0, _978);
    float _1024 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1028 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    float _1030 = _1024 * _962;
    float _1032 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1036;
    float _1040 = 1.0 / _982;
    float _1042 = _1034 * _960;
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _940);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1052 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _992);
    float _1054 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1056 = 1.0 / _1016;
    bool _1058 = _954 > 0.5;
    bool _1060 = _1058 && _928;
    float _1062 = _1032 * _964;
    float _1064 = _1052 * (-0.15915493667125701904296875);
    float _1066 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1068 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1072 = _1038 * _966;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1074;
    float _1078 = _1050 * _1040;
    float _1080 = _1076 * _998;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1086 = 1.0 / _1020;
    bool _1088 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1090 = isnan(_908);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = 1.0 / _1084;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1114 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1116 = _1104 * _1012;
    float _1118 = _1108 * _1056;
    float _1120 = _1112 * _1086;
    bool _1122 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1124 = isnan(_908);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1098;
    float _1136 = _1134 + 1.0;
    float _1138 = fma(_1114, _988, -0.5);
    float _1140 = -_102;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1144 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1008);
    float _1146 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    bool _1152 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1154 = isnan(_908);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1160 = _1156 || _1158;
    float _1162 = float(_1160);
    float _1164 = _1132 * _1136;
    float _1166 = -_1132;
    float _1168 = _1166 + 1.0;
    bool _1170 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1172 = isnan(_908);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1150 * _1100;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _908 + _1184;
    float _1188 = _1162 * _1168;
    float _1190 = -_1162;
    float _1192 = _1190 + 1.0;
    bool _1194 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1196 = isnan(_908);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1072, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1212 = _1180 * _1192;
    bool _1214 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1216 = isnan(_908);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1204 * _1208;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1230 = _908 + _1228;
    float _1232 = -_1204;
    float _1234 = _1232 + 1.0;
    bool _1236 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1238 = isnan(_908);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1250 = _908 + _1248;
    float _1252 = fma(_1080, _1230, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1254 = _1224 * _1234;
    float _1256 = -_1224;
    float _1258 = _1256 + 1.0;
    bool _1260 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1262 = isnan(_908);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1078, _1250, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1280 = _908 + _1278;
    float _1282 = _1246 * _1258;
    float _1284 = _1270 * _1274;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1290 = _908 + _1288;
    float _1292 = fma(_1116, _1280, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = _1210 * _1284;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = _908 + _1296;
    float _1300 = fma(_1118, _1290, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1302 = -_1270;
    float _1304 = _1302 + 1.0;
    float _1306 = _1290;
    float _1308 = _1118;
    if (_928)
    {
        _1306 = _944;
    }
    float _1310 = _1306;
    float _1312 = _1064 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = fma(_1120, _1298, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1318 = _1310;
    if (!_928)
    {
        _1308 = _944;
    }
    float _1320 = _1308;
    float _1322 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1294);
    float _1324 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1320;
    if (_1060)
    {
        float _1328 = -_1310;
        float _1330 = _1328 + 1.0;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1336 = _908 + _1334;
    float _1338 = fma(_1276, _1282, _1322);
    float _1340 = _1064 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    if (_928)
    {
        _1326 = _1332;
    }
    float _1348 = _1326;
    float _1350 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1352 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1354 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1356 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1346);
    float _1358 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1350);
    float _1360 = fma(_1352, _1348, -0.5);
    float _1362 = _1314 * _1138;
    float _1364 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1366 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = fma(_1252, _1254, _1338);
    float _1370 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1358);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1374 = -_1362;
    float _1376 = fma(_1342, _1360, _1374);
    float _1378 = _1066 + _1366;
    float _1380 = _1342 * _1138;
    float _1382 = fma(_1292, _1226, _1368);
    float _1384 = fma(_1144, _1376, _1142);
    float _1386 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1388 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1390 = _1068 + _1372;
    float _1392 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = fma(_1182, _1336, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1396 = fma(_1314, _1360, _1380);
    float _1398 = fma(_1300, _1212, _1382);
    float _1400 = _1386 + _1388;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1406 = -_1054;
    float _1408 = fma(_1146, _1396, _1406);
    float _1410 = fma(_1316, _1188, _1398);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1418 = fma(_1394, _1164, _1410);
    float _1420 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1426 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1440 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1434);
    float _1446 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1438);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1444);
    float _1456 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1458 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1460 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1464 = _1384 + 0.5;
    float _1466 = _1408 + 0.5;
    float _1468 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1418);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1458);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1476 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    out.m_45.x = _1390;
    out.m_45.y = _1378;
    out.m_45.z = _1400;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1464;
    out.m_47.y = _1466;
    out.m_49.x = _1468;
    out.gl_Position.x = _1472;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1474;
    out.gl_Position.w = _1476;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

