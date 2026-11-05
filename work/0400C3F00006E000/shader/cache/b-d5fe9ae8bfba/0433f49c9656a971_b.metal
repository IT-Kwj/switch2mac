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
    bool _628 = false;
    bool _498 = false;
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
        float _1662 = as_type<float>(_82);
        out.gl_Position.z = _1662;
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
        float _1731 = as_type<float>(_122);
        out.gl_Position.z = _1731;
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
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _272 + _294;
    bool _298 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _300 = isnan(_272);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _284;
    bool _312 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_272);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_308;
    float _326 = _324 + 1.0;
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _322 * _326;
    float _344 = -_322;
    float _346 = _344 + 1.0;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _288;
    float _352 = _276 * _310;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _280 * _340;
    bool _364 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_272);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = _296 * _350;
    float _388 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _374 * _346;
    float _404 = fma(_380, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = _338 * _396;
    float _408 = fma(_400, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _410 = fma(_392, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_384, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _388 * _406;
    float _416 = in.m_33.x;
    float _418 = in.m_33.y;
    float _420 = in.m_33.z;
    float _422 = _376 * _406;
    float _424 = -_338;
    float _426 = _424 + 1.0;
    float _428 = _408 * _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _448 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_410, _402, _440);
    float _452 = fma(_444, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_412, _402, _446);
    float _456 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_404, _402, _438);
    float _460 = fma(_448, _342, _450);
    float _462 = fma(_452, _342, _454);
    float _464 = fma(_456, _342, _458);
    float _466 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].x, _464);
    float _472 = _466 * _418;
    float _474 = _468 * _420;
    float _476 = _470 * _416;
    bool _478 = !_348;
    float _496;
    if (!_478)
    {
        float _480 = in.m_35.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_68);
        float _502 = 1.0 / _500;
        float _504 = _100 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_506);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _532 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    bool _548 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = isnan(_506);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = 1.0 / _514;
    float _562 = -_526;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _568 = _542 * _564;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _530;
    float _576 = _546 * _560;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = _582 * _568;
    float _588 = -_558;
    float _590 = _588 + 1.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _506 + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = _526 * _590;
    float _600 = fma(_584, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_600, _598, _596);
    float _604 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _606 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _606;
    bool _608 = !_566;
    float _626;
    if (!_608)
    {
        float _610 = in.m_35.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_68);
        float _632 = 1.0 / _630;
        float _634 = _100 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _636 + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _678 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _680 = isnan(_636);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_652;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _676;
    float _696 = _688 * _692;
    float _698 = -_688;
    float _700 = _698 + 1.0;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _708 = 1.0 / _672;
    float _710 = _668 * _700;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = _656 * _694;
    float _718 = _640 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _724;
    float _728 = fma(_704, _718, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _730 = fma(_722, _718, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = _728 * _710;
    float _736 = _730 * _710;
    float _738 = _732 * _710;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].x, _734);
    float _754 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].y, _736);
    float _756 = fma(_742, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _758 = fma(_746, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _760 = fma(_750, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _762 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].z, _738);
    float _764 = fma(_756, _696, _752);
    float _766 = fma(_758, _696, _754);
    float _768 = fma(_760, _696, _762);
    float _770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].x, _764);
    float _772 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].y, _766);
    float _774 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].z, _768);
    bool _776 = !_706;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
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
        float _802 = _100 * _800;
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
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
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
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
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
        float _944 = _100 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_35.w;
    float _950 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _952 = in.m_41.x;
    float _954 = in.m_41.y;
    float _956 = in.m_41.z;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _966 = _964 != 0;
    float _968 = in.m_35.y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _972 = _970 != 0;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _978 = _976 != 0;
    float _980 = in.m_35.x;
    float _982 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _994 = _948 > 0.5;
    float _996 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1002 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1008 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1010 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _1006;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1020 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = fma(_1010, -2.0, _992);
    float _1028 = 1.0 / _1018;
    float _1030 = -_1022;
    float _1032 = fma(_1020, 2.0, _1030);
    float _1034 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1036 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _984);
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1008);
    float _1044 = _950 * _1024;
    float _1046 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1052;
    float _1056 = 1.0 / _1040;
    float _1058 = _962 * _1000;
    float _1060 = _984;
    bool _1062 = _994;
    if (_966)
    {
        float _1064 = in.m_35.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1054 * _1012;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1074 = in.m_43.y;
    float _1076 = _1046 * _1014;
    float _1078 = 1.0 / _1050;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1088 = _1072 * _1028;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1096 = 1.0 / _1082;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1102 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1112 = 1.0 / _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1114;
    float _1118 = _1106 * _1056;
    float _1120 = _1110 * _1078;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1126 = -_1074;
    float _1128 = _1126 + 1.0;
    bool _1130 = false;
    float _1132 = _1124;
    float _1134 = _1074;
    float _1136 = _1128;
    int _1138 = as_type<int>(_1102);
    if (_966)
    {
        bool _1140 = _1066 > 0.5;
        _1130 = _1140;
    }
    bool _1142 = _1130;
    float _1144 = 1.0 / _1086;
    float _1146 = _1116 * _1096;
    float _1148 = _1094;
    if (!_990)
    {
        float _1150 = in.m_35.z;
        _1148 = _1150;
    }
    float _1152 = _1148;
    int _1154 = _994 ? as_type<int>(_1128) : as_type<int>(_1074);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1158 = _946 + _1156;
    if (_960)
    {
        bool _1160 = _980 > 0.5;
        _1062 = _1160;
    }
    bool _1162 = _1062;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1166 = _1124 * _1112;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1168;
    float _1172 = _1166;
    if (!_990)
    {
        _1132 = _968;
    }
    float _1174 = _1132;
    float _1176 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1180 = _946 + _1178;
    float _1182 = _1174;
    if (_990)
    {
        _1182 = _980;
    }
    float _1184 = _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1188 = _946 + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1144;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1206 = _946 + _1204;
    float _1208 = fma(_1068, _1180, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1210 = _972 ? as_type<float>(_1154) : _1074;
    float _1212 = -_1200;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1088, _1206, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1218 = fma(_1118, _1158, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1222 = _946 + _1220;
    float _1224 = fma(_1120, _1188, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1228 = _946 + _1226;
    bool _1230 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1232 = isnan(_946);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_1146, _1222, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1244 = _968 > 0.5;
    float _1246 = fma(_1166, _1228, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1248 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1250 = isnan(_946);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = _1240 * _1214;
    float _1262 = -_1240;
    float _1264 = _1262 + 1.0;
    if (_978)
    {
        float _1266 = _1244 ? _1128 : _1074;
        _1134 = _1266;
    }
    float _1268 = _1134;
    float _1270 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1272 = _1152;
    int _1274 = as_type<int>(_1268);
    if (!_990)
    {
        _1136 = _1152;
    }
    float _1276 = _1136;
    float _1278 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1280 = _1276;
    if (_990)
    {
        _1280 = _968;
    }
    float _1282 = _1280;
    float _1284 = fma(_1210, _1270, -0.5);
    if (_990)
    {
        _1272 = _968;
    }
    float _1286 = _1272;
    float _1288 = _1258 * _1264;
    bool _1290 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1292 = isnan(_946);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -_1258;
    float _1304 = _1302 + 1.0;
    bool _1306 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1308 = isnan(_946);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = _946 + _1320;
    float _1324 = _1300 * _1304;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    bool _1330 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1332 = isnan(_946);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1316;
    float _1344 = _1342 + 1.0;
    float _1346 = in.m_43.x;
    float _1348 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1318);
    float _1350 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1100);
    float _1352 = fma(_1202, _1322, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1354 = _1316 * _1328;
    bool _1356 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1358 = isnan(_946);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1370 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1372 = isnan(_946);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1344;
    float _1384 = -_1340;
    float _1386 = _1384 + 1.0;
    float _1388 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = fma(_1388, _1268, -0.5);
    float _1402 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    float _1404 = _1366 * _1396;
    float _1406 = -_1366;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1412 = _1208 * _1404;
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1416 = _1346;
    if (_960)
    {
        float _1418 = -_1346;
        float _1420 = _1418 + 1.0;
        _1274 = as_type<int>(_1420);
    }
    int _1422 = _1274;
    float _1424 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1412);
    float _1426 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_960)
    {
        _1172 = _1346;
    }
    float _1428 = _1172;
    float _1430 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1102);
    float _1432 = _1428;
    if (_966)
    {
        float _1434 = -_1346;
        float _1436 = _1434 + 1.0;
        _1138 = as_type<int>(_1436);
    }
    int _1438 = _1138;
    if (_960)
    {
        float _1440 = _1162 ? as_type<float>(_1422) : _1346;
        _1432 = _1440;
    }
    float _1442 = _1432;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1448 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1450 = fma(_1216, _1392, _1424);
    float _1452 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1454 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1278);
    float _1456 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1026);
    float _1458 = -_1444;
    float _1460 = fma(_1426, 2.0, _1458);
    if (_966)
    {
        float _1462 = _1142 ? as_type<float>(_1438) : _1346;
        _1416 = _1462;
    }
    float _1464 = _1416;
    float _1466 = fma(_1448, -2.0, _1446);
    float _1468 = fma(_1218, _1382, _1450);
    float _1470 = fma(_1452, _1442, -0.5);
    float _1472 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1476 = -_100;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1032);
    float _1480 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1482 = -_1456;
    float _1484 = fma(_1454, _1400, _1482);
    float _1486 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1410);
    float _1488 = -_100;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1460);
    float _1492 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1402);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1496 = fma(_1472, _1464, -0.5);
    float _1498 = fma(_1474, _1470, _1478);
    float _1500 = fma(_1224, _1354, _1468);
    float _1502 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1504 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    float _1508 = fma(_1486, _1496, _1490);
    float _1510 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1512 = _1502 + _1504;
    float _1514 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1518 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = _1510 + _1514;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = _1518 + _1516;
    float _1528 = fma(_1242, _1324, _1500);
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1246, _1288, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1532);
    float _1542 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = fma(_1352, _1260, _1536);
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1540);
    float _1552 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1554 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1562 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1556);
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1574 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1576 = -_1494;
    float _1578 = fma(_1492, _1284, _1576);
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1566);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1568);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1570);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1588 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = _1498 + 0.5;
    float _1592 = _1508 + 0.5;
    float _1594 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1548);
    float _1596 = _1484 + 0.5;
    float _1598 = _1578 + 0.5;
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1580);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1582);
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1584);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1522;
    out.m_45.y = _1512;
    out.m_45.z = _1526;
    out.m_47.x = _1590;
    out.m_47.y = _1596;
    out.m_47.z = _1592;
    out.m_47.w = _1598;
    out.m_49.x = _1594;
    out.gl_Position.x = _1600;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1604;
    out.gl_Position.w = _1606;
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
    bool _628 = false;
    bool _498 = false;
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
        float _1662 = as_type<float>(_82);
        out.gl_Position.z = _1662;
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
        float _1731 = as_type<float>(_122);
        out.gl_Position.z = _1731;
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
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _272 + _294;
    bool _298 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _300 = isnan(_272);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _284;
    bool _312 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_272);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_308;
    float _326 = _324 + 1.0;
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _322 * _326;
    float _344 = -_322;
    float _346 = _344 + 1.0;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _288;
    float _352 = _276 * _310;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _280 * _340;
    bool _364 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_272);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = _296 * _350;
    float _388 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _374 * _346;
    float _404 = fma(_380, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = _338 * _396;
    float _408 = fma(_400, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _410 = fma(_392, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_384, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _388 * _406;
    float _416 = in.m_33.x;
    float _418 = in.m_33.y;
    float _420 = in.m_33.z;
    float _422 = _376 * _406;
    float _424 = -_338;
    float _426 = _424 + 1.0;
    float _428 = _408 * _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _448 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_410, _402, _440);
    float _452 = fma(_444, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_412, _402, _446);
    float _456 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_404, _402, _438);
    float _460 = fma(_448, _342, _450);
    float _462 = fma(_452, _342, _454);
    float _464 = fma(_456, _342, _458);
    float _466 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].x, _464);
    float _472 = _466 * _418;
    float _474 = _468 * _420;
    float _476 = _470 * _416;
    bool _478 = !_348;
    float _496;
    if (!_478)
    {
        float _480 = in.m_35.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_68);
        float _502 = 1.0 / _500;
        float _504 = _100 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_506);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _532 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    bool _548 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = isnan(_506);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = 1.0 / _514;
    float _562 = -_526;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _568 = _542 * _564;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _530;
    float _576 = _546 * _560;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = _582 * _568;
    float _588 = -_558;
    float _590 = _588 + 1.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _506 + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = _526 * _590;
    float _600 = fma(_584, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_600, _598, _596);
    float _604 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _606 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _606;
    bool _608 = !_566;
    float _626;
    if (!_608)
    {
        float _610 = in.m_35.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_68);
        float _632 = 1.0 / _630;
        float _634 = _100 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _636 + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _678 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _680 = isnan(_636);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_652;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _676;
    float _696 = _688 * _692;
    float _698 = -_688;
    float _700 = _698 + 1.0;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _708 = 1.0 / _672;
    float _710 = _668 * _700;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = _656 * _694;
    float _718 = _640 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _724;
    float _728 = fma(_704, _718, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _730 = fma(_722, _718, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = _728 * _710;
    float _736 = _730 * _710;
    float _738 = _732 * _710;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].x, _734);
    float _754 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].y, _736);
    float _756 = fma(_742, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _758 = fma(_746, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _760 = fma(_750, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _762 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].z, _738);
    float _764 = fma(_756, _696, _752);
    float _766 = fma(_758, _696, _754);
    float _768 = fma(_760, _696, _762);
    float _770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].x, _764);
    float _772 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].y, _766);
    float _774 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].z, _768);
    bool _776 = !_706;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
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
        float _802 = _100 * _800;
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
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
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
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
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
        float _944 = _100 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_35.w;
    float _950 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _952 = in.m_41.x;
    float _954 = in.m_41.y;
    float _956 = in.m_41.z;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _966 = _964 != 0;
    float _968 = in.m_35.y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _972 = _970 != 0;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _978 = _976 != 0;
    float _980 = in.m_35.x;
    float _982 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _994 = _948 > 0.5;
    float _996 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1002 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1008 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1010 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _1006;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1020 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = fma(_1010, -2.0, _992);
    float _1028 = 1.0 / _1018;
    float _1030 = -_1022;
    float _1032 = fma(_1020, 2.0, _1030);
    float _1034 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1036 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _984);
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1008);
    float _1044 = _950 * _1024;
    float _1046 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1052;
    float _1056 = 1.0 / _1040;
    float _1058 = _962 * _1000;
    float _1060 = _984;
    bool _1062 = _994;
    if (_966)
    {
        float _1064 = in.m_35.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1054 * _1012;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1074 = in.m_43.y;
    float _1076 = _1046 * _1014;
    float _1078 = 1.0 / _1050;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1088 = _1072 * _1028;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1096 = 1.0 / _1082;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1102 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1112 = 1.0 / _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1114;
    float _1118 = _1106 * _1056;
    float _1120 = _1110 * _1078;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1126 = -_1074;
    float _1128 = _1126 + 1.0;
    bool _1130 = false;
    float _1132 = _1124;
    float _1134 = _1074;
    float _1136 = _1128;
    int _1138 = as_type<int>(_1102);
    if (_966)
    {
        bool _1140 = _1066 > 0.5;
        _1130 = _1140;
    }
    bool _1142 = _1130;
    float _1144 = 1.0 / _1086;
    float _1146 = _1116 * _1096;
    float _1148 = _1094;
    if (!_990)
    {
        float _1150 = in.m_35.z;
        _1148 = _1150;
    }
    float _1152 = _1148;
    int _1154 = _994 ? as_type<int>(_1128) : as_type<int>(_1074);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1158 = _946 + _1156;
    if (_960)
    {
        bool _1160 = _980 > 0.5;
        _1062 = _1160;
    }
    bool _1162 = _1062;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1166 = _1124 * _1112;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1168;
    float _1172 = _1166;
    if (!_990)
    {
        _1132 = _968;
    }
    float _1174 = _1132;
    float _1176 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1180 = _946 + _1178;
    float _1182 = _1174;
    if (_990)
    {
        _1182 = _980;
    }
    float _1184 = _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1188 = _946 + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1144;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1206 = _946 + _1204;
    float _1208 = fma(_1068, _1180, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1210 = _972 ? as_type<float>(_1154) : _1074;
    float _1212 = -_1200;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1088, _1206, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1218 = fma(_1118, _1158, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1222 = _946 + _1220;
    float _1224 = fma(_1120, _1188, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1228 = _946 + _1226;
    bool _1230 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1232 = isnan(_946);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_1146, _1222, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1244 = _968 > 0.5;
    float _1246 = fma(_1166, _1228, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1248 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1250 = isnan(_946);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = _1240 * _1214;
    float _1262 = -_1240;
    float _1264 = _1262 + 1.0;
    if (_978)
    {
        float _1266 = _1244 ? _1128 : _1074;
        _1134 = _1266;
    }
    float _1268 = _1134;
    float _1270 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1272 = _1152;
    int _1274 = as_type<int>(_1268);
    if (!_990)
    {
        _1136 = _1152;
    }
    float _1276 = _1136;
    float _1278 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1280 = _1276;
    if (_990)
    {
        _1280 = _968;
    }
    float _1282 = _1280;
    float _1284 = fma(_1210, _1270, -0.5);
    if (_990)
    {
        _1272 = _968;
    }
    float _1286 = _1272;
    float _1288 = _1258 * _1264;
    bool _1290 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1292 = isnan(_946);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -_1258;
    float _1304 = _1302 + 1.0;
    bool _1306 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1308 = isnan(_946);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = _946 + _1320;
    float _1324 = _1300 * _1304;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    bool _1330 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1332 = isnan(_946);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1316;
    float _1344 = _1342 + 1.0;
    float _1346 = in.m_43.x;
    float _1348 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1318);
    float _1350 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1100);
    float _1352 = fma(_1202, _1322, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1354 = _1316 * _1328;
    bool _1356 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1358 = isnan(_946);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1370 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1372 = isnan(_946);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1344;
    float _1384 = -_1340;
    float _1386 = _1384 + 1.0;
    float _1388 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = fma(_1388, _1268, -0.5);
    float _1402 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    float _1404 = _1366 * _1396;
    float _1406 = -_1366;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1412 = _1208 * _1404;
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1416 = _1346;
    if (_960)
    {
        float _1418 = -_1346;
        float _1420 = _1418 + 1.0;
        _1274 = as_type<int>(_1420);
    }
    int _1422 = _1274;
    float _1424 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1412);
    float _1426 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_960)
    {
        _1172 = _1346;
    }
    float _1428 = _1172;
    float _1430 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1102);
    float _1432 = _1428;
    if (_966)
    {
        float _1434 = -_1346;
        float _1436 = _1434 + 1.0;
        _1138 = as_type<int>(_1436);
    }
    int _1438 = _1138;
    if (_960)
    {
        float _1440 = _1162 ? as_type<float>(_1422) : _1346;
        _1432 = _1440;
    }
    float _1442 = _1432;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1448 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1450 = fma(_1216, _1392, _1424);
    float _1452 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1454 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1278);
    float _1456 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1026);
    float _1458 = -_1444;
    float _1460 = fma(_1426, 2.0, _1458);
    if (_966)
    {
        float _1462 = _1142 ? as_type<float>(_1438) : _1346;
        _1416 = _1462;
    }
    float _1464 = _1416;
    float _1466 = fma(_1448, -2.0, _1446);
    float _1468 = fma(_1218, _1382, _1450);
    float _1470 = fma(_1452, _1442, -0.5);
    float _1472 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1476 = -_100;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1032);
    float _1480 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1482 = -_1456;
    float _1484 = fma(_1454, _1400, _1482);
    float _1486 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1410);
    float _1488 = -_100;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1460);
    float _1492 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1402);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1496 = fma(_1472, _1464, -0.5);
    float _1498 = fma(_1474, _1470, _1478);
    float _1500 = fma(_1224, _1354, _1468);
    float _1502 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1504 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    float _1508 = fma(_1486, _1496, _1490);
    float _1510 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1512 = _1502 + _1504;
    float _1514 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1518 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = _1510 + _1514;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = _1518 + _1516;
    float _1528 = fma(_1242, _1324, _1500);
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1246, _1288, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1532);
    float _1542 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = fma(_1352, _1260, _1536);
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1540);
    float _1552 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1554 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1562 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1556);
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1574 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1576 = -_1494;
    float _1578 = fma(_1492, _1284, _1576);
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1566);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1568);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1570);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1588 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = _1498 + 0.5;
    float _1592 = _1508 + 0.5;
    float _1594 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1548);
    float _1596 = _1484 + 0.5;
    float _1598 = _1578 + 0.5;
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1580);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1582);
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1584);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1522;
    out.m_45.y = _1512;
    out.m_45.z = _1526;
    out.m_47.x = _1590;
    out.m_47.y = _1596;
    out.m_47.z = _1592;
    out.m_47.w = _1598;
    out.m_49.x = _1594;
    out.gl_Position.x = _1600;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1604;
    out.gl_Position.w = _1606;
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
    bool _628 = false;
    bool _498 = false;
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
        float _1662 = as_type<float>(_82);
        out.gl_Position.z = _1662;
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
        float _1731 = as_type<float>(_122);
        out.gl_Position.z = _1731;
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
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = _272 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _272 + _294;
    bool _298 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _300 = isnan(_272);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = 1.0 / _284;
    bool _312 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_272);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_308;
    float _326 = _324 + 1.0;
    bool _328 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_272);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = 1.0 / _292;
    float _342 = _322 * _326;
    float _344 = -_322;
    float _346 = _344 + 1.0;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _288;
    float _352 = _276 * _310;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _280 * _340;
    bool _364 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_272);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_360, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = _296 * _350;
    float _388 = fma(_356, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _394 = -_374;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _374 * _346;
    float _404 = fma(_380, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = _338 * _396;
    float _408 = fma(_400, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _410 = fma(_392, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_384, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _414 = _388 * _406;
    float _416 = in.m_33.x;
    float _418 = in.m_33.y;
    float _420 = in.m_33.z;
    float _422 = _376 * _406;
    float _424 = -_338;
    float _426 = _424 + 1.0;
    float _428 = _408 * _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].z, _428);
    float _448 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_410, _402, _440);
    float _452 = fma(_444, _362, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_412, _402, _446);
    float _456 = fma(_432, _362, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_404, _402, _438);
    float _460 = fma(_448, _342, _450);
    float _462 = fma(_452, _342, _454);
    float _464 = fma(_456, _342, _458);
    float _466 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[146].x, _464);
    float _472 = _466 * _418;
    float _474 = _468 * _420;
    float _476 = _470 * _416;
    bool _478 = !_348;
    float _496;
    if (!_478)
    {
        float _480 = in.m_35.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_68);
        float _502 = 1.0 / _500;
        float _504 = _100 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_506);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _532 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    bool _548 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = isnan(_506);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = 1.0 / _514;
    float _562 = -_526;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _568 = _542 * _564;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _530;
    float _576 = _546 * _560;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = _582 * _568;
    float _588 = -_558;
    float _590 = _588 + 1.0;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _506 + _592;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = _526 * _590;
    float _600 = fma(_584, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_600, _598, _596);
    float _604 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _606 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _606;
    bool _608 = !_566;
    float _626;
    if (!_608)
    {
        float _610 = in.m_35.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_68);
        float _632 = 1.0 / _630;
        float _634 = _100 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _636 + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _678 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _680 = isnan(_636);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -_652;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _676;
    float _696 = _688 * _692;
    float _698 = -_688;
    float _700 = _698 + 1.0;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _708 = 1.0 / _672;
    float _710 = _668 * _700;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = _656 * _694;
    float _718 = _640 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _724;
    float _728 = fma(_704, _718, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _730 = fma(_722, _718, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = _728 * _710;
    float _736 = _730 * _710;
    float _738 = _732 * _710;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].x, _734);
    float _754 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].y, _736);
    float _756 = fma(_742, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _758 = fma(_746, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _760 = fma(_750, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _762 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[123].z, _738);
    float _764 = fma(_756, _696, _752);
    float _766 = fma(_758, _696, _754);
    float _768 = fma(_760, _696, _762);
    float _770 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].x, _764);
    float _772 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].y, _766);
    float _774 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[125].z, _768);
    bool _776 = !_706;
    float _794;
    if (!_776)
    {
        float _778 = in.m_35.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
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
        float _802 = _100 * _800;
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
    bool _864 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
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
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _924 = _920 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
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
        float _944 = _100 * _942;
        _936 = _944;
    }
    _938 = false;
    float _946 = _936;
    float _948 = in.m_35.w;
    float _950 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _952 = in.m_41.x;
    float _954 = in.m_41.y;
    float _956 = in.m_41.z;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _966 = _964 != 0;
    float _968 = in.m_35.y;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _972 = _970 != 0;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _978 = _976 != 0;
    float _980 = in.m_35.x;
    float _982 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _984 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _982);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _994 = _948 > 0.5;
    float _996 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1002 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1008 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1010 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1012 = 1.0 / _1006;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1020 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = fma(_1010, -2.0, _992);
    float _1028 = 1.0 / _1018;
    float _1030 = -_1022;
    float _1032 = fma(_1020, 2.0, _1030);
    float _1034 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1002);
    float _1036 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _984);
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1042 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1008);
    float _1044 = _950 * _1024;
    float _1046 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1052;
    float _1056 = 1.0 / _1040;
    float _1058 = _962 * _1000;
    float _1060 = _984;
    bool _1062 = _994;
    if (_966)
    {
        float _1064 = in.m_35.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1054 * _1012;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1074 = in.m_43.y;
    float _1076 = _1046 * _1014;
    float _1078 = 1.0 / _1050;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1088 = _1072 * _1028;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1096 = 1.0 / _1082;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1102 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1112 = 1.0 / _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1114;
    float _1118 = _1106 * _1056;
    float _1120 = _1110 * _1078;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1126 = -_1074;
    float _1128 = _1126 + 1.0;
    bool _1130 = false;
    float _1132 = _1124;
    float _1134 = _1074;
    float _1136 = _1128;
    int _1138 = as_type<int>(_1102);
    if (_966)
    {
        bool _1140 = _1066 > 0.5;
        _1130 = _1140;
    }
    bool _1142 = _1130;
    float _1144 = 1.0 / _1086;
    float _1146 = _1116 * _1096;
    float _1148 = _1094;
    if (!_990)
    {
        float _1150 = in.m_35.z;
        _1148 = _1150;
    }
    float _1152 = _1148;
    int _1154 = _994 ? as_type<int>(_1128) : as_type<int>(_1074);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1158 = _946 + _1156;
    if (_960)
    {
        bool _1160 = _980 > 0.5;
        _1062 = _1160;
    }
    bool _1162 = _1062;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1166 = _1124 * _1112;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1168;
    float _1172 = _1166;
    if (!_990)
    {
        _1132 = _968;
    }
    float _1174 = _1132;
    float _1176 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1180 = _946 + _1178;
    float _1182 = _1174;
    if (_990)
    {
        _1182 = _980;
    }
    float _1184 = _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1188 = _946 + _1186;
    bool _1190 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1192 = isnan(_946);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _1170 * _1144;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1206 = _946 + _1204;
    float _1208 = fma(_1068, _1180, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1210 = _972 ? as_type<float>(_1154) : _1074;
    float _1212 = -_1200;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1088, _1206, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1218 = fma(_1118, _1158, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1222 = _946 + _1220;
    float _1224 = fma(_1120, _1188, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1228 = _946 + _1226;
    bool _1230 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1232 = isnan(_946);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = fma(_1146, _1222, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1244 = _968 > 0.5;
    float _1246 = fma(_1166, _1228, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1248 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1250 = isnan(_946);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = _1240 * _1214;
    float _1262 = -_1240;
    float _1264 = _1262 + 1.0;
    if (_978)
    {
        float _1266 = _1244 ? _1128 : _1074;
        _1134 = _1266;
    }
    float _1268 = _1134;
    float _1270 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1272 = _1152;
    int _1274 = as_type<int>(_1268);
    if (!_990)
    {
        _1136 = _1152;
    }
    float _1276 = _1136;
    float _1278 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1280 = _1276;
    if (_990)
    {
        _1280 = _968;
    }
    float _1282 = _1280;
    float _1284 = fma(_1210, _1270, -0.5);
    if (_990)
    {
        _1272 = _968;
    }
    float _1286 = _1272;
    float _1288 = _1258 * _1264;
    bool _1290 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1292 = isnan(_946);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -_1258;
    float _1304 = _1302 + 1.0;
    bool _1306 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1308 = isnan(_946);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = _946 + _1320;
    float _1324 = _1300 * _1304;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    bool _1330 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1332 = isnan(_946);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1316;
    float _1344 = _1342 + 1.0;
    float _1346 = in.m_43.x;
    float _1348 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1318);
    float _1350 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1100);
    float _1352 = fma(_1202, _1322, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1354 = _1316 * _1328;
    bool _1356 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1358 = isnan(_946);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1370 = _946 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1372 = isnan(_946);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1344;
    float _1384 = -_1340;
    float _1386 = _1384 + 1.0;
    float _1388 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = fma(_1388, _1268, -0.5);
    float _1402 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1390);
    float _1404 = _1366 * _1396;
    float _1406 = -_1366;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1412 = _1208 * _1404;
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1416 = _1346;
    if (_960)
    {
        float _1418 = -_1346;
        float _1420 = _1418 + 1.0;
        _1274 = as_type<int>(_1420);
    }
    int _1422 = _1274;
    float _1424 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1412);
    float _1426 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_960)
    {
        _1172 = _1346;
    }
    float _1428 = _1172;
    float _1430 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1102);
    float _1432 = _1428;
    if (_966)
    {
        float _1434 = -_1346;
        float _1436 = _1434 + 1.0;
        _1138 = as_type<int>(_1436);
    }
    int _1438 = _1138;
    if (_960)
    {
        float _1440 = _1162 ? as_type<float>(_1422) : _1346;
        _1432 = _1440;
    }
    float _1442 = _1432;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1448 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1450 = fma(_1216, _1392, _1424);
    float _1452 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1454 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1278);
    float _1456 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1026);
    float _1458 = -_1444;
    float _1460 = fma(_1426, 2.0, _1458);
    if (_966)
    {
        float _1462 = _1142 ? as_type<float>(_1438) : _1346;
        _1416 = _1462;
    }
    float _1464 = _1416;
    float _1466 = fma(_1448, -2.0, _1446);
    float _1468 = fma(_1218, _1382, _1450);
    float _1470 = fma(_1452, _1442, -0.5);
    float _1472 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1476 = -_100;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1032);
    float _1480 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1482 = -_1456;
    float _1484 = fma(_1454, _1400, _1482);
    float _1486 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1410);
    float _1488 = -_100;
    float _1490 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1460);
    float _1492 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1402);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1496 = fma(_1472, _1464, -0.5);
    float _1498 = fma(_1474, _1470, _1478);
    float _1500 = fma(_1224, _1354, _1468);
    float _1502 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1504 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    float _1508 = fma(_1486, _1496, _1490);
    float _1510 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1512 = _1502 + _1504;
    float _1514 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1518 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = _1510 + _1514;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = _1518 + _1516;
    float _1528 = fma(_1242, _1324, _1500);
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1246, _1288, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1532);
    float _1542 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = fma(_1352, _1260, _1536);
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1540);
    float _1552 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1554 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1562 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1556);
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1574 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1576 = -_1494;
    float _1578 = fma(_1492, _1284, _1576);
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1566);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1568);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1570);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1588 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = _1498 + 0.5;
    float _1592 = _1508 + 0.5;
    float _1594 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1548);
    float _1596 = _1484 + 0.5;
    float _1598 = _1578 + 0.5;
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1580);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1582);
    float _1604 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1584);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _1522;
    out.m_45.y = _1512;
    out.m_45.z = _1526;
    out.m_47.x = _1590;
    out.m_47.y = _1596;
    out.m_47.z = _1592;
    out.m_47.w = _1598;
    out.m_49.x = _1594;
    out.gl_Position.x = _1600;
    out.gl_Position.y = _1602;
    out.gl_Position.z = _1604;
    out.gl_Position.w = _1606;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

