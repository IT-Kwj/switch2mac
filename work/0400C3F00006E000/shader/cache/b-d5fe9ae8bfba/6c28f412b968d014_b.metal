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
    bool _976 = false;
    bool _834 = false;
    bool _720 = false;
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
        float _1609 = as_type<float>(_84);
        out.gl_Position.z = _1609;
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
        float _1678 = as_type<float>(_120);
        out.gl_Position.z = _1678;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _574 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = isnan(_560);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _590 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_560);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _568;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    float _608 = -_584;
    float _610 = _608 + 1.0;
    bool _612 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_560);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _626 = 1.0 / _572;
    float _628 = 1.0 / _588;
    float _630 = _606 * _602;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _600 * _610;
    float _638 = -_600;
    float _640 = _638 + 1.0;
    float _642 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _644;
    float _648 = _622 * _640;
    float _650 = _634 * _626;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _560 + _652;
    bool _656 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _642 * _648;
    float _670 = -_622;
    float _672 = _670 + 1.0;
    float _674 = fma(_650, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _560 + _676;
    float _680 = _646 * _628;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _688 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _584 * _684;
    float _692 = fma(_674, _636, _686);
    float _694 = fma(_688, _690, _692);
    float _696 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _698 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _698;
    bool _700 = !_624;
    float _718;
    if (!_700)
    {
        float _702 = in.m_35.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_68);
        float _724 = 1.0 / _722;
        float _726 = _102 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _766;
    float _770 = 1.0 / _748;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _774 = _760 * _764;
    float _776 = -_760;
    float _778 = _776 + 1.0;
    float _780 = _732 * _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_768, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _788;
    float _792 = fma(_784, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _794 = _786 * _774;
    float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = _792 * _774;
    float _800 = _796 * _774;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].x, _794);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].z, _798);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].x, _802);
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].y, _804);
    float _812 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].z, _806);
    bool _814 = !_772;
    float _832;
    if (!_814)
    {
        float _816 = in.m_35.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_68);
        float _838 = 1.0 / _836;
        float _840 = _102 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _846 = _842 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _852 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_842);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _868 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_842);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    bool _884 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _886 = isnan(_842);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / _850;
    float _898 = -_862;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _904 = _878 * _900;
    float _906 = -_878;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _866;
    float _912 = _882 * _896;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = fma(_912, _846, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = _916 * _910;
    float _922 = _918 * _904;
    float _924 = -_894;
    float _926 = _924 + 1.0;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = _842 + _928;
    float _932 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[131].x, _922);
    float _936 = _862 * _926;
    float _938 = fma(_920, _930, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _812 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = fma(_938, _936, _934);
    float _946 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[133].x, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _942;
    out.m_39.y = _952;
    out.m_39.z = _948;
    out.m_39.w = _954;
    bool _956 = !_902;
    float _974;
    if (!_956)
    {
        float _958 = in.m_35.x;
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _962 = _958 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _966 = _964 * _960;
        float _968 = floor(_966);
        float _970 = -_968;
        float _972 = _966 + _970;
        _974 = _972;
        _976 = true;
    }
    else
    {
        float _978 = float(_68);
        float _980 = 1.0 / _978;
        float _982 = _102 * _980;
        _974 = _982;
    }
    _976 = false;
    float _984 = _974;
    float _986 = in.m_41.x;
    float _988 = in.m_41.y;
    float _990 = in.m_41.z;
    float _992 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _994 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _996 = in.m_35.x;
    float _998 = in.m_35.y;
    float _1000 = in.m_35.z;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _992);
    float _1018 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _994);
    float _1020 = in.m_43.x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_1004)
    {
        float _1028 = in.m_35.x;
        _1026 = _1028;
    }
    float _1030 = _1026;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1042 = 1.0 / _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1046 = _998 > 0.5;
    float _1048 = -_1012;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1060 = _1012;
    if (_1010)
    {
        float _1062 = _1046 ? _1050 : _1012;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _996 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1068 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1052);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1074 = 1.0 / _1034;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    float _1086 = _998 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = 1.0 / _1072;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = fma(_1086, -2.0, _1054);
    float _1100 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1102 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1104 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1018);
    float _1106 = _1100 * _1038;
    float _1108 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1110 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = 1.0 / _1058;
    float _1118 = _1110 * _1036;
    float _1120 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1122 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1128 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1130 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1098);
    float _1132 = 1.0 / _1092;
    bool _1134 = _1030 > 0.5;
    bool _1136 = _1134 && _1004;
    float _1138 = _1108 * _1040;
    float _1140 = _1128 * (-0.15915493667125701904296875);
    float _1142 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1144 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = _1114 * _1042;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1150;
    float _1154 = _1126 * _1116;
    float _1156 = _1152 * _1074;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1162 = 1.0 / _1096;
    bool _1164 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_984);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = 1.0 / _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1192 = _1180 * _1088;
    float _1194 = _1184 * _1132;
    float _1196 = _1188 * _1162;
    bool _1198 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1200 = isnan(_984);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1174;
    float _1212 = _1210 + 1.0;
    float _1214 = fma(_1190, _1064, -0.5);
    float _1216 = -_102;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1078);
    float _1220 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1222 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1224;
    bool _1228 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1230 = isnan(_984);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1208 * _1212;
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    bool _1246 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_984);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * _1176;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = _984 + _1260;
    float _1264 = _1238 * _1244;
    float _1266 = -_1238;
    float _1268 = _1266 + 1.0;
    bool _1270 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_984);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1256;
    float _1284 = _1282 + 1.0;
    float _1286 = fma(_1148, _1262, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1288 = _1256 * _1268;
    bool _1290 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_984);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1280 * _1284;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1306 = _984 + _1304;
    float _1308 = -_1280;
    float _1310 = _1308 + 1.0;
    bool _1312 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1314 = isnan(_984);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1326 = _984 + _1324;
    float _1328 = fma(_1156, _1306, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1330 = _1300 * _1310;
    float _1332 = -_1300;
    float _1334 = _1332 + 1.0;
    bool _1336 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1338 = isnan(_984);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1322;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1154, _1326, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1356 = _984 + _1354;
    float _1358 = _1322 * _1334;
    float _1360 = _1346 * _1350;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1366 = _984 + _1364;
    float _1368 = fma(_1192, _1356, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1370 = _1286 * _1360;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1374 = _984 + _1372;
    float _1376 = fma(_1194, _1366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1378 = -_1346;
    float _1380 = _1378 + 1.0;
    float _1382 = _1366;
    float _1384 = _1194;
    if (_1004)
    {
        _1382 = _1020;
    }
    float _1386 = _1382;
    float _1388 = _1140 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1196, _1374, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = _1386;
    if (!_1004)
    {
        _1384 = _1020;
    }
    float _1396 = _1384;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1370);
    float _1400 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1402 = _1396;
    if (_1136)
    {
        float _1404 = -_1386;
        float _1406 = _1404 + 1.0;
        _1394 = _1406;
    }
    float _1408 = _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1412 = _984 + _1410;
    float _1414 = fma(_1352, _1358, _1398);
    float _1416 = _1140 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1400);
    if (_1004)
    {
        _1402 = _1408;
    }
    float _1424 = _1402;
    float _1426 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1430 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1432 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1434 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1436 = fma(_1428, _1424, -0.5);
    float _1438 = _1390 * _1214;
    float _1440 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1430);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1444 = fma(_1328, _1330, _1414);
    float _1446 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1448 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1450 = -_1438;
    float _1452 = fma(_1418, _1436, _1450);
    float _1454 = _1142 + _1442;
    float _1456 = _1418 * _1214;
    float _1458 = fma(_1368, _1302, _1444);
    float _1460 = fma(_1220, _1452, _1218);
    float _1462 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = _1144 + _1448;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = fma(_1258, _1412, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1472 = fma(_1390, _1436, _1456);
    float _1474 = fma(_1376, _1288, _1458);
    float _1476 = _1462 + _1464;
    float _1478 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1480 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1468);
    float _1482 = -_1130;
    float _1484 = fma(_1222, _1472, _1482);
    float _1486 = fma(_1392, _1264, _1474);
    float _1488 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1480);
    float _1494 = fma(_1470, _1240, _1486);
    float _1496 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1498 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1512 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1510);
    float _1522 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1528 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1520);
    float _1532 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1540 = _1460 + 0.5;
    float _1542 = _1484 + 0.5;
    float _1544 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1494);
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1536);
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    out.m_45.x = _1466;
    out.m_45.y = _1454;
    out.m_45.z = _1476;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1540;
    out.m_47.y = _1542;
    out.m_49.x = _1544;
    out.gl_Position.x = _1548;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1550;
    out.gl_Position.w = _1552;
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
    bool _976 = false;
    bool _834 = false;
    bool _720 = false;
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
        float _1609 = as_type<float>(_84);
        out.gl_Position.z = _1609;
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
        float _1678 = as_type<float>(_120);
        out.gl_Position.z = _1678;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _574 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = isnan(_560);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _590 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_560);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _568;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    float _608 = -_584;
    float _610 = _608 + 1.0;
    bool _612 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_560);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _626 = 1.0 / _572;
    float _628 = 1.0 / _588;
    float _630 = _606 * _602;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _600 * _610;
    float _638 = -_600;
    float _640 = _638 + 1.0;
    float _642 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _644;
    float _648 = _622 * _640;
    float _650 = _634 * _626;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _560 + _652;
    bool _656 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _642 * _648;
    float _670 = -_622;
    float _672 = _670 + 1.0;
    float _674 = fma(_650, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _560 + _676;
    float _680 = _646 * _628;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _688 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _584 * _684;
    float _692 = fma(_674, _636, _686);
    float _694 = fma(_688, _690, _692);
    float _696 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _698 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _698;
    bool _700 = !_624;
    float _718;
    if (!_700)
    {
        float _702 = in.m_35.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_68);
        float _724 = 1.0 / _722;
        float _726 = _102 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _766;
    float _770 = 1.0 / _748;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _774 = _760 * _764;
    float _776 = -_760;
    float _778 = _776 + 1.0;
    float _780 = _732 * _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_768, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _788;
    float _792 = fma(_784, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _794 = _786 * _774;
    float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = _792 * _774;
    float _800 = _796 * _774;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].x, _794);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].z, _798);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].x, _802);
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].y, _804);
    float _812 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].z, _806);
    bool _814 = !_772;
    float _832;
    if (!_814)
    {
        float _816 = in.m_35.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_68);
        float _838 = 1.0 / _836;
        float _840 = _102 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _846 = _842 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _852 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_842);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _868 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_842);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    bool _884 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _886 = isnan(_842);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / _850;
    float _898 = -_862;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _904 = _878 * _900;
    float _906 = -_878;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _866;
    float _912 = _882 * _896;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = fma(_912, _846, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = _916 * _910;
    float _922 = _918 * _904;
    float _924 = -_894;
    float _926 = _924 + 1.0;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = _842 + _928;
    float _932 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[131].x, _922);
    float _936 = _862 * _926;
    float _938 = fma(_920, _930, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _812 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = fma(_938, _936, _934);
    float _946 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[133].x, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _942;
    out.m_39.y = _952;
    out.m_39.z = _948;
    out.m_39.w = _954;
    bool _956 = !_902;
    float _974;
    if (!_956)
    {
        float _958 = in.m_35.x;
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _962 = _958 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _966 = _964 * _960;
        float _968 = floor(_966);
        float _970 = -_968;
        float _972 = _966 + _970;
        _974 = _972;
        _976 = true;
    }
    else
    {
        float _978 = float(_68);
        float _980 = 1.0 / _978;
        float _982 = _102 * _980;
        _974 = _982;
    }
    _976 = false;
    float _984 = _974;
    float _986 = in.m_41.x;
    float _988 = in.m_41.y;
    float _990 = in.m_41.z;
    float _992 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _994 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _996 = in.m_35.x;
    float _998 = in.m_35.y;
    float _1000 = in.m_35.z;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _992);
    float _1018 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _994);
    float _1020 = in.m_43.x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_1004)
    {
        float _1028 = in.m_35.x;
        _1026 = _1028;
    }
    float _1030 = _1026;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1042 = 1.0 / _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1046 = _998 > 0.5;
    float _1048 = -_1012;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1060 = _1012;
    if (_1010)
    {
        float _1062 = _1046 ? _1050 : _1012;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _996 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1068 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1052);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1074 = 1.0 / _1034;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    float _1086 = _998 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = 1.0 / _1072;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = fma(_1086, -2.0, _1054);
    float _1100 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1102 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1104 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1018);
    float _1106 = _1100 * _1038;
    float _1108 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1110 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = 1.0 / _1058;
    float _1118 = _1110 * _1036;
    float _1120 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1122 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1128 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1130 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1098);
    float _1132 = 1.0 / _1092;
    bool _1134 = _1030 > 0.5;
    bool _1136 = _1134 && _1004;
    float _1138 = _1108 * _1040;
    float _1140 = _1128 * (-0.15915493667125701904296875);
    float _1142 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1144 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = _1114 * _1042;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1150;
    float _1154 = _1126 * _1116;
    float _1156 = _1152 * _1074;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1162 = 1.0 / _1096;
    bool _1164 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_984);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = 1.0 / _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1192 = _1180 * _1088;
    float _1194 = _1184 * _1132;
    float _1196 = _1188 * _1162;
    bool _1198 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1200 = isnan(_984);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1174;
    float _1212 = _1210 + 1.0;
    float _1214 = fma(_1190, _1064, -0.5);
    float _1216 = -_102;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1078);
    float _1220 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1222 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1224;
    bool _1228 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1230 = isnan(_984);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1208 * _1212;
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    bool _1246 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_984);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * _1176;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = _984 + _1260;
    float _1264 = _1238 * _1244;
    float _1266 = -_1238;
    float _1268 = _1266 + 1.0;
    bool _1270 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_984);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1256;
    float _1284 = _1282 + 1.0;
    float _1286 = fma(_1148, _1262, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1288 = _1256 * _1268;
    bool _1290 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_984);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1280 * _1284;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1306 = _984 + _1304;
    float _1308 = -_1280;
    float _1310 = _1308 + 1.0;
    bool _1312 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1314 = isnan(_984);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1326 = _984 + _1324;
    float _1328 = fma(_1156, _1306, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1330 = _1300 * _1310;
    float _1332 = -_1300;
    float _1334 = _1332 + 1.0;
    bool _1336 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1338 = isnan(_984);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1322;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1154, _1326, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1356 = _984 + _1354;
    float _1358 = _1322 * _1334;
    float _1360 = _1346 * _1350;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1366 = _984 + _1364;
    float _1368 = fma(_1192, _1356, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1370 = _1286 * _1360;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1374 = _984 + _1372;
    float _1376 = fma(_1194, _1366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1378 = -_1346;
    float _1380 = _1378 + 1.0;
    float _1382 = _1366;
    float _1384 = _1194;
    if (_1004)
    {
        _1382 = _1020;
    }
    float _1386 = _1382;
    float _1388 = _1140 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1196, _1374, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = _1386;
    if (!_1004)
    {
        _1384 = _1020;
    }
    float _1396 = _1384;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1370);
    float _1400 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1402 = _1396;
    if (_1136)
    {
        float _1404 = -_1386;
        float _1406 = _1404 + 1.0;
        _1394 = _1406;
    }
    float _1408 = _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1412 = _984 + _1410;
    float _1414 = fma(_1352, _1358, _1398);
    float _1416 = _1140 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1400);
    if (_1004)
    {
        _1402 = _1408;
    }
    float _1424 = _1402;
    float _1426 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1430 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1432 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1434 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1436 = fma(_1428, _1424, -0.5);
    float _1438 = _1390 * _1214;
    float _1440 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1430);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1444 = fma(_1328, _1330, _1414);
    float _1446 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1448 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1450 = -_1438;
    float _1452 = fma(_1418, _1436, _1450);
    float _1454 = _1142 + _1442;
    float _1456 = _1418 * _1214;
    float _1458 = fma(_1368, _1302, _1444);
    float _1460 = fma(_1220, _1452, _1218);
    float _1462 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = _1144 + _1448;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = fma(_1258, _1412, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1472 = fma(_1390, _1436, _1456);
    float _1474 = fma(_1376, _1288, _1458);
    float _1476 = _1462 + _1464;
    float _1478 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1480 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1468);
    float _1482 = -_1130;
    float _1484 = fma(_1222, _1472, _1482);
    float _1486 = fma(_1392, _1264, _1474);
    float _1488 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1480);
    float _1494 = fma(_1470, _1240, _1486);
    float _1496 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1498 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1512 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1510);
    float _1522 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1528 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1520);
    float _1532 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1540 = _1460 + 0.5;
    float _1542 = _1484 + 0.5;
    float _1544 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1494);
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1536);
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    out.m_45.x = _1466;
    out.m_45.y = _1454;
    out.m_45.z = _1476;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1540;
    out.m_47.y = _1542;
    out.m_49.x = _1544;
    out.gl_Position.x = _1548;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1550;
    out.gl_Position.w = _1552;
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
    bool _976 = false;
    bool _834 = false;
    bool _720 = false;
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
        float _1609 = as_type<float>(_84);
        out.gl_Position.z = _1609;
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
        float _1678 = as_type<float>(_120);
        out.gl_Position.z = _1678;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _574 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = isnan(_560);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _590 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_560);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _568;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    float _608 = -_584;
    float _610 = _608 + 1.0;
    bool _612 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_560);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _626 = 1.0 / _572;
    float _628 = 1.0 / _588;
    float _630 = _606 * _602;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = _600 * _610;
    float _638 = -_600;
    float _640 = _638 + 1.0;
    float _642 = fma(_630, _564, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _644;
    float _648 = _622 * _640;
    float _650 = _634 * _626;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _560 + _652;
    bool _656 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _642 * _648;
    float _670 = -_622;
    float _672 = _670 + 1.0;
    float _674 = fma(_650, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _560 + _676;
    float _680 = _646 * _628;
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _668);
    float _688 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _584 * _684;
    float _692 = fma(_674, _636, _686);
    float _694 = fma(_688, _690, _692);
    float _696 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[118].x, _694);
    float _698 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _698;
    bool _700 = !_624;
    float _718;
    if (!_700)
    {
        float _702 = in.m_35.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_68);
        float _724 = 1.0 / _722;
        float _726 = _102 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _732 = _728 + _730;
    bool _734 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _736 = isnan(_728);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _746;
    bool _750 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_728);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _766;
    float _770 = 1.0 / _748;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _774 = _760 * _764;
    float _776 = -_760;
    float _778 = _776 + 1.0;
    float _780 = _732 * _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_768, _780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _788;
    float _792 = fma(_784, _780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _794 = _786 * _774;
    float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _798 = _792 * _774;
    float _800 = _796 * _774;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].x, _794);
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[123].z, _798);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].x, _802);
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].y, _804);
    float _812 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[124].z, _806);
    bool _814 = !_772;
    float _832;
    if (!_814)
    {
        float _816 = in.m_35.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_68);
        float _838 = 1.0 / _836;
        float _840 = _102 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _846 = _842 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _852 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_842);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _868 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_842);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    bool _884 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _886 = isnan(_842);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / _850;
    float _898 = -_862;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _904 = _878 * _900;
    float _906 = -_878;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _866;
    float _912 = _882 * _896;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = fma(_912, _846, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = _916 * _910;
    float _922 = _918 * _904;
    float _924 = -_894;
    float _926 = _924 + 1.0;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = _842 + _928;
    float _932 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[131].x, _922);
    float _936 = _862 * _926;
    float _938 = fma(_920, _930, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _812 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = fma(_938, _936, _934);
    float _946 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[133].x, _944);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _942;
    out.m_39.y = _952;
    out.m_39.z = _948;
    out.m_39.w = _954;
    bool _956 = !_902;
    float _974;
    if (!_956)
    {
        float _958 = in.m_35.x;
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _962 = _958 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _966 = _964 * _960;
        float _968 = floor(_966);
        float _970 = -_968;
        float _972 = _966 + _970;
        _974 = _972;
        _976 = true;
    }
    else
    {
        float _978 = float(_68);
        float _980 = 1.0 / _978;
        float _982 = _102 * _980;
        _974 = _982;
    }
    _976 = false;
    float _984 = _974;
    float _986 = in.m_41.x;
    float _988 = in.m_41.y;
    float _990 = in.m_41.z;
    float _992 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _994 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _996 = in.m_35.x;
    float _998 = in.m_35.y;
    float _1000 = in.m_35.z;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1004 = _1002 != 0;
    float _1006 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_43.y;
    float _1014 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1016 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _992);
    float _1018 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _994);
    float _1020 = in.m_43.x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    if (_1004)
    {
        float _1028 = in.m_35.x;
        _1026 = _1028;
    }
    float _1030 = _1026;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1042 = 1.0 / _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1046 = _998 > 0.5;
    float _1048 = -_1012;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1060 = _1012;
    if (_1010)
    {
        float _1062 = _1046 ? _1050 : _1012;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _996 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1068 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1052);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1074 = 1.0 / _1034;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    float _1086 = _998 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = 1.0 / _1072;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = fma(_1086, -2.0, _1054);
    float _1100 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1102 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1104 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1018);
    float _1106 = _1100 * _1038;
    float _1108 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1110 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1112;
    float _1116 = 1.0 / _1058;
    float _1118 = _1110 * _1036;
    float _1120 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1122 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1014);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1128 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1130 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1098);
    float _1132 = 1.0 / _1092;
    bool _1134 = _1030 > 0.5;
    bool _1136 = _1134 && _1004;
    float _1138 = _1108 * _1040;
    float _1140 = _1128 * (-0.15915493667125701904296875);
    float _1142 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1144 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = _1114 * _1042;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1150;
    float _1154 = _1126 * _1116;
    float _1156 = _1152 * _1074;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1162 = 1.0 / _1096;
    bool _1164 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_984);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = 1.0 / _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1192 = _1180 * _1088;
    float _1194 = _1184 * _1132;
    float _1196 = _1188 * _1162;
    bool _1198 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1200 = isnan(_984);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1174;
    float _1212 = _1210 + 1.0;
    float _1214 = fma(_1190, _1064, -0.5);
    float _1216 = -_102;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1078);
    float _1220 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1084);
    float _1222 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1102);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1224;
    bool _1228 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1230 = isnan(_984);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1208 * _1212;
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    bool _1246 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1248 = isnan(_984);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1226 * _1176;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = _984 + _1260;
    float _1264 = _1238 * _1244;
    float _1266 = -_1238;
    float _1268 = _1266 + 1.0;
    bool _1270 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_984);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1256;
    float _1284 = _1282 + 1.0;
    float _1286 = fma(_1148, _1262, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1288 = _1256 * _1268;
    bool _1290 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_984);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1280 * _1284;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1306 = _984 + _1304;
    float _1308 = -_1280;
    float _1310 = _1308 + 1.0;
    bool _1312 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1314 = isnan(_984);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1326 = _984 + _1324;
    float _1328 = fma(_1156, _1306, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1330 = _1300 * _1310;
    float _1332 = -_1300;
    float _1334 = _1332 + 1.0;
    bool _1336 = _984 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1338 = isnan(_984);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1322;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1154, _1326, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1356 = _984 + _1354;
    float _1358 = _1322 * _1334;
    float _1360 = _1346 * _1350;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1366 = _984 + _1364;
    float _1368 = fma(_1192, _1356, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1370 = _1286 * _1360;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1374 = _984 + _1372;
    float _1376 = fma(_1194, _1366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1378 = -_1346;
    float _1380 = _1378 + 1.0;
    float _1382 = _1366;
    float _1384 = _1194;
    if (_1004)
    {
        _1382 = _1020;
    }
    float _1386 = _1382;
    float _1388 = _1140 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1196, _1374, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = _1386;
    if (!_1004)
    {
        _1384 = _1020;
    }
    float _1396 = _1384;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1370);
    float _1400 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1402 = _1396;
    if (_1136)
    {
        float _1404 = -_1386;
        float _1406 = _1404 + 1.0;
        _1394 = _1406;
    }
    float _1408 = _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1412 = _984 + _1410;
    float _1414 = fma(_1352, _1358, _1398);
    float _1416 = _1140 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1422 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1400);
    if (_1004)
    {
        _1402 = _1408;
    }
    float _1424 = _1402;
    float _1426 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1430 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1420);
    float _1432 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1422);
    float _1434 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1436 = fma(_1428, _1424, -0.5);
    float _1438 = _1390 * _1214;
    float _1440 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1430);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1444 = fma(_1328, _1330, _1414);
    float _1446 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1434);
    float _1448 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1450 = -_1438;
    float _1452 = fma(_1418, _1436, _1450);
    float _1454 = _1142 + _1442;
    float _1456 = _1418 * _1214;
    float _1458 = fma(_1368, _1302, _1444);
    float _1460 = fma(_1220, _1452, _1218);
    float _1462 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = _1144 + _1448;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = fma(_1258, _1412, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1472 = fma(_1390, _1436, _1456);
    float _1474 = fma(_1376, _1288, _1458);
    float _1476 = _1462 + _1464;
    float _1478 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1480 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1468);
    float _1482 = -_1130;
    float _1484 = fma(_1222, _1472, _1482);
    float _1486 = fma(_1392, _1264, _1474);
    float _1488 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1480);
    float _1494 = fma(_1470, _1240, _1486);
    float _1496 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1498 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1512 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1510);
    float _1522 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1524 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1528 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1520);
    float _1532 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1540 = _1460 + 0.5;
    float _1542 = _1484 + 0.5;
    float _1544 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1494);
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1530);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1550 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1536);
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    out.m_45.x = _1466;
    out.m_45.y = _1454;
    out.m_45.z = _1476;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1540;
    out.m_47.y = _1542;
    out.m_49.x = _1544;
    out.gl_Position.x = _1548;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1550;
    out.gl_Position.w = _1552;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

