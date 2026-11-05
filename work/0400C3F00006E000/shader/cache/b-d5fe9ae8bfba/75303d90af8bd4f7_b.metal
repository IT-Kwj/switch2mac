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
    float4 m_49 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_39 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _846 = false;
    bool _666 = false;
    bool _486 = false;
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
        float _1227 = as_type<float>(_84);
        out.gl_Position.z = _1227;
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
        float _1296 = as_type<float>(_120);
        out.gl_Position.z = _1296;
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = _350 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = -_366;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _396 * _390;
    float _416 = _392 * _390;
    float _418 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _422 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_428, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _444 = fma(_422, _398, _420);
    float _446 = fma(_430, _398, _418);
    float _448 = fma(_436, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_432, _398, _424);
    float _454 = fma(_442, _336, _444);
    float _456 = fma(_448, _336, _446);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_35.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = in.m_33.x;
    float _498 = in.m_33.y;
    float _500 = in.m_33.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _504 = _494 + _502;
    bool _506 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = isnan(_494);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _520;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _464 * _500;
    float _534 = _460 * _498;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _494 + _536;
    bool _540 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _504 * _526;
    bool _554 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_494);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_516;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = _462 * _496;
    float _576 = _564 * _568;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _550 * _580;
    float _594 = fma(_584, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _530;
    float _600 = _590 * _592;
    float _602 = _594 * _592;
    float _604 = _596 * _592;
    float _606 = -_550;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].x, _602);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _626 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _628 = fma(_616, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_626, _576, _622);
    float _636 = fma(_628, _576, _624);
    float _638 = fma(_630, _576, _632);
    float _640 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].z, _638);
    bool _646 = !_528;
    float _664;
    if (!_646)
    {
        float _648 = in.m_35.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_68);
        float _670 = 1.0 / _668;
        float _672 = _102 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _688 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _690 = isnan(_674);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _704 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_674);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = 1.0 / _682;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _718;
    float _722 = -_698;
    float _724 = _722 + 1.0;
    bool _726 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _740 = 1.0 / _686;
    float _742 = 1.0 / _702;
    float _744 = _720 * _716;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _750 = _714 * _724;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = fma(_744, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    float _762 = _736 * _754;
    float _764 = _748 * _740;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _768 = _674 + _766;
    bool _770 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _772 = isnan(_674);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = -_736;
    float _786 = _784 + 1.0;
    float _788 = fma(_764, _768, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _792 = _674 + _790;
    float _794 = _760 * _742;
    float _796 = -_780;
    float _798 = _796 + 1.0;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _802 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _804 = fma(_794, _792, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _806 = _698 * _798;
    float _808 = fma(_788, _750, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = fma(_804, _806, _808);
    float _814 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _816 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[118].x, _812);
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _810;
    out.m_37.y = _820;
    out.m_37.z = _822;
    out.m_37.w = _824;
    bool _826 = !_738;
    float _844;
    if (!_826)
    {
        float _828 = in.m_35.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_68);
        float _850 = 1.0 / _848;
        float _852 = _102 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = in.m_35.x;
    float _858 = in.m_35.y;
    float _860 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _862 = in.m_39.x;
    float _864 = in.m_39.y;
    float _866 = in.m_39.z;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _860);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _876 = _874 != 0;
    float _878 = in.m_41.y;
    float _880 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = in.m_41.x;
    float _886 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _888 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = _642;
    if (_870)
    {
        float _896 = in.m_35.x;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _886);
    float _908 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _872);
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    bool _914 = _858 > 0.5;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _920 = -_890;
    float _922 = fma(_910, 2.0, _920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _928 = -_878;
    float _930 = _928 + 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = fma(_926, -2.0, _932);
    float _942 = _878;
    if (_876)
    {
        float _944 = _914 ? _930 : _878;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = 1.0 / _938;
    bool _950 = _898 > 0.5;
    bool _952 = _950 && _870;
    float _954 = _892 * _934;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _958 = _900 * _924;
    float _960 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _962 = _904 * _918;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].w, _956);
    float _972 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _974 = _916;
    float _976 = _972;
    if (_870)
    {
        _974 = _884;
    }
    float _978 = _974;
    float _980 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _984 = fma(_972, _946, -0.5);
    float _986 = _968 * _948;
    float _988 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _990 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _994 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _978;
    if (_952)
    {
        float _998 = -_978;
        float _1000 = _998 + 1.0;
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].x, _990);
    float _1008 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    if (!_870)
    {
        _976 = _884;
    }
    float _1010 = _976;
    float _1012 = -_994;
    float _1014 = fma(_988, _984, _1012);
    bool _1016 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1018 = isnan(_854);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1030 = _1010;
    if (_870)
    {
        _1030 = _1002;
    }
    float _1032 = _1030;
    float _1034 = -_102;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1040 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1006);
    float _1042 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1044 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1048 = _854 + _1046;
    bool _1050 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1052 = isnan(_854);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1026;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1028, _1032, -0.5);
    float _1068 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1038);
    float _1070 = _906 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1072 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1074 = _1042 + _1044;
    float _1076 = fma(_986, _1048, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1078 = _1060 * _1064;
    float _1080 = fma(_960, _1066, _1036);
    float _1082 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1070 + _1072;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = _1076 * _1078;
    float _1092 = _1082 + _1084;
    float _1094 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1098 = -_1060;
    float _1100 = _1098 + 1.0;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1108 = in.m_43.w;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1102);
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1104);
    float _1118 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1110);
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1130 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1138 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1128);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1130);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1132);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1140);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1142);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1144);
    float _1154 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1014 + 0.5;
    float _1160 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    float _1166 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1168 = _1080 + 0.5;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_45.w = _1108;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1168;
    out.m_47.y = _1158;
    out.m_49.w = _1166;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1170;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _846 = false;
    bool _666 = false;
    bool _486 = false;
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
        float _1227 = as_type<float>(_84);
        out.gl_Position.z = _1227;
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
        float _1296 = as_type<float>(_120);
        out.gl_Position.z = _1296;
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = _350 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = -_366;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _396 * _390;
    float _416 = _392 * _390;
    float _418 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _422 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_428, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _444 = fma(_422, _398, _420);
    float _446 = fma(_430, _398, _418);
    float _448 = fma(_436, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_432, _398, _424);
    float _454 = fma(_442, _336, _444);
    float _456 = fma(_448, _336, _446);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_35.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = in.m_33.x;
    float _498 = in.m_33.y;
    float _500 = in.m_33.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _504 = _494 + _502;
    bool _506 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = isnan(_494);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _520;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _464 * _500;
    float _534 = _460 * _498;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _494 + _536;
    bool _540 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _504 * _526;
    bool _554 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_494);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_516;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = _462 * _496;
    float _576 = _564 * _568;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _550 * _580;
    float _594 = fma(_584, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _530;
    float _600 = _590 * _592;
    float _602 = _594 * _592;
    float _604 = _596 * _592;
    float _606 = -_550;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].x, _602);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _626 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _628 = fma(_616, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_626, _576, _622);
    float _636 = fma(_628, _576, _624);
    float _638 = fma(_630, _576, _632);
    float _640 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].z, _638);
    bool _646 = !_528;
    float _664;
    if (!_646)
    {
        float _648 = in.m_35.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_68);
        float _670 = 1.0 / _668;
        float _672 = _102 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _688 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _690 = isnan(_674);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _704 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_674);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = 1.0 / _682;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _718;
    float _722 = -_698;
    float _724 = _722 + 1.0;
    bool _726 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _740 = 1.0 / _686;
    float _742 = 1.0 / _702;
    float _744 = _720 * _716;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _750 = _714 * _724;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = fma(_744, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    float _762 = _736 * _754;
    float _764 = _748 * _740;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _768 = _674 + _766;
    bool _770 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _772 = isnan(_674);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = -_736;
    float _786 = _784 + 1.0;
    float _788 = fma(_764, _768, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _792 = _674 + _790;
    float _794 = _760 * _742;
    float _796 = -_780;
    float _798 = _796 + 1.0;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _802 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _804 = fma(_794, _792, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _806 = _698 * _798;
    float _808 = fma(_788, _750, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = fma(_804, _806, _808);
    float _814 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _816 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[118].x, _812);
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _810;
    out.m_37.y = _820;
    out.m_37.z = _822;
    out.m_37.w = _824;
    bool _826 = !_738;
    float _844;
    if (!_826)
    {
        float _828 = in.m_35.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_68);
        float _850 = 1.0 / _848;
        float _852 = _102 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = in.m_35.x;
    float _858 = in.m_35.y;
    float _860 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _862 = in.m_39.x;
    float _864 = in.m_39.y;
    float _866 = in.m_39.z;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _860);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _876 = _874 != 0;
    float _878 = in.m_41.y;
    float _880 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = in.m_41.x;
    float _886 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _888 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = _642;
    if (_870)
    {
        float _896 = in.m_35.x;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _886);
    float _908 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _872);
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    bool _914 = _858 > 0.5;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _920 = -_890;
    float _922 = fma(_910, 2.0, _920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _928 = -_878;
    float _930 = _928 + 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = fma(_926, -2.0, _932);
    float _942 = _878;
    if (_876)
    {
        float _944 = _914 ? _930 : _878;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = 1.0 / _938;
    bool _950 = _898 > 0.5;
    bool _952 = _950 && _870;
    float _954 = _892 * _934;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _958 = _900 * _924;
    float _960 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _962 = _904 * _918;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].w, _956);
    float _972 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _974 = _916;
    float _976 = _972;
    if (_870)
    {
        _974 = _884;
    }
    float _978 = _974;
    float _980 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _984 = fma(_972, _946, -0.5);
    float _986 = _968 * _948;
    float _988 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _990 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _994 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _978;
    if (_952)
    {
        float _998 = -_978;
        float _1000 = _998 + 1.0;
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].x, _990);
    float _1008 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    if (!_870)
    {
        _976 = _884;
    }
    float _1010 = _976;
    float _1012 = -_994;
    float _1014 = fma(_988, _984, _1012);
    bool _1016 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1018 = isnan(_854);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1030 = _1010;
    if (_870)
    {
        _1030 = _1002;
    }
    float _1032 = _1030;
    float _1034 = -_102;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1040 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1006);
    float _1042 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1044 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1048 = _854 + _1046;
    bool _1050 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1052 = isnan(_854);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1026;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1028, _1032, -0.5);
    float _1068 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1038);
    float _1070 = _906 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1072 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1074 = _1042 + _1044;
    float _1076 = fma(_986, _1048, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1078 = _1060 * _1064;
    float _1080 = fma(_960, _1066, _1036);
    float _1082 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1070 + _1072;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = _1076 * _1078;
    float _1092 = _1082 + _1084;
    float _1094 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1098 = -_1060;
    float _1100 = _1098 + 1.0;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1108 = in.m_43.w;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1102);
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1104);
    float _1118 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1110);
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1130 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1138 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1128);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1130);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1132);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1140);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1142);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1144);
    float _1154 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1014 + 0.5;
    float _1160 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    float _1166 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1168 = _1080 + 0.5;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_45.w = _1108;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1168;
    out.m_47.y = _1158;
    out.m_49.w = _1166;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1170;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _846 = false;
    bool _666 = false;
    bool _486 = false;
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
        float _1227 = as_type<float>(_84);
        out.gl_Position.z = _1227;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1296 = as_type<float>(_120);
        out.gl_Position.z = _1296;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _272 + _278;
    bool _282 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _272 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _296;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _314 = 1.0 / _308;
    float _316 = 1.0 / _304;
    float _318 = _276 * _310;
    bool _320 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_272);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_292;
    float _334 = _332 + 1.0;
    float _336 = _330 * _334;
    float _338 = _280 * _314;
    bool _340 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_272);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    float _380 = _300 * _316;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _366 * _378;
    float _392 = fma(_354, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = _350 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _390;
    float _406 = -_366;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _396 * _390;
    float _416 = _392 * _390;
    float _418 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _422 = fma(_402, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _426;
    float _430 = fma(_374, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_412, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_428, _318, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _444 = fma(_422, _398, _420);
    float _446 = fma(_430, _398, _418);
    float _448 = fma(_436, _318, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _318, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = fma(_432, _398, _424);
    float _454 = fma(_442, _336, _444);
    float _456 = fma(_448, _336, _446);
    float _458 = fma(_450, _336, _452);
    float _460 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    float _462 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].x, _456);
    float _464 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[146].z, _458);
    bool _466 = !_312;
    float _484;
    if (!_466)
    {
        float _468 = in.m_35.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_68);
        float _490 = 1.0 / _488;
        float _492 = _102 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = in.m_33.x;
    float _498 = in.m_33.y;
    float _500 = in.m_33.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _504 = _494 + _502;
    bool _506 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = isnan(_494);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = 1.0 / _520;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = 1.0 / _524;
    float _532 = _464 * _500;
    float _534 = _460 * _498;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _494 + _536;
    bool _540 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _504 * _526;
    bool _554 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_494);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_516;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = _462 * _496;
    float _576 = _564 * _568;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = _550 * _580;
    float _594 = fma(_584, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _530;
    float _600 = _590 * _592;
    float _602 = _594 * _592;
    float _604 = _596 * _592;
    float _606 = -_550;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].x, _602);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].y, _600);
    float _626 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _628 = fma(_616, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_626, _576, _622);
    float _636 = fma(_628, _576, _624);
    float _638 = fma(_630, _576, _632);
    float _640 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[109].z, _638);
    bool _646 = !_528;
    float _664;
    if (!_646)
    {
        float _648 = in.m_35.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_68);
        float _670 = 1.0 / _668;
        float _672 = _102 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _688 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _690 = isnan(_674);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _704 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_674);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = 1.0 / _682;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _718;
    float _722 = -_698;
    float _724 = _722 + 1.0;
    bool _726 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _728 = isnan(_674);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _740 = 1.0 / _686;
    float _742 = 1.0 / _702;
    float _744 = _720 * _716;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _750 = _714 * _724;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = fma(_744, _678, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    float _762 = _736 * _754;
    float _764 = _748 * _740;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _768 = _674 + _766;
    bool _770 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _772 = isnan(_674);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = -_736;
    float _786 = _784 + 1.0;
    float _788 = fma(_764, _768, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _792 = _674 + _790;
    float _794 = _760 * _742;
    float _796 = -_780;
    float _798 = _796 + 1.0;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _802 = _640 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _804 = fma(_794, _792, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _806 = _698 * _798;
    float _808 = fma(_788, _750, _800);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = fma(_804, _806, _808);
    float _814 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _816 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[118].x, _812);
    float _820 = _814 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _810;
    out.m_37.y = _820;
    out.m_37.z = _822;
    out.m_37.w = _824;
    bool _826 = !_738;
    float _844;
    if (!_826)
    {
        float _828 = in.m_35.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_68);
        float _850 = 1.0 / _848;
        float _852 = _102 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = in.m_35.x;
    float _858 = in.m_35.y;
    float _860 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _862 = in.m_39.x;
    float _864 = in.m_39.y;
    float _866 = in.m_39.z;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _860);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _876 = _874 != 0;
    float _878 = in.m_41.y;
    float _880 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = in.m_41.x;
    float _886 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _888 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = _642;
    if (_870)
    {
        float _896 = in.m_35.x;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _886);
    float _908 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _872);
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    bool _914 = _858 > 0.5;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _920 = -_890;
    float _922 = fma(_910, 2.0, _920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _928 = -_878;
    float _930 = _928 + 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _940 = fma(_926, -2.0, _932);
    float _942 = _878;
    if (_876)
    {
        float _944 = _914 ? _930 : _878;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = 1.0 / _938;
    bool _950 = _898 > 0.5;
    bool _952 = _950 && _870;
    float _954 = _892 * _934;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _958 = _900 * _924;
    float _960 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _962 = _904 * _918;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _966;
    float _970 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].w, _956);
    float _972 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _974 = _916;
    float _976 = _972;
    if (_870)
    {
        _974 = _884;
    }
    float _978 = _974;
    float _980 = _958 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _982 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _984 = fma(_972, _946, -0.5);
    float _986 = _968 * _948;
    float _988 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _990 = _958 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _980);
    float _994 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _940);
    float _996 = _978;
    if (_952)
    {
        float _998 = -_978;
        float _1000 = _998 + 1.0;
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].x, _990);
    float _1008 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    if (!_870)
    {
        _976 = _884;
    }
    float _1010 = _976;
    float _1012 = -_994;
    float _1014 = fma(_988, _984, _1012);
    bool _1016 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1018 = isnan(_854);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1030 = _1010;
    if (_870)
    {
        _1030 = _1002;
    }
    float _1032 = _1030;
    float _1034 = -_102;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1040 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1006);
    float _1042 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1044 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1048 = _854 + _1046;
    bool _1050 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1052 = isnan(_854);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1026;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1028, _1032, -0.5);
    float _1068 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1038);
    float _1070 = _906 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1072 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1074 = _1042 + _1044;
    float _1076 = fma(_986, _1048, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1078 = _1060 * _1064;
    float _1080 = fma(_960, _1066, _1036);
    float _1082 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1070 + _1072;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = _1076 * _1078;
    float _1092 = _1082 + _1084;
    float _1094 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1098 = -_1060;
    float _1100 = _1098 + 1.0;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1108 = in.m_43.w;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1102);
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1104);
    float _1118 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1110);
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1130 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1138 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1128);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1130);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1132);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1140);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1142);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1144);
    float _1154 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1014 + 0.5;
    float _1160 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    float _1166 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1168 = _1080 + 0.5;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_45.w = _1108;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1168;
    out.m_47.y = _1158;
    out.m_49.w = _1166;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1170;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

