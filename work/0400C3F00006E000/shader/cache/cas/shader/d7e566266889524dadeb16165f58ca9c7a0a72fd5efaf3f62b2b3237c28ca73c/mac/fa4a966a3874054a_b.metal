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
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
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
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _972 = false;
    bool _830 = false;
    bool _608 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1710 = as_type<float>(_84);
        out.gl_Position.z = _1710;
    }
    if (!_74)
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
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_124);
        out.gl_Position.z = _1779;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_37.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = _128;
    if (!_138)
    {
        float _154 = _128 * _128;
        float _156 = _154 * 0.5;
        _120 = _156;
    }
    float _158 = _120;
    float _160 = _158;
    if (!_138)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    bool _166 = !_138;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _128 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _128);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_138;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _128 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _140, _228);
    float _236 = fma(_224, _142, _230);
    float _238 = fma(_224, _144, _232);
    float _240 = fma(_234, _126, _146);
    float _242 = fma(_236, _126, _148);
    float _244 = fma(_238, _126, _150);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _298;
    float _302 = 1.0 / _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _274 + _304;
    float _308 = 1.0 / _290;
    float _310 = _306 * _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _274 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _274 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = 1.0 / _294;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _274 + _324;
    float _328 = _314 * _302;
    bool _330 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_274);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _300;
    float _344 = _318 * _308;
    float _346 = -_340;
    float _348 = _346 + 1.0;
    float _350 = _278 * _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _362 = isnan(_274);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = _326 * _342;
    bool _378 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _380 = isnan(_274);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = fma(_392, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _396 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _398 = isnan(_274);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _388 * _348;
    float _410 = -_388;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _422 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_274);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _406 * _412;
    bool _436 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_274);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = fma(_416, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = fma(_420, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = -_446;
    float _462 = _460 + 1.0;
    float _464 = _370 * _450;
    float _466 = -_370;
    float _468 = _466 + 1.0;
    float _470 = fma(_454, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _432 * _462;
    float _474 = -_432;
    float _476 = _474 + 1.0;
    float _478 = _446 * _468;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = _372 * _472;
    float _486 = _394 * _472;
    float _488 = _374 * _472;
    float _490 = fma(_482, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _512 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _488);
    float _514 = fma(_494, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_500, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_504, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_470, _478, _496);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _522;
    float _526 = in.m_37.x;
    float _528 = in.m_37.y;
    float _530 = in.m_37.z;
    float _532 = fma(_456, _478, _510);
    float _534 = fma(_458, _478, _512);
    float _536 = fma(_508, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = fma(_524, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _540 = fma(_490, _464, _532);
    float _542 = fma(_536, _464, _520);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _552;
    float _556 = fma(_538, _464, _534);
    float _558 = fma(_546, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _560 = fma(_550, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _562 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _564 = fma(_514, _434, _540);
    float _566 = fma(_516, _434, _542);
    float _568 = fma(_518, _434, _556);
    float _570 = fma(_558, _408, _564);
    float _572 = fma(_560, _408, _566);
    float _574 = fma(_562, _408, _568);
    float _576 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _570);
    float _578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _572);
    float _580 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _574);
    float _582 = _576 * _526;
    float _584 = _578 * _528;
    float _586 = _580 * _530;
    bool _588 = !_320;
    float _606;
    if (!_588)
    {
        float _590 = in.m_39.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_70);
        float _612 = 1.0 / _610;
        float _614 = _102 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = _616 + _622;
    bool _626 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_616);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _616 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = 1.0 / _640;
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _658 = 1.0 / _648;
    float _660 = 1.0 / _652;
    float _662 = _620 * _654;
    bool _664 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = isnan(_616);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -_636;
    float _678 = _676 + 1.0;
    float _680 = _674 * _678;
    float _682 = _624 * _658;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    bool _688 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_616);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_674;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _704;
    float _708 = fma(_686, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _710 = _644 * _660;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = fma(_706, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _734 = -_722;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _740 = _722 * _702;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = _698 * _736;
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = _732 * _746;
    float _758 = _708 * _746;
    float _760 = _738 * _746;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _756);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _758);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _760);
    float _768 = fma(_730, _710, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_744, _710, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _782;
    float _786 = fma(_768, _740, _762);
    float _788 = fma(_776, _662, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _790 = fma(_780, _662, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _792 = fma(_784, _662, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _794 = fma(_770, _740, _764);
    float _796 = fma(_772, _740, _766);
    float _798 = fma(_788, _680, _786);
    float _800 = fma(_790, _680, _794);
    float _802 = fma(_792, _680, _796);
    float _804 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].x, _798);
    float _806 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].y, _800);
    float _808 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].z, _802);
    bool _810 = !_656;
    float _828;
    if (!_810)
    {
        float _812 = in.m_39.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        float _832 = float(_70);
        float _834 = 1.0 / _832;
        float _836 = _102 * _834;
        _828 = _836;
    }
    _830 = false;
    float _838 = _828;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = isnan(_838);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_838);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _842;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_838);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _896 = _870 * _880;
    float _898 = -_870;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _858;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _908 = _876 * _872;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _912 = _838 + _910;
    float _914 = -_892;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _838 + _918;
    float _922 = fma(_908, _912, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = _854 * _916;
    float _926 = _906 * _902;
    float _928 = _922 * _896;
    float _930 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = fma(_926, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _934 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _928);
    float _936 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_932, _924, _934);
    float _942 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _938;
    out.m_41.y = _944;
    out.m_41.z = _948;
    out.m_41.w = _950;
    bool _952 = !_894;
    float _970;
    if (!_952)
    {
        float _954 = in.m_39.x;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _958 = _954 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _962 = _960 * _956;
        float _964 = floor(_962);
        float _966 = -_964;
        float _968 = _962 + _966;
        _970 = _968;
        _972 = true;
    }
    else
    {
        float _974 = float(_70);
        float _976 = 1.0 / _974;
        float _978 = _102 * _976;
        _970 = _978;
    }
    _972 = false;
    float _980 = _970;
    float _982 = in.m_39.w;
    float _984 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _986 = in.m_43.x;
    float _988 = in.m_43.y;
    float _990 = in.m_43.z;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _994 = _992 != 0;
    float _996 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _984);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1000 = _998 != 0;
    float _1002 = in.m_39.x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    float _1008 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = in.m_45.y;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1018 = _1016 != 0;
    float _1020 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = in.m_39.y;
    float _1024 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1032 = _1014;
    if (_1000)
    {
        float _1034 = in.m_39.z;
        _1030 = _1034;
    }
    float _1036 = _1030;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1040 = _982 > 0.5;
    float _1042 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1048 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1050 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    float _1052 = 1.0 / _1028;
    float _1054 = in.m_45.x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1064 = 1.0 / _1058;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1068 = fma(_1062, -2.0, _1060);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1072 = _1062;
    bool _1074 = _1040;
    if (!_1018)
    {
        float _1076 = in.m_39.z;
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1088 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _996);
    float _1090 = -_1046;
    float _1092 = fma(_1080, 2.0, _1090);
    float _1094 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1048);
    float _1096 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1050);
    float _1098 = _1008 * _1070;
    float _1100 = _1084 * _1052;
    float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1104;
    float _1108 = -_1014;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1114 = _980 + _1112;
    float _1116 = _1020 * _1086;
    float _1118 = _1024 * _1066;
    float _1120 = _1106 * _1064;
    bool _1122 = false;
    float _1124 = _1086;
    if (_1000)
    {
        bool _1126 = _1036 > 0.5;
        _1122 = _1126;
    }
    bool _1128 = _1122;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _980 + _1130;
    float _1134 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1136 = _1040 ? _1110 : _1014;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = _1006 ? _1136 : _1014;
    float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1146 = _1022 > 0.5;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1150 = _1136;
    float _1152 = _1132;
    if (!_1018)
    {
        _1124 = _1022;
    }
    float _1154 = _1124;
    float _1156 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1158 = _1154;
    if (_994)
    {
        bool _1160 = _1002 > 0.5;
        _1074 = _1160;
    }
    bool _1162 = _1074;
    float _1164 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1148);
    if (_1018)
    {
        _1158 = _1002;
    }
    float _1166 = _1158;
    float _1168 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1012)
    {
        float _1170 = _1146 ? _1110 : _1014;
        _1032 = _1170;
    }
    float _1172 = _1032;
    float _1174 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1078;
    int _1178 = as_type<int>(_1172);
    if (!_1018)
    {
        _1150 = _1078;
    }
    float _1180 = _1150;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1184 = _1180;
    if (_1018)
    {
        _1184 = _1022;
    }
    float _1186 = _1184;
    float _1188 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1018)
    {
        _1176 = _1022;
    }
    float _1190 = _1176;
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    bool _1194 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1196 = isnan(_980);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    bool _1208 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1210 = isnan(_980);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    bool _1222 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1224 = isnan(_980);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1204;
    float _1236 = _1234 + 1.0;
    float _1238 = fma(_1142, _1168, -0.5);
    float _1240 = _1232 * _1236;
    float _1242 = -_1232;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1252 = _1218 * _1244;
    float _1254 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    int _1256 = as_type<int>(_1246);
    float _1258 = _1248;
    if (_1000)
    {
        float _1260 = -_1054;
        float _1262 = _1260 + 1.0;
        _1256 = as_type<int>(_1262);
    }
    int _1264 = _1256;
    float _1266 = fma(_1248, _1172, -0.5);
    float _1268 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1220);
    if (!_1000)
    {
        _1258 = _1054;
    }
    float _1270 = _1258;
    float _1272 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1274 = _1270;
    if (_1000)
    {
        float _1276 = _1128 ? as_type<float>(_1264) : _1054;
        _1274 = _1276;
    }
    float _1278 = _1274;
    float _1280 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1282 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1284 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1286 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1288 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (_994)
    {
        float _1290 = -_1054;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    float _1296 = -_1250;
    float _1298 = fma(_1272, 2.0, _1296);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1302 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1304 = _1286 + _1288;
    float _1306 = _1304;
    if (!_994)
    {
        _1152 = _1054;
    }
    float _1308 = _1152;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1312 = _1308;
    if (_994)
    {
        float _1314 = _1162 ? as_type<float>(_1294) : _1054;
        _1312 = _1314;
    }
    float _1316 = _1312;
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1320 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1300);
    float _1322 = _1282 + _1302;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1304 + _1324;
    float _1328 = _1138 * _1252;
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1310);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1334 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1318);
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1322 + _1336;
    float _1340 = _1326 * _1326;
    float _1342 = -_1218;
    float _1344 = _1342 + 1.0;
    float _1346 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1164);
    float _1348 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1350 = fma(_1338, _1338, _1340);
    float _1352 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1356 = -_1348;
    float _1358 = fma(_1346, _1266, _1356);
    float _1360 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1366 = fma(_1134, _1240, _1360);
    float _1368 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1156);
    float _1370 = sqrt(_1350);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1376 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1378 = -_102;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1092);
    float _1382 = fma(_1364, -2.0, _1372);
    float _1384 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1388 = 1.0 / _1362;
    float _1390 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1392 = fma(_1384, _1316, -0.5);
    float _1394 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1396 = _1280 + _1376;
    float _1398 = _1386 + _1362;
    float _1400 = fma(_1390, _1278, -0.5);
    float _1402 = -_102;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    bool _1406 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1410 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1382);
    float _1412 = fma(_1368, _1392, _1380);
    bool _1414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1416 = isnan(0.5);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1422 = _1418 || _1420;
    float _1424 = fma(_1394, _1400, _1404);
    float _1426 = -_1410;
    float _1428 = fma(_1408, _1238, _1426);
    float _1430 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1366);
    float _1432 = _1398 * _1388;
    float _1434 = _1432 * 0.5;
    float _1436 = _1388;
    float _1438 = _1322;
    float _1440 = _1326;
    if (!_1406)
    {
        _1436 = _1396;
    }
    float _1442 = _1436;
    bool _1444 = !_1406;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1370 + _1450;
        float _1454 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1456 = rsqrt(_1350);
        float _1458 = _1452 * _1448;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1396, _1464, _1472);
        float _1478 = _1456 * _1474;
        float _1480 = fma(_1338, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1326, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1446 = _1476;
        _1438 = _1480;
        _1306 = _1482;
    }
    float _1484 = _1446;
    float _1486 = _1438;
    float _1488 = _1306;
    float _1490 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1422)
    {
        _1440 = 1.0;
    }
    float _1492 = _1440;
    float _1494 = _1492;
    if (!_1422)
    {
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1498 * 0.15915493667125701904296875;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1506 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1500 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = 1.0 / _1510;
        float _1518 = _1502 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = _1502 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1528;
        float _1532 = _1520 * _1522;
        float _1534 = 1.0 / _1506;
        float _1536 = 1.0 / _1532;
        float _1538 = 1.0 / _1530;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = _1534 * _1540;
        float _1544 = _1526 * _1536;
        float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1548 = fma(_1544, _1542, _1546);
        float _1550 = _1548 * _1538;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        _1494 = _1552;
    }
    float _1554 = _1494;
    float _1556 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1560 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1566 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1568 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1570 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1572 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1568);
    float _1578 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1584 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1588 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1582);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1584);
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1586);
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1592);
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1594);
    float _1606 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1596);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    bool _1610 = _1554 > 0.0;
    bool _1612 = isnan(_1554);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1602);
    float _1622 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1624 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1604);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1606);
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1630 = _1412 + 0.5;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1358 + 0.5;
    float _1636 = _1624 + _1628;
    float _1638 = _1626 + _1628;
    float _1640 = _1628 * 0.5;
    float _1642 = _1428 + 0.5;
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _1424 + 0.5;
    float _1648 = _1636 * 0.5;
    float _1650 = _1638 * 0.5;
    float _1652 = fma(_1620, -0.5, _1640);
    out.m_47.x = _1630;
    out.m_47.y = _1634;
    out.m_47.z = _1646;
    out.m_47.w = _1642;
    out.m_49.w = _1644;
    out.m_33.x = _1632;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1628;
    out.m_51.x = _1648;
    out.m_51.y = _1652;
    out.m_51.z = _1650;
    out.m_51.w = _1628;
    if (_1618)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _972 = false;
    bool _830 = false;
    bool _608 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1710 = as_type<float>(_84);
        out.gl_Position.z = _1710;
    }
    if (!_74)
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
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_124);
        out.gl_Position.z = _1779;
    }
    if (_114)
    {
        return out;
    }
    float _126 = in.m_37.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = _128;
    if (!_138)
    {
        float _154 = _128 * _128;
        float _156 = _154 * 0.5;
        _120 = _156;
    }
    float _158 = _120;
    float _160 = _158;
    if (!_138)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    bool _166 = !_138;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _128 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _128);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_138;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _128 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _140, _228);
    float _236 = fma(_224, _142, _230);
    float _238 = fma(_224, _144, _232);
    float _240 = fma(_234, _126, _146);
    float _242 = fma(_236, _126, _148);
    float _244 = fma(_238, _126, _150);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _298;
    float _302 = 1.0 / _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _274 + _304;
    float _308 = 1.0 / _290;
    float _310 = _306 * _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _274 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _274 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = 1.0 / _294;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _274 + _324;
    float _328 = _314 * _302;
    bool _330 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_274);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _300;
    float _344 = _318 * _308;
    float _346 = -_340;
    float _348 = _346 + 1.0;
    float _350 = _278 * _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _362 = isnan(_274);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = _326 * _342;
    bool _378 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _380 = isnan(_274);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = fma(_392, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _396 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _398 = isnan(_274);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _388 * _348;
    float _410 = -_388;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _422 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_274);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _406 * _412;
    bool _436 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_274);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = fma(_416, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = fma(_420, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = -_446;
    float _462 = _460 + 1.0;
    float _464 = _370 * _450;
    float _466 = -_370;
    float _468 = _466 + 1.0;
    float _470 = fma(_454, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _432 * _462;
    float _474 = -_432;
    float _476 = _474 + 1.0;
    float _478 = _446 * _468;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = _372 * _472;
    float _486 = _394 * _472;
    float _488 = _374 * _472;
    float _490 = fma(_482, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _512 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _488);
    float _514 = fma(_494, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_500, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_504, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_470, _478, _496);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _522;
    float _526 = in.m_37.x;
    float _528 = in.m_37.y;
    float _530 = in.m_37.z;
    float _532 = fma(_456, _478, _510);
    float _534 = fma(_458, _478, _512);
    float _536 = fma(_508, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = fma(_524, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _540 = fma(_490, _464, _532);
    float _542 = fma(_536, _464, _520);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _552;
    float _556 = fma(_538, _464, _534);
    float _558 = fma(_546, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _560 = fma(_550, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _562 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _564 = fma(_514, _434, _540);
    float _566 = fma(_516, _434, _542);
    float _568 = fma(_518, _434, _556);
    float _570 = fma(_558, _408, _564);
    float _572 = fma(_560, _408, _566);
    float _574 = fma(_562, _408, _568);
    float _576 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _570);
    float _578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _572);
    float _580 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _574);
    float _582 = _576 * _526;
    float _584 = _578 * _528;
    float _586 = _580 * _530;
    bool _588 = !_320;
    float _606;
    if (!_588)
    {
        float _590 = in.m_39.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_70);
        float _612 = 1.0 / _610;
        float _614 = _102 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = _616 + _622;
    bool _626 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_616);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _616 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = 1.0 / _640;
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _658 = 1.0 / _648;
    float _660 = 1.0 / _652;
    float _662 = _620 * _654;
    bool _664 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = isnan(_616);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -_636;
    float _678 = _676 + 1.0;
    float _680 = _674 * _678;
    float _682 = _624 * _658;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    bool _688 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_616);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_674;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _704;
    float _708 = fma(_686, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _710 = _644 * _660;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = fma(_706, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _734 = -_722;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _740 = _722 * _702;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = _698 * _736;
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = _732 * _746;
    float _758 = _708 * _746;
    float _760 = _738 * _746;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _756);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _758);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _760);
    float _768 = fma(_730, _710, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_744, _710, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _782;
    float _786 = fma(_768, _740, _762);
    float _788 = fma(_776, _662, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _790 = fma(_780, _662, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _792 = fma(_784, _662, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _794 = fma(_770, _740, _764);
    float _796 = fma(_772, _740, _766);
    float _798 = fma(_788, _680, _786);
    float _800 = fma(_790, _680, _794);
    float _802 = fma(_792, _680, _796);
    float _804 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].x, _798);
    float _806 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].y, _800);
    float _808 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].z, _802);
    bool _810 = !_656;
    float _828;
    if (!_810)
    {
        float _812 = in.m_39.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        float _832 = float(_70);
        float _834 = 1.0 / _832;
        float _836 = _102 * _834;
        _828 = _836;
    }
    _830 = false;
    float _838 = _828;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = isnan(_838);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_838);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _842;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_838);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _896 = _870 * _880;
    float _898 = -_870;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _858;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _908 = _876 * _872;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _912 = _838 + _910;
    float _914 = -_892;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _838 + _918;
    float _922 = fma(_908, _912, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = _854 * _916;
    float _926 = _906 * _902;
    float _928 = _922 * _896;
    float _930 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = fma(_926, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _934 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _928);
    float _936 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_932, _924, _934);
    float _942 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _938;
    out.m_41.y = _944;
    out.m_41.z = _948;
    out.m_41.w = _950;
    bool _952 = !_894;
    float _970;
    if (!_952)
    {
        float _954 = in.m_39.x;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _958 = _954 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _962 = _960 * _956;
        float _964 = floor(_962);
        float _966 = -_964;
        float _968 = _962 + _966;
        _970 = _968;
        _972 = true;
    }
    else
    {
        float _974 = float(_70);
        float _976 = 1.0 / _974;
        float _978 = _102 * _976;
        _970 = _978;
    }
    _972 = false;
    float _980 = _970;
    float _982 = in.m_39.w;
    float _984 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _986 = in.m_43.x;
    float _988 = in.m_43.y;
    float _990 = in.m_43.z;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _994 = _992 != 0;
    float _996 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _984);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1000 = _998 != 0;
    float _1002 = in.m_39.x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    float _1008 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = in.m_45.y;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1018 = _1016 != 0;
    float _1020 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = in.m_39.y;
    float _1024 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1032 = _1014;
    if (_1000)
    {
        float _1034 = in.m_39.z;
        _1030 = _1034;
    }
    float _1036 = _1030;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1040 = _982 > 0.5;
    float _1042 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1048 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1050 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    float _1052 = 1.0 / _1028;
    float _1054 = in.m_45.x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1064 = 1.0 / _1058;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1068 = fma(_1062, -2.0, _1060);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1072 = _1062;
    bool _1074 = _1040;
    if (!_1018)
    {
        float _1076 = in.m_39.z;
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1088 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _996);
    float _1090 = -_1046;
    float _1092 = fma(_1080, 2.0, _1090);
    float _1094 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1048);
    float _1096 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1050);
    float _1098 = _1008 * _1070;
    float _1100 = _1084 * _1052;
    float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1104;
    float _1108 = -_1014;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1114 = _980 + _1112;
    float _1116 = _1020 * _1086;
    float _1118 = _1024 * _1066;
    float _1120 = _1106 * _1064;
    bool _1122 = false;
    float _1124 = _1086;
    if (_1000)
    {
        bool _1126 = _1036 > 0.5;
        _1122 = _1126;
    }
    bool _1128 = _1122;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _980 + _1130;
    float _1134 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1136 = _1040 ? _1110 : _1014;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = _1006 ? _1136 : _1014;
    float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1146 = _1022 > 0.5;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1150 = _1136;
    float _1152 = _1132;
    if (!_1018)
    {
        _1124 = _1022;
    }
    float _1154 = _1124;
    float _1156 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1158 = _1154;
    if (_994)
    {
        bool _1160 = _1002 > 0.5;
        _1074 = _1160;
    }
    bool _1162 = _1074;
    float _1164 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1148);
    if (_1018)
    {
        _1158 = _1002;
    }
    float _1166 = _1158;
    float _1168 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1012)
    {
        float _1170 = _1146 ? _1110 : _1014;
        _1032 = _1170;
    }
    float _1172 = _1032;
    float _1174 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1078;
    int _1178 = as_type<int>(_1172);
    if (!_1018)
    {
        _1150 = _1078;
    }
    float _1180 = _1150;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1184 = _1180;
    if (_1018)
    {
        _1184 = _1022;
    }
    float _1186 = _1184;
    float _1188 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1018)
    {
        _1176 = _1022;
    }
    float _1190 = _1176;
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    bool _1194 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1196 = isnan(_980);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    bool _1208 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1210 = isnan(_980);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    bool _1222 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1224 = isnan(_980);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1204;
    float _1236 = _1234 + 1.0;
    float _1238 = fma(_1142, _1168, -0.5);
    float _1240 = _1232 * _1236;
    float _1242 = -_1232;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1252 = _1218 * _1244;
    float _1254 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    int _1256 = as_type<int>(_1246);
    float _1258 = _1248;
    if (_1000)
    {
        float _1260 = -_1054;
        float _1262 = _1260 + 1.0;
        _1256 = as_type<int>(_1262);
    }
    int _1264 = _1256;
    float _1266 = fma(_1248, _1172, -0.5);
    float _1268 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1220);
    if (!_1000)
    {
        _1258 = _1054;
    }
    float _1270 = _1258;
    float _1272 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1274 = _1270;
    if (_1000)
    {
        float _1276 = _1128 ? as_type<float>(_1264) : _1054;
        _1274 = _1276;
    }
    float _1278 = _1274;
    float _1280 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1282 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1284 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1286 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1288 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (_994)
    {
        float _1290 = -_1054;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    float _1296 = -_1250;
    float _1298 = fma(_1272, 2.0, _1296);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1302 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1304 = _1286 + _1288;
    float _1306 = _1304;
    if (!_994)
    {
        _1152 = _1054;
    }
    float _1308 = _1152;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1312 = _1308;
    if (_994)
    {
        float _1314 = _1162 ? as_type<float>(_1294) : _1054;
        _1312 = _1314;
    }
    float _1316 = _1312;
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1320 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1300);
    float _1322 = _1282 + _1302;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1304 + _1324;
    float _1328 = _1138 * _1252;
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1310);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1334 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1318);
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1322 + _1336;
    float _1340 = _1326 * _1326;
    float _1342 = -_1218;
    float _1344 = _1342 + 1.0;
    float _1346 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1164);
    float _1348 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1350 = fma(_1338, _1338, _1340);
    float _1352 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1356 = -_1348;
    float _1358 = fma(_1346, _1266, _1356);
    float _1360 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1366 = fma(_1134, _1240, _1360);
    float _1368 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1156);
    float _1370 = sqrt(_1350);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1376 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1378 = -_102;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1092);
    float _1382 = fma(_1364, -2.0, _1372);
    float _1384 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1388 = 1.0 / _1362;
    float _1390 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1392 = fma(_1384, _1316, -0.5);
    float _1394 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1396 = _1280 + _1376;
    float _1398 = _1386 + _1362;
    float _1400 = fma(_1390, _1278, -0.5);
    float _1402 = -_102;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    bool _1406 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1410 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1382);
    float _1412 = fma(_1368, _1392, _1380);
    bool _1414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1416 = isnan(0.5);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1422 = _1418 || _1420;
    float _1424 = fma(_1394, _1400, _1404);
    float _1426 = -_1410;
    float _1428 = fma(_1408, _1238, _1426);
    float _1430 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1366);
    float _1432 = _1398 * _1388;
    float _1434 = _1432 * 0.5;
    float _1436 = _1388;
    float _1438 = _1322;
    float _1440 = _1326;
    if (!_1406)
    {
        _1436 = _1396;
    }
    float _1442 = _1436;
    bool _1444 = !_1406;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1370 + _1450;
        float _1454 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1456 = rsqrt(_1350);
        float _1458 = _1452 * _1448;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1396, _1464, _1472);
        float _1478 = _1456 * _1474;
        float _1480 = fma(_1338, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1326, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1446 = _1476;
        _1438 = _1480;
        _1306 = _1482;
    }
    float _1484 = _1446;
    float _1486 = _1438;
    float _1488 = _1306;
    float _1490 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1422)
    {
        _1440 = 1.0;
    }
    float _1492 = _1440;
    float _1494 = _1492;
    if (!_1422)
    {
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1498 * 0.15915493667125701904296875;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1506 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1500 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = 1.0 / _1510;
        float _1518 = _1502 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = _1502 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1528;
        float _1532 = _1520 * _1522;
        float _1534 = 1.0 / _1506;
        float _1536 = 1.0 / _1532;
        float _1538 = 1.0 / _1530;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = _1534 * _1540;
        float _1544 = _1526 * _1536;
        float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1548 = fma(_1544, _1542, _1546);
        float _1550 = _1548 * _1538;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        _1494 = _1552;
    }
    float _1554 = _1494;
    float _1556 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1560 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1566 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1568 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1570 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1572 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1568);
    float _1578 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1584 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1588 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1582);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1584);
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1586);
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1592);
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1594);
    float _1606 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1596);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    bool _1610 = _1554 > 0.0;
    bool _1612 = isnan(_1554);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1602);
    float _1622 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1624 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1604);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1606);
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1630 = _1412 + 0.5;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1358 + 0.5;
    float _1636 = _1624 + _1628;
    float _1638 = _1626 + _1628;
    float _1640 = _1628 * 0.5;
    float _1642 = _1428 + 0.5;
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _1424 + 0.5;
    float _1648 = _1636 * 0.5;
    float _1650 = _1638 * 0.5;
    float _1652 = fma(_1620, -0.5, _1640);
    out.m_47.x = _1630;
    out.m_47.y = _1634;
    out.m_47.z = _1646;
    out.m_47.w = _1642;
    out.m_49.w = _1644;
    out.m_33.x = _1632;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1628;
    out.m_51.x = _1648;
    out.m_51.y = _1652;
    out.m_51.z = _1650;
    out.m_51.w = _1628;
    if (_1618)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _972 = false;
    bool _830 = false;
    bool _608 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1710 = as_type<float>(_84);
        out.gl_Position.z = _1710;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_124);
        out.gl_Position.z = _1779;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_37.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = _128;
    if (!_138)
    {
        float _154 = _128 * _128;
        float _156 = _154 * 0.5;
        _120 = _156;
    }
    float _158 = _120;
    float _160 = _158;
    if (!_138)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    bool _166 = !_138;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _128 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _128);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_138;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _128 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _140, _228);
    float _236 = fma(_224, _142, _230);
    float _238 = fma(_224, _144, _232);
    float _240 = fma(_234, _126, _146);
    float _242 = fma(_236, _126, _148);
    float _244 = fma(_238, _126, _150);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _298;
    float _302 = 1.0 / _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _274 + _304;
    float _308 = 1.0 / _290;
    float _310 = _306 * _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _274 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = _274 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = 1.0 / _294;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _274 + _324;
    float _328 = _314 * _302;
    bool _330 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_274);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _300;
    float _344 = _318 * _308;
    float _346 = -_340;
    float _348 = _346 + 1.0;
    float _350 = _278 * _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _362 = isnan(_274);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = _326 * _342;
    bool _378 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _380 = isnan(_274);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _390;
    float _394 = fma(_392, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _396 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _398 = isnan(_274);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _388 * _348;
    float _410 = -_388;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _422 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_274);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _406 * _412;
    bool _436 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_274);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_406;
    float _450 = _448 + 1.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = fma(_416, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = fma(_420, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = -_446;
    float _462 = _460 + 1.0;
    float _464 = _370 * _450;
    float _466 = -_370;
    float _468 = _466 + 1.0;
    float _470 = fma(_454, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _432 * _462;
    float _474 = -_432;
    float _476 = _474 + 1.0;
    float _478 = _446 * _468;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = _372 * _472;
    float _486 = _394 * _472;
    float _488 = _374 * _472;
    float _490 = fma(_482, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _512 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _488);
    float _514 = fma(_494, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _516 = fma(_500, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _518 = fma(_504, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _520 = fma(_470, _478, _496);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _522;
    float _526 = in.m_37.x;
    float _528 = in.m_37.y;
    float _530 = in.m_37.z;
    float _532 = fma(_456, _478, _510);
    float _534 = fma(_458, _478, _512);
    float _536 = fma(_508, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = fma(_524, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _540 = fma(_490, _464, _532);
    float _542 = fma(_536, _464, _520);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _552;
    float _556 = fma(_538, _464, _534);
    float _558 = fma(_546, _376, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _560 = fma(_550, _376, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _562 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _564 = fma(_514, _434, _540);
    float _566 = fma(_516, _434, _542);
    float _568 = fma(_518, _434, _556);
    float _570 = fma(_558, _408, _564);
    float _572 = fma(_560, _408, _566);
    float _574 = fma(_562, _408, _568);
    float _576 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _570);
    float _578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _572);
    float _580 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _574);
    float _582 = _576 * _526;
    float _584 = _578 * _528;
    float _586 = _580 * _530;
    bool _588 = !_320;
    float _606;
    if (!_588)
    {
        float _590 = in.m_39.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_70);
        float _612 = 1.0 / _610;
        float _614 = _102 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = _616 + _622;
    bool _626 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _628 = isnan(_616);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _616 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = 1.0 / _640;
    bool _656 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _658 = 1.0 / _648;
    float _660 = 1.0 / _652;
    float _662 = _620 * _654;
    bool _664 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = isnan(_616);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -_636;
    float _678 = _676 + 1.0;
    float _680 = _674 * _678;
    float _682 = _624 * _658;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    bool _688 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_616);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_674;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _704;
    float _708 = fma(_686, _682, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _710 = _644 * _660;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = fma(_706, _682, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _734 = -_722;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _740 = _722 * _702;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = _698 * _736;
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = _732 * _746;
    float _758 = _708 * _746;
    float _760 = _738 * _746;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _756);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _758);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _760);
    float _768 = fma(_730, _710, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = fma(_754, _710, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_744, _710, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _782;
    float _786 = fma(_768, _740, _762);
    float _788 = fma(_776, _662, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _790 = fma(_780, _662, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _792 = fma(_784, _662, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _794 = fma(_770, _740, _764);
    float _796 = fma(_772, _740, _766);
    float _798 = fma(_788, _680, _786);
    float _800 = fma(_790, _680, _794);
    float _802 = fma(_792, _680, _796);
    float _804 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].x, _798);
    float _806 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].y, _800);
    float _808 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[110].z, _802);
    bool _810 = !_656;
    float _828;
    if (!_810)
    {
        float _812 = in.m_39.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        float _832 = float(_70);
        float _834 = 1.0 / _832;
        float _836 = _102 * _834;
        _828 = _836;
    }
    _830 = false;
    float _838 = _828;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = isnan(_838);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_838);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _842;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_838);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _896 = _870 * _880;
    float _898 = -_870;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _858;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _908 = _876 * _872;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _912 = _838 + _910;
    float _914 = -_892;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _838 + _918;
    float _922 = fma(_908, _912, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = _854 * _916;
    float _926 = _906 * _902;
    float _928 = _922 * _896;
    float _930 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = fma(_926, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _934 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _928);
    float _936 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_932, _924, _934);
    float _942 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _938;
    out.m_41.y = _944;
    out.m_41.z = _948;
    out.m_41.w = _950;
    bool _952 = !_894;
    float _970;
    if (!_952)
    {
        float _954 = in.m_39.x;
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _958 = _954 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _962 = _960 * _956;
        float _964 = floor(_962);
        float _966 = -_964;
        float _968 = _962 + _966;
        _970 = _968;
        _972 = true;
    }
    else
    {
        float _974 = float(_70);
        float _976 = 1.0 / _974;
        float _978 = _102 * _976;
        _970 = _978;
    }
    _972 = false;
    float _980 = _970;
    float _982 = in.m_39.w;
    float _984 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _986 = in.m_43.x;
    float _988 = in.m_43.y;
    float _990 = in.m_43.z;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _994 = _992 != 0;
    float _996 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _984);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1000 = _998 != 0;
    float _1002 = in.m_39.x;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    float _1008 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = in.m_45.y;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1018 = _1016 != 0;
    float _1020 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = in.m_39.y;
    float _1024 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1032 = _1014;
    if (_1000)
    {
        float _1034 = in.m_39.z;
        _1030 = _1034;
    }
    float _1036 = _1030;
    float _1038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1040 = _982 > 0.5;
    float _1042 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1048 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1050 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    float _1052 = 1.0 / _1028;
    float _1054 = in.m_45.x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1064 = 1.0 / _1058;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1068 = fma(_1062, -2.0, _1060);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1072 = _1062;
    bool _1074 = _1040;
    if (!_1018)
    {
        float _1076 = in.m_39.z;
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1088 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _996);
    float _1090 = -_1046;
    float _1092 = fma(_1080, 2.0, _1090);
    float _1094 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1048);
    float _1096 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1050);
    float _1098 = _1008 * _1070;
    float _1100 = _1084 * _1052;
    float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1104;
    float _1108 = -_1014;
    float _1110 = _1108 + 1.0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1114 = _980 + _1112;
    float _1116 = _1020 * _1086;
    float _1118 = _1024 * _1066;
    float _1120 = _1106 * _1064;
    bool _1122 = false;
    float _1124 = _1086;
    if (_1000)
    {
        bool _1126 = _1036 > 0.5;
        _1122 = _1126;
    }
    bool _1128 = _1122;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _980 + _1130;
    float _1134 = fma(_1100, _1114, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1136 = _1040 ? _1110 : _1014;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = _1006 ? _1136 : _1014;
    float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1146 = _1022 > 0.5;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1150 = _1136;
    float _1152 = _1132;
    if (!_1018)
    {
        _1124 = _1022;
    }
    float _1154 = _1124;
    float _1156 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1158 = _1154;
    if (_994)
    {
        bool _1160 = _1002 > 0.5;
        _1074 = _1160;
    }
    bool _1162 = _1074;
    float _1164 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1148);
    if (_1018)
    {
        _1158 = _1002;
    }
    float _1166 = _1158;
    float _1168 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1012)
    {
        float _1170 = _1146 ? _1110 : _1014;
        _1032 = _1170;
    }
    float _1172 = _1032;
    float _1174 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1078;
    int _1178 = as_type<int>(_1172);
    if (!_1018)
    {
        _1150 = _1078;
    }
    float _1180 = _1150;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1184 = _1180;
    if (_1018)
    {
        _1184 = _1022;
    }
    float _1186 = _1184;
    float _1188 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1018)
    {
        _1176 = _1022;
    }
    float _1190 = _1176;
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    bool _1194 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1196 = isnan(_980);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    bool _1208 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1210 = isnan(_980);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    bool _1222 = _980 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1224 = isnan(_980);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1204;
    float _1236 = _1234 + 1.0;
    float _1238 = fma(_1142, _1168, -0.5);
    float _1240 = _1232 * _1236;
    float _1242 = -_1232;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1248 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1252 = _1218 * _1244;
    float _1254 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1246);
    int _1256 = as_type<int>(_1246);
    float _1258 = _1248;
    if (_1000)
    {
        float _1260 = -_1054;
        float _1262 = _1260 + 1.0;
        _1256 = as_type<int>(_1262);
    }
    int _1264 = _1256;
    float _1266 = fma(_1248, _1172, -0.5);
    float _1268 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1220);
    if (!_1000)
    {
        _1258 = _1054;
    }
    float _1270 = _1258;
    float _1272 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1274 = _1270;
    if (_1000)
    {
        float _1276 = _1128 ? as_type<float>(_1264) : _1054;
        _1274 = _1276;
    }
    float _1278 = _1274;
    float _1280 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1282 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1284 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    float _1286 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1288 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (_994)
    {
        float _1290 = -_1054;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    float _1296 = -_1250;
    float _1298 = fma(_1272, 2.0, _1296);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1302 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1304 = _1286 + _1288;
    float _1306 = _1304;
    if (!_994)
    {
        _1152 = _1054;
    }
    float _1308 = _1152;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1312 = _1308;
    if (_994)
    {
        float _1314 = _1162 ? as_type<float>(_1294) : _1054;
        _1312 = _1314;
    }
    float _1316 = _1312;
    float _1318 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1320 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1300);
    float _1322 = _1282 + _1302;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1304 + _1324;
    float _1328 = _1138 * _1252;
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1310);
    float _1332 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1334 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1318);
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1322 + _1336;
    float _1340 = _1326 * _1326;
    float _1342 = -_1218;
    float _1344 = _1342 + 1.0;
    float _1346 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1164);
    float _1348 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1350 = fma(_1338, _1338, _1340);
    float _1352 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1356 = -_1348;
    float _1358 = fma(_1346, _1266, _1356);
    float _1360 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1366 = fma(_1134, _1240, _1360);
    float _1368 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1156);
    float _1370 = sqrt(_1350);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1376 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1378 = -_102;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1092);
    float _1382 = fma(_1364, -2.0, _1372);
    float _1384 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1388 = 1.0 / _1362;
    float _1390 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1392 = fma(_1384, _1316, -0.5);
    float _1394 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1396 = _1280 + _1376;
    float _1398 = _1386 + _1362;
    float _1400 = fma(_1390, _1278, -0.5);
    float _1402 = -_102;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    bool _1406 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1410 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1382);
    float _1412 = fma(_1368, _1392, _1380);
    bool _1414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1416 = isnan(0.5);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1422 = _1418 || _1420;
    float _1424 = fma(_1394, _1400, _1404);
    float _1426 = -_1410;
    float _1428 = fma(_1408, _1238, _1426);
    float _1430 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1366);
    float _1432 = _1398 * _1388;
    float _1434 = _1432 * 0.5;
    float _1436 = _1388;
    float _1438 = _1322;
    float _1440 = _1326;
    if (!_1406)
    {
        _1436 = _1396;
    }
    float _1442 = _1436;
    bool _1444 = !_1406;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1370 + _1450;
        float _1454 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1456 = rsqrt(_1350);
        float _1458 = _1452 * _1448;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1396, _1464, _1472);
        float _1478 = _1456 * _1474;
        float _1480 = fma(_1338, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1326, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1446 = _1476;
        _1438 = _1480;
        _1306 = _1482;
    }
    float _1484 = _1446;
    float _1486 = _1438;
    float _1488 = _1306;
    float _1490 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1422)
    {
        _1440 = 1.0;
    }
    float _1492 = _1440;
    float _1494 = _1492;
    if (!_1422)
    {
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1498 * 0.15915493667125701904296875;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1506 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
        float _1508 = _1500 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1500 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = 1.0 / _1510;
        float _1518 = _1502 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = _1502 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1528;
        float _1532 = _1520 * _1522;
        float _1534 = 1.0 / _1506;
        float _1536 = 1.0 / _1532;
        float _1538 = 1.0 / _1530;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = _1534 * _1540;
        float _1544 = _1526 * _1536;
        float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1548 = fma(_1544, _1542, _1546);
        float _1550 = _1548 * _1538;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        _1494 = _1552;
    }
    float _1554 = _1494;
    float _1556 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1560 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1566 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1568 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1570 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1572 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1568);
    float _1578 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1584 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1588 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1582);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1584);
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1586);
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1592);
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1594);
    float _1606 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1596);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    bool _1610 = _1554 > 0.0;
    bool _1612 = isnan(_1554);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1602);
    float _1622 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1624 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1604);
    float _1626 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1606);
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1630 = _1412 + 0.5;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1358 + 0.5;
    float _1636 = _1624 + _1628;
    float _1638 = _1626 + _1628;
    float _1640 = _1628 * 0.5;
    float _1642 = _1428 + 0.5;
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _1424 + 0.5;
    float _1648 = _1636 * 0.5;
    float _1650 = _1638 * 0.5;
    float _1652 = fma(_1620, -0.5, _1640);
    out.m_47.x = _1630;
    out.m_47.y = _1634;
    out.m_47.z = _1646;
    out.m_47.w = _1642;
    out.m_49.w = _1644;
    out.m_33.x = _1632;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _1626;
    out.gl_Position.w = _1628;
    out.m_51.x = _1648;
    out.m_51.y = _1652;
    out.m_51.z = _1650;
    out.m_51.w = _1628;
    if (_1618)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

