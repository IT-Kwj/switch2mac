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
    constant _16* vp_c16 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_55 [[attribute(8)]];
    float4 m_41 [[attribute(9)]];
    float4 m_39 [[attribute(10)]];
    float4 m_51 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_98);
        out.gl_Position.z = _2175;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_35.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_136);
        out.gl_Position.z = _2244;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_39.w;
    float _140 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _262 = _258;
    float _280;
    if (!_260)
    {
        float _264 = in.m_41.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_82);
        float _286 = 1.0 / _284;
        float _288 = _116 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_290);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_306;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _330;
    float _350 = _342 * _346;
    float _352 = -_342;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _326;
    float _364 = _322 * _354;
    float _366 = -_322;
    float _368 = _366 + 1.0;
    float _370 = _310 * _348;
    float _372 = _294 * _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = in.m_39.x;
    float _390 = in.m_39.y;
    float _392 = in.m_39.z;
    float _394 = _382 * _364;
    float _396 = _384 * _364;
    float _398 = _386 * _364;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _422 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _350, _412);
    float _426 = fma(_416, _350, _420);
    float _428 = fma(_418, _350, _422);
    float _430 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    bool _442 = !_360;
    float _460;
    if (!_442)
    {
        float _444 = in.m_41.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_82);
        float _466 = 1.0 / _464;
        float _468 = _116 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _470 + _562;
    bool _566 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = isnan(_470);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _578;
    float _582 = _558 * _544;
    float _584 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _470 + _586;
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _580 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _592;
    float _600 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _602 = fma(_584, _534, _596);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _606 = fma(_600, _598, _602);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _610;
    out.m_43.y = _616;
    out.m_43.z = _618;
    out.m_43.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_41.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_82);
        float _646 = 1.0 / _644;
        float _648 = _116 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_45.x;
    float _654 = in.m_45.y;
    float _656 = in.m_45.z;
    float _658 = in.m_45.w;
    float _660 = in.m_47.x;
    float _662 = in.m_47.y;
    float _664 = in.m_47.z;
    float _666 = in.m_47.w;
    float _668 = in.m_41.y;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _670 = _256 * _654;
    float _672 = _256 * _662;
    float _674 = fma(_254, _652, _670);
    float _676 = in.m_51.y;
    float _678 = fma(_254, _660, _672);
    float _680 = fma(_258, _656, _674);
    float _682 = fma(_258, _664, _678);
    float _684 = _680 + _658;
    float _686 = in.m_41.z;
    float _688 = in.m_41.w;
    float _690 = _682 + _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _684 + _692;
    float _696 = -_690;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = abs(_694);
    float _702 = abs(_698);
    float _704 = precise::max(_700, _702);
    bool _706 = _704 >= 16.0;
    float _708 = in.m_53.x;
    float _710 = in.m_53.y;
    float _712 = in.m_53.z;
    float _714 = in.m_53.w;
    float _716 = _694;
    float _718 = _698;
    float _720 = _676;
    float _722 = _650;
    if (_706)
    {
        float _724 = _694 * 0.0625;
        _716 = _724;
    }
    float _726 = _716;
    if (_706)
    {
        float _728 = _698 * 0.0625;
        _718 = _728;
    }
    float _730 = _718;
    float _732 = abs(_726);
    bool _734 = _732 != 0.0;
    bool _736 = isnan(_732);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = abs(_730);
    bool _746 = _744 == 0.0;
    bool _748 = !_742;
    bool _750 = _746 && _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _762 = _760 != 0;
    bool _764 = _688 > 0.5;
    bool _766 = !_758;
    int _768 = _766 ? 0 : 1;
    float _770 = abs(_730);
    bool _772 = _770 == 0.0;
    bool _774 = false;
    int _776 = as_type<int>(_688);
    bool _778 = _764;
    if (_750)
    {
        bool _780 = as_type<int>(_730) >= 0;
        _774 = _780;
    }
    bool _782 = _774;
    bool _784 = !_754;
    int _786 = _784 ? 0 : 1;
    int _788 = _782 ? (-1) : 0;
    if (_750)
    {
        int _790 = _782 ? 0 : 1078530011;
        _776 = _790;
    }
    int _792 = _776;
    bool _794 = !_762;
    int _796 = _794 ? 0 : 1;
    float _798 = 0.0;
    int _800 = _792;
    if (_750)
    {
        int _802 = int(0x80000000) & as_type<int>(_726);
        int _804 = _792 | _802;
        _798 = as_type<float>(_804);
    }
    float _806 = _798;
    bool _808 = !_742;
    bool _810 = _808 && _772;
    float _812 = _806;
    float _814 = _806;
    float _816 = _714;
    if (!_810)
    {
        float _818 = abs(_726);
        bool _820 = _818 != as_type<float>(0x7f800000u /* inf */);
        bool _822 = isnan(_818);
        bool _824 = _820 || _822;
        bool _826 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _828 = _824 || _826;
        float _830 = abs(_730);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        float _834 = abs(_730);
        bool _836 = _834 == as_type<float>(0x7f800000u /* inf */);
        bool _838 = !_828;
        bool _840 = _836 && _838;
        if (_840)
        {
            bool _842 = as_type<int>(_730) >= 0;
            _788 = _842 ? (-1) : 0;
        }
        int _844 = _788;
        if (_840)
        {
            _800 = 1075235812;
        }
        int _846 = _800;
        int _848 = _846;
        if (_840)
        {
            int _850 = ~_844;
            int _852 = (_850 != 0) ? _846 : 1061752795;
            _848 = _852;
        }
        int _854 = _848;
        if (_840)
        {
            int _856 = int(0x80000000) & as_type<int>(_726);
            int _858 = _854 | _856;
            _812 = as_type<float>(_858);
        }
        float _860 = _812;
        bool _862 = !_828;
        bool _864 = _862 && _832;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_726);
            float _868 = abs(_730);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_726);
            float _874 = abs(_730);
            float _876 = _872 + _874;
            float _878 = abs(_726);
            float _880 = abs(_730);
            float _882 = precise::min(_878, _880);
            float _884 = 1.0 / _870;
            float _886 = abs(_726);
            float _888 = abs(_730);
            bool _890 = _886 > _888;
            bool _892 = as_type<int>(_730) >= 0;
            bool _894 = _876 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_876);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            int _904 = as_type<int>(_726) & int(0x80000000);
            float _906 = _882 * _884;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _876;
            if (_890)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_892)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_902)
            {
                int _944 = _904 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_676;
    float _950 = _948 + 1.0;
    float _952 = in.m_55.x;
    float _954 = in.m_55.y;
    float _956 = in.m_55.z;
    bool _958 = _686 > 0.5;
    float _960 = _256 * _710;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _964 = _962 != 0;
    float _966 = in.m_41.x;
    int _968 = _958 ? as_type<int>(_950) : as_type<int>(_676);
    float _970 = fma(_254, _708, _960);
    bool _972 = _668 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _976 = 1.0 + _974;
    float _978 = _964 ? as_type<float>(_968) : _676;
    float _980 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _996 = _972 ? as_type<int>(_950) : as_type<int>(_676);
    float _998 = fma(_258, _712, _970);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _650 + _1000;
    float _1004 = 1.0 / _976;
    float _1006 = _992 ? as_type<float>(_996) : _676;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _650 + _1008;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = _650 + _1020;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = _998 + _714;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1032 = _1030 != 0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1034;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1002;
    if (_984)
    {
        float _1050 = _764 ? _950 : _676;
        _720 = _1050;
    }
    float _1052 = _720;
    float _1054 = 1.0 / _1018;
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    if (_1014)
    {
        _1046 = _966;
    }
    float _1070 = _1046;
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1076 = 1.0 / _1044;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1080 = _1072 * _980;
    float _1082 = _1074 * _994;
    float _1084 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1070;
    if (_1014)
    {
        _262 = _1070;
    }
    float _1088 = _262;
    float _1090 = _988 * _116;
    float _1092 = _1088;
    if (!_1014)
    {
        _1086 = _966;
    }
    float _1094 = _1086;
    float _1096 = 1.0 / _1068;
    float _1098 = _1010 * _1054;
    if (!_1014)
    {
        _1092 = _686;
    }
    float _1100 = _1092;
    float _1102 = _1094 * 2.0;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1104;
    float _1108 = 1.0 / _1036;
    float _1110 = _1022 * _1076;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1026)
    {
        bool _1114 = _966 > 0.5;
        _778 = _1114;
    }
    bool _1116 = _778;
    float _1118 = (*spvDescriptorSet0.vp_c16)._m0[3].x;
    if (_1032)
    {
        float _1120 = in.m_41.z;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1126 = _650 + _1124;
    float _1128 = 1.0 / _1106;
    float _1130 = _1078 * _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1134 = _650 + _1132;
    float _1136 = _668 + _1094;
    float _1138 = _1134 * _1096;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1142 = _650 + _1140;
    float _1144 = exp2(_1090);
    float _1146 = _1002 * _1108;
    if (_1014)
    {
        _1048 = _668;
    }
    float _1148 = _1048;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1152 = _1148;
    if (!_1014)
    {
        _1152 = _1094;
    }
    float _1154 = _1152;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = _1142 * _1128;
    float _1170 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1172 = floor(_1102);
    float _1174 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1180 = -_1156;
    float _1182 = fma(_1170, 2.0, _1180);
    float _1184 = _686 * 2.0;
    float _1186 = -_1144;
    float _1188 = _1186 + 1.0;
    float _1190 = _668 * 2.0;
    float _1192 = fma(_1174, -2.0, _1150);
    float _1194 = 1.0 / _1178;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1112);
    float _1202 = _668 + _686;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1196);
    float _1206 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1192);
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = floor(_1184);
    float _1220 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1200);
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1204);
    int _1224 = _1216 ? 0 : 1;
    float _1226 = _1202 + (-1.0);
    float _1228 = -_116;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    if (_1064)
    {
        float _1232 = _1198 * _1004;
        _120 = _1232;
    }
    float _1234 = _120;
    float _1236 = floor(_1190);
    float _1238 = _1126 * _1194;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1248 = _1136 + (-1.0);
    int _1250 = abs(_786);
    bool _1252 = _1218 >= 0.0;
    bool _1254 = isnan(_1218);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = _1218 > 0.0;
    int _1264 = _1260 ? 0 : 1;
    bool _1266 = _1260;
    if (_1032)
    {
        bool _1268 = _1122 > 0.5;
        _1266 = _1268;
    }
    bool _1270 = _1266;
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1282 = ~_1264;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1288;
    float _1292 = fma(_1276, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1294;
    int _1298 = _1286;
    if (!_1262)
    {
        int _1300 = ~_1264;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = fma(_1290, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1308 = fma(_1296, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1314 = _1236 >= 0.0;
    bool _1316 = isnan(_1236);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1332;
    int _1336 = _1322 ? 0 : 1;
    float _1338 = fma(_1280, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1340 = _1236 > 0.0;
    float _1342 = fma(_1312, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1344 = fma(_1326, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1346 = fma(_1330, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1348 = fma(_1334, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1358 = fma(_1242, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1360 = fma(_1352, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1362 = fma(_1356, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1364 = fma(_1246, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1370;
    int _1374 = ~_1336;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1378;
    float _1382 = _1306;
    if (!_1340)
    {
        int _1384 = ~_1336;
        int _1386 = _1384 + 1;
        _1380 = _1386;
    }
    int _1388 = _1380;
    float _1390 = fma(_1368, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1392 = _1172 > 0.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1394;
    float _1398 = fma(_1372, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    int _1400 = abs(_796);
    float _1402 = _686 + _1094;
    float _1404 = fma(_1396, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1406 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = _1402 + (-1.0);
    int _1410 = abs(_768);
    float _1412 = _1094 + (-0.5);
    float _1414 = float(_1250);
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1418 = float(_1304);
    float _1420 = _686 + (-0.5);
    float _1422 = float(_1400);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1426 = float(_1388);
    float _1428 = _1414 * _1418;
    int _1430 = ~_1224;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1440 = _1422 * _1426;
    int _1442 = _1434;
    int _1444 = as_type<int>(_1438);
    if (!_1392)
    {
        int _1446 = ~_1224;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    float _1452 = _1428 * (-2.0);
    float _1454 = float(_1410);
    float _1456 = _1440 * (-2.0);
    float _1458 = float(_1450);
    float _1460 = fma(_1406, _1452, _1406);
    bool _1462 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1464 = isnan(_650);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1416, _1456, _1416);
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1478 = _1454 * _1458;
    float _1480 = fma(_1460, _1234, _1424);
    bool _1482 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1484 = isnan(_650);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1496 = _1478 * (-2.0);
    float _1498 = in.m_51.x;
    float _1500 = fma(_1474, _1234, _1476);
    bool _1502 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1504 = isnan(_650);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1272, _1496, _1272);
    float _1516 = _668 + (-0.5);
    float _1518 = -_1492;
    float _1520 = _1518 + 1.0;
    bool _1522 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1524 = isnan(_650);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1480 * 0.15915493667125701904296875;
    float _1536 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1538 = _1512 * _1520;
    float _1540 = -_1512;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1548 = fma(_1514, _1234, _1536);
    bool _1550 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1552 = isnan(_650);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1532 * _1542;
    bool _1564 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1566 = isnan(_650);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -_1532;
    float _1578 = _1576 + 1.0;
    float _1580 = -_946;
    float _1582 = _1548 + _1580;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1534 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = _1500 * 0.15915493667125701904296875;
    bool _1594 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1596 = isnan(_650);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1472 * _1586;
    float _1608 = _1582 * 0.15915493667125701904296875;
    float _1610 = _1574 * _1578;
    float _1612 = -_1574;
    float _1614 = _1612 + 1.0;
    float _1616 = -_1472;
    float _1618 = _1616 + 1.0;
    float _1620 = _1534 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1628 = _1560 * _1614;
    float _1630 = _1604 * _1618;
    float _1632 = fma(_1438, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1634 = fma(_1626, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1636 = fma(_1546, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1638 = as_type<int>(_1546);
    int _1640 = as_type<int>(_1614);
    if (_1026)
    {
        float _1642 = -_1498;
        float _1644 = _1642 + 1.0;
        _1444 = as_type<int>(_1644);
    }
    int _1646 = _1444;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1650 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1032)
    {
        float _1652 = -_1498;
        float _1654 = _1652 + 1.0;
        _1638 = as_type<int>(_1654);
    }
    int _1656 = _1638;
    if (_1040)
    {
        float _1658 = -_1498;
        float _1660 = _1658 + 1.0;
        _1640 = as_type<int>(_1660);
    }
    int _1662 = _1640;
    float _1664 = _1292 * _1630;
    float _1666 = fma(_978, _1650, -0.5);
    float _1668 = _1306 * _1630;
    float _1670 = _1308 * _1630;
    float _1672 = _1592 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = -_1604;
    float _1678 = _1676 + 1.0;
    if (!_1026)
    {
        _722 = _1498;
    }
    float _1680 = _722;
    float _1682 = -_1206;
    float _1684 = fma(_1220, _1666, _1682);
    float _1686 = _1680;
    if (!_1032)
    {
        _816 = _1498;
    }
    float _1688 = _816;
    float _1690 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1664);
    float _1692 = _1688;
    if (!_1040)
    {
        _1382 = _1498;
    }
    float _1694 = _1382;
    float _1696 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1668);
    float _1698 = _1608 * 6.283185482025146484375;
    float _1700 = sin(_1698);
    float _1702 = _1694;
    if (_1026)
    {
        float _1704 = _1116 ? as_type<float>(_1646) : _1498;
        _1686 = _1704;
    }
    float _1706 = _1686;
    float _1708 = fma(_1338, _1606, _1690);
    if (_1032)
    {
        float _1710 = _1270 ? as_type<float>(_1656) : _1498;
        _1692 = _1710;
    }
    float _1712 = _1692;
    float _1714 = fma(_1342, _1606, _1696);
    if (_1040)
    {
        float _1716 = _972 ? as_type<float>(_1662) : _1498;
        _1702 = _1716;
    }
    float _1718 = _1702;
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1670);
    float _1722 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1724 = _1608 * 6.283185482025146484375;
    float _1726 = cos(_1724);
    float _1728 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1344, _1606, _1720);
    float _1732 = fma(_1722, _1718, -0.5);
    float _1734 = _1674 * _1082;
    float _1736 = fma(_1348, _1628, _1714);
    float _1738 = fma(_1346, _1628, _1708);
    float _1740 = fma(_1222, _1732, _1230);
    float _1742 = _1592 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1622 * _1700;
    float _1748 = _1590 * _1734;
    float _1750 = _1590 * _1700;
    float _1752 = _1700 * _1674;
    float _1754 = fma(_1362, _1610, _1736);
    float _1756 = fma(_1358, _1628, _1730);
    float _1758 = fma(_1360, _1610, _1738);
    float _1760 = _1590 * _1726;
    float _1762 = _1622 * _1726;
    float _1764 = _1726 * _1674;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1768 = _1622 * _1734;
    float _1770 = fma(_1364, _1610, _1756);
    float _1772 = fma(_1390, _1562, _1758);
    float _1774 = fma(_1398, _1562, _1754);
    float _1776 = -_1746;
    float _1778 = fma(_1744, _1760, _1776);
    float _1780 = -_1082;
    float _1782 = _1744 * _1780;
    float _1784 = fma(_1744, _1750, _1762);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1788 = fma(_1778, _1080, _1748);
    float _1790 = fma(_1764, _1080, _1782);
    float _1792 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1794 = fma(_1744, _1762, _1750);
    float _1796 = fma(_1784, _1130, _1788);
    float _1798 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1800 = fma(_1752, _1130, _1790);
    float _1802 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1792);
    float _1804 = _690 + _1796;
    float _1806 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1798);
    float _1808 = _684 + _1800;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1814 = _1804 + _1812;
    float _1816 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1802);
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1820 = _1808 + _1818;
    float _1822 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1806);
    float _1824 = _1814 * _1814;
    float _1826 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = -_1760;
    float _1830 = fma(_1744, _1746, _1828);
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1834 = fma(_1820, _1820, _1824);
    float _1836 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1838 = _1826 * _1766;
    float _1840 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1842 = fma(_1794, _1080, _1768);
    float _1844 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1846 = fma(_1404, _1562, _1770);
    float _1848 = sqrt(_1834);
    float _1850 = _1836 * _1810;
    float _1852 = _1728 * _1786;
    float _1854 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1856 = fma(_1830, _1130, _1842);
    float _1858 = fma(_1634, _1538, _1772);
    float _1860 = fma(_1632, _1538, _1774);
    float _1862 = _1844 + _1854;
    float _1864 = 1.0 / _1854;
    float _1866 = _1840 * _1832;
    float _1868 = _1028 + _1856;
    float _1870 = fma(_1636, _1538, _1846);
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1858);
    bool _1874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1876 = isnan(0.5);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1882 = _1878 || _1880;
    out.m_57.x = _1852;
    out.m_57.y = _1838;
    out.m_57.z = _1866;
    out.m_57.w = _1850;
    bool _1884 = _1848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1862 * _1864;
    float _1888 = _1886 * 0.5;
    float _1890 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1860);
    float _1892 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1870);
    float _1894 = _1838;
    float _1896 = _1808;
    float _1898 = _1804;
    float _1900 = _1834;
    if (!_1884)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    bool _1904 = !_1884;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1848 + _1910;
        float _1914 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = rsqrt(_1834);
        float _1918 = _1912 * _1908;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 + (-1.0);
        float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = fma(_1928, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = fma(_1868, _1924, _1932);
        float _1938 = _1916 * _1934;
        float _1940 = fma(_1820, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1942 = fma(_1814, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1936;
        _1896 = _1940;
        _1898 = _1942;
        _1900 = _1916;
    }
    float _1944 = _1906;
    float _1946 = _1896;
    float _1948 = _1898;
    float _1950 = _1900;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1954 = _1950;
    if (_1882)
    {
        _1954 = 1.0;
    }
    float _1956 = _1954;
    float _1958 = _1956;
    if (!_1882)
    {
        float _1960 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1962 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1964 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1974 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
        float _1976 = _1964 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        float _1980 = 1.0 / _1970;
        float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1982;
        float _1986 = _1966 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = _1978 * _1980;
        float _1992 = _1966 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1988 * _1990;
        float _1998 = 1.0 / _1974;
        float _2000 = 1.0 / _1996;
        float _2002 = 1.0 / _1984;
        float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2006 = _1998 * _2004;
        float _2008 = _1994 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_2008, _2006, _2010);
        float _2014 = _2012 * _2002;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1958 = _2016;
    }
    float _2018 = _1958;
    float _2020 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1952);
    float _2024 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2032 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2034 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2036 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2042 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2034);
    float _2044 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2052 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2050);
    float _2062 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2066 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2064);
    float _2074 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2066);
    float _2076 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2068);
    float _2078 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2074);
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2090 = _2018 > 0.0;
    bool _2092 = isnan(_2018);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2102 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = _2084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2086 + _2078;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _1740 + 0.5;
    float _2114 = _1684 + 0.5;
    float _2116 = _2106 * 0.5;
    out.m_59.x = _2088;
    out.m_59.y = _2110;
    out.m_59.z = _2104;
    out.m_59.w = _2082;
    out.m_61.x = _2112;
    out.m_61.y = _2114;
    out.m_35.x = _2108;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2076;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _2078;
    out.m_63.z = _2116;
    out.m_63.w = _2078;
    if (_2098)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_98);
        out.gl_Position.z = _2175;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_35.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_136);
        out.gl_Position.z = _2244;
    }
    if (_130)
    {
        return out;
    }
    float _138 = in.m_39.w;
    float _140 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _262 = _258;
    float _280;
    if (!_260)
    {
        float _264 = in.m_41.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_82);
        float _286 = 1.0 / _284;
        float _288 = _116 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_290);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_306;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _330;
    float _350 = _342 * _346;
    float _352 = -_342;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _326;
    float _364 = _322 * _354;
    float _366 = -_322;
    float _368 = _366 + 1.0;
    float _370 = _310 * _348;
    float _372 = _294 * _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = in.m_39.x;
    float _390 = in.m_39.y;
    float _392 = in.m_39.z;
    float _394 = _382 * _364;
    float _396 = _384 * _364;
    float _398 = _386 * _364;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _422 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _350, _412);
    float _426 = fma(_416, _350, _420);
    float _428 = fma(_418, _350, _422);
    float _430 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    bool _442 = !_360;
    float _460;
    if (!_442)
    {
        float _444 = in.m_41.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_82);
        float _466 = 1.0 / _464;
        float _468 = _116 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _470 + _562;
    bool _566 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = isnan(_470);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _578;
    float _582 = _558 * _544;
    float _584 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _470 + _586;
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _580 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _592;
    float _600 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _602 = fma(_584, _534, _596);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _606 = fma(_600, _598, _602);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _610;
    out.m_43.y = _616;
    out.m_43.z = _618;
    out.m_43.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_41.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_82);
        float _646 = 1.0 / _644;
        float _648 = _116 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_45.x;
    float _654 = in.m_45.y;
    float _656 = in.m_45.z;
    float _658 = in.m_45.w;
    float _660 = in.m_47.x;
    float _662 = in.m_47.y;
    float _664 = in.m_47.z;
    float _666 = in.m_47.w;
    float _668 = in.m_41.y;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _670 = _256 * _654;
    float _672 = _256 * _662;
    float _674 = fma(_254, _652, _670);
    float _676 = in.m_51.y;
    float _678 = fma(_254, _660, _672);
    float _680 = fma(_258, _656, _674);
    float _682 = fma(_258, _664, _678);
    float _684 = _680 + _658;
    float _686 = in.m_41.z;
    float _688 = in.m_41.w;
    float _690 = _682 + _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _684 + _692;
    float _696 = -_690;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = abs(_694);
    float _702 = abs(_698);
    float _704 = precise::max(_700, _702);
    bool _706 = _704 >= 16.0;
    float _708 = in.m_53.x;
    float _710 = in.m_53.y;
    float _712 = in.m_53.z;
    float _714 = in.m_53.w;
    float _716 = _694;
    float _718 = _698;
    float _720 = _676;
    float _722 = _650;
    if (_706)
    {
        float _724 = _694 * 0.0625;
        _716 = _724;
    }
    float _726 = _716;
    if (_706)
    {
        float _728 = _698 * 0.0625;
        _718 = _728;
    }
    float _730 = _718;
    float _732 = abs(_726);
    bool _734 = _732 != 0.0;
    bool _736 = isnan(_732);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = abs(_730);
    bool _746 = _744 == 0.0;
    bool _748 = !_742;
    bool _750 = _746 && _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _762 = _760 != 0;
    bool _764 = _688 > 0.5;
    bool _766 = !_758;
    int _768 = _766 ? 0 : 1;
    float _770 = abs(_730);
    bool _772 = _770 == 0.0;
    bool _774 = false;
    int _776 = as_type<int>(_688);
    bool _778 = _764;
    if (_750)
    {
        bool _780 = as_type<int>(_730) >= 0;
        _774 = _780;
    }
    bool _782 = _774;
    bool _784 = !_754;
    int _786 = _784 ? 0 : 1;
    int _788 = _782 ? (-1) : 0;
    if (_750)
    {
        int _790 = _782 ? 0 : 1078530011;
        _776 = _790;
    }
    int _792 = _776;
    bool _794 = !_762;
    int _796 = _794 ? 0 : 1;
    float _798 = 0.0;
    int _800 = _792;
    if (_750)
    {
        int _802 = int(0x80000000) & as_type<int>(_726);
        int _804 = _792 | _802;
        _798 = as_type<float>(_804);
    }
    float _806 = _798;
    bool _808 = !_742;
    bool _810 = _808 && _772;
    float _812 = _806;
    float _814 = _806;
    float _816 = _714;
    if (!_810)
    {
        float _818 = abs(_726);
        bool _820 = _818 != as_type<float>(0x7f800000u /* inf */);
        bool _822 = isnan(_818);
        bool _824 = _820 || _822;
        bool _826 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _828 = _824 || _826;
        float _830 = abs(_730);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        float _834 = abs(_730);
        bool _836 = _834 == as_type<float>(0x7f800000u /* inf */);
        bool _838 = !_828;
        bool _840 = _836 && _838;
        if (_840)
        {
            bool _842 = as_type<int>(_730) >= 0;
            _788 = _842 ? (-1) : 0;
        }
        int _844 = _788;
        if (_840)
        {
            _800 = 1075235812;
        }
        int _846 = _800;
        int _848 = _846;
        if (_840)
        {
            int _850 = ~_844;
            int _852 = (_850 != 0) ? _846 : 1061752795;
            _848 = _852;
        }
        int _854 = _848;
        if (_840)
        {
            int _856 = int(0x80000000) & as_type<int>(_726);
            int _858 = _854 | _856;
            _812 = as_type<float>(_858);
        }
        float _860 = _812;
        bool _862 = !_828;
        bool _864 = _862 && _832;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_726);
            float _868 = abs(_730);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_726);
            float _874 = abs(_730);
            float _876 = _872 + _874;
            float _878 = abs(_726);
            float _880 = abs(_730);
            float _882 = precise::min(_878, _880);
            float _884 = 1.0 / _870;
            float _886 = abs(_726);
            float _888 = abs(_730);
            bool _890 = _886 > _888;
            bool _892 = as_type<int>(_730) >= 0;
            bool _894 = _876 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_876);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            int _904 = as_type<int>(_726) & int(0x80000000);
            float _906 = _882 * _884;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _876;
            if (_890)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_892)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_902)
            {
                int _944 = _904 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_676;
    float _950 = _948 + 1.0;
    float _952 = in.m_55.x;
    float _954 = in.m_55.y;
    float _956 = in.m_55.z;
    bool _958 = _686 > 0.5;
    float _960 = _256 * _710;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _964 = _962 != 0;
    float _966 = in.m_41.x;
    int _968 = _958 ? as_type<int>(_950) : as_type<int>(_676);
    float _970 = fma(_254, _708, _960);
    bool _972 = _668 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _976 = 1.0 + _974;
    float _978 = _964 ? as_type<float>(_968) : _676;
    float _980 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _996 = _972 ? as_type<int>(_950) : as_type<int>(_676);
    float _998 = fma(_258, _712, _970);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _650 + _1000;
    float _1004 = 1.0 / _976;
    float _1006 = _992 ? as_type<float>(_996) : _676;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _650 + _1008;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = _650 + _1020;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = _998 + _714;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1032 = _1030 != 0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1034;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1002;
    if (_984)
    {
        float _1050 = _764 ? _950 : _676;
        _720 = _1050;
    }
    float _1052 = _720;
    float _1054 = 1.0 / _1018;
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    if (_1014)
    {
        _1046 = _966;
    }
    float _1070 = _1046;
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1076 = 1.0 / _1044;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1080 = _1072 * _980;
    float _1082 = _1074 * _994;
    float _1084 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1070;
    if (_1014)
    {
        _262 = _1070;
    }
    float _1088 = _262;
    float _1090 = _988 * _116;
    float _1092 = _1088;
    if (!_1014)
    {
        _1086 = _966;
    }
    float _1094 = _1086;
    float _1096 = 1.0 / _1068;
    float _1098 = _1010 * _1054;
    if (!_1014)
    {
        _1092 = _686;
    }
    float _1100 = _1092;
    float _1102 = _1094 * 2.0;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1104;
    float _1108 = 1.0 / _1036;
    float _1110 = _1022 * _1076;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1026)
    {
        bool _1114 = _966 > 0.5;
        _778 = _1114;
    }
    bool _1116 = _778;
    float _1118 = (*spvDescriptorSet0.vp_c16)._m0[3].x;
    if (_1032)
    {
        float _1120 = in.m_41.z;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1126 = _650 + _1124;
    float _1128 = 1.0 / _1106;
    float _1130 = _1078 * _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1134 = _650 + _1132;
    float _1136 = _668 + _1094;
    float _1138 = _1134 * _1096;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1142 = _650 + _1140;
    float _1144 = exp2(_1090);
    float _1146 = _1002 * _1108;
    if (_1014)
    {
        _1048 = _668;
    }
    float _1148 = _1048;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1152 = _1148;
    if (!_1014)
    {
        _1152 = _1094;
    }
    float _1154 = _1152;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = _1142 * _1128;
    float _1170 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1172 = floor(_1102);
    float _1174 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1180 = -_1156;
    float _1182 = fma(_1170, 2.0, _1180);
    float _1184 = _686 * 2.0;
    float _1186 = -_1144;
    float _1188 = _1186 + 1.0;
    float _1190 = _668 * 2.0;
    float _1192 = fma(_1174, -2.0, _1150);
    float _1194 = 1.0 / _1178;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1112);
    float _1202 = _668 + _686;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1196);
    float _1206 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1192);
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = floor(_1184);
    float _1220 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1200);
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1204);
    int _1224 = _1216 ? 0 : 1;
    float _1226 = _1202 + (-1.0);
    float _1228 = -_116;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    if (_1064)
    {
        float _1232 = _1198 * _1004;
        _120 = _1232;
    }
    float _1234 = _120;
    float _1236 = floor(_1190);
    float _1238 = _1126 * _1194;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1248 = _1136 + (-1.0);
    int _1250 = abs(_786);
    bool _1252 = _1218 >= 0.0;
    bool _1254 = isnan(_1218);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = _1218 > 0.0;
    int _1264 = _1260 ? 0 : 1;
    bool _1266 = _1260;
    if (_1032)
    {
        bool _1268 = _1122 > 0.5;
        _1266 = _1268;
    }
    bool _1270 = _1266;
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1282 = ~_1264;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1288;
    float _1292 = fma(_1276, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1294;
    int _1298 = _1286;
    if (!_1262)
    {
        int _1300 = ~_1264;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = fma(_1290, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1308 = fma(_1296, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1314 = _1236 >= 0.0;
    bool _1316 = isnan(_1236);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1332;
    int _1336 = _1322 ? 0 : 1;
    float _1338 = fma(_1280, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1340 = _1236 > 0.0;
    float _1342 = fma(_1312, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1344 = fma(_1326, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1346 = fma(_1330, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1348 = fma(_1334, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1358 = fma(_1242, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1360 = fma(_1352, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1362 = fma(_1356, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1364 = fma(_1246, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1370;
    int _1374 = ~_1336;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1378;
    float _1382 = _1306;
    if (!_1340)
    {
        int _1384 = ~_1336;
        int _1386 = _1384 + 1;
        _1380 = _1386;
    }
    int _1388 = _1380;
    float _1390 = fma(_1368, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1392 = _1172 > 0.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1394;
    float _1398 = fma(_1372, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    int _1400 = abs(_796);
    float _1402 = _686 + _1094;
    float _1404 = fma(_1396, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1406 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = _1402 + (-1.0);
    int _1410 = abs(_768);
    float _1412 = _1094 + (-0.5);
    float _1414 = float(_1250);
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1418 = float(_1304);
    float _1420 = _686 + (-0.5);
    float _1422 = float(_1400);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1426 = float(_1388);
    float _1428 = _1414 * _1418;
    int _1430 = ~_1224;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1440 = _1422 * _1426;
    int _1442 = _1434;
    int _1444 = as_type<int>(_1438);
    if (!_1392)
    {
        int _1446 = ~_1224;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    float _1452 = _1428 * (-2.0);
    float _1454 = float(_1410);
    float _1456 = _1440 * (-2.0);
    float _1458 = float(_1450);
    float _1460 = fma(_1406, _1452, _1406);
    bool _1462 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1464 = isnan(_650);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1416, _1456, _1416);
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1478 = _1454 * _1458;
    float _1480 = fma(_1460, _1234, _1424);
    bool _1482 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1484 = isnan(_650);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1496 = _1478 * (-2.0);
    float _1498 = in.m_51.x;
    float _1500 = fma(_1474, _1234, _1476);
    bool _1502 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1504 = isnan(_650);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1272, _1496, _1272);
    float _1516 = _668 + (-0.5);
    float _1518 = -_1492;
    float _1520 = _1518 + 1.0;
    bool _1522 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1524 = isnan(_650);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1480 * 0.15915493667125701904296875;
    float _1536 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1538 = _1512 * _1520;
    float _1540 = -_1512;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1548 = fma(_1514, _1234, _1536);
    bool _1550 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1552 = isnan(_650);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1532 * _1542;
    bool _1564 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1566 = isnan(_650);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -_1532;
    float _1578 = _1576 + 1.0;
    float _1580 = -_946;
    float _1582 = _1548 + _1580;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1534 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = _1500 * 0.15915493667125701904296875;
    bool _1594 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1596 = isnan(_650);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1472 * _1586;
    float _1608 = _1582 * 0.15915493667125701904296875;
    float _1610 = _1574 * _1578;
    float _1612 = -_1574;
    float _1614 = _1612 + 1.0;
    float _1616 = -_1472;
    float _1618 = _1616 + 1.0;
    float _1620 = _1534 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1628 = _1560 * _1614;
    float _1630 = _1604 * _1618;
    float _1632 = fma(_1438, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1634 = fma(_1626, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1636 = fma(_1546, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1638 = as_type<int>(_1546);
    int _1640 = as_type<int>(_1614);
    if (_1026)
    {
        float _1642 = -_1498;
        float _1644 = _1642 + 1.0;
        _1444 = as_type<int>(_1644);
    }
    int _1646 = _1444;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1650 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1032)
    {
        float _1652 = -_1498;
        float _1654 = _1652 + 1.0;
        _1638 = as_type<int>(_1654);
    }
    int _1656 = _1638;
    if (_1040)
    {
        float _1658 = -_1498;
        float _1660 = _1658 + 1.0;
        _1640 = as_type<int>(_1660);
    }
    int _1662 = _1640;
    float _1664 = _1292 * _1630;
    float _1666 = fma(_978, _1650, -0.5);
    float _1668 = _1306 * _1630;
    float _1670 = _1308 * _1630;
    float _1672 = _1592 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = -_1604;
    float _1678 = _1676 + 1.0;
    if (!_1026)
    {
        _722 = _1498;
    }
    float _1680 = _722;
    float _1682 = -_1206;
    float _1684 = fma(_1220, _1666, _1682);
    float _1686 = _1680;
    if (!_1032)
    {
        _816 = _1498;
    }
    float _1688 = _816;
    float _1690 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1664);
    float _1692 = _1688;
    if (!_1040)
    {
        _1382 = _1498;
    }
    float _1694 = _1382;
    float _1696 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1668);
    float _1698 = _1608 * 6.283185482025146484375;
    float _1700 = sin(_1698);
    float _1702 = _1694;
    if (_1026)
    {
        float _1704 = _1116 ? as_type<float>(_1646) : _1498;
        _1686 = _1704;
    }
    float _1706 = _1686;
    float _1708 = fma(_1338, _1606, _1690);
    if (_1032)
    {
        float _1710 = _1270 ? as_type<float>(_1656) : _1498;
        _1692 = _1710;
    }
    float _1712 = _1692;
    float _1714 = fma(_1342, _1606, _1696);
    if (_1040)
    {
        float _1716 = _972 ? as_type<float>(_1662) : _1498;
        _1702 = _1716;
    }
    float _1718 = _1702;
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1670);
    float _1722 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1724 = _1608 * 6.283185482025146484375;
    float _1726 = cos(_1724);
    float _1728 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1344, _1606, _1720);
    float _1732 = fma(_1722, _1718, -0.5);
    float _1734 = _1674 * _1082;
    float _1736 = fma(_1348, _1628, _1714);
    float _1738 = fma(_1346, _1628, _1708);
    float _1740 = fma(_1222, _1732, _1230);
    float _1742 = _1592 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1622 * _1700;
    float _1748 = _1590 * _1734;
    float _1750 = _1590 * _1700;
    float _1752 = _1700 * _1674;
    float _1754 = fma(_1362, _1610, _1736);
    float _1756 = fma(_1358, _1628, _1730);
    float _1758 = fma(_1360, _1610, _1738);
    float _1760 = _1590 * _1726;
    float _1762 = _1622 * _1726;
    float _1764 = _1726 * _1674;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1768 = _1622 * _1734;
    float _1770 = fma(_1364, _1610, _1756);
    float _1772 = fma(_1390, _1562, _1758);
    float _1774 = fma(_1398, _1562, _1754);
    float _1776 = -_1746;
    float _1778 = fma(_1744, _1760, _1776);
    float _1780 = -_1082;
    float _1782 = _1744 * _1780;
    float _1784 = fma(_1744, _1750, _1762);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1788 = fma(_1778, _1080, _1748);
    float _1790 = fma(_1764, _1080, _1782);
    float _1792 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1794 = fma(_1744, _1762, _1750);
    float _1796 = fma(_1784, _1130, _1788);
    float _1798 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1800 = fma(_1752, _1130, _1790);
    float _1802 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1792);
    float _1804 = _690 + _1796;
    float _1806 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1798);
    float _1808 = _684 + _1800;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1814 = _1804 + _1812;
    float _1816 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1802);
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1820 = _1808 + _1818;
    float _1822 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1806);
    float _1824 = _1814 * _1814;
    float _1826 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = -_1760;
    float _1830 = fma(_1744, _1746, _1828);
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1834 = fma(_1820, _1820, _1824);
    float _1836 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1838 = _1826 * _1766;
    float _1840 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1842 = fma(_1794, _1080, _1768);
    float _1844 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1846 = fma(_1404, _1562, _1770);
    float _1848 = sqrt(_1834);
    float _1850 = _1836 * _1810;
    float _1852 = _1728 * _1786;
    float _1854 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1856 = fma(_1830, _1130, _1842);
    float _1858 = fma(_1634, _1538, _1772);
    float _1860 = fma(_1632, _1538, _1774);
    float _1862 = _1844 + _1854;
    float _1864 = 1.0 / _1854;
    float _1866 = _1840 * _1832;
    float _1868 = _1028 + _1856;
    float _1870 = fma(_1636, _1538, _1846);
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1858);
    bool _1874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1876 = isnan(0.5);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1882 = _1878 || _1880;
    out.m_57.x = _1852;
    out.m_57.y = _1838;
    out.m_57.z = _1866;
    out.m_57.w = _1850;
    bool _1884 = _1848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1862 * _1864;
    float _1888 = _1886 * 0.5;
    float _1890 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1860);
    float _1892 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1870);
    float _1894 = _1838;
    float _1896 = _1808;
    float _1898 = _1804;
    float _1900 = _1834;
    if (!_1884)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    bool _1904 = !_1884;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1848 + _1910;
        float _1914 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = rsqrt(_1834);
        float _1918 = _1912 * _1908;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 + (-1.0);
        float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = fma(_1928, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = fma(_1868, _1924, _1932);
        float _1938 = _1916 * _1934;
        float _1940 = fma(_1820, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1942 = fma(_1814, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1936;
        _1896 = _1940;
        _1898 = _1942;
        _1900 = _1916;
    }
    float _1944 = _1906;
    float _1946 = _1896;
    float _1948 = _1898;
    float _1950 = _1900;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1954 = _1950;
    if (_1882)
    {
        _1954 = 1.0;
    }
    float _1956 = _1954;
    float _1958 = _1956;
    if (!_1882)
    {
        float _1960 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1962 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1964 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1974 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
        float _1976 = _1964 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        float _1980 = 1.0 / _1970;
        float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1982;
        float _1986 = _1966 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = _1978 * _1980;
        float _1992 = _1966 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1988 * _1990;
        float _1998 = 1.0 / _1974;
        float _2000 = 1.0 / _1996;
        float _2002 = 1.0 / _1984;
        float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2006 = _1998 * _2004;
        float _2008 = _1994 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_2008, _2006, _2010);
        float _2014 = _2012 * _2002;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1958 = _2016;
    }
    float _2018 = _1958;
    float _2020 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1952);
    float _2024 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2032 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2034 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2036 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2042 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2034);
    float _2044 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2052 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2050);
    float _2062 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2066 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2064);
    float _2074 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2066);
    float _2076 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2068);
    float _2078 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2074);
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2090 = _2018 > 0.0;
    bool _2092 = isnan(_2018);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2102 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = _2084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2086 + _2078;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _1740 + 0.5;
    float _2114 = _1684 + 0.5;
    float _2116 = _2106 * 0.5;
    out.m_59.x = _2088;
    out.m_59.y = _2110;
    out.m_59.z = _2104;
    out.m_59.w = _2082;
    out.m_61.x = _2112;
    out.m_61.y = _2114;
    out.m_35.x = _2108;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2076;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _2078;
    out.m_63.z = _2116;
    out.m_63.w = _2078;
    if (_2098)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_98);
        out.gl_Position.z = _2175;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_35.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_136);
        out.gl_Position.z = _2244;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_39.w;
    float _140 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _262 = _258;
    float _280;
    if (!_260)
    {
        float _264 = in.m_41.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_82);
        float _286 = 1.0 / _284;
        float _288 = _116 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_290);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -_306;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _330;
    float _350 = _342 * _346;
    float _352 = -_342;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _326;
    float _364 = _322 * _354;
    float _366 = -_322;
    float _368 = _366 + 1.0;
    float _370 = _310 * _348;
    float _372 = _294 * _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = in.m_39.x;
    float _390 = in.m_39.y;
    float _392 = in.m_39.z;
    float _394 = _382 * _364;
    float _396 = _384 * _364;
    float _398 = _386 * _364;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_410, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _422 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _350, _412);
    float _426 = fma(_416, _350, _420);
    float _428 = fma(_418, _350, _422);
    float _430 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    float _440 = _434 * _392;
    bool _442 = !_360;
    float _460;
    if (!_442)
    {
        float _444 = in.m_41.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_82);
        float _466 = 1.0 / _464;
        float _468 = _116 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _470 + _562;
    bool _566 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = isnan(_470);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _578;
    float _582 = _558 * _544;
    float _584 = fma(_560, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _470 + _586;
    float _590 = -_576;
    float _592 = _590 + 1.0;
    float _594 = _580 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _592;
    float _600 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _602 = fma(_584, _534, _596);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _606 = fma(_600, _598, _602);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _610;
    out.m_43.y = _616;
    out.m_43.z = _618;
    out.m_43.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_41.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_82);
        float _646 = 1.0 / _644;
        float _648 = _116 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_45.x;
    float _654 = in.m_45.y;
    float _656 = in.m_45.z;
    float _658 = in.m_45.w;
    float _660 = in.m_47.x;
    float _662 = in.m_47.y;
    float _664 = in.m_47.z;
    float _666 = in.m_47.w;
    float _668 = in.m_41.y;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _670 = _256 * _654;
    float _672 = _256 * _662;
    float _674 = fma(_254, _652, _670);
    float _676 = in.m_51.y;
    float _678 = fma(_254, _660, _672);
    float _680 = fma(_258, _656, _674);
    float _682 = fma(_258, _664, _678);
    float _684 = _680 + _658;
    float _686 = in.m_41.z;
    float _688 = in.m_41.w;
    float _690 = _682 + _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _684 + _692;
    float _696 = -_690;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = abs(_694);
    float _702 = abs(_698);
    float _704 = precise::max(_700, _702);
    bool _706 = _704 >= 16.0;
    float _708 = in.m_53.x;
    float _710 = in.m_53.y;
    float _712 = in.m_53.z;
    float _714 = in.m_53.w;
    float _716 = _694;
    float _718 = _698;
    float _720 = _676;
    float _722 = _650;
    if (_706)
    {
        float _724 = _694 * 0.0625;
        _716 = _724;
    }
    float _726 = _716;
    if (_706)
    {
        float _728 = _698 * 0.0625;
        _718 = _728;
    }
    float _730 = _718;
    float _732 = abs(_726);
    bool _734 = _732 != 0.0;
    bool _736 = isnan(_732);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = abs(_730);
    bool _746 = _744 == 0.0;
    bool _748 = !_742;
    bool _750 = _746 && _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _762 = _760 != 0;
    bool _764 = _688 > 0.5;
    bool _766 = !_758;
    int _768 = _766 ? 0 : 1;
    float _770 = abs(_730);
    bool _772 = _770 == 0.0;
    bool _774 = false;
    int _776 = as_type<int>(_688);
    bool _778 = _764;
    if (_750)
    {
        bool _780 = as_type<int>(_730) >= 0;
        _774 = _780;
    }
    bool _782 = _774;
    bool _784 = !_754;
    int _786 = _784 ? 0 : 1;
    int _788 = _782 ? (-1) : 0;
    if (_750)
    {
        int _790 = _782 ? 0 : 1078530011;
        _776 = _790;
    }
    int _792 = _776;
    bool _794 = !_762;
    int _796 = _794 ? 0 : 1;
    float _798 = 0.0;
    int _800 = _792;
    if (_750)
    {
        int _802 = int(0x80000000) & as_type<int>(_726);
        int _804 = _792 | _802;
        _798 = as_type<float>(_804);
    }
    float _806 = _798;
    bool _808 = !_742;
    bool _810 = _808 && _772;
    float _812 = _806;
    float _814 = _806;
    float _816 = _714;
    if (!_810)
    {
        float _818 = abs(_726);
        bool _820 = _818 != as_type<float>(0x7f800000u /* inf */);
        bool _822 = isnan(_818);
        bool _824 = _820 || _822;
        bool _826 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _828 = _824 || _826;
        float _830 = abs(_730);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        float _834 = abs(_730);
        bool _836 = _834 == as_type<float>(0x7f800000u /* inf */);
        bool _838 = !_828;
        bool _840 = _836 && _838;
        if (_840)
        {
            bool _842 = as_type<int>(_730) >= 0;
            _788 = _842 ? (-1) : 0;
        }
        int _844 = _788;
        if (_840)
        {
            _800 = 1075235812;
        }
        int _846 = _800;
        int _848 = _846;
        if (_840)
        {
            int _850 = ~_844;
            int _852 = (_850 != 0) ? _846 : 1061752795;
            _848 = _852;
        }
        int _854 = _848;
        if (_840)
        {
            int _856 = int(0x80000000) & as_type<int>(_726);
            int _858 = _854 | _856;
            _812 = as_type<float>(_858);
        }
        float _860 = _812;
        bool _862 = !_828;
        bool _864 = _862 && _832;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_726);
            float _868 = abs(_730);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_726);
            float _874 = abs(_730);
            float _876 = _872 + _874;
            float _878 = abs(_726);
            float _880 = abs(_730);
            float _882 = precise::min(_878, _880);
            float _884 = 1.0 / _870;
            float _886 = abs(_726);
            float _888 = abs(_730);
            bool _890 = _886 > _888;
            bool _892 = as_type<int>(_730) >= 0;
            bool _894 = _876 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_876);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            int _904 = as_type<int>(_726) & int(0x80000000);
            float _906 = _882 * _884;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _876;
            if (_890)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_892)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_902)
            {
                int _944 = _904 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_676;
    float _950 = _948 + 1.0;
    float _952 = in.m_55.x;
    float _954 = in.m_55.y;
    float _956 = in.m_55.z;
    bool _958 = _686 > 0.5;
    float _960 = _256 * _710;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _964 = _962 != 0;
    float _966 = in.m_41.x;
    int _968 = _958 ? as_type<int>(_950) : as_type<int>(_676);
    float _970 = fma(_254, _708, _960);
    bool _972 = _668 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _976 = 1.0 + _974;
    float _978 = _964 ? as_type<float>(_968) : _676;
    float _980 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _996 = _972 ? as_type<int>(_950) : as_type<int>(_676);
    float _998 = fma(_258, _712, _970);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _650 + _1000;
    float _1004 = 1.0 / _976;
    float _1006 = _992 ? as_type<float>(_996) : _676;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1010 = _650 + _1008;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = _650 + _1020;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1026 = _1024 != 0;
    float _1028 = _998 + _714;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1032 = _1030 != 0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1034;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1002;
    if (_984)
    {
        float _1050 = _764 ? _950 : _676;
        _720 = _1050;
    }
    float _1052 = _720;
    float _1054 = 1.0 / _1018;
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    if (_1014)
    {
        _1046 = _966;
    }
    float _1070 = _1046;
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1076 = 1.0 / _1044;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1080 = _1072 * _980;
    float _1082 = _1074 * _994;
    float _1084 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1086 = _1070;
    if (_1014)
    {
        _262 = _1070;
    }
    float _1088 = _262;
    float _1090 = _988 * _116;
    float _1092 = _1088;
    if (!_1014)
    {
        _1086 = _966;
    }
    float _1094 = _1086;
    float _1096 = 1.0 / _1068;
    float _1098 = _1010 * _1054;
    if (!_1014)
    {
        _1092 = _686;
    }
    float _1100 = _1092;
    float _1102 = _1094 * 2.0;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1104;
    float _1108 = 1.0 / _1036;
    float _1110 = _1022 * _1076;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1026)
    {
        bool _1114 = _966 > 0.5;
        _778 = _1114;
    }
    bool _1116 = _778;
    float _1118 = (*spvDescriptorSet0.vp_c16)._m0[3].x;
    if (_1032)
    {
        float _1120 = in.m_41.z;
        _1118 = _1120;
    }
    float _1122 = _1118;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1126 = _650 + _1124;
    float _1128 = 1.0 / _1106;
    float _1130 = _1078 * _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1134 = _650 + _1132;
    float _1136 = _668 + _1094;
    float _1138 = _1134 * _1096;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1142 = _650 + _1140;
    float _1144 = exp2(_1090);
    float _1146 = _1002 * _1108;
    if (_1014)
    {
        _1048 = _668;
    }
    float _1148 = _1048;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1152 = _1148;
    if (!_1014)
    {
        _1152 = _1094;
    }
    float _1154 = _1152;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = _1142 * _1128;
    float _1170 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1172 = floor(_1102);
    float _1174 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1180 = -_1156;
    float _1182 = fma(_1170, 2.0, _1180);
    float _1184 = _686 * 2.0;
    float _1186 = -_1144;
    float _1188 = _1186 + 1.0;
    float _1190 = _668 * 2.0;
    float _1192 = fma(_1174, -2.0, _1150);
    float _1194 = 1.0 / _1178;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1112);
    float _1202 = _668 + _686;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1196);
    float _1206 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1192);
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = floor(_1184);
    float _1220 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1200);
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1204);
    int _1224 = _1216 ? 0 : 1;
    float _1226 = _1202 + (-1.0);
    float _1228 = -_116;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1182);
    if (_1064)
    {
        float _1232 = _1198 * _1004;
        _120 = _1232;
    }
    float _1234 = _120;
    float _1236 = floor(_1190);
    float _1238 = _1126 * _1194;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1248 = _1136 + (-1.0);
    int _1250 = abs(_786);
    bool _1252 = _1218 >= 0.0;
    bool _1254 = isnan(_1218);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = _1218 > 0.0;
    int _1264 = _1260 ? 0 : 1;
    bool _1266 = _1260;
    if (_1032)
    {
        bool _1268 = _1122 > 0.5;
        _1266 = _1268;
    }
    bool _1270 = _1266;
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1282 = ~_1264;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1288;
    float _1292 = fma(_1276, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1294;
    int _1298 = _1286;
    if (!_1262)
    {
        int _1300 = ~_1264;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = fma(_1290, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1308 = fma(_1296, _1110, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1314 = _1236 >= 0.0;
    bool _1316 = isnan(_1236);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1332;
    int _1336 = _1322 ? 0 : 1;
    float _1338 = fma(_1280, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1340 = _1236 > 0.0;
    float _1342 = fma(_1312, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1344 = fma(_1326, _1098, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1346 = fma(_1330, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1348 = fma(_1334, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1358 = fma(_1242, _1146, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1360 = fma(_1352, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1362 = fma(_1356, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1364 = fma(_1246, _1138, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1370;
    int _1374 = ~_1336;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1378;
    float _1382 = _1306;
    if (!_1340)
    {
        int _1384 = ~_1336;
        int _1386 = _1384 + 1;
        _1380 = _1386;
    }
    int _1388 = _1380;
    float _1390 = fma(_1368, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1392 = _1172 > 0.0;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1394;
    float _1398 = fma(_1372, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    int _1400 = abs(_796);
    float _1402 = _686 + _1094;
    float _1404 = fma(_1396, _1168, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1406 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1408 = _1402 + (-1.0);
    int _1410 = abs(_768);
    float _1412 = _1094 + (-0.5);
    float _1414 = float(_1250);
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1418 = float(_1304);
    float _1420 = _686 + (-0.5);
    float _1422 = float(_1400);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1426 = float(_1388);
    float _1428 = _1414 * _1418;
    int _1430 = ~_1224;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1440 = _1422 * _1426;
    int _1442 = _1434;
    int _1444 = as_type<int>(_1438);
    if (!_1392)
    {
        int _1446 = ~_1224;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    float _1452 = _1428 * (-2.0);
    float _1454 = float(_1410);
    float _1456 = _1440 * (-2.0);
    float _1458 = float(_1450);
    float _1460 = fma(_1406, _1452, _1406);
    bool _1462 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1464 = isnan(_650);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1416, _1456, _1416);
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1478 = _1454 * _1458;
    float _1480 = fma(_1460, _1234, _1424);
    bool _1482 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1484 = isnan(_650);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1496 = _1478 * (-2.0);
    float _1498 = in.m_51.x;
    float _1500 = fma(_1474, _1234, _1476);
    bool _1502 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1504 = isnan(_650);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1272, _1496, _1272);
    float _1516 = _668 + (-0.5);
    float _1518 = -_1492;
    float _1520 = _1518 + 1.0;
    bool _1522 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1524 = isnan(_650);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1480 * 0.15915493667125701904296875;
    float _1536 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1538 = _1512 * _1520;
    float _1540 = -_1512;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1548 = fma(_1514, _1234, _1536);
    bool _1550 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1552 = isnan(_650);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1532 * _1542;
    bool _1564 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1566 = isnan(_650);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -_1532;
    float _1578 = _1576 + 1.0;
    float _1580 = -_946;
    float _1582 = _1548 + _1580;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1534 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = _1500 * 0.15915493667125701904296875;
    bool _1594 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1596 = isnan(_650);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1472 * _1586;
    float _1608 = _1582 * 0.15915493667125701904296875;
    float _1610 = _1574 * _1578;
    float _1612 = -_1574;
    float _1614 = _1612 + 1.0;
    float _1616 = -_1472;
    float _1618 = _1616 + 1.0;
    float _1620 = _1534 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1628 = _1560 * _1614;
    float _1630 = _1604 * _1618;
    float _1632 = fma(_1438, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1634 = fma(_1626, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1636 = fma(_1546, _1238, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    int _1638 = as_type<int>(_1546);
    int _1640 = as_type<int>(_1614);
    if (_1026)
    {
        float _1642 = -_1498;
        float _1644 = _1642 + 1.0;
        _1444 = as_type<int>(_1644);
    }
    int _1646 = _1444;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1650 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1032)
    {
        float _1652 = -_1498;
        float _1654 = _1652 + 1.0;
        _1638 = as_type<int>(_1654);
    }
    int _1656 = _1638;
    if (_1040)
    {
        float _1658 = -_1498;
        float _1660 = _1658 + 1.0;
        _1640 = as_type<int>(_1660);
    }
    int _1662 = _1640;
    float _1664 = _1292 * _1630;
    float _1666 = fma(_978, _1650, -0.5);
    float _1668 = _1306 * _1630;
    float _1670 = _1308 * _1630;
    float _1672 = _1592 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = -_1604;
    float _1678 = _1676 + 1.0;
    if (!_1026)
    {
        _722 = _1498;
    }
    float _1680 = _722;
    float _1682 = -_1206;
    float _1684 = fma(_1220, _1666, _1682);
    float _1686 = _1680;
    if (!_1032)
    {
        _816 = _1498;
    }
    float _1688 = _816;
    float _1690 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1664);
    float _1692 = _1688;
    if (!_1040)
    {
        _1382 = _1498;
    }
    float _1694 = _1382;
    float _1696 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1668);
    float _1698 = _1608 * 6.283185482025146484375;
    float _1700 = sin(_1698);
    float _1702 = _1694;
    if (_1026)
    {
        float _1704 = _1116 ? as_type<float>(_1646) : _1498;
        _1686 = _1704;
    }
    float _1706 = _1686;
    float _1708 = fma(_1338, _1606, _1690);
    if (_1032)
    {
        float _1710 = _1270 ? as_type<float>(_1656) : _1498;
        _1692 = _1710;
    }
    float _1712 = _1692;
    float _1714 = fma(_1342, _1606, _1696);
    if (_1040)
    {
        float _1716 = _972 ? as_type<float>(_1662) : _1498;
        _1702 = _1716;
    }
    float _1718 = _1702;
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1670);
    float _1722 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1724 = _1608 * 6.283185482025146484375;
    float _1726 = cos(_1724);
    float _1728 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1344, _1606, _1720);
    float _1732 = fma(_1722, _1718, -0.5);
    float _1734 = _1674 * _1082;
    float _1736 = fma(_1348, _1628, _1714);
    float _1738 = fma(_1346, _1628, _1708);
    float _1740 = fma(_1222, _1732, _1230);
    float _1742 = _1592 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1622 * _1700;
    float _1748 = _1590 * _1734;
    float _1750 = _1590 * _1700;
    float _1752 = _1700 * _1674;
    float _1754 = fma(_1362, _1610, _1736);
    float _1756 = fma(_1358, _1628, _1730);
    float _1758 = fma(_1360, _1610, _1738);
    float _1760 = _1590 * _1726;
    float _1762 = _1622 * _1726;
    float _1764 = _1726 * _1674;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1768 = _1622 * _1734;
    float _1770 = fma(_1364, _1610, _1756);
    float _1772 = fma(_1390, _1562, _1758);
    float _1774 = fma(_1398, _1562, _1754);
    float _1776 = -_1746;
    float _1778 = fma(_1744, _1760, _1776);
    float _1780 = -_1082;
    float _1782 = _1744 * _1780;
    float _1784 = fma(_1744, _1750, _1762);
    float _1786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1788 = fma(_1778, _1080, _1748);
    float _1790 = fma(_1764, _1080, _1782);
    float _1792 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1794 = fma(_1744, _1762, _1750);
    float _1796 = fma(_1784, _1130, _1788);
    float _1798 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1800 = fma(_1752, _1130, _1790);
    float _1802 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1792);
    float _1804 = _690 + _1796;
    float _1806 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1798);
    float _1808 = _684 + _1800;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1814 = _1804 + _1812;
    float _1816 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1802);
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1820 = _1808 + _1818;
    float _1822 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1806);
    float _1824 = _1814 * _1814;
    float _1826 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = -_1760;
    float _1830 = fma(_1744, _1746, _1828);
    float _1832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1834 = fma(_1820, _1820, _1824);
    float _1836 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1838 = _1826 * _1766;
    float _1840 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1842 = fma(_1794, _1080, _1768);
    float _1844 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1846 = fma(_1404, _1562, _1770);
    float _1848 = sqrt(_1834);
    float _1850 = _1836 * _1810;
    float _1852 = _1728 * _1786;
    float _1854 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1856 = fma(_1830, _1130, _1842);
    float _1858 = fma(_1634, _1538, _1772);
    float _1860 = fma(_1632, _1538, _1774);
    float _1862 = _1844 + _1854;
    float _1864 = 1.0 / _1854;
    float _1866 = _1840 * _1832;
    float _1868 = _1028 + _1856;
    float _1870 = fma(_1636, _1538, _1846);
    float _1872 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1858);
    bool _1874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1876 = isnan(0.5);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1882 = _1878 || _1880;
    out.m_57.x = _1852;
    out.m_57.y = _1838;
    out.m_57.z = _1866;
    out.m_57.w = _1850;
    bool _1884 = _1848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1862 * _1864;
    float _1888 = _1886 * 0.5;
    float _1890 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1860);
    float _1892 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1870);
    float _1894 = _1838;
    float _1896 = _1808;
    float _1898 = _1804;
    float _1900 = _1834;
    if (!_1884)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    bool _1904 = !_1884;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1848 + _1910;
        float _1914 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = rsqrt(_1834);
        float _1918 = _1912 * _1908;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1924 + (-1.0);
        float _1932 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = fma(_1928, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1936 = fma(_1868, _1924, _1932);
        float _1938 = _1916 * _1934;
        float _1940 = fma(_1820, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1942 = fma(_1814, _1938, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1936;
        _1896 = _1940;
        _1898 = _1942;
        _1900 = _1916;
    }
    float _1944 = _1906;
    float _1946 = _1896;
    float _1948 = _1898;
    float _1950 = _1900;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1954 = _1950;
    if (_1882)
    {
        _1954 = 1.0;
    }
    float _1956 = _1954;
    float _1958 = _1956;
    if (!_1882)
    {
        float _1960 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1962 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1964 = _1960 * 0.15915493667125701904296875;
        float _1966 = _1962 * 0.15915493667125701904296875;
        float _1968 = _1964 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1974 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
        float _1976 = _1964 * 6.283185482025146484375;
        float _1978 = sin(_1976);
        float _1980 = 1.0 / _1970;
        float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1982;
        float _1986 = _1966 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = _1978 * _1980;
        float _1992 = _1966 * 6.283185482025146484375;
        float _1994 = sin(_1992);
        float _1996 = _1988 * _1990;
        float _1998 = 1.0 / _1974;
        float _2000 = 1.0 / _1996;
        float _2002 = 1.0 / _1984;
        float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2006 = _1998 * _2004;
        float _2008 = _1994 * _2000;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2012 = fma(_2008, _2006, _2010);
        float _2014 = _2012 * _2002;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1958 = _2016;
    }
    float _2018 = _1958;
    float _2020 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1952);
    float _2024 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2032 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2034 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2036 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2042 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2034);
    float _2044 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2052 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2056 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2050);
    float _2062 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2054);
    float _2066 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2064);
    float _2074 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2066);
    float _2076 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2068);
    float _2078 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2080 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2074);
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2090 = _2018 > 0.0;
    bool _2092 = isnan(_2018);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2102 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = _2084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2086 + _2078;
    float _2108 = _2100 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _1740 + 0.5;
    float _2114 = _1684 + 0.5;
    float _2116 = _2106 * 0.5;
    out.m_59.x = _2088;
    out.m_59.y = _2110;
    out.m_59.z = _2104;
    out.m_59.w = _2082;
    out.m_61.x = _2112;
    out.m_61.y = _2114;
    out.m_35.x = _2108;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2076;
    out.gl_Position.z = _2086;
    out.gl_Position.w = _2078;
    out.m_63.z = _2116;
    out.m_63.w = _2078;
    if (_2098)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

