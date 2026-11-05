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
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_45 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
    float4 m_51 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1328 = false;
    bool _1186 = false;
    bool _1072 = false;
    bool _930 = false;
    bool _762 = false;
    bool _472 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_102);
        out.gl_Position.z = _2345;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_138);
        out.gl_Position.z = _2414;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_37.x;
    float _142 = in.m_37.y;
    float _144 = in.m_37.z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    float _150 = in.m_39.y;
    float _152 = in.m_39.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_41.z;
    float _170 = _140 * _140;
    float _172 = _142 * _142;
    float _174 = fma(_148, _148, _170);
    float _176 = fma(_150, _150, _172);
    float _178 = fma(_164, _164, _174);
    float _180 = fma(_166, _166, _176);
    float _182 = _144 * _144;
    float _184 = sqrt(_178);
    float _186 = fma(_152, _152, _182);
    float _188 = fma(_168, _168, _186);
    float _190 = sqrt(_180);
    bool _192 = _184 > 0.0;
    float _194 = sqrt(_188);
    bool _196 = _190 > 0.0;
    float _198 = in.m_35.x;
    float _200 = in.m_35.y;
    float _202 = in.m_35.z;
    float _204 = 0.0;
    float _206 = _178;
    float _208 = _180;
    float _210 = _146;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _214 = _188;
    if (_192)
    {
        float _216 = rsqrt(_178);
        _204 = _216;
    }
    float _218 = _204;
    bool _220 = _194 > 0.0;
    float _222 = _194;
    if (!_162)
    {
        float _224 = _146 * _146;
        float _226 = _224 * 0.5;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_180);
        _230 = _234;
    }
    float _236 = _230;
    if (!_162)
    {
        float _238 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _238;
    }
    float _240 = _232;
    bool _242 = !_162;
    float _244 = 0.0;
    float _246 = _240;
    float _248 = 0.0;
    float _250 = _218;
    if (!_242)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _146 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _146);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _268;
        _246 = _280;
        _248 = _278;
        _206 = _270;
        _208 = _264;
    }
    float _282 = _244;
    float _284 = _246;
    float _286 = _248;
    float _288 = _206;
    float _290 = _208;
    bool _292 = !_162;
    float _294 = _282;
    float _296 = _286;
    float _298 = _288;
    float _300 = _290;
    float _302 = _284;
    if (!_292)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _146 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _210 = _322;
        _294 = _316;
        _296 = _312;
        _212 = _310;
    }
    float _324 = _210;
    float _326 = _294;
    float _328 = _296;
    float _330 = _212;
    float _332 = in.m_43.w;
    float _334 = _330;
    float _336 = _326;
    float _338 = _328;
    if (!_192)
    {
        _298 = 0.0;
    }
    float _340 = _298;
    float _342 = _340;
    if (_192)
    {
        float _344 = _218 * _148;
        _342 = _344;
    }
    float _346 = _342;
    if (!_192)
    {
        _300 = 0.0;
    }
    float _348 = _300;
    float _350 = in.m_30.x;
    float _352 = in.m_30.y;
    float _354 = in.m_30.z;
    float _356 = _348;
    if (!_192)
    {
        _334 = 0.0;
    }
    float _358 = _334;
    float _360 = _358;
    if (_192)
    {
        float _362 = _218 * _140;
        _356 = _362;
    }
    float _364 = _356;
    if (_192)
    {
        float _366 = _218 * _164;
        _360 = _366;
    }
    float _368 = _360;
    float _370 = 0.0;
    if (_220)
    {
        float _372 = rsqrt(_188);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_196)
    {
        _336 = 0.0;
    }
    float _382 = _336;
    float _384 = _382;
    if (_196)
    {
        float _386 = _236 * _150;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_324, _198, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_324, _200, _380);
    float _396 = 0.0;
    int _398 = as_type<int>(_388);
    if (!_196)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_196)
    {
        float _404 = _236 * _142;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = fma(_324, _202, _392);
    if (!_196)
    {
        _338 = 0.0;
    }
    float _410 = _338;
    float _412 = _410;
    if (_196)
    {
        float _414 = _236 * _166;
        _412 = _414;
    }
    float _416 = _412;
    int _418 = as_type<int>(_416);
    if (!_220)
    {
        _250 = 0.0;
    }
    float _420 = _250;
    float _422 = _420;
    if (!_220)
    {
        _302 = 0.0;
    }
    float _424 = _302;
    float _426 = _424;
    if (_220)
    {
        float _428 = _374 * _152;
        _422 = _428;
    }
    float _430 = _422;
    if (!_220)
    {
        _214 = 0.0;
    }
    float _432 = _214;
    float _434 = _432;
    if (_220)
    {
        float _436 = _374 * _144;
        _426 = _436;
    }
    float _438 = _426;
    float _440 = _438;
    if (_220)
    {
        float _442 = _374 * _168;
        _434 = _442;
    }
    float _444 = _434;
    float _446 = fma(_390, _332, _350);
    float _448 = fma(_394, _332, _352);
    float _450 = fma(_408, _332, _354);
    bool _452 = !_376;
    float _470;
    if (!_452)
    {
        float _454 = in.m_45.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_86);
        float _476 = 1.0 / _474;
        float _478 = _120 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = _480 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _510 = 1.0 / _496;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _526 = isnan(_480);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _500;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _540 = 1.0 / _508;
    float _542 = _484 * _510;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _546 = _480 + _544;
    float _548 = 1.0 / _504;
    float _550 = _488 * _536;
    bool _552 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _554 = isnan(_480);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_562;
    float _566 = _564 + 1.0;
    float _568 = _546 * _540;
    bool _570 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_480);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = -_580;
    float _588 = _586 + 1.0;
    float _590 = _492 * _548;
    bool _592 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _580 * _566;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _618 = _602 * _588;
    float _620 = -_602;
    float _622 = _620 + 1.0;
    float _624 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _626 = fma(_612, _542, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _628 = fma(_584, _542, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = -_522;
    float _632 = _630 + 1.0;
    float _634 = _522 * _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _534 * _632;
    float _646 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _648 = fma(_638, _550, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _650 = fma(_642, _550, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _652 = _624 * _644;
    float _654 = _626 * _644;
    float _656 = _628 * _644;
    float _658 = -_534;
    float _660 = _658 + 1.0;
    float _662 = in.m_43.x;
    float _664 = in.m_43.y;
    float _666 = in.m_43.z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _684 = fma(_670, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _686 = fma(_674, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    float _690 = fma(_678, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_648, _634, _680);
    float _694 = fma(_646, _634, _682);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _708 = fma(_650, _634, _688);
    float _710 = fma(_698, _568, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_706, _568, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _716 = fma(_684, _618, _694);
    float _718 = fma(_686, _618, _692);
    float _720 = fma(_690, _618, _708);
    float _722 = fma(_710, _604, _716);
    float _724 = fma(_712, _604, _718);
    float _726 = fma(_714, _604, _720);
    float _728 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].x, _722);
    float _730 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].y, _724);
    float _732 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].z, _726);
    float _734 = _728 * _662;
    float _736 = _730 * _664;
    float _738 = _732 * _666;
    bool _740 = !_538;
    float _742 = _682;
    float _760;
    if (!_740)
    {
        float _744 = in.m_45.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        float _764 = float(_86);
        float _766 = 1.0 / _764;
        float _768 = _120 * _766;
        _760 = _768;
    }
    _762 = false;
    float _770 = _760;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = _770 + _772;
    bool _776 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _778 = isnan(_770);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _790 = _770 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _800 = 1.0 / _794;
    bool _802 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _804 = 1.0 / _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _806;
    float _810 = _774 * _800;
    bool _812 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _814 = isnan(_770);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = -_786;
    float _826 = _824 + 1.0;
    bool _828 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _830 = isnan(_770);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_808, _810, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _842 = _838 * _826;
    float _844 = -_838;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _852;
    float _856 = _790 * _804;
    float _858 = _822 * _846;
    float _860 = fma(_850, _810, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _862 = fma(_854, _810, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _864 = -_822;
    float _866 = _864 + 1.0;
    float _868 = _840 * _858;
    float _870 = _860 * _858;
    float _872 = _862 * _858;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _888 = fma(_876, _856, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _890 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].y, _868);
    float _894 = fma(_884, _856, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].z, _872);
    float _898 = fma(_888, _842, _886);
    float _900 = fma(_890, _842, _892);
    float _902 = fma(_894, _842, _896);
    float _904 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].x, _898);
    float _906 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].y, _900);
    float _908 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].z, _902);
    bool _910 = !_802;
    float _928;
    if (!_910)
    {
        float _912 = in.m_45.x;
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _916 = _912 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _920 = _918 * _914;
        float _922 = floor(_920);
        float _924 = -_922;
        float _926 = _920 + _924;
        _928 = _926;
        _930 = true;
    }
    else
    {
        float _932 = float(_86);
        float _934 = 1.0 / _932;
        float _936 = _120 * _934;
        _928 = _936;
    }
    _930 = false;
    float _938 = _928;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _938 + _940;
    float _944 = _904 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _952 = isnan(_938);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _966 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_938);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _978;
    bool _982 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = isnan(_938);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = 1.0 / _948;
    float _996 = -_960;
    float _998 = _996 + 1.0;
    float _1000 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1002 = _908 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1004 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1006 = 1.0 / _964;
    float _1008 = _980 * _994;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = fma(_1008, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1020 = _976 * _998;
    float _1022 = -_976;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _1016;
    float _1028 = _1012 * _1006;
    float _1030 = _1018 * _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1034 = _938 + _1032;
    float _1036 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1040 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1040, _1026, _1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1044);
    float _1048 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1036;
    out.m_47.y = _1048;
    out.m_47.z = _1042;
    out.m_47.w = _1050;
    bool _1052 = !_1004;
    float _1070;
    if (!_1052)
    {
        float _1054 = in.m_45.x;
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1058 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _1062 = _1060 * _1056;
        float _1064 = floor(_1062);
        float _1066 = -_1064;
        float _1068 = _1062 + _1066;
        _1070 = _1068;
        _1072 = true;
    }
    else
    {
        float _1074 = float(_86);
        float _1076 = 1.0 / _1074;
        float _1078 = _120 * _1076;
        _1070 = _1078;
    }
    _1072 = false;
    float _1080 = _1070;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1080 + _1082;
    bool _1086 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1098;
    bool _1102 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1104 = isnan(_1080);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1096;
    float _1116 = _1114 + 1.0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = 1.0 / _1100;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = _1112 * _1116;
    float _1128 = -_1112;
    float _1130 = _1128 + 1.0;
    float _1132 = _1084 * _1122;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1134;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1140;
    float _1144 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1146 = fma(_1142, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1148 = _1138 * _1126;
    float _1150 = _1146 * _1126;
    float _1152 = _1144 * _1126;
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1158 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1152);
    float _1160 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1154);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1156);
    float _1164 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1158);
    bool _1166 = !_1124;
    float _1184;
    if (!_1166)
    {
        float _1168 = in.m_45.x;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1172 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1176 = _1174 * _1170;
        float _1178 = floor(_1176);
        float _1180 = -_1178;
        float _1182 = _1176 + _1180;
        _1184 = _1182;
        _1186 = true;
    }
    else
    {
        float _1188 = float(_86);
        float _1190 = 1.0 / _1188;
        float _1192 = _120 * _1190;
        _1184 = _1192;
    }
    _1186 = false;
    float _1194 = _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1194 + _1196;
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1206 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1208 = isnan(_1194);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1222 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1224 = isnan(_1194);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1234;
    bool _1238 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1240 = isnan(_1194);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = 1.0 / _1204;
    float _1252 = -_1216;
    float _1254 = _1252 + 1.0;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1262 = 1.0 / _1220;
    float _1264 = _1236 * _1250;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    float _1274 = fma(_1264, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1276 = _1232 * _1254;
    float _1278 = -_1232;
    float _1280 = _1278 + 1.0;
    float _1282 = _1216 * _1272;
    float _1284 = _1268 * _1262;
    float _1286 = _1274 * _1276;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1290 = _1194 + _1288;
    float _1292 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1296 = fma(_1284, _1290, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1298 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1296, _1282, _1294);
    float _1302 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1300);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_49.x = _1292;
    out.m_49.y = _1304;
    out.m_49.z = _1298;
    out.m_49.w = _1306;
    bool _1308 = !_1260;
    float _1326;
    if (!_1308)
    {
        float _1310 = in.m_45.x;
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1314 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[14].y, _120);
        float _1318 = _1316 * _1312;
        float _1320 = floor(_1318);
        float _1322 = -_1320;
        float _1324 = _1318 + _1322;
        _1326 = _1324;
        _1328 = true;
    }
    else
    {
        float _1330 = float(_86);
        float _1332 = 1.0 / _1330;
        float _1334 = _120 * _1332;
        _1326 = _1334;
    }
    _1328 = false;
    float _1336 = _1326;
    float _1338 = in.m_51.y;
    float _1340 = _448 * _150;
    float _1342 = _448 * _142;
    float _1344 = _448 * _166;
    float _1346 = in.m_45.y;
    float _1348 = fma(_446, _148, _1340);
    float _1350 = fma(_446, _140, _1342);
    float _1352 = in.m_45.z;
    float _1354 = fma(_446, _164, _1344);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_450, _152, _1348);
    float _1362 = in.m_45.w;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = fma(_450, _168, _1354);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    float _1374 = in.m_45.x;
    float _1376 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1378 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1384 = -_1338;
    float _1386 = _1384 + 1.0;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1392 = in.m_51.x;
    bool _1394 = _1346 > 0.5;
    float _1396 = 1.0 / _1382;
    bool _1398 = _1352 > 0.5;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1402 = _1394 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1404 = in.m_39.w;
    int _1406 = _1398 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1408 = 1.0 / _1390;
    float _1410 = _1366 ? as_type<float>(_1402) : _1338;
    float _1412 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1414 = _1358 ? as_type<float>(_1406) : _1338;
    bool _1416 = _1362 > 0.5;
    float _1418 = in.m_53.x;
    float _1420 = in.m_53.y;
    float _1422 = in.m_53.z;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    float _1428 = _1338;
    bool _1430 = _1416;
    float _1432 = _1352;
    float _1434 = _1392;
    if (_1372)
    {
        float _1436 = _1416 ? _1386 : _1338;
        _1428 = _1436;
    }
    float _1438 = _1428;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_450, _144, _1350);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1458 = _1456 != 0;
    float _1460 = 1.0 / _1448;
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = _1360 + _1404;
    float _1466 = fma(_1462, -2.0, _1400);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1484 = _1412 * _1474;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1498 = _1376 * _1476;
    float _1500 = _1488 * _1396;
    float _1502 = _1492 * _1408;
    float _1504 = in.m_37.w;
    float _1506 = 1.0 / _1470;
    float _1508 = _1378 * _1478;
    float _1510 = -_1472;
    float _1512 = fma(_1454, 2.0, _1510);
    float _1514 = in.m_41.w;
    float _1516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1518 = 1.0 / _1482;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1528 = _1404;
    if (_1426)
    {
        bool _1530 = _1374 > 0.5;
        _1430 = _1530;
    }
    bool _1532 = _1430;
    float _1534 = _1522 * _1460;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1538 = 1.0 / _1496;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1540;
    float _1544 = _1526 * _1506;
    if (!_1442)
    {
        _742 = _1352;
    }
    float _1546 = _742;
    float _1548 = _1546;
    if (_1442)
    {
        _1432 = _1346;
    }
    float _1550 = _1432;
    float _1552 = _1444 + _1504;
    float _1554 = _1542 * _1518;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1564 = _1518;
    if (!_1442)
    {
        _1564 = _1346;
    }
    float _1566 = _1564;
    float _1568 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1536);
    float _1570 = _1566;
    if (_1442)
    {
        _1570 = _1374;
    }
    float _1572 = _1570;
    float _1574 = _1368 + _1514;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1578 = _1336 + _1576;
    float _1580 = _1558 * _1538;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1584 = _1336 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1588 = _1336 + _1586;
    float _1590 = 1.0 / _1562;
    float _1592 = fma(_1500, _1578, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1502, _1584, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1598 = fma(_1534, _1588, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    if (_1442)
    {
        _1548 = _1346;
    }
    float _1600 = _1548;
    float _1602 = in.m_55.x;
    float _1604 = in.m_55.y;
    float _1606 = in.m_55.z;
    float _1608 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    bool _1610 = _1420 != 0.0;
    bool _1612 = isnan(_1420);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1336 + _1622;
    bool _1626 = _1418 == 0.0;
    bool _1628 = !_1618;
    bool _1630 = _1626 && _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1634 = _1336 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1636;
    bool _1640 = _1422 == 0.0;
    bool _1642 = _1640 && _1630;
    float _1644 = fma(_1554, _1624, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1580, _1634, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1648 = _1638 * _1590;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1652 = _1336 + _1650;
    bool _1654 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1656 = isnan(_1336);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1668 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1670 = isnan(_1336);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1544, _1652, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1682 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1684 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1686 = isnan(_1336);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1664;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1666);
    float _1702 = fma(_1682, _1410, -0.5);
    float _1704 = _1602;
    float _1706 = _1606;
    float _1708 = _1604;
    if (!_1642)
    {
        float _1710 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1602);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = _1694 * _1698;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1722 = isnan(_1336);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1678;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    float _1738 = _1678 * _1718;
    if (!_1642)
    {
        float _1740 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1606);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1730 * _1734;
    float _1746 = -_1730;
    float _1748 = _1746 + 1.0;
    float _1750 = _1508 * _388;
    float _1752 = _1508 * _406;
    float _1754 = _1508 * _416;
    bool _1756 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1758 = isnan(_1336);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    if (!_1642)
    {
        float _1768 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1604);
        _1708 = _1768;
    }
    float _1770 = _1708;
    float _1772 = fma(_1498, _346, _1750);
    float _1774 = fma(_1498, _364, _1752);
    float _1776 = fma(_1498, _368, _1754);
    float _1778 = -_1516;
    float _1780 = fma(_1736, _1702, _1778);
    bool _1782 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1784 = isnan(_1336);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1766 * _1748;
    float _1796 = -_1766;
    float _1798 = _1796 + 1.0;
    bool _1800 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1802 = isnan(_1336);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1814 = _1792 * _1798;
    float _1816 = -_1792;
    float _1818 = _1816 + 1.0;
    float _1820 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1822 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1824 = isnan(_1336);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = _1810 * _1818;
    float _1836 = -_1810;
    float _1838 = _1836 + 1.0;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1844 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1846 = _1832 * _1838;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1850 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1840);
    float _1852 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1854 = fma(_1820, -2.0, _1842);
    float _1856 = _1592 * _1846;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1860 = _388 * _1770;
    float _1862 = _416 * _1770;
    float _1864 = -_1848;
    float _1866 = fma(_1844, 2.0, _1864);
    int _1868 = as_type<int>(_1848);
    float _1870 = _1770;
    if (_1426)
    {
        float _1872 = -_1392;
        float _1874 = _1872 + 1.0;
        _398 = as_type<int>(_1874);
    }
    int _1876 = _398;
    if (_1452)
    {
        float _1878 = -_1392;
        float _1880 = _1878 + 1.0;
        _418 = as_type<int>(_1880);
    }
    int _1882 = _418;
    if (_1458)
    {
        float _1884 = -_1392;
        float _1886 = _1884 + 1.0;
        _1868 = as_type<int>(_1886);
    }
    int _1888 = _1868;
    float _1890 = _406 * _1770;
    if (!_1426)
    {
        _1528 = _1392;
    }
    float _1892 = _1528;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1896 = _1892;
    if (!_1452)
    {
        _1870 = _1392;
    }
    float _1898 = _1870;
    float _1900 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1568);
    float _1902 = _1898;
    if (_1426)
    {
        float _1904 = _1532 ? as_type<float>(_1876) : _1392;
        _1896 = _1904;
    }
    float _1906 = _1896;
    float _1908 = fma(_364, _1712, _1890);
    if (_1452)
    {
        float _1910 = _1398 ? as_type<float>(_1882) : _1392;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = fma(_346, _1712, _1860);
    if (_1458)
    {
        float _1916 = _1394 ? as_type<float>(_1888) : _1392;
        _1434 = _1916;
    }
    float _1918 = _1434;
    float _1920 = -_1832;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_368, _1712, _1862);
    float _1926 = -_120;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1512);
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1856);
    float _1934 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1850);
    float _1936 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1700);
    float _1938 = -_120;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    float _1942 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1854);
    float _1944 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1946 = fma(_1596, _1834, _1932);
    float _1948 = fma(_1484, _444, _1776);
    float _1950 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1952 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1954 = fma(_1944, _1906, -0.5);
    float _1956 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = fma(_1484, _430, _1772);
    float _1960 = _1574 + _1948;
    float _1962 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1964 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1950);
    float _1966 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1952);
    float _1968 = fma(_1956, _1912, -0.5);
    float _1970 = _1464 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1978 = _1962 * _1930;
    float _1980 = fma(_430, _1742, _1914);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1974 * _1974;
    float _1988 = fma(_444, _1742, _1924);
    float _1990 = fma(_1852, _1438, -0.5);
    float _1992 = fma(_438, _1742, _1908);
    float _1994 = fma(_1984, _1984, _1986);
    float _1996 = fma(_1900, _1954, _1928);
    float _1998 = -_1942;
    float _2000 = fma(_1936, _1990, _1998);
    float _2002 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2004 = sqrt(_1994);
    float _2006 = fma(_1934, _1968, _1940);
    float _2008 = _1780 + 0.5;
    float _2010 = _2000 + 0.5;
    float _2012 = _2002 * _1976;
    float _2014 = _1996 + 0.5;
    float _2016 = _2006 + 0.5;
    float _2018 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1966);
    float _2020 = fma(_1598, _1814, _1946);
    out.m_57.x = _2012;
    out.m_57.y = _1978;
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2024 = _1336 + _2022;
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2028 = fma(_1680, _1794, _2020);
    out.m_59.x = _2014;
    out.m_59.y = _2008;
    out.m_59.z = _2016;
    out.m_59.w = _2010;
    float _2030 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1964);
    float _2032 = 1.0 / _2026;
    bool _2034 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = fma(_1644, _1744, _2028);
    float _2038 = fma(_1484, _438, _1774);
    float _2040 = fma(_1648, _2024, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2042 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2044 = fma(_1646, _1738, _2036);
    float _2046 = _1552 + _2038;
    out.m_61.x = _1980;
    out.m_61.y = _1992;
    out.m_61.z = _1988;
    float _2048 = _2042 + _2026;
    float _2050 = fma(_2040, _1714, _2044);
    bool _2052 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2050);
    float _2064 = _2048 * _2032;
    float _2066 = _2064 * 0.5;
    float _2068 = _1980;
    float _2070 = _1988;
    float _2072 = _1992;
    if (!_2034)
    {
        _2068 = _1970;
    }
    float _2074 = _2068;
    float _2076 = _2074;
    if (!_2034)
    {
        _2070 = _1960;
    }
    float _2078 = _2070;
    float _2080 = _2078;
    if (!_2034)
    {
        _2072 = _2046;
    }
    float _2082 = _2072;
    bool _2084 = !_2034;
    float _2086 = _2082;
    if (!_2084)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2092 = _2004 + _2090;
        float _2094 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = rsqrt(_1994);
        float _2098 = _2092 * _2088;
        float _2100 = _2098 * 0.15915493667125701904296875;
        float _2102 = _2100 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2100 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = _2104 + (-1.0);
        float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = fma(_2108, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2116 = fma(_2046, _2104, _2112);
        float _2118 = _2096 * _2114;
        float _2120 = fma(_1984, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2122 = fma(_1974, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2086 = _2116;
        _2076 = _2120;
        _2080 = _2122;
        _440 = _2118;
    }
    float _2124 = _2086;
    float _2126 = _2076;
    float _2128 = _2080;
    float _2130 = _440;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2134 = _2130;
    if (_2060)
    {
        _2134 = 1.0;
    }
    float _2136 = _2134;
    float _2138 = _2136;
    if (!_2060)
    {
        float _2140 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2144 = _2140 * 0.15915493667125701904296875;
        float _2146 = _2142 * 0.15915493667125701904296875;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2150 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2148);
        float _2152 = _2144 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        float _2156 = _2144 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2154;
        float _2162 = _2146 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2150;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2176;
        float _2180 = 1.0 / _2172;
        float _2182 = 1.0 / _2178;
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = _2174 * _2184;
        float _2188 = _2170 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2192 = fma(_2188, _2186, _2190);
        float _2194 = _2192 * _2182;
        float _2196 = precise::clamp(_2194, 0.0, 1.0);
        _2138 = _2196;
    }
    float _2198 = _2138;
    float _2200 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2202 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2132);
    float _2204 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2206 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2208 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2200);
    float _2210 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2202);
    float _2212 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2214 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2206);
    float _2216 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2220 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2222 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2224 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2232 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2234 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2228);
    float _2240 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2230);
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2232);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2246 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2238);
    float _2250 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2240);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2242);
    bool _2254 = _2198 > 0.0;
    bool _2256 = isnan(_2198);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = _2198 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2266 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2248);
    float _2268 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2252);
    float _2270 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2250);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2244);
    float _2276 = _2266 + _2268;
    float _2278 = _2270 + _2268;
    float _2280 = _2268 * 0.5;
    float _2282 = _2276 * 0.5;
    float _2284 = _2278 * 0.5;
    float _2286 = fma(_2274, -0.5, _2280);
    out.m_63.x = _2062;
    out.m_65.x = _2126;
    out.m_65.y = _2124;
    out.m_65.z = _2128;
    out.m_33.x = _2272;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2274;
    out.gl_Position.z = _2270;
    out.gl_Position.w = _2268;
    out.m_67.x = _2282;
    out.m_67.y = _2286;
    out.m_67.z = _2284;
    out.m_67.w = _2268;
    if (_2262)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1328 = false;
    bool _1186 = false;
    bool _1072 = false;
    bool _930 = false;
    bool _762 = false;
    bool _472 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_102);
        out.gl_Position.z = _2345;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_138);
        out.gl_Position.z = _2414;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_37.x;
    float _142 = in.m_37.y;
    float _144 = in.m_37.z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    float _150 = in.m_39.y;
    float _152 = in.m_39.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_41.z;
    float _170 = _140 * _140;
    float _172 = _142 * _142;
    float _174 = fma(_148, _148, _170);
    float _176 = fma(_150, _150, _172);
    float _178 = fma(_164, _164, _174);
    float _180 = fma(_166, _166, _176);
    float _182 = _144 * _144;
    float _184 = sqrt(_178);
    float _186 = fma(_152, _152, _182);
    float _188 = fma(_168, _168, _186);
    float _190 = sqrt(_180);
    bool _192 = _184 > 0.0;
    float _194 = sqrt(_188);
    bool _196 = _190 > 0.0;
    float _198 = in.m_35.x;
    float _200 = in.m_35.y;
    float _202 = in.m_35.z;
    float _204 = 0.0;
    float _206 = _178;
    float _208 = _180;
    float _210 = _146;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _214 = _188;
    if (_192)
    {
        float _216 = rsqrt(_178);
        _204 = _216;
    }
    float _218 = _204;
    bool _220 = _194 > 0.0;
    float _222 = _194;
    if (!_162)
    {
        float _224 = _146 * _146;
        float _226 = _224 * 0.5;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_180);
        _230 = _234;
    }
    float _236 = _230;
    if (!_162)
    {
        float _238 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _238;
    }
    float _240 = _232;
    bool _242 = !_162;
    float _244 = 0.0;
    float _246 = _240;
    float _248 = 0.0;
    float _250 = _218;
    if (!_242)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _146 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _146);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _268;
        _246 = _280;
        _248 = _278;
        _206 = _270;
        _208 = _264;
    }
    float _282 = _244;
    float _284 = _246;
    float _286 = _248;
    float _288 = _206;
    float _290 = _208;
    bool _292 = !_162;
    float _294 = _282;
    float _296 = _286;
    float _298 = _288;
    float _300 = _290;
    float _302 = _284;
    if (!_292)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _146 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _210 = _322;
        _294 = _316;
        _296 = _312;
        _212 = _310;
    }
    float _324 = _210;
    float _326 = _294;
    float _328 = _296;
    float _330 = _212;
    float _332 = in.m_43.w;
    float _334 = _330;
    float _336 = _326;
    float _338 = _328;
    if (!_192)
    {
        _298 = 0.0;
    }
    float _340 = _298;
    float _342 = _340;
    if (_192)
    {
        float _344 = _218 * _148;
        _342 = _344;
    }
    float _346 = _342;
    if (!_192)
    {
        _300 = 0.0;
    }
    float _348 = _300;
    float _350 = in.m_30.x;
    float _352 = in.m_30.y;
    float _354 = in.m_30.z;
    float _356 = _348;
    if (!_192)
    {
        _334 = 0.0;
    }
    float _358 = _334;
    float _360 = _358;
    if (_192)
    {
        float _362 = _218 * _140;
        _356 = _362;
    }
    float _364 = _356;
    if (_192)
    {
        float _366 = _218 * _164;
        _360 = _366;
    }
    float _368 = _360;
    float _370 = 0.0;
    if (_220)
    {
        float _372 = rsqrt(_188);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_196)
    {
        _336 = 0.0;
    }
    float _382 = _336;
    float _384 = _382;
    if (_196)
    {
        float _386 = _236 * _150;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_324, _198, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_324, _200, _380);
    float _396 = 0.0;
    int _398 = as_type<int>(_388);
    if (!_196)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_196)
    {
        float _404 = _236 * _142;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = fma(_324, _202, _392);
    if (!_196)
    {
        _338 = 0.0;
    }
    float _410 = _338;
    float _412 = _410;
    if (_196)
    {
        float _414 = _236 * _166;
        _412 = _414;
    }
    float _416 = _412;
    int _418 = as_type<int>(_416);
    if (!_220)
    {
        _250 = 0.0;
    }
    float _420 = _250;
    float _422 = _420;
    if (!_220)
    {
        _302 = 0.0;
    }
    float _424 = _302;
    float _426 = _424;
    if (_220)
    {
        float _428 = _374 * _152;
        _422 = _428;
    }
    float _430 = _422;
    if (!_220)
    {
        _214 = 0.0;
    }
    float _432 = _214;
    float _434 = _432;
    if (_220)
    {
        float _436 = _374 * _144;
        _426 = _436;
    }
    float _438 = _426;
    float _440 = _438;
    if (_220)
    {
        float _442 = _374 * _168;
        _434 = _442;
    }
    float _444 = _434;
    float _446 = fma(_390, _332, _350);
    float _448 = fma(_394, _332, _352);
    float _450 = fma(_408, _332, _354);
    bool _452 = !_376;
    float _470;
    if (!_452)
    {
        float _454 = in.m_45.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_86);
        float _476 = 1.0 / _474;
        float _478 = _120 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = _480 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _510 = 1.0 / _496;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _526 = isnan(_480);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _500;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _540 = 1.0 / _508;
    float _542 = _484 * _510;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _546 = _480 + _544;
    float _548 = 1.0 / _504;
    float _550 = _488 * _536;
    bool _552 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _554 = isnan(_480);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_562;
    float _566 = _564 + 1.0;
    float _568 = _546 * _540;
    bool _570 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_480);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = -_580;
    float _588 = _586 + 1.0;
    float _590 = _492 * _548;
    bool _592 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _580 * _566;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _618 = _602 * _588;
    float _620 = -_602;
    float _622 = _620 + 1.0;
    float _624 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _626 = fma(_612, _542, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _628 = fma(_584, _542, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = -_522;
    float _632 = _630 + 1.0;
    float _634 = _522 * _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _534 * _632;
    float _646 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _648 = fma(_638, _550, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _650 = fma(_642, _550, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _652 = _624 * _644;
    float _654 = _626 * _644;
    float _656 = _628 * _644;
    float _658 = -_534;
    float _660 = _658 + 1.0;
    float _662 = in.m_43.x;
    float _664 = in.m_43.y;
    float _666 = in.m_43.z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _684 = fma(_670, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _686 = fma(_674, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    float _690 = fma(_678, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_648, _634, _680);
    float _694 = fma(_646, _634, _682);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _708 = fma(_650, _634, _688);
    float _710 = fma(_698, _568, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_706, _568, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _716 = fma(_684, _618, _694);
    float _718 = fma(_686, _618, _692);
    float _720 = fma(_690, _618, _708);
    float _722 = fma(_710, _604, _716);
    float _724 = fma(_712, _604, _718);
    float _726 = fma(_714, _604, _720);
    float _728 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].x, _722);
    float _730 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].y, _724);
    float _732 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].z, _726);
    float _734 = _728 * _662;
    float _736 = _730 * _664;
    float _738 = _732 * _666;
    bool _740 = !_538;
    float _742 = _682;
    float _760;
    if (!_740)
    {
        float _744 = in.m_45.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        float _764 = float(_86);
        float _766 = 1.0 / _764;
        float _768 = _120 * _766;
        _760 = _768;
    }
    _762 = false;
    float _770 = _760;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = _770 + _772;
    bool _776 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _778 = isnan(_770);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _790 = _770 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _800 = 1.0 / _794;
    bool _802 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _804 = 1.0 / _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _806;
    float _810 = _774 * _800;
    bool _812 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _814 = isnan(_770);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = -_786;
    float _826 = _824 + 1.0;
    bool _828 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _830 = isnan(_770);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_808, _810, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _842 = _838 * _826;
    float _844 = -_838;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _852;
    float _856 = _790 * _804;
    float _858 = _822 * _846;
    float _860 = fma(_850, _810, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _862 = fma(_854, _810, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _864 = -_822;
    float _866 = _864 + 1.0;
    float _868 = _840 * _858;
    float _870 = _860 * _858;
    float _872 = _862 * _858;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _888 = fma(_876, _856, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _890 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].y, _868);
    float _894 = fma(_884, _856, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].z, _872);
    float _898 = fma(_888, _842, _886);
    float _900 = fma(_890, _842, _892);
    float _902 = fma(_894, _842, _896);
    float _904 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].x, _898);
    float _906 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].y, _900);
    float _908 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].z, _902);
    bool _910 = !_802;
    float _928;
    if (!_910)
    {
        float _912 = in.m_45.x;
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _916 = _912 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _920 = _918 * _914;
        float _922 = floor(_920);
        float _924 = -_922;
        float _926 = _920 + _924;
        _928 = _926;
        _930 = true;
    }
    else
    {
        float _932 = float(_86);
        float _934 = 1.0 / _932;
        float _936 = _120 * _934;
        _928 = _936;
    }
    _930 = false;
    float _938 = _928;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _938 + _940;
    float _944 = _904 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _952 = isnan(_938);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _966 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_938);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _978;
    bool _982 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = isnan(_938);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = 1.0 / _948;
    float _996 = -_960;
    float _998 = _996 + 1.0;
    float _1000 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1002 = _908 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1004 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1006 = 1.0 / _964;
    float _1008 = _980 * _994;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = fma(_1008, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1020 = _976 * _998;
    float _1022 = -_976;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _1016;
    float _1028 = _1012 * _1006;
    float _1030 = _1018 * _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1034 = _938 + _1032;
    float _1036 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1040 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1040, _1026, _1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1044);
    float _1048 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1036;
    out.m_47.y = _1048;
    out.m_47.z = _1042;
    out.m_47.w = _1050;
    bool _1052 = !_1004;
    float _1070;
    if (!_1052)
    {
        float _1054 = in.m_45.x;
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1058 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _1062 = _1060 * _1056;
        float _1064 = floor(_1062);
        float _1066 = -_1064;
        float _1068 = _1062 + _1066;
        _1070 = _1068;
        _1072 = true;
    }
    else
    {
        float _1074 = float(_86);
        float _1076 = 1.0 / _1074;
        float _1078 = _120 * _1076;
        _1070 = _1078;
    }
    _1072 = false;
    float _1080 = _1070;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1080 + _1082;
    bool _1086 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1098;
    bool _1102 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1104 = isnan(_1080);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1096;
    float _1116 = _1114 + 1.0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = 1.0 / _1100;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = _1112 * _1116;
    float _1128 = -_1112;
    float _1130 = _1128 + 1.0;
    float _1132 = _1084 * _1122;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1134;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1140;
    float _1144 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1146 = fma(_1142, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1148 = _1138 * _1126;
    float _1150 = _1146 * _1126;
    float _1152 = _1144 * _1126;
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1158 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1152);
    float _1160 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1154);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1156);
    float _1164 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1158);
    bool _1166 = !_1124;
    float _1184;
    if (!_1166)
    {
        float _1168 = in.m_45.x;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1172 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1176 = _1174 * _1170;
        float _1178 = floor(_1176);
        float _1180 = -_1178;
        float _1182 = _1176 + _1180;
        _1184 = _1182;
        _1186 = true;
    }
    else
    {
        float _1188 = float(_86);
        float _1190 = 1.0 / _1188;
        float _1192 = _120 * _1190;
        _1184 = _1192;
    }
    _1186 = false;
    float _1194 = _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1194 + _1196;
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1206 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1208 = isnan(_1194);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1222 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1224 = isnan(_1194);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1234;
    bool _1238 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1240 = isnan(_1194);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = 1.0 / _1204;
    float _1252 = -_1216;
    float _1254 = _1252 + 1.0;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1262 = 1.0 / _1220;
    float _1264 = _1236 * _1250;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    float _1274 = fma(_1264, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1276 = _1232 * _1254;
    float _1278 = -_1232;
    float _1280 = _1278 + 1.0;
    float _1282 = _1216 * _1272;
    float _1284 = _1268 * _1262;
    float _1286 = _1274 * _1276;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1290 = _1194 + _1288;
    float _1292 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1296 = fma(_1284, _1290, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1298 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1296, _1282, _1294);
    float _1302 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1300);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_49.x = _1292;
    out.m_49.y = _1304;
    out.m_49.z = _1298;
    out.m_49.w = _1306;
    bool _1308 = !_1260;
    float _1326;
    if (!_1308)
    {
        float _1310 = in.m_45.x;
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1314 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[14].y, _120);
        float _1318 = _1316 * _1312;
        float _1320 = floor(_1318);
        float _1322 = -_1320;
        float _1324 = _1318 + _1322;
        _1326 = _1324;
        _1328 = true;
    }
    else
    {
        float _1330 = float(_86);
        float _1332 = 1.0 / _1330;
        float _1334 = _120 * _1332;
        _1326 = _1334;
    }
    _1328 = false;
    float _1336 = _1326;
    float _1338 = in.m_51.y;
    float _1340 = _448 * _150;
    float _1342 = _448 * _142;
    float _1344 = _448 * _166;
    float _1346 = in.m_45.y;
    float _1348 = fma(_446, _148, _1340);
    float _1350 = fma(_446, _140, _1342);
    float _1352 = in.m_45.z;
    float _1354 = fma(_446, _164, _1344);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_450, _152, _1348);
    float _1362 = in.m_45.w;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = fma(_450, _168, _1354);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    float _1374 = in.m_45.x;
    float _1376 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1378 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1384 = -_1338;
    float _1386 = _1384 + 1.0;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1392 = in.m_51.x;
    bool _1394 = _1346 > 0.5;
    float _1396 = 1.0 / _1382;
    bool _1398 = _1352 > 0.5;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1402 = _1394 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1404 = in.m_39.w;
    int _1406 = _1398 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1408 = 1.0 / _1390;
    float _1410 = _1366 ? as_type<float>(_1402) : _1338;
    float _1412 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1414 = _1358 ? as_type<float>(_1406) : _1338;
    bool _1416 = _1362 > 0.5;
    float _1418 = in.m_53.x;
    float _1420 = in.m_53.y;
    float _1422 = in.m_53.z;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    float _1428 = _1338;
    bool _1430 = _1416;
    float _1432 = _1352;
    float _1434 = _1392;
    if (_1372)
    {
        float _1436 = _1416 ? _1386 : _1338;
        _1428 = _1436;
    }
    float _1438 = _1428;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_450, _144, _1350);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1458 = _1456 != 0;
    float _1460 = 1.0 / _1448;
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = _1360 + _1404;
    float _1466 = fma(_1462, -2.0, _1400);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1484 = _1412 * _1474;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1498 = _1376 * _1476;
    float _1500 = _1488 * _1396;
    float _1502 = _1492 * _1408;
    float _1504 = in.m_37.w;
    float _1506 = 1.0 / _1470;
    float _1508 = _1378 * _1478;
    float _1510 = -_1472;
    float _1512 = fma(_1454, 2.0, _1510);
    float _1514 = in.m_41.w;
    float _1516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1518 = 1.0 / _1482;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1528 = _1404;
    if (_1426)
    {
        bool _1530 = _1374 > 0.5;
        _1430 = _1530;
    }
    bool _1532 = _1430;
    float _1534 = _1522 * _1460;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1538 = 1.0 / _1496;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1540;
    float _1544 = _1526 * _1506;
    if (!_1442)
    {
        _742 = _1352;
    }
    float _1546 = _742;
    float _1548 = _1546;
    if (_1442)
    {
        _1432 = _1346;
    }
    float _1550 = _1432;
    float _1552 = _1444 + _1504;
    float _1554 = _1542 * _1518;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1564 = _1518;
    if (!_1442)
    {
        _1564 = _1346;
    }
    float _1566 = _1564;
    float _1568 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1536);
    float _1570 = _1566;
    if (_1442)
    {
        _1570 = _1374;
    }
    float _1572 = _1570;
    float _1574 = _1368 + _1514;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1578 = _1336 + _1576;
    float _1580 = _1558 * _1538;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1584 = _1336 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1588 = _1336 + _1586;
    float _1590 = 1.0 / _1562;
    float _1592 = fma(_1500, _1578, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1502, _1584, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1598 = fma(_1534, _1588, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    if (_1442)
    {
        _1548 = _1346;
    }
    float _1600 = _1548;
    float _1602 = in.m_55.x;
    float _1604 = in.m_55.y;
    float _1606 = in.m_55.z;
    float _1608 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    bool _1610 = _1420 != 0.0;
    bool _1612 = isnan(_1420);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1336 + _1622;
    bool _1626 = _1418 == 0.0;
    bool _1628 = !_1618;
    bool _1630 = _1626 && _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1634 = _1336 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1636;
    bool _1640 = _1422 == 0.0;
    bool _1642 = _1640 && _1630;
    float _1644 = fma(_1554, _1624, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1580, _1634, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1648 = _1638 * _1590;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1652 = _1336 + _1650;
    bool _1654 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1656 = isnan(_1336);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1668 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1670 = isnan(_1336);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1544, _1652, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1682 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1684 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1686 = isnan(_1336);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1664;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1666);
    float _1702 = fma(_1682, _1410, -0.5);
    float _1704 = _1602;
    float _1706 = _1606;
    float _1708 = _1604;
    if (!_1642)
    {
        float _1710 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1602);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = _1694 * _1698;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1722 = isnan(_1336);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1678;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    float _1738 = _1678 * _1718;
    if (!_1642)
    {
        float _1740 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1606);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1730 * _1734;
    float _1746 = -_1730;
    float _1748 = _1746 + 1.0;
    float _1750 = _1508 * _388;
    float _1752 = _1508 * _406;
    float _1754 = _1508 * _416;
    bool _1756 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1758 = isnan(_1336);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    if (!_1642)
    {
        float _1768 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1604);
        _1708 = _1768;
    }
    float _1770 = _1708;
    float _1772 = fma(_1498, _346, _1750);
    float _1774 = fma(_1498, _364, _1752);
    float _1776 = fma(_1498, _368, _1754);
    float _1778 = -_1516;
    float _1780 = fma(_1736, _1702, _1778);
    bool _1782 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1784 = isnan(_1336);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1766 * _1748;
    float _1796 = -_1766;
    float _1798 = _1796 + 1.0;
    bool _1800 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1802 = isnan(_1336);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1814 = _1792 * _1798;
    float _1816 = -_1792;
    float _1818 = _1816 + 1.0;
    float _1820 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1822 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1824 = isnan(_1336);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = _1810 * _1818;
    float _1836 = -_1810;
    float _1838 = _1836 + 1.0;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1844 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1846 = _1832 * _1838;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1850 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1840);
    float _1852 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1854 = fma(_1820, -2.0, _1842);
    float _1856 = _1592 * _1846;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1860 = _388 * _1770;
    float _1862 = _416 * _1770;
    float _1864 = -_1848;
    float _1866 = fma(_1844, 2.0, _1864);
    int _1868 = as_type<int>(_1848);
    float _1870 = _1770;
    if (_1426)
    {
        float _1872 = -_1392;
        float _1874 = _1872 + 1.0;
        _398 = as_type<int>(_1874);
    }
    int _1876 = _398;
    if (_1452)
    {
        float _1878 = -_1392;
        float _1880 = _1878 + 1.0;
        _418 = as_type<int>(_1880);
    }
    int _1882 = _418;
    if (_1458)
    {
        float _1884 = -_1392;
        float _1886 = _1884 + 1.0;
        _1868 = as_type<int>(_1886);
    }
    int _1888 = _1868;
    float _1890 = _406 * _1770;
    if (!_1426)
    {
        _1528 = _1392;
    }
    float _1892 = _1528;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1896 = _1892;
    if (!_1452)
    {
        _1870 = _1392;
    }
    float _1898 = _1870;
    float _1900 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1568);
    float _1902 = _1898;
    if (_1426)
    {
        float _1904 = _1532 ? as_type<float>(_1876) : _1392;
        _1896 = _1904;
    }
    float _1906 = _1896;
    float _1908 = fma(_364, _1712, _1890);
    if (_1452)
    {
        float _1910 = _1398 ? as_type<float>(_1882) : _1392;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = fma(_346, _1712, _1860);
    if (_1458)
    {
        float _1916 = _1394 ? as_type<float>(_1888) : _1392;
        _1434 = _1916;
    }
    float _1918 = _1434;
    float _1920 = -_1832;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_368, _1712, _1862);
    float _1926 = -_120;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1512);
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1856);
    float _1934 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1850);
    float _1936 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1700);
    float _1938 = -_120;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    float _1942 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1854);
    float _1944 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1946 = fma(_1596, _1834, _1932);
    float _1948 = fma(_1484, _444, _1776);
    float _1950 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1952 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1954 = fma(_1944, _1906, -0.5);
    float _1956 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = fma(_1484, _430, _1772);
    float _1960 = _1574 + _1948;
    float _1962 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1964 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1950);
    float _1966 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1952);
    float _1968 = fma(_1956, _1912, -0.5);
    float _1970 = _1464 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1978 = _1962 * _1930;
    float _1980 = fma(_430, _1742, _1914);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1974 * _1974;
    float _1988 = fma(_444, _1742, _1924);
    float _1990 = fma(_1852, _1438, -0.5);
    float _1992 = fma(_438, _1742, _1908);
    float _1994 = fma(_1984, _1984, _1986);
    float _1996 = fma(_1900, _1954, _1928);
    float _1998 = -_1942;
    float _2000 = fma(_1936, _1990, _1998);
    float _2002 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2004 = sqrt(_1994);
    float _2006 = fma(_1934, _1968, _1940);
    float _2008 = _1780 + 0.5;
    float _2010 = _2000 + 0.5;
    float _2012 = _2002 * _1976;
    float _2014 = _1996 + 0.5;
    float _2016 = _2006 + 0.5;
    float _2018 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1966);
    float _2020 = fma(_1598, _1814, _1946);
    out.m_57.x = _2012;
    out.m_57.y = _1978;
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2024 = _1336 + _2022;
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2028 = fma(_1680, _1794, _2020);
    out.m_59.x = _2014;
    out.m_59.y = _2008;
    out.m_59.z = _2016;
    out.m_59.w = _2010;
    float _2030 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1964);
    float _2032 = 1.0 / _2026;
    bool _2034 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = fma(_1644, _1744, _2028);
    float _2038 = fma(_1484, _438, _1774);
    float _2040 = fma(_1648, _2024, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2042 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2044 = fma(_1646, _1738, _2036);
    float _2046 = _1552 + _2038;
    out.m_61.x = _1980;
    out.m_61.y = _1992;
    out.m_61.z = _1988;
    float _2048 = _2042 + _2026;
    float _2050 = fma(_2040, _1714, _2044);
    bool _2052 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2050);
    float _2064 = _2048 * _2032;
    float _2066 = _2064 * 0.5;
    float _2068 = _1980;
    float _2070 = _1988;
    float _2072 = _1992;
    if (!_2034)
    {
        _2068 = _1970;
    }
    float _2074 = _2068;
    float _2076 = _2074;
    if (!_2034)
    {
        _2070 = _1960;
    }
    float _2078 = _2070;
    float _2080 = _2078;
    if (!_2034)
    {
        _2072 = _2046;
    }
    float _2082 = _2072;
    bool _2084 = !_2034;
    float _2086 = _2082;
    if (!_2084)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2092 = _2004 + _2090;
        float _2094 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = rsqrt(_1994);
        float _2098 = _2092 * _2088;
        float _2100 = _2098 * 0.15915493667125701904296875;
        float _2102 = _2100 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2100 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = _2104 + (-1.0);
        float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = fma(_2108, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2116 = fma(_2046, _2104, _2112);
        float _2118 = _2096 * _2114;
        float _2120 = fma(_1984, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2122 = fma(_1974, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2086 = _2116;
        _2076 = _2120;
        _2080 = _2122;
        _440 = _2118;
    }
    float _2124 = _2086;
    float _2126 = _2076;
    float _2128 = _2080;
    float _2130 = _440;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2134 = _2130;
    if (_2060)
    {
        _2134 = 1.0;
    }
    float _2136 = _2134;
    float _2138 = _2136;
    if (!_2060)
    {
        float _2140 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2144 = _2140 * 0.15915493667125701904296875;
        float _2146 = _2142 * 0.15915493667125701904296875;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2150 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2148);
        float _2152 = _2144 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        float _2156 = _2144 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2154;
        float _2162 = _2146 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2150;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2176;
        float _2180 = 1.0 / _2172;
        float _2182 = 1.0 / _2178;
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = _2174 * _2184;
        float _2188 = _2170 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2192 = fma(_2188, _2186, _2190);
        float _2194 = _2192 * _2182;
        float _2196 = precise::clamp(_2194, 0.0, 1.0);
        _2138 = _2196;
    }
    float _2198 = _2138;
    float _2200 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2202 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2132);
    float _2204 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2206 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2208 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2200);
    float _2210 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2202);
    float _2212 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2214 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2206);
    float _2216 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2220 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2222 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2224 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2232 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2234 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2228);
    float _2240 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2230);
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2232);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2246 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2238);
    float _2250 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2240);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2242);
    bool _2254 = _2198 > 0.0;
    bool _2256 = isnan(_2198);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = _2198 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2266 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2248);
    float _2268 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2252);
    float _2270 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2250);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2244);
    float _2276 = _2266 + _2268;
    float _2278 = _2270 + _2268;
    float _2280 = _2268 * 0.5;
    float _2282 = _2276 * 0.5;
    float _2284 = _2278 * 0.5;
    float _2286 = fma(_2274, -0.5, _2280);
    out.m_63.x = _2062;
    out.m_65.x = _2126;
    out.m_65.y = _2124;
    out.m_65.z = _2128;
    out.m_33.x = _2272;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2274;
    out.gl_Position.z = _2270;
    out.gl_Position.w = _2268;
    out.m_67.x = _2282;
    out.m_67.y = _2286;
    out.m_67.z = _2284;
    out.m_67.w = _2268;
    if (_2262)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1328 = false;
    bool _1186 = false;
    bool _1072 = false;
    bool _930 = false;
    bool _762 = false;
    bool _472 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_102);
        out.gl_Position.z = _2345;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_138);
        out.gl_Position.z = _2414;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_37.x;
    float _142 = in.m_37.y;
    float _144 = in.m_37.z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_39.x;
    float _150 = in.m_39.y;
    float _152 = in.m_39.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_41.x;
    float _166 = in.m_41.y;
    float _168 = in.m_41.z;
    float _170 = _140 * _140;
    float _172 = _142 * _142;
    float _174 = fma(_148, _148, _170);
    float _176 = fma(_150, _150, _172);
    float _178 = fma(_164, _164, _174);
    float _180 = fma(_166, _166, _176);
    float _182 = _144 * _144;
    float _184 = sqrt(_178);
    float _186 = fma(_152, _152, _182);
    float _188 = fma(_168, _168, _186);
    float _190 = sqrt(_180);
    bool _192 = _184 > 0.0;
    float _194 = sqrt(_188);
    bool _196 = _190 > 0.0;
    float _198 = in.m_35.x;
    float _200 = in.m_35.y;
    float _202 = in.m_35.z;
    float _204 = 0.0;
    float _206 = _178;
    float _208 = _180;
    float _210 = _146;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _214 = _188;
    if (_192)
    {
        float _216 = rsqrt(_178);
        _204 = _216;
    }
    float _218 = _204;
    bool _220 = _194 > 0.0;
    float _222 = _194;
    if (!_162)
    {
        float _224 = _146 * _146;
        float _226 = _224 * 0.5;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (_196)
    {
        float _234 = rsqrt(_180);
        _230 = _234;
    }
    float _236 = _230;
    if (!_162)
    {
        float _238 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _238;
    }
    float _240 = _232;
    bool _242 = !_162;
    float _244 = 0.0;
    float _246 = _240;
    float _248 = 0.0;
    float _250 = _218;
    if (!_242)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _146 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _146);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _268;
        _246 = _280;
        _248 = _278;
        _206 = _270;
        _208 = _264;
    }
    float _282 = _244;
    float _284 = _246;
    float _286 = _248;
    float _288 = _206;
    float _290 = _208;
    bool _292 = !_162;
    float _294 = _282;
    float _296 = _286;
    float _298 = _288;
    float _300 = _290;
    float _302 = _284;
    if (!_292)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _146 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _210 = _322;
        _294 = _316;
        _296 = _312;
        _212 = _310;
    }
    float _324 = _210;
    float _326 = _294;
    float _328 = _296;
    float _330 = _212;
    float _332 = in.m_43.w;
    float _334 = _330;
    float _336 = _326;
    float _338 = _328;
    if (!_192)
    {
        _298 = 0.0;
    }
    float _340 = _298;
    float _342 = _340;
    if (_192)
    {
        float _344 = _218 * _148;
        _342 = _344;
    }
    float _346 = _342;
    if (!_192)
    {
        _300 = 0.0;
    }
    float _348 = _300;
    float _350 = in.m_30.x;
    float _352 = in.m_30.y;
    float _354 = in.m_30.z;
    float _356 = _348;
    if (!_192)
    {
        _334 = 0.0;
    }
    float _358 = _334;
    float _360 = _358;
    if (_192)
    {
        float _362 = _218 * _140;
        _356 = _362;
    }
    float _364 = _356;
    if (_192)
    {
        float _366 = _218 * _164;
        _360 = _366;
    }
    float _368 = _360;
    float _370 = 0.0;
    if (_220)
    {
        float _372 = rsqrt(_188);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_196)
    {
        _336 = 0.0;
    }
    float _382 = _336;
    float _384 = _382;
    if (_196)
    {
        float _386 = _236 * _150;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_324, _198, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_324, _200, _380);
    float _396 = 0.0;
    int _398 = as_type<int>(_388);
    if (!_196)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_196)
    {
        float _404 = _236 * _142;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = fma(_324, _202, _392);
    if (!_196)
    {
        _338 = 0.0;
    }
    float _410 = _338;
    float _412 = _410;
    if (_196)
    {
        float _414 = _236 * _166;
        _412 = _414;
    }
    float _416 = _412;
    int _418 = as_type<int>(_416);
    if (!_220)
    {
        _250 = 0.0;
    }
    float _420 = _250;
    float _422 = _420;
    if (!_220)
    {
        _302 = 0.0;
    }
    float _424 = _302;
    float _426 = _424;
    if (_220)
    {
        float _428 = _374 * _152;
        _422 = _428;
    }
    float _430 = _422;
    if (!_220)
    {
        _214 = 0.0;
    }
    float _432 = _214;
    float _434 = _432;
    if (_220)
    {
        float _436 = _374 * _144;
        _426 = _436;
    }
    float _438 = _426;
    float _440 = _438;
    if (_220)
    {
        float _442 = _374 * _168;
        _434 = _442;
    }
    float _444 = _434;
    float _446 = fma(_390, _332, _350);
    float _448 = fma(_394, _332, _352);
    float _450 = fma(_408, _332, _354);
    bool _452 = !_376;
    float _470;
    if (!_452)
    {
        float _454 = in.m_45.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_86);
        float _476 = 1.0 / _474;
        float _478 = _120 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = _480 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _480 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = _480 + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _510 = 1.0 / _496;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _526 = isnan(_480);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _500;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _540 = 1.0 / _508;
    float _542 = _484 * _510;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _546 = _480 + _544;
    float _548 = 1.0 / _504;
    float _550 = _488 * _536;
    bool _552 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _554 = isnan(_480);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_562;
    float _566 = _564 + 1.0;
    float _568 = _546 * _540;
    bool _570 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_480);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _582;
    float _586 = -_580;
    float _588 = _586 + 1.0;
    float _590 = _492 * _548;
    bool _592 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _580 * _566;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _618 = _602 * _588;
    float _620 = -_602;
    float _622 = _620 + 1.0;
    float _624 = fma(_608, _542, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _626 = fma(_612, _542, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _628 = fma(_584, _542, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = -_522;
    float _632 = _630 + 1.0;
    float _634 = _522 * _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _534 * _632;
    float _646 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _648 = fma(_638, _550, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _650 = fma(_642, _550, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _652 = _624 * _644;
    float _654 = _626 * _644;
    float _656 = _628 * _644;
    float _658 = -_534;
    float _660 = _658 + 1.0;
    float _662 = in.m_43.x;
    float _664 = in.m_43.y;
    float _666 = in.m_43.z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _684 = fma(_670, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _686 = fma(_674, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    float _690 = fma(_678, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_648, _634, _680);
    float _694 = fma(_646, _634, _682);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _708 = fma(_650, _634, _688);
    float _710 = fma(_698, _568, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_706, _568, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _716 = fma(_684, _618, _694);
    float _718 = fma(_686, _618, _692);
    float _720 = fma(_690, _618, _708);
    float _722 = fma(_710, _604, _716);
    float _724 = fma(_712, _604, _718);
    float _726 = fma(_714, _604, _720);
    float _728 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].x, _722);
    float _730 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].y, _724);
    float _732 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[147].z, _726);
    float _734 = _728 * _662;
    float _736 = _730 * _664;
    float _738 = _732 * _666;
    bool _740 = !_538;
    float _742 = _682;
    float _760;
    if (!_740)
    {
        float _744 = in.m_45.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        float _764 = float(_86);
        float _766 = 1.0 / _764;
        float _768 = _120 * _766;
        _760 = _768;
    }
    _762 = false;
    float _770 = _760;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = _770 + _772;
    bool _776 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _778 = isnan(_770);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _790 = _770 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _800 = 1.0 / _794;
    bool _802 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _804 = 1.0 / _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _806;
    float _810 = _774 * _800;
    bool _812 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _814 = isnan(_770);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = -_786;
    float _826 = _824 + 1.0;
    bool _828 = _770 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _830 = isnan(_770);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = fma(_808, _810, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _842 = _838 * _826;
    float _844 = -_838;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _852;
    float _856 = _790 * _804;
    float _858 = _822 * _846;
    float _860 = fma(_850, _810, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _862 = fma(_854, _810, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _864 = -_822;
    float _866 = _864 + 1.0;
    float _868 = _840 * _858;
    float _870 = _860 * _858;
    float _872 = _862 * _858;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].x, _870);
    float _888 = fma(_876, _856, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _890 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].y, _868);
    float _894 = fma(_884, _856, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[107].z, _872);
    float _898 = fma(_888, _842, _886);
    float _900 = fma(_890, _842, _892);
    float _902 = fma(_894, _842, _896);
    float _904 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].x, _898);
    float _906 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].y, _900);
    float _908 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[109].z, _902);
    bool _910 = !_802;
    float _928;
    if (!_910)
    {
        float _912 = in.m_45.x;
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _916 = _912 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _920 = _918 * _914;
        float _922 = floor(_920);
        float _924 = -_922;
        float _926 = _920 + _924;
        _928 = _926;
        _930 = true;
    }
    else
    {
        float _932 = float(_86);
        float _934 = 1.0 / _932;
        float _936 = _120 * _934;
        _928 = _936;
    }
    _930 = false;
    float _938 = _928;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _938 + _940;
    float _944 = _904 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _952 = isnan(_938);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _966 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_938);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _978;
    bool _982 = _938 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _984 = isnan(_938);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = 1.0 / _948;
    float _996 = -_960;
    float _998 = _996 + 1.0;
    float _1000 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1002 = _908 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1004 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1006 = 1.0 / _964;
    float _1008 = _980 * _994;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1014 = -_992;
    float _1016 = _1014 + 1.0;
    float _1018 = fma(_1008, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1020 = _976 * _998;
    float _1022 = -_976;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _1016;
    float _1028 = _1012 * _1006;
    float _1030 = _1018 * _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1034 = _938 + _1032;
    float _1036 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1040 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1040, _1026, _1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1044);
    float _1048 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1036;
    out.m_47.y = _1048;
    out.m_47.z = _1042;
    out.m_47.w = _1050;
    bool _1052 = !_1004;
    float _1070;
    if (!_1052)
    {
        float _1054 = in.m_45.x;
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1058 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _1062 = _1060 * _1056;
        float _1064 = floor(_1062);
        float _1066 = -_1064;
        float _1068 = _1062 + _1066;
        _1070 = _1068;
        _1072 = true;
    }
    else
    {
        float _1074 = float(_86);
        float _1076 = 1.0 / _1074;
        float _1078 = _120 * _1076;
        _1070 = _1078;
    }
    _1072 = false;
    float _1080 = _1070;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1084 = _1080 + _1082;
    bool _1086 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1098;
    bool _1102 = _1080 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1104 = isnan(_1080);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1096;
    float _1116 = _1114 + 1.0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1118;
    float _1122 = 1.0 / _1100;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = _1112 * _1116;
    float _1128 = -_1112;
    float _1130 = _1128 + 1.0;
    float _1132 = _1084 * _1122;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1134;
    float _1138 = fma(_1120, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1140;
    float _1144 = fma(_1136, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1146 = fma(_1142, _1132, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1148 = _1138 * _1126;
    float _1150 = _1146 * _1126;
    float _1152 = _1144 * _1126;
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1148);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1158 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1152);
    float _1160 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1154);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1156);
    float _1164 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1158);
    bool _1166 = !_1124;
    float _1184;
    if (!_1166)
    {
        float _1168 = in.m_45.x;
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1172 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1176 = _1174 * _1170;
        float _1178 = floor(_1176);
        float _1180 = -_1178;
        float _1182 = _1176 + _1180;
        _1184 = _1182;
        _1186 = true;
    }
    else
    {
        float _1188 = float(_86);
        float _1190 = 1.0 / _1188;
        float _1192 = _120 * _1190;
        _1184 = _1192;
    }
    _1186 = false;
    float _1194 = _1184;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1194 + _1196;
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1206 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1208 = isnan(_1194);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1222 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1224 = isnan(_1194);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1234;
    bool _1238 = _1194 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1240 = isnan(_1194);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = 1.0 / _1204;
    float _1252 = -_1216;
    float _1254 = _1252 + 1.0;
    float _1256 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1258 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1262 = 1.0 / _1220;
    float _1264 = _1236 * _1250;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    float _1274 = fma(_1264, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1276 = _1232 * _1254;
    float _1278 = -_1232;
    float _1280 = _1278 + 1.0;
    float _1282 = _1216 * _1272;
    float _1284 = _1268 * _1262;
    float _1286 = _1274 * _1276;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1290 = _1194 + _1288;
    float _1292 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1286);
    float _1296 = fma(_1284, _1290, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1298 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1296, _1282, _1294);
    float _1302 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1300);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_49.x = _1292;
    out.m_49.y = _1304;
    out.m_49.z = _1298;
    out.m_49.w = _1306;
    bool _1308 = !_1260;
    float _1326;
    if (!_1308)
    {
        float _1310 = in.m_45.x;
        float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1314 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[14].y, _120);
        float _1318 = _1316 * _1312;
        float _1320 = floor(_1318);
        float _1322 = -_1320;
        float _1324 = _1318 + _1322;
        _1326 = _1324;
        _1328 = true;
    }
    else
    {
        float _1330 = float(_86);
        float _1332 = 1.0 / _1330;
        float _1334 = _120 * _1332;
        _1326 = _1334;
    }
    _1328 = false;
    float _1336 = _1326;
    float _1338 = in.m_51.y;
    float _1340 = _448 * _150;
    float _1342 = _448 * _142;
    float _1344 = _448 * _166;
    float _1346 = in.m_45.y;
    float _1348 = fma(_446, _148, _1340);
    float _1350 = fma(_446, _140, _1342);
    float _1352 = in.m_45.z;
    float _1354 = fma(_446, _164, _1344);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_450, _152, _1348);
    float _1362 = in.m_45.w;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = fma(_450, _168, _1354);
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    float _1374 = in.m_45.x;
    float _1376 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1378 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1384 = -_1338;
    float _1386 = _1384 + 1.0;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1392 = in.m_51.x;
    bool _1394 = _1346 > 0.5;
    float _1396 = 1.0 / _1382;
    bool _1398 = _1352 > 0.5;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1402 = _1394 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1404 = in.m_39.w;
    int _1406 = _1398 ? as_type<int>(_1386) : as_type<int>(_1338);
    float _1408 = 1.0 / _1390;
    float _1410 = _1366 ? as_type<float>(_1402) : _1338;
    float _1412 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1414 = _1358 ? as_type<float>(_1406) : _1338;
    bool _1416 = _1362 > 0.5;
    float _1418 = in.m_53.x;
    float _1420 = in.m_53.y;
    float _1422 = in.m_53.z;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    float _1428 = _1338;
    bool _1430 = _1416;
    float _1432 = _1352;
    float _1434 = _1392;
    if (_1372)
    {
        float _1436 = _1416 ? _1386 : _1338;
        _1428 = _1436;
    }
    float _1438 = _1428;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_450, _144, _1350);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1458 = _1456 != 0;
    float _1460 = 1.0 / _1448;
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1464 = _1360 + _1404;
    float _1466 = fma(_1462, -2.0, _1400);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1484 = _1412 * _1474;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1498 = _1376 * _1476;
    float _1500 = _1488 * _1396;
    float _1502 = _1492 * _1408;
    float _1504 = in.m_37.w;
    float _1506 = 1.0 / _1470;
    float _1508 = _1378 * _1478;
    float _1510 = -_1472;
    float _1512 = fma(_1454, 2.0, _1510);
    float _1514 = in.m_41.w;
    float _1516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1518 = 1.0 / _1482;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1528 = _1404;
    if (_1426)
    {
        bool _1530 = _1374 > 0.5;
        _1430 = _1530;
    }
    bool _1532 = _1430;
    float _1534 = _1522 * _1460;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1538 = 1.0 / _1496;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1540;
    float _1544 = _1526 * _1506;
    if (!_1442)
    {
        _742 = _1352;
    }
    float _1546 = _742;
    float _1548 = _1546;
    if (_1442)
    {
        _1432 = _1346;
    }
    float _1550 = _1432;
    float _1552 = _1444 + _1504;
    float _1554 = _1542 * _1518;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1564 = _1518;
    if (!_1442)
    {
        _1564 = _1346;
    }
    float _1566 = _1564;
    float _1568 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1536);
    float _1570 = _1566;
    if (_1442)
    {
        _1570 = _1374;
    }
    float _1572 = _1570;
    float _1574 = _1368 + _1514;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1578 = _1336 + _1576;
    float _1580 = _1558 * _1538;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1584 = _1336 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1588 = _1336 + _1586;
    float _1590 = 1.0 / _1562;
    float _1592 = fma(_1500, _1578, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1502, _1584, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1598 = fma(_1534, _1588, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    if (_1442)
    {
        _1548 = _1346;
    }
    float _1600 = _1548;
    float _1602 = in.m_55.x;
    float _1604 = in.m_55.y;
    float _1606 = in.m_55.z;
    float _1608 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    bool _1610 = _1420 != 0.0;
    bool _1612 = isnan(_1420);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1624 = _1336 + _1622;
    bool _1626 = _1418 == 0.0;
    bool _1628 = !_1618;
    bool _1630 = _1626 && _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1634 = _1336 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1636;
    bool _1640 = _1422 == 0.0;
    bool _1642 = _1640 && _1630;
    float _1644 = fma(_1554, _1624, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1580, _1634, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1648 = _1638 * _1590;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1652 = _1336 + _1650;
    bool _1654 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1656 = isnan(_1336);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1668 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1670 = isnan(_1336);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1544, _1652, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1682 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1684 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1686 = isnan(_1336);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1664;
    float _1698 = _1696 + 1.0;
    float _1700 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1666);
    float _1702 = fma(_1682, _1410, -0.5);
    float _1704 = _1602;
    float _1706 = _1606;
    float _1708 = _1604;
    if (!_1642)
    {
        float _1710 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1602);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = _1694 * _1698;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1722 = isnan(_1336);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1678;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    float _1738 = _1678 * _1718;
    if (!_1642)
    {
        float _1740 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1606);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1730 * _1734;
    float _1746 = -_1730;
    float _1748 = _1746 + 1.0;
    float _1750 = _1508 * _388;
    float _1752 = _1508 * _406;
    float _1754 = _1508 * _416;
    bool _1756 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1758 = isnan(_1336);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    if (!_1642)
    {
        float _1768 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1604);
        _1708 = _1768;
    }
    float _1770 = _1708;
    float _1772 = fma(_1498, _346, _1750);
    float _1774 = fma(_1498, _364, _1752);
    float _1776 = fma(_1498, _368, _1754);
    float _1778 = -_1516;
    float _1780 = fma(_1736, _1702, _1778);
    bool _1782 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1784 = isnan(_1336);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1766 * _1748;
    float _1796 = -_1766;
    float _1798 = _1796 + 1.0;
    bool _1800 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1802 = isnan(_1336);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1814 = _1792 * _1798;
    float _1816 = -_1792;
    float _1818 = _1816 + 1.0;
    float _1820 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1822 = _1336 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1824 = isnan(_1336);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = _1810 * _1818;
    float _1836 = -_1810;
    float _1838 = _1836 + 1.0;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1844 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1846 = _1832 * _1838;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1850 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1840);
    float _1852 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1854 = fma(_1820, -2.0, _1842);
    float _1856 = _1592 * _1846;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1860 = _388 * _1770;
    float _1862 = _416 * _1770;
    float _1864 = -_1848;
    float _1866 = fma(_1844, 2.0, _1864);
    int _1868 = as_type<int>(_1848);
    float _1870 = _1770;
    if (_1426)
    {
        float _1872 = -_1392;
        float _1874 = _1872 + 1.0;
        _398 = as_type<int>(_1874);
    }
    int _1876 = _398;
    if (_1452)
    {
        float _1878 = -_1392;
        float _1880 = _1878 + 1.0;
        _418 = as_type<int>(_1880);
    }
    int _1882 = _418;
    if (_1458)
    {
        float _1884 = -_1392;
        float _1886 = _1884 + 1.0;
        _1868 = as_type<int>(_1886);
    }
    int _1888 = _1868;
    float _1890 = _406 * _1770;
    if (!_1426)
    {
        _1528 = _1392;
    }
    float _1892 = _1528;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1896 = _1892;
    if (!_1452)
    {
        _1870 = _1392;
    }
    float _1898 = _1870;
    float _1900 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1568);
    float _1902 = _1898;
    if (_1426)
    {
        float _1904 = _1532 ? as_type<float>(_1876) : _1392;
        _1896 = _1904;
    }
    float _1906 = _1896;
    float _1908 = fma(_364, _1712, _1890);
    if (_1452)
    {
        float _1910 = _1398 ? as_type<float>(_1882) : _1392;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = fma(_346, _1712, _1860);
    if (_1458)
    {
        float _1916 = _1394 ? as_type<float>(_1888) : _1392;
        _1434 = _1916;
    }
    float _1918 = _1434;
    float _1920 = -_1832;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_368, _1712, _1862);
    float _1926 = -_120;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1512);
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1856);
    float _1934 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1850);
    float _1936 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1700);
    float _1938 = -_120;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    float _1942 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1854);
    float _1944 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1946 = fma(_1596, _1834, _1932);
    float _1948 = fma(_1484, _444, _1776);
    float _1950 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1952 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1954 = fma(_1944, _1906, -0.5);
    float _1956 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = fma(_1484, _430, _1772);
    float _1960 = _1574 + _1948;
    float _1962 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1964 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1950);
    float _1966 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1952);
    float _1968 = fma(_1956, _1912, -0.5);
    float _1970 = _1464 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1978 = _1962 * _1930;
    float _1980 = fma(_430, _1742, _1914);
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1974 * _1974;
    float _1988 = fma(_444, _1742, _1924);
    float _1990 = fma(_1852, _1438, -0.5);
    float _1992 = fma(_438, _1742, _1908);
    float _1994 = fma(_1984, _1984, _1986);
    float _1996 = fma(_1900, _1954, _1928);
    float _1998 = -_1942;
    float _2000 = fma(_1936, _1990, _1998);
    float _2002 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2004 = sqrt(_1994);
    float _2006 = fma(_1934, _1968, _1940);
    float _2008 = _1780 + 0.5;
    float _2010 = _2000 + 0.5;
    float _2012 = _2002 * _1976;
    float _2014 = _1996 + 0.5;
    float _2016 = _2006 + 0.5;
    float _2018 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1966);
    float _2020 = fma(_1598, _1814, _1946);
    out.m_57.x = _2012;
    out.m_57.y = _1978;
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2024 = _1336 + _2022;
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2028 = fma(_1680, _1794, _2020);
    out.m_59.x = _2014;
    out.m_59.y = _2008;
    out.m_59.z = _2016;
    out.m_59.w = _2010;
    float _2030 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1964);
    float _2032 = 1.0 / _2026;
    bool _2034 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = fma(_1644, _1744, _2028);
    float _2038 = fma(_1484, _438, _1774);
    float _2040 = fma(_1648, _2024, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2042 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2044 = fma(_1646, _1738, _2036);
    float _2046 = _1552 + _2038;
    out.m_61.x = _1980;
    out.m_61.y = _1992;
    out.m_61.z = _1988;
    float _2048 = _2042 + _2026;
    float _2050 = fma(_2040, _1714, _2044);
    bool _2052 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2050);
    float _2064 = _2048 * _2032;
    float _2066 = _2064 * 0.5;
    float _2068 = _1980;
    float _2070 = _1988;
    float _2072 = _1992;
    if (!_2034)
    {
        _2068 = _1970;
    }
    float _2074 = _2068;
    float _2076 = _2074;
    if (!_2034)
    {
        _2070 = _1960;
    }
    float _2078 = _2070;
    float _2080 = _2078;
    if (!_2034)
    {
        _2072 = _2046;
    }
    float _2082 = _2072;
    bool _2084 = !_2034;
    float _2086 = _2082;
    if (!_2084)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2092 = _2004 + _2090;
        float _2094 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = rsqrt(_1994);
        float _2098 = _2092 * _2088;
        float _2100 = _2098 * 0.15915493667125701904296875;
        float _2102 = _2100 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2100 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = _2104 + (-1.0);
        float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = fma(_2108, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2116 = fma(_2046, _2104, _2112);
        float _2118 = _2096 * _2114;
        float _2120 = fma(_1984, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2122 = fma(_1974, _2118, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2086 = _2116;
        _2076 = _2120;
        _2080 = _2122;
        _440 = _2118;
    }
    float _2124 = _2086;
    float _2126 = _2076;
    float _2128 = _2080;
    float _2130 = _440;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2134 = _2130;
    if (_2060)
    {
        _2134 = 1.0;
    }
    float _2136 = _2134;
    float _2138 = _2136;
    if (!_2060)
    {
        float _2140 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2144 = _2140 * 0.15915493667125701904296875;
        float _2146 = _2142 * 0.15915493667125701904296875;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2150 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2148);
        float _2152 = _2144 * 6.283185482025146484375;
        float _2154 = cos(_2152);
        float _2156 = _2144 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2154;
        float _2162 = _2146 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2150;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2176;
        float _2180 = 1.0 / _2172;
        float _2182 = 1.0 / _2178;
        float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2186 = _2174 * _2184;
        float _2188 = _2170 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2192 = fma(_2188, _2186, _2190);
        float _2194 = _2192 * _2182;
        float _2196 = precise::clamp(_2194, 0.0, 1.0);
        _2138 = _2196;
    }
    float _2198 = _2138;
    float _2200 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2202 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2132);
    float _2204 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2206 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2208 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2200);
    float _2210 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2202);
    float _2212 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2214 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2206);
    float _2216 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2220 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2222 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2224 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2226 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2232 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2234 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2228);
    float _2240 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2230);
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2232);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2246 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2238);
    float _2250 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2240);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2242);
    bool _2254 = _2198 > 0.0;
    bool _2256 = isnan(_2198);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = _2198 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2266 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2248);
    float _2268 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2252);
    float _2270 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2250);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2244);
    float _2276 = _2266 + _2268;
    float _2278 = _2270 + _2268;
    float _2280 = _2268 * 0.5;
    float _2282 = _2276 * 0.5;
    float _2284 = _2278 * 0.5;
    float _2286 = fma(_2274, -0.5, _2280);
    out.m_63.x = _2062;
    out.m_65.x = _2126;
    out.m_65.y = _2124;
    out.m_65.z = _2128;
    out.m_33.x = _2272;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2274;
    out.gl_Position.z = _2270;
    out.gl_Position.w = _2268;
    out.m_67.x = _2282;
    out.m_67.y = _2286;
    out.m_67.z = _2284;
    out.m_67.w = _2268;
    if (_2262)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

