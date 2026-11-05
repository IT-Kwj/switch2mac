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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1434 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_32.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_102);
        out.gl_Position.z = _1922;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_37.w;
    float _108 = float(_86);
    float _110 = 1.0 / _108;
    float _112 = -_106;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_106);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = _114 * _110;
    bool _128 = _114 >= _108;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    out.m_39.x = _126;
    float _134 = _126;
    float _136 = _114;
    if (_132)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _94;
    if (_132)
    {
        out.m_35.x = 0.0;
    }
    if (_132)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_142);
        out.gl_Position.z = _1994;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_41.w;
    float _146 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.x;
    float _160 = in.m_37.y;
    float _162 = in.m_37.z;
    float _164 = in.m_32.x;
    float _166 = in.m_32.y;
    float _168 = in.m_32.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_43.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _126;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    bool _294 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _296 = isnan(_288);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _288 + _306;
    bool _310 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_288);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _332 = isnan(_288);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -_304;
    float _344 = _342 + 1.0;
    float _346 = 1.0 / _328;
    float _348 = _340 * _344;
    float _350 = -_340;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _324;
    float _362 = _320 * _352;
    float _364 = -_320;
    float _366 = _364 + 1.0;
    float _368 = _308 * _346;
    float _370 = _292 * _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_356, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_374, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = in.m_41.x;
    float _388 = in.m_41.y;
    float _390 = in.m_41.z;
    float _392 = _380 * _362;
    float _394 = _382 * _362;
    float _396 = _384 * _362;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _348, _410);
    float _424 = fma(_414, _348, _418);
    float _426 = fma(_416, _348, _420);
    float _428 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    float _434 = _428 * _386;
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    bool _440 = !_358;
    if (!_440)
    {
        float _442 = in.m_43.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _134 = _456;
    }
    float _458 = _134;
    float _460 = in.m_43.x;
    float _462 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _464 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _466 = in.m_43.z;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _478 = _476 != 0;
    float _480 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _462);
    float _484 = in.m_43.y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _464);
    float _488 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _490 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _482);
    float _492 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _494 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _488);
    float _496 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _498 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _500 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _460 * 2.0;
    float _514 = _466 * 2.0;
    float _516 = floor(_512);
    float _518 = _484 * 2.0;
    float _520 = _484 + _466;
    float _522 = _520 + (-1.0);
    float _524 = floor(_514);
    float _526 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _528 = _492 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _530 = _516 > 0.0;
    float _532 = floor(_518);
    bool _534 = _516 >= 0.0;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _528 + _544;
    int _548 = _542 ? 0 : 1;
    bool _550 = _524 > 0.0;
    float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _554 = log2(_552);
    bool _556 = _524 >= 0.0;
    bool _558 = isnan(_524);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _460 + _484;
    int _568 = ~_548;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    int _574 = _564 ? 0 : 1;
    float _576 = _566 + (-1.0);
    int _578 = _572;
    if (!_530)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _532 > 0.0;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _590 = _532 >= 0.0;
    bool _592 = isnan(_532);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _602 = !_470;
    int _604 = _602 ? 0 : 1;
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _554 * _114;
    float _618 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = _546 * _546;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _624 = _600 + _622;
    float _626 = exp2(_616);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _618 + _628;
    int _632 = abs(_604);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    int _638 = ~_574;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_630, _630, _620);
    int _646 = _642;
    bool _648 = _614;
    if (!_550)
    {
        int _650 = ~_574;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = 1.0 / _636;
    float _658 = fma(_624, _624, _644);
    float _660 = in.m_45.x;
    float _662 = in.m_45.y;
    float _664 = in.m_45.z;
    bool _666 = !_474;
    int _668 = _666 ? 0 : 1;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = abs(_668);
    float _682 = rsqrt(_658);
    float _684 = -_626;
    float _686 = _684 + 1.0;
    float _688 = float(_654);
    float _690 = _678 ? _686 : 0.0;
    float _692 = float(_632);
    int _694 = _598 ? 0 : 1;
    if (_614)
    {
        float _696 = _690 * _656;
        _136 = _696;
    }
    float _698 = _136;
    float _700 = float(_680);
    float _702 = _692 * _688;
    float _704 = float(_584);
    float _706 = _546 * _682;
    float _708 = _702 * (-2.0);
    float _710 = _630 * _682;
    float _712 = -_706;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    int _716 = ~_694;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _700 * _704;
    int _724 = _720;
    if (!_586)
    {
        int _726 = ~_694;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _736 = fma(_588, _708, _588);
    float _738 = fma(_708, _660, _660);
    float _740 = -_710;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _630);
    float _744 = _714 * _714;
    float _746 = _460 + (-0.5);
    float _748 = _624 * _682;
    float _750 = _722 * (-2.0);
    float _752 = fma(_742, _742, _744);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    bool _756 = !_478;
    int _758 = _756 ? 0 : 1;
    float _760 = -_748;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _624);
    float _764 = fma(_526, _750, _526);
    float _766 = fma(_736, _698, _754);
    int _768 = abs(_758);
    float _770 = fma(_762, _762, _752);
    float _772 = fma(_750, _662, _662);
    float _774 = _766 * 0.15915493667125701904296875;
    float _776 = _484 + (-0.5);
    float _778 = float(_730);
    float _780 = _460 + _466;
    float _782 = float(_768);
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = _780 + (-1.0);
    float _788 = _782 * _778;
    float _790 = fma(_764, _698, _784);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = _466 + (-0.5);
    float _796 = _788 * (-2.0);
    float _798 = _790 * 0.15915493667125701904296875;
    float _800 = in.m_47.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = fma(_796, _664, _664);
    float _808 = in.m_43.w;
    float _810 = fma(_792, _796, _792);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].z, _806);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _816 = _814 != 0;
    float _818 = 1.0 / _804;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    float _824 = fma(_810, _698, _812);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = _824 * 0.15915493667125701904296875;
    float _836 = 1.0 / _734;
    bool _838 = _484 > 0.5;
    if (_816)
    {
        bool _840 = _460 > 0.5;
        _648 = _840;
    }
    bool _842 = _648;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _852 = sqrt(_770);
    float _854 = -_800;
    float _856 = _854 + 1.0;
    float _858 = _850 * _818;
    float _860 = in.m_49.x;
    float _862 = in.m_49.y;
    float _864 = in.m_49.z;
    bool _866 = _808 > 0.5;
    float _868 = _774 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _846 * _836;
    int _874 = _866 ? as_type<int>(_856) : as_type<int>(_800);
    bool _876 = _866;
    float _878 = _800;
    int _880 = as_type<int>(_856);
    if (_822)
    {
        bool _882 = _466 > 0.5;
        _876 = _882;
    }
    bool _884 = _876;
    float _886 = _828 ? as_type<float>(_874) : _800;
    float _888 = _774 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _682 * _852;
    if (_832)
    {
        float _894 = _838 ? _856 : _800;
        _878 = _894;
    }
    float _896 = _878;
    float _898 = _496 * _892;
    float _900 = _798 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    bool _906 = _862 != 0.0;
    bool _908 = isnan(_862);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _798 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _860 == 0.0;
    bool _922 = !_914;
    bool _924 = _920 && _922;
    bool _926 = _864 == 0.0;
    bool _928 = _926 && _924;
    float _930 = _834 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _870 * _902;
    float _936 = _890 * _902;
    float _938 = _834 * 6.283185482025146484375;
    float _940 = sin(_938);
    float _942 = _890 * _918;
    float _944 = _870 * _918;
    float _946 = _890 * _932;
    float _948 = _918 * _932;
    float _950 = _870 * _932;
    float _952 = _902 * _932;
    float _954 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_940, _942, _934);
    float _958 = fma(_940, _934, _942);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _962 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _960;
    float _964 = -_936;
    float _966 = fma(_940, _944, _964);
    float _968 = -_944;
    float _970 = fma(_940, _936, _968);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _978;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _984 = _498 * _892;
    float _986 = _976 * _976;
    float _988 = _954 * _892;
    float _990 = _898 * _972;
    float _992 = _984 * _904;
    float _994 = fma(_962, _962, _986);
    float _996 = _988 * _982;
    float _998 = _946 * _990;
    float _1000 = -_990;
    float _1002 = _940 * _1000;
    float _1004 = fma(_980, _980, _994);
    float _1006 = _950 * _990;
    float _1008 = fma(_956, _996, _998);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _458 + _1010;
    float _1014 = sqrt(_1004);
    float _1016 = fma(_948, _996, _1002);
    float _1018 = fma(_970, _992, _1008);
    float _1020 = fma(_872, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1022 = fma(_966, _996, _1006);
    float _1024 = fma(_952, _992, _1016);
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = rsqrt(_1004);
    float _1032 = fma(_958, _992, _1022);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    float _1038 = in.m_47.x;
    float _1040 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    float _1044 = precise::max(_1014, 10.0);
    float _1046 = _1014 * 0.039999999105930328369140625;
    float _1048 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1040);
    float _1050 = _600 + _1042;
    float _1052 = precise::min(_1044, 50.0);
    float _1054 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1056 = precise::max(_1046, 1.0);
    float _1058 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _618 + _1054;
    float _1066 = fma(_1052, 0.25, -2.5);
    float _1068 = precise::min(_1056, 2.0);
    float _1070 = _528 + _1062;
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    bool _1076 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1078 = isnan(_458);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = _1030 * _1066;
    float _1090 = fma(_1060, _1068, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1092 = fma(_1074, _1068, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1094 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1096 = isnan(_458);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1086;
    float _1108 = _1106 + 1.0;
    float _1110 = -_1088;
    float _1112 = fma(_980, _1110, _1090);
    float _1114 = -_1088;
    float _1116 = fma(_962, _1114, _1092);
    float _1118 = 0.0;
    float _1120 = _864;
    float _1122 = _1112;
    float _1124 = _1116;
    if (!_816)
    {
        _1118 = _1038;
    }
    float _1126 = _1118;
    float _1128 = _1104 * _1108;
    float _1130 = -_1104;
    float _1132 = _1130 + 1.0;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1116 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1112 + _1138;
    float _1142 = in.m_51.x;
    float _1144 = in.m_51.y;
    float _1146 = in.m_51.z;
    float _1148 = _510 * _1132;
    float _1150 = _1136 * _1136;
    float _1152 = _1140 * _1140;
    float _1154 = _1132;
    float _1156 = _1126;
    float _1158 = _1150;
    float _1160 = _1152;
    if (!_816)
    {
        _1154 = _1126;
    }
    float _1162 = _1154;
    float _1164 = _1020 * _1148;
    float _1166 = _1162;
    if (_816)
    {
        _1156 = _1038;
    }
    float _1168 = _1156;
    float _1170 = _1150 + _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1174 = _458 + _1172;
    float _1176 = -_510;
    float _1178 = _1176 + 1.0;
    float _1180 = sqrt(_1170);
    float _1182 = fma(_858, _1174, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1164);
    if (_816)
    {
        float _1186 = -_1168;
        float _1188 = _1186 + 1.0;
        _880 = as_type<int>(_1188);
    }
    int _1190 = _880;
    float _1192 = fma(_1182, _1128, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1196 = _1070 + _1194;
    int _1198 = _1190;
    if (_816)
    {
        float _1200 = _842 ? as_type<float>(_1190) : _1168;
        _1166 = _1200;
    }
    float _1202 = _1166;
    if (_822)
    {
        float _1204 = -_1168;
        float _1206 = _1204 + 1.0;
        _1198 = as_type<int>(_1206);
    }
    int _1208 = _1198;
    float _1210 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1192);
    float _1212 = fma(_1196, _1068, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1214 = _1144;
    float _1216 = _1142;
    float _1218 = _1146;
    if (!_928)
    {
        float _1220 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1144);
        _1214 = _1220;
    }
    float _1222 = _1214;
    if (!_928)
    {
        float _1224 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1142);
        _1216 = _1224;
    }
    float _1226 = _1216;
    float _1228 = _1226;
    if (!_928)
    {
        float _1230 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1218 = _1230;
    }
    float _1232 = _1218;
    bool _1234 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -_1222;
    float _1238 = _940 * _1236;
    float _1240 = _946 * _1222;
    float _1242 = _950 * _1222;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = -_1088;
    float _1248 = fma(_976, _1246, _1212);
    if (!_822)
    {
        _1120 = _1168;
    }
    float _1250 = _1120;
    float _1252 = fma(_948, _1226, _1238);
    float _1254 = fma(_956, _1226, _1240);
    float _1256 = fma(_966, _1226, _1242);
    float _1258 = _1250;
    if (_822)
    {
        float _1260 = _884 ? as_type<float>(_1208) : _1168;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1234)
    {
        _1228 = _1248;
    }
    float _1266 = _1228;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1270 = !_1234;
    float _1272 = _1266;
    if (!_1270)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1278 = _1180 + _1276;
        float _1280 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = rsqrt(_1170);
        float _1284 = _1278 * _1274;
        float _1286 = _1284 * 0.15915493667125701904296875;
        float _1288 = _1286 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = _1286 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = fma(_1290, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1298 = _1282 * _1296;
        float _1300 = fma(_1136, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1302 = _1294 + (-1.0);
        float _1304 = fma(_1140, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1308 = _1300 + _1306;
        float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1314 = _1304 + _1312;
        float _1316 = _1308 * _1308;
        float _1318 = fma(_1248, _1294, _1310);
        float _1320 = _1314 * _1314;
        _1272 = _1318;
        _1158 = _1316;
        _1160 = _1320;
        _1122 = _1304;
        _1124 = _1300;
    }
    float _1322 = _1272;
    float _1324 = _1158;
    float _1326 = _1160;
    float _1328 = _1122;
    float _1330 = _1124;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1334 = _1322 + _1332;
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1338 = fma(_970, _1232, _1254);
    float _1340 = fma(_958, _1232, _1256);
    float _1342 = fma(_1334, _1334, _1324);
    float _1344 = fma(_952, _1232, _1252);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1348 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1350 = _1342 + _1326;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1346);
    float _1358 = _1348 * _1268;
    float _1360 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = sqrt(_1350);
    float _1364 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1370 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1372 = _1360 * _1264;
    float _1374 = _1364 * _1244;
    float _1376 = _1366 * _1336;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1380 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1384 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1386 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    out.m_53.w = _1378;
    bool _1388 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1390 = isnan(_1362);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1396 = _1392 || _1394;
    out.m_55.x = _1374;
    out.m_55.y = _1372;
    out.m_55.z = _1376;
    out.m_55.w = _1358;
    out.m_57.w = _1380;
    out.m_59.x = _988;
    float _1398 = _1364;
    if (!_1396)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    out.m_61.x = _1382;
    out.m_61.y = _1384;
    out.m_61.z = _1386;
    bool _1402 = !_1396;
    float _1404 = _1400;
    if (!_1402)
    {
        bool _1406 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1408 = isnan(_1362);
        bool _1410 = _1406 || _1408;
        bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1414 = _1410 || _1412;
        if (!_1414)
        {
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = _1362 + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1428 = 1.0 / _1422;
            float _1430 = _1418 * _1428;
            float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1404 = _1432;
            _1434 = true;
        }
        else
        {
            bool _1436 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1438 = isnan(_1362);
            bool _1440 = _1436 || _1438;
            bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1444 = _1440 || _1442;
            if (!_1444)
            {
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1362 + _1446;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1458 = 1.0 / _1452;
                float _1460 = _1448 * _1458;
                float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1404 = _1462;
                _1434 = true;
            }
            else
            {
                _1404 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1434 = false;
    float _1464 = _1404;
    float _1466 = -_706;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _1470 = -_710;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _1474 = -_748;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1322 + _1490;
    float _1494 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1478);
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1328 + _1496;
    float _1500 = fma(_1492, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1504 = _1330 + _1502;
    float _1506 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1494);
    float _1508 = fma(_1498, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -_706;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1500);
    float _1524 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1526 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1528 = -_748;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1532 = fma(_1504, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1534 = 1.0 / _1524;
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1526);
    float _1538 = -_710;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1542 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1536);
    float _1544 = _1536;
    float _1546 = _1542;
    float _1548 = _1540;
    if (_1488)
    {
        _1544 = _1522;
    }
    float _1550 = _1544;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = _1550;
    if (_1488)
    {
        _1546 = _1530;
    }
    float _1556 = _1546;
    float _1558 = _1556;
    if (!_1488)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1468 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1472 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_600;
        float _1572 = _1570 + _1508;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1476 + _1576;
        float _1580 = -_618;
        float _1582 = _1580 + _1532;
        float _1584 = fma(_1566, _1566, _1574);
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1588 = fma(_1578, _1578, _1584);
        float _1590 = sqrt(_1588);
        float _1592 = 1.0 / _892;
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1596 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1592;
        float _1602 = -_528;
        float _1604 = _1602 + _1500;
        float _1606 = _1594 * _1600;
        float _1608 = _1572 * _1600;
        float _1610 = fma(_1582, _1606, _1472);
        float _1612 = fma(_1604, _1606, _1468);
        float _1614 = fma(_1594, _1608, _1476);
        _1554 = _1612;
        _1548 = _1610;
        _1558 = _1614;
    }
    float _1616 = _1554;
    float _1618 = _1548;
    float _1620 = _1558;
    float _1622 = _1552 + _1524;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1622 * _1534;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1624);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1650 = 1.0 / _1640;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1656 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1642);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1656);
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = _1650 * _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1660);
    float _1684 = _1660;
    float _1686 = _1654;
    if (_1518)
    {
        _1684 = 1.0;
    }
    float _1688 = _1684;
    float _1690 = _1688;
    if (_1518)
    {
        _1686 = 1.0;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1518)
    {
        float _1696 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1706 = _1704 * 0.15915493667125701904296875;
        float _1708 = _1698 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = 1.0 / _1702;
        float _1714 = _1706 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = _1706 * 6.283185482025146484375;
        float _1722 = sin(_1720);
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1726 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1724;
        float _1728 = _1716 * _1718;
        float _1730 = 1.0 / _1726;
        float _1732 = 1.0 / _1728;
        float _1734 = _1722 * _1732;
        float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1738 = fma(_1680, _1734, _1736);
        float _1740 = _1738 * _1730;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        _1690 = _1742;
    }
    float _1744 = _1690;
    if (!_1518)
    {
        float _1746 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1748 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = 1.0 / _1752;
        float _1764 = _1756 * 6.283185482025146484375;
        float _1766 = cos(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = _1756 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1774;
        float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1780 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1778;
        float _1782 = 1.0 / _1780;
        float _1784 = _1772 * _1776;
        float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1788 = fma(_1680, _1784, _1786);
        float _1790 = _1788 * _1782;
        float _1792 = precise::clamp(_1790, 0.0, 1.0);
        float _1794 = -_1792;
        float _1796 = _1794 + 1.0;
        _1694 = _1796;
    }
    float _1798 = _1694;
    float _1800 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1802 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1804 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1806 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    bool _1808 = _1744 > 0.0;
    bool _1810 = isnan(_1744);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    float _1818 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1820 = _1744 * _1798;
    float _1822 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1824 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1804);
    float _1826 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1806);
    bool _1828 = _1798 <= 0.0;
    bool _1830 = !_1816;
    bool _1832 = _1828 || _1830;
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1822 + _1826;
    float _1840 = _1824 + _1826;
    float _1842 = _1826 * 0.5;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1618 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1616 + _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1620 + _1852;
    float _1856 = _1838 * 0.5;
    float _1858 = _1840 * 0.5;
    float _1860 = fma(_1834, -0.5, _1842);
    float _1862 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1618;
    out.m_63.y = _1616;
    out.m_63.z = _1620;
    out.m_65.x = _1846;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1834;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1826;
    out.m_67.x = _1856;
    out.m_67.y = _1860;
    out.m_67.z = _1858;
    out.m_67.w = _1826;
    out.m_35.x = _1862;
    if (!_1832)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1864;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1434 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_32.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_102);
        out.gl_Position.z = _1922;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_37.w;
    float _108 = float(_86);
    float _110 = 1.0 / _108;
    float _112 = -_106;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_106);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = _114 * _110;
    bool _128 = _114 >= _108;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    out.m_39.x = _126;
    float _134 = _126;
    float _136 = _114;
    if (_132)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _94;
    if (_132)
    {
        out.m_35.x = 0.0;
    }
    if (_132)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_142);
        out.gl_Position.z = _1994;
    }
    if (_132)
    {
        return out;
    }
    float _144 = in.m_41.w;
    float _146 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.x;
    float _160 = in.m_37.y;
    float _162 = in.m_37.z;
    float _164 = in.m_32.x;
    float _166 = in.m_32.y;
    float _168 = in.m_32.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_43.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _126;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    bool _294 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _296 = isnan(_288);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _288 + _306;
    bool _310 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_288);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _332 = isnan(_288);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -_304;
    float _344 = _342 + 1.0;
    float _346 = 1.0 / _328;
    float _348 = _340 * _344;
    float _350 = -_340;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _324;
    float _362 = _320 * _352;
    float _364 = -_320;
    float _366 = _364 + 1.0;
    float _368 = _308 * _346;
    float _370 = _292 * _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_356, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_374, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = in.m_41.x;
    float _388 = in.m_41.y;
    float _390 = in.m_41.z;
    float _392 = _380 * _362;
    float _394 = _382 * _362;
    float _396 = _384 * _362;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _348, _410);
    float _424 = fma(_414, _348, _418);
    float _426 = fma(_416, _348, _420);
    float _428 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    float _434 = _428 * _386;
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    bool _440 = !_358;
    if (!_440)
    {
        float _442 = in.m_43.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _134 = _456;
    }
    float _458 = _134;
    float _460 = in.m_43.x;
    float _462 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _464 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _466 = in.m_43.z;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _478 = _476 != 0;
    float _480 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _462);
    float _484 = in.m_43.y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _464);
    float _488 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _490 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _482);
    float _492 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _494 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _488);
    float _496 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _498 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _500 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _460 * 2.0;
    float _514 = _466 * 2.0;
    float _516 = floor(_512);
    float _518 = _484 * 2.0;
    float _520 = _484 + _466;
    float _522 = _520 + (-1.0);
    float _524 = floor(_514);
    float _526 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _528 = _492 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _530 = _516 > 0.0;
    float _532 = floor(_518);
    bool _534 = _516 >= 0.0;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _528 + _544;
    int _548 = _542 ? 0 : 1;
    bool _550 = _524 > 0.0;
    float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _554 = log2(_552);
    bool _556 = _524 >= 0.0;
    bool _558 = isnan(_524);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _460 + _484;
    int _568 = ~_548;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    int _574 = _564 ? 0 : 1;
    float _576 = _566 + (-1.0);
    int _578 = _572;
    if (!_530)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _532 > 0.0;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _590 = _532 >= 0.0;
    bool _592 = isnan(_532);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _602 = !_470;
    int _604 = _602 ? 0 : 1;
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _554 * _114;
    float _618 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = _546 * _546;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _624 = _600 + _622;
    float _626 = exp2(_616);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _618 + _628;
    int _632 = abs(_604);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    int _638 = ~_574;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_630, _630, _620);
    int _646 = _642;
    bool _648 = _614;
    if (!_550)
    {
        int _650 = ~_574;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = 1.0 / _636;
    float _658 = fma(_624, _624, _644);
    float _660 = in.m_45.x;
    float _662 = in.m_45.y;
    float _664 = in.m_45.z;
    bool _666 = !_474;
    int _668 = _666 ? 0 : 1;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = abs(_668);
    float _682 = rsqrt(_658);
    float _684 = -_626;
    float _686 = _684 + 1.0;
    float _688 = float(_654);
    float _690 = _678 ? _686 : 0.0;
    float _692 = float(_632);
    int _694 = _598 ? 0 : 1;
    if (_614)
    {
        float _696 = _690 * _656;
        _136 = _696;
    }
    float _698 = _136;
    float _700 = float(_680);
    float _702 = _692 * _688;
    float _704 = float(_584);
    float _706 = _546 * _682;
    float _708 = _702 * (-2.0);
    float _710 = _630 * _682;
    float _712 = -_706;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    int _716 = ~_694;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _700 * _704;
    int _724 = _720;
    if (!_586)
    {
        int _726 = ~_694;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _736 = fma(_588, _708, _588);
    float _738 = fma(_708, _660, _660);
    float _740 = -_710;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _630);
    float _744 = _714 * _714;
    float _746 = _460 + (-0.5);
    float _748 = _624 * _682;
    float _750 = _722 * (-2.0);
    float _752 = fma(_742, _742, _744);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    bool _756 = !_478;
    int _758 = _756 ? 0 : 1;
    float _760 = -_748;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _624);
    float _764 = fma(_526, _750, _526);
    float _766 = fma(_736, _698, _754);
    int _768 = abs(_758);
    float _770 = fma(_762, _762, _752);
    float _772 = fma(_750, _662, _662);
    float _774 = _766 * 0.15915493667125701904296875;
    float _776 = _484 + (-0.5);
    float _778 = float(_730);
    float _780 = _460 + _466;
    float _782 = float(_768);
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = _780 + (-1.0);
    float _788 = _782 * _778;
    float _790 = fma(_764, _698, _784);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = _466 + (-0.5);
    float _796 = _788 * (-2.0);
    float _798 = _790 * 0.15915493667125701904296875;
    float _800 = in.m_47.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = fma(_796, _664, _664);
    float _808 = in.m_43.w;
    float _810 = fma(_792, _796, _792);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].z, _806);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _816 = _814 != 0;
    float _818 = 1.0 / _804;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    float _824 = fma(_810, _698, _812);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = _824 * 0.15915493667125701904296875;
    float _836 = 1.0 / _734;
    bool _838 = _484 > 0.5;
    if (_816)
    {
        bool _840 = _460 > 0.5;
        _648 = _840;
    }
    bool _842 = _648;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _852 = sqrt(_770);
    float _854 = -_800;
    float _856 = _854 + 1.0;
    float _858 = _850 * _818;
    float _860 = in.m_49.x;
    float _862 = in.m_49.y;
    float _864 = in.m_49.z;
    bool _866 = _808 > 0.5;
    float _868 = _774 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _846 * _836;
    int _874 = _866 ? as_type<int>(_856) : as_type<int>(_800);
    bool _876 = _866;
    float _878 = _800;
    int _880 = as_type<int>(_856);
    if (_822)
    {
        bool _882 = _466 > 0.5;
        _876 = _882;
    }
    bool _884 = _876;
    float _886 = _828 ? as_type<float>(_874) : _800;
    float _888 = _774 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _682 * _852;
    if (_832)
    {
        float _894 = _838 ? _856 : _800;
        _878 = _894;
    }
    float _896 = _878;
    float _898 = _496 * _892;
    float _900 = _798 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    bool _906 = _862 != 0.0;
    bool _908 = isnan(_862);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _798 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _860 == 0.0;
    bool _922 = !_914;
    bool _924 = _920 && _922;
    bool _926 = _864 == 0.0;
    bool _928 = _926 && _924;
    float _930 = _834 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _870 * _902;
    float _936 = _890 * _902;
    float _938 = _834 * 6.283185482025146484375;
    float _940 = sin(_938);
    float _942 = _890 * _918;
    float _944 = _870 * _918;
    float _946 = _890 * _932;
    float _948 = _918 * _932;
    float _950 = _870 * _932;
    float _952 = _902 * _932;
    float _954 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_940, _942, _934);
    float _958 = fma(_940, _934, _942);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _962 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _960;
    float _964 = -_936;
    float _966 = fma(_940, _944, _964);
    float _968 = -_944;
    float _970 = fma(_940, _936, _968);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _978;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _984 = _498 * _892;
    float _986 = _976 * _976;
    float _988 = _954 * _892;
    float _990 = _898 * _972;
    float _992 = _984 * _904;
    float _994 = fma(_962, _962, _986);
    float _996 = _988 * _982;
    float _998 = _946 * _990;
    float _1000 = -_990;
    float _1002 = _940 * _1000;
    float _1004 = fma(_980, _980, _994);
    float _1006 = _950 * _990;
    float _1008 = fma(_956, _996, _998);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _458 + _1010;
    float _1014 = sqrt(_1004);
    float _1016 = fma(_948, _996, _1002);
    float _1018 = fma(_970, _992, _1008);
    float _1020 = fma(_872, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1022 = fma(_966, _996, _1006);
    float _1024 = fma(_952, _992, _1016);
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = rsqrt(_1004);
    float _1032 = fma(_958, _992, _1022);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    float _1038 = in.m_47.x;
    float _1040 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    float _1044 = precise::max(_1014, 10.0);
    float _1046 = _1014 * 0.039999999105930328369140625;
    float _1048 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1040);
    float _1050 = _600 + _1042;
    float _1052 = precise::min(_1044, 50.0);
    float _1054 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1056 = precise::max(_1046, 1.0);
    float _1058 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _618 + _1054;
    float _1066 = fma(_1052, 0.25, -2.5);
    float _1068 = precise::min(_1056, 2.0);
    float _1070 = _528 + _1062;
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    bool _1076 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1078 = isnan(_458);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = _1030 * _1066;
    float _1090 = fma(_1060, _1068, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1092 = fma(_1074, _1068, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1094 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1096 = isnan(_458);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1086;
    float _1108 = _1106 + 1.0;
    float _1110 = -_1088;
    float _1112 = fma(_980, _1110, _1090);
    float _1114 = -_1088;
    float _1116 = fma(_962, _1114, _1092);
    float _1118 = 0.0;
    float _1120 = _864;
    float _1122 = _1112;
    float _1124 = _1116;
    if (!_816)
    {
        _1118 = _1038;
    }
    float _1126 = _1118;
    float _1128 = _1104 * _1108;
    float _1130 = -_1104;
    float _1132 = _1130 + 1.0;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1116 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1112 + _1138;
    float _1142 = in.m_51.x;
    float _1144 = in.m_51.y;
    float _1146 = in.m_51.z;
    float _1148 = _510 * _1132;
    float _1150 = _1136 * _1136;
    float _1152 = _1140 * _1140;
    float _1154 = _1132;
    float _1156 = _1126;
    float _1158 = _1150;
    float _1160 = _1152;
    if (!_816)
    {
        _1154 = _1126;
    }
    float _1162 = _1154;
    float _1164 = _1020 * _1148;
    float _1166 = _1162;
    if (_816)
    {
        _1156 = _1038;
    }
    float _1168 = _1156;
    float _1170 = _1150 + _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1174 = _458 + _1172;
    float _1176 = -_510;
    float _1178 = _1176 + 1.0;
    float _1180 = sqrt(_1170);
    float _1182 = fma(_858, _1174, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1164);
    if (_816)
    {
        float _1186 = -_1168;
        float _1188 = _1186 + 1.0;
        _880 = as_type<int>(_1188);
    }
    int _1190 = _880;
    float _1192 = fma(_1182, _1128, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1196 = _1070 + _1194;
    int _1198 = _1190;
    if (_816)
    {
        float _1200 = _842 ? as_type<float>(_1190) : _1168;
        _1166 = _1200;
    }
    float _1202 = _1166;
    if (_822)
    {
        float _1204 = -_1168;
        float _1206 = _1204 + 1.0;
        _1198 = as_type<int>(_1206);
    }
    int _1208 = _1198;
    float _1210 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1192);
    float _1212 = fma(_1196, _1068, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1214 = _1144;
    float _1216 = _1142;
    float _1218 = _1146;
    if (!_928)
    {
        float _1220 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1144);
        _1214 = _1220;
    }
    float _1222 = _1214;
    if (!_928)
    {
        float _1224 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1142);
        _1216 = _1224;
    }
    float _1226 = _1216;
    float _1228 = _1226;
    if (!_928)
    {
        float _1230 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1218 = _1230;
    }
    float _1232 = _1218;
    bool _1234 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -_1222;
    float _1238 = _940 * _1236;
    float _1240 = _946 * _1222;
    float _1242 = _950 * _1222;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = -_1088;
    float _1248 = fma(_976, _1246, _1212);
    if (!_822)
    {
        _1120 = _1168;
    }
    float _1250 = _1120;
    float _1252 = fma(_948, _1226, _1238);
    float _1254 = fma(_956, _1226, _1240);
    float _1256 = fma(_966, _1226, _1242);
    float _1258 = _1250;
    if (_822)
    {
        float _1260 = _884 ? as_type<float>(_1208) : _1168;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1234)
    {
        _1228 = _1248;
    }
    float _1266 = _1228;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1270 = !_1234;
    float _1272 = _1266;
    if (!_1270)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1278 = _1180 + _1276;
        float _1280 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = rsqrt(_1170);
        float _1284 = _1278 * _1274;
        float _1286 = _1284 * 0.15915493667125701904296875;
        float _1288 = _1286 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = _1286 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = fma(_1290, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1298 = _1282 * _1296;
        float _1300 = fma(_1136, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1302 = _1294 + (-1.0);
        float _1304 = fma(_1140, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1308 = _1300 + _1306;
        float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1314 = _1304 + _1312;
        float _1316 = _1308 * _1308;
        float _1318 = fma(_1248, _1294, _1310);
        float _1320 = _1314 * _1314;
        _1272 = _1318;
        _1158 = _1316;
        _1160 = _1320;
        _1122 = _1304;
        _1124 = _1300;
    }
    float _1322 = _1272;
    float _1324 = _1158;
    float _1326 = _1160;
    float _1328 = _1122;
    float _1330 = _1124;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1334 = _1322 + _1332;
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1338 = fma(_970, _1232, _1254);
    float _1340 = fma(_958, _1232, _1256);
    float _1342 = fma(_1334, _1334, _1324);
    float _1344 = fma(_952, _1232, _1252);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1348 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1350 = _1342 + _1326;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1346);
    float _1358 = _1348 * _1268;
    float _1360 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = sqrt(_1350);
    float _1364 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1370 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1372 = _1360 * _1264;
    float _1374 = _1364 * _1244;
    float _1376 = _1366 * _1336;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1380 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1384 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1386 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    out.m_53.w = _1378;
    bool _1388 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1390 = isnan(_1362);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1396 = _1392 || _1394;
    out.m_55.x = _1374;
    out.m_55.y = _1372;
    out.m_55.z = _1376;
    out.m_55.w = _1358;
    out.m_57.w = _1380;
    out.m_59.x = _988;
    float _1398 = _1364;
    if (!_1396)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    out.m_61.x = _1382;
    out.m_61.y = _1384;
    out.m_61.z = _1386;
    bool _1402 = !_1396;
    float _1404 = _1400;
    if (!_1402)
    {
        bool _1406 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1408 = isnan(_1362);
        bool _1410 = _1406 || _1408;
        bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1414 = _1410 || _1412;
        if (!_1414)
        {
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = _1362 + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1428 = 1.0 / _1422;
            float _1430 = _1418 * _1428;
            float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1404 = _1432;
            _1434 = true;
        }
        else
        {
            bool _1436 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1438 = isnan(_1362);
            bool _1440 = _1436 || _1438;
            bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1444 = _1440 || _1442;
            if (!_1444)
            {
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1362 + _1446;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1458 = 1.0 / _1452;
                float _1460 = _1448 * _1458;
                float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1404 = _1462;
                _1434 = true;
            }
            else
            {
                _1404 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1434 = false;
    float _1464 = _1404;
    float _1466 = -_706;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _1470 = -_710;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _1474 = -_748;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1322 + _1490;
    float _1494 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1478);
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1328 + _1496;
    float _1500 = fma(_1492, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1504 = _1330 + _1502;
    float _1506 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1494);
    float _1508 = fma(_1498, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -_706;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1500);
    float _1524 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1526 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1528 = -_748;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1532 = fma(_1504, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1534 = 1.0 / _1524;
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1526);
    float _1538 = -_710;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1542 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1536);
    float _1544 = _1536;
    float _1546 = _1542;
    float _1548 = _1540;
    if (_1488)
    {
        _1544 = _1522;
    }
    float _1550 = _1544;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = _1550;
    if (_1488)
    {
        _1546 = _1530;
    }
    float _1556 = _1546;
    float _1558 = _1556;
    if (!_1488)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1468 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1472 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_600;
        float _1572 = _1570 + _1508;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1476 + _1576;
        float _1580 = -_618;
        float _1582 = _1580 + _1532;
        float _1584 = fma(_1566, _1566, _1574);
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1588 = fma(_1578, _1578, _1584);
        float _1590 = sqrt(_1588);
        float _1592 = 1.0 / _892;
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1596 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1592;
        float _1602 = -_528;
        float _1604 = _1602 + _1500;
        float _1606 = _1594 * _1600;
        float _1608 = _1572 * _1600;
        float _1610 = fma(_1582, _1606, _1472);
        float _1612 = fma(_1604, _1606, _1468);
        float _1614 = fma(_1594, _1608, _1476);
        _1554 = _1612;
        _1548 = _1610;
        _1558 = _1614;
    }
    float _1616 = _1554;
    float _1618 = _1548;
    float _1620 = _1558;
    float _1622 = _1552 + _1524;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1622 * _1534;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1624);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1650 = 1.0 / _1640;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1656 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1642);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1656);
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = _1650 * _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1660);
    float _1684 = _1660;
    float _1686 = _1654;
    if (_1518)
    {
        _1684 = 1.0;
    }
    float _1688 = _1684;
    float _1690 = _1688;
    if (_1518)
    {
        _1686 = 1.0;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1518)
    {
        float _1696 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1706 = _1704 * 0.15915493667125701904296875;
        float _1708 = _1698 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = 1.0 / _1702;
        float _1714 = _1706 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = _1706 * 6.283185482025146484375;
        float _1722 = sin(_1720);
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1726 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1724;
        float _1728 = _1716 * _1718;
        float _1730 = 1.0 / _1726;
        float _1732 = 1.0 / _1728;
        float _1734 = _1722 * _1732;
        float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1738 = fma(_1680, _1734, _1736);
        float _1740 = _1738 * _1730;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        _1690 = _1742;
    }
    float _1744 = _1690;
    if (!_1518)
    {
        float _1746 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1748 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = 1.0 / _1752;
        float _1764 = _1756 * 6.283185482025146484375;
        float _1766 = cos(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = _1756 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1774;
        float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1780 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1778;
        float _1782 = 1.0 / _1780;
        float _1784 = _1772 * _1776;
        float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1788 = fma(_1680, _1784, _1786);
        float _1790 = _1788 * _1782;
        float _1792 = precise::clamp(_1790, 0.0, 1.0);
        float _1794 = -_1792;
        float _1796 = _1794 + 1.0;
        _1694 = _1796;
    }
    float _1798 = _1694;
    float _1800 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1802 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1804 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1806 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    bool _1808 = _1744 > 0.0;
    bool _1810 = isnan(_1744);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    float _1818 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1820 = _1744 * _1798;
    float _1822 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1824 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1804);
    float _1826 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1806);
    bool _1828 = _1798 <= 0.0;
    bool _1830 = !_1816;
    bool _1832 = _1828 || _1830;
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1822 + _1826;
    float _1840 = _1824 + _1826;
    float _1842 = _1826 * 0.5;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1618 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1616 + _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1620 + _1852;
    float _1856 = _1838 * 0.5;
    float _1858 = _1840 * 0.5;
    float _1860 = fma(_1834, -0.5, _1842);
    float _1862 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1618;
    out.m_63.y = _1616;
    out.m_63.z = _1620;
    out.m_65.x = _1846;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1834;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1826;
    out.m_67.x = _1856;
    out.m_67.y = _1860;
    out.m_67.z = _1858;
    out.m_67.w = _1826;
    out.m_35.x = _1862;
    if (!_1832)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1864;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1434 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_32.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_102);
        out.gl_Position.z = _1922;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_37.w;
    float _108 = float(_86);
    float _110 = 1.0 / _108;
    float _112 = -_106;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_106);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = _114 * _110;
    bool _128 = _114 >= _108;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    out.m_39.x = _126;
    float _134 = _126;
    float _136 = _114;
    if (_132)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _94;
    if (_132)
    {
        out.m_35.x = 0.0;
    }
    if (_132)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_142);
        out.gl_Position.z = _1994;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_41.w;
    float _146 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_37.x;
    float _160 = in.m_37.y;
    float _162 = in.m_37.z;
    float _164 = in.m_32.x;
    float _166 = in.m_32.y;
    float _168 = in.m_32.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_43.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _126;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    bool _294 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _296 = isnan(_288);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _288 + _306;
    bool _310 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_288);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _332 = isnan(_288);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -_304;
    float _344 = _342 + 1.0;
    float _346 = 1.0 / _328;
    float _348 = _340 * _344;
    float _350 = -_340;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _324;
    float _362 = _320 * _352;
    float _364 = -_320;
    float _366 = _364 + 1.0;
    float _368 = _308 * _346;
    float _370 = _292 * _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_356, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_374, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = in.m_41.x;
    float _388 = in.m_41.y;
    float _390 = in.m_41.z;
    float _392 = _380 * _362;
    float _394 = _382 * _362;
    float _396 = _384 * _362;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _348, _410);
    float _424 = fma(_414, _348, _418);
    float _426 = fma(_416, _348, _420);
    float _428 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    float _434 = _428 * _386;
    float _436 = _430 * _388;
    float _438 = _432 * _390;
    bool _440 = !_358;
    if (!_440)
    {
        float _442 = in.m_43.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _134 = _456;
    }
    float _458 = _134;
    float _460 = in.m_43.x;
    float _462 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _464 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _466 = in.m_43.z;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _478 = _476 != 0;
    float _480 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _462);
    float _484 = in.m_43.y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _464);
    float _488 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _490 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _482);
    float _492 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _494 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _488);
    float _496 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _498 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _500 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _460 * 2.0;
    float _514 = _466 * 2.0;
    float _516 = floor(_512);
    float _518 = _484 * 2.0;
    float _520 = _484 + _466;
    float _522 = _520 + (-1.0);
    float _524 = floor(_514);
    float _526 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _528 = _492 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _530 = _516 > 0.0;
    float _532 = floor(_518);
    bool _534 = _516 >= 0.0;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _528 + _544;
    int _548 = _542 ? 0 : 1;
    bool _550 = _524 > 0.0;
    float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _554 = log2(_552);
    bool _556 = _524 >= 0.0;
    bool _558 = isnan(_524);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _460 + _484;
    int _568 = ~_548;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    int _574 = _564 ? 0 : 1;
    float _576 = _566 + (-1.0);
    int _578 = _572;
    if (!_530)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _532 > 0.0;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _590 = _532 >= 0.0;
    bool _592 = isnan(_532);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _602 = !_470;
    int _604 = _602 ? 0 : 1;
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _554 * _114;
    float _618 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = _546 * _546;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _624 = _600 + _622;
    float _626 = exp2(_616);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _618 + _628;
    int _632 = abs(_604);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _636 = 1.0 + _634;
    int _638 = ~_574;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_630, _630, _620);
    int _646 = _642;
    bool _648 = _614;
    if (!_550)
    {
        int _650 = ~_574;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = 1.0 / _636;
    float _658 = fma(_624, _624, _644);
    float _660 = in.m_45.x;
    float _662 = in.m_45.y;
    float _664 = in.m_45.z;
    bool _666 = !_474;
    int _668 = _666 ? 0 : 1;
    bool _670 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = abs(_668);
    float _682 = rsqrt(_658);
    float _684 = -_626;
    float _686 = _684 + 1.0;
    float _688 = float(_654);
    float _690 = _678 ? _686 : 0.0;
    float _692 = float(_632);
    int _694 = _598 ? 0 : 1;
    if (_614)
    {
        float _696 = _690 * _656;
        _136 = _696;
    }
    float _698 = _136;
    float _700 = float(_680);
    float _702 = _692 * _688;
    float _704 = float(_584);
    float _706 = _546 * _682;
    float _708 = _702 * (-2.0);
    float _710 = _630 * _682;
    float _712 = -_706;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    int _716 = ~_694;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    float _722 = _700 * _704;
    int _724 = _720;
    if (!_586)
    {
        int _726 = ~_694;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _736 = fma(_588, _708, _588);
    float _738 = fma(_708, _660, _660);
    float _740 = -_710;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _630);
    float _744 = _714 * _714;
    float _746 = _460 + (-0.5);
    float _748 = _624 * _682;
    float _750 = _722 * (-2.0);
    float _752 = fma(_742, _742, _744);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    bool _756 = !_478;
    int _758 = _756 ? 0 : 1;
    float _760 = -_748;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _624);
    float _764 = fma(_526, _750, _526);
    float _766 = fma(_736, _698, _754);
    int _768 = abs(_758);
    float _770 = fma(_762, _762, _752);
    float _772 = fma(_750, _662, _662);
    float _774 = _766 * 0.15915493667125701904296875;
    float _776 = _484 + (-0.5);
    float _778 = float(_730);
    float _780 = _460 + _466;
    float _782 = float(_768);
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = _780 + (-1.0);
    float _788 = _782 * _778;
    float _790 = fma(_764, _698, _784);
    float _792 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _794 = _466 + (-0.5);
    float _796 = _788 * (-2.0);
    float _798 = _790 * 0.15915493667125701904296875;
    float _800 = in.m_47.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _806 = fma(_796, _664, _664);
    float _808 = in.m_43.w;
    float _810 = fma(_792, _796, _792);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].z, _806);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _816 = _814 != 0;
    float _818 = 1.0 / _804;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    float _824 = fma(_810, _698, _812);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = _824 * 0.15915493667125701904296875;
    float _836 = 1.0 / _734;
    bool _838 = _484 > 0.5;
    if (_816)
    {
        bool _840 = _460 > 0.5;
        _648 = _840;
    }
    bool _842 = _648;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _852 = sqrt(_770);
    float _854 = -_800;
    float _856 = _854 + 1.0;
    float _858 = _850 * _818;
    float _860 = in.m_49.x;
    float _862 = in.m_49.y;
    float _864 = in.m_49.z;
    bool _866 = _808 > 0.5;
    float _868 = _774 * 6.283185482025146484375;
    float _870 = sin(_868);
    float _872 = _846 * _836;
    int _874 = _866 ? as_type<int>(_856) : as_type<int>(_800);
    bool _876 = _866;
    float _878 = _800;
    int _880 = as_type<int>(_856);
    if (_822)
    {
        bool _882 = _466 > 0.5;
        _876 = _882;
    }
    bool _884 = _876;
    float _886 = _828 ? as_type<float>(_874) : _800;
    float _888 = _774 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _682 * _852;
    if (_832)
    {
        float _894 = _838 ? _856 : _800;
        _878 = _894;
    }
    float _896 = _878;
    float _898 = _496 * _892;
    float _900 = _798 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    bool _906 = _862 != 0.0;
    bool _908 = isnan(_862);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _798 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _860 == 0.0;
    bool _922 = !_914;
    bool _924 = _920 && _922;
    bool _926 = _864 == 0.0;
    bool _928 = _926 && _924;
    float _930 = _834 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _870 * _902;
    float _936 = _890 * _902;
    float _938 = _834 * 6.283185482025146484375;
    float _940 = sin(_938);
    float _942 = _890 * _918;
    float _944 = _870 * _918;
    float _946 = _890 * _932;
    float _948 = _918 * _932;
    float _950 = _870 * _932;
    float _952 = _902 * _932;
    float _954 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _956 = fma(_940, _942, _934);
    float _958 = fma(_940, _934, _942);
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _962 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _960;
    float _964 = -_936;
    float _966 = fma(_940, _944, _964);
    float _968 = -_944;
    float _970 = fma(_940, _936, _968);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _976 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _978;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _984 = _498 * _892;
    float _986 = _976 * _976;
    float _988 = _954 * _892;
    float _990 = _898 * _972;
    float _992 = _984 * _904;
    float _994 = fma(_962, _962, _986);
    float _996 = _988 * _982;
    float _998 = _946 * _990;
    float _1000 = -_990;
    float _1002 = _940 * _1000;
    float _1004 = fma(_980, _980, _994);
    float _1006 = _950 * _990;
    float _1008 = fma(_956, _996, _998);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _458 + _1010;
    float _1014 = sqrt(_1004);
    float _1016 = fma(_948, _996, _1002);
    float _1018 = fma(_970, _992, _1008);
    float _1020 = fma(_872, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1022 = fma(_966, _996, _1006);
    float _1024 = fma(_952, _992, _1016);
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = rsqrt(_1004);
    float _1032 = fma(_958, _992, _1022);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    float _1038 = in.m_47.x;
    float _1040 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1042 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    float _1044 = precise::max(_1014, 10.0);
    float _1046 = _1014 * 0.039999999105930328369140625;
    float _1048 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1040);
    float _1050 = _600 + _1042;
    float _1052 = precise::min(_1044, 50.0);
    float _1054 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1056 = precise::max(_1046, 1.0);
    float _1058 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _618 + _1054;
    float _1066 = fma(_1052, 0.25, -2.5);
    float _1068 = precise::min(_1056, 2.0);
    float _1070 = _528 + _1062;
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    bool _1076 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1078 = isnan(_458);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = _1030 * _1066;
    float _1090 = fma(_1060, _1068, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1092 = fma(_1074, _1068, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1094 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1096 = isnan(_458);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1086;
    float _1108 = _1106 + 1.0;
    float _1110 = -_1088;
    float _1112 = fma(_980, _1110, _1090);
    float _1114 = -_1088;
    float _1116 = fma(_962, _1114, _1092);
    float _1118 = 0.0;
    float _1120 = _864;
    float _1122 = _1112;
    float _1124 = _1116;
    if (!_816)
    {
        _1118 = _1038;
    }
    float _1126 = _1118;
    float _1128 = _1104 * _1108;
    float _1130 = -_1104;
    float _1132 = _1130 + 1.0;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1116 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1112 + _1138;
    float _1142 = in.m_51.x;
    float _1144 = in.m_51.y;
    float _1146 = in.m_51.z;
    float _1148 = _510 * _1132;
    float _1150 = _1136 * _1136;
    float _1152 = _1140 * _1140;
    float _1154 = _1132;
    float _1156 = _1126;
    float _1158 = _1150;
    float _1160 = _1152;
    if (!_816)
    {
        _1154 = _1126;
    }
    float _1162 = _1154;
    float _1164 = _1020 * _1148;
    float _1166 = _1162;
    if (_816)
    {
        _1156 = _1038;
    }
    float _1168 = _1156;
    float _1170 = _1150 + _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1174 = _458 + _1172;
    float _1176 = -_510;
    float _1178 = _1176 + 1.0;
    float _1180 = sqrt(_1170);
    float _1182 = fma(_858, _1174, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1164);
    if (_816)
    {
        float _1186 = -_1168;
        float _1188 = _1186 + 1.0;
        _880 = as_type<int>(_1188);
    }
    int _1190 = _880;
    float _1192 = fma(_1182, _1128, _1184);
    float _1194 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1196 = _1070 + _1194;
    int _1198 = _1190;
    if (_816)
    {
        float _1200 = _842 ? as_type<float>(_1190) : _1168;
        _1166 = _1200;
    }
    float _1202 = _1166;
    if (_822)
    {
        float _1204 = -_1168;
        float _1206 = _1204 + 1.0;
        _1198 = as_type<int>(_1206);
    }
    int _1208 = _1198;
    float _1210 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1192);
    float _1212 = fma(_1196, _1068, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1214 = _1144;
    float _1216 = _1142;
    float _1218 = _1146;
    if (!_928)
    {
        float _1220 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1144);
        _1214 = _1220;
    }
    float _1222 = _1214;
    if (!_928)
    {
        float _1224 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1142);
        _1216 = _1224;
    }
    float _1226 = _1216;
    float _1228 = _1226;
    if (!_928)
    {
        float _1230 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1218 = _1230;
    }
    float _1232 = _1218;
    bool _1234 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -_1222;
    float _1238 = _940 * _1236;
    float _1240 = _946 * _1222;
    float _1242 = _950 * _1222;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = -_1088;
    float _1248 = fma(_976, _1246, _1212);
    if (!_822)
    {
        _1120 = _1168;
    }
    float _1250 = _1120;
    float _1252 = fma(_948, _1226, _1238);
    float _1254 = fma(_956, _1226, _1240);
    float _1256 = fma(_966, _1226, _1242);
    float _1258 = _1250;
    if (_822)
    {
        float _1260 = _884 ? as_type<float>(_1208) : _1168;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1234)
    {
        _1228 = _1248;
    }
    float _1266 = _1228;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1270 = !_1234;
    float _1272 = _1266;
    if (!_1270)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1278 = _1180 + _1276;
        float _1280 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = rsqrt(_1170);
        float _1284 = _1278 * _1274;
        float _1286 = _1284 * 0.15915493667125701904296875;
        float _1288 = _1286 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = _1286 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = fma(_1290, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1298 = _1282 * _1296;
        float _1300 = fma(_1136, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1302 = _1294 + (-1.0);
        float _1304 = fma(_1140, _1298, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1308 = _1300 + _1306;
        float _1310 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1314 = _1304 + _1312;
        float _1316 = _1308 * _1308;
        float _1318 = fma(_1248, _1294, _1310);
        float _1320 = _1314 * _1314;
        _1272 = _1318;
        _1158 = _1316;
        _1160 = _1320;
        _1122 = _1304;
        _1124 = _1300;
    }
    float _1322 = _1272;
    float _1324 = _1158;
    float _1326 = _1160;
    float _1328 = _1122;
    float _1330 = _1124;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1334 = _1322 + _1332;
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1338 = fma(_970, _1232, _1254);
    float _1340 = fma(_958, _1232, _1256);
    float _1342 = fma(_1334, _1334, _1324);
    float _1344 = fma(_952, _1232, _1252);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1348 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1350 = _1342 + _1326;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1356 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1346);
    float _1358 = _1348 * _1268;
    float _1360 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = sqrt(_1350);
    float _1364 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1352);
    float _1370 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1354);
    float _1372 = _1360 * _1264;
    float _1374 = _1364 * _1244;
    float _1376 = _1366 * _1336;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1380 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1384 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1386 = fma(_1340, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    out.m_53.w = _1378;
    bool _1388 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1390 = isnan(_1362);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1396 = _1392 || _1394;
    out.m_55.x = _1374;
    out.m_55.y = _1372;
    out.m_55.z = _1376;
    out.m_55.w = _1358;
    out.m_57.w = _1380;
    out.m_59.x = _988;
    float _1398 = _1364;
    if (!_1396)
    {
        _1398 = 1.0;
    }
    float _1400 = _1398;
    out.m_61.x = _1382;
    out.m_61.y = _1384;
    out.m_61.z = _1386;
    bool _1402 = !_1396;
    float _1404 = _1400;
    if (!_1402)
    {
        bool _1406 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1408 = isnan(_1362);
        bool _1410 = _1406 || _1408;
        bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1414 = _1410 || _1412;
        if (!_1414)
        {
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = _1362 + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1428 = 1.0 / _1422;
            float _1430 = _1418 * _1428;
            float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1404 = _1432;
            _1434 = true;
        }
        else
        {
            bool _1436 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1438 = isnan(_1362);
            bool _1440 = _1436 || _1438;
            bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1444 = _1440 || _1442;
            if (!_1444)
            {
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1362 + _1446;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1458 = 1.0 / _1452;
                float _1460 = _1448 * _1458;
                float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1404 = _1462;
                _1434 = true;
            }
            else
            {
                _1404 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1434 = false;
    float _1464 = _1404;
    float _1466 = -_706;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _1470 = -_710;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _1474 = -_748;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1322 + _1490;
    float _1494 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1478);
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1328 + _1496;
    float _1500 = fma(_1492, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1504 = _1330 + _1502;
    float _1506 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1494);
    float _1508 = fma(_1498, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -_706;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1500);
    float _1524 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1526 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1528 = -_748;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1508);
    float _1532 = fma(_1504, _1464, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1534 = 1.0 / _1524;
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1526);
    float _1538 = -_710;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1542 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1536);
    float _1544 = _1536;
    float _1546 = _1542;
    float _1548 = _1540;
    if (_1488)
    {
        _1544 = _1522;
    }
    float _1550 = _1544;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = _1550;
    if (_1488)
    {
        _1546 = _1530;
    }
    float _1556 = _1546;
    float _1558 = _1556;
    if (!_1488)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1468 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1472 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_600;
        float _1572 = _1570 + _1508;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1476 + _1576;
        float _1580 = -_618;
        float _1582 = _1580 + _1532;
        float _1584 = fma(_1566, _1566, _1574);
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1588 = fma(_1578, _1578, _1584);
        float _1590 = sqrt(_1588);
        float _1592 = 1.0 / _892;
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1596 = precise::min(_1590, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1592;
        float _1602 = -_528;
        float _1604 = _1602 + _1500;
        float _1606 = _1594 * _1600;
        float _1608 = _1572 * _1600;
        float _1610 = fma(_1582, _1606, _1472);
        float _1612 = fma(_1604, _1606, _1468);
        float _1614 = fma(_1594, _1608, _1476);
        _1554 = _1612;
        _1548 = _1610;
        _1558 = _1614;
    }
    float _1616 = _1554;
    float _1618 = _1548;
    float _1620 = _1558;
    float _1622 = _1552 + _1524;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1628 = _1622 * _1534;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1624);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1626);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1646 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1650 = 1.0 / _1640;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1656 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1642);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1664);
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1666);
    float _1674 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1656);
    float _1676 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = _1650 * _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1660);
    float _1684 = _1660;
    float _1686 = _1654;
    if (_1518)
    {
        _1684 = 1.0;
    }
    float _1688 = _1684;
    float _1690 = _1688;
    if (_1518)
    {
        _1686 = 1.0;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1518)
    {
        float _1696 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1706 = _1704 * 0.15915493667125701904296875;
        float _1708 = _1698 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = 1.0 / _1702;
        float _1714 = _1706 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        float _1718 = _1710 * _1712;
        float _1720 = _1706 * 6.283185482025146484375;
        float _1722 = sin(_1720);
        float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1726 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1724;
        float _1728 = _1716 * _1718;
        float _1730 = 1.0 / _1726;
        float _1732 = 1.0 / _1728;
        float _1734 = _1722 * _1732;
        float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1738 = fma(_1680, _1734, _1736);
        float _1740 = _1738 * _1730;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        _1690 = _1742;
    }
    float _1744 = _1690;
    if (!_1518)
    {
        float _1746 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1748 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = 1.0 / _1752;
        float _1764 = _1756 * 6.283185482025146484375;
        float _1766 = cos(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = _1756 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = 1.0 / _1774;
        float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1780 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1778;
        float _1782 = 1.0 / _1780;
        float _1784 = _1772 * _1776;
        float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1788 = fma(_1680, _1784, _1786);
        float _1790 = _1788 * _1782;
        float _1792 = precise::clamp(_1790, 0.0, 1.0);
        float _1794 = -_1792;
        float _1796 = _1794 + 1.0;
        _1694 = _1796;
    }
    float _1798 = _1694;
    float _1800 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1802 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1804 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1806 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1672);
    bool _1808 = _1744 > 0.0;
    bool _1810 = isnan(_1744);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    float _1818 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1820 = _1744 * _1798;
    float _1822 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1824 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1804);
    float _1826 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1806);
    bool _1828 = _1798 <= 0.0;
    bool _1830 = !_1816;
    bool _1832 = _1828 || _1830;
    float _1834 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1836 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1822 + _1826;
    float _1840 = _1824 + _1826;
    float _1842 = _1826 * 0.5;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1618 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1616 + _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1620 + _1852;
    float _1856 = _1838 * 0.5;
    float _1858 = _1840 * 0.5;
    float _1860 = fma(_1834, -0.5, _1842);
    float _1862 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1618;
    out.m_63.y = _1616;
    out.m_63.z = _1620;
    out.m_65.x = _1846;
    out.m_65.y = _1850;
    out.m_65.z = _1854;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1834;
    out.gl_Position.z = _1824;
    out.gl_Position.w = _1826;
    out.m_67.x = _1856;
    out.m_67.y = _1860;
    out.m_67.z = _1858;
    out.m_67.w = _1826;
    out.m_35.x = _1862;
    if (!_1832)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1864;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

