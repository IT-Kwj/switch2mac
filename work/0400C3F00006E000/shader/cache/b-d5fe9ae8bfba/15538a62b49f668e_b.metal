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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 m_49 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _682 = false;
    bool _490 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1341 = as_type<float>(_84);
        out.gl_Position.z = _1341;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1410 = as_type<float>(_120);
        out.gl_Position.z = _1410;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
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
    float _246 = _242;
    float _248 = _238;
    float _266;
    if (!_244)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_68);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _276 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = 1.0 / _300;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = 1.0 / _308;
    float _322 = _280 * _314;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = _334 * _338;
    float _342 = _284 * _318;
    bool _344 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_276);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_276);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_334;
    float _378 = _376 + 1.0;
    float _380 = -_354;
    float _382 = _380 + 1.0;
    float _384 = _304 * _320;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _370 * _382;
    float _396 = fma(_358, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _354 * _378;
    float _404 = -_370;
    float _406 = _404 + 1.0;
    float _408 = _398 * _394;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _400 * _394;
    float _420 = _396 * _394;
    float _422 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].y, _418);
    float _426 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].z, _420);
    float _428 = fma(_374, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_428, _402, _422);
    float _448 = fma(_436, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_430, _402, _424);
    float _456 = fma(_432, _402, _426);
    float _458 = fma(_448, _340, _446);
    float _460 = fma(_450, _340, _454);
    float _462 = fma(_452, _340, _456);
    float _464 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_316;
    float _488;
    if (!_470)
    {
        float _472 = in.m_39.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_68);
        float _494 = 1.0 / _492;
        float _496 = _102 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_498);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _528 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_498);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -_522;
    float _548 = _546 + 1.0;
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _564 = 1.0 / _510;
    float _566 = 1.0 / _526;
    float _568 = _544 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = _538 * _548;
    float _576 = -_538;
    float _578 = _576 + 1.0;
    float _580 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _582;
    float _586 = _560 * _578;
    float _588 = _572 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _498 + _590;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _580 * _586;
    float _608 = -_560;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _498 + _614;
    float _618 = _584 * _566;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _606);
    float _626 = fma(_618, _616, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _628 = _522 * _622;
    float _630 = fma(_612, _574, _624);
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = fma(_626, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _638 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[118].x, _634);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _648 = in.m_37.x;
    float _650 = in.m_37.y;
    float _652 = in.m_37.z;
    float _654 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _644;
    out.m_41.y = _654;
    out.m_41.z = _638;
    out.m_41.w = _646;
    float _656 = _468 * _652;
    float _658 = _466 * _650;
    float _660 = _464 * _648;
    bool _662 = !_562;
    float _680;
    if (!_662)
    {
        float _664 = in.m_39.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
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
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _710;
    bool _714 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _698;
    bool _728 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_690);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = -_738;
    float _746 = _744 + 1.0;
    float _748 = 1.0 / _704;
    float _750 = _712 * _700;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _756 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _758 = isnan(_690);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _768;
    float _772 = 1.0 / _708;
    float _774 = _754 * _726;
    bool _776 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = isnan(_690);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _766 * _746;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _770 * _748;
    bool _804 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _806 = isnan(_690);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _786 * _796;
    float _818 = 1.0 / _742;
    float _820 = -_814;
    float _822 = _820 + 1.0;
    float _824 = _814 * _800;
    float _826 = _792 * _772;
    bool _828 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_690);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _844 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _846 = isnan(_690);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _838 * _822;
    float _858 = -_838;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _866 = 1.0 / _842;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _690 + _868;
    float _872 = _854 * _860;
    float _874 = -_854;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _880 = _690 + _878;
    float _882 = fma(_750, _870, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _884 = _724 * _876;
    float _886 = 1.0 / _864;
    float _888 = fma(_774, _880, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _890 = _882 * _884;
    float _892 = -_724;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = _690 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[159].y, _890);
    float _910 = fma(_802, _898, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _912 = _902 * _866;
    float _914 = _906 * _886;
    float _916 = fma(_888, _872, _908);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _920 = _690 + _918;
    float _922 = in.m_43.x;
    float _924 = in.m_43.y;
    float _926 = in.m_43.z;
    float _928 = fma(_910, _856, _916);
    float _930 = fma(_826, _920, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _932 = in.m_45.x;
    float _934 = in.m_45.y;
    float _936 = in.m_45.z;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _690 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _948 = isnan(_690);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _960 = _690 + _958;
    float _962 = fma(_912, _940, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _964 = fma(_930, _824, _928);
    float _966 = _944 * _818;
    float _968 = fma(_914, _960, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _976 = _690 + _974;
    float _978 = fma(_962, _816, _964);
    float _980 = _738 * _972;
    float _982 = fma(_966, _976, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _984 = fma(_968, _788, _978);
    float _986 = fma(_982, _980, _984);
    out.m_47.x = _922;
    out.m_47.y = _924;
    out.m_47.z = _926;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[166].y, _986);
    float _990 = -_922;
    float _992 = _990 + _932;
    float _994 = -_926;
    float _996 = _994 + _936;
    float _998 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_988, _992, _922);
    float _1002 = -_924;
    float _1004 = _1002 + _934;
    float _1006 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1008 = fma(_988, _996, _926);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1012 = fma(_988, _1004, _924);
    float _1014 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1018 = _1010 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1022 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1024 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1026 = _1016 * _1014;
    float _1028 = _1020 * _1006;
    float _1030 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1022);
    float _1032 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1024);
    float _1034 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1040 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1044);
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1056 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1058 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1060 = _1046 + _1052;
    float _1062 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1054);
    float _1064 = _1050 + _1056;
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1070 = _1060 + _1068;
    float _1072 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1064 + _1074;
    float _1078 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1080 = _1070 * _1070;
    bool _1082 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1084 = isnan(0.5);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1090 = _1086 || _1088;
    float _1092 = _1078 + _1072;
    float _1094 = fma(_1076, _1076, _1080);
    float _1096 = sqrt(_1094);
    bool _1098 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = _1066;
    if (!_1098)
    {
        _246 = _1064;
    }
    float _1102 = _246;
    float _1104 = _1102;
    if (!_1098)
    {
        _248 = _1060;
    }
    float _1106 = _248;
    float _1108 = _1106;
    if (!_1098)
    {
        _1100 = _1092;
    }
    float _1110 = _1100;
    bool _1112 = !_1098;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1096 + _1118;
        float _1122 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_1094);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1136, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = fma(_1092, _1132, _1140);
        float _1146 = _1124 * _1142;
        float _1148 = fma(_1076, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1070, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1148;
        _1114 = _1144;
        _1108 = _1150;
    }
    float _1152 = _1104;
    float _1154 = _1114;
    float _1156 = _1108;
    float _1158 = _1154;
    float _1160 = _1152;
    float _1162 = _1156;
    if (!_1090)
    {
        float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1166 = _1078 + _1164;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1170 = _1050 + _1168;
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1174 = -_1050;
        float _1176 = _1174 + _1152;
        float _1178 = _1166 * _1166;
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1182 = _1046 + _1180;
        float _1184 = -_1078;
        float _1186 = _1184 + _1154;
        float _1188 = -_1046;
        float _1190 = _1188 + _1156;
        float _1192 = fma(_1170, _1170, _1178);
        float _1194 = fma(_1182, _1182, _1192);
        float _1196 = sqrt(_1194);
        float _1198 = precise::min(_1196, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1200 = _1198 * _1172;
        float _1202 = fma(_1176, _1200, _1050);
        float _1204 = fma(_1186, _1200, _1078);
        float _1206 = fma(_1190, _1200, _1046);
        _1158 = _1204;
        _1160 = _1202;
        _1162 = _1206;
    }
    float _1208 = _1158;
    float _1210 = _1160;
    float _1212 = _1162;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1214);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1236 = in.m_43.w;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1228);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1248 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1246);
    float _1256 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1274 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 + _1274;
    float _1282 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1284 = _1280 * 0.5;
    out.m_47.w = _1236;
    out.m_33.x = _1282;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1272;
    out.gl_Position.w = _1274;
    out.m_49.z = _1284;
    out.m_49.w = _1274;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _682 = false;
    bool _490 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1341 = as_type<float>(_84);
        out.gl_Position.z = _1341;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1410 = as_type<float>(_120);
        out.gl_Position.z = _1410;
    }
    if (_112)
    {
        return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
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
    float _246 = _242;
    float _248 = _238;
    float _266;
    if (!_244)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_68);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _276 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = 1.0 / _300;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = 1.0 / _308;
    float _322 = _280 * _314;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = _334 * _338;
    float _342 = _284 * _318;
    bool _344 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_276);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_276);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_334;
    float _378 = _376 + 1.0;
    float _380 = -_354;
    float _382 = _380 + 1.0;
    float _384 = _304 * _320;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _370 * _382;
    float _396 = fma(_358, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _354 * _378;
    float _404 = -_370;
    float _406 = _404 + 1.0;
    float _408 = _398 * _394;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _400 * _394;
    float _420 = _396 * _394;
    float _422 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].y, _418);
    float _426 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].z, _420);
    float _428 = fma(_374, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_428, _402, _422);
    float _448 = fma(_436, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_430, _402, _424);
    float _456 = fma(_432, _402, _426);
    float _458 = fma(_448, _340, _446);
    float _460 = fma(_450, _340, _454);
    float _462 = fma(_452, _340, _456);
    float _464 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_316;
    float _488;
    if (!_470)
    {
        float _472 = in.m_39.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_68);
        float _494 = 1.0 / _492;
        float _496 = _102 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_498);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _528 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_498);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -_522;
    float _548 = _546 + 1.0;
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _564 = 1.0 / _510;
    float _566 = 1.0 / _526;
    float _568 = _544 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = _538 * _548;
    float _576 = -_538;
    float _578 = _576 + 1.0;
    float _580 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _582;
    float _586 = _560 * _578;
    float _588 = _572 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _498 + _590;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _580 * _586;
    float _608 = -_560;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _498 + _614;
    float _618 = _584 * _566;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _606);
    float _626 = fma(_618, _616, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _628 = _522 * _622;
    float _630 = fma(_612, _574, _624);
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = fma(_626, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _638 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[118].x, _634);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _648 = in.m_37.x;
    float _650 = in.m_37.y;
    float _652 = in.m_37.z;
    float _654 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _644;
    out.m_41.y = _654;
    out.m_41.z = _638;
    out.m_41.w = _646;
    float _656 = _468 * _652;
    float _658 = _466 * _650;
    float _660 = _464 * _648;
    bool _662 = !_562;
    float _680;
    if (!_662)
    {
        float _664 = in.m_39.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
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
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _710;
    bool _714 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _698;
    bool _728 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_690);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = -_738;
    float _746 = _744 + 1.0;
    float _748 = 1.0 / _704;
    float _750 = _712 * _700;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _756 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _758 = isnan(_690);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _768;
    float _772 = 1.0 / _708;
    float _774 = _754 * _726;
    bool _776 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = isnan(_690);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _766 * _746;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _770 * _748;
    bool _804 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _806 = isnan(_690);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _786 * _796;
    float _818 = 1.0 / _742;
    float _820 = -_814;
    float _822 = _820 + 1.0;
    float _824 = _814 * _800;
    float _826 = _792 * _772;
    bool _828 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_690);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _844 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _846 = isnan(_690);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _838 * _822;
    float _858 = -_838;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _866 = 1.0 / _842;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _690 + _868;
    float _872 = _854 * _860;
    float _874 = -_854;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _880 = _690 + _878;
    float _882 = fma(_750, _870, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _884 = _724 * _876;
    float _886 = 1.0 / _864;
    float _888 = fma(_774, _880, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _890 = _882 * _884;
    float _892 = -_724;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = _690 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[159].y, _890);
    float _910 = fma(_802, _898, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _912 = _902 * _866;
    float _914 = _906 * _886;
    float _916 = fma(_888, _872, _908);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _920 = _690 + _918;
    float _922 = in.m_43.x;
    float _924 = in.m_43.y;
    float _926 = in.m_43.z;
    float _928 = fma(_910, _856, _916);
    float _930 = fma(_826, _920, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _932 = in.m_45.x;
    float _934 = in.m_45.y;
    float _936 = in.m_45.z;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _690 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _948 = isnan(_690);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _960 = _690 + _958;
    float _962 = fma(_912, _940, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _964 = fma(_930, _824, _928);
    float _966 = _944 * _818;
    float _968 = fma(_914, _960, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _976 = _690 + _974;
    float _978 = fma(_962, _816, _964);
    float _980 = _738 * _972;
    float _982 = fma(_966, _976, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _984 = fma(_968, _788, _978);
    float _986 = fma(_982, _980, _984);
    out.m_47.x = _922;
    out.m_47.y = _924;
    out.m_47.z = _926;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[166].y, _986);
    float _990 = -_922;
    float _992 = _990 + _932;
    float _994 = -_926;
    float _996 = _994 + _936;
    float _998 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_988, _992, _922);
    float _1002 = -_924;
    float _1004 = _1002 + _934;
    float _1006 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1008 = fma(_988, _996, _926);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1012 = fma(_988, _1004, _924);
    float _1014 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1018 = _1010 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1022 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1024 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1026 = _1016 * _1014;
    float _1028 = _1020 * _1006;
    float _1030 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1022);
    float _1032 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1024);
    float _1034 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1040 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1044);
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1056 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1058 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1060 = _1046 + _1052;
    float _1062 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1054);
    float _1064 = _1050 + _1056;
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1070 = _1060 + _1068;
    float _1072 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1064 + _1074;
    float _1078 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1080 = _1070 * _1070;
    bool _1082 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1084 = isnan(0.5);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1090 = _1086 || _1088;
    float _1092 = _1078 + _1072;
    float _1094 = fma(_1076, _1076, _1080);
    float _1096 = sqrt(_1094);
    bool _1098 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = _1066;
    if (!_1098)
    {
        _246 = _1064;
    }
    float _1102 = _246;
    float _1104 = _1102;
    if (!_1098)
    {
        _248 = _1060;
    }
    float _1106 = _248;
    float _1108 = _1106;
    if (!_1098)
    {
        _1100 = _1092;
    }
    float _1110 = _1100;
    bool _1112 = !_1098;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1096 + _1118;
        float _1122 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_1094);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1136, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = fma(_1092, _1132, _1140);
        float _1146 = _1124 * _1142;
        float _1148 = fma(_1076, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1070, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1148;
        _1114 = _1144;
        _1108 = _1150;
    }
    float _1152 = _1104;
    float _1154 = _1114;
    float _1156 = _1108;
    float _1158 = _1154;
    float _1160 = _1152;
    float _1162 = _1156;
    if (!_1090)
    {
        float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1166 = _1078 + _1164;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1170 = _1050 + _1168;
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1174 = -_1050;
        float _1176 = _1174 + _1152;
        float _1178 = _1166 * _1166;
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1182 = _1046 + _1180;
        float _1184 = -_1078;
        float _1186 = _1184 + _1154;
        float _1188 = -_1046;
        float _1190 = _1188 + _1156;
        float _1192 = fma(_1170, _1170, _1178);
        float _1194 = fma(_1182, _1182, _1192);
        float _1196 = sqrt(_1194);
        float _1198 = precise::min(_1196, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1200 = _1198 * _1172;
        float _1202 = fma(_1176, _1200, _1050);
        float _1204 = fma(_1186, _1200, _1078);
        float _1206 = fma(_1190, _1200, _1046);
        _1158 = _1204;
        _1160 = _1202;
        _1162 = _1206;
    }
    float _1208 = _1158;
    float _1210 = _1160;
    float _1212 = _1162;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1214);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1236 = in.m_43.w;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1228);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1248 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1246);
    float _1256 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1274 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 + _1274;
    float _1282 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1284 = _1280 * 0.5;
    out.m_47.w = _1236;
    out.m_33.x = _1282;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1272;
    out.gl_Position.w = _1274;
    out.m_49.z = _1284;
    out.m_49.w = _1274;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _682 = false;
    bool _490 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1341 = as_type<float>(_84);
        out.gl_Position.z = _1341;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1410 = as_type<float>(_120);
        out.gl_Position.z = _1410;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
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
    float _246 = _242;
    float _248 = _238;
    float _266;
    if (!_244)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_68);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _276 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = 1.0 / _300;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = 1.0 / _308;
    float _322 = _280 * _314;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = _334 * _338;
    float _342 = _284 * _318;
    bool _344 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_276);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_276);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_334;
    float _378 = _376 + 1.0;
    float _380 = -_354;
    float _382 = _380 + 1.0;
    float _384 = _304 * _320;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _370 * _382;
    float _396 = fma(_358, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _354 * _378;
    float _404 = -_370;
    float _406 = _404 + 1.0;
    float _408 = _398 * _394;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = _400 * _394;
    float _420 = _396 * _394;
    float _422 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _424 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].y, _418);
    float _426 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[143].z, _420);
    float _428 = fma(_374, _342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_412, _342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _432 = fma(_416, _342, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_428, _402, _422);
    float _448 = fma(_436, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_430, _402, _424);
    float _456 = fma(_432, _402, _426);
    float _458 = fma(_448, _340, _446);
    float _460 = fma(_450, _340, _454);
    float _462 = fma(_452, _340, _456);
    float _464 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_316;
    float _488;
    if (!_470)
    {
        float _472 = in.m_39.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_68);
        float _494 = 1.0 / _492;
        float _496 = _102 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _498 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_498);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _528 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_498);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -_522;
    float _548 = _546 + 1.0;
    bool _550 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_498);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _564 = 1.0 / _510;
    float _566 = 1.0 / _526;
    float _568 = _544 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = _538 * _548;
    float _576 = -_538;
    float _578 = _576 + 1.0;
    float _580 = fma(_568, _502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _582;
    float _586 = _560 * _578;
    float _588 = _572 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _498 + _590;
    bool _594 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _596 = isnan(_498);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = _580 * _586;
    float _608 = -_560;
    float _610 = _608 + 1.0;
    float _612 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _498 + _614;
    float _618 = _584 * _566;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _606);
    float _626 = fma(_618, _616, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _628 = _522 * _622;
    float _630 = fma(_612, _574, _624);
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _634 = fma(_626, _628, _630);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _638 = _632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[118].x, _634);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _648 = in.m_37.x;
    float _650 = in.m_37.y;
    float _652 = in.m_37.z;
    float _654 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _644;
    out.m_41.y = _654;
    out.m_41.z = _638;
    out.m_41.w = _646;
    float _656 = _468 * _652;
    float _658 = _466 * _650;
    float _660 = _464 * _648;
    bool _662 = !_562;
    float _680;
    if (!_662)
    {
        float _664 = in.m_39.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
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
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _710;
    bool _714 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _716 = isnan(_690);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _698;
    bool _728 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _730 = isnan(_690);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = -_738;
    float _746 = _744 + 1.0;
    float _748 = 1.0 / _704;
    float _750 = _712 * _700;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _756 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _758 = isnan(_690);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _768;
    float _772 = 1.0 / _708;
    float _774 = _754 * _726;
    bool _776 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _778 = isnan(_690);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _766 * _746;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _770 * _748;
    bool _804 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _806 = isnan(_690);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _786 * _796;
    float _818 = 1.0 / _742;
    float _820 = -_814;
    float _822 = _820 + 1.0;
    float _824 = _814 * _800;
    float _826 = _792 * _772;
    bool _828 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _830 = isnan(_690);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _844 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _846 = isnan(_690);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _838 * _822;
    float _858 = -_838;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _866 = 1.0 / _842;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _690 + _868;
    float _872 = _854 * _860;
    float _874 = -_854;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _880 = _690 + _878;
    float _882 = fma(_750, _870, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _884 = _724 * _876;
    float _886 = 1.0 / _864;
    float _888 = fma(_774, _880, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _890 = _882 * _884;
    float _892 = -_724;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = _690 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[159].y, _890);
    float _910 = fma(_802, _898, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _912 = _902 * _866;
    float _914 = _906 * _886;
    float _916 = fma(_888, _872, _908);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _920 = _690 + _918;
    float _922 = in.m_43.x;
    float _924 = in.m_43.y;
    float _926 = in.m_43.z;
    float _928 = fma(_910, _856, _916);
    float _930 = fma(_826, _920, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _932 = in.m_45.x;
    float _934 = in.m_45.y;
    float _936 = in.m_45.z;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _690 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _948 = isnan(_690);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _960 = _690 + _958;
    float _962 = fma(_912, _940, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _964 = fma(_930, _824, _928);
    float _966 = _944 * _818;
    float _968 = fma(_914, _960, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _970 = -_956;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _976 = _690 + _974;
    float _978 = fma(_962, _816, _964);
    float _980 = _738 * _972;
    float _982 = fma(_966, _976, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _984 = fma(_968, _788, _978);
    float _986 = fma(_982, _980, _984);
    out.m_47.x = _922;
    out.m_47.y = _924;
    out.m_47.z = _926;
    float _988 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[166].y, _986);
    float _990 = -_922;
    float _992 = _990 + _932;
    float _994 = -_926;
    float _996 = _994 + _936;
    float _998 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_988, _992, _922);
    float _1002 = -_924;
    float _1004 = _1002 + _934;
    float _1006 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1008 = fma(_988, _996, _926);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1012 = fma(_988, _1004, _924);
    float _1014 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1018 = _1010 * _998;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1022 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1024 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1026 = _1016 * _1014;
    float _1028 = _1020 * _1006;
    float _1030 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1022);
    float _1032 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1024);
    float _1034 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1040 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1050 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1044);
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1056 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1058 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1060 = _1046 + _1052;
    float _1062 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1054);
    float _1064 = _1050 + _1056;
    float _1066 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1058);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1070 = _1060 + _1068;
    float _1072 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1064 + _1074;
    float _1078 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1080 = _1070 * _1070;
    bool _1082 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1084 = isnan(0.5);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1090 = _1086 || _1088;
    float _1092 = _1078 + _1072;
    float _1094 = fma(_1076, _1076, _1080);
    float _1096 = sqrt(_1094);
    bool _1098 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = _1066;
    if (!_1098)
    {
        _246 = _1064;
    }
    float _1102 = _246;
    float _1104 = _1102;
    if (!_1098)
    {
        _248 = _1060;
    }
    float _1106 = _248;
    float _1108 = _1106;
    if (!_1098)
    {
        _1100 = _1092;
    }
    float _1110 = _1100;
    bool _1112 = !_1098;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1096 + _1118;
        float _1122 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = rsqrt(_1094);
        float _1126 = _1120 * _1116;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = fma(_1136, _1122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = fma(_1092, _1132, _1140);
        float _1146 = _1124 * _1142;
        float _1148 = fma(_1076, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1070, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1148;
        _1114 = _1144;
        _1108 = _1150;
    }
    float _1152 = _1104;
    float _1154 = _1114;
    float _1156 = _1108;
    float _1158 = _1154;
    float _1160 = _1152;
    float _1162 = _1156;
    if (!_1090)
    {
        float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1166 = _1078 + _1164;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1170 = _1050 + _1168;
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1174 = -_1050;
        float _1176 = _1174 + _1152;
        float _1178 = _1166 * _1166;
        float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1182 = _1046 + _1180;
        float _1184 = -_1078;
        float _1186 = _1184 + _1154;
        float _1188 = -_1046;
        float _1190 = _1188 + _1156;
        float _1192 = fma(_1170, _1170, _1178);
        float _1194 = fma(_1182, _1182, _1192);
        float _1196 = sqrt(_1194);
        float _1198 = precise::min(_1196, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1200 = _1198 * _1172;
        float _1202 = fma(_1176, _1200, _1050);
        float _1204 = fma(_1186, _1200, _1078);
        float _1206 = fma(_1190, _1200, _1046);
        _1158 = _1204;
        _1160 = _1202;
        _1162 = _1206;
    }
    float _1208 = _1158;
    float _1210 = _1160;
    float _1212 = _1162;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1214);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1216);
    float _1226 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1218);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1224);
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1236 = in.m_43.w;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1242 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1228);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1248 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1246);
    float _1256 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1250);
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1254);
    float _1266 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1256);
    float _1268 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1258);
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1260);
    float _1272 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1274 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1276 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 + _1274;
    float _1282 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1284 = _1280 * 0.5;
    out.m_47.w = _1236;
    out.m_33.x = _1282;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1272;
    out.gl_Position.w = _1274;
    out.m_49.z = _1284;
    out.m_49.w = _1274;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

