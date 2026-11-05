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
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _788 = false;
    bool _486 = false;
    bool _264 = false;
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
        float _1447 = as_type<float>(_84);
        out.gl_Position.z = _1447;
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
        float _1516 = as_type<float>(_120);
        out.gl_Position.z = _1516;
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
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
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
        float _468 = in.m_39.x;
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
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _502 = _494 + _500;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _494 + _532;
    float _536 = 1.0 / _526;
    bool _538 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _540 = isnan(_494);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _522;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _494 + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _530;
    float _560 = _498 * _536;
    float _562 = 1.0 / _518;
    float _564 = _554 * _550;
    bool _566 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_494);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_494);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _502 * _558;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _600;
    float _604 = _514 * _592;
    float _606 = -_514;
    float _608 = _606 + 1.0;
    bool _610 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _612 = isnan(_494);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = fma(_602, _560, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _534 * _562;
    float _630 = _588 * _608;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = _548 * _598;
    float _642 = -_548;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _654 = fma(_634, _560, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _656 = _620 * _644;
    float _658 = fma(_648, _560, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = fma(_624, _594, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = fma(_638, _594, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _664 = fma(_652, _594, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _666 = _626 * _656;
    float _668 = _654 * _656;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = _658 * _656;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].x, _666);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _694 = fma(_660, _640, _684);
    float _696 = fma(_662, _640, _686);
    float _698 = fma(_678, _628, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_682, _628, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_690, _628, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _716 = fma(_664, _640, _692);
    float _718 = fma(_706, _564, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _720 = fma(_710, _564, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _722 = fma(_714, _564, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _724 = fma(_698, _630, _694);
    float _726 = fma(_700, _630, _696);
    float _728 = fma(_702, _630, _716);
    float _730 = fma(_718, _604, _724);
    float _732 = fma(_720, _604, _726);
    float _734 = fma(_722, _604, _728);
    float _736 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].x, _730);
    float _738 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].y, _732);
    float _740 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].z, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _750 = in.m_37.x;
    float _752 = in.m_37.y;
    float _754 = in.m_37.z;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _756;
    out.m_41.y = _758;
    out.m_41.z = _760;
    out.m_41.w = _742;
    float _762 = _464 * _754;
    float _764 = _460 * _752;
    float _766 = _462 * _750;
    bool _768 = !_556;
    float _786;
    if (!_768)
    {
        float _770 = in.m_39.x;
        float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _774 = _770 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _778 = _776 * _772;
        float _780 = floor(_778);
        float _782 = -_780;
        float _784 = _778 + _782;
        _786 = _784;
        _788 = true;
    }
    else
    {
        float _790 = float(_68);
        float _792 = 1.0 / _790;
        float _794 = _102 * _792;
        _786 = _794;
    }
    _788 = false;
    float _796 = _786;
    float _798 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _814 = 1.0 / _804;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _820;
    bool _824 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _826 = isnan(_796);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _838 = isnan(_796);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    bool _848 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _850 = isnan(_796);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _808;
    float _862 = -_834;
    float _864 = _862 + 1.0;
    float _866 = -_846;
    float _868 = _866 + 1.0;
    float _870 = _846 * _864;
    float _872 = _858 * _868;
    float _874 = -_858;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _812;
    float _880 = _822 * _814;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _894 = 1.0 / _818;
    float _896 = _884 * _860;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = _888 * _878;
    bool _904 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_796);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _892;
    float _918 = _914 * _876;
    float _920 = -_914;
    float _922 = _920 + 1.0;
    float _924 = _900 * _894;
    bool _926 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _928 = isnan(_796);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_796);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _936 * _922;
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _968 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_796);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _984 = _796 + _982;
    float _986 = _956 * _962;
    float _988 = -_956;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _994 = _796 + _992;
    float _996 = fma(_880, _984, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _796 + _998;
    float _1002 = _978 * _990;
    float _1004 = 1.0 / _966;
    float _1006 = fma(_896, _994, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1008 = _996 * _1002;
    float _1010 = -_978;
    float _1012 = _1010 + 1.0;
    float _1014 = _944 * _916;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1008);
    float _1026 = fma(_902, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1028 = _1018 * _980;
    float _1030 = fma(_1006, _986, _1024);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _796 + _1032;
    float _1036 = _1022 * _1004;
    float _1038 = fma(_1026, _958, _1030);
    float _1040 = in.m_43.x;
    float _1042 = in.m_43.y;
    float _1044 = in.m_43.z;
    float _1046 = fma(_924, _1034, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _796 + _1048;
    bool _1052 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1054 = isnan(_796);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = in.m_45.x;
    float _1066 = in.m_45.y;
    float _1068 = in.m_45.z;
    float _1070 = in.m_45.w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _796 + _1072;
    float _1076 = fma(_1028, _1050, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1078 = fma(_1046, _918, _1038);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1036, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1088 = _796 + _1086;
    float _1090 = fma(_1076, _872, _1078);
    float _1092 = _834 * _1082;
    float _1094 = fma(_1014, _1088, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1096 = fma(_1084, _870, _1090);
    bool _1098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1094, _1092, _1096);
    float _1110 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1108);
    float _1112 = -_1064;
    float _1114 = _1112 + _1040;
    float _1116 = -_1068;
    float _1118 = _1116 + _1044;
    float _1120 = fma(_1110, _1114, _1064);
    float _1122 = -_1066;
    float _1124 = _1122 + _1042;
    float _1126 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_1110, _1118, _1068);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1120);
    float _1132 = fma(_1110, _1124, _1066);
    float _1134 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1128);
    float _1138 = _1130 * _1126;
    float _1140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1132);
    float _1142 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1144 = _1136 * _800;
    float _1146 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1134);
    float _1148 = _1140 * _798;
    float _1150 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1142);
    float _1152 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1154 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1152);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1168 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1170 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1164);
    float _1174 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = _1166 + _1172;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1182 = _1170 + _1176;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1182 + _1188;
    float _1192 = _1186 * _1186;
    float _1194 = fma(_1190, _1190, _1192);
    float _1196 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = sqrt(_1194);
    float _1200 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1204 = _1180 + _1202;
    bool _1206 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1148;
    float _1210 = _1196;
    float _1212 = _1182;
    if (!_1206)
    {
        _1208 = _1178;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1206)
    {
        _1210 = _1204;
    }
    float _1218 = _1210;
    bool _1220 = !_1206;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1198 + _1226;
        float _1230 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1194);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1204, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1190, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1186, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1212 = _1256;
        _1222 = _1252;
        _1216 = _1258;
    }
    float _1260 = _1212;
    float _1262 = _1222;
    float _1264 = _1216;
    float _1266 = _1262;
    float _1268 = _1260;
    float _1270 = _1264;
    if (!_1106)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1180 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1170 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_1170;
        float _1284 = _1282 + _1260;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1166 + _1288;
        float _1292 = -_1180;
        float _1294 = _1292 + _1262;
        float _1296 = -_1166;
        float _1298 = _1296 + _1264;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = fma(_1290, _1290, _1300);
        float _1304 = sqrt(_1302);
        float _1306 = precise::min(_1304, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1308 = _1306 * _1280;
        float _1310 = fma(_1284, _1308, _1170);
        float _1312 = fma(_1294, _1308, _1180);
        float _1314 = fma(_1298, _1308, _1166);
        _1266 = _1312;
        _1268 = _1310;
        _1270 = _1314;
    }
    float _1316 = _1266;
    float _1318 = _1268;
    float _1320 = _1270;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_47.w = _1070;
    out.m_33.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_49.z = _1390;
    out.m_49.w = _1380;
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
    bool _788 = false;
    bool _486 = false;
    bool _264 = false;
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
        float _1447 = as_type<float>(_84);
        out.gl_Position.z = _1447;
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
        float _1516 = as_type<float>(_120);
        out.gl_Position.z = _1516;
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
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
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
        float _468 = in.m_39.x;
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
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _502 = _494 + _500;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _494 + _532;
    float _536 = 1.0 / _526;
    bool _538 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _540 = isnan(_494);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _522;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _494 + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _530;
    float _560 = _498 * _536;
    float _562 = 1.0 / _518;
    float _564 = _554 * _550;
    bool _566 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_494);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_494);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _502 * _558;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _600;
    float _604 = _514 * _592;
    float _606 = -_514;
    float _608 = _606 + 1.0;
    bool _610 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _612 = isnan(_494);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = fma(_602, _560, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _534 * _562;
    float _630 = _588 * _608;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = _548 * _598;
    float _642 = -_548;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _654 = fma(_634, _560, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _656 = _620 * _644;
    float _658 = fma(_648, _560, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = fma(_624, _594, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = fma(_638, _594, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _664 = fma(_652, _594, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _666 = _626 * _656;
    float _668 = _654 * _656;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = _658 * _656;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].x, _666);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _694 = fma(_660, _640, _684);
    float _696 = fma(_662, _640, _686);
    float _698 = fma(_678, _628, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_682, _628, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_690, _628, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _716 = fma(_664, _640, _692);
    float _718 = fma(_706, _564, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _720 = fma(_710, _564, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _722 = fma(_714, _564, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _724 = fma(_698, _630, _694);
    float _726 = fma(_700, _630, _696);
    float _728 = fma(_702, _630, _716);
    float _730 = fma(_718, _604, _724);
    float _732 = fma(_720, _604, _726);
    float _734 = fma(_722, _604, _728);
    float _736 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].x, _730);
    float _738 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].y, _732);
    float _740 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].z, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _750 = in.m_37.x;
    float _752 = in.m_37.y;
    float _754 = in.m_37.z;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _756;
    out.m_41.y = _758;
    out.m_41.z = _760;
    out.m_41.w = _742;
    float _762 = _464 * _754;
    float _764 = _460 * _752;
    float _766 = _462 * _750;
    bool _768 = !_556;
    float _786;
    if (!_768)
    {
        float _770 = in.m_39.x;
        float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _774 = _770 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _778 = _776 * _772;
        float _780 = floor(_778);
        float _782 = -_780;
        float _784 = _778 + _782;
        _786 = _784;
        _788 = true;
    }
    else
    {
        float _790 = float(_68);
        float _792 = 1.0 / _790;
        float _794 = _102 * _792;
        _786 = _794;
    }
    _788 = false;
    float _796 = _786;
    float _798 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _814 = 1.0 / _804;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _820;
    bool _824 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _826 = isnan(_796);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _838 = isnan(_796);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    bool _848 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _850 = isnan(_796);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _808;
    float _862 = -_834;
    float _864 = _862 + 1.0;
    float _866 = -_846;
    float _868 = _866 + 1.0;
    float _870 = _846 * _864;
    float _872 = _858 * _868;
    float _874 = -_858;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _812;
    float _880 = _822 * _814;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _894 = 1.0 / _818;
    float _896 = _884 * _860;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = _888 * _878;
    bool _904 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_796);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _892;
    float _918 = _914 * _876;
    float _920 = -_914;
    float _922 = _920 + 1.0;
    float _924 = _900 * _894;
    bool _926 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _928 = isnan(_796);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_796);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _936 * _922;
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _968 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_796);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _984 = _796 + _982;
    float _986 = _956 * _962;
    float _988 = -_956;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _994 = _796 + _992;
    float _996 = fma(_880, _984, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _796 + _998;
    float _1002 = _978 * _990;
    float _1004 = 1.0 / _966;
    float _1006 = fma(_896, _994, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1008 = _996 * _1002;
    float _1010 = -_978;
    float _1012 = _1010 + 1.0;
    float _1014 = _944 * _916;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1008);
    float _1026 = fma(_902, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1028 = _1018 * _980;
    float _1030 = fma(_1006, _986, _1024);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _796 + _1032;
    float _1036 = _1022 * _1004;
    float _1038 = fma(_1026, _958, _1030);
    float _1040 = in.m_43.x;
    float _1042 = in.m_43.y;
    float _1044 = in.m_43.z;
    float _1046 = fma(_924, _1034, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _796 + _1048;
    bool _1052 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1054 = isnan(_796);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = in.m_45.x;
    float _1066 = in.m_45.y;
    float _1068 = in.m_45.z;
    float _1070 = in.m_45.w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _796 + _1072;
    float _1076 = fma(_1028, _1050, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1078 = fma(_1046, _918, _1038);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1036, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1088 = _796 + _1086;
    float _1090 = fma(_1076, _872, _1078);
    float _1092 = _834 * _1082;
    float _1094 = fma(_1014, _1088, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1096 = fma(_1084, _870, _1090);
    bool _1098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1094, _1092, _1096);
    float _1110 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1108);
    float _1112 = -_1064;
    float _1114 = _1112 + _1040;
    float _1116 = -_1068;
    float _1118 = _1116 + _1044;
    float _1120 = fma(_1110, _1114, _1064);
    float _1122 = -_1066;
    float _1124 = _1122 + _1042;
    float _1126 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_1110, _1118, _1068);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1120);
    float _1132 = fma(_1110, _1124, _1066);
    float _1134 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1128);
    float _1138 = _1130 * _1126;
    float _1140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1132);
    float _1142 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1144 = _1136 * _800;
    float _1146 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1134);
    float _1148 = _1140 * _798;
    float _1150 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1142);
    float _1152 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1154 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1152);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1168 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1170 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1164);
    float _1174 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = _1166 + _1172;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1182 = _1170 + _1176;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1182 + _1188;
    float _1192 = _1186 * _1186;
    float _1194 = fma(_1190, _1190, _1192);
    float _1196 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = sqrt(_1194);
    float _1200 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1204 = _1180 + _1202;
    bool _1206 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1148;
    float _1210 = _1196;
    float _1212 = _1182;
    if (!_1206)
    {
        _1208 = _1178;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1206)
    {
        _1210 = _1204;
    }
    float _1218 = _1210;
    bool _1220 = !_1206;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1198 + _1226;
        float _1230 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1194);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1204, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1190, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1186, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1212 = _1256;
        _1222 = _1252;
        _1216 = _1258;
    }
    float _1260 = _1212;
    float _1262 = _1222;
    float _1264 = _1216;
    float _1266 = _1262;
    float _1268 = _1260;
    float _1270 = _1264;
    if (!_1106)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1180 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1170 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_1170;
        float _1284 = _1282 + _1260;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1166 + _1288;
        float _1292 = -_1180;
        float _1294 = _1292 + _1262;
        float _1296 = -_1166;
        float _1298 = _1296 + _1264;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = fma(_1290, _1290, _1300);
        float _1304 = sqrt(_1302);
        float _1306 = precise::min(_1304, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1308 = _1306 * _1280;
        float _1310 = fma(_1284, _1308, _1170);
        float _1312 = fma(_1294, _1308, _1180);
        float _1314 = fma(_1298, _1308, _1166);
        _1266 = _1312;
        _1268 = _1310;
        _1270 = _1314;
    }
    float _1316 = _1266;
    float _1318 = _1268;
    float _1320 = _1270;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_47.w = _1070;
    out.m_33.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_49.z = _1390;
    out.m_49.w = _1380;
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
    bool _788 = false;
    bool _486 = false;
    bool _264 = false;
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
        float _1447 = as_type<float>(_84);
        out.gl_Position.z = _1447;
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
        float _1516 = as_type<float>(_120);
        out.gl_Position.z = _1516;
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
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
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
        float _468 = in.m_39.x;
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
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _502 = _494 + _500;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _494 + _532;
    float _536 = 1.0 / _526;
    bool _538 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _540 = isnan(_494);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _522;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _494 + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _530;
    float _560 = _498 * _536;
    float _562 = 1.0 / _518;
    float _564 = _554 * _550;
    bool _566 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_494);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_494);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _502 * _558;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _600;
    float _604 = _514 * _592;
    float _606 = -_514;
    float _608 = _606 + 1.0;
    bool _610 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _612 = isnan(_494);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _626 = fma(_602, _560, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _628 = _534 * _562;
    float _630 = _588 * _608;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _640 = _548 * _598;
    float _642 = -_548;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _654 = fma(_634, _560, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _656 = _620 * _644;
    float _658 = fma(_648, _560, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = fma(_624, _594, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _662 = fma(_638, _594, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _664 = fma(_652, _594, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _666 = _626 * _656;
    float _668 = _654 * _656;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = _658 * _656;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _680;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].x, _666);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _694 = fma(_660, _640, _684);
    float _696 = fma(_662, _640, _686);
    float _698 = fma(_678, _628, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _700 = fma(_682, _628, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _702 = fma(_690, _628, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _716 = fma(_664, _640, _692);
    float _718 = fma(_706, _564, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _720 = fma(_710, _564, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _722 = fma(_714, _564, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _724 = fma(_698, _630, _694);
    float _726 = fma(_700, _630, _696);
    float _728 = fma(_702, _630, _716);
    float _730 = fma(_718, _604, _724);
    float _732 = fma(_720, _604, _726);
    float _734 = fma(_722, _604, _728);
    float _736 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].x, _730);
    float _738 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].y, _732);
    float _740 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[111].z, _734);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _750 = in.m_37.x;
    float _752 = in.m_37.y;
    float _754 = in.m_37.z;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _756;
    out.m_41.y = _758;
    out.m_41.z = _760;
    out.m_41.w = _742;
    float _762 = _464 * _754;
    float _764 = _460 * _752;
    float _766 = _462 * _750;
    bool _768 = !_556;
    float _786;
    if (!_768)
    {
        float _770 = in.m_39.x;
        float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _774 = _770 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _778 = _776 * _772;
        float _780 = floor(_778);
        float _782 = -_780;
        float _784 = _778 + _782;
        _786 = _784;
        _788 = true;
    }
    else
    {
        float _790 = float(_68);
        float _792 = 1.0 / _790;
        float _794 = _102 * _792;
        _786 = _794;
    }
    _788 = false;
    float _796 = _786;
    float _798 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _814 = 1.0 / _804;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _820;
    bool _824 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _826 = isnan(_796);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _838 = isnan(_796);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    bool _848 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _850 = isnan(_796);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _808;
    float _862 = -_834;
    float _864 = _862 + 1.0;
    float _866 = -_846;
    float _868 = _866 + 1.0;
    float _870 = _846 * _864;
    float _872 = _858 * _868;
    float _874 = -_858;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _812;
    float _880 = _822 * _814;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _894 = 1.0 / _818;
    float _896 = _884 * _860;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _902 = _888 * _878;
    bool _904 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_796);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _892;
    float _918 = _914 * _876;
    float _920 = -_914;
    float _922 = _920 + 1.0;
    float _924 = _900 * _894;
    bool _926 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _928 = isnan(_796);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _942;
    bool _946 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _948 = isnan(_796);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _936 * _922;
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _968 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_796);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _984 = _796 + _982;
    float _986 = _956 * _962;
    float _988 = -_956;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _994 = _796 + _992;
    float _996 = fma(_880, _984, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _796 + _998;
    float _1002 = _978 * _990;
    float _1004 = 1.0 / _966;
    float _1006 = fma(_896, _994, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1008 = _996 * _1002;
    float _1010 = -_978;
    float _1012 = _1010 + 1.0;
    float _1014 = _944 * _916;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1008);
    float _1026 = fma(_902, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1028 = _1018 * _980;
    float _1030 = fma(_1006, _986, _1024);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1034 = _796 + _1032;
    float _1036 = _1022 * _1004;
    float _1038 = fma(_1026, _958, _1030);
    float _1040 = in.m_43.x;
    float _1042 = in.m_43.y;
    float _1044 = in.m_43.z;
    float _1046 = fma(_924, _1034, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _796 + _1048;
    bool _1052 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1054 = isnan(_796);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = in.m_45.x;
    float _1066 = in.m_45.y;
    float _1068 = in.m_45.z;
    float _1070 = in.m_45.w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1074 = _796 + _1072;
    float _1076 = fma(_1028, _1050, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1078 = fma(_1046, _918, _1038);
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1036, _1074, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1088 = _796 + _1086;
    float _1090 = fma(_1076, _872, _1078);
    float _1092 = _834 * _1082;
    float _1094 = fma(_1014, _1088, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1096 = fma(_1084, _870, _1090);
    bool _1098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1100 = isnan(0.5);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1094, _1092, _1096);
    float _1110 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1108);
    float _1112 = -_1064;
    float _1114 = _1112 + _1040;
    float _1116 = -_1068;
    float _1118 = _1116 + _1044;
    float _1120 = fma(_1110, _1114, _1064);
    float _1122 = -_1066;
    float _1124 = _1122 + _1042;
    float _1126 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_1110, _1118, _1068);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1120);
    float _1132 = fma(_1110, _1124, _1066);
    float _1134 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1128);
    float _1138 = _1130 * _1126;
    float _1140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1132);
    float _1142 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1144 = _1136 * _800;
    float _1146 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1134);
    float _1148 = _1140 * _798;
    float _1150 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1142);
    float _1152 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1154 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1150);
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1152);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1168 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1170 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1164);
    float _1174 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = _1166 + _1172;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1182 = _1170 + _1176;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1178 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1182 + _1188;
    float _1192 = _1186 * _1186;
    float _1194 = fma(_1190, _1190, _1192);
    float _1196 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = sqrt(_1194);
    float _1200 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1202 = fma(_1144, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1204 = _1180 + _1202;
    bool _1206 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1208 = _1148;
    float _1210 = _1196;
    float _1212 = _1182;
    if (!_1206)
    {
        _1208 = _1178;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1206)
    {
        _1210 = _1204;
    }
    float _1218 = _1210;
    bool _1220 = !_1206;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1198 + _1226;
        float _1230 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1194);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1204, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1190, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1186, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1212 = _1256;
        _1222 = _1252;
        _1216 = _1258;
    }
    float _1260 = _1212;
    float _1262 = _1222;
    float _1264 = _1216;
    float _1266 = _1262;
    float _1268 = _1260;
    float _1270 = _1264;
    if (!_1106)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1274 = _1180 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1278 = _1170 + _1276;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_1170;
        float _1284 = _1282 + _1260;
        float _1286 = _1274 * _1274;
        float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1290 = _1166 + _1288;
        float _1292 = -_1180;
        float _1294 = _1292 + _1262;
        float _1296 = -_1166;
        float _1298 = _1296 + _1264;
        float _1300 = fma(_1278, _1278, _1286);
        float _1302 = fma(_1290, _1290, _1300);
        float _1304 = sqrt(_1302);
        float _1306 = precise::min(_1304, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1308 = _1306 * _1280;
        float _1310 = fma(_1284, _1308, _1170);
        float _1312 = fma(_1294, _1308, _1180);
        float _1314 = fma(_1298, _1308, _1166);
        _1266 = _1312;
        _1268 = _1310;
        _1270 = _1314;
    }
    float _1316 = _1266;
    float _1318 = _1268;
    float _1320 = _1270;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_47.w = _1070;
    out.m_33.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_49.z = _1390;
    out.m_49.w = _1380;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

