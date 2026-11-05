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
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_35 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1224 = false;
    bool _912 = false;
    bool _684 = false;
    bool _560 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_78)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2000 = as_type<float>(_88);
        out.gl_Position.z = _2000;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = 1.0 / _94;
    bool _112 = _98 >= _94;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = 0.0;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _98 * _110;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _124 = _120 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    out.m_33.x = _122;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2070 = as_type<float>(_126);
        out.gl_Position.z = _2070;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_35.x;
    float _130 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _122;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _280 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    bool _312 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_280);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_280);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _300;
    float _338 = -_334;
    float _340 = _338 + 1.0;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _304;
    float _346 = _284 * _310;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _280 + _348;
    float _352 = 1.0 / _308;
    float _354 = _288 * _336;
    bool _356 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_280);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_366;
    float _370 = _368 + 1.0;
    float _372 = _292 * _344;
    float _374 = _350 * _352;
    bool _376 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_280);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = _386 * _370;
    float _394 = -_386;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_390, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _322 * _396;
    float _410 = -_322;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_404, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _418 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_280);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _334 * _412;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = _428 * _340;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = fma(_438, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_442, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = _414 * _444;
    float _456 = _416 * _444;
    float _458 = _406 * _444;
    float _460 = -_428;
    float _462 = _460 + 1.0;
    float _464 = in.m_37.x;
    float _466 = in.m_37.y;
    float _468 = in.m_37.z;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _482 = fma(_434, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _486 = fma(_472, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _488 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_476, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_450, _430, _478);
    float _494 = fma(_452, _430, _480);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _508 = fma(_482, _430, _484);
    float _510 = fma(_498, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _512 = fma(_502, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _514 = fma(_488, _408, _494);
    float _516 = fma(_506, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_490, _408, _508);
    float _520 = fma(_486, _408, _492);
    float _522 = fma(_512, _392, _514);
    float _524 = fma(_516, _392, _518);
    float _526 = fma(_510, _392, _520);
    float _528 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _522);
    float _530 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _524);
    float _532 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = _528 * _466;
    float _536 = _530 * _468;
    float _538 = _532 * _464;
    bool _540 = !_342;
    float _558;
    if (!_540)
    {
        float _542 = in.m_41.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _122;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _562 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_562);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    bool _604 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _606 = isnan(_562);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = 1.0 / _570;
    float _618 = -_582;
    float _620 = _618 + 1.0;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _624 = _598 * _620;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _586;
    float _632 = _602 * _616;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _636 * _630;
    float _642 = _638 * _624;
    float _644 = -_614;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _562 + _648;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _654 = _582 * _646;
    float _656 = fma(_640, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_656, _654, _652);
    float _660 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[117].x, _658);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _662;
    bool _664 = !_622;
    float _682;
    if (!_664)
    {
        float _666 = in.m_41.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _98);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _122;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _686 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _712 = 1.0 / _702;
    bool _714 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _716 = isnan(_686);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _706;
    bool _728 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _730 = 1.0 / _710;
    bool _732 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _734 = isnan(_686);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _690 * _712;
    bool _746 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _748 = isnan(_686);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_742;
    float _760 = _758 + 1.0;
    float _762 = _694 * _726;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _764;
    float _768 = -_756;
    float _770 = _768 + 1.0;
    float _772 = _756 * _760;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _778 = fma(_766, _762, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _784 = _698 * _730;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _790;
    float _794 = _724 * _770;
    float _796 = -_724;
    float _798 = _796 + 1.0;
    float _800 = fma(_788, _762, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _802 = fma(_792, _762, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _804 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _806 = isnan(_686);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _820 = fma(_776, _784, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _822 = fma(_782, _784, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _824 = _814 * _798;
    float _826 = fma(_818, _784, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _828 = -_814;
    float _830 = _828 + 1.0;
    float _832 = _778 * _824;
    float _834 = _800 * _824;
    float _836 = _802 * _824;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _838;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _834);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _850;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _836);
    float _856 = fma(_840, _744, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _858 = fma(_826, _794, _842);
    float _860 = fma(_848, _744, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_852, _744, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _864 = fma(_820, _794, _844);
    float _866 = fma(_822, _794, _854);
    float _868 = fma(_856, _772, _858);
    float _870 = fma(_860, _772, _864);
    float _872 = fma(_862, _772, _866);
    float _874 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    float _880 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _886;
    out.m_45.y = _888;
    out.m_45.z = _890;
    bool _892 = !_728;
    float _910;
    if (!_892)
    {
        float _894 = in.m_41.x;
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _898 = _894 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[14].x, _98);
        float _902 = _900 * _896;
        float _904 = floor(_902);
        float _906 = -_904;
        float _908 = _902 + _906;
        _910 = _908;
        _912 = true;
    }
    else
    {
        _910 = _122;
    }
    _912 = false;
    float _914 = _910;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _918 = _914 + _916;
    bool _920 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _922 = isnan(_914);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _936 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _938 = isnan(_914);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _948;
    float _952 = 1.0 / _934;
    bool _954 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _968 = isnan(_914);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = 1.0 / _980;
    float _984 = -_930;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _990 = _950 * _952;
    bool _992 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _994 = isnan(_914);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_946;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = fma(_990, _918, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1014 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1016 = isnan(_914);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_1002;
    float _1028 = _1026 + 1.0;
    float _1030 = _1002 * _986;
    float _1032 = _930 * _1006;
    float _1034 = _964 * _1028;
    float _1036 = -_964;
    float _1038 = _1036 + 1.0;
    float _1040 = 1.0 / _1010;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1046 = _976 * _1038;
    float _1048 = -_976;
    float _1050 = _1048 + 1.0;
    bool _1052 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1054 = isnan(_914);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1024 * _1050;
    float _1066 = -_1024;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1076;
    float _1080 = _1062 * _1068;
    float _1082 = _1074 * _982;
    float _1084 = -_1062;
    float _1086 = _1084 + 1.0;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1012 * _1080;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1100 = _914 + _1098;
    float _1102 = 1.0 / _1090;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1092);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1110 = fma(_1082, _1100, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1112 = _1078 * _1070;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1116 = _914 + _1114;
    float _1118 = fma(_1110, _1064, _1104);
    float _1120 = 1.0 / _1096;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1126 = fma(_1112, _1116, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1134 = _914 + _1132;
    float _1136 = _1124 * _1040;
    float _1138 = fma(_1126, _1046, _1118);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1142 = _914 + _1140;
    float _1144 = 1.0 / _1108;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = _1130 * _1102;
    float _1152 = fma(_1136, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1156 = _914 + _1154;
    float _1158 = fma(_1150, _1142, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1160 = _1148 * _1120;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1162;
    bool _1166 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1168 = isnan(_914);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1152, _1034, _1138);
    float _1180 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1184 = _914 + _1182;
    float _1186 = -_1176;
    float _1188 = _1186 + 1.0;
    float _1190 = _1164 * _1144;
    float _1192 = fma(_1158, _1030, _1178);
    float _1194 = _946 * _1188;
    float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1198 = fma(_1180, _1032, _1192);
    float _1200 = fma(_1196, _1194, _1198);
    float _1202 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1200);
    out.m_47.x = _1202;
    bool _1204 = !_988;
    float _1222;
    if (!_1204)
    {
        float _1206 = in.m_41.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _98);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _122;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = in.m_41.w;
    float _1230 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1240 = _1238 != 0;
    float _1242 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = in.m_35.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    float _1254 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1230);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = in.m_41.x;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = in.m_41.y;
    float _1268 = -_132;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1276 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1278 = 1.0 / _1264;
    float _1280 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1284 = _1226 + _1282;
    float _1286 = in.m_35.z;
    bool _1288 = _1228 > 0.5;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1302 = 1.0 / _1274;
    float _1304 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1298);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = _1286;
    if (_1240)
    {
        float _1316 = _1288 ? _1270 : _132;
        _178 = _1316;
    }
    float _1318 = _178;
    float _1320 = -_1248;
    float _1322 = _1320 + 1.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1326 = _1266 > 0.5;
    float _1328 = 1.0 / _1308;
    float _1330 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1332;
    float _1336 = _1248;
    if (_1258)
    {
        float _1338 = _1326 ? _1322 : _1248;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1346 = -_1324;
    float _1348 = fma(_1330, 2.0, _1346);
    float _1350 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1352 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1254);
    float _1354 = 1.0 / _1312;
    float _1356 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1304);
    float _1358 = _1280 * _1292;
    float _1360 = _1350 * _1290;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1364 = _1226 + _1362;
    float _1366 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1370 = _1226 + _1368;
    float _1372 = 1.0 / _1344;
    float _1374 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1276);
    float _1376 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1380 = _1226 + _1378;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1384 = _1260 > 0.5;
    bool _1386 = _1384 && _1246;
    float _1388 = _1376 * _1300;
    float _1390 = _1380 * _1278;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1364 * _1302;
    float _1396 = fma(_1366, -2.0, _1382);
    float _1398 = _1366;
    if (_1252)
    {
        float _1400 = in.m_41.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1406 = _1226 + _1404;
    bool _1408 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1410 = isnan(_1226);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1422 = 1.0 / _1334;
    float _1424 = _1284 * _1372;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1428 = _1406 * _1354;
    float _1430 = -_1418;
    float _1432 = _1430 + 1.0;
    bool _1434 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1436 = isnan(_1226);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1452 = _1226 + _1450;
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1426);
    bool _1458 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1460 = isnan(_1226);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1452 * _1328;
    float _1472 = fma(_1454, _1340, -0.5);
    float _1474 = _1454;
    if (!_1296)
    {
        _1474 = _1266;
    }
    float _1476 = _1474;
    float _1478 = _1370 * _1422;
    float _1480 = _1476;
    if (_1296)
    {
        _1480 = _1260;
    }
    float _1482 = _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1484;
    float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1490 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1492 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1226 + _1494;
    bool _1498 = _1402 > 0.5;
    bool _1500 = _1498 && _1252;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1502;
    float _1506 = fma(_1492, _1318, -0.5);
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1512 = fma(_1504, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1514 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1516;
    float _1520 = -_98;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1524 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1530 = fma(_1518, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1532 = -_1524;
    float _1534 = fma(_1514, _1472, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1540;
    float _1544 = _1496 * _1508;
    float _1546 = fma(_1538, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1548 = fma(_1528, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1550 = fma(_1542, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1560;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (!_1296)
    {
        float _1566 = in.m_41.z;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = fma(_1554, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    bool _1576 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1578 = isnan(_1226);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1588;
    float _1592 = fma(_1558, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1594 = fma(_1574, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1596 = fma(_1562, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1598 = fma(_1590, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1600 = -_1586;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1608 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1610 = isnan(_1226);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1624 = _1418 * _1602;
    float _1626 = _1602;
    if (_1246)
    {
        _1626 = _1286;
    }
    float _1628 = _1626;
    float _1630 = fma(_1606, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1632 = fma(_1622, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1634 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1636 = isnan(_1226);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = _1618 * _1432;
    bool _1648 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1226);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1618;
    float _1662 = _1660 + 1.0;
    float _1664 = _1628;
    if (_1386)
    {
        float _1666 = -_1628;
        float _1668 = _1666 + 1.0;
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1644;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = -_1658;
    float _1680 = _1678 + 1.0;
    float _1682 = _1644 * _1662;
    float _1684 = _1670;
    if (_1246)
    {
        _1314 = _1670;
    }
    float _1686 = _1314;
    float _1688 = _1658 * _1674;
    float _1690 = _1568;
    if (!_1296)
    {
        _1684 = _1568;
    }
    float _1692 = _1684;
    float _1694 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1696 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1698 = isnan(_1226);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = _1444 * _1680;
    float _1710 = _1692;
    if (_1296)
    {
        _1710 = _1266;
    }
    float _1712 = _1710;
    float _1714 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1296)
    {
        _1690 = _1266;
    }
    float _1716 = _1690;
    float _1718 = -_1444;
    float _1720 = _1718 + 1.0;
    float _1722 = -_1468;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1728 = _1468 * _1720;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1734;
    float _1738 = _1706 * _1724;
    float _1740 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1694);
    float _1742 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1744 = fma(_1736, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1746 = _1512 * _1738;
    float _1748 = _1530 * _1738;
    float _1750 = fma(_1742, _1686, -0.5);
    float _1752 = fma(_1732, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1754 = -_1706;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1760 = _1738;
    if (!_1252)
    {
        _1760 = _128;
    }
    float _1762 = _1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1746);
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1748);
    float _1768 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1758);
    float _1770 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1774 = _1762;
    if (_1500)
    {
        float _1776 = -_128;
        float _1778 = _1776 + 1.0;
        _180 = _1778;
    }
    float _1780 = _180;
    float _1782 = fma(_1546, _1728, _1764);
    float _1784 = -_1676;
    float _1786 = fma(_1770, 2.0, _1784);
    float _1788 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1790 = fma(_1548, _1728, _1766);
    float _1792 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1772);
    float _1794 = fma(_1788, _1750, _1522);
    float _1796 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1490);
    if (_1252)
    {
        _1774 = _1780;
    }
    float _1802 = _1774;
    float _1804 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1768);
    float _1806 = fma(_1796, -2.0, _1798);
    float _1808 = -_98;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1812 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1792);
    float _1814 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1816 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1806);
    float _1818 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1822 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1726);
    float _1824 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = _1818 + _1820;
    float _1830 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1834 = _1824 + _1826;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1840 = _1830 + _1832;
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1846 = fma(_1570, _1708, _1790);
    float _1848 = -_1816;
    float _1850 = fma(_1812, _1506, _1848);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1844);
    float _1856 = fma(_1550, _1708, _1782);
    float _1858 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = fma(_1594, _1688, _1846);
    float _1862 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1852);
    float _1864 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1866 = fma(_1592, _1688, _1856);
    float _1868 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1598, _1682, _1860);
    float _1874 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1884 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1886 = fma(_1596, _1682, _1866);
    float _1888 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1890 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1892 = fma(_1632, _1646, _1872);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1880);
    float _1900 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1882);
    float _1902 = fma(_1884, _1802, -0.5);
    float _1904 = fma(_1630, _1646, _1886);
    float _1906 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1890);
    float _1910 = fma(_1752, _1624, _1892);
    float _1912 = fma(_1804, _1902, _1810);
    float _1914 = fma(_1744, _1624, _1904);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1894);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1896);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1924 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1910);
    float _1928 = _1534 + 0.5;
    float _1930 = _1794 + 0.5;
    float _1932 = _1850 + 0.5;
    float _1934 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1914);
    float _1936 = _1912 + 0.5;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1918);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1834;
    out.m_51.y = _1828;
    out.m_51.z = _1840;
    out.m_53.x = _1930;
    out.m_53.y = _1928;
    out.m_53.z = _1936;
    out.m_53.w = _1932;
    out.m_55.x = _1934;
    out.m_55.y = _1926;
    out.gl_Position.x = _1938;
    out.gl_Position.y = _1940;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1224 = false;
    bool _912 = false;
    bool _684 = false;
    bool _560 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_78)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2000 = as_type<float>(_88);
        out.gl_Position.z = _2000;
    }
    if (!_78)
    {
        return out;
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = 1.0 / _94;
    bool _112 = _98 >= _94;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = 0.0;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _98 * _110;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _124 = _120 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    out.m_33.x = _122;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2070 = as_type<float>(_126);
        out.gl_Position.z = _2070;
    }
    if (_116)
    {
        return out;
    }
    float _128 = in.m_35.x;
    float _130 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _122;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _280 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    bool _312 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_280);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_280);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _300;
    float _338 = -_334;
    float _340 = _338 + 1.0;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _304;
    float _346 = _284 * _310;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _280 + _348;
    float _352 = 1.0 / _308;
    float _354 = _288 * _336;
    bool _356 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_280);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_366;
    float _370 = _368 + 1.0;
    float _372 = _292 * _344;
    float _374 = _350 * _352;
    bool _376 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_280);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = _386 * _370;
    float _394 = -_386;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_390, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _322 * _396;
    float _410 = -_322;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_404, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _418 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_280);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _334 * _412;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = _428 * _340;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = fma(_438, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_442, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = _414 * _444;
    float _456 = _416 * _444;
    float _458 = _406 * _444;
    float _460 = -_428;
    float _462 = _460 + 1.0;
    float _464 = in.m_37.x;
    float _466 = in.m_37.y;
    float _468 = in.m_37.z;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _482 = fma(_434, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _486 = fma(_472, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _488 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_476, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_450, _430, _478);
    float _494 = fma(_452, _430, _480);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _508 = fma(_482, _430, _484);
    float _510 = fma(_498, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _512 = fma(_502, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _514 = fma(_488, _408, _494);
    float _516 = fma(_506, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_490, _408, _508);
    float _520 = fma(_486, _408, _492);
    float _522 = fma(_512, _392, _514);
    float _524 = fma(_516, _392, _518);
    float _526 = fma(_510, _392, _520);
    float _528 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _522);
    float _530 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _524);
    float _532 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = _528 * _466;
    float _536 = _530 * _468;
    float _538 = _532 * _464;
    bool _540 = !_342;
    float _558;
    if (!_540)
    {
        float _542 = in.m_41.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _122;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _562 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_562);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    bool _604 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _606 = isnan(_562);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = 1.0 / _570;
    float _618 = -_582;
    float _620 = _618 + 1.0;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _624 = _598 * _620;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _586;
    float _632 = _602 * _616;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _636 * _630;
    float _642 = _638 * _624;
    float _644 = -_614;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _562 + _648;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _654 = _582 * _646;
    float _656 = fma(_640, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_656, _654, _652);
    float _660 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[117].x, _658);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _662;
    bool _664 = !_622;
    float _682;
    if (!_664)
    {
        float _666 = in.m_41.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _98);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _122;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _686 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _712 = 1.0 / _702;
    bool _714 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _716 = isnan(_686);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _706;
    bool _728 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _730 = 1.0 / _710;
    bool _732 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _734 = isnan(_686);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _690 * _712;
    bool _746 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _748 = isnan(_686);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_742;
    float _760 = _758 + 1.0;
    float _762 = _694 * _726;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _764;
    float _768 = -_756;
    float _770 = _768 + 1.0;
    float _772 = _756 * _760;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _778 = fma(_766, _762, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _784 = _698 * _730;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _790;
    float _794 = _724 * _770;
    float _796 = -_724;
    float _798 = _796 + 1.0;
    float _800 = fma(_788, _762, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _802 = fma(_792, _762, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _804 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _806 = isnan(_686);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _820 = fma(_776, _784, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _822 = fma(_782, _784, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _824 = _814 * _798;
    float _826 = fma(_818, _784, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _828 = -_814;
    float _830 = _828 + 1.0;
    float _832 = _778 * _824;
    float _834 = _800 * _824;
    float _836 = _802 * _824;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _838;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _834);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _850;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _836);
    float _856 = fma(_840, _744, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _858 = fma(_826, _794, _842);
    float _860 = fma(_848, _744, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_852, _744, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _864 = fma(_820, _794, _844);
    float _866 = fma(_822, _794, _854);
    float _868 = fma(_856, _772, _858);
    float _870 = fma(_860, _772, _864);
    float _872 = fma(_862, _772, _866);
    float _874 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    float _880 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _886;
    out.m_45.y = _888;
    out.m_45.z = _890;
    bool _892 = !_728;
    float _910;
    if (!_892)
    {
        float _894 = in.m_41.x;
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _898 = _894 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[14].x, _98);
        float _902 = _900 * _896;
        float _904 = floor(_902);
        float _906 = -_904;
        float _908 = _902 + _906;
        _910 = _908;
        _912 = true;
    }
    else
    {
        _910 = _122;
    }
    _912 = false;
    float _914 = _910;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _918 = _914 + _916;
    bool _920 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _922 = isnan(_914);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _936 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _938 = isnan(_914);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _948;
    float _952 = 1.0 / _934;
    bool _954 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _968 = isnan(_914);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = 1.0 / _980;
    float _984 = -_930;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _990 = _950 * _952;
    bool _992 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _994 = isnan(_914);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_946;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = fma(_990, _918, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1014 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1016 = isnan(_914);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_1002;
    float _1028 = _1026 + 1.0;
    float _1030 = _1002 * _986;
    float _1032 = _930 * _1006;
    float _1034 = _964 * _1028;
    float _1036 = -_964;
    float _1038 = _1036 + 1.0;
    float _1040 = 1.0 / _1010;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1046 = _976 * _1038;
    float _1048 = -_976;
    float _1050 = _1048 + 1.0;
    bool _1052 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1054 = isnan(_914);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1024 * _1050;
    float _1066 = -_1024;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1076;
    float _1080 = _1062 * _1068;
    float _1082 = _1074 * _982;
    float _1084 = -_1062;
    float _1086 = _1084 + 1.0;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1012 * _1080;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1100 = _914 + _1098;
    float _1102 = 1.0 / _1090;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1092);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1110 = fma(_1082, _1100, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1112 = _1078 * _1070;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1116 = _914 + _1114;
    float _1118 = fma(_1110, _1064, _1104);
    float _1120 = 1.0 / _1096;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1126 = fma(_1112, _1116, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1134 = _914 + _1132;
    float _1136 = _1124 * _1040;
    float _1138 = fma(_1126, _1046, _1118);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1142 = _914 + _1140;
    float _1144 = 1.0 / _1108;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = _1130 * _1102;
    float _1152 = fma(_1136, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1156 = _914 + _1154;
    float _1158 = fma(_1150, _1142, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1160 = _1148 * _1120;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1162;
    bool _1166 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1168 = isnan(_914);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1152, _1034, _1138);
    float _1180 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1184 = _914 + _1182;
    float _1186 = -_1176;
    float _1188 = _1186 + 1.0;
    float _1190 = _1164 * _1144;
    float _1192 = fma(_1158, _1030, _1178);
    float _1194 = _946 * _1188;
    float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1198 = fma(_1180, _1032, _1192);
    float _1200 = fma(_1196, _1194, _1198);
    float _1202 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1200);
    out.m_47.x = _1202;
    bool _1204 = !_988;
    float _1222;
    if (!_1204)
    {
        float _1206 = in.m_41.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _98);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _122;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = in.m_41.w;
    float _1230 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1240 = _1238 != 0;
    float _1242 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = in.m_35.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    float _1254 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1230);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = in.m_41.x;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = in.m_41.y;
    float _1268 = -_132;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1276 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1278 = 1.0 / _1264;
    float _1280 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1284 = _1226 + _1282;
    float _1286 = in.m_35.z;
    bool _1288 = _1228 > 0.5;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1302 = 1.0 / _1274;
    float _1304 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1298);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = _1286;
    if (_1240)
    {
        float _1316 = _1288 ? _1270 : _132;
        _178 = _1316;
    }
    float _1318 = _178;
    float _1320 = -_1248;
    float _1322 = _1320 + 1.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1326 = _1266 > 0.5;
    float _1328 = 1.0 / _1308;
    float _1330 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1332;
    float _1336 = _1248;
    if (_1258)
    {
        float _1338 = _1326 ? _1322 : _1248;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1346 = -_1324;
    float _1348 = fma(_1330, 2.0, _1346);
    float _1350 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1352 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1254);
    float _1354 = 1.0 / _1312;
    float _1356 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1304);
    float _1358 = _1280 * _1292;
    float _1360 = _1350 * _1290;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1364 = _1226 + _1362;
    float _1366 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1370 = _1226 + _1368;
    float _1372 = 1.0 / _1344;
    float _1374 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1276);
    float _1376 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1380 = _1226 + _1378;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1384 = _1260 > 0.5;
    bool _1386 = _1384 && _1246;
    float _1388 = _1376 * _1300;
    float _1390 = _1380 * _1278;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1364 * _1302;
    float _1396 = fma(_1366, -2.0, _1382);
    float _1398 = _1366;
    if (_1252)
    {
        float _1400 = in.m_41.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1406 = _1226 + _1404;
    bool _1408 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1410 = isnan(_1226);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1422 = 1.0 / _1334;
    float _1424 = _1284 * _1372;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1428 = _1406 * _1354;
    float _1430 = -_1418;
    float _1432 = _1430 + 1.0;
    bool _1434 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1436 = isnan(_1226);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1452 = _1226 + _1450;
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1426);
    bool _1458 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1460 = isnan(_1226);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1452 * _1328;
    float _1472 = fma(_1454, _1340, -0.5);
    float _1474 = _1454;
    if (!_1296)
    {
        _1474 = _1266;
    }
    float _1476 = _1474;
    float _1478 = _1370 * _1422;
    float _1480 = _1476;
    if (_1296)
    {
        _1480 = _1260;
    }
    float _1482 = _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1484;
    float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1490 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1492 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1226 + _1494;
    bool _1498 = _1402 > 0.5;
    bool _1500 = _1498 && _1252;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1502;
    float _1506 = fma(_1492, _1318, -0.5);
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1512 = fma(_1504, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1514 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1516;
    float _1520 = -_98;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1524 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1530 = fma(_1518, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1532 = -_1524;
    float _1534 = fma(_1514, _1472, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1540;
    float _1544 = _1496 * _1508;
    float _1546 = fma(_1538, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1548 = fma(_1528, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1550 = fma(_1542, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1560;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (!_1296)
    {
        float _1566 = in.m_41.z;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = fma(_1554, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    bool _1576 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1578 = isnan(_1226);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1588;
    float _1592 = fma(_1558, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1594 = fma(_1574, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1596 = fma(_1562, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1598 = fma(_1590, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1600 = -_1586;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1608 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1610 = isnan(_1226);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1624 = _1418 * _1602;
    float _1626 = _1602;
    if (_1246)
    {
        _1626 = _1286;
    }
    float _1628 = _1626;
    float _1630 = fma(_1606, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1632 = fma(_1622, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1634 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1636 = isnan(_1226);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = _1618 * _1432;
    bool _1648 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1226);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1618;
    float _1662 = _1660 + 1.0;
    float _1664 = _1628;
    if (_1386)
    {
        float _1666 = -_1628;
        float _1668 = _1666 + 1.0;
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1644;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = -_1658;
    float _1680 = _1678 + 1.0;
    float _1682 = _1644 * _1662;
    float _1684 = _1670;
    if (_1246)
    {
        _1314 = _1670;
    }
    float _1686 = _1314;
    float _1688 = _1658 * _1674;
    float _1690 = _1568;
    if (!_1296)
    {
        _1684 = _1568;
    }
    float _1692 = _1684;
    float _1694 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1696 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1698 = isnan(_1226);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = _1444 * _1680;
    float _1710 = _1692;
    if (_1296)
    {
        _1710 = _1266;
    }
    float _1712 = _1710;
    float _1714 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1296)
    {
        _1690 = _1266;
    }
    float _1716 = _1690;
    float _1718 = -_1444;
    float _1720 = _1718 + 1.0;
    float _1722 = -_1468;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1728 = _1468 * _1720;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1734;
    float _1738 = _1706 * _1724;
    float _1740 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1694);
    float _1742 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1744 = fma(_1736, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1746 = _1512 * _1738;
    float _1748 = _1530 * _1738;
    float _1750 = fma(_1742, _1686, -0.5);
    float _1752 = fma(_1732, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1754 = -_1706;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1760 = _1738;
    if (!_1252)
    {
        _1760 = _128;
    }
    float _1762 = _1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1746);
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1748);
    float _1768 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1758);
    float _1770 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1774 = _1762;
    if (_1500)
    {
        float _1776 = -_128;
        float _1778 = _1776 + 1.0;
        _180 = _1778;
    }
    float _1780 = _180;
    float _1782 = fma(_1546, _1728, _1764);
    float _1784 = -_1676;
    float _1786 = fma(_1770, 2.0, _1784);
    float _1788 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1790 = fma(_1548, _1728, _1766);
    float _1792 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1772);
    float _1794 = fma(_1788, _1750, _1522);
    float _1796 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1490);
    if (_1252)
    {
        _1774 = _1780;
    }
    float _1802 = _1774;
    float _1804 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1768);
    float _1806 = fma(_1796, -2.0, _1798);
    float _1808 = -_98;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1812 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1792);
    float _1814 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1816 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1806);
    float _1818 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1822 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1726);
    float _1824 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = _1818 + _1820;
    float _1830 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1834 = _1824 + _1826;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1840 = _1830 + _1832;
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1846 = fma(_1570, _1708, _1790);
    float _1848 = -_1816;
    float _1850 = fma(_1812, _1506, _1848);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1844);
    float _1856 = fma(_1550, _1708, _1782);
    float _1858 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = fma(_1594, _1688, _1846);
    float _1862 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1852);
    float _1864 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1866 = fma(_1592, _1688, _1856);
    float _1868 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1598, _1682, _1860);
    float _1874 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1884 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1886 = fma(_1596, _1682, _1866);
    float _1888 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1890 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1892 = fma(_1632, _1646, _1872);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1880);
    float _1900 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1882);
    float _1902 = fma(_1884, _1802, -0.5);
    float _1904 = fma(_1630, _1646, _1886);
    float _1906 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1890);
    float _1910 = fma(_1752, _1624, _1892);
    float _1912 = fma(_1804, _1902, _1810);
    float _1914 = fma(_1744, _1624, _1904);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1894);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1896);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1924 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1910);
    float _1928 = _1534 + 0.5;
    float _1930 = _1794 + 0.5;
    float _1932 = _1850 + 0.5;
    float _1934 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1914);
    float _1936 = _1912 + 0.5;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1918);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1834;
    out.m_51.y = _1828;
    out.m_51.z = _1840;
    out.m_53.x = _1930;
    out.m_53.y = _1928;
    out.m_53.z = _1936;
    out.m_53.w = _1932;
    out.m_55.x = _1934;
    out.m_55.y = _1926;
    out.gl_Position.x = _1938;
    out.gl_Position.y = _1940;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1224 = false;
    bool _912 = false;
    bool _684 = false;
    bool _560 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_78)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2000 = as_type<float>(_88);
        out.gl_Position.z = _2000;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = 1.0 / _94;
    bool _112 = _98 >= _94;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = 0.0;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _98 * _110;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _124 = _120 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    out.m_33.x = _122;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2070 = as_type<float>(_126);
        out.gl_Position.z = _2070;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_35.x;
    float _130 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _122;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _280 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    bool _312 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_280);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_280);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _300;
    float _338 = -_334;
    float _340 = _338 + 1.0;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _304;
    float _346 = _284 * _310;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _280 + _348;
    float _352 = 1.0 / _308;
    float _354 = _288 * _336;
    bool _356 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_280);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_366;
    float _370 = _368 + 1.0;
    float _372 = _292 * _344;
    float _374 = _350 * _352;
    bool _376 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_280);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = _386 * _370;
    float _394 = -_386;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_390, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _322 * _396;
    float _410 = -_322;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_404, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _418 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_280);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _334 * _412;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = _428 * _340;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = fma(_438, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_442, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = _414 * _444;
    float _456 = _416 * _444;
    float _458 = _406 * _444;
    float _460 = -_428;
    float _462 = _460 + 1.0;
    float _464 = in.m_37.x;
    float _466 = in.m_37.y;
    float _468 = in.m_37.z;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _482 = fma(_434, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _486 = fma(_472, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _488 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_476, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_450, _430, _478);
    float _494 = fma(_452, _430, _480);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _508 = fma(_482, _430, _484);
    float _510 = fma(_498, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _512 = fma(_502, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _514 = fma(_488, _408, _494);
    float _516 = fma(_506, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = fma(_490, _408, _508);
    float _520 = fma(_486, _408, _492);
    float _522 = fma(_512, _392, _514);
    float _524 = fma(_516, _392, _518);
    float _526 = fma(_510, _392, _520);
    float _528 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _522);
    float _530 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _524);
    float _532 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _526);
    float _534 = _528 * _466;
    float _536 = _530 * _468;
    float _538 = _532 * _464;
    bool _540 = !_342;
    float _558;
    if (!_540)
    {
        float _542 = in.m_41.x;
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _546 = _542 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _122;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _562 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_562);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    bool _604 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _606 = isnan(_562);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = 1.0 / _570;
    float _618 = -_582;
    float _620 = _618 + 1.0;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _624 = _598 * _620;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _586;
    float _632 = _602 * _616;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = _636 * _630;
    float _642 = _638 * _624;
    float _644 = -_614;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _562 + _648;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _654 = _582 * _646;
    float _656 = fma(_640, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_656, _654, _652);
    float _660 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[117].x, _658);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _662;
    bool _664 = !_622;
    float _682;
    if (!_664)
    {
        float _666 = in.m_41.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _98);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _122;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _694 = _686 + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _686 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _712 = 1.0 / _702;
    bool _714 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _716 = isnan(_686);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = 1.0 / _706;
    bool _728 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _730 = 1.0 / _710;
    bool _732 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _734 = isnan(_686);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _690 * _712;
    bool _746 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _748 = isnan(_686);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_742;
    float _760 = _758 + 1.0;
    float _762 = _694 * _726;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _764;
    float _768 = -_756;
    float _770 = _768 + 1.0;
    float _772 = _756 * _760;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _778 = fma(_766, _762, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _784 = _698 * _730;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _790;
    float _794 = _724 * _770;
    float _796 = -_724;
    float _798 = _796 + 1.0;
    float _800 = fma(_788, _762, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _802 = fma(_792, _762, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _804 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _806 = isnan(_686);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _820 = fma(_776, _784, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _822 = fma(_782, _784, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _824 = _814 * _798;
    float _826 = fma(_818, _784, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _828 = -_814;
    float _830 = _828 + 1.0;
    float _832 = _778 * _824;
    float _834 = _800 * _824;
    float _836 = _802 * _824;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _838;
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _832);
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _834);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _850;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _836);
    float _856 = fma(_840, _744, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _858 = fma(_826, _794, _842);
    float _860 = fma(_848, _744, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_852, _744, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _864 = fma(_820, _794, _844);
    float _866 = fma(_822, _794, _854);
    float _868 = fma(_856, _772, _858);
    float _870 = fma(_860, _772, _864);
    float _872 = fma(_862, _772, _866);
    float _874 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    float _880 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _882 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _884 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _886 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _886;
    out.m_45.y = _888;
    out.m_45.z = _890;
    bool _892 = !_728;
    float _910;
    if (!_892)
    {
        float _894 = in.m_41.x;
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _898 = _894 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[14].x, _98);
        float _902 = _900 * _896;
        float _904 = floor(_902);
        float _906 = -_904;
        float _908 = _902 + _906;
        _910 = _908;
        _912 = true;
    }
    else
    {
        _910 = _122;
    }
    _912 = false;
    float _914 = _910;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _918 = _914 + _916;
    bool _920 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _922 = isnan(_914);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _936 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _938 = isnan(_914);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _948;
    float _952 = 1.0 / _934;
    bool _954 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    bool _966 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _968 = isnan(_914);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = 1.0 / _980;
    float _984 = -_930;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _990 = _950 * _952;
    bool _992 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _994 = isnan(_914);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -_946;
    float _1006 = _1004 + 1.0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1012 = fma(_990, _918, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1014 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1016 = isnan(_914);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -_1002;
    float _1028 = _1026 + 1.0;
    float _1030 = _1002 * _986;
    float _1032 = _930 * _1006;
    float _1034 = _964 * _1028;
    float _1036 = -_964;
    float _1038 = _1036 + 1.0;
    float _1040 = 1.0 / _1010;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1046 = _976 * _1038;
    float _1048 = -_976;
    float _1050 = _1048 + 1.0;
    bool _1052 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1054 = isnan(_914);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1024 * _1050;
    float _1066 = -_1024;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1076;
    float _1080 = _1062 * _1068;
    float _1082 = _1074 * _982;
    float _1084 = -_1062;
    float _1086 = _1084 + 1.0;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1012 * _1080;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1100 = _914 + _1098;
    float _1102 = 1.0 / _1090;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1092);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1110 = fma(_1082, _1100, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1112 = _1078 * _1070;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1116 = _914 + _1114;
    float _1118 = fma(_1110, _1064, _1104);
    float _1120 = 1.0 / _1096;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1126 = fma(_1112, _1116, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1134 = _914 + _1132;
    float _1136 = _1124 * _1040;
    float _1138 = fma(_1126, _1046, _1118);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1142 = _914 + _1140;
    float _1144 = 1.0 / _1108;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = _1130 * _1102;
    float _1152 = fma(_1136, _1134, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1156 = _914 + _1154;
    float _1158 = fma(_1150, _1142, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1160 = _1148 * _1120;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1162;
    bool _1166 = _914 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1168 = isnan(_914);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1152, _1034, _1138);
    float _1180 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1184 = _914 + _1182;
    float _1186 = -_1176;
    float _1188 = _1186 + 1.0;
    float _1190 = _1164 * _1144;
    float _1192 = fma(_1158, _1030, _1178);
    float _1194 = _946 * _1188;
    float _1196 = fma(_1190, _1184, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1198 = fma(_1180, _1032, _1192);
    float _1200 = fma(_1196, _1194, _1198);
    float _1202 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1200);
    out.m_47.x = _1202;
    bool _1204 = !_988;
    float _1222;
    if (!_1204)
    {
        float _1206 = in.m_41.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _98);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _122;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = in.m_41.w;
    float _1230 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1240 = _1238 != 0;
    float _1242 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = in.m_35.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1252 = _1250 != 0;
    float _1254 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1230);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = in.m_41.x;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = in.m_41.y;
    float _1268 = -_132;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1276 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1278 = 1.0 / _1264;
    float _1280 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1284 = _1226 + _1282;
    float _1286 = in.m_35.z;
    bool _1288 = _1228 > 0.5;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1302 = 1.0 / _1274;
    float _1304 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1298);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = _1286;
    if (_1240)
    {
        float _1316 = _1288 ? _1270 : _132;
        _178 = _1316;
    }
    float _1318 = _178;
    float _1320 = -_1248;
    float _1322 = _1320 + 1.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1326 = _1266 > 0.5;
    float _1328 = 1.0 / _1308;
    float _1330 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1332;
    float _1336 = _1248;
    if (_1258)
    {
        float _1338 = _1326 ? _1322 : _1248;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1346 = -_1324;
    float _1348 = fma(_1330, 2.0, _1346);
    float _1350 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1352 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1254);
    float _1354 = 1.0 / _1312;
    float _1356 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1304);
    float _1358 = _1280 * _1292;
    float _1360 = _1350 * _1290;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1364 = _1226 + _1362;
    float _1366 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1370 = _1226 + _1368;
    float _1372 = 1.0 / _1344;
    float _1374 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1276);
    float _1376 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1380 = _1226 + _1378;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1384 = _1260 > 0.5;
    bool _1386 = _1384 && _1246;
    float _1388 = _1376 * _1300;
    float _1390 = _1380 * _1278;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1364 * _1302;
    float _1396 = fma(_1366, -2.0, _1382);
    float _1398 = _1366;
    if (_1252)
    {
        float _1400 = in.m_41.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1406 = _1226 + _1404;
    bool _1408 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1410 = isnan(_1226);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1422 = 1.0 / _1334;
    float _1424 = _1284 * _1372;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1428 = _1406 * _1354;
    float _1430 = -_1418;
    float _1432 = _1430 + 1.0;
    bool _1434 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1436 = isnan(_1226);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1452 = _1226 + _1450;
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1426);
    bool _1458 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1460 = isnan(_1226);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1452 * _1328;
    float _1472 = fma(_1454, _1340, -0.5);
    float _1474 = _1454;
    if (!_1296)
    {
        _1474 = _1266;
    }
    float _1476 = _1474;
    float _1478 = _1370 * _1422;
    float _1480 = _1476;
    if (_1296)
    {
        _1480 = _1260;
    }
    float _1482 = _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1484;
    float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1490 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1492 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1226 + _1494;
    bool _1498 = _1402 > 0.5;
    bool _1500 = _1498 && _1252;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1502;
    float _1506 = fma(_1492, _1318, -0.5);
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1512 = fma(_1504, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1514 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1516;
    float _1520 = -_98;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1524 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1530 = fma(_1518, _1390, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1532 = -_1524;
    float _1534 = fma(_1514, _1472, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1540;
    float _1544 = _1496 * _1508;
    float _1546 = fma(_1538, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1548 = fma(_1528, _1394, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1550 = fma(_1542, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1560;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (!_1296)
    {
        float _1566 = in.m_41.z;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = fma(_1554, _1470, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    bool _1576 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1578 = isnan(_1226);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1588;
    float _1592 = fma(_1558, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1594 = fma(_1574, _1428, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1596 = fma(_1562, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1598 = fma(_1590, _1478, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1600 = -_1586;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1608 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1610 = isnan(_1226);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1616 = _1612 || _1614;
    float _1618 = float(_1616);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1624 = _1418 * _1602;
    float _1626 = _1602;
    if (_1246)
    {
        _1626 = _1286;
    }
    float _1628 = _1626;
    float _1630 = fma(_1606, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1632 = fma(_1622, _1424, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1634 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1636 = isnan(_1226);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = _1618 * _1432;
    bool _1648 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1226);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -_1618;
    float _1662 = _1660 + 1.0;
    float _1664 = _1628;
    if (_1386)
    {
        float _1666 = -_1628;
        float _1668 = _1666 + 1.0;
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1644;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1678 = -_1658;
    float _1680 = _1678 + 1.0;
    float _1682 = _1644 * _1662;
    float _1684 = _1670;
    if (_1246)
    {
        _1314 = _1670;
    }
    float _1686 = _1314;
    float _1688 = _1658 * _1674;
    float _1690 = _1568;
    if (!_1296)
    {
        _1684 = _1568;
    }
    float _1692 = _1684;
    float _1694 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1696 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1698 = isnan(_1226);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = _1444 * _1680;
    float _1710 = _1692;
    if (_1296)
    {
        _1710 = _1266;
    }
    float _1712 = _1710;
    float _1714 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1296)
    {
        _1690 = _1266;
    }
    float _1716 = _1690;
    float _1718 = -_1444;
    float _1720 = _1718 + 1.0;
    float _1722 = -_1468;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1728 = _1468 * _1720;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1734;
    float _1738 = _1706 * _1724;
    float _1740 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1694);
    float _1742 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1744 = fma(_1736, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1746 = _1512 * _1738;
    float _1748 = _1530 * _1738;
    float _1750 = fma(_1742, _1686, -0.5);
    float _1752 = fma(_1732, _1544, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1754 = -_1706;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1760 = _1738;
    if (!_1252)
    {
        _1760 = _128;
    }
    float _1762 = _1760;
    float _1764 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1746);
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1748);
    float _1768 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1758);
    float _1770 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1774 = _1762;
    if (_1500)
    {
        float _1776 = -_128;
        float _1778 = _1776 + 1.0;
        _180 = _1778;
    }
    float _1780 = _180;
    float _1782 = fma(_1546, _1728, _1764);
    float _1784 = -_1676;
    float _1786 = fma(_1770, 2.0, _1784);
    float _1788 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1790 = fma(_1548, _1728, _1766);
    float _1792 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1772);
    float _1794 = fma(_1788, _1750, _1522);
    float _1796 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1490);
    if (_1252)
    {
        _1774 = _1780;
    }
    float _1802 = _1774;
    float _1804 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1768);
    float _1806 = fma(_1796, -2.0, _1798);
    float _1808 = -_98;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1812 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1792);
    float _1814 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1816 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1806);
    float _1818 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1822 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1726);
    float _1824 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1828 = _1818 + _1820;
    float _1830 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1834 = _1824 + _1826;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1840 = _1830 + _1832;
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1846 = fma(_1570, _1708, _1790);
    float _1848 = -_1816;
    float _1850 = fma(_1812, _1506, _1848);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1844);
    float _1856 = fma(_1550, _1708, _1782);
    float _1858 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = fma(_1594, _1688, _1846);
    float _1862 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1852);
    float _1864 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1866 = fma(_1592, _1688, _1856);
    float _1868 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = fma(_1598, _1682, _1860);
    float _1874 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1884 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1886 = fma(_1596, _1682, _1866);
    float _1888 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1890 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1892 = fma(_1632, _1646, _1872);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1880);
    float _1900 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1882);
    float _1902 = fma(_1884, _1802, -0.5);
    float _1904 = fma(_1630, _1646, _1886);
    float _1906 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1890);
    float _1910 = fma(_1752, _1624, _1892);
    float _1912 = fma(_1804, _1902, _1810);
    float _1914 = fma(_1744, _1624, _1904);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1894);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1896);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1900);
    float _1924 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1910);
    float _1928 = _1534 + 0.5;
    float _1930 = _1794 + 0.5;
    float _1932 = _1850 + 0.5;
    float _1934 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1914);
    float _1936 = _1912 + 0.5;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1918);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1834;
    out.m_51.y = _1828;
    out.m_51.z = _1840;
    out.m_53.x = _1930;
    out.m_53.y = _1928;
    out.m_53.z = _1936;
    out.m_53.w = _1932;
    out.m_55.x = _1934;
    out.m_55.y = _1926;
    out.gl_Position.x = _1938;
    out.gl_Position.y = _1940;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

