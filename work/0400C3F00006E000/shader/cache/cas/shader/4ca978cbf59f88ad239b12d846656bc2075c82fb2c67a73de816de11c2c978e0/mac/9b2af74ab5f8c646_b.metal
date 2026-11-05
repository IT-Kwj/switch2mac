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
    bool _868 = false;
    bool _726 = false;
    bool _558 = false;
    bool _390 = false;
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
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_82);
        out.gl_Position.z = _1592;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    if (_96)
    {
        float _104 = float(_68);
        _102 = _104;
    }
    float _106 = _102;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
    bool _112 = _108 || _110;
    float _114 = 0.0;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _120 = _116 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1661 = as_type<float>(_122);
        out.gl_Position.z = _1661;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_33.w;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = _126;
    if (!_136)
    {
        float _152 = _126 * _126;
        float _154 = _152 * 0.5;
        _118 = _154;
    }
    float _156 = _118;
    float _158 = _156;
    if (!_136)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_136;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _126 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _126);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_136;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _126 * _204;
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
    float _232 = fma(_222, _138, _226);
    float _234 = fma(_222, _140, _228);
    float _236 = fma(_222, _142, _230);
    float _238 = fma(_232, _124, _144);
    float _240 = fma(_234, _124, _146);
    float _242 = fma(_236, _124, _148);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -_288;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_272);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _292;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _312 * _296;
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _276 * _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = in.m_33.x;
    float _336 = in.m_33.y;
    float _338 = in.m_33.z;
    float _340 = fma(_300, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _340 * _322;
    float _348 = _342 * _322;
    float _350 = _344 * _322;
    float _352 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].y, _354);
    float _362 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = _358 * _338;
    float _366 = _360 * _336;
    float _368 = _362 * _334;
    bool _370 = !_316;
    float _388;
    if (!_370)
    {
        float _372 = in.m_35.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_68);
        float _394 = 1.0 / _392;
        float _396 = _100 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _414 = isnan(_398);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _428 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_398);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _442;
    float _446 = -_422;
    float _448 = _446 + 1.0;
    bool _450 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_398);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _464 = 1.0 / _410;
    float _466 = 1.0 / _426;
    float _468 = _444 * _440;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = _438 * _448;
    float _476 = -_438;
    float _478 = _476 + 1.0;
    float _480 = fma(_468, _402, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _482;
    float _486 = _460 * _478;
    float _488 = _472 * _464;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _398 + _490;
    bool _494 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = isnan(_398);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _486;
    float _508 = -_460;
    float _510 = _508 + 1.0;
    float _512 = fma(_488, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _398 + _514;
    float _518 = _484 * _466;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _506);
    float _526 = fma(_518, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _528 = _422 * _522;
    float _530 = fma(_512, _474, _524);
    float _532 = fma(_526, _528, _530);
    float _534 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[118].x, _532);
    float _536 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _536;
    bool _538 = !_462;
    float _556;
    if (!_538)
    {
        float _540 = in.m_35.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_68);
        float _562 = 1.0 / _560;
        float _564 = _100 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_35.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_68);
        float _730 = 1.0 / _728;
        float _732 = _100 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _734 + _820;
    float _824 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _814);
    float _828 = _754 * _818;
    float _830 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _832 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _834 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_830, _828, _826);
    float _838 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _840 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[133].x, _836);
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _834;
    out.m_39.y = _844;
    out.m_39.z = _840;
    out.m_39.w = _846;
    bool _848 = !_794;
    float _866;
    if (!_848)
    {
        float _850 = in.m_35.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _866 = _864;
        _868 = true;
    }
    else
    {
        float _870 = float(_68);
        float _872 = 1.0 / _870;
        float _874 = _100 * _872;
        _866 = _874;
    }
    _868 = false;
    float _876 = _866;
    float _878 = in.m_35.w;
    float _880 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = in.m_41.x;
    float _884 = in.m_41.y;
    float _886 = in.m_41.z;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _890 = _888 != 0;
    float _892 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_35.y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _908 = _906 != 0;
    float _910 = in.m_35.x;
    float _912 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _920 = _918 != 0;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _924 = _878 > 0.5;
    float _926 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _928 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _932 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _926);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _928);
    float _940 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _942 = 1.0 / _936;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _956 = fma(_940, -2.0, _922);
    float _958 = 1.0 / _948;
    float _960 = -_952;
    float _962 = fma(_950, 2.0, _960);
    float _964 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _972 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _974 = _880 * _954;
    float _976 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _982;
    float _986 = 1.0 / _970;
    float _988 = _892 * _930;
    float _990 = _914;
    bool _992 = _924;
    if (_896)
    {
        float _994 = in.m_35.z;
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _984 * _942;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1004 = in.m_43.y;
    float _1006 = _976 * _944;
    float _1008 = 1.0 / _980;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1018 = _1002 * _958;
    float _1020 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1026 = 1.0 / _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1030 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1044;
    float _1048 = _1036 * _986;
    float _1050 = _1040 * _1008;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1056 = -_1004;
    float _1058 = _1056 + 1.0;
    bool _1060 = false;
    float _1062 = _1054;
    float _1064 = _1004;
    float _1066 = _1058;
    int _1068 = as_type<int>(_1032);
    if (_896)
    {
        bool _1070 = _996 > 0.5;
        _1060 = _1070;
    }
    bool _1072 = _1060;
    float _1074 = 1.0 / _1016;
    float _1076 = _1046 * _1026;
    float _1078 = _1024;
    if (!_920)
    {
        float _1080 = in.m_35.z;
        _1078 = _1080;
    }
    float _1082 = _1078;
    int _1084 = _924 ? as_type<int>(_1058) : as_type<int>(_1004);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1088 = _876 + _1086;
    if (_890)
    {
        bool _1090 = _910 > 0.5;
        _992 = _1090;
    }
    bool _1092 = _992;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = _1054 * _1042;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1098;
    float _1102 = _1096;
    if (!_920)
    {
        _1062 = _898;
    }
    float _1104 = _1062;
    float _1106 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1110 = _876 + _1108;
    float _1112 = _1104;
    if (_920)
    {
        _1112 = _910;
    }
    float _1114 = _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1118 = _876 + _1116;
    bool _1120 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1122 = isnan(_876);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1100 * _1074;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1136 = _876 + _1134;
    float _1138 = fma(_998, _1110, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1140 = _902 ? as_type<float>(_1084) : _1004;
    float _1142 = -_1130;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1018, _1136, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1148 = fma(_1048, _1088, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1152 = _876 + _1150;
    float _1154 = fma(_1050, _1118, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1158 = _876 + _1156;
    bool _1160 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1162 = isnan(_876);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = fma(_1076, _1152, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1174 = _898 > 0.5;
    float _1176 = fma(_1096, _1158, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1178 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_876);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1170 * _1144;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    if (_908)
    {
        float _1196 = _1174 ? _1058 : _1004;
        _1064 = _1196;
    }
    float _1198 = _1064;
    float _1200 = _904 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1202 = _1082;
    int _1204 = as_type<int>(_1198);
    if (!_920)
    {
        _1066 = _1082;
    }
    float _1206 = _1066;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1028);
    float _1210 = _1206;
    if (_920)
    {
        _1210 = _898;
    }
    float _1212 = _1210;
    float _1214 = fma(_1140, _1200, -0.5);
    if (_920)
    {
        _1202 = _898;
    }
    float _1216 = _1202;
    float _1218 = _1188 * _1194;
    bool _1220 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1222 = isnan(_876);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1188;
    float _1234 = _1232 + 1.0;
    bool _1236 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1238 = isnan(_876);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1252 = _876 + _1250;
    float _1254 = _1230 * _1234;
    float _1256 = -_1230;
    float _1258 = _1256 + 1.0;
    bool _1260 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1262 = isnan(_876);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = in.m_43.x;
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1248);
    float _1280 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1030);
    float _1282 = fma(_1132, _1252, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1284 = _1246 * _1258;
    bool _1286 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1288 = isnan(_876);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1302 = isnan(_876);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1270 * _1274;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1310 * _1316;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1330 = fma(_1318, _1198, -0.5);
    float _1332 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1334 = _1296 * _1326;
    float _1336 = -_1296;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1328);
    float _1342 = _1138 * _1334;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1346 = _1276;
    if (_890)
    {
        float _1348 = -_1276;
        float _1350 = _1348 + 1.0;
        _1204 = as_type<int>(_1350);
    }
    int _1352 = _1204;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1356 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_890)
    {
        _1102 = _1276;
    }
    float _1358 = _1102;
    float _1360 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1032);
    float _1362 = _1358;
    if (_896)
    {
        float _1364 = -_1276;
        float _1366 = _1364 + 1.0;
        _1068 = as_type<int>(_1366);
    }
    int _1368 = _1068;
    if (_890)
    {
        float _1370 = _1092 ? as_type<float>(_1352) : _1276;
        _1362 = _1370;
    }
    float _1372 = _1362;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1378 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = fma(_1146, _1322, _1354);
    float _1382 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1384 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    float _1386 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    float _1388 = -_1374;
    float _1390 = fma(_1356, 2.0, _1388);
    if (_896)
    {
        float _1392 = _1072 ? as_type<float>(_1368) : _1276;
        _1346 = _1392;
    }
    float _1394 = _1346;
    float _1396 = fma(_1378, -2.0, _1376);
    float _1398 = fma(_1148, _1312, _1380);
    float _1400 = fma(_1382, _1372, -0.5);
    float _1402 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1404 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1406 = -_100;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1410 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1278);
    float _1412 = -_1386;
    float _1414 = fma(_1384, _1330, _1412);
    float _1416 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1340);
    float _1418 = -_100;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    float _1422 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1332);
    float _1424 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1426 = fma(_1402, _1394, -0.5);
    float _1428 = fma(_1404, _1400, _1408);
    float _1430 = fma(_1154, _1284, _1398);
    float _1432 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1434 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1436 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1280);
    float _1438 = fma(_1416, _1426, _1420);
    float _1440 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1442 = _1432 + _1434;
    float _1444 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1448 = _972 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1452 = _1440 + _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1448 + _1446;
    float _1458 = fma(_1172, _1254, _1430);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1450);
    float _1462 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1466 = fma(_1176, _1218, _1458);
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1462);
    float _1472 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = fma(_1282, _1190, _1466);
    float _1480 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1470);
    float _1482 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1472);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1498 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1500 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    float _1502 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1492);
    float _1504 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1506 = -_1424;
    float _1508 = fma(_1422, _1214, _1506);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1500);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1502);
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = _1428 + 0.5;
    float _1522 = _1438 + 0.5;
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1478);
    float _1526 = _1414 + 0.5;
    float _1528 = _1508 + 0.5;
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1532 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1514);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1516);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1452;
    out.m_45.y = _1442;
    out.m_45.z = _1456;
    out.m_47.x = _1520;
    out.m_47.y = _1526;
    out.m_47.z = _1522;
    out.m_47.w = _1528;
    out.m_49.x = _1524;
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1536;
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
    bool _868 = false;
    bool _726 = false;
    bool _558 = false;
    bool _390 = false;
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
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_82);
        out.gl_Position.z = _1592;
    }
    if (!_72)
    {
        return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    if (_96)
    {
        float _104 = float(_68);
        _102 = _104;
    }
    float _106 = _102;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
    bool _112 = _108 || _110;
    float _114 = 0.0;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _120 = _116 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1661 = as_type<float>(_122);
        out.gl_Position.z = _1661;
    }
    if (_112)
    {
        return out;
    }
    float _124 = in.m_33.w;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = _126;
    if (!_136)
    {
        float _152 = _126 * _126;
        float _154 = _152 * 0.5;
        _118 = _154;
    }
    float _156 = _118;
    float _158 = _156;
    if (!_136)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_136;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _126 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _126);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_136;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _126 * _204;
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
    float _232 = fma(_222, _138, _226);
    float _234 = fma(_222, _140, _228);
    float _236 = fma(_222, _142, _230);
    float _238 = fma(_232, _124, _144);
    float _240 = fma(_234, _124, _146);
    float _242 = fma(_236, _124, _148);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -_288;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_272);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _292;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _312 * _296;
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _276 * _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = in.m_33.x;
    float _336 = in.m_33.y;
    float _338 = in.m_33.z;
    float _340 = fma(_300, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _340 * _322;
    float _348 = _342 * _322;
    float _350 = _344 * _322;
    float _352 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].y, _354);
    float _362 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = _358 * _338;
    float _366 = _360 * _336;
    float _368 = _362 * _334;
    bool _370 = !_316;
    float _388;
    if (!_370)
    {
        float _372 = in.m_35.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_68);
        float _394 = 1.0 / _392;
        float _396 = _100 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _414 = isnan(_398);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _428 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_398);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _442;
    float _446 = -_422;
    float _448 = _446 + 1.0;
    bool _450 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_398);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _464 = 1.0 / _410;
    float _466 = 1.0 / _426;
    float _468 = _444 * _440;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = _438 * _448;
    float _476 = -_438;
    float _478 = _476 + 1.0;
    float _480 = fma(_468, _402, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _482;
    float _486 = _460 * _478;
    float _488 = _472 * _464;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _398 + _490;
    bool _494 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = isnan(_398);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _486;
    float _508 = -_460;
    float _510 = _508 + 1.0;
    float _512 = fma(_488, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _398 + _514;
    float _518 = _484 * _466;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _506);
    float _526 = fma(_518, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _528 = _422 * _522;
    float _530 = fma(_512, _474, _524);
    float _532 = fma(_526, _528, _530);
    float _534 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[118].x, _532);
    float _536 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _536;
    bool _538 = !_462;
    float _556;
    if (!_538)
    {
        float _540 = in.m_35.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_68);
        float _562 = 1.0 / _560;
        float _564 = _100 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_35.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_68);
        float _730 = 1.0 / _728;
        float _732 = _100 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _734 + _820;
    float _824 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _814);
    float _828 = _754 * _818;
    float _830 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _832 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _834 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_830, _828, _826);
    float _838 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _840 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[133].x, _836);
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _834;
    out.m_39.y = _844;
    out.m_39.z = _840;
    out.m_39.w = _846;
    bool _848 = !_794;
    float _866;
    if (!_848)
    {
        float _850 = in.m_35.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _866 = _864;
        _868 = true;
    }
    else
    {
        float _870 = float(_68);
        float _872 = 1.0 / _870;
        float _874 = _100 * _872;
        _866 = _874;
    }
    _868 = false;
    float _876 = _866;
    float _878 = in.m_35.w;
    float _880 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = in.m_41.x;
    float _884 = in.m_41.y;
    float _886 = in.m_41.z;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _890 = _888 != 0;
    float _892 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_35.y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _908 = _906 != 0;
    float _910 = in.m_35.x;
    float _912 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _920 = _918 != 0;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _924 = _878 > 0.5;
    float _926 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _928 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _932 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _926);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _928);
    float _940 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _942 = 1.0 / _936;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _956 = fma(_940, -2.0, _922);
    float _958 = 1.0 / _948;
    float _960 = -_952;
    float _962 = fma(_950, 2.0, _960);
    float _964 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _972 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _974 = _880 * _954;
    float _976 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _982;
    float _986 = 1.0 / _970;
    float _988 = _892 * _930;
    float _990 = _914;
    bool _992 = _924;
    if (_896)
    {
        float _994 = in.m_35.z;
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _984 * _942;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1004 = in.m_43.y;
    float _1006 = _976 * _944;
    float _1008 = 1.0 / _980;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1018 = _1002 * _958;
    float _1020 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1026 = 1.0 / _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1030 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1044;
    float _1048 = _1036 * _986;
    float _1050 = _1040 * _1008;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1056 = -_1004;
    float _1058 = _1056 + 1.0;
    bool _1060 = false;
    float _1062 = _1054;
    float _1064 = _1004;
    float _1066 = _1058;
    int _1068 = as_type<int>(_1032);
    if (_896)
    {
        bool _1070 = _996 > 0.5;
        _1060 = _1070;
    }
    bool _1072 = _1060;
    float _1074 = 1.0 / _1016;
    float _1076 = _1046 * _1026;
    float _1078 = _1024;
    if (!_920)
    {
        float _1080 = in.m_35.z;
        _1078 = _1080;
    }
    float _1082 = _1078;
    int _1084 = _924 ? as_type<int>(_1058) : as_type<int>(_1004);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1088 = _876 + _1086;
    if (_890)
    {
        bool _1090 = _910 > 0.5;
        _992 = _1090;
    }
    bool _1092 = _992;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = _1054 * _1042;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1098;
    float _1102 = _1096;
    if (!_920)
    {
        _1062 = _898;
    }
    float _1104 = _1062;
    float _1106 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1110 = _876 + _1108;
    float _1112 = _1104;
    if (_920)
    {
        _1112 = _910;
    }
    float _1114 = _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1118 = _876 + _1116;
    bool _1120 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1122 = isnan(_876);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1100 * _1074;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1136 = _876 + _1134;
    float _1138 = fma(_998, _1110, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1140 = _902 ? as_type<float>(_1084) : _1004;
    float _1142 = -_1130;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1018, _1136, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1148 = fma(_1048, _1088, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1152 = _876 + _1150;
    float _1154 = fma(_1050, _1118, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1158 = _876 + _1156;
    bool _1160 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1162 = isnan(_876);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = fma(_1076, _1152, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1174 = _898 > 0.5;
    float _1176 = fma(_1096, _1158, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1178 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_876);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1170 * _1144;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    if (_908)
    {
        float _1196 = _1174 ? _1058 : _1004;
        _1064 = _1196;
    }
    float _1198 = _1064;
    float _1200 = _904 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1202 = _1082;
    int _1204 = as_type<int>(_1198);
    if (!_920)
    {
        _1066 = _1082;
    }
    float _1206 = _1066;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1028);
    float _1210 = _1206;
    if (_920)
    {
        _1210 = _898;
    }
    float _1212 = _1210;
    float _1214 = fma(_1140, _1200, -0.5);
    if (_920)
    {
        _1202 = _898;
    }
    float _1216 = _1202;
    float _1218 = _1188 * _1194;
    bool _1220 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1222 = isnan(_876);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1188;
    float _1234 = _1232 + 1.0;
    bool _1236 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1238 = isnan(_876);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1252 = _876 + _1250;
    float _1254 = _1230 * _1234;
    float _1256 = -_1230;
    float _1258 = _1256 + 1.0;
    bool _1260 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1262 = isnan(_876);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = in.m_43.x;
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1248);
    float _1280 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1030);
    float _1282 = fma(_1132, _1252, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1284 = _1246 * _1258;
    bool _1286 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1288 = isnan(_876);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1302 = isnan(_876);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1270 * _1274;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1310 * _1316;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1330 = fma(_1318, _1198, -0.5);
    float _1332 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1334 = _1296 * _1326;
    float _1336 = -_1296;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1328);
    float _1342 = _1138 * _1334;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1346 = _1276;
    if (_890)
    {
        float _1348 = -_1276;
        float _1350 = _1348 + 1.0;
        _1204 = as_type<int>(_1350);
    }
    int _1352 = _1204;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1356 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_890)
    {
        _1102 = _1276;
    }
    float _1358 = _1102;
    float _1360 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1032);
    float _1362 = _1358;
    if (_896)
    {
        float _1364 = -_1276;
        float _1366 = _1364 + 1.0;
        _1068 = as_type<int>(_1366);
    }
    int _1368 = _1068;
    if (_890)
    {
        float _1370 = _1092 ? as_type<float>(_1352) : _1276;
        _1362 = _1370;
    }
    float _1372 = _1362;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1378 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = fma(_1146, _1322, _1354);
    float _1382 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1384 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    float _1386 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    float _1388 = -_1374;
    float _1390 = fma(_1356, 2.0, _1388);
    if (_896)
    {
        float _1392 = _1072 ? as_type<float>(_1368) : _1276;
        _1346 = _1392;
    }
    float _1394 = _1346;
    float _1396 = fma(_1378, -2.0, _1376);
    float _1398 = fma(_1148, _1312, _1380);
    float _1400 = fma(_1382, _1372, -0.5);
    float _1402 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1404 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1406 = -_100;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1410 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1278);
    float _1412 = -_1386;
    float _1414 = fma(_1384, _1330, _1412);
    float _1416 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1340);
    float _1418 = -_100;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    float _1422 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1332);
    float _1424 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1426 = fma(_1402, _1394, -0.5);
    float _1428 = fma(_1404, _1400, _1408);
    float _1430 = fma(_1154, _1284, _1398);
    float _1432 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1434 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1436 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1280);
    float _1438 = fma(_1416, _1426, _1420);
    float _1440 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1442 = _1432 + _1434;
    float _1444 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1448 = _972 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1452 = _1440 + _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1448 + _1446;
    float _1458 = fma(_1172, _1254, _1430);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1450);
    float _1462 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1466 = fma(_1176, _1218, _1458);
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1462);
    float _1472 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = fma(_1282, _1190, _1466);
    float _1480 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1470);
    float _1482 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1472);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1498 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1500 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    float _1502 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1492);
    float _1504 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1506 = -_1424;
    float _1508 = fma(_1422, _1214, _1506);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1500);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1502);
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = _1428 + 0.5;
    float _1522 = _1438 + 0.5;
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1478);
    float _1526 = _1414 + 0.5;
    float _1528 = _1508 + 0.5;
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1532 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1514);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1516);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1452;
    out.m_45.y = _1442;
    out.m_45.z = _1456;
    out.m_47.x = _1520;
    out.m_47.y = _1526;
    out.m_47.z = _1522;
    out.m_47.w = _1528;
    out.m_49.x = _1524;
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1536;
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
    bool _868 = false;
    bool _726 = false;
    bool _558 = false;
    bool _390 = false;
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
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_82);
        out.gl_Position.z = _1592;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    if (_96)
    {
        float _104 = float(_68);
        _102 = _104;
    }
    float _106 = _102;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
    bool _112 = _108 || _110;
    float _114 = 0.0;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _120 = _116 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1661 = as_type<float>(_122);
        out.gl_Position.z = _1661;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_33.w;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = _126;
    if (!_136)
    {
        float _152 = _126 * _126;
        float _154 = _152 * 0.5;
        _118 = _154;
    }
    float _156 = _118;
    float _158 = _156;
    if (!_136)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_136;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _126 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _126);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_136;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _126 * _204;
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
    float _232 = fma(_222, _138, _226);
    float _234 = fma(_222, _140, _228);
    float _236 = fma(_222, _142, _230);
    float _238 = fma(_232, _124, _144);
    float _240 = fma(_234, _124, _146);
    float _242 = fma(_236, _124, _148);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -_288;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_272);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _292;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = _312 * _296;
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _276 * _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = in.m_33.x;
    float _336 = in.m_33.y;
    float _338 = in.m_33.z;
    float _340 = fma(_300, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_320, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = _340 * _322;
    float _348 = _342 * _322;
    float _350 = _344 * _322;
    float _352 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].y, _354);
    float _362 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = _358 * _338;
    float _366 = _360 * _336;
    float _368 = _362 * _334;
    bool _370 = !_316;
    float _388;
    if (!_370)
    {
        float _372 = in.m_35.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_68);
        float _394 = 1.0 / _392;
        float _396 = _100 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _412 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _414 = isnan(_398);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _428 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_398);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _442;
    float _446 = -_422;
    float _448 = _446 + 1.0;
    bool _450 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_398);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _464 = 1.0 / _410;
    float _466 = 1.0 / _426;
    float _468 = _444 * _440;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _474 = _438 * _448;
    float _476 = -_438;
    float _478 = _476 + 1.0;
    float _480 = fma(_468, _402, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _482;
    float _486 = _460 * _478;
    float _488 = _472 * _464;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _398 + _490;
    bool _494 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = isnan(_398);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _480 * _486;
    float _508 = -_460;
    float _510 = _508 + 1.0;
    float _512 = fma(_488, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = _398 + _514;
    float _518 = _484 * _466;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _506);
    float _526 = fma(_518, _516, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _528 = _422 * _522;
    float _530 = fma(_512, _474, _524);
    float _532 = fma(_526, _528, _530);
    float _534 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[118].x, _532);
    float _536 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _536;
    bool _538 = !_462;
    float _556;
    if (!_538)
    {
        float _540 = in.m_35.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_68);
        float _562 = 1.0 / _560;
        float _564 = _100 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_35.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_68);
        float _730 = 1.0 / _728;
        float _732 = _100 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _734 + _820;
    float _824 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _814);
    float _828 = _754 * _818;
    float _830 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _832 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _834 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = fma(_830, _828, _826);
    float _838 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _840 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[133].x, _836);
    float _844 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_39.x = _834;
    out.m_39.y = _844;
    out.m_39.z = _840;
    out.m_39.w = _846;
    bool _848 = !_794;
    float _866;
    if (!_848)
    {
        float _850 = in.m_35.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _866 = _864;
        _868 = true;
    }
    else
    {
        float _870 = float(_68);
        float _872 = 1.0 / _870;
        float _874 = _100 * _872;
        _866 = _874;
    }
    _868 = false;
    float _876 = _866;
    float _878 = in.m_35.w;
    float _880 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = in.m_41.x;
    float _884 = in.m_41.y;
    float _886 = in.m_41.z;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _890 = _888 != 0;
    float _892 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_35.y;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _908 = _906 != 0;
    float _910 = in.m_35.x;
    float _912 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _920 = _918 != 0;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _924 = _878 > 0.5;
    float _926 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _928 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _932 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _926);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _938 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _928);
    float _940 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _942 = 1.0 / _936;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _956 = fma(_940, -2.0, _922);
    float _958 = 1.0 / _948;
    float _960 = -_952;
    float _962 = fma(_950, 2.0, _960);
    float _964 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _972 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _938);
    float _974 = _880 * _954;
    float _976 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _982;
    float _986 = 1.0 / _970;
    float _988 = _892 * _930;
    float _990 = _914;
    bool _992 = _924;
    if (_896)
    {
        float _994 = in.m_35.z;
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _984 * _942;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1004 = in.m_43.y;
    float _1006 = _976 * _944;
    float _1008 = 1.0 / _980;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1018 = _1002 * _958;
    float _1020 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1026 = 1.0 / _1012;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1030 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1020);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1042 = 1.0 / _1024;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1044;
    float _1048 = _1036 * _986;
    float _1050 = _1040 * _1008;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1056 = -_1004;
    float _1058 = _1056 + 1.0;
    bool _1060 = false;
    float _1062 = _1054;
    float _1064 = _1004;
    float _1066 = _1058;
    int _1068 = as_type<int>(_1032);
    if (_896)
    {
        bool _1070 = _996 > 0.5;
        _1060 = _1070;
    }
    bool _1072 = _1060;
    float _1074 = 1.0 / _1016;
    float _1076 = _1046 * _1026;
    float _1078 = _1024;
    if (!_920)
    {
        float _1080 = in.m_35.z;
        _1078 = _1080;
    }
    float _1082 = _1078;
    int _1084 = _924 ? as_type<int>(_1058) : as_type<int>(_1004);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1088 = _876 + _1086;
    if (_890)
    {
        bool _1090 = _910 > 0.5;
        _992 = _1090;
    }
    bool _1092 = _992;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = _1054 * _1042;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1098;
    float _1102 = _1096;
    if (!_920)
    {
        _1062 = _898;
    }
    float _1104 = _1062;
    float _1106 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1110 = _876 + _1108;
    float _1112 = _1104;
    if (_920)
    {
        _1112 = _910;
    }
    float _1114 = _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1118 = _876 + _1116;
    bool _1120 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1122 = isnan(_876);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = _1100 * _1074;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1136 = _876 + _1134;
    float _1138 = fma(_998, _1110, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1140 = _902 ? as_type<float>(_1084) : _1004;
    float _1142 = -_1130;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1018, _1136, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1148 = fma(_1048, _1088, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1152 = _876 + _1150;
    float _1154 = fma(_1050, _1118, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1158 = _876 + _1156;
    bool _1160 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1162 = isnan(_876);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = fma(_1076, _1152, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1174 = _898 > 0.5;
    float _1176 = fma(_1096, _1158, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1178 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_876);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1170 * _1144;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    if (_908)
    {
        float _1196 = _1174 ? _1058 : _1004;
        _1064 = _1196;
    }
    float _1198 = _1064;
    float _1200 = _904 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1202 = _1082;
    int _1204 = as_type<int>(_1198);
    if (!_920)
    {
        _1066 = _1082;
    }
    float _1206 = _1066;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1028);
    float _1210 = _1206;
    if (_920)
    {
        _1210 = _898;
    }
    float _1212 = _1210;
    float _1214 = fma(_1140, _1200, -0.5);
    if (_920)
    {
        _1202 = _898;
    }
    float _1216 = _1202;
    float _1218 = _1188 * _1194;
    bool _1220 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1222 = isnan(_876);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1188;
    float _1234 = _1232 + 1.0;
    bool _1236 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1238 = isnan(_876);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1252 = _876 + _1250;
    float _1254 = _1230 * _1234;
    float _1256 = -_1230;
    float _1258 = _1256 + 1.0;
    bool _1260 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1262 = isnan(_876);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = in.m_43.x;
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1248);
    float _1280 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1030);
    float _1282 = fma(_1132, _1252, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1284 = _1246 * _1258;
    bool _1286 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1288 = isnan(_876);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1300 = _876 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1302 = isnan(_876);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1270 * _1274;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = _916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1310 * _1316;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1330 = fma(_1318, _1198, -0.5);
    float _1332 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1334 = _1296 * _1326;
    float _1336 = -_1296;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1328);
    float _1342 = _1138 * _1334;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1346 = _1276;
    if (_890)
    {
        float _1348 = -_1276;
        float _1350 = _1348 + 1.0;
        _1204 = as_type<int>(_1350);
    }
    int _1352 = _1204;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1356 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_890)
    {
        _1102 = _1276;
    }
    float _1358 = _1102;
    float _1360 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1032);
    float _1362 = _1358;
    if (_896)
    {
        float _1364 = -_1276;
        float _1366 = _1364 + 1.0;
        _1068 = as_type<int>(_1366);
    }
    int _1368 = _1068;
    if (_890)
    {
        float _1370 = _1092 ? as_type<float>(_1352) : _1276;
        _1362 = _1370;
    }
    float _1372 = _1362;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1378 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = fma(_1146, _1322, _1354);
    float _1382 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1384 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    float _1386 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    float _1388 = -_1374;
    float _1390 = fma(_1356, 2.0, _1388);
    if (_896)
    {
        float _1392 = _1072 ? as_type<float>(_1368) : _1276;
        _1346 = _1392;
    }
    float _1394 = _1346;
    float _1396 = fma(_1378, -2.0, _1376);
    float _1398 = fma(_1148, _1312, _1380);
    float _1400 = fma(_1382, _1372, -0.5);
    float _1402 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1404 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1406 = -_100;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[76].x, _962);
    float _1410 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1278);
    float _1412 = -_1386;
    float _1414 = fma(_1384, _1330, _1412);
    float _1416 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1340);
    float _1418 = -_100;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    float _1422 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1332);
    float _1424 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1426 = fma(_1402, _1394, -0.5);
    float _1428 = fma(_1404, _1400, _1408);
    float _1430 = fma(_1154, _1284, _1398);
    float _1432 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1434 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1436 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1280);
    float _1438 = fma(_1416, _1426, _1420);
    float _1440 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1442 = _1432 + _1434;
    float _1444 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1448 = _972 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1452 = _1440 + _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1448 + _1446;
    float _1458 = fma(_1172, _1254, _1430);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1450);
    float _1462 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1466 = fma(_1176, _1218, _1458);
    float _1468 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1462);
    float _1472 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1464);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = fma(_1282, _1190, _1466);
    float _1480 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1470);
    float _1482 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1472);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1494 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1498 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1500 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1490);
    float _1502 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1492);
    float _1504 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1506 = -_1424;
    float _1508 = fma(_1422, _1214, _1506);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1500);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1502);
    float _1518 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1520 = _1428 + 0.5;
    float _1522 = _1438 + 0.5;
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1478);
    float _1526 = _1414 + 0.5;
    float _1528 = _1508 + 0.5;
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1532 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1534 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1514);
    float _1536 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1516);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1452;
    out.m_45.y = _1442;
    out.m_45.z = _1456;
    out.m_47.x = _1520;
    out.m_47.y = _1526;
    out.m_47.z = _1522;
    out.m_47.w = _1528;
    out.m_49.x = _1524;
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1536;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

