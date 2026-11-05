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
    float4 m_53 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _388 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_92);
        out.gl_Position.z = _2201;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_130);
        out.gl_Position.z = _2271;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = _314 * _318;
    float _330 = -_314;
    float _332 = _330 + 1.0;
    float _334 = _286 * _324;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    float _340 = fma(_322, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_338, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_344, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _340 * _328;
    float _352 = _348 * _328;
    float _354 = _346 * _328;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_37.x;
    float _400 = in.m_37.y;
    float _402 = in.m_37.z;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = 1.0 / _406;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _422;
    float _426 = 1.0 / _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _396 + _428;
    bool _432 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_396);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _364 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _396 + _446;
    float _450 = 1.0 / _414;
    float _452 = _366 * _402;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = _396 + _454;
    float _458 = _430 * _420;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _462 = _396 + _460;
    bool _464 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _466 = isnan(_396);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _362 * _398;
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _418;
    float _492 = _448 * _426;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = _396 + _494;
    bool _498 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _500 = isnan(_396);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    bool _514 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _516 = 1.0 / _424;
    float _518 = _456 * _450;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _520;
    float _524 = -_474;
    float _526 = _524 + 1.0;
    float _528 = fma(_512, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = fma(_522, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = _462 * _490;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    bool _538 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_396);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_536, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _552 = -_488;
    float _554 = _552 + 1.0;
    float _556 = _496 * _516;
    float _558 = -_508;
    float _560 = _558 + 1.0;
    bool _562 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_396);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _442 * _554;
    float _576 = -_442;
    float _578 = _576 + 1.0;
    float _580 = _474 * _560;
    float _582 = _548 * _526;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _592 = _572 * _578;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _488 * _586;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _608 = fma(_590, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _610 = _530 * _592;
    float _612 = fma(_602, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _614 = fma(_606, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _616 = _528 * _592;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _618;
    float _622 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _610);
    float _624 = _550 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _626;
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _636 = fma(_612, _574, _622);
    float _638 = fma(_628, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _640;
    float _644 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _624);
    float _646 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _648 = fma(_634, _532, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _650 = fma(_638, _598, _636);
    float _652 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _654 = fma(_614, _574, _644);
    float _656 = fma(_608, _574, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _666 = fma(_652, _598, _654);
    float _668 = fma(_660, _532, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _674;
    float _678 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _680 = fma(_630, _598, _656);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _682;
    float _686 = fma(_648, _582, _650);
    float _688 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _690 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _692 = fma(_668, _582, _666);
    float _694 = fma(_684, _556, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _696 = fma(_678, _582, _680);
    float _698 = fma(_688, _580, _686);
    float _700 = fma(_690, _580, _692);
    float _702 = fma(_694, _580, _696);
    float _704 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _708 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].z, _702);
    bool _710 = !_514;
    float _712 = _688;
    float _730;
    if (!_710)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _110 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = in.m_41.x;
    float _744 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = in.m_41.y;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _750 = _748 != 0;
    float _752 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_39.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _768 = _766 != 0;
    float _770 = in.m_39.x;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    float _776 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_43.y;
    float _780 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _752);
    float _782 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _784 = in.m_39.y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _790 = in.m_43.z;
    int _792 = as_type<int>(_776);
    float _794 = _742;
    if (_750)
    {
        float _796 = -_742;
        float _798 = _796 + 1.0;
        _792 = as_type<int>(_798);
    }
    int _800 = _792;
    if (!_750)
    {
        _712 = _742;
    }
    float _802 = _712;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = in.m_43.w;
    float _808 = -_746;
    float _810 = _808 + 1.0;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = 1.0 / _788;
    float _816 = in.m_43.x;
    bool _818 = _758 > 0.5;
    float _820 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    float _822 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _824 = false;
    float _826 = _802;
    float _828 = _746;
    if (_750)
    {
        bool _830 = _770 > 0.5;
        _824 = _830;
    }
    bool _832 = _824;
    float _834 = _820 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _836 = _818 ? _810 : _746;
    out.m_45.y = _778;
    float _838 = _836;
    if (_750)
    {
        float _840 = _832 ? as_type<float>(_800) : _742;
        _826 = _840;
    }
    float _842 = _826;
    float _844 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = in.m_39.z;
    float _860 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -_812;
    float _864 = fma(_844, 2.0, _862);
    float _866 = fma(_860, -2.0, _804);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_45.z = _790;
    float _872 = _784 * 2.0;
    float _874 = 1.0 / _870;
    out.m_45.w = _806;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _880 = -_110;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    out.m_45.x = _816;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _892 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _896 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _898 = log2(_896);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = 1.0 / _878;
    float _916 = _762 ? _836 : _746;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    bool _922 = _784 > 0.5;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _928 = _922;
    float _930 = _920;
    float _932 = _926;
    if (!_774)
    {
        _838 = _784;
    }
    float _934 = _838;
    float _936 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _938 = _934;
    if (_768)
    {
        float _940 = _922 ? _810 : _746;
        _828 = _940;
    }
    float _942 = _828;
    float _944 = 1.0 / _912;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _954 = _898 * _110;
    if (_756)
    {
        bool _956 = _858 > 0.5;
        _928 = _956;
    }
    bool _958 = _928;
    float _960 = _948 * _814;
    float _962 = _858 * 2.0;
    float _964 = _952 * _874;
    float _966 = 1.0 / _886;
    float _968 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _892 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_774)
    {
        _938 = _770;
    }
    float _974 = _938;
    float _976 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_47.x = _902;
    out.m_47.y = _904;
    out.m_47.z = _968;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _982 = floor(_962);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _984;
    if (_756)
    {
        float _988 = -_742;
        float _990 = _988 + 1.0;
        _972 = as_type<int>(_990);
    }
    int _992 = _972;
    float _994 = _980 * _914;
    float _996 = _986 * _944;
    bool _998 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1000 = isnan(_740);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = exp2(_954);
    if (_756)
    {
        float _1012 = _958 ? as_type<float>(_992) : _742;
        _794 = _1012;
    }
    float _1014 = _794;
    float _1016 = _784 + _858;
    float _1018 = _770 * 2.0;
    float _1020 = _920 * _966;
    float _1022 = _1016 + (-1.0);
    bool _1024 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = 1.0 / _908;
    bool _1036 = _982 > 0.0;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _770 + _784;
    bool _1042 = _982 >= 0.0;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_1008;
    float _1054 = _1052 + 1.0;
    bool _1056 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1058 = isnan(_740);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _1040 + (-1.0);
    float _1070 = floor(_872);
    if (!_774)
    {
        _930 = _858;
    }
    float _1072 = _930;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = -_1010;
    float _1078 = _1076 + 1.0;
    bool _1080 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1082 = isnan(_740);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1072;
    if (_774)
    {
        _1092 = _784;
    }
    float _1094 = _1092;
    float _1096 = floor(_1018);
    float _1098 = _1032 ? _1078 : 0.0;
    float _1100 = _926 * _1034;
    if (!_774)
    {
        _932 = _858;
    }
    float _1102 = _932;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _1102;
    if (_774)
    {
        _1108 = _784;
    }
    float _1110 = _1108;
    bool _1112 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_740);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1126 = _1050 ? 0 : 1;
    bool _1128 = _1070 > 0.0;
    int _1130 = ~_1126;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1134;
    if (!_1036)
    {
        int _1138 = ~_1126;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1146 = _740 + _1144;
    bool _1148 = _1070 >= 0.0;
    bool _1150 = isnan(_1070);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = -_1066;
    float _1160 = _1158 + 1.0;
    bool _1162 = _1096 > 0.0;
    float _1164 = fma(_960, _1146, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1166 = _1096 >= 0.0;
    bool _1168 = isnan(_1096);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1178 = _740 + _1176;
    float _1180 = _1090 * _1160;
    bool _1182 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1184 = isnan(_740);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1196 = _740 + _1194;
    float _1198 = fma(_1020, _1178, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _740 + _1200;
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = -_1192;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_964, _1196, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1212 = fma(_1100, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1214 = _1008 * _1106;
    float _1216 = _1192 * _1054;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1220 = _740 + _1218;
    bool _1222 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1224 = isnan(_740);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = _1122 * _1208;
    float _1236 = -_1122;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_996, _1220, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1242 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1244 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1246 = isnan(_740);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1232 * _1238;
    float _1258 = -_1232;
    float _1260 = _1258 + 1.0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1264 = fma(_916, _1242, -0.5);
    float _1266 = _1254 * _1260;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1270 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1262);
    float _1272 = _1198 * _1266;
    float _1274 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1268);
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1282 = _740 + _1280;
    float _1284 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1288 = _974 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = fma(_1276, _942, -0.5);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1294 = fma(_1284, -2.0, _1278);
    float _1296 = fma(_994, _1282, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1300 = -_1286;
    float _1302 = fma(_1288, 2.0, _1300);
    float _1304 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1292);
    int _1306 = _1174 ? 0 : 1;
    float _1308 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    bool _1310 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1312 = isnan(1.0);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1318 = _1314 || _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1322 = 1.0 + _1320;
    float _1324 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _866);
    float _1328 = 1.0 / _1322;
    float _1330 = -_1254;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1270);
    float _1336 = -_1326;
    float _1338 = fma(_1324, _1290, _1336);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1342 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1272);
    float _1344 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1346 = ~_1306;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    float _1352 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1340);
    float _1354 = fma(_1212, _1256, _1342);
    float _1356 = -_1308;
    float _1358 = fma(_1334, _1264, _1356);
    float _1360 = fma(_1344, _842, -0.5);
    float _1362 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1352);
    float _1364 = fma(_1164, _1234, _1354);
    float _1366 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1274);
    float _1368 = -_110;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1302);
    int _1372 = _1350;
    float _1374 = _1338;
    if (_1318)
    {
        float _1376 = _1098 * _1328;
        _112 = _1376;
    }
    float _1378 = _112;
    float _1380 = fma(_1362, _1360, _882);
    float _1382 = fma(_1210, _1216, _1364);
    bool _1384 = !_852;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _834 + _1388;
    int _1392 = as_type<int>(_1380);
    if (!_1162)
    {
        int _1394 = ~_1306;
        int _1396 = _1394 + 1;
        _1372 = _1396;
    }
    int _1398 = _1372;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _936 + _1400;
    int _1404 = abs(_1386);
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1408 = !_848;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _970 + _1414;
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1406);
    int _1420 = abs(_1410);
    float _1422 = fma(_1240, _1214, _1382);
    float _1424 = float(_1398);
    float _1426 = _1390 * _1390;
    float _1428 = float(_1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1418);
    float _1432 = float(_1142);
    float _1434 = fma(_1402, _1402, _1426);
    float _1436 = fma(_1296, _1180, _1422);
    float _1438 = float(_1404);
    float _1440 = _1428 * _1432;
    bool _1442 = _1430 >= 0.0;
    float _1444 = fma(_1416, _1416, _1434);
    float _1446 = in.m_49.x;
    float _1448 = in.m_49.y;
    float _1450 = in.m_49.z;
    float _1452 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1454 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = _1338 + 0.5;
    float _1458 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1436);
    float _1460 = rsqrt(_1444);
    float _1462 = fma(_1452, _1014, -0.5);
    float _1464 = _1440 * (-2.0);
    float _1466 = _1358 + 0.5;
    float _1468 = fma(_1366, _1462, _1370);
    if (_1442)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1470 = _1374;
    float _1472 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1380 + 0.5;
    float _1478 = _1468 + 0.5;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1442)
    {
        float _1482 = _1470 * 5.0;
        _1392 = as_type<int>(_1482);
    }
    int _1484 = _1392;
    float _1486 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = fma(_1074, _1464, _1074);
    out.m_51.x = _1476;
    out.m_51.y = _1456;
    out.m_51.z = _1478;
    out.m_51.w = _1466;
    float _1490 = _1390 * _1460;
    float _1492 = _1402 * _1460;
    float _1494 = _1438 * _1424;
    if (_1442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4476 = as_type<float>(_1484);
        out.gl_Position.z = _4476;
    }
    float _1496 = fma(_1464, _1446, _1446);
    bool _1498 = !_856;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -_1490;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    out.m_53.x = _1474;
    out.m_53.y = _1454;
    out.m_53.z = _1480;
    out.m_53.w = _1486;
    float _1506 = -_1492;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    if (_1442)
    {
        out.m_33.x = 0.0;
    }
    if (_1442)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1510 = -_1490;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _1514 = _1416 * _1460;
    float _1516 = -_1492;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1520 = _770 + (-0.5);
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1512 + _1522;
    float _1526 = -_1514;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1518 + _1530;
    float _1534 = _1504 * _1504;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    int _1544 = _1156 ? 0 : 1;
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = _1494 * (-2.0);
    float _1550 = _784 + (-0.5);
    int _1552 = ~_1544;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    float _1560 = fma(_1548, _1448, _1448);
    int _1562 = _1556;
    if (!_1128)
    {
        int _1564 = ~_1544;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = fma(_1038, _1548, _1038);
    float _1572 = fma(_1508, _1508, _1534);
    bool _1574 = _1558 >= 0.0;
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1560);
    int _1578 = abs(_1500);
    float _1580 = -_1514;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1584 = fma(_1488, _1378, _1542);
    float _1586 = fma(_1570, _1378, _1576);
    float _1588 = _770 + _858;
    float _1590 = float(_1578);
    float _1592 = fma(_1582, _1582, _1572);
    float _1594 = float(_1568);
    float _1596 = _1584 * 0.15915493667125701904296875;
    float _1598 = _1586 * 0.15915493667125701904296875;
    float _1600 = _1588 + (-1.0);
    float _1602 = as_type<float>(_1578);
    if (_1574)
    {
        _1602 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1604 = _1602;
    float _1606 = _1590 * _1594;
    float _1608 = _1596 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    int _1612 = as_type<int>(_1604);
    if (_1574)
    {
        out.m_33.x = 0.0;
    }
    if (_1574)
    {
        float _1614 = _1604 * 5.0;
        _1612 = as_type<int>(_1614);
    }
    int _1616 = _1612;
    float _1618 = _1606 * (-2.0);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1622 = _1596 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1598 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = sqrt(_1592);
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4714 = as_type<float>(_1616);
        out.gl_Position.z = _4714;
    }
    if (_1574)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1632 = -_834;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = fma(_1620, _1618, _1620);
    float _1638 = fma(_1618, _1450, _1450);
    float _1640 = -_936;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1644 = _1634 * _1634;
    float _1646 = _858 + (-0.5);
    float _1648 = -_970;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1598 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1642, _1642, _1644);
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1638);
    float _1660 = _1460 * _1630;
    float _1662 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1664 = fma(_1650, _1650, _1656);
    float _1666 = fma(_1636, _1378, _1658);
    float _1668 = _1610 * _1628;
    float _1670 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1672 = _1666 * 0.15915493667125701904296875;
    float _1674 = rsqrt(_1664);
    float _1676 = in.m_55.x;
    float _1678 = in.m_55.y;
    float _1680 = in.m_55.z;
    float _1682 = _1660 * _1670;
    float _1684 = _1660 * _1662;
    float _1686 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1688 = _1624 * _1654;
    float _1690 = _1610 * _1654;
    float _1692 = _1672 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1660 * _1686;
    bool _1698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1700 = isnan(0.5);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1706 = _1702 || _1704;
    bool _1708 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1710 = isnan(0.5);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1716 = _1712 || _1714;
    float _1718 = _1642 * _1674;
    float _1720 = _1650 * _1674;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1724 = _1718 * _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1720 * _1726;
    float _1730 = fma(_1694, _1688, _1668);
    float _1732 = fma(_1694, _1668, _1688);
    float _1734 = _1634 * _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1738 = -_1724;
    float _1740 = fma(_1720, _1736, _1738);
    float _1742 = _1672 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1728;
    float _1752 = fma(_1734, _1748, _1750);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1756 = _1734 * _1754;
    float _1758 = _1740 * _1740;
    float _1760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1762 = _1746 * _1684;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = -_1756;
    float _1768 = fma(_1718, _1764, _1766);
    float _1770 = fma(_1752, _1752, _1758);
    float _1772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1774 = _1624 * _1628;
    float _1776 = _1760 * _1696;
    float _1778 = fma(_1768, _1768, _1770);
    float _1780 = _1772 * _1682;
    float _1782 = -_1774;
    float _1784 = fma(_1694, _1690, _1782);
    float _1786 = -_1690;
    float _1788 = fma(_1694, _1774, _1786);
    float _1790 = _1654 * _1744;
    float _1792 = -_1780;
    float _1794 = _1694 * _1792;
    float _1796 = rsqrt(_1778);
    float _1798 = _1744 * _1780;
    float _1800 = _1628 * _1744;
    float _1802 = fma(_1790, _1762, _1794);
    float _1804 = _1624 * _1798;
    float _1806 = _1610 * _1798;
    float _1808 = fma(_1800, _1776, _1802);
    float _1810 = fma(_1730, _1762, _1804);
    float _1812 = fma(_1784, _1762, _1806);
    float _1814 = fma(_1788, _1776, _1810);
    float _1816 = fma(_1732, _1776, _1812);
    float _1818 = _1752 * _1796;
    float _1820 = _1740 * _1796;
    float _1822 = _1768 * _1796;
    float _1824 = _1734 * _1818;
    float _1826 = _1720 * _1820;
    float _1828 = -_1824;
    float _1830 = fma(_1718, _1820, _1828);
    float _1832 = -_1826;
    float _1834 = fma(_1734, _1822, _1832);
    float _1836 = _1830 * _1814;
    float _1838 = _1834 * _1814;
    float _1840 = fma(_1822, _1808, _1836);
    float _1842 = fma(_1818, _1808, _1838);
    float _1844 = fma(_1720, _1816, _1840);
    float _1846 = fma(_1718, _1816, _1842);
    float _1848 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1850 = _1718 * _1822;
    float _1852 = _970 + _1844;
    float _1854 = _936 + _1846;
    float _1856 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1848);
    float _1858 = -_1850;
    float _1860 = fma(_1720, _1818, _1858);
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1856);
    float _1872 = _1860 * _1814;
    float _1874 = _1864 * _1864;
    float _1876 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1878 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1880 = fma(_1820, _1808, _1872);
    float _1882 = fma(_1868, _1868, _1874);
    float _1884 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1876);
    float _1886 = 1.0 / _1878;
    float _1888 = fma(_1734, _1816, _1880);
    float _1890 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1884);
    float _1892 = _834 + _1888;
    float _1894 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1896 = sqrt(_1882);
    float _1898 = _1894 + _1878;
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1870;
    float _1904 = _1860;
    float _1906 = _1854;
    if (!_1900)
    {
        _1902 = _1854;
    }
    float _1908 = _1902;
    float _1910 = _1908;
    if (!_1900)
    {
        _1904 = _1852;
    }
    float _1912 = _1904;
    float _1914 = _1912;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1916 = _1906;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = rsqrt(_1882);
        float _1930 = _1926 * _1922;
        float _1932 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = _1930 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = fma(_1938, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1946 = _1928 * _1944;
        float _1948 = _1942 + (-1.0);
        float _1950 = fma(_1868, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1952 = fma(_1864, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = fma(_1892, _1942, _1954);
        _1910 = _1950;
        _1920 = _1956;
        _1914 = _1952;
    }
    float _1958 = _1910;
    float _1960 = _1920;
    float _1962 = _1914;
    float _1964 = -_1492;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1490;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = -_1514;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1976 = _1898 * _1886;
    float _1978 = _1976 * 0.5;
    float _1980 = _1970;
    float _1982 = _1966;
    float _1984 = _1974;
    if (!_1706)
    {
        float _1986 = _1524 * _1524;
        float _1988 = 1.0 / _1660;
        float _1990 = -_936;
        float _1992 = _1990 + _1958;
        float _1994 = fma(_1532, _1532, _1986);
        float _1996 = fma(_1540, _1540, _1994);
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = sqrt(_1996);
        float _2002 = precise::min(_2000, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2004 = _2002 * _1998;
        float _2006 = _2004 * _1988;
        float _2008 = -_834;
        float _2010 = _2008 + _1960;
        float _2012 = -_970;
        float _2014 = _2012 + _1962;
        float _2016 = fma(_1992, _2006, _1518);
        float _2018 = fma(_2010, _2006, _1512);
        float _2020 = fma(_2014, _2006, _1528);
        _1980 = _2018;
        _1982 = _2016;
        _1984 = _2020;
    }
    float _2022 = _1980;
    float _2024 = _1982;
    float _2026 = _1984;
    float _2028 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2028);
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2030);
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2032);
    float _2042 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2034);
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2036);
    float _2046 = _2036;
    if (_1716)
    {
        _2046 = 1.0;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (!_1716)
    {
        float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2054 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2052);
        float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2060 = 1.0 / _2054;
        float _2062 = 1.0 / _2058;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2068 = fma(_2060, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        float _2074 = -_2072;
        float _2076 = _2074 + 1.0;
        _2050 = _2076;
    }
    float _2078 = _2050;
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2082 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2040);
    float _2086 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2098 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2090);
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2108);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    bool _2120 = _2078 > 0.0;
    bool _2122 = isnan(_2078);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(0.0);
    bool _2128 = _2124 || _2126;
    float _2130 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2132 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2114);
    float _2136 = _2116 + _2118;
    float _2138 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2142 = _2136 * 0.5;
    out.m_33.x = _2140;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2116;
    out.gl_Position.w = _2118;
    out.m_57.z = _2142;
    out.m_57.w = _2118;
    if (_2128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _388 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_92);
        out.gl_Position.z = _2201;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_130);
        out.gl_Position.z = _2271;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = _314 * _318;
    float _330 = -_314;
    float _332 = _330 + 1.0;
    float _334 = _286 * _324;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    float _340 = fma(_322, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_338, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_344, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _340 * _328;
    float _352 = _348 * _328;
    float _354 = _346 * _328;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_37.x;
    float _400 = in.m_37.y;
    float _402 = in.m_37.z;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = 1.0 / _406;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _422;
    float _426 = 1.0 / _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _396 + _428;
    bool _432 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_396);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _364 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _396 + _446;
    float _450 = 1.0 / _414;
    float _452 = _366 * _402;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = _396 + _454;
    float _458 = _430 * _420;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _462 = _396 + _460;
    bool _464 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _466 = isnan(_396);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _362 * _398;
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _418;
    float _492 = _448 * _426;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = _396 + _494;
    bool _498 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _500 = isnan(_396);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    bool _514 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _516 = 1.0 / _424;
    float _518 = _456 * _450;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _520;
    float _524 = -_474;
    float _526 = _524 + 1.0;
    float _528 = fma(_512, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = fma(_522, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = _462 * _490;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    bool _538 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_396);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_536, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _552 = -_488;
    float _554 = _552 + 1.0;
    float _556 = _496 * _516;
    float _558 = -_508;
    float _560 = _558 + 1.0;
    bool _562 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_396);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _442 * _554;
    float _576 = -_442;
    float _578 = _576 + 1.0;
    float _580 = _474 * _560;
    float _582 = _548 * _526;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _592 = _572 * _578;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _488 * _586;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _608 = fma(_590, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _610 = _530 * _592;
    float _612 = fma(_602, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _614 = fma(_606, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _616 = _528 * _592;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _618;
    float _622 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _610);
    float _624 = _550 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _626;
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _636 = fma(_612, _574, _622);
    float _638 = fma(_628, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _640;
    float _644 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _624);
    float _646 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _648 = fma(_634, _532, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _650 = fma(_638, _598, _636);
    float _652 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _654 = fma(_614, _574, _644);
    float _656 = fma(_608, _574, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _666 = fma(_652, _598, _654);
    float _668 = fma(_660, _532, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _674;
    float _678 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _680 = fma(_630, _598, _656);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _682;
    float _686 = fma(_648, _582, _650);
    float _688 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _690 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _692 = fma(_668, _582, _666);
    float _694 = fma(_684, _556, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _696 = fma(_678, _582, _680);
    float _698 = fma(_688, _580, _686);
    float _700 = fma(_690, _580, _692);
    float _702 = fma(_694, _580, _696);
    float _704 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _708 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].z, _702);
    bool _710 = !_514;
    float _712 = _688;
    float _730;
    if (!_710)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _110 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = in.m_41.x;
    float _744 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = in.m_41.y;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _750 = _748 != 0;
    float _752 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_39.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _768 = _766 != 0;
    float _770 = in.m_39.x;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    float _776 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_43.y;
    float _780 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _752);
    float _782 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _784 = in.m_39.y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _790 = in.m_43.z;
    int _792 = as_type<int>(_776);
    float _794 = _742;
    if (_750)
    {
        float _796 = -_742;
        float _798 = _796 + 1.0;
        _792 = as_type<int>(_798);
    }
    int _800 = _792;
    if (!_750)
    {
        _712 = _742;
    }
    float _802 = _712;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = in.m_43.w;
    float _808 = -_746;
    float _810 = _808 + 1.0;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = 1.0 / _788;
    float _816 = in.m_43.x;
    bool _818 = _758 > 0.5;
    float _820 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    float _822 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _824 = false;
    float _826 = _802;
    float _828 = _746;
    if (_750)
    {
        bool _830 = _770 > 0.5;
        _824 = _830;
    }
    bool _832 = _824;
    float _834 = _820 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _836 = _818 ? _810 : _746;
    out.m_45.y = _778;
    float _838 = _836;
    if (_750)
    {
        float _840 = _832 ? as_type<float>(_800) : _742;
        _826 = _840;
    }
    float _842 = _826;
    float _844 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = in.m_39.z;
    float _860 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -_812;
    float _864 = fma(_844, 2.0, _862);
    float _866 = fma(_860, -2.0, _804);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_45.z = _790;
    float _872 = _784 * 2.0;
    float _874 = 1.0 / _870;
    out.m_45.w = _806;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _880 = -_110;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    out.m_45.x = _816;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _892 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _896 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _898 = log2(_896);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = 1.0 / _878;
    float _916 = _762 ? _836 : _746;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    bool _922 = _784 > 0.5;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _928 = _922;
    float _930 = _920;
    float _932 = _926;
    if (!_774)
    {
        _838 = _784;
    }
    float _934 = _838;
    float _936 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _938 = _934;
    if (_768)
    {
        float _940 = _922 ? _810 : _746;
        _828 = _940;
    }
    float _942 = _828;
    float _944 = 1.0 / _912;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _954 = _898 * _110;
    if (_756)
    {
        bool _956 = _858 > 0.5;
        _928 = _956;
    }
    bool _958 = _928;
    float _960 = _948 * _814;
    float _962 = _858 * 2.0;
    float _964 = _952 * _874;
    float _966 = 1.0 / _886;
    float _968 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _892 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_774)
    {
        _938 = _770;
    }
    float _974 = _938;
    float _976 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_47.x = _902;
    out.m_47.y = _904;
    out.m_47.z = _968;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _982 = floor(_962);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _984;
    if (_756)
    {
        float _988 = -_742;
        float _990 = _988 + 1.0;
        _972 = as_type<int>(_990);
    }
    int _992 = _972;
    float _994 = _980 * _914;
    float _996 = _986 * _944;
    bool _998 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1000 = isnan(_740);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = exp2(_954);
    if (_756)
    {
        float _1012 = _958 ? as_type<float>(_992) : _742;
        _794 = _1012;
    }
    float _1014 = _794;
    float _1016 = _784 + _858;
    float _1018 = _770 * 2.0;
    float _1020 = _920 * _966;
    float _1022 = _1016 + (-1.0);
    bool _1024 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = 1.0 / _908;
    bool _1036 = _982 > 0.0;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _770 + _784;
    bool _1042 = _982 >= 0.0;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_1008;
    float _1054 = _1052 + 1.0;
    bool _1056 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1058 = isnan(_740);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _1040 + (-1.0);
    float _1070 = floor(_872);
    if (!_774)
    {
        _930 = _858;
    }
    float _1072 = _930;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = -_1010;
    float _1078 = _1076 + 1.0;
    bool _1080 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1082 = isnan(_740);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1072;
    if (_774)
    {
        _1092 = _784;
    }
    float _1094 = _1092;
    float _1096 = floor(_1018);
    float _1098 = _1032 ? _1078 : 0.0;
    float _1100 = _926 * _1034;
    if (!_774)
    {
        _932 = _858;
    }
    float _1102 = _932;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _1102;
    if (_774)
    {
        _1108 = _784;
    }
    float _1110 = _1108;
    bool _1112 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_740);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1126 = _1050 ? 0 : 1;
    bool _1128 = _1070 > 0.0;
    int _1130 = ~_1126;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1134;
    if (!_1036)
    {
        int _1138 = ~_1126;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1146 = _740 + _1144;
    bool _1148 = _1070 >= 0.0;
    bool _1150 = isnan(_1070);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = -_1066;
    float _1160 = _1158 + 1.0;
    bool _1162 = _1096 > 0.0;
    float _1164 = fma(_960, _1146, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1166 = _1096 >= 0.0;
    bool _1168 = isnan(_1096);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1178 = _740 + _1176;
    float _1180 = _1090 * _1160;
    bool _1182 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1184 = isnan(_740);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1196 = _740 + _1194;
    float _1198 = fma(_1020, _1178, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _740 + _1200;
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = -_1192;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_964, _1196, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1212 = fma(_1100, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1214 = _1008 * _1106;
    float _1216 = _1192 * _1054;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1220 = _740 + _1218;
    bool _1222 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1224 = isnan(_740);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = _1122 * _1208;
    float _1236 = -_1122;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_996, _1220, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1242 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1244 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1246 = isnan(_740);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1232 * _1238;
    float _1258 = -_1232;
    float _1260 = _1258 + 1.0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1264 = fma(_916, _1242, -0.5);
    float _1266 = _1254 * _1260;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1270 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1262);
    float _1272 = _1198 * _1266;
    float _1274 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1268);
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1282 = _740 + _1280;
    float _1284 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1288 = _974 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = fma(_1276, _942, -0.5);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1294 = fma(_1284, -2.0, _1278);
    float _1296 = fma(_994, _1282, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1300 = -_1286;
    float _1302 = fma(_1288, 2.0, _1300);
    float _1304 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1292);
    int _1306 = _1174 ? 0 : 1;
    float _1308 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    bool _1310 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1312 = isnan(1.0);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1318 = _1314 || _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1322 = 1.0 + _1320;
    float _1324 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _866);
    float _1328 = 1.0 / _1322;
    float _1330 = -_1254;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1270);
    float _1336 = -_1326;
    float _1338 = fma(_1324, _1290, _1336);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1342 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1272);
    float _1344 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1346 = ~_1306;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    float _1352 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1340);
    float _1354 = fma(_1212, _1256, _1342);
    float _1356 = -_1308;
    float _1358 = fma(_1334, _1264, _1356);
    float _1360 = fma(_1344, _842, -0.5);
    float _1362 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1352);
    float _1364 = fma(_1164, _1234, _1354);
    float _1366 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1274);
    float _1368 = -_110;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1302);
    int _1372 = _1350;
    float _1374 = _1338;
    if (_1318)
    {
        float _1376 = _1098 * _1328;
        _112 = _1376;
    }
    float _1378 = _112;
    float _1380 = fma(_1362, _1360, _882);
    float _1382 = fma(_1210, _1216, _1364);
    bool _1384 = !_852;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _834 + _1388;
    int _1392 = as_type<int>(_1380);
    if (!_1162)
    {
        int _1394 = ~_1306;
        int _1396 = _1394 + 1;
        _1372 = _1396;
    }
    int _1398 = _1372;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _936 + _1400;
    int _1404 = abs(_1386);
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1408 = !_848;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _970 + _1414;
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1406);
    int _1420 = abs(_1410);
    float _1422 = fma(_1240, _1214, _1382);
    float _1424 = float(_1398);
    float _1426 = _1390 * _1390;
    float _1428 = float(_1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1418);
    float _1432 = float(_1142);
    float _1434 = fma(_1402, _1402, _1426);
    float _1436 = fma(_1296, _1180, _1422);
    float _1438 = float(_1404);
    float _1440 = _1428 * _1432;
    bool _1442 = _1430 >= 0.0;
    float _1444 = fma(_1416, _1416, _1434);
    float _1446 = in.m_49.x;
    float _1448 = in.m_49.y;
    float _1450 = in.m_49.z;
    float _1452 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1454 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = _1338 + 0.5;
    float _1458 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1436);
    float _1460 = rsqrt(_1444);
    float _1462 = fma(_1452, _1014, -0.5);
    float _1464 = _1440 * (-2.0);
    float _1466 = _1358 + 0.5;
    float _1468 = fma(_1366, _1462, _1370);
    if (_1442)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1470 = _1374;
    float _1472 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1380 + 0.5;
    float _1478 = _1468 + 0.5;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1442)
    {
        float _1482 = _1470 * 5.0;
        _1392 = as_type<int>(_1482);
    }
    int _1484 = _1392;
    float _1486 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = fma(_1074, _1464, _1074);
    out.m_51.x = _1476;
    out.m_51.y = _1456;
    out.m_51.z = _1478;
    out.m_51.w = _1466;
    float _1490 = _1390 * _1460;
    float _1492 = _1402 * _1460;
    float _1494 = _1438 * _1424;
    if (_1442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4476 = as_type<float>(_1484);
        out.gl_Position.z = _4476;
    }
    float _1496 = fma(_1464, _1446, _1446);
    bool _1498 = !_856;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -_1490;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    out.m_53.x = _1474;
    out.m_53.y = _1454;
    out.m_53.z = _1480;
    out.m_53.w = _1486;
    float _1506 = -_1492;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    if (_1442)
    {
        out.m_33.x = 0.0;
    }
    if (_1442)
    {
        return out;
    }
    float _1510 = -_1490;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _1514 = _1416 * _1460;
    float _1516 = -_1492;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1520 = _770 + (-0.5);
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1512 + _1522;
    float _1526 = -_1514;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1518 + _1530;
    float _1534 = _1504 * _1504;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    int _1544 = _1156 ? 0 : 1;
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = _1494 * (-2.0);
    float _1550 = _784 + (-0.5);
    int _1552 = ~_1544;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    float _1560 = fma(_1548, _1448, _1448);
    int _1562 = _1556;
    if (!_1128)
    {
        int _1564 = ~_1544;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = fma(_1038, _1548, _1038);
    float _1572 = fma(_1508, _1508, _1534);
    bool _1574 = _1558 >= 0.0;
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1560);
    int _1578 = abs(_1500);
    float _1580 = -_1514;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1584 = fma(_1488, _1378, _1542);
    float _1586 = fma(_1570, _1378, _1576);
    float _1588 = _770 + _858;
    float _1590 = float(_1578);
    float _1592 = fma(_1582, _1582, _1572);
    float _1594 = float(_1568);
    float _1596 = _1584 * 0.15915493667125701904296875;
    float _1598 = _1586 * 0.15915493667125701904296875;
    float _1600 = _1588 + (-1.0);
    float _1602 = as_type<float>(_1578);
    if (_1574)
    {
        _1602 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1604 = _1602;
    float _1606 = _1590 * _1594;
    float _1608 = _1596 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    int _1612 = as_type<int>(_1604);
    if (_1574)
    {
        out.m_33.x = 0.0;
    }
    if (_1574)
    {
        float _1614 = _1604 * 5.0;
        _1612 = as_type<int>(_1614);
    }
    int _1616 = _1612;
    float _1618 = _1606 * (-2.0);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1622 = _1596 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1598 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = sqrt(_1592);
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4714 = as_type<float>(_1616);
        out.gl_Position.z = _4714;
    }
    if (_1574)
    {
        return out;
    }
    float _1632 = -_834;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = fma(_1620, _1618, _1620);
    float _1638 = fma(_1618, _1450, _1450);
    float _1640 = -_936;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1644 = _1634 * _1634;
    float _1646 = _858 + (-0.5);
    float _1648 = -_970;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1598 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1642, _1642, _1644);
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1638);
    float _1660 = _1460 * _1630;
    float _1662 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1664 = fma(_1650, _1650, _1656);
    float _1666 = fma(_1636, _1378, _1658);
    float _1668 = _1610 * _1628;
    float _1670 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1672 = _1666 * 0.15915493667125701904296875;
    float _1674 = rsqrt(_1664);
    float _1676 = in.m_55.x;
    float _1678 = in.m_55.y;
    float _1680 = in.m_55.z;
    float _1682 = _1660 * _1670;
    float _1684 = _1660 * _1662;
    float _1686 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1688 = _1624 * _1654;
    float _1690 = _1610 * _1654;
    float _1692 = _1672 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1660 * _1686;
    bool _1698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1700 = isnan(0.5);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1706 = _1702 || _1704;
    bool _1708 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1710 = isnan(0.5);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1716 = _1712 || _1714;
    float _1718 = _1642 * _1674;
    float _1720 = _1650 * _1674;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1724 = _1718 * _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1720 * _1726;
    float _1730 = fma(_1694, _1688, _1668);
    float _1732 = fma(_1694, _1668, _1688);
    float _1734 = _1634 * _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1738 = -_1724;
    float _1740 = fma(_1720, _1736, _1738);
    float _1742 = _1672 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1728;
    float _1752 = fma(_1734, _1748, _1750);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1756 = _1734 * _1754;
    float _1758 = _1740 * _1740;
    float _1760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1762 = _1746 * _1684;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = -_1756;
    float _1768 = fma(_1718, _1764, _1766);
    float _1770 = fma(_1752, _1752, _1758);
    float _1772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1774 = _1624 * _1628;
    float _1776 = _1760 * _1696;
    float _1778 = fma(_1768, _1768, _1770);
    float _1780 = _1772 * _1682;
    float _1782 = -_1774;
    float _1784 = fma(_1694, _1690, _1782);
    float _1786 = -_1690;
    float _1788 = fma(_1694, _1774, _1786);
    float _1790 = _1654 * _1744;
    float _1792 = -_1780;
    float _1794 = _1694 * _1792;
    float _1796 = rsqrt(_1778);
    float _1798 = _1744 * _1780;
    float _1800 = _1628 * _1744;
    float _1802 = fma(_1790, _1762, _1794);
    float _1804 = _1624 * _1798;
    float _1806 = _1610 * _1798;
    float _1808 = fma(_1800, _1776, _1802);
    float _1810 = fma(_1730, _1762, _1804);
    float _1812 = fma(_1784, _1762, _1806);
    float _1814 = fma(_1788, _1776, _1810);
    float _1816 = fma(_1732, _1776, _1812);
    float _1818 = _1752 * _1796;
    float _1820 = _1740 * _1796;
    float _1822 = _1768 * _1796;
    float _1824 = _1734 * _1818;
    float _1826 = _1720 * _1820;
    float _1828 = -_1824;
    float _1830 = fma(_1718, _1820, _1828);
    float _1832 = -_1826;
    float _1834 = fma(_1734, _1822, _1832);
    float _1836 = _1830 * _1814;
    float _1838 = _1834 * _1814;
    float _1840 = fma(_1822, _1808, _1836);
    float _1842 = fma(_1818, _1808, _1838);
    float _1844 = fma(_1720, _1816, _1840);
    float _1846 = fma(_1718, _1816, _1842);
    float _1848 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1850 = _1718 * _1822;
    float _1852 = _970 + _1844;
    float _1854 = _936 + _1846;
    float _1856 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1848);
    float _1858 = -_1850;
    float _1860 = fma(_1720, _1818, _1858);
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1856);
    float _1872 = _1860 * _1814;
    float _1874 = _1864 * _1864;
    float _1876 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1878 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1880 = fma(_1820, _1808, _1872);
    float _1882 = fma(_1868, _1868, _1874);
    float _1884 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1876);
    float _1886 = 1.0 / _1878;
    float _1888 = fma(_1734, _1816, _1880);
    float _1890 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1884);
    float _1892 = _834 + _1888;
    float _1894 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1896 = sqrt(_1882);
    float _1898 = _1894 + _1878;
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1870;
    float _1904 = _1860;
    float _1906 = _1854;
    if (!_1900)
    {
        _1902 = _1854;
    }
    float _1908 = _1902;
    float _1910 = _1908;
    if (!_1900)
    {
        _1904 = _1852;
    }
    float _1912 = _1904;
    float _1914 = _1912;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1916 = _1906;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = rsqrt(_1882);
        float _1930 = _1926 * _1922;
        float _1932 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = _1930 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = fma(_1938, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1946 = _1928 * _1944;
        float _1948 = _1942 + (-1.0);
        float _1950 = fma(_1868, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1952 = fma(_1864, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = fma(_1892, _1942, _1954);
        _1910 = _1950;
        _1920 = _1956;
        _1914 = _1952;
    }
    float _1958 = _1910;
    float _1960 = _1920;
    float _1962 = _1914;
    float _1964 = -_1492;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1490;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = -_1514;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1976 = _1898 * _1886;
    float _1978 = _1976 * 0.5;
    float _1980 = _1970;
    float _1982 = _1966;
    float _1984 = _1974;
    if (!_1706)
    {
        float _1986 = _1524 * _1524;
        float _1988 = 1.0 / _1660;
        float _1990 = -_936;
        float _1992 = _1990 + _1958;
        float _1994 = fma(_1532, _1532, _1986);
        float _1996 = fma(_1540, _1540, _1994);
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = sqrt(_1996);
        float _2002 = precise::min(_2000, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2004 = _2002 * _1998;
        float _2006 = _2004 * _1988;
        float _2008 = -_834;
        float _2010 = _2008 + _1960;
        float _2012 = -_970;
        float _2014 = _2012 + _1962;
        float _2016 = fma(_1992, _2006, _1518);
        float _2018 = fma(_2010, _2006, _1512);
        float _2020 = fma(_2014, _2006, _1528);
        _1980 = _2018;
        _1982 = _2016;
        _1984 = _2020;
    }
    float _2022 = _1980;
    float _2024 = _1982;
    float _2026 = _1984;
    float _2028 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2028);
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2030);
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2032);
    float _2042 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2034);
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2036);
    float _2046 = _2036;
    if (_1716)
    {
        _2046 = 1.0;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (!_1716)
    {
        float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2054 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2052);
        float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2060 = 1.0 / _2054;
        float _2062 = 1.0 / _2058;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2068 = fma(_2060, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        float _2074 = -_2072;
        float _2076 = _2074 + 1.0;
        _2050 = _2076;
    }
    float _2078 = _2050;
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2082 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2040);
    float _2086 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2098 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2090);
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2108);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    bool _2120 = _2078 > 0.0;
    bool _2122 = isnan(_2078);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(0.0);
    bool _2128 = _2124 || _2126;
    float _2130 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2132 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2114);
    float _2136 = _2116 + _2118;
    float _2138 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2142 = _2136 * 0.5;
    out.m_33.x = _2140;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2116;
    out.gl_Position.w = _2118;
    out.m_57.z = _2142;
    out.m_57.w = _2118;
    if (_2128)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _388 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_92);
        out.gl_Position.z = _2201;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_130);
        out.gl_Position.z = _2271;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = _314 * _318;
    float _330 = -_314;
    float _332 = _330 + 1.0;
    float _334 = _286 * _324;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    float _340 = fma(_322, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_338, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_344, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _340 * _328;
    float _352 = _348 * _328;
    float _354 = _346 * _328;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_37.x;
    float _400 = in.m_37.y;
    float _402 = in.m_37.z;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = 1.0 / _406;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _422;
    float _426 = 1.0 / _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _396 + _428;
    bool _432 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_396);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _364 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _396 + _446;
    float _450 = 1.0 / _414;
    float _452 = _366 * _402;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = _396 + _454;
    float _458 = _430 * _420;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _462 = _396 + _460;
    bool _464 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _466 = isnan(_396);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _362 * _398;
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _418;
    float _492 = _448 * _426;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = _396 + _494;
    bool _498 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _500 = isnan(_396);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    bool _514 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _516 = 1.0 / _424;
    float _518 = _456 * _450;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _520;
    float _524 = -_474;
    float _526 = _524 + 1.0;
    float _528 = fma(_512, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = fma(_522, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = _462 * _490;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    bool _538 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _540 = isnan(_396);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_536, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _552 = -_488;
    float _554 = _552 + 1.0;
    float _556 = _496 * _516;
    float _558 = -_508;
    float _560 = _558 + 1.0;
    bool _562 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _564 = isnan(_396);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = _442 * _554;
    float _576 = -_442;
    float _578 = _576 + 1.0;
    float _580 = _474 * _560;
    float _582 = _548 * _526;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _592 = _572 * _578;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _488 * _586;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _608 = fma(_590, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _610 = _530 * _592;
    float _612 = fma(_602, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _614 = fma(_606, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _616 = _528 * _592;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _618;
    float _622 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].x, _610);
    float _624 = _550 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _626;
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _636 = fma(_612, _574, _622);
    float _638 = fma(_628, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _640;
    float _644 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].y, _624);
    float _646 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _648 = fma(_634, _532, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _650 = fma(_638, _598, _636);
    float _652 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _654 = fma(_614, _574, _644);
    float _656 = fma(_608, _574, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _666 = fma(_652, _598, _654);
    float _668 = fma(_660, _532, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _674;
    float _678 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _680 = fma(_630, _598, _656);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _682;
    float _686 = fma(_648, _582, _650);
    float _688 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _690 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _692 = fma(_668, _582, _666);
    float _694 = fma(_684, _556, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _696 = fma(_678, _582, _680);
    float _698 = fma(_688, _580, _686);
    float _700 = fma(_690, _580, _692);
    float _702 = fma(_694, _580, _696);
    float _704 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _708 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[112].z, _702);
    bool _710 = !_514;
    float _712 = _688;
    float _730;
    if (!_710)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _110 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = in.m_41.x;
    float _744 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = in.m_41.y;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _750 = _748 != 0;
    float _752 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_39.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _768 = _766 != 0;
    float _770 = in.m_39.x;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    float _776 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_43.y;
    float _780 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _752);
    float _782 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _784 = in.m_39.y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _790 = in.m_43.z;
    int _792 = as_type<int>(_776);
    float _794 = _742;
    if (_750)
    {
        float _796 = -_742;
        float _798 = _796 + 1.0;
        _792 = as_type<int>(_798);
    }
    int _800 = _792;
    if (!_750)
    {
        _712 = _742;
    }
    float _802 = _712;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = in.m_43.w;
    float _808 = -_746;
    float _810 = _808 + 1.0;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = 1.0 / _788;
    float _816 = in.m_43.x;
    bool _818 = _758 > 0.5;
    float _820 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    float _822 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _824 = false;
    float _826 = _802;
    float _828 = _746;
    if (_750)
    {
        bool _830 = _770 > 0.5;
        _824 = _830;
    }
    bool _832 = _824;
    float _834 = _820 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _836 = _818 ? _810 : _746;
    out.m_45.y = _778;
    float _838 = _836;
    if (_750)
    {
        float _840 = _832 ? as_type<float>(_800) : _742;
        _826 = _840;
    }
    float _842 = _826;
    float _844 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = in.m_39.z;
    float _860 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -_812;
    float _864 = fma(_844, 2.0, _862);
    float _866 = fma(_860, -2.0, _804);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_45.z = _790;
    float _872 = _784 * 2.0;
    float _874 = 1.0 / _870;
    out.m_45.w = _806;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _880 = -_110;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    out.m_45.x = _816;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _892 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _896 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _898 = log2(_896);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _902 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = 1.0 / _878;
    float _916 = _762 ? _836 : _746;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    bool _922 = _784 > 0.5;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _928 = _922;
    float _930 = _920;
    float _932 = _926;
    if (!_774)
    {
        _838 = _784;
    }
    float _934 = _838;
    float _936 = _888 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _938 = _934;
    if (_768)
    {
        float _940 = _922 ? _810 : _746;
        _828 = _940;
    }
    float _942 = _828;
    float _944 = 1.0 / _912;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _954 = _898 * _110;
    if (_756)
    {
        bool _956 = _858 > 0.5;
        _928 = _956;
    }
    bool _958 = _928;
    float _960 = _948 * _814;
    float _962 = _858 * 2.0;
    float _964 = _952 * _874;
    float _966 = 1.0 / _886;
    float _968 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _892 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_774)
    {
        _938 = _770;
    }
    float _974 = _938;
    float _976 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_47.x = _902;
    out.m_47.y = _904;
    out.m_47.z = _968;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _982 = floor(_962);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _984;
    if (_756)
    {
        float _988 = -_742;
        float _990 = _988 + 1.0;
        _972 = as_type<int>(_990);
    }
    int _992 = _972;
    float _994 = _980 * _914;
    float _996 = _986 * _944;
    bool _998 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1000 = isnan(_740);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = exp2(_954);
    if (_756)
    {
        float _1012 = _958 ? as_type<float>(_992) : _742;
        _794 = _1012;
    }
    float _1014 = _794;
    float _1016 = _784 + _858;
    float _1018 = _770 * 2.0;
    float _1020 = _920 * _966;
    float _1022 = _1016 + (-1.0);
    bool _1024 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = 1.0 / _908;
    bool _1036 = _982 > 0.0;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1040 = _770 + _784;
    bool _1042 = _982 >= 0.0;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = -_1008;
    float _1054 = _1052 + 1.0;
    bool _1056 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1058 = isnan(_740);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = _1040 + (-1.0);
    float _1070 = floor(_872);
    if (!_774)
    {
        _930 = _858;
    }
    float _1072 = _930;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = -_1010;
    float _1078 = _1076 + 1.0;
    bool _1080 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1082 = isnan(_740);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1072;
    if (_774)
    {
        _1092 = _784;
    }
    float _1094 = _1092;
    float _1096 = floor(_1018);
    float _1098 = _1032 ? _1078 : 0.0;
    float _1100 = _926 * _1034;
    if (!_774)
    {
        _932 = _858;
    }
    float _1102 = _932;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _1102;
    if (_774)
    {
        _1108 = _784;
    }
    float _1110 = _1108;
    bool _1112 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_740);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1126 = _1050 ? 0 : 1;
    bool _1128 = _1070 > 0.0;
    int _1130 = ~_1126;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1134;
    if (!_1036)
    {
        int _1138 = ~_1126;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1146 = _740 + _1144;
    bool _1148 = _1070 >= 0.0;
    bool _1150 = isnan(_1070);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = -_1066;
    float _1160 = _1158 + 1.0;
    bool _1162 = _1096 > 0.0;
    float _1164 = fma(_960, _1146, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1166 = _1096 >= 0.0;
    bool _1168 = isnan(_1096);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1178 = _740 + _1176;
    float _1180 = _1090 * _1160;
    bool _1182 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1184 = isnan(_740);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1196 = _740 + _1194;
    float _1198 = fma(_1020, _1178, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _740 + _1200;
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = -_1192;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_964, _1196, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1212 = fma(_1100, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1214 = _1008 * _1106;
    float _1216 = _1192 * _1054;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1220 = _740 + _1218;
    bool _1222 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1224 = isnan(_740);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = _1122 * _1208;
    float _1236 = -_1122;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_996, _1220, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1242 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1244 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1246 = isnan(_740);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1232 * _1238;
    float _1258 = -_1232;
    float _1260 = _1258 + 1.0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1264 = fma(_916, _1242, -0.5);
    float _1266 = _1254 * _1260;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1270 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1262);
    float _1272 = _1198 * _1266;
    float _1274 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1268);
    float _1276 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1282 = _740 + _1280;
    float _1284 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1288 = _974 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = fma(_1276, _942, -0.5);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1294 = fma(_1284, -2.0, _1278);
    float _1296 = fma(_994, _1282, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1300 = -_1286;
    float _1302 = fma(_1288, 2.0, _1300);
    float _1304 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1292);
    int _1306 = _1174 ? 0 : 1;
    float _1308 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    bool _1310 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1312 = isnan(1.0);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1318 = _1314 || _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1322 = 1.0 + _1320;
    float _1324 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _866);
    float _1328 = 1.0 / _1322;
    float _1330 = -_1254;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1270);
    float _1336 = -_1326;
    float _1338 = fma(_1324, _1290, _1336);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1342 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1272);
    float _1344 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1346 = ~_1306;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    float _1352 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1340);
    float _1354 = fma(_1212, _1256, _1342);
    float _1356 = -_1308;
    float _1358 = fma(_1334, _1264, _1356);
    float _1360 = fma(_1344, _842, -0.5);
    float _1362 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1352);
    float _1364 = fma(_1164, _1234, _1354);
    float _1366 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1274);
    float _1368 = -_110;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1302);
    int _1372 = _1350;
    float _1374 = _1338;
    if (_1318)
    {
        float _1376 = _1098 * _1328;
        _112 = _1376;
    }
    float _1378 = _112;
    float _1380 = fma(_1362, _1360, _882);
    float _1382 = fma(_1210, _1216, _1364);
    bool _1384 = !_852;
    int _1386 = _1384 ? 0 : 1;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _834 + _1388;
    int _1392 = as_type<int>(_1380);
    if (!_1162)
    {
        int _1394 = ~_1306;
        int _1396 = _1394 + 1;
        _1372 = _1396;
    }
    int _1398 = _1372;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _936 + _1400;
    int _1404 = abs(_1386);
    float _1406 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1408 = !_848;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _970 + _1414;
    float _1418 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1406);
    int _1420 = abs(_1410);
    float _1422 = fma(_1240, _1214, _1382);
    float _1424 = float(_1398);
    float _1426 = _1390 * _1390;
    float _1428 = float(_1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1418);
    float _1432 = float(_1142);
    float _1434 = fma(_1402, _1402, _1426);
    float _1436 = fma(_1296, _1180, _1422);
    float _1438 = float(_1404);
    float _1440 = _1428 * _1432;
    bool _1442 = _1430 >= 0.0;
    float _1444 = fma(_1416, _1416, _1434);
    float _1446 = in.m_49.x;
    float _1448 = in.m_49.y;
    float _1450 = in.m_49.z;
    float _1452 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1454 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = _1338 + 0.5;
    float _1458 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1436);
    float _1460 = rsqrt(_1444);
    float _1462 = fma(_1452, _1014, -0.5);
    float _1464 = _1440 * (-2.0);
    float _1466 = _1358 + 0.5;
    float _1468 = fma(_1366, _1462, _1370);
    if (_1442)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1470 = _1374;
    float _1472 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1380 + 0.5;
    float _1478 = _1468 + 0.5;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1442)
    {
        float _1482 = _1470 * 5.0;
        _1392 = as_type<int>(_1482);
    }
    int _1484 = _1392;
    float _1486 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = fma(_1074, _1464, _1074);
    out.m_51.x = _1476;
    out.m_51.y = _1456;
    out.m_51.z = _1478;
    out.m_51.w = _1466;
    float _1490 = _1390 * _1460;
    float _1492 = _1402 * _1460;
    float _1494 = _1438 * _1424;
    if (_1442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4476 = as_type<float>(_1484);
        out.gl_Position.z = _4476;
    }
    float _1496 = fma(_1464, _1446, _1446);
    bool _1498 = !_856;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -_1490;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    out.m_53.x = _1474;
    out.m_53.y = _1454;
    out.m_53.z = _1480;
    out.m_53.w = _1486;
    float _1506 = -_1492;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    if (_1442)
    {
        out.m_33.x = 0.0;
    }
    if (_1442)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1510 = -_1490;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _1514 = _1416 * _1460;
    float _1516 = -_1492;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1520 = _770 + (-0.5);
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1512 + _1522;
    float _1526 = -_1514;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1518 + _1530;
    float _1534 = _1504 * _1504;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    int _1544 = _1156 ? 0 : 1;
    float _1546 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = _1494 * (-2.0);
    float _1550 = _784 + (-0.5);
    int _1552 = ~_1544;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    float _1560 = fma(_1548, _1448, _1448);
    int _1562 = _1556;
    if (!_1128)
    {
        int _1564 = ~_1544;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    float _1570 = fma(_1038, _1548, _1038);
    float _1572 = fma(_1508, _1508, _1534);
    bool _1574 = _1558 >= 0.0;
    float _1576 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1560);
    int _1578 = abs(_1500);
    float _1580 = -_1514;
    float _1582 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1584 = fma(_1488, _1378, _1542);
    float _1586 = fma(_1570, _1378, _1576);
    float _1588 = _770 + _858;
    float _1590 = float(_1578);
    float _1592 = fma(_1582, _1582, _1572);
    float _1594 = float(_1568);
    float _1596 = _1584 * 0.15915493667125701904296875;
    float _1598 = _1586 * 0.15915493667125701904296875;
    float _1600 = _1588 + (-1.0);
    float _1602 = as_type<float>(_1578);
    if (_1574)
    {
        _1602 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1604 = _1602;
    float _1606 = _1590 * _1594;
    float _1608 = _1596 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    int _1612 = as_type<int>(_1604);
    if (_1574)
    {
        out.m_33.x = 0.0;
    }
    if (_1574)
    {
        float _1614 = _1604 * 5.0;
        _1612 = as_type<int>(_1614);
    }
    int _1616 = _1612;
    float _1618 = _1606 * (-2.0);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1622 = _1596 * 6.283185482025146484375;
    float _1624 = cos(_1622);
    float _1626 = _1598 * 6.283185482025146484375;
    float _1628 = sin(_1626);
    float _1630 = sqrt(_1592);
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4714 = as_type<float>(_1616);
        out.gl_Position.z = _4714;
    }
    if (_1574)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1632 = -_834;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = fma(_1620, _1618, _1620);
    float _1638 = fma(_1618, _1450, _1450);
    float _1640 = -_936;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1644 = _1634 * _1634;
    float _1646 = _858 + (-0.5);
    float _1648 = -_970;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1598 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = fma(_1642, _1642, _1644);
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1638);
    float _1660 = _1460 * _1630;
    float _1662 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1664 = fma(_1650, _1650, _1656);
    float _1666 = fma(_1636, _1378, _1658);
    float _1668 = _1610 * _1628;
    float _1670 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1672 = _1666 * 0.15915493667125701904296875;
    float _1674 = rsqrt(_1664);
    float _1676 = in.m_55.x;
    float _1678 = in.m_55.y;
    float _1680 = in.m_55.z;
    float _1682 = _1660 * _1670;
    float _1684 = _1660 * _1662;
    float _1686 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1688 = _1624 * _1654;
    float _1690 = _1610 * _1654;
    float _1692 = _1672 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1660 * _1686;
    bool _1698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1700 = isnan(0.5);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1706 = _1702 || _1704;
    bool _1708 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1710 = isnan(0.5);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1716 = _1712 || _1714;
    float _1718 = _1642 * _1674;
    float _1720 = _1650 * _1674;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1724 = _1718 * _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1720 * _1726;
    float _1730 = fma(_1694, _1688, _1668);
    float _1732 = fma(_1694, _1668, _1688);
    float _1734 = _1634 * _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1738 = -_1724;
    float _1740 = fma(_1720, _1736, _1738);
    float _1742 = _1672 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1676);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1728;
    float _1752 = fma(_1734, _1748, _1750);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1756 = _1734 * _1754;
    float _1758 = _1740 * _1740;
    float _1760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1680);
    float _1762 = _1746 * _1684;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = -_1756;
    float _1768 = fma(_1718, _1764, _1766);
    float _1770 = fma(_1752, _1752, _1758);
    float _1772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1678);
    float _1774 = _1624 * _1628;
    float _1776 = _1760 * _1696;
    float _1778 = fma(_1768, _1768, _1770);
    float _1780 = _1772 * _1682;
    float _1782 = -_1774;
    float _1784 = fma(_1694, _1690, _1782);
    float _1786 = -_1690;
    float _1788 = fma(_1694, _1774, _1786);
    float _1790 = _1654 * _1744;
    float _1792 = -_1780;
    float _1794 = _1694 * _1792;
    float _1796 = rsqrt(_1778);
    float _1798 = _1744 * _1780;
    float _1800 = _1628 * _1744;
    float _1802 = fma(_1790, _1762, _1794);
    float _1804 = _1624 * _1798;
    float _1806 = _1610 * _1798;
    float _1808 = fma(_1800, _1776, _1802);
    float _1810 = fma(_1730, _1762, _1804);
    float _1812 = fma(_1784, _1762, _1806);
    float _1814 = fma(_1788, _1776, _1810);
    float _1816 = fma(_1732, _1776, _1812);
    float _1818 = _1752 * _1796;
    float _1820 = _1740 * _1796;
    float _1822 = _1768 * _1796;
    float _1824 = _1734 * _1818;
    float _1826 = _1720 * _1820;
    float _1828 = -_1824;
    float _1830 = fma(_1718, _1820, _1828);
    float _1832 = -_1826;
    float _1834 = fma(_1734, _1822, _1832);
    float _1836 = _1830 * _1814;
    float _1838 = _1834 * _1814;
    float _1840 = fma(_1822, _1808, _1836);
    float _1842 = fma(_1818, _1808, _1838);
    float _1844 = fma(_1720, _1816, _1840);
    float _1846 = fma(_1718, _1816, _1842);
    float _1848 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1850 = _1718 * _1822;
    float _1852 = _970 + _1844;
    float _1854 = _936 + _1846;
    float _1856 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1848);
    float _1858 = -_1850;
    float _1860 = fma(_1720, _1818, _1858);
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1856);
    float _1872 = _1860 * _1814;
    float _1874 = _1864 * _1864;
    float _1876 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1878 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1880 = fma(_1820, _1808, _1872);
    float _1882 = fma(_1868, _1868, _1874);
    float _1884 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1876);
    float _1886 = 1.0 / _1878;
    float _1888 = fma(_1734, _1816, _1880);
    float _1890 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1884);
    float _1892 = _834 + _1888;
    float _1894 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1896 = sqrt(_1882);
    float _1898 = _1894 + _1878;
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1870;
    float _1904 = _1860;
    float _1906 = _1854;
    if (!_1900)
    {
        _1902 = _1854;
    }
    float _1908 = _1902;
    float _1910 = _1908;
    if (!_1900)
    {
        _1904 = _1852;
    }
    float _1912 = _1904;
    float _1914 = _1912;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1916 = _1906;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = rsqrt(_1882);
        float _1930 = _1926 * _1922;
        float _1932 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = _1930 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        float _1944 = fma(_1938, _1932, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1946 = _1928 * _1944;
        float _1948 = _1942 + (-1.0);
        float _1950 = fma(_1868, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1952 = fma(_1864, _1946, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1956 = fma(_1892, _1942, _1954);
        _1910 = _1950;
        _1920 = _1956;
        _1914 = _1952;
    }
    float _1958 = _1910;
    float _1960 = _1920;
    float _1962 = _1914;
    float _1964 = -_1492;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1490;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = -_1514;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1976 = _1898 * _1886;
    float _1978 = _1976 * 0.5;
    float _1980 = _1970;
    float _1982 = _1966;
    float _1984 = _1974;
    if (!_1706)
    {
        float _1986 = _1524 * _1524;
        float _1988 = 1.0 / _1660;
        float _1990 = -_936;
        float _1992 = _1990 + _1958;
        float _1994 = fma(_1532, _1532, _1986);
        float _1996 = fma(_1540, _1540, _1994);
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = sqrt(_1996);
        float _2002 = precise::min(_2000, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2004 = _2002 * _1998;
        float _2006 = _2004 * _1988;
        float _2008 = -_834;
        float _2010 = _2008 + _1960;
        float _2012 = -_970;
        float _2014 = _2012 + _1962;
        float _2016 = fma(_1992, _2006, _1518);
        float _2018 = fma(_2010, _2006, _1512);
        float _2020 = fma(_2014, _2006, _1528);
        _1980 = _2018;
        _1982 = _2016;
        _1984 = _2020;
    }
    float _2022 = _1980;
    float _2024 = _1982;
    float _2026 = _1984;
    float _2028 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2032 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2028);
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2030);
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2032);
    float _2042 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2034);
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2036);
    float _2046 = _2036;
    if (_1716)
    {
        _2046 = 1.0;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (!_1716)
    {
        float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2054 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2052);
        float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2060 = 1.0 / _2054;
        float _2062 = 1.0 / _2058;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2068 = fma(_2060, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        float _2074 = -_2072;
        float _2076 = _2074 + 1.0;
        _2050 = _2076;
    }
    float _2078 = _2050;
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2082 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2040);
    float _2086 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2098 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2090);
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2110 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2114 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2108);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    bool _2120 = _2078 > 0.0;
    bool _2122 = isnan(_2078);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(0.0);
    bool _2128 = _2124 || _2126;
    float _2130 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2132 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2134 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2114);
    float _2136 = _2116 + _2118;
    float _2138 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2142 = _2136 * 0.5;
    out.m_33.x = _2140;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2116;
    out.gl_Position.w = _2118;
    out.m_57.z = _2142;
    out.m_57.w = _2118;
    if (_2128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

