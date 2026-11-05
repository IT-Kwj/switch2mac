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
    float4 m_41 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _650 = false;
    bool _432 = false;
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
        float _1093 = as_type<float>(_84);
        out.gl_Position.z = _1093;
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
        float _1162 = as_type<float>(_120);
        out.gl_Position.z = _1162;
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
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _272 + _290;
    bool _294 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _296 = isnan(_272);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _314 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _316 = isnan(_272);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = 1.0 / _308;
    float _332 = _324 * _328;
    float _334 = -_324;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _312;
    float _346 = _304 * _336;
    float _348 = -_304;
    float _350 = _348 + 1.0;
    float _352 = _276 * _330;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _358;
    float _362 = fma(_340, _352, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _364 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _366 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _368 = _292 * _344;
    float _370 = _362 * _346;
    float _372 = _364 * _346;
    float _374 = _366 * _346;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _388 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].x, _370);
    float _390 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _392 = fma(_382, _368, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _394 = fma(_386, _368, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _398 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].z, _374);
    float _400 = fma(_390, _332, _388);
    float _402 = fma(_392, _332, _396);
    float _404 = fma(_394, _332, _398);
    float _406 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].x, _400);
    float _408 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].y, _402);
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].z, _404);
    bool _412 = !_342;
    float _430;
    if (!_412)
    {
        float _414 = in.m_35.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_68);
        float _436 = 1.0 / _434;
        float _438 = _102 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _440 + _442;
    float _446 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_440);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _450;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _478 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _480 = isnan(_440);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _492 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _496 = 1.0 / _458;
    float _498 = _454 * _472;
    bool _500 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _476;
    float _514 = -_470;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_440);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _488 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _554;
    float _558 = _544 * _496;
    float _560 = _470 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _440 + _564;
    float _568 = -_488;
    float _570 = _568 + 1.0;
    bool _572 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_440);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _556 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _440 + _590;
    float _594 = fma(_558, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _440 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_616, _612, _618);
    float _624 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _622);
    float _628 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _624;
    out.m_37.y = _614;
    out.m_37.z = _620;
    out.m_37.w = _628;
    bool _630 = !_494;
    float _648;
    if (!_630)
    {
        float _632 = in.m_35.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_68);
        float _654 = 1.0 / _652;
        float _656 = _102 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = in.m_35.y;
    float _662 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_39.x;
    float _666 = in.m_39.y;
    float _668 = in.m_39.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    float _674 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = in.m_33.x;
    float _682 = in.m_33.y;
    float _684 = in.m_33.z;
    float _686 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _688 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _690 = in.m_41.y;
    float _692 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _686);
    float _694 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _688);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = in.m_43.z;
    float _702 = 1.0 / _698;
    float _704 = in.m_43.x;
    float _706 = in.m_43.y;
    bool _708 = _660 > 0.5;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _718 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _722 = 1.0 / _712;
    float _724 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _728 = _658 + _726;
    float _730 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = -_690;
    float _734 = _732 + 1.0;
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _680 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _740 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    out.m_45.z = _700;
    float _742 = _690;
    if (_678)
    {
        float _744 = _708 ? _734 : _690;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _752 = _658 + _750;
    out.m_45.x = _704;
    float _754 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _728 * _702;
    out.m_45.y = _706;
    float _760 = _752 * _722;
    float _762 = _736 * _714;
    float _764 = in.m_41.x;
    bool _766 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _768 = isnan(_658);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _720;
    bool _780 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_658);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _512;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    if (_672)
    {
        float _796 = in.m_35.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _804;
    float _808 = -_776;
    float _810 = _808 + 1.0;
    float _812 = _756 * _716;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_802, _760, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_806, _760, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = _790 * _810;
    float _824 = fma(_816, _760, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _826 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_658);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_790;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = _836 * _840;
    float _856 = fma(_844, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _862 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = _844;
    if (_672)
    {
        _794 = _764;
    }
    float _868 = _794;
    float _870 = _818 * _854;
    float _872 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _874 = _868;
    if (!_672)
    {
        _866 = _764;
    }
    float _876 = _866;
    float _878 = _820 * _854;
    float _880 = _824 * _854;
    float _882 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _872);
    bool _892 = _798 > 0.5;
    bool _894 = _892 && _672;
    float _896 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].x, _870);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].y, _878);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].z, _880);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _908 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _896);
    float _912 = _718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _906 + _908;
    float _918 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _922 = _912 + _914;
    float _924 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _926 = fma(_860, _822, _902);
    float _928 = _918 + _920;
    float _930 = _876;
    if (_894)
    {
        float _932 = -_868;
        float _934 = _932 + 1.0;
        _874 = _934;
    }
    float _936 = _874;
    float _938 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _924);
    float _942 = fma(_856, _822, _898);
    float _944 = fma(_858, _822, _900);
    float _946 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _950 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _940);
    if (_672)
    {
        _930 = _936;
    }
    float _956 = _930;
    float _958 = in.m_43.w;
    float _960 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _946);
    float _962 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _960);
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _962);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _982 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _984 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].x, _942);
    float _986 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].y, _944);
    float _990 = _970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _976);
    float _994 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].z, _926);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _978);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _980);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _982);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = _986 * _948;
    float _1006 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[5].z, _992);
    float _1010 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1012 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = _1002 * _964;
    float _1024 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1008);
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1016);
    float _1036 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1018);
    out.m_45.w = _958;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1022;
    out.m_47.y = _1004;
    out.m_49.x = _1024;
    out.m_49.y = _1026;
    out.m_49.z = _1030;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1028;
    out.gl_Position.z = _1034;
    out.gl_Position.w = _1036;
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
    bool _650 = false;
    bool _432 = false;
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
        float _1093 = as_type<float>(_84);
        out.gl_Position.z = _1093;
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
        float _1162 = as_type<float>(_120);
        out.gl_Position.z = _1162;
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
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _272 + _290;
    bool _294 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _296 = isnan(_272);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _314 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _316 = isnan(_272);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = 1.0 / _308;
    float _332 = _324 * _328;
    float _334 = -_324;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _312;
    float _346 = _304 * _336;
    float _348 = -_304;
    float _350 = _348 + 1.0;
    float _352 = _276 * _330;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _358;
    float _362 = fma(_340, _352, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _364 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _366 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _368 = _292 * _344;
    float _370 = _362 * _346;
    float _372 = _364 * _346;
    float _374 = _366 * _346;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _388 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].x, _370);
    float _390 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _392 = fma(_382, _368, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _394 = fma(_386, _368, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _398 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].z, _374);
    float _400 = fma(_390, _332, _388);
    float _402 = fma(_392, _332, _396);
    float _404 = fma(_394, _332, _398);
    float _406 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].x, _400);
    float _408 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].y, _402);
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].z, _404);
    bool _412 = !_342;
    float _430;
    if (!_412)
    {
        float _414 = in.m_35.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_68);
        float _436 = 1.0 / _434;
        float _438 = _102 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _440 + _442;
    float _446 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_440);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _450;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _478 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _480 = isnan(_440);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _492 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _496 = 1.0 / _458;
    float _498 = _454 * _472;
    bool _500 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _476;
    float _514 = -_470;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_440);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _488 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _554;
    float _558 = _544 * _496;
    float _560 = _470 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _440 + _564;
    float _568 = -_488;
    float _570 = _568 + 1.0;
    bool _572 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_440);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _556 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _440 + _590;
    float _594 = fma(_558, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _440 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_616, _612, _618);
    float _624 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _622);
    float _628 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _624;
    out.m_37.y = _614;
    out.m_37.z = _620;
    out.m_37.w = _628;
    bool _630 = !_494;
    float _648;
    if (!_630)
    {
        float _632 = in.m_35.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_68);
        float _654 = 1.0 / _652;
        float _656 = _102 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = in.m_35.y;
    float _662 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_39.x;
    float _666 = in.m_39.y;
    float _668 = in.m_39.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    float _674 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = in.m_33.x;
    float _682 = in.m_33.y;
    float _684 = in.m_33.z;
    float _686 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _688 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _690 = in.m_41.y;
    float _692 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _686);
    float _694 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _688);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = in.m_43.z;
    float _702 = 1.0 / _698;
    float _704 = in.m_43.x;
    float _706 = in.m_43.y;
    bool _708 = _660 > 0.5;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _718 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _722 = 1.0 / _712;
    float _724 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _728 = _658 + _726;
    float _730 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = -_690;
    float _734 = _732 + 1.0;
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _680 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _740 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    out.m_45.z = _700;
    float _742 = _690;
    if (_678)
    {
        float _744 = _708 ? _734 : _690;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _752 = _658 + _750;
    out.m_45.x = _704;
    float _754 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _728 * _702;
    out.m_45.y = _706;
    float _760 = _752 * _722;
    float _762 = _736 * _714;
    float _764 = in.m_41.x;
    bool _766 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _768 = isnan(_658);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _720;
    bool _780 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_658);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _512;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    if (_672)
    {
        float _796 = in.m_35.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _804;
    float _808 = -_776;
    float _810 = _808 + 1.0;
    float _812 = _756 * _716;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_802, _760, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_806, _760, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = _790 * _810;
    float _824 = fma(_816, _760, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _826 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_658);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_790;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = _836 * _840;
    float _856 = fma(_844, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _862 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = _844;
    if (_672)
    {
        _794 = _764;
    }
    float _868 = _794;
    float _870 = _818 * _854;
    float _872 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _874 = _868;
    if (!_672)
    {
        _866 = _764;
    }
    float _876 = _866;
    float _878 = _820 * _854;
    float _880 = _824 * _854;
    float _882 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _872);
    bool _892 = _798 > 0.5;
    bool _894 = _892 && _672;
    float _896 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].x, _870);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].y, _878);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].z, _880);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _908 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _896);
    float _912 = _718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _906 + _908;
    float _918 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _922 = _912 + _914;
    float _924 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _926 = fma(_860, _822, _902);
    float _928 = _918 + _920;
    float _930 = _876;
    if (_894)
    {
        float _932 = -_868;
        float _934 = _932 + 1.0;
        _874 = _934;
    }
    float _936 = _874;
    float _938 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _924);
    float _942 = fma(_856, _822, _898);
    float _944 = fma(_858, _822, _900);
    float _946 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _950 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _940);
    if (_672)
    {
        _930 = _936;
    }
    float _956 = _930;
    float _958 = in.m_43.w;
    float _960 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _946);
    float _962 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _960);
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _962);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _982 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _984 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].x, _942);
    float _986 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].y, _944);
    float _990 = _970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _976);
    float _994 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].z, _926);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _978);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _980);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _982);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = _986 * _948;
    float _1006 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[5].z, _992);
    float _1010 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1012 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = _1002 * _964;
    float _1024 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1008);
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1016);
    float _1036 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1018);
    out.m_45.w = _958;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1022;
    out.m_47.y = _1004;
    out.m_49.x = _1024;
    out.m_49.y = _1026;
    out.m_49.z = _1030;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1028;
    out.gl_Position.z = _1034;
    out.gl_Position.w = _1036;
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
    bool _650 = false;
    bool _432 = false;
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
        float _1093 = as_type<float>(_84);
        out.gl_Position.z = _1093;
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
        float _1162 = as_type<float>(_120);
        out.gl_Position.z = _1162;
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
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
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
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _292 = _272 + _290;
    bool _294 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _296 = isnan(_272);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _314 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _316 = isnan(_272);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = 1.0 / _308;
    float _332 = _324 * _328;
    float _334 = -_324;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _312;
    float _346 = _304 * _336;
    float _348 = -_304;
    float _350 = _348 + 1.0;
    float _352 = _276 * _330;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _358;
    float _362 = fma(_340, _352, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _364 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _366 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _368 = _292 * _344;
    float _370 = _362 * _346;
    float _372 = _364 * _346;
    float _374 = _366 * _346;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _388 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].x, _370);
    float _390 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _392 = fma(_382, _368, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _394 = fma(_386, _368, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _398 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[107].z, _374);
    float _400 = fma(_390, _332, _388);
    float _402 = fma(_392, _332, _396);
    float _404 = fma(_394, _332, _398);
    float _406 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].x, _400);
    float _408 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].y, _402);
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[109].z, _404);
    bool _412 = !_342;
    float _430;
    if (!_412)
    {
        float _414 = in.m_35.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_68);
        float _436 = 1.0 / _434;
        float _438 = _102 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _440 + _442;
    float _446 = _406 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_440);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = 1.0 / _450;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _478 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _480 = isnan(_440);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _492 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _496 = 1.0 / _458;
    float _498 = _454 * _472;
    bool _500 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _476;
    float _514 = -_470;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_440);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _488 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _554;
    float _558 = _544 * _496;
    float _560 = _470 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _440 + _564;
    float _568 = -_488;
    float _570 = _568 + 1.0;
    bool _572 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_440);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _556 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _440 + _590;
    float _594 = fma(_558, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _440 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_616, _612, _618);
    float _624 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _622);
    float _628 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _624;
    out.m_37.y = _614;
    out.m_37.z = _620;
    out.m_37.w = _628;
    bool _630 = !_494;
    float _648;
    if (!_630)
    {
        float _632 = in.m_35.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_68);
        float _654 = 1.0 / _652;
        float _656 = _102 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = in.m_35.y;
    float _662 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_39.x;
    float _666 = in.m_39.y;
    float _668 = in.m_39.z;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _672 = _670 != 0;
    float _674 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = in.m_33.x;
    float _682 = in.m_33.y;
    float _684 = in.m_33.z;
    float _686 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _688 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _690 = in.m_41.y;
    float _692 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _686);
    float _694 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _688);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _700 = in.m_43.z;
    float _702 = 1.0 / _698;
    float _704 = in.m_43.x;
    float _706 = in.m_43.y;
    bool _708 = _660 > 0.5;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _718 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _722 = 1.0 / _712;
    float _724 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _728 = _658 + _726;
    float _730 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = -_690;
    float _734 = _732 + 1.0;
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _680 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _740 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    out.m_45.z = _700;
    float _742 = _690;
    if (_678)
    {
        float _744 = _708 ? _734 : _690;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _752 = _658 + _750;
    out.m_45.x = _704;
    float _754 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _758 = _728 * _702;
    out.m_45.y = _706;
    float _760 = _752 * _722;
    float _762 = _736 * _714;
    float _764 = in.m_41.x;
    bool _766 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _768 = isnan(_658);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _720;
    bool _780 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_658);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _512;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    if (_672)
    {
        float _796 = in.m_35.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _804;
    float _808 = -_776;
    float _810 = _808 + 1.0;
    float _812 = _756 * _716;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _814;
    float _818 = fma(_802, _760, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _820 = fma(_806, _760, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _822 = _790 * _810;
    float _824 = fma(_816, _760, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _826 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_658);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_790;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = _836 * _840;
    float _856 = fma(_844, _758, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _758, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _862 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = _844;
    if (_672)
    {
        _794 = _764;
    }
    float _868 = _794;
    float _870 = _818 * _854;
    float _872 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _874 = _868;
    if (!_672)
    {
        _866 = _764;
    }
    float _876 = _866;
    float _878 = _820 * _854;
    float _880 = _824 * _854;
    float _882 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _872);
    bool _892 = _798 > 0.5;
    bool _894 = _892 && _672;
    float _896 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].x, _870);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].y, _878);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[123].z, _880);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _906 = _740 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _908 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _896);
    float _912 = _718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _906 + _908;
    float _918 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _922 = _912 + _914;
    float _924 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _926 = fma(_860, _822, _902);
    float _928 = _918 + _920;
    float _930 = _876;
    if (_894)
    {
        float _932 = -_868;
        float _934 = _932 + 1.0;
        _874 = _934;
    }
    float _936 = _874;
    float _938 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _924);
    float _942 = fma(_856, _822, _898);
    float _944 = fma(_858, _822, _900);
    float _946 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _950 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _940);
    if (_672)
    {
        _930 = _936;
    }
    float _956 = _930;
    float _958 = in.m_43.w;
    float _960 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _946);
    float _962 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _960);
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _962);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _982 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _984 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].x, _942);
    float _986 = _746 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].y, _944);
    float _990 = _970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _976);
    float _994 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[125].z, _926);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _978);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _980);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _982);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = _986 * _948;
    float _1006 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[5].z, _992);
    float _1010 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1012 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1018 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = _1002 * _964;
    float _1024 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1008);
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1016);
    float _1036 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1018);
    out.m_45.w = _958;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _1022;
    out.m_47.y = _1004;
    out.m_49.x = _1024;
    out.m_49.y = _1026;
    out.m_49.z = _1030;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1028;
    out.gl_Position.z = _1034;
    out.gl_Position.w = _1036;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

