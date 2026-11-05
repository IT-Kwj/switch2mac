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
    bool _938 = false;
    bool _796 = false;
    bool _682 = false;
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
        float _1571 = as_type<float>(_84);
        out.gl_Position.z = _1571;
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
        float _1640 = as_type<float>(_120);
        out.gl_Position.z = _1640;
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
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_560);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_560);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    bool _602 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_560);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _568;
    float _616 = -_580;
    float _618 = _616 + 1.0;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _622 = _596 * _618;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _584;
    float _630 = _600 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _628;
    float _640 = _636 * _622;
    float _642 = -_612;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _560 + _646;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _652 = _580 * _644;
    float _654 = fma(_638, _648, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_654, _652, _650);
    float _658 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    float _660 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _660;
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_35.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_68);
        float _686 = 1.0 / _684;
        float _688 = _102 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _690 + _692;
    bool _696 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_690);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _708;
    bool _712 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _714 = isnan(_690);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_706;
    float _726 = _724 + 1.0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _728;
    float _732 = 1.0 / _710;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _736 = _722 * _726;
    float _738 = -_722;
    float _740 = _738 + 1.0;
    float _742 = _694 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _744;
    float _748 = fma(_730, _742, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = fma(_746, _742, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _756 = _748 * _736;
    float _758 = fma(_752, _742, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _760 = _754 * _736;
    float _762 = _758 * _736;
    float _764 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].x, _756);
    float _766 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].y, _762);
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].z, _760);
    float _770 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _764);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _766);
    float _774 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _768);
    bool _776 = !_734;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_68);
        float _800 = 1.0 / _798;
        float _802 = _102 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _866 = _840 * _862;
    float _868 = -_840;
    float _870 = _868 + 1.0;
    float _872 = 1.0 / _828;
    float _874 = _844 * _858;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _880 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _878 * _872;
    float _884 = _880 * _866;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _892 = _804 + _890;
    float _894 = _770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _884);
    float _898 = _824 * _888;
    float _900 = fma(_882, _892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _774 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_900, _898, _896);
    float _908 = _772 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[133].x, _906);
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _912 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _904;
    out.m_39.y = _914;
    out.m_39.z = _910;
    out.m_39.w = _916;
    bool _918 = !_864;
    float _936;
    if (!_918)
    {
        float _920 = in.m_35.x;
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _928 = _926 * _922;
        float _930 = floor(_928);
        float _932 = -_930;
        float _934 = _928 + _932;
        _936 = _934;
        _938 = true;
    }
    else
    {
        float _940 = float(_68);
        float _942 = 1.0 / _940;
        float _944 = _102 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_41.x;
    float _950 = in.m_41.y;
    float _952 = in.m_41.z;
    float _954 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_35.x;
    float _960 = in.m_35.y;
    float _962 = in.m_35.z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = in.m_43.y;
    float _976 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _978 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _980 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _982 = in.m_43.x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_966)
    {
        float _990 = in.m_35.x;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _952);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _948);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _1004 = 1.0 / _986;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1008 = _960 > 0.5;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1022 = _974;
    if (_972)
    {
        float _1024 = _1008 ? _1012 : _974;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1030 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1014);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = 1.0 / _996;
    float _1038 = -_1006;
    float _1040 = fma(_1028, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1046 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1042);
    float _1048 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1050 = 1.0 / _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = fma(_1048, -2.0, _1016);
    float _1062 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1044);
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _1068 = _1062 * _1000;
    float _1070 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1074;
    float _1078 = 1.0 / _1020;
    float _1080 = _1072 * _998;
    float _1082 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _978);
    float _1084 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _976);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1090 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1030);
    float _1092 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1060);
    float _1094 = 1.0 / _1054;
    bool _1096 = _992 > 0.5;
    bool _1098 = _1096 && _966;
    float _1100 = _1070 * _1002;
    float _1102 = _1090 * (-0.15915493667125701904296875);
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1106 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1076 * _1004;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1112;
    float _1116 = _1088 * _1078;
    float _1118 = _1114 * _1036;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1124 = 1.0 / _1058;
    bool _1126 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_946);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = 1.0 / _1122;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1154 = _1142 * _1050;
    float _1156 = _1146 * _1094;
    float _1158 = _1150 * _1124;
    bool _1160 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1162 = isnan(_946);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -_1136;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_1152, _1026, -0.5);
    float _1178 = -_102;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1040);
    float _1182 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1184 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1064);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1174;
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    bool _1208 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1210 = isnan(_946);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = _1188 * _1138;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1224 = _946 + _1222;
    float _1226 = _1200 * _1206;
    float _1228 = -_1200;
    float _1230 = _1228 + 1.0;
    bool _1232 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1234 = isnan(_946);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1218;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1110, _1224, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1250 = _1218 * _1230;
    bool _1252 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1254 = isnan(_946);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = _946 + _1266;
    float _1270 = -_1242;
    float _1272 = _1270 + 1.0;
    bool _1274 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1276 = isnan(_946);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _946 + _1286;
    float _1290 = fma(_1118, _1268, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1292 = _1262 * _1272;
    float _1294 = -_1262;
    float _1296 = _1294 + 1.0;
    bool _1298 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1300 = isnan(_946);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -_1284;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1116, _1288, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1318 = _946 + _1316;
    float _1320 = _1284 * _1296;
    float _1322 = _1308 * _1312;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1328 = _946 + _1326;
    float _1330 = fma(_1154, _1318, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1332 = _1248 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1336 = _946 + _1334;
    float _1338 = fma(_1156, _1328, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1340 = -_1308;
    float _1342 = _1340 + 1.0;
    float _1344 = _1328;
    float _1346 = _1156;
    if (_966)
    {
        _1344 = _982;
    }
    float _1348 = _1344;
    float _1350 = _1102 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = fma(_1158, _1336, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = _1348;
    if (!_966)
    {
        _1346 = _982;
    }
    float _1358 = _1346;
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1332);
    float _1362 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1358;
    if (_1098)
    {
        float _1366 = -_1348;
        float _1368 = _1366 + 1.0;
        _1356 = _1368;
    }
    float _1370 = _1356;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1374 = _946 + _1372;
    float _1376 = fma(_1314, _1320, _1360);
    float _1378 = _1102 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    float _1382 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1384 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    if (_966)
    {
        _1364 = _1370;
    }
    float _1386 = _1364;
    float _1388 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1382);
    float _1394 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = fma(_1390, _1386, -0.5);
    float _1400 = _1352 * _1176;
    float _1402 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1406 = fma(_1290, _1292, _1376);
    float _1408 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = -_1400;
    float _1414 = fma(_1380, _1398, _1412);
    float _1416 = _1104 + _1404;
    float _1418 = _1380 * _1176;
    float _1420 = fma(_1330, _1264, _1406);
    float _1422 = fma(_1182, _1414, _1180);
    float _1424 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1426 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1428 = _1106 + _1410;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = fma(_1220, _1374, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1434 = fma(_1352, _1398, _1418);
    float _1436 = fma(_1338, _1250, _1420);
    float _1438 = _1424 + _1426;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1444 = -_1092;
    float _1446 = fma(_1184, _1434, _1444);
    float _1448 = fma(_1354, _1226, _1436);
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1454 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1456 = fma(_1432, _1202, _1448);
    float _1458 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1450);
    float _1460 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1462 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1458);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1468);
    float _1486 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1488 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1476);
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1492 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1488);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1502 = _1422 + 0.5;
    float _1504 = _1446 + 0.5;
    float _1506 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1456);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    out.m_45.x = _1428;
    out.m_45.y = _1416;
    out.m_45.z = _1438;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1502;
    out.m_47.y = _1504;
    out.m_49.x = _1506;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1512;
    out.gl_Position.w = _1514;
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
    bool _938 = false;
    bool _796 = false;
    bool _682 = false;
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
        float _1571 = as_type<float>(_84);
        out.gl_Position.z = _1571;
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
        float _1640 = as_type<float>(_120);
        out.gl_Position.z = _1640;
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
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_560);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_560);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    bool _602 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_560);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _568;
    float _616 = -_580;
    float _618 = _616 + 1.0;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _622 = _596 * _618;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _584;
    float _630 = _600 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _628;
    float _640 = _636 * _622;
    float _642 = -_612;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _560 + _646;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _652 = _580 * _644;
    float _654 = fma(_638, _648, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_654, _652, _650);
    float _658 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    float _660 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _660;
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_35.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_68);
        float _686 = 1.0 / _684;
        float _688 = _102 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _690 + _692;
    bool _696 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_690);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _708;
    bool _712 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _714 = isnan(_690);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_706;
    float _726 = _724 + 1.0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _728;
    float _732 = 1.0 / _710;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _736 = _722 * _726;
    float _738 = -_722;
    float _740 = _738 + 1.0;
    float _742 = _694 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _744;
    float _748 = fma(_730, _742, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = fma(_746, _742, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _756 = _748 * _736;
    float _758 = fma(_752, _742, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _760 = _754 * _736;
    float _762 = _758 * _736;
    float _764 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].x, _756);
    float _766 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].y, _762);
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].z, _760);
    float _770 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _764);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _766);
    float _774 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _768);
    bool _776 = !_734;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_68);
        float _800 = 1.0 / _798;
        float _802 = _102 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _866 = _840 * _862;
    float _868 = -_840;
    float _870 = _868 + 1.0;
    float _872 = 1.0 / _828;
    float _874 = _844 * _858;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _880 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _878 * _872;
    float _884 = _880 * _866;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _892 = _804 + _890;
    float _894 = _770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _884);
    float _898 = _824 * _888;
    float _900 = fma(_882, _892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _774 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_900, _898, _896);
    float _908 = _772 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[133].x, _906);
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _912 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _904;
    out.m_39.y = _914;
    out.m_39.z = _910;
    out.m_39.w = _916;
    bool _918 = !_864;
    float _936;
    if (!_918)
    {
        float _920 = in.m_35.x;
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _928 = _926 * _922;
        float _930 = floor(_928);
        float _932 = -_930;
        float _934 = _928 + _932;
        _936 = _934;
        _938 = true;
    }
    else
    {
        float _940 = float(_68);
        float _942 = 1.0 / _940;
        float _944 = _102 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_41.x;
    float _950 = in.m_41.y;
    float _952 = in.m_41.z;
    float _954 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_35.x;
    float _960 = in.m_35.y;
    float _962 = in.m_35.z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = in.m_43.y;
    float _976 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _978 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _980 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _982 = in.m_43.x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_966)
    {
        float _990 = in.m_35.x;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _952);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _948);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _1004 = 1.0 / _986;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1008 = _960 > 0.5;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1022 = _974;
    if (_972)
    {
        float _1024 = _1008 ? _1012 : _974;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1030 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1014);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = 1.0 / _996;
    float _1038 = -_1006;
    float _1040 = fma(_1028, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1046 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1042);
    float _1048 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1050 = 1.0 / _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = fma(_1048, -2.0, _1016);
    float _1062 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1044);
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _1068 = _1062 * _1000;
    float _1070 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1074;
    float _1078 = 1.0 / _1020;
    float _1080 = _1072 * _998;
    float _1082 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _978);
    float _1084 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _976);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1090 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1030);
    float _1092 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1060);
    float _1094 = 1.0 / _1054;
    bool _1096 = _992 > 0.5;
    bool _1098 = _1096 && _966;
    float _1100 = _1070 * _1002;
    float _1102 = _1090 * (-0.15915493667125701904296875);
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1106 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1076 * _1004;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1112;
    float _1116 = _1088 * _1078;
    float _1118 = _1114 * _1036;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1124 = 1.0 / _1058;
    bool _1126 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_946);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = 1.0 / _1122;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1154 = _1142 * _1050;
    float _1156 = _1146 * _1094;
    float _1158 = _1150 * _1124;
    bool _1160 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1162 = isnan(_946);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -_1136;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_1152, _1026, -0.5);
    float _1178 = -_102;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1040);
    float _1182 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1184 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1064);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1174;
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    bool _1208 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1210 = isnan(_946);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = _1188 * _1138;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1224 = _946 + _1222;
    float _1226 = _1200 * _1206;
    float _1228 = -_1200;
    float _1230 = _1228 + 1.0;
    bool _1232 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1234 = isnan(_946);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1218;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1110, _1224, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1250 = _1218 * _1230;
    bool _1252 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1254 = isnan(_946);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = _946 + _1266;
    float _1270 = -_1242;
    float _1272 = _1270 + 1.0;
    bool _1274 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1276 = isnan(_946);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _946 + _1286;
    float _1290 = fma(_1118, _1268, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1292 = _1262 * _1272;
    float _1294 = -_1262;
    float _1296 = _1294 + 1.0;
    bool _1298 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1300 = isnan(_946);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -_1284;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1116, _1288, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1318 = _946 + _1316;
    float _1320 = _1284 * _1296;
    float _1322 = _1308 * _1312;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1328 = _946 + _1326;
    float _1330 = fma(_1154, _1318, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1332 = _1248 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1336 = _946 + _1334;
    float _1338 = fma(_1156, _1328, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1340 = -_1308;
    float _1342 = _1340 + 1.0;
    float _1344 = _1328;
    float _1346 = _1156;
    if (_966)
    {
        _1344 = _982;
    }
    float _1348 = _1344;
    float _1350 = _1102 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = fma(_1158, _1336, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = _1348;
    if (!_966)
    {
        _1346 = _982;
    }
    float _1358 = _1346;
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1332);
    float _1362 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1358;
    if (_1098)
    {
        float _1366 = -_1348;
        float _1368 = _1366 + 1.0;
        _1356 = _1368;
    }
    float _1370 = _1356;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1374 = _946 + _1372;
    float _1376 = fma(_1314, _1320, _1360);
    float _1378 = _1102 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    float _1382 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1384 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    if (_966)
    {
        _1364 = _1370;
    }
    float _1386 = _1364;
    float _1388 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1382);
    float _1394 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = fma(_1390, _1386, -0.5);
    float _1400 = _1352 * _1176;
    float _1402 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1406 = fma(_1290, _1292, _1376);
    float _1408 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = -_1400;
    float _1414 = fma(_1380, _1398, _1412);
    float _1416 = _1104 + _1404;
    float _1418 = _1380 * _1176;
    float _1420 = fma(_1330, _1264, _1406);
    float _1422 = fma(_1182, _1414, _1180);
    float _1424 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1426 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1428 = _1106 + _1410;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = fma(_1220, _1374, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1434 = fma(_1352, _1398, _1418);
    float _1436 = fma(_1338, _1250, _1420);
    float _1438 = _1424 + _1426;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1444 = -_1092;
    float _1446 = fma(_1184, _1434, _1444);
    float _1448 = fma(_1354, _1226, _1436);
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1454 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1456 = fma(_1432, _1202, _1448);
    float _1458 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1450);
    float _1460 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1462 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1458);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1468);
    float _1486 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1488 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1476);
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1492 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1488);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1502 = _1422 + 0.5;
    float _1504 = _1446 + 0.5;
    float _1506 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1456);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    out.m_45.x = _1428;
    out.m_45.y = _1416;
    out.m_45.z = _1438;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1502;
    out.m_47.y = _1504;
    out.m_49.x = _1506;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1512;
    out.gl_Position.w = _1514;
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
    bool _938 = false;
    bool _796 = false;
    bool _682 = false;
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
        float _1571 = as_type<float>(_84);
        out.gl_Position.z = _1571;
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
        float _1640 = as_type<float>(_120);
        out.gl_Position.z = _1640;
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
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_560);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_560);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    bool _602 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_560);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _568;
    float _616 = -_580;
    float _618 = _616 + 1.0;
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _622 = _596 * _618;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    float _628 = 1.0 / _584;
    float _630 = _600 * _614;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _638 = _634 * _628;
    float _640 = _636 * _622;
    float _642 = -_612;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _560 + _646;
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _652 = _580 * _644;
    float _654 = fma(_638, _648, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_654, _652, _650);
    float _658 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    float _660 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _660;
    bool _662 = !_620;
    float _680;
    if (!_662)
    {
        float _664 = in.m_35.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_68);
        float _686 = 1.0 / _684;
        float _688 = _102 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _690 + _692;
    bool _696 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _698 = isnan(_690);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _708;
    bool _712 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _714 = isnan(_690);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_706;
    float _726 = _724 + 1.0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _728;
    float _732 = 1.0 / _710;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _736 = _722 * _726;
    float _738 = -_722;
    float _740 = _738 + 1.0;
    float _742 = _694 * _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _744;
    float _748 = fma(_730, _742, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = fma(_746, _742, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _756 = _748 * _736;
    float _758 = fma(_752, _742, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _760 = _754 * _736;
    float _762 = _758 * _736;
    float _764 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].x, _756);
    float _766 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].y, _762);
    float _768 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[123].z, _760);
    float _770 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].x, _764);
    float _772 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].y, _766);
    float _774 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[124].z, _768);
    bool _776 = !_734;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_68);
        float _800 = 1.0 / _798;
        float _802 = _102 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _808 = _804 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _814 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _816 = isnan(_804);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _830 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _832 = isnan(_804);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _842;
    bool _846 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_804);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _812;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _866 = _840 * _862;
    float _868 = -_840;
    float _870 = _868 + 1.0;
    float _872 = 1.0 / _828;
    float _874 = _844 * _858;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _880 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _878 * _872;
    float _884 = _880 * _866;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _892 = _804 + _890;
    float _894 = _770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _884);
    float _898 = _824 * _888;
    float _900 = fma(_882, _892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _774 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = fma(_900, _898, _896);
    float _908 = _772 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[133].x, _906);
    float _914 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _912 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _904;
    out.m_39.y = _914;
    out.m_39.z = _910;
    out.m_39.w = _916;
    bool _918 = !_864;
    float _936;
    if (!_918)
    {
        float _920 = in.m_35.x;
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _928 = _926 * _922;
        float _930 = floor(_928);
        float _932 = -_930;
        float _934 = _928 + _932;
        _936 = _934;
        _938 = true;
    }
    else
    {
        float _940 = float(_68);
        float _942 = 1.0 / _940;
        float _944 = _102 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_41.x;
    float _950 = in.m_41.y;
    float _952 = in.m_41.z;
    float _954 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = in.m_35.x;
    float _960 = in.m_35.y;
    float _962 = in.m_35.z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = in.m_43.y;
    float _976 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _978 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _980 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _982 = in.m_43.x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_966)
    {
        float _990 = in.m_35.x;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _952);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _948);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _1004 = 1.0 / _986;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1008 = _960 > 0.5;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1022 = _974;
    if (_972)
    {
        float _1024 = _1008 ? _1012 : _974;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _958 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1030 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1014);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = 1.0 / _996;
    float _1038 = -_1006;
    float _1040 = fma(_1028, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1046 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1042);
    float _1048 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1050 = 1.0 / _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = fma(_1048, -2.0, _1016);
    float _1062 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1044);
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _1068 = _1062 * _1000;
    float _1070 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1074;
    float _1078 = 1.0 / _1020;
    float _1080 = _1072 * _998;
    float _1082 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _978);
    float _1084 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _976);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1090 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1030);
    float _1092 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1060);
    float _1094 = 1.0 / _1054;
    bool _1096 = _992 > 0.5;
    bool _1098 = _1096 && _966;
    float _1100 = _1070 * _1002;
    float _1102 = _1090 * (-0.15915493667125701904296875);
    float _1104 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1106 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1076 * _1004;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1112;
    float _1116 = _1088 * _1078;
    float _1118 = _1114 * _1036;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1124 = 1.0 / _1058;
    bool _1126 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_946);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = 1.0 / _1122;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1154 = _1142 * _1050;
    float _1156 = _1146 * _1094;
    float _1158 = _1150 * _1124;
    bool _1160 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1162 = isnan(_946);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -_1136;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_1152, _1026, -0.5);
    float _1178 = -_102;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1040);
    float _1182 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1184 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1064);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1174;
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    bool _1208 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1210 = isnan(_946);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = _1188 * _1138;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1224 = _946 + _1222;
    float _1226 = _1200 * _1206;
    float _1228 = -_1200;
    float _1230 = _1228 + 1.0;
    bool _1232 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1234 = isnan(_946);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1218;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1110, _1224, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1250 = _1218 * _1230;
    bool _1252 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1254 = isnan(_946);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = _946 + _1266;
    float _1270 = -_1242;
    float _1272 = _1270 + 1.0;
    bool _1274 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1276 = isnan(_946);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _946 + _1286;
    float _1290 = fma(_1118, _1268, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1292 = _1262 * _1272;
    float _1294 = -_1262;
    float _1296 = _1294 + 1.0;
    bool _1298 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1300 = isnan(_946);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -_1284;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1116, _1288, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1318 = _946 + _1316;
    float _1320 = _1284 * _1296;
    float _1322 = _1308 * _1312;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1328 = _946 + _1326;
    float _1330 = fma(_1154, _1318, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1332 = _1248 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1336 = _946 + _1334;
    float _1338 = fma(_1156, _1328, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1340 = -_1308;
    float _1342 = _1340 + 1.0;
    float _1344 = _1328;
    float _1346 = _1156;
    if (_966)
    {
        _1344 = _982;
    }
    float _1348 = _1344;
    float _1350 = _1102 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = fma(_1158, _1336, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = _1348;
    if (!_966)
    {
        _1346 = _982;
    }
    float _1358 = _1346;
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1332);
    float _1362 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1358;
    if (_1098)
    {
        float _1366 = -_1348;
        float _1368 = _1366 + 1.0;
        _1356 = _1368;
    }
    float _1370 = _1356;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1374 = _946 + _1372;
    float _1376 = fma(_1314, _1320, _1360);
    float _1378 = _1102 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    float _1382 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1384 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    if (_966)
    {
        _1364 = _1370;
    }
    float _1386 = _1364;
    float _1388 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1392 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1382);
    float _1394 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = fma(_1390, _1386, -0.5);
    float _1400 = _1352 * _1176;
    float _1402 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1406 = fma(_1290, _1292, _1376);
    float _1408 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = -_1400;
    float _1414 = fma(_1380, _1398, _1412);
    float _1416 = _1104 + _1404;
    float _1418 = _1380 * _1176;
    float _1420 = fma(_1330, _1264, _1406);
    float _1422 = fma(_1182, _1414, _1180);
    float _1424 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1426 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1428 = _1106 + _1410;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = fma(_1220, _1374, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1434 = fma(_1352, _1398, _1418);
    float _1436 = fma(_1338, _1250, _1420);
    float _1438 = _1424 + _1426;
    float _1440 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1444 = -_1092;
    float _1446 = fma(_1184, _1434, _1444);
    float _1448 = fma(_1354, _1226, _1436);
    float _1450 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1454 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1442);
    float _1456 = fma(_1432, _1202, _1448);
    float _1458 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1450);
    float _1460 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1462 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1458);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1468);
    float _1486 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1488 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1476);
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1492 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1486);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1488);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1490);
    float _1502 = _1422 + 0.5;
    float _1504 = _1446 + 0.5;
    float _1506 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1456);
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    out.m_45.x = _1428;
    out.m_45.y = _1416;
    out.m_45.z = _1438;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1502;
    out.m_47.y = _1504;
    out.m_49.x = _1506;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1512;
    out.gl_Position.w = _1514;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

