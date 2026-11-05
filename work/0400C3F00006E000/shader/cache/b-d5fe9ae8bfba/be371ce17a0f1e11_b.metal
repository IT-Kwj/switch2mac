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
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    bool _472 = false;
    bool _360 = false;
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
        float _2145 = as_type<float>(_92);
        out.gl_Position.z = _2145;
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
        float _2215 = as_type<float>(_130);
        out.gl_Position.z = _2215;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.x;
    float _134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _138 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _136 * _134;
    float _156 = 0.0;
    float _158 = _138;
    if (!_148)
    {
        float _160 = _138 * _138;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[20].x, _154);
    float _168 = _164;
    if (!_148)
    {
        float _170 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = in.m_35.x;
    float _176 = in.m_35.y;
    float _178 = in.m_35.z;
    float _180 = _166 * 6.283185482025146484375;
    float _182 = floor(_166);
    float _184 = _180 * 0.15915493667125701904296875;
    float _186 = _184 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = -_182;
    float _192 = _166 + _190;
    bool _194 = !_148;
    float _196 = _172;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _138 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _138);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _138 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _158 = _250;
    }
    float _252 = _158;
    float _254 = in.m_39.w;
    float _256 = in.m_30.x;
    float _258 = in.m_30.y;
    float _260 = in.m_30.z;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = fma(_188, 0.5, 0.5);
    bool _272 = _192 < 0.5;
    float _274 = float(_272);
    float _276 = -_192;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = !_264;
    int _284 = _282 ? 0 : 1;
    float _286 = -_274;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = -_270;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_284);
    float _296 = fma(_252, _174, _280);
    bool _298 = !_152;
    int _300 = _298 ? 0 : 1;
    float _302 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = !_268;
    int _306 = _304 ? 0 : 1;
    float _308 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _312 = fma(_252, _176, _302);
    int _314 = abs(_300);
    float _316 = fma(_252, _178, _308);
    int _318 = abs(_306);
    float _320 = float(_294);
    float _322 = float(_314);
    float _324 = fma(_316, _254, _260);
    float _326 = abs(_278);
    float _328 = _320 * _326;
    float _330 = fma(_296, _254, _256);
    float _332 = fma(_312, _254, _258);
    float _334 = float(_318);
    float _336 = fma(_322, _292, _328);
    float _338 = abs(_288);
    float _340 = fma(_334, _338, _336);
    bool _342 = !_310;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_76);
        float _364 = 1.0 / _362;
        float _366 = _110 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_384;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = 1.0 / _388;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = _400 * _404;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = _372 * _410;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = fma(_408, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    float _432 = fma(_424, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _434 = fma(_430, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = _426 * _414;
    float _438 = _434 * _414;
    float _440 = _432 * _414;
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _446 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _450 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    float _452 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].z, _446);
    bool _454 = !_412;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_76);
        float _476 = 1.0 / _474;
        float _478 = _110 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _490 = 1.0 / _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    bool _500 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _502 = isnan(_480);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _516 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_480);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _488;
    bool _530 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _532 = isnan(_480);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_510;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _494;
    float _550 = _498 * _490;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _552;
    float _556 = _514 * _528;
    bool _558 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_480);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_568;
    float _572 = _570 + 1.0;
    float _574 = _554 * _548;
    float _576 = _540 * _544;
    float _578 = -_540;
    float _580 = _578 + 1.0;
    bool _582 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_480);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _568 * _580;
    float _604 = _592 * _572;
    float _606 = -_592;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _480 + _610;
    bool _614 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _616 = isnan(_480);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _600;
    float _628 = -_526;
    float _630 = _628 + 1.0;
    float _632 = _526 * _608;
    float _634 = fma(_550, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _640 = _624 * _630;
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = 1.0 / _596;
    float _648 = _634 * _640;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _656 = _480 + _654;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = fma(_574, _656, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _662 = 1.0 / _638;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _480 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _672 = fma(_556, _666, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _674;
    float _678 = _652 * _646;
    float _680 = fma(_672, _632, _658);
    float _682 = _676 * _626;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _480 + _684;
    bool _688 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _690 = isnan(_480);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _702 = _480 + _700;
    float _704 = fma(_660, _604, _680);
    float _706 = fma(_678, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _708 = _670 * _662;
    float _710 = fma(_682, _702, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _718 = _480 + _716;
    float _720 = fma(_706, _602, _704);
    float _722 = _510 * _714;
    float _724 = fma(_708, _718, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _726 = fma(_710, _576, _720);
    float _728 = fma(_724, _722, _726);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[121].x, _728);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = in.m_39.x;
    float _748 = in.m_39.y;
    float _750 = in.m_39.z;
    out.m_41.x = _738;
    out.m_41.y = _742;
    out.m_41.z = _744;
    out.m_41.w = _740;
    float _752 = _452 * _750;
    float _754 = _450 * _748;
    float _756 = _448 * _746;
    bool _758 = !_546;
    float _774;
    if (!_758)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _762 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _766 = _764 * _760;
        float _768 = floor(_766);
        float _770 = -_768;
        float _772 = _766 + _770;
        _774 = _772;
        _776 = true;
    }
    else
    {
        float _778 = float(_76);
        float _780 = 1.0 / _778;
        float _782 = _110 * _780;
        _774 = _782;
    }
    _776 = false;
    float _784 = _774;
    float _786 = in.m_37.y;
    float _788 = _132 * 2.0;
    float _790 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = in.m_37.z;
    float _794 = in.m_37.w;
    float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _800 = _798 != 0;
    float _802 = in.m_43.y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _812 = _810 != 0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _816 = 1.0 + _814;
    float _818 = floor(_788);
    float _820 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _822 = in.m_43.x;
    float _824 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _828 = _786 * 2.0;
    bool _830 = _786 > 0.5;
    float _832 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = 1.0 / _816;
    bool _836 = _794 > 0.5;
    float _838 = fma(_832, -2.0, _826);
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = floor(_828);
    int _852 = _836 ? as_type<int>(_842) : as_type<int>(_802);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _856 = _830 ? as_type<int>(_842) : as_type<int>(_802);
    float _858 = _800 ? as_type<float>(_852) : _802;
    bool _860 = _818 > 0.0;
    float _862 = _806 ? as_type<float>(_856) : _802;
    bool _864 = _818 >= 0.0;
    bool _866 = isnan(_818);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = 0.0;
    float _876 = _802;
    float _878 = 1.0;
    float _880 = _822;
    if (!_848)
    {
        _874 = _792;
    }
    float _882 = _874;
    int _884 = _872 ? 0 : 1;
    bool _886 = _850 > 0.0;
    bool _888 = _850 >= 0.0;
    bool _890 = isnan(_850);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = _792 > 0.5;
    int _900 = _896 ? 0 : 1;
    int _902 = ~_884;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    int _908 = ~_900;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906;
    int _916 = _912;
    float _918 = _882;
    if (_812)
    {
        float _920 = _898 ? _842 : _802;
        _876 = _920;
    }
    float _922 = _876;
    if (!_860)
    {
        int _924 = ~_884;
        int _926 = _924 + 1;
        _914 = _926;
    }
    int _928 = _914;
    if (!_886)
    {
        int _930 = ~_900;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = in.m_47.x;
    float _938 = in.m_47.y;
    float _940 = in.m_47.z;
    float _942 = 0.0;
    if (!_848)
    {
        _942 = _786;
    }
    float _944 = _942;
    float _946 = 0.0;
    float _948 = _944;
    if (!_848)
    {
        _946 = _792;
    }
    float _950 = _946;
    float _952 = 0.0;
    float _954 = _950;
    if (_848)
    {
        _952 = _792;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _956;
    if (_848)
    {
        _958 = _132;
    }
    float _962 = _958;
    float _964 = _962;
    if (_848)
    {
        _878 = _786;
    }
    float _966 = _878;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _978 = _976 != 0;
    float _980 = _966;
    bool _982 = _978;
    if (_848)
    {
        _918 = _786;
    }
    float _984 = _918;
    if (_848)
    {
        _954 = _786;
    }
    float _986 = _954;
    if (!_848)
    {
        _960 = _786;
    }
    float _988 = _960;
    if (!_848)
    {
        _964 = _792;
    }
    float _990 = _964;
    if (_848)
    {
        _948 = _132;
    }
    float _992 = _948;
    if (!_848)
    {
        _980 = _132;
    }
    float _994 = _980;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1006 = _1004 != 0;
    float _1008 = _992 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1012 = _1010 != 0;
    float _1014 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = -_854;
    float _1020 = fma(_1008, 2.0, _1018);
    float _1022 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1030 = !_974;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = 1.0 / _1028;
    float _1048 = 0.0;
    if (_1006)
    {
        float _1050 = in.m_37.z;
        _1048 = _1050;
    }
    float _1052 = _1048;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1058 = !_978;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1066 = 1.0 / _1056;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = -_1064;
    float _1076 = fma(_1034, 2.0, _1074);
    float _1078 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _808);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1084 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1086 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1024);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _132 + _786;
    float _1092 = _1072 * _1046;
    float _1094 = _792 * 2.0;
    int _1096 = abs(_1032);
    float _1098 = _1090 + (-1.0);
    float _1100 = float(_928);
    float _1102 = _994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1104 = _1082 * _1066;
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _132 + _792;
    float _1110 = _786 + _792;
    float _1112 = floor(_1094);
    float _1114 = _1108 + (-1.0);
    float _1116 = _1110 + (-1.0);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1006)
    {
        bool _1120 = _1052 > 0.5;
        _982 = _1120;
    }
    bool _1122 = _982;
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _784 + _1126;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1132 = fma(_1118, _862, -0.5);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1136 = _784 + _1134;
    float _1138 = fma(_1104, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1140 = _796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = fma(_1092, _1136, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _990 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1146 = fma(_858, _1140, -0.5);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1150 = float(_1096);
    float _1152 = _1078 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1154 = !_970;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = -_1148;
    float _1160 = fma(_1144, 2.0, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1164 = _1112 >= 0.0;
    bool _1166 = isnan(_1112);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    float _1174 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1176 = abs(_1060);
    float _1178 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1180 = _1150 * _1100;
    float _1182 = in.m_49.x;
    float _1184 = in.m_49.y;
    float _1186 = in.m_49.z;
    float _1188 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1190 = log2(_1188);
    int _1192 = _1172 ? 0 : 1;
    float _1194 = _1180 * (-2.0);
    bool _1196 = _1112 > 0.0;
    float _1198 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1200 = fma(_1130, _1194, _1130);
    float _1202 = -_110;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1160);
    int _1206 = ~_1192;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = -_110;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1218 = abs(_1156);
    float _1220 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1178);
    float _1222 = float(_1176);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1226 = _1210;
    float _1228 = _1112;
    if (!_1196)
    {
        int _1230 = ~_1192;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = float(_934);
    float _1240 = fma(_1102, -2.0, _1216);
    float _1242 = float(_1218);
    float _1244 = fma(_1236, -2.0, _1224);
    float _1246 = fma(_1194, _1184, _1184);
    float _1248 = _1190 * _110;
    float _1250 = float(_1234);
    float _1252 = _1222 * _1238;
    float _1254 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1240);
    float _1256 = exp2(_1248);
    float _1258 = _1242 * _1250;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1262);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1272 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1276 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1266);
    float _1278 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1270);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _1152 + _1280;
    float _1284 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1286 = -_110;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1076);
    float _1290 = -_1256;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1274);
    bool _1296 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1310 = _1174 + _1308;
    float _1312 = _1282 * _1282;
    float _1314 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1276);
    float _1316 = _1304 ? _1292 : 0.0;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1198 + _1318;
    float _1322 = fma(_1310, _1310, _1312);
    float _1324 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1260);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1278);
    float _1328 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1268);
    float _1330 = fma(_1320, _1320, _1322);
    float _1332 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1002);
    float _1336 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1294);
    float _1338 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1244);
    bool _1340 = _1304;
    int _1342 = as_type<int>(_1320);
    if (_1044)
    {
        float _1344 = _1316 * _834;
        _112 = _1344;
    }
    float _1346 = _112;
    float _1348 = rsqrt(_1330);
    if (_1000)
    {
        bool _1350 = _132 > 0.5;
        _1340 = _1350;
    }
    bool _1352 = _1340;
    float _1354 = _132 + (-0.5);
    float _1356 = _1258 * (-2.0);
    float _1358 = _786 + (-0.5);
    float _1360 = _1252 * (-2.0);
    bool _1362 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1364 = isnan(_784);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = fma(_1356, _1182, _1182);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1246);
    float _1378 = _1326 * (-0.15915493667125701904296875);
    float _1380 = fma(_1106, _1356, _1106);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1374);
    float _1384 = fma(_1200, _1346, _1376);
    float _1386 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1388 = fma(_1360, _1186, _1186);
    bool _1390 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1392 = isnan(_784);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = _1384 * 0.15915493667125701904296875;
    float _1404 = _1386 * _1348;
    bool _1406 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_784);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1372;
    float _1420 = _1418 + 1.0;
    float _1422 = -_1400;
    float _1424 = _1422 + 1.0;
    float _1426 = _1282 * _1404;
    float _1428 = _1310 * _1404;
    float _1430 = _1416 * _1420;
    float _1432 = _1378 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = -_1426;
    float _1438 = _1282 + _1436;
    float _1440 = _1372 * _1424;
    float _1442 = fma(_1380, _1346, _1382);
    float _1444 = _792 + (-0.5);
    float _1446 = _1438 * _1438;
    float _1448 = _1444;
    float _1450 = _1426;
    if (!_1000)
    {
        _1228 = _822;
    }
    float _1452 = _1228;
    float _1454 = _1442 * 0.15915493667125701904296875;
    float _1456 = _1378 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = -_1416;
    float _1462 = _1460 + 1.0;
    float _1464 = fma(_1124, _1360, _1124);
    float _1466 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1468 = _1452;
    if (!_1006)
    {
        _1448 = _822;
    }
    float _1470 = _1448;
    float _1472 = _1336 * (-0.15915493667125701904296875);
    float _1474 = -_1338;
    float _1476 = fma(_1220, _1146, _1474);
    float _1478 = fma(_1464, _1346, _1466);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1482 = -_1428;
    float _1484 = _1310 + _1482;
    float _1486 = _1142 * _1430;
    float _1488 = _1320 * _1404;
    float _1490 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = fma(_1484, _1484, _1446);
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1486);
    float _1496 = -_1488;
    float _1498 = _1320 + _1496;
    int _1500 = as_type<int>(_1498);
    int _1502 = as_type<int>(_1484);
    float _1504 = _1470;
    if (_1000)
    {
        float _1506 = -_822;
        float _1508 = _1506 + 1.0;
        _1342 = as_type<int>(_1508);
    }
    int _1510 = _1342;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1514 = fma(_1138, _1440, _1494);
    float _1516 = fma(_1498, _1498, _1492);
    float _1518 = _1478 * 0.15915493667125701904296875;
    if (_1000)
    {
        float _1520 = _1352 ? as_type<float>(_1510) : _822;
        _1468 = _1520;
    }
    float _1522 = _1468;
    float _1524 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1514);
    if (_1006)
    {
        float _1526 = -_822;
        float _1528 = _1526 + 1.0;
        _1500 = as_type<int>(_1528);
    }
    int _1530 = _1500;
    float _1532 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = sqrt(_1516);
    if (_1012)
    {
        float _1536 = -_822;
        float _1538 = _1536 + 1.0;
        _1502 = as_type<int>(_1538);
    }
    int _1540 = _1502;
    float _1542 = fma(_1532, _1522, -0.5);
    if (_1006)
    {
        float _1544 = _1122 ? as_type<float>(_1530) : _822;
        _1504 = _1544;
    }
    float _1546 = _1504;
    if (_1012)
    {
        float _1548 = _830 ? as_type<float>(_1540) : _822;
        _880 = _1548;
    }
    float _1550 = _880;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1556 = fma(_1554, _922, -0.5);
    float _1558 = _1402 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1348 * _1534;
    float _1564 = _1490 * _1562;
    float _1566 = _1402 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    float _1570 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1572 = _1434 * _1132;
    float _1574 = _1458 * _1132;
    float _1576 = _1564 * _1068;
    float _1578 = fma(_1570, _1546, -0.5);
    float _1580 = -_1572;
    float _1582 = fma(_1458, _1542, _1580);
    float _1584 = fma(_1434, _1542, _1574);
    float _1586 = _1454 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _820 * _1562;
    float _1592 = _824 * _1562;
    float _1594 = fma(_1334, _1578, _1214);
    float _1596 = _1590 * _1062;
    float _1598 = _1592 * _996;
    float _1600 = fma(_1332, _1582, _1288);
    float _1602 = _1454 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = -_1284;
    float _1608 = fma(_1306, _1584, _1606);
    float _1610 = _1518 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1588 * _1560;
    float _1616 = _1518 * 6.283185482025146484375;
    float _1618 = sin(_1616);
    float _1620 = _1604 * _1568;
    float _1622 = _1604 * _1560;
    float _1624 = _1612 * _1576;
    float _1626 = _1560 * _1612;
    float _1628 = _1568 * _1612;
    float _1630 = _1588 * _1568;
    float _1632 = _1604 * _1624;
    float _1634 = _1588 * _1624;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1638 = fma(_1618, _1620, _1614);
    float _1640 = -_1576;
    float _1642 = _1618 * _1640;
    float _1644 = fma(_1638, _1596, _1632);
    float _1646 = -_1630;
    float _1648 = fma(_1618, _1622, _1646);
    float _1650 = fma(_1628, _1596, _1642);
    float _1652 = -_1622;
    float _1654 = fma(_1618, _1630, _1652);
    float _1656 = fma(_1618, _1614, _1620);
    float _1658 = fma(_1648, _1598, _1644);
    float _1660 = fma(_1626, _1598, _1650);
    float _1662 = fma(_1654, _1596, _1634);
    float _1664 = -_1426;
    float _1666 = _1152 + _1664;
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1672 = fma(_1656, _1598, _1662);
    float _1674 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1676 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1668);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1670);
    float _1680 = -_1428;
    float _1682 = _1174 + _1680;
    float _1684 = fma(_1674, _1550, -0.5);
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1688 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1678);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1694 = _1198 + _1686;
    float _1696 = _1174 + _1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1690);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1692);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = -_1488;
    float _1712 = _1198 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = _1472 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1700);
    float _1722 = fma(_1708, _1708, _1714);
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = sqrt(_1722);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1742 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1744 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1746 = 1.0 / _1730;
    out.m_51.x = _1732;
    out.m_51.y = _1736;
    out.m_51.z = _1738;
    out.m_51.w = _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1744);
    float _1752 = _1718 * _1556;
    float _1754 = _1748 + _1730;
    float _1756 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1750);
    float _1758 = _1472 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    bool _1762 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1152 + _1756;
    float _1766 = _1754 * _1746;
    float _1768 = _1766 * 0.5;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1772 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1776 = _1696;
    float _1778 = _1694;
    if (!_1762)
    {
        _1774 = _1764;
    }
    float _1780 = _1774;
    float _1782 = _1760 * _1556;
    float _1784 = -_1752;
    float _1786 = fma(_1760, _1684, _1784);
    float _1788 = fma(_1718, _1684, _1782);
    float _1790 = fma(_1328, _1786, _1204);
    bool _1792 = !_1762;
    float _1794 = _1780;
    if (!_1792)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1800 = _1734 + _1798;
        float _1802 = _1764 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = rsqrt(_1722);
        float _1806 = _1800 * _1796;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1808 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1808 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = _1812 + (-1.0);
        float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = fma(_1816, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1824 = fma(_1764, _1812, _1820);
        float _1826 = _1804 * _1822;
        float _1828 = fma(_1708, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1830 = fma(_1704, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1794 = _1824;
        _1776 = _1828;
        _1778 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1776;
    float _1836 = _1778;
    float _1838 = 1.0 / _1772;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1848 = _1844 || _1846;
    float _1850 = -_1426;
    float _1852 = _1850 + _1832;
    float _1854 = -_1428;
    float _1856 = _1854 + _1834;
    float _1858 = -_1254;
    float _1860 = fma(_1314, _1788, _1858);
    float _1862 = -_1488;
    float _1864 = _1862 + _1836;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1866);
    float _1876 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1868);
    float _1878 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1882 = _1872;
    if (_1848)
    {
        _1882 = 1.0;
    }
    float _1884 = _1882;
    float _1886 = _1884;
    if (_1848)
    {
        _1450 = 1.0;
    }
    float _1888 = _1450;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1892 = _1838 * _1890;
    float _1894 = _1888;
    if (!_1848)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = 1.0 / _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1930 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1928;
        float _1932 = 1.0 / _1930;
        float _1934 = _1922 * _1926;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1892, _1934, _1936);
        float _1940 = _1938 * _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1886 = _1942;
    }
    float _1944 = _1886;
    if (!_1848)
    {
        float _1946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1948 * 0.15915493667125701904296875;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1950 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = 1.0 / _1956;
        float _1964 = _1952 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = _1960 * _1962;
        float _1970 = _1952 * 6.283185482025146484375;
        float _1972 = sin(_1970);
        float _1974 = _1966 * _1968;
        float _1976 = 1.0 / _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1978;
        float _1982 = 1.0 / _1980;
        float _1984 = _1972 * _1976;
        float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1988 = fma(_1892, _1984, _1986);
        float _1990 = _1988 * _1982;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = -_1992;
        float _1996 = _1994 + 1.0;
        _1894 = _1996;
    }
    float _1998 = _1894;
    float _2000 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _2002 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _2004 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _2006 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2014 = _1944 * _1998;
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2020 = _1944 > 0.0;
    bool _2022 = isnan(_1944);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    float _2030 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2032 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2034 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2036 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2038 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2034);
    float _2044 = _2014 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2030);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2042);
    bool _2054 = _1998 <= 0.0;
    bool _2056 = !_2028;
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2062 = _340 * _2044;
    float _2064 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2066 = _2048 + _2052;
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2070 = _1594 + 0.5;
    float _2072 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2074 = _1600 + 0.5;
    float _2076 = _1608 + 0.5;
    float _2078 = _1476 + 0.5;
    float _2080 = _1790 + 0.5;
    float _2082 = _1860 + 0.5;
    float _2084 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2086 = _2066 * 0.5;
    out.m_53.x = _2074;
    out.m_53.y = _2076;
    out.m_53.z = _2070;
    out.m_53.w = _2078;
    out.m_55.x = _2080;
    out.m_55.y = _2082;
    out.m_33.x = _2084;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2048;
    out.gl_Position.w = _2052;
    out.m_57.z = _2086;
    out.m_57.w = _2052;
    if (!_2058)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2088 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2088;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    bool _472 = false;
    bool _360 = false;
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
        float _2145 = as_type<float>(_92);
        out.gl_Position.z = _2145;
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
        float _2215 = as_type<float>(_130);
        out.gl_Position.z = _2215;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_37.x;
    float _134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _138 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _136 * _134;
    float _156 = 0.0;
    float _158 = _138;
    if (!_148)
    {
        float _160 = _138 * _138;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[20].x, _154);
    float _168 = _164;
    if (!_148)
    {
        float _170 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = in.m_35.x;
    float _176 = in.m_35.y;
    float _178 = in.m_35.z;
    float _180 = _166 * 6.283185482025146484375;
    float _182 = floor(_166);
    float _184 = _180 * 0.15915493667125701904296875;
    float _186 = _184 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = -_182;
    float _192 = _166 + _190;
    bool _194 = !_148;
    float _196 = _172;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _138 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _138);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _138 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _158 = _250;
    }
    float _252 = _158;
    float _254 = in.m_39.w;
    float _256 = in.m_30.x;
    float _258 = in.m_30.y;
    float _260 = in.m_30.z;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = fma(_188, 0.5, 0.5);
    bool _272 = _192 < 0.5;
    float _274 = float(_272);
    float _276 = -_192;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = !_264;
    int _284 = _282 ? 0 : 1;
    float _286 = -_274;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = -_270;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_284);
    float _296 = fma(_252, _174, _280);
    bool _298 = !_152;
    int _300 = _298 ? 0 : 1;
    float _302 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = !_268;
    int _306 = _304 ? 0 : 1;
    float _308 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _312 = fma(_252, _176, _302);
    int _314 = abs(_300);
    float _316 = fma(_252, _178, _308);
    int _318 = abs(_306);
    float _320 = float(_294);
    float _322 = float(_314);
    float _324 = fma(_316, _254, _260);
    float _326 = abs(_278);
    float _328 = _320 * _326;
    float _330 = fma(_296, _254, _256);
    float _332 = fma(_312, _254, _258);
    float _334 = float(_318);
    float _336 = fma(_322, _292, _328);
    float _338 = abs(_288);
    float _340 = fma(_334, _338, _336);
    bool _342 = !_310;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_76);
        float _364 = 1.0 / _362;
        float _366 = _110 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_384;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = 1.0 / _388;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = _400 * _404;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = _372 * _410;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = fma(_408, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    float _432 = fma(_424, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _434 = fma(_430, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = _426 * _414;
    float _438 = _434 * _414;
    float _440 = _432 * _414;
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _446 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _450 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    float _452 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].z, _446);
    bool _454 = !_412;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_76);
        float _476 = 1.0 / _474;
        float _478 = _110 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _490 = 1.0 / _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    bool _500 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _502 = isnan(_480);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _516 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_480);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _488;
    bool _530 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _532 = isnan(_480);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_510;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _494;
    float _550 = _498 * _490;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _552;
    float _556 = _514 * _528;
    bool _558 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_480);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_568;
    float _572 = _570 + 1.0;
    float _574 = _554 * _548;
    float _576 = _540 * _544;
    float _578 = -_540;
    float _580 = _578 + 1.0;
    bool _582 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_480);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _568 * _580;
    float _604 = _592 * _572;
    float _606 = -_592;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _480 + _610;
    bool _614 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _616 = isnan(_480);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _600;
    float _628 = -_526;
    float _630 = _628 + 1.0;
    float _632 = _526 * _608;
    float _634 = fma(_550, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _640 = _624 * _630;
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = 1.0 / _596;
    float _648 = _634 * _640;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _656 = _480 + _654;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = fma(_574, _656, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _662 = 1.0 / _638;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _480 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _672 = fma(_556, _666, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _674;
    float _678 = _652 * _646;
    float _680 = fma(_672, _632, _658);
    float _682 = _676 * _626;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _480 + _684;
    bool _688 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _690 = isnan(_480);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _702 = _480 + _700;
    float _704 = fma(_660, _604, _680);
    float _706 = fma(_678, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _708 = _670 * _662;
    float _710 = fma(_682, _702, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _718 = _480 + _716;
    float _720 = fma(_706, _602, _704);
    float _722 = _510 * _714;
    float _724 = fma(_708, _718, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _726 = fma(_710, _576, _720);
    float _728 = fma(_724, _722, _726);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[121].x, _728);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = in.m_39.x;
    float _748 = in.m_39.y;
    float _750 = in.m_39.z;
    out.m_41.x = _738;
    out.m_41.y = _742;
    out.m_41.z = _744;
    out.m_41.w = _740;
    float _752 = _452 * _750;
    float _754 = _450 * _748;
    float _756 = _448 * _746;
    bool _758 = !_546;
    float _774;
    if (!_758)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _762 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _766 = _764 * _760;
        float _768 = floor(_766);
        float _770 = -_768;
        float _772 = _766 + _770;
        _774 = _772;
        _776 = true;
    }
    else
    {
        float _778 = float(_76);
        float _780 = 1.0 / _778;
        float _782 = _110 * _780;
        _774 = _782;
    }
    _776 = false;
    float _784 = _774;
    float _786 = in.m_37.y;
    float _788 = _132 * 2.0;
    float _790 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = in.m_37.z;
    float _794 = in.m_37.w;
    float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _800 = _798 != 0;
    float _802 = in.m_43.y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _812 = _810 != 0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _816 = 1.0 + _814;
    float _818 = floor(_788);
    float _820 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _822 = in.m_43.x;
    float _824 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _828 = _786 * 2.0;
    bool _830 = _786 > 0.5;
    float _832 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = 1.0 / _816;
    bool _836 = _794 > 0.5;
    float _838 = fma(_832, -2.0, _826);
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = floor(_828);
    int _852 = _836 ? as_type<int>(_842) : as_type<int>(_802);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _856 = _830 ? as_type<int>(_842) : as_type<int>(_802);
    float _858 = _800 ? as_type<float>(_852) : _802;
    bool _860 = _818 > 0.0;
    float _862 = _806 ? as_type<float>(_856) : _802;
    bool _864 = _818 >= 0.0;
    bool _866 = isnan(_818);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = 0.0;
    float _876 = _802;
    float _878 = 1.0;
    float _880 = _822;
    if (!_848)
    {
        _874 = _792;
    }
    float _882 = _874;
    int _884 = _872 ? 0 : 1;
    bool _886 = _850 > 0.0;
    bool _888 = _850 >= 0.0;
    bool _890 = isnan(_850);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = _792 > 0.5;
    int _900 = _896 ? 0 : 1;
    int _902 = ~_884;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    int _908 = ~_900;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906;
    int _916 = _912;
    float _918 = _882;
    if (_812)
    {
        float _920 = _898 ? _842 : _802;
        _876 = _920;
    }
    float _922 = _876;
    if (!_860)
    {
        int _924 = ~_884;
        int _926 = _924 + 1;
        _914 = _926;
    }
    int _928 = _914;
    if (!_886)
    {
        int _930 = ~_900;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = in.m_47.x;
    float _938 = in.m_47.y;
    float _940 = in.m_47.z;
    float _942 = 0.0;
    if (!_848)
    {
        _942 = _786;
    }
    float _944 = _942;
    float _946 = 0.0;
    float _948 = _944;
    if (!_848)
    {
        _946 = _792;
    }
    float _950 = _946;
    float _952 = 0.0;
    float _954 = _950;
    if (_848)
    {
        _952 = _792;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _956;
    if (_848)
    {
        _958 = _132;
    }
    float _962 = _958;
    float _964 = _962;
    if (_848)
    {
        _878 = _786;
    }
    float _966 = _878;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _978 = _976 != 0;
    float _980 = _966;
    bool _982 = _978;
    if (_848)
    {
        _918 = _786;
    }
    float _984 = _918;
    if (_848)
    {
        _954 = _786;
    }
    float _986 = _954;
    if (!_848)
    {
        _960 = _786;
    }
    float _988 = _960;
    if (!_848)
    {
        _964 = _792;
    }
    float _990 = _964;
    if (_848)
    {
        _948 = _132;
    }
    float _992 = _948;
    if (!_848)
    {
        _980 = _132;
    }
    float _994 = _980;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1006 = _1004 != 0;
    float _1008 = _992 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1012 = _1010 != 0;
    float _1014 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = -_854;
    float _1020 = fma(_1008, 2.0, _1018);
    float _1022 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1030 = !_974;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = 1.0 / _1028;
    float _1048 = 0.0;
    if (_1006)
    {
        float _1050 = in.m_37.z;
        _1048 = _1050;
    }
    float _1052 = _1048;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1058 = !_978;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1066 = 1.0 / _1056;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = -_1064;
    float _1076 = fma(_1034, 2.0, _1074);
    float _1078 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _808);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1084 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1086 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1024);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _132 + _786;
    float _1092 = _1072 * _1046;
    float _1094 = _792 * 2.0;
    int _1096 = abs(_1032);
    float _1098 = _1090 + (-1.0);
    float _1100 = float(_928);
    float _1102 = _994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1104 = _1082 * _1066;
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _132 + _792;
    float _1110 = _786 + _792;
    float _1112 = floor(_1094);
    float _1114 = _1108 + (-1.0);
    float _1116 = _1110 + (-1.0);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1006)
    {
        bool _1120 = _1052 > 0.5;
        _982 = _1120;
    }
    bool _1122 = _982;
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _784 + _1126;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1132 = fma(_1118, _862, -0.5);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1136 = _784 + _1134;
    float _1138 = fma(_1104, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1140 = _796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = fma(_1092, _1136, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _990 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1146 = fma(_858, _1140, -0.5);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1150 = float(_1096);
    float _1152 = _1078 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1154 = !_970;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = -_1148;
    float _1160 = fma(_1144, 2.0, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1164 = _1112 >= 0.0;
    bool _1166 = isnan(_1112);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    float _1174 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1176 = abs(_1060);
    float _1178 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1180 = _1150 * _1100;
    float _1182 = in.m_49.x;
    float _1184 = in.m_49.y;
    float _1186 = in.m_49.z;
    float _1188 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1190 = log2(_1188);
    int _1192 = _1172 ? 0 : 1;
    float _1194 = _1180 * (-2.0);
    bool _1196 = _1112 > 0.0;
    float _1198 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1200 = fma(_1130, _1194, _1130);
    float _1202 = -_110;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1160);
    int _1206 = ~_1192;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = -_110;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1218 = abs(_1156);
    float _1220 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1178);
    float _1222 = float(_1176);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1226 = _1210;
    float _1228 = _1112;
    if (!_1196)
    {
        int _1230 = ~_1192;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = float(_934);
    float _1240 = fma(_1102, -2.0, _1216);
    float _1242 = float(_1218);
    float _1244 = fma(_1236, -2.0, _1224);
    float _1246 = fma(_1194, _1184, _1184);
    float _1248 = _1190 * _110;
    float _1250 = float(_1234);
    float _1252 = _1222 * _1238;
    float _1254 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1240);
    float _1256 = exp2(_1248);
    float _1258 = _1242 * _1250;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1262);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1272 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1276 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1266);
    float _1278 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1270);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _1152 + _1280;
    float _1284 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1286 = -_110;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1076);
    float _1290 = -_1256;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1274);
    bool _1296 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1310 = _1174 + _1308;
    float _1312 = _1282 * _1282;
    float _1314 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1276);
    float _1316 = _1304 ? _1292 : 0.0;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1198 + _1318;
    float _1322 = fma(_1310, _1310, _1312);
    float _1324 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1260);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1278);
    float _1328 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1268);
    float _1330 = fma(_1320, _1320, _1322);
    float _1332 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1002);
    float _1336 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1294);
    float _1338 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1244);
    bool _1340 = _1304;
    int _1342 = as_type<int>(_1320);
    if (_1044)
    {
        float _1344 = _1316 * _834;
        _112 = _1344;
    }
    float _1346 = _112;
    float _1348 = rsqrt(_1330);
    if (_1000)
    {
        bool _1350 = _132 > 0.5;
        _1340 = _1350;
    }
    bool _1352 = _1340;
    float _1354 = _132 + (-0.5);
    float _1356 = _1258 * (-2.0);
    float _1358 = _786 + (-0.5);
    float _1360 = _1252 * (-2.0);
    bool _1362 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1364 = isnan(_784);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = fma(_1356, _1182, _1182);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1246);
    float _1378 = _1326 * (-0.15915493667125701904296875);
    float _1380 = fma(_1106, _1356, _1106);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1374);
    float _1384 = fma(_1200, _1346, _1376);
    float _1386 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1388 = fma(_1360, _1186, _1186);
    bool _1390 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1392 = isnan(_784);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = _1384 * 0.15915493667125701904296875;
    float _1404 = _1386 * _1348;
    bool _1406 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_784);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1372;
    float _1420 = _1418 + 1.0;
    float _1422 = -_1400;
    float _1424 = _1422 + 1.0;
    float _1426 = _1282 * _1404;
    float _1428 = _1310 * _1404;
    float _1430 = _1416 * _1420;
    float _1432 = _1378 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = -_1426;
    float _1438 = _1282 + _1436;
    float _1440 = _1372 * _1424;
    float _1442 = fma(_1380, _1346, _1382);
    float _1444 = _792 + (-0.5);
    float _1446 = _1438 * _1438;
    float _1448 = _1444;
    float _1450 = _1426;
    if (!_1000)
    {
        _1228 = _822;
    }
    float _1452 = _1228;
    float _1454 = _1442 * 0.15915493667125701904296875;
    float _1456 = _1378 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = -_1416;
    float _1462 = _1460 + 1.0;
    float _1464 = fma(_1124, _1360, _1124);
    float _1466 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1468 = _1452;
    if (!_1006)
    {
        _1448 = _822;
    }
    float _1470 = _1448;
    float _1472 = _1336 * (-0.15915493667125701904296875);
    float _1474 = -_1338;
    float _1476 = fma(_1220, _1146, _1474);
    float _1478 = fma(_1464, _1346, _1466);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1482 = -_1428;
    float _1484 = _1310 + _1482;
    float _1486 = _1142 * _1430;
    float _1488 = _1320 * _1404;
    float _1490 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = fma(_1484, _1484, _1446);
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1486);
    float _1496 = -_1488;
    float _1498 = _1320 + _1496;
    int _1500 = as_type<int>(_1498);
    int _1502 = as_type<int>(_1484);
    float _1504 = _1470;
    if (_1000)
    {
        float _1506 = -_822;
        float _1508 = _1506 + 1.0;
        _1342 = as_type<int>(_1508);
    }
    int _1510 = _1342;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1514 = fma(_1138, _1440, _1494);
    float _1516 = fma(_1498, _1498, _1492);
    float _1518 = _1478 * 0.15915493667125701904296875;
    if (_1000)
    {
        float _1520 = _1352 ? as_type<float>(_1510) : _822;
        _1468 = _1520;
    }
    float _1522 = _1468;
    float _1524 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1514);
    if (_1006)
    {
        float _1526 = -_822;
        float _1528 = _1526 + 1.0;
        _1500 = as_type<int>(_1528);
    }
    int _1530 = _1500;
    float _1532 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = sqrt(_1516);
    if (_1012)
    {
        float _1536 = -_822;
        float _1538 = _1536 + 1.0;
        _1502 = as_type<int>(_1538);
    }
    int _1540 = _1502;
    float _1542 = fma(_1532, _1522, -0.5);
    if (_1006)
    {
        float _1544 = _1122 ? as_type<float>(_1530) : _822;
        _1504 = _1544;
    }
    float _1546 = _1504;
    if (_1012)
    {
        float _1548 = _830 ? as_type<float>(_1540) : _822;
        _880 = _1548;
    }
    float _1550 = _880;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1556 = fma(_1554, _922, -0.5);
    float _1558 = _1402 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1348 * _1534;
    float _1564 = _1490 * _1562;
    float _1566 = _1402 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    float _1570 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1572 = _1434 * _1132;
    float _1574 = _1458 * _1132;
    float _1576 = _1564 * _1068;
    float _1578 = fma(_1570, _1546, -0.5);
    float _1580 = -_1572;
    float _1582 = fma(_1458, _1542, _1580);
    float _1584 = fma(_1434, _1542, _1574);
    float _1586 = _1454 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _820 * _1562;
    float _1592 = _824 * _1562;
    float _1594 = fma(_1334, _1578, _1214);
    float _1596 = _1590 * _1062;
    float _1598 = _1592 * _996;
    float _1600 = fma(_1332, _1582, _1288);
    float _1602 = _1454 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = -_1284;
    float _1608 = fma(_1306, _1584, _1606);
    float _1610 = _1518 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1588 * _1560;
    float _1616 = _1518 * 6.283185482025146484375;
    float _1618 = sin(_1616);
    float _1620 = _1604 * _1568;
    float _1622 = _1604 * _1560;
    float _1624 = _1612 * _1576;
    float _1626 = _1560 * _1612;
    float _1628 = _1568 * _1612;
    float _1630 = _1588 * _1568;
    float _1632 = _1604 * _1624;
    float _1634 = _1588 * _1624;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1638 = fma(_1618, _1620, _1614);
    float _1640 = -_1576;
    float _1642 = _1618 * _1640;
    float _1644 = fma(_1638, _1596, _1632);
    float _1646 = -_1630;
    float _1648 = fma(_1618, _1622, _1646);
    float _1650 = fma(_1628, _1596, _1642);
    float _1652 = -_1622;
    float _1654 = fma(_1618, _1630, _1652);
    float _1656 = fma(_1618, _1614, _1620);
    float _1658 = fma(_1648, _1598, _1644);
    float _1660 = fma(_1626, _1598, _1650);
    float _1662 = fma(_1654, _1596, _1634);
    float _1664 = -_1426;
    float _1666 = _1152 + _1664;
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1672 = fma(_1656, _1598, _1662);
    float _1674 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1676 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1668);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1670);
    float _1680 = -_1428;
    float _1682 = _1174 + _1680;
    float _1684 = fma(_1674, _1550, -0.5);
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1688 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1678);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1694 = _1198 + _1686;
    float _1696 = _1174 + _1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1690);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1692);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = -_1488;
    float _1712 = _1198 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = _1472 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1700);
    float _1722 = fma(_1708, _1708, _1714);
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = sqrt(_1722);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1742 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1744 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1746 = 1.0 / _1730;
    out.m_51.x = _1732;
    out.m_51.y = _1736;
    out.m_51.z = _1738;
    out.m_51.w = _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1744);
    float _1752 = _1718 * _1556;
    float _1754 = _1748 + _1730;
    float _1756 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1750);
    float _1758 = _1472 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    bool _1762 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1152 + _1756;
    float _1766 = _1754 * _1746;
    float _1768 = _1766 * 0.5;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1772 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1776 = _1696;
    float _1778 = _1694;
    if (!_1762)
    {
        _1774 = _1764;
    }
    float _1780 = _1774;
    float _1782 = _1760 * _1556;
    float _1784 = -_1752;
    float _1786 = fma(_1760, _1684, _1784);
    float _1788 = fma(_1718, _1684, _1782);
    float _1790 = fma(_1328, _1786, _1204);
    bool _1792 = !_1762;
    float _1794 = _1780;
    if (!_1792)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1800 = _1734 + _1798;
        float _1802 = _1764 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = rsqrt(_1722);
        float _1806 = _1800 * _1796;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1808 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1808 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = _1812 + (-1.0);
        float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = fma(_1816, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1824 = fma(_1764, _1812, _1820);
        float _1826 = _1804 * _1822;
        float _1828 = fma(_1708, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1830 = fma(_1704, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1794 = _1824;
        _1776 = _1828;
        _1778 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1776;
    float _1836 = _1778;
    float _1838 = 1.0 / _1772;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1848 = _1844 || _1846;
    float _1850 = -_1426;
    float _1852 = _1850 + _1832;
    float _1854 = -_1428;
    float _1856 = _1854 + _1834;
    float _1858 = -_1254;
    float _1860 = fma(_1314, _1788, _1858);
    float _1862 = -_1488;
    float _1864 = _1862 + _1836;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1866);
    float _1876 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1868);
    float _1878 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1882 = _1872;
    if (_1848)
    {
        _1882 = 1.0;
    }
    float _1884 = _1882;
    float _1886 = _1884;
    if (_1848)
    {
        _1450 = 1.0;
    }
    float _1888 = _1450;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1892 = _1838 * _1890;
    float _1894 = _1888;
    if (!_1848)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = 1.0 / _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1930 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1928;
        float _1932 = 1.0 / _1930;
        float _1934 = _1922 * _1926;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1892, _1934, _1936);
        float _1940 = _1938 * _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1886 = _1942;
    }
    float _1944 = _1886;
    if (!_1848)
    {
        float _1946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1948 * 0.15915493667125701904296875;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1950 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = 1.0 / _1956;
        float _1964 = _1952 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = _1960 * _1962;
        float _1970 = _1952 * 6.283185482025146484375;
        float _1972 = sin(_1970);
        float _1974 = _1966 * _1968;
        float _1976 = 1.0 / _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1978;
        float _1982 = 1.0 / _1980;
        float _1984 = _1972 * _1976;
        float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1988 = fma(_1892, _1984, _1986);
        float _1990 = _1988 * _1982;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = -_1992;
        float _1996 = _1994 + 1.0;
        _1894 = _1996;
    }
    float _1998 = _1894;
    float _2000 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _2002 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _2004 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _2006 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2014 = _1944 * _1998;
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2020 = _1944 > 0.0;
    bool _2022 = isnan(_1944);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    float _2030 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2032 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2034 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2036 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2038 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2034);
    float _2044 = _2014 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2030);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2042);
    bool _2054 = _1998 <= 0.0;
    bool _2056 = !_2028;
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2062 = _340 * _2044;
    float _2064 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2066 = _2048 + _2052;
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2070 = _1594 + 0.5;
    float _2072 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2074 = _1600 + 0.5;
    float _2076 = _1608 + 0.5;
    float _2078 = _1476 + 0.5;
    float _2080 = _1790 + 0.5;
    float _2082 = _1860 + 0.5;
    float _2084 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2086 = _2066 * 0.5;
    out.m_53.x = _2074;
    out.m_53.y = _2076;
    out.m_53.z = _2070;
    out.m_53.w = _2078;
    out.m_55.x = _2080;
    out.m_55.y = _2082;
    out.m_33.x = _2084;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2048;
    out.gl_Position.w = _2052;
    out.m_57.z = _2086;
    out.m_57.w = _2052;
    if (!_2058)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2088 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2088;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    bool _472 = false;
    bool _360 = false;
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
        float _2145 = as_type<float>(_92);
        out.gl_Position.z = _2145;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2215 = as_type<float>(_130);
        out.gl_Position.z = _2215;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.x;
    float _134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _138 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _136 * _134;
    float _156 = 0.0;
    float _158 = _138;
    if (!_148)
    {
        float _160 = _138 * _138;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[20].x, _154);
    float _168 = _164;
    if (!_148)
    {
        float _170 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = in.m_35.x;
    float _176 = in.m_35.y;
    float _178 = in.m_35.z;
    float _180 = _166 * 6.283185482025146484375;
    float _182 = floor(_166);
    float _184 = _180 * 0.15915493667125701904296875;
    float _186 = _184 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = -_182;
    float _192 = _166 + _190;
    bool _194 = !_148;
    float _196 = _172;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _138 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _138);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _138 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _158 = _250;
    }
    float _252 = _158;
    float _254 = in.m_39.w;
    float _256 = in.m_30.x;
    float _258 = in.m_30.y;
    float _260 = in.m_30.z;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = fma(_188, 0.5, 0.5);
    bool _272 = _192 < 0.5;
    float _274 = float(_272);
    float _276 = -_192;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = !_264;
    int _284 = _282 ? 0 : 1;
    float _286 = -_274;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = -_270;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_284);
    float _296 = fma(_252, _174, _280);
    bool _298 = !_152;
    int _300 = _298 ? 0 : 1;
    float _302 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _304 = !_268;
    int _306 = _304 ? 0 : 1;
    float _308 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _312 = fma(_252, _176, _302);
    int _314 = abs(_300);
    float _316 = fma(_252, _178, _308);
    int _318 = abs(_306);
    float _320 = float(_294);
    float _322 = float(_314);
    float _324 = fma(_316, _254, _260);
    float _326 = abs(_278);
    float _328 = _320 * _326;
    float _330 = fma(_296, _254, _256);
    float _332 = fma(_312, _254, _258);
    float _334 = float(_318);
    float _336 = fma(_322, _292, _328);
    float _338 = abs(_288);
    float _340 = fma(_334, _338, _336);
    bool _342 = !_310;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _346 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_76);
        float _364 = 1.0 / _362;
        float _366 = _110 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = _368 + _370;
    bool _374 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    bool _390 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_368);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_384;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = 1.0 / _388;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = _400 * _404;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = _372 * _410;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = fma(_408, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    float _432 = fma(_424, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _434 = fma(_430, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = _426 * _414;
    float _438 = _434 * _414;
    float _440 = _432 * _414;
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _446 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _450 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    float _452 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[144].z, _446);
    bool _454 = !_412;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_76);
        float _476 = 1.0 / _474;
        float _478 = _110 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _490 = 1.0 / _484;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _496;
    bool _500 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _502 = isnan(_480);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _516 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_480);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _488;
    bool _530 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _532 = isnan(_480);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_510;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _494;
    float _550 = _498 * _490;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _552;
    float _556 = _514 * _528;
    bool _558 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_480);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_568;
    float _572 = _570 + 1.0;
    float _574 = _554 * _548;
    float _576 = _540 * _544;
    float _578 = -_540;
    float _580 = _578 + 1.0;
    bool _582 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_480);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _568 * _580;
    float _604 = _592 * _572;
    float _606 = -_592;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _480 + _610;
    bool _614 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _616 = isnan(_480);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _600;
    float _628 = -_526;
    float _630 = _628 + 1.0;
    float _632 = _526 * _608;
    float _634 = fma(_550, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _640 = _624 * _630;
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = 1.0 / _596;
    float _648 = _634 * _640;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _656 = _480 + _654;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = fma(_574, _656, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _662 = 1.0 / _638;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _480 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _672 = fma(_556, _666, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _674;
    float _678 = _652 * _646;
    float _680 = fma(_672, _632, _658);
    float _682 = _676 * _626;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _480 + _684;
    bool _688 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _690 = isnan(_480);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _702 = _480 + _700;
    float _704 = fma(_660, _604, _680);
    float _706 = fma(_678, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _708 = _670 * _662;
    float _710 = fma(_682, _702, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _718 = _480 + _716;
    float _720 = fma(_706, _602, _704);
    float _722 = _510 * _714;
    float _724 = fma(_708, _718, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _726 = fma(_710, _576, _720);
    float _728 = fma(_724, _722, _726);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[121].x, _728);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = in.m_39.x;
    float _748 = in.m_39.y;
    float _750 = in.m_39.z;
    out.m_41.x = _738;
    out.m_41.y = _742;
    out.m_41.z = _744;
    out.m_41.w = _740;
    float _752 = _452 * _750;
    float _754 = _450 * _748;
    float _756 = _448 * _746;
    bool _758 = !_546;
    float _774;
    if (!_758)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _762 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _766 = _764 * _760;
        float _768 = floor(_766);
        float _770 = -_768;
        float _772 = _766 + _770;
        _774 = _772;
        _776 = true;
    }
    else
    {
        float _778 = float(_76);
        float _780 = 1.0 / _778;
        float _782 = _110 * _780;
        _774 = _782;
    }
    _776 = false;
    float _784 = _774;
    float _786 = in.m_37.y;
    float _788 = _132 * 2.0;
    float _790 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = in.m_37.z;
    float _794 = in.m_37.w;
    float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _800 = _798 != 0;
    float _802 = in.m_43.y;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _812 = _810 != 0;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _816 = 1.0 + _814;
    float _818 = floor(_788);
    float _820 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _822 = in.m_43.x;
    float _824 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _828 = _786 * 2.0;
    bool _830 = _786 > 0.5;
    float _832 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = 1.0 / _816;
    bool _836 = _794 > 0.5;
    float _838 = fma(_832, -2.0, _826);
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = floor(_828);
    int _852 = _836 ? as_type<int>(_842) : as_type<int>(_802);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _856 = _830 ? as_type<int>(_842) : as_type<int>(_802);
    float _858 = _800 ? as_type<float>(_852) : _802;
    bool _860 = _818 > 0.0;
    float _862 = _806 ? as_type<float>(_856) : _802;
    bool _864 = _818 >= 0.0;
    bool _866 = isnan(_818);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = 0.0;
    float _876 = _802;
    float _878 = 1.0;
    float _880 = _822;
    if (!_848)
    {
        _874 = _792;
    }
    float _882 = _874;
    int _884 = _872 ? 0 : 1;
    bool _886 = _850 > 0.0;
    bool _888 = _850 >= 0.0;
    bool _890 = isnan(_850);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = _792 > 0.5;
    int _900 = _896 ? 0 : 1;
    int _902 = ~_884;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    int _908 = ~_900;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906;
    int _916 = _912;
    float _918 = _882;
    if (_812)
    {
        float _920 = _898 ? _842 : _802;
        _876 = _920;
    }
    float _922 = _876;
    if (!_860)
    {
        int _924 = ~_884;
        int _926 = _924 + 1;
        _914 = _926;
    }
    int _928 = _914;
    if (!_886)
    {
        int _930 = ~_900;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = in.m_47.x;
    float _938 = in.m_47.y;
    float _940 = in.m_47.z;
    float _942 = 0.0;
    if (!_848)
    {
        _942 = _786;
    }
    float _944 = _942;
    float _946 = 0.0;
    float _948 = _944;
    if (!_848)
    {
        _946 = _792;
    }
    float _950 = _946;
    float _952 = 0.0;
    float _954 = _950;
    if (_848)
    {
        _952 = _792;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _956;
    if (_848)
    {
        _958 = _132;
    }
    float _962 = _958;
    float _964 = _962;
    if (_848)
    {
        _878 = _786;
    }
    float _966 = _878;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _978 = _976 != 0;
    float _980 = _966;
    bool _982 = _978;
    if (_848)
    {
        _918 = _786;
    }
    float _984 = _918;
    if (_848)
    {
        _954 = _786;
    }
    float _986 = _954;
    if (!_848)
    {
        _960 = _786;
    }
    float _988 = _960;
    if (!_848)
    {
        _964 = _792;
    }
    float _990 = _964;
    if (_848)
    {
        _948 = _132;
    }
    float _992 = _948;
    if (!_848)
    {
        _980 = _132;
    }
    float _994 = _980;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _940);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[83].z, _844);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1006 = _1004 != 0;
    float _1008 = _992 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1012 = _1010 != 0;
    float _1014 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1016 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1018 = -_854;
    float _1020 = fma(_1008, 2.0, _1018);
    float _1022 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1014);
    float _1024 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1016);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1030 = !_974;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = 1.0 / _1028;
    float _1048 = 0.0;
    if (_1006)
    {
        float _1050 = in.m_37.z;
        _1048 = _1050;
    }
    float _1052 = _1048;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1058 = !_978;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _936);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1066 = 1.0 / _1056;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = -_1064;
    float _1076 = fma(_1034, 2.0, _1074);
    float _1078 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _808);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1084 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1022);
    float _1086 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1024);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _132 + _786;
    float _1092 = _1072 * _1046;
    float _1094 = _792 * 2.0;
    int _1096 = abs(_1032);
    float _1098 = _1090 + (-1.0);
    float _1100 = float(_928);
    float _1102 = _994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1104 = _1082 * _1066;
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1108 = _132 + _792;
    float _1110 = _786 + _792;
    float _1112 = floor(_1094);
    float _1114 = _1108 + (-1.0);
    float _1116 = _1110 + (-1.0);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1006)
    {
        bool _1120 = _1052 > 0.5;
        _982 = _1120;
    }
    bool _1122 = _982;
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _784 + _1126;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1132 = fma(_1118, _862, -0.5);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1136 = _784 + _1134;
    float _1138 = fma(_1104, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1140 = _796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = fma(_1092, _1136, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _990 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1146 = fma(_858, _1140, -0.5);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1150 = float(_1096);
    float _1152 = _1078 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1154 = !_970;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = -_1148;
    float _1160 = fma(_1144, 2.0, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1164 = _1112 >= 0.0;
    bool _1166 = isnan(_1112);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    float _1174 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1176 = abs(_1060);
    float _1178 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1180 = _1150 * _1100;
    float _1182 = in.m_49.x;
    float _1184 = in.m_49.y;
    float _1186 = in.m_49.z;
    float _1188 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1190 = log2(_1188);
    int _1192 = _1172 ? 0 : 1;
    float _1194 = _1180 * (-2.0);
    bool _1196 = _1112 > 0.0;
    float _1198 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1200 = fma(_1130, _1194, _1130);
    float _1202 = -_110;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1160);
    int _1206 = ~_1192;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = -_110;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1218 = abs(_1156);
    float _1220 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1178);
    float _1222 = float(_1176);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1226 = _1210;
    float _1228 = _1112;
    if (!_1196)
    {
        int _1230 = ~_1192;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = float(_934);
    float _1240 = fma(_1102, -2.0, _1216);
    float _1242 = float(_1218);
    float _1244 = fma(_1236, -2.0, _1224);
    float _1246 = fma(_1194, _1184, _1184);
    float _1248 = _1190 * _110;
    float _1250 = float(_1234);
    float _1252 = _1222 * _1238;
    float _1254 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1240);
    float _1256 = exp2(_1248);
    float _1258 = _1242 * _1250;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1262);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1272 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1276 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1266);
    float _1278 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1270);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _1152 + _1280;
    float _1284 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1286 = -_110;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1076);
    float _1290 = -_1256;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1274);
    bool _1296 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1310 = _1174 + _1308;
    float _1312 = _1282 * _1282;
    float _1314 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1276);
    float _1316 = _1304 ? _1292 : 0.0;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1198 + _1318;
    float _1322 = fma(_1310, _1310, _1312);
    float _1324 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1260);
    float _1326 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1278);
    float _1328 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1268);
    float _1330 = fma(_1320, _1320, _1322);
    float _1332 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1334 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1002);
    float _1336 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1294);
    float _1338 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1244);
    bool _1340 = _1304;
    int _1342 = as_type<int>(_1320);
    if (_1044)
    {
        float _1344 = _1316 * _834;
        _112 = _1344;
    }
    float _1346 = _112;
    float _1348 = rsqrt(_1330);
    if (_1000)
    {
        bool _1350 = _132 > 0.5;
        _1340 = _1350;
    }
    bool _1352 = _1340;
    float _1354 = _132 + (-0.5);
    float _1356 = _1258 * (-2.0);
    float _1358 = _786 + (-0.5);
    float _1360 = _1252 * (-2.0);
    bool _1362 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1364 = isnan(_784);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = fma(_1356, _1182, _1182);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1246);
    float _1378 = _1326 * (-0.15915493667125701904296875);
    float _1380 = fma(_1106, _1356, _1106);
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1374);
    float _1384 = fma(_1200, _1346, _1376);
    float _1386 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1388 = fma(_1360, _1186, _1186);
    bool _1390 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1392 = isnan(_784);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = _1384 * 0.15915493667125701904296875;
    float _1404 = _1386 * _1348;
    bool _1406 = _784 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_784);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1372;
    float _1420 = _1418 + 1.0;
    float _1422 = -_1400;
    float _1424 = _1422 + 1.0;
    float _1426 = _1282 * _1404;
    float _1428 = _1310 * _1404;
    float _1430 = _1416 * _1420;
    float _1432 = _1378 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = -_1426;
    float _1438 = _1282 + _1436;
    float _1440 = _1372 * _1424;
    float _1442 = fma(_1380, _1346, _1382);
    float _1444 = _792 + (-0.5);
    float _1446 = _1438 * _1438;
    float _1448 = _1444;
    float _1450 = _1426;
    if (!_1000)
    {
        _1228 = _822;
    }
    float _1452 = _1228;
    float _1454 = _1442 * 0.15915493667125701904296875;
    float _1456 = _1378 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = -_1416;
    float _1462 = _1460 + 1.0;
    float _1464 = fma(_1124, _1360, _1124);
    float _1466 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1468 = _1452;
    if (!_1006)
    {
        _1448 = _822;
    }
    float _1470 = _1448;
    float _1472 = _1336 * (-0.15915493667125701904296875);
    float _1474 = -_1338;
    float _1476 = fma(_1220, _1146, _1474);
    float _1478 = fma(_1464, _1346, _1466);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1482 = -_1428;
    float _1484 = _1310 + _1482;
    float _1486 = _1142 * _1430;
    float _1488 = _1320 * _1404;
    float _1490 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = fma(_1484, _1484, _1446);
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1486);
    float _1496 = -_1488;
    float _1498 = _1320 + _1496;
    int _1500 = as_type<int>(_1498);
    int _1502 = as_type<int>(_1484);
    float _1504 = _1470;
    if (_1000)
    {
        float _1506 = -_822;
        float _1508 = _1506 + 1.0;
        _1342 = as_type<int>(_1508);
    }
    int _1510 = _1342;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1514 = fma(_1138, _1440, _1494);
    float _1516 = fma(_1498, _1498, _1492);
    float _1518 = _1478 * 0.15915493667125701904296875;
    if (_1000)
    {
        float _1520 = _1352 ? as_type<float>(_1510) : _822;
        _1468 = _1520;
    }
    float _1522 = _1468;
    float _1524 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1514);
    if (_1006)
    {
        float _1526 = -_822;
        float _1528 = _1526 + 1.0;
        _1500 = as_type<int>(_1528);
    }
    int _1530 = _1500;
    float _1532 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = sqrt(_1516);
    if (_1012)
    {
        float _1536 = -_822;
        float _1538 = _1536 + 1.0;
        _1502 = as_type<int>(_1538);
    }
    int _1540 = _1502;
    float _1542 = fma(_1532, _1522, -0.5);
    if (_1006)
    {
        float _1544 = _1122 ? as_type<float>(_1530) : _822;
        _1504 = _1544;
    }
    float _1546 = _1504;
    if (_1012)
    {
        float _1548 = _830 ? as_type<float>(_1540) : _822;
        _880 = _1548;
    }
    float _1550 = _880;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1556 = fma(_1554, _922, -0.5);
    float _1558 = _1402 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1348 * _1534;
    float _1564 = _1490 * _1562;
    float _1566 = _1402 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    float _1570 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1572 = _1434 * _1132;
    float _1574 = _1458 * _1132;
    float _1576 = _1564 * _1068;
    float _1578 = fma(_1570, _1546, -0.5);
    float _1580 = -_1572;
    float _1582 = fma(_1458, _1542, _1580);
    float _1584 = fma(_1434, _1542, _1574);
    float _1586 = _1454 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _820 * _1562;
    float _1592 = _824 * _1562;
    float _1594 = fma(_1334, _1578, _1214);
    float _1596 = _1590 * _1062;
    float _1598 = _1592 * _996;
    float _1600 = fma(_1332, _1582, _1288);
    float _1602 = _1454 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = -_1284;
    float _1608 = fma(_1306, _1584, _1606);
    float _1610 = _1518 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1588 * _1560;
    float _1616 = _1518 * 6.283185482025146484375;
    float _1618 = sin(_1616);
    float _1620 = _1604 * _1568;
    float _1622 = _1604 * _1560;
    float _1624 = _1612 * _1576;
    float _1626 = _1560 * _1612;
    float _1628 = _1568 * _1612;
    float _1630 = _1588 * _1568;
    float _1632 = _1604 * _1624;
    float _1634 = _1588 * _1624;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1638 = fma(_1618, _1620, _1614);
    float _1640 = -_1576;
    float _1642 = _1618 * _1640;
    float _1644 = fma(_1638, _1596, _1632);
    float _1646 = -_1630;
    float _1648 = fma(_1618, _1622, _1646);
    float _1650 = fma(_1628, _1596, _1642);
    float _1652 = -_1622;
    float _1654 = fma(_1618, _1630, _1652);
    float _1656 = fma(_1618, _1614, _1620);
    float _1658 = fma(_1648, _1598, _1644);
    float _1660 = fma(_1626, _1598, _1650);
    float _1662 = fma(_1654, _1596, _1634);
    float _1664 = -_1426;
    float _1666 = _1152 + _1664;
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1672 = fma(_1656, _1598, _1662);
    float _1674 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1676 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1668);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1670);
    float _1680 = -_1428;
    float _1682 = _1174 + _1680;
    float _1684 = fma(_1674, _1550, -0.5);
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1688 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1678);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1694 = _1198 + _1686;
    float _1696 = _1174 + _1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1690);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1692);
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = -_1488;
    float _1712 = _1198 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = _1472 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1700);
    float _1722 = fma(_1708, _1708, _1714);
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = sqrt(_1722);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1742 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1744 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1746 = 1.0 / _1730;
    out.m_51.x = _1732;
    out.m_51.y = _1736;
    out.m_51.z = _1738;
    out.m_51.w = _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1744);
    float _1752 = _1718 * _1556;
    float _1754 = _1748 + _1730;
    float _1756 = fma(_1672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1750);
    float _1758 = _1472 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    bool _1762 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1152 + _1756;
    float _1766 = _1754 * _1746;
    float _1768 = _1766 * 0.5;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1772 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1776 = _1696;
    float _1778 = _1694;
    if (!_1762)
    {
        _1774 = _1764;
    }
    float _1780 = _1774;
    float _1782 = _1760 * _1556;
    float _1784 = -_1752;
    float _1786 = fma(_1760, _1684, _1784);
    float _1788 = fma(_1718, _1684, _1782);
    float _1790 = fma(_1328, _1786, _1204);
    bool _1792 = !_1762;
    float _1794 = _1780;
    if (!_1792)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1800 = _1734 + _1798;
        float _1802 = _1764 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = rsqrt(_1722);
        float _1806 = _1800 * _1796;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = _1808 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1808 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = _1812 + (-1.0);
        float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1822 = fma(_1816, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1824 = fma(_1764, _1812, _1820);
        float _1826 = _1804 * _1822;
        float _1828 = fma(_1708, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1830 = fma(_1704, _1826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1794 = _1824;
        _1776 = _1828;
        _1778 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1776;
    float _1836 = _1778;
    float _1838 = 1.0 / _1772;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1848 = _1844 || _1846;
    float _1850 = -_1426;
    float _1852 = _1850 + _1832;
    float _1854 = -_1428;
    float _1856 = _1854 + _1834;
    float _1858 = -_1254;
    float _1860 = fma(_1314, _1788, _1858);
    float _1862 = -_1488;
    float _1864 = _1862 + _1836;
    float _1866 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1866);
    float _1876 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1868);
    float _1878 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1882 = _1872;
    if (_1848)
    {
        _1882 = 1.0;
    }
    float _1884 = _1882;
    float _1886 = _1884;
    if (_1848)
    {
        _1450 = 1.0;
    }
    float _1888 = _1450;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1892 = _1838 * _1890;
    float _1894 = _1888;
    if (!_1848)
    {
        float _1896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = _1898 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = _1900 * 0.15915493667125701904296875;
        float _1908 = _1898 * 6.283185482025146484375;
        float _1910 = sin(_1908);
        float _1912 = 1.0 / _1904;
        float _1914 = _1906 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        float _1918 = _1910 * _1912;
        float _1920 = _1906 * 6.283185482025146484375;
        float _1922 = sin(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = 1.0 / _1924;
        float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1930 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1928;
        float _1932 = 1.0 / _1930;
        float _1934 = _1922 * _1926;
        float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1938 = fma(_1892, _1934, _1936);
        float _1940 = _1938 * _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1886 = _1942;
    }
    float _1944 = _1886;
    if (!_1848)
    {
        float _1946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1948 * 0.15915493667125701904296875;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1950 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = 1.0 / _1956;
        float _1964 = _1952 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = _1960 * _1962;
        float _1970 = _1952 * 6.283185482025146484375;
        float _1972 = sin(_1970);
        float _1974 = _1966 * _1968;
        float _1976 = 1.0 / _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1978;
        float _1982 = 1.0 / _1980;
        float _1984 = _1972 * _1976;
        float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1988 = fma(_1892, _1984, _1986);
        float _1990 = _1988 * _1982;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = -_1992;
        float _1996 = _1994 + 1.0;
        _1894 = _1996;
    }
    float _1998 = _1894;
    float _2000 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _2002 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _2004 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _2006 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2014 = _1944 * _1998;
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2020 = _1944 > 0.0;
    bool _2022 = isnan(_1944);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    float _2030 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2032 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2034 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2036 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2038 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2032);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2034);
    float _2044 = _2014 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2030);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2040);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2042);
    bool _2054 = _1998 <= 0.0;
    bool _2056 = !_2028;
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2062 = _340 * _2044;
    float _2064 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2066 = _2048 + _2052;
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2060);
    float _2070 = _1594 + 0.5;
    float _2072 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2074 = _1600 + 0.5;
    float _2076 = _1608 + 0.5;
    float _2078 = _1476 + 0.5;
    float _2080 = _1790 + 0.5;
    float _2082 = _1860 + 0.5;
    float _2084 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2086 = _2066 * 0.5;
    out.m_53.x = _2074;
    out.m_53.y = _2076;
    out.m_53.z = _2070;
    out.m_53.w = _2078;
    out.m_55.x = _2080;
    out.m_55.y = _2082;
    out.m_33.x = _2084;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2048;
    out.gl_Position.w = _2052;
    out.m_57.z = _2086;
    out.m_57.w = _2052;
    if (!_2058)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2088 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2088;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

