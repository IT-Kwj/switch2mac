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
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_37 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _963 = as_type<float>(_82);
        out.gl_Position.z = _963;
    }
    if (!_70)
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
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1032 = as_type<float>(_120);
        out.gl_Position.z = _1032;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = in.m_35.x;
    float _162 = in.m_35.y;
    float _164 = in.m_35.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _166;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = in.m_37.x;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    float _180 = 1.0 / _168;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _184 = _182 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _186 = in.m_37.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _198 = _196 != 0;
    float _200 = 1.0 / _178;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _202;
    float _206 = _158 * 2.0;
    float _208 = _158 + _154;
    float _210 = 1.0 / _184;
    float _212 = _156 + _154;
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _220 = _156 + _158;
    float _222 = _158 + (-0.5);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _152 + _224;
    float _228 = floor(_206);
    float _230 = _154 * 2.0;
    out.m_39.x = _174;
    float _232 = _226 * _200;
    float _234 = _156 + (-0.5);
    float _236 = _220 + (-1.0);
    out.m_39.y = _186;
    float _238 = _212 + (-1.0);
    float _240 = 1.0 / _172;
    float _242 = _208 + (-1.0);
    float _244 = _156 * 2.0;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _152 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _256;
    bool _260 = _228 > 0.0;
    float _262 = _154 + (-0.5);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _152 + _264;
    bool _268 = _228 >= 0.0;
    bool _270 = isnan(_228);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = floor(_230);
    float _280 = _254 * _210;
    float _282 = _266 * _180;
    int _284 = _276 ? 0 : 1;
    float _286 = _248 * _240;
    float _288 = fma(_204, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _290 = ~_284;
    int _292 = _290 + 1;
    int _294 = _292 + 1;
    float _296 = floor(_244);
    int _298 = _294;
    if (!_260)
    {
        int _300 = ~_284;
        int _302 = _300 + 1;
        _298 = _302;
    }
    int _304 = _298;
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _308 = fma(_258, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _314 = !_190;
    int _316 = _314 ? 0 : 1;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    bool _322 = _278 > 0.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    bool _328 = _278 >= 0.0;
    bool _330 = isnan(_278);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = fma(_326, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _296 >= 0.0;
    bool _348 = isnan(_296);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = fma(_312, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _296 > 0.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    int _368 = _354 ? 0 : 1;
    float _370 = fma(_360, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _320 * _100;
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = fma(_366, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = exp2(_372);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = fma(_340, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _402 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_394, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_398, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _416 = abs(_316);
    float _418 = 1.0 / _386;
    float _420 = in.m_41.x;
    float _422 = in.m_41.y;
    float _424 = in.m_41.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _438 = !_198;
    int _440 = _438 ? 0 : 1;
    float _442 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = float(_304);
    float _446 = -_390;
    float _448 = _446 + 1.0;
    float _450 = float(_416);
    float _452 = fma(_432, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_436, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _456 = abs(_440);
    float _458 = _410 ? _448 : 0.0;
    int _460 = ~_368;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = _464;
    if (!_362)
    {
        int _468 = ~_368;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    if (_382)
    {
        float _474 = _458 * _418;
        _104 = _474;
    }
    float _476 = _104;
    int _478 = _336 ? 0 : 1;
    float _480 = _450 * _444;
    bool _482 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_152);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    int _494 = ~_478;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = float(_456);
    float _502 = float(_472);
    int _504 = _498;
    if (!_322)
    {
        int _506 = ~_478;
        int _508 = _506 + 1;
        _504 = _508;
    }
    int _510 = _504;
    float _512 = _480 * (-2.0);
    bool _514 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _516 = isnan(_152);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_492;
    float _528 = _526 + 1.0;
    float _530 = _500 * _502;
    bool _532 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_152);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_512, _420, _420);
    float _546 = _524 * _528;
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = fma(_344, _512, _344);
    bool _554 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _556 = isnan(_152);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _544);
    float _568 = _542 * _550;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = _530 * (-2.0);
    bool _576 = !_194;
    int _578 = _576 ? 0 : 1;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    bool _584 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _586 = isnan(_152);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = _564 * _572;
    float _598 = fma(_574, _424, _424);
    int _600 = abs(_578);
    float _602 = fma(_552, _476, _566);
    float _604 = fma(_250, _574, _250);
    float _606 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[196].z, _598);
    float _608 = _594 * _582;
    float _610 = float(_600);
    float _612 = -_594;
    float _614 = _612 + 1.0;
    float _616 = float(_510);
    float _618 = _288 * _608;
    float _620 = _342 * _608;
    float _622 = fma(_604, _476, _606);
    float _624 = _370 * _608;
    float _626 = _610 * _616;
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _630 = in.m_26.x;
    float _632 = in.m_26.y;
    float _634 = in.m_26.z;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _638 = _626 * (-2.0);
    float _640 = fma(_356, _596, _628);
    float _642 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _644 = fma(_400, _596, _636);
    float _646 = fma(_638, _422, _422);
    float _648 = fma(_306, _638, _306);
    float _650 = in.m_43.x;
    float _652 = in.m_43.y;
    float _654 = in.m_43.z;
    float _656 = _602 * 0.15915493667125701904296875;
    float _658 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _646);
    float _660 = _622 * 0.15915493667125701904296875;
    float _662 = fma(_412, _568, _640);
    float _664 = fma(_414, _596, _642);
    float _666 = fma(_648, _476, _658);
    float _668 = fma(_308, _568, _644);
    float _670 = _656 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = fma(_442, _546, _662);
    float _676 = _666 * 0.15915493667125701904296875;
    float _678 = fma(_388, _568, _664);
    float _680 = fma(_452, _546, _668);
    float _682 = in.m_37.w;
    float _684 = fma(_454, _546, _678);
    float _686 = _656 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _692 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _694 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _674);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _690);
    float _700 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _680);
    float _710 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _684);
    float _712 = _696 * _650;
    float _714 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _698);
    float _716 = _708 * _652;
    float _718 = _710 * _654;
    float _720 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = _660 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _728 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _700);
    float _730 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _732 = _720 * _214;
    float _734 = _726 * _216;
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = _676 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _672 * _706;
    float _746 = _688 * _706;
    float _748 = _736 * _218;
    float _750 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_39.w = _682;
    float _754 = _676 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _688 * _724;
    float _760 = _672 * _724;
    float _762 = fma(_742, _744, _758);
    float _764 = -_746;
    float _766 = fma(_742, _760, _764);
    float _768 = -_760;
    float _770 = fma(_742, _746, _768);
    float _772 = fma(_742, _758, _744);
    float _774 = _762 * _734;
    float _776 = _766 * _734;
    float _778 = _756 * _732;
    float _780 = _742 * _732;
    float _782 = _672 * _756;
    float _784 = _688 * _756;
    float _786 = fma(_706, _778, _774);
    float _788 = fma(_724, _778, _776);
    float _790 = -_780;
    float _792 = fma(_782, _734, _790);
    float _794 = in.m_37.z;
    float _796 = fma(_770, _748, _786);
    float _798 = fma(_772, _748, _788);
    float _800 = fma(_784, _748, _792);
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _804 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _802);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _806);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _808);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _812);
    float _820 = _738 + _814;
    float _822 = _750 + _816;
    float _824 = _752 + _818;
    float _826 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _830 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _832 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _828);
    float _838 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _830);
    float _840 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _832);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _834);
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _836);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _840);
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _852 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_39.z = _794;
    float _856 = _850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = _850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = _850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _864);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _874);
    float _884 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _878);
    float _886 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _892 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _882 + _892;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _900 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _902;
    out.m_45.y = _898;
    out.m_45.z = _904;
    out.m_45.w = _888;
    out.gl_Position.x = _886;
    out.gl_Position.y = _880;
    out.gl_Position.z = _882;
    out.gl_Position.w = _892;
    out.m_47.z = _906;
    out.m_47.w = _892;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _963 = as_type<float>(_82);
        out.gl_Position.z = _963;
    }
    if (!_70)
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
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1032 = as_type<float>(_120);
        out.gl_Position.z = _1032;
    }
    if (_114)
    {
        return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = in.m_35.x;
    float _162 = in.m_35.y;
    float _164 = in.m_35.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _166;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = in.m_37.x;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    float _180 = 1.0 / _168;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _184 = _182 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _186 = in.m_37.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _198 = _196 != 0;
    float _200 = 1.0 / _178;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _202;
    float _206 = _158 * 2.0;
    float _208 = _158 + _154;
    float _210 = 1.0 / _184;
    float _212 = _156 + _154;
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _220 = _156 + _158;
    float _222 = _158 + (-0.5);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _152 + _224;
    float _228 = floor(_206);
    float _230 = _154 * 2.0;
    out.m_39.x = _174;
    float _232 = _226 * _200;
    float _234 = _156 + (-0.5);
    float _236 = _220 + (-1.0);
    out.m_39.y = _186;
    float _238 = _212 + (-1.0);
    float _240 = 1.0 / _172;
    float _242 = _208 + (-1.0);
    float _244 = _156 * 2.0;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _152 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _256;
    bool _260 = _228 > 0.0;
    float _262 = _154 + (-0.5);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _152 + _264;
    bool _268 = _228 >= 0.0;
    bool _270 = isnan(_228);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = floor(_230);
    float _280 = _254 * _210;
    float _282 = _266 * _180;
    int _284 = _276 ? 0 : 1;
    float _286 = _248 * _240;
    float _288 = fma(_204, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _290 = ~_284;
    int _292 = _290 + 1;
    int _294 = _292 + 1;
    float _296 = floor(_244);
    int _298 = _294;
    if (!_260)
    {
        int _300 = ~_284;
        int _302 = _300 + 1;
        _298 = _302;
    }
    int _304 = _298;
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _308 = fma(_258, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _314 = !_190;
    int _316 = _314 ? 0 : 1;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    bool _322 = _278 > 0.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    bool _328 = _278 >= 0.0;
    bool _330 = isnan(_278);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = fma(_326, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _296 >= 0.0;
    bool _348 = isnan(_296);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = fma(_312, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _296 > 0.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    int _368 = _354 ? 0 : 1;
    float _370 = fma(_360, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _320 * _100;
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = fma(_366, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = exp2(_372);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = fma(_340, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _402 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_394, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_398, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _416 = abs(_316);
    float _418 = 1.0 / _386;
    float _420 = in.m_41.x;
    float _422 = in.m_41.y;
    float _424 = in.m_41.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _438 = !_198;
    int _440 = _438 ? 0 : 1;
    float _442 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = float(_304);
    float _446 = -_390;
    float _448 = _446 + 1.0;
    float _450 = float(_416);
    float _452 = fma(_432, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_436, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _456 = abs(_440);
    float _458 = _410 ? _448 : 0.0;
    int _460 = ~_368;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = _464;
    if (!_362)
    {
        int _468 = ~_368;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    if (_382)
    {
        float _474 = _458 * _418;
        _104 = _474;
    }
    float _476 = _104;
    int _478 = _336 ? 0 : 1;
    float _480 = _450 * _444;
    bool _482 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_152);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    int _494 = ~_478;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = float(_456);
    float _502 = float(_472);
    int _504 = _498;
    if (!_322)
    {
        int _506 = ~_478;
        int _508 = _506 + 1;
        _504 = _508;
    }
    int _510 = _504;
    float _512 = _480 * (-2.0);
    bool _514 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _516 = isnan(_152);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_492;
    float _528 = _526 + 1.0;
    float _530 = _500 * _502;
    bool _532 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_152);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_512, _420, _420);
    float _546 = _524 * _528;
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = fma(_344, _512, _344);
    bool _554 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _556 = isnan(_152);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _544);
    float _568 = _542 * _550;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = _530 * (-2.0);
    bool _576 = !_194;
    int _578 = _576 ? 0 : 1;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    bool _584 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _586 = isnan(_152);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = _564 * _572;
    float _598 = fma(_574, _424, _424);
    int _600 = abs(_578);
    float _602 = fma(_552, _476, _566);
    float _604 = fma(_250, _574, _250);
    float _606 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[196].z, _598);
    float _608 = _594 * _582;
    float _610 = float(_600);
    float _612 = -_594;
    float _614 = _612 + 1.0;
    float _616 = float(_510);
    float _618 = _288 * _608;
    float _620 = _342 * _608;
    float _622 = fma(_604, _476, _606);
    float _624 = _370 * _608;
    float _626 = _610 * _616;
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _630 = in.m_26.x;
    float _632 = in.m_26.y;
    float _634 = in.m_26.z;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _638 = _626 * (-2.0);
    float _640 = fma(_356, _596, _628);
    float _642 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _644 = fma(_400, _596, _636);
    float _646 = fma(_638, _422, _422);
    float _648 = fma(_306, _638, _306);
    float _650 = in.m_43.x;
    float _652 = in.m_43.y;
    float _654 = in.m_43.z;
    float _656 = _602 * 0.15915493667125701904296875;
    float _658 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _646);
    float _660 = _622 * 0.15915493667125701904296875;
    float _662 = fma(_412, _568, _640);
    float _664 = fma(_414, _596, _642);
    float _666 = fma(_648, _476, _658);
    float _668 = fma(_308, _568, _644);
    float _670 = _656 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = fma(_442, _546, _662);
    float _676 = _666 * 0.15915493667125701904296875;
    float _678 = fma(_388, _568, _664);
    float _680 = fma(_452, _546, _668);
    float _682 = in.m_37.w;
    float _684 = fma(_454, _546, _678);
    float _686 = _656 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _692 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _694 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _674);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _690);
    float _700 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _680);
    float _710 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _684);
    float _712 = _696 * _650;
    float _714 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _698);
    float _716 = _708 * _652;
    float _718 = _710 * _654;
    float _720 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = _660 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _728 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _700);
    float _730 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _732 = _720 * _214;
    float _734 = _726 * _216;
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = _676 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _672 * _706;
    float _746 = _688 * _706;
    float _748 = _736 * _218;
    float _750 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_39.w = _682;
    float _754 = _676 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _688 * _724;
    float _760 = _672 * _724;
    float _762 = fma(_742, _744, _758);
    float _764 = -_746;
    float _766 = fma(_742, _760, _764);
    float _768 = -_760;
    float _770 = fma(_742, _746, _768);
    float _772 = fma(_742, _758, _744);
    float _774 = _762 * _734;
    float _776 = _766 * _734;
    float _778 = _756 * _732;
    float _780 = _742 * _732;
    float _782 = _672 * _756;
    float _784 = _688 * _756;
    float _786 = fma(_706, _778, _774);
    float _788 = fma(_724, _778, _776);
    float _790 = -_780;
    float _792 = fma(_782, _734, _790);
    float _794 = in.m_37.z;
    float _796 = fma(_770, _748, _786);
    float _798 = fma(_772, _748, _788);
    float _800 = fma(_784, _748, _792);
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _804 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _802);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _806);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _808);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _812);
    float _820 = _738 + _814;
    float _822 = _750 + _816;
    float _824 = _752 + _818;
    float _826 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _830 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _832 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _828);
    float _838 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _830);
    float _840 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _832);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _834);
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _836);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _840);
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _852 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_39.z = _794;
    float _856 = _850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = _850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = _850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _864);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _874);
    float _884 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _878);
    float _886 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _892 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _882 + _892;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _900 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _902;
    out.m_45.y = _898;
    out.m_45.z = _904;
    out.m_45.w = _888;
    out.gl_Position.x = _886;
    out.gl_Position.y = _880;
    out.gl_Position.z = _882;
    out.gl_Position.w = _892;
    out.m_47.z = _906;
    out.m_47.w = _892;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _963 = as_type<float>(_82);
        out.gl_Position.z = _963;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1032 = as_type<float>(_120);
        out.gl_Position.z = _1032;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_33.x;
    float _156 = in.m_33.y;
    float _158 = in.m_33.z;
    float _160 = in.m_35.x;
    float _162 = in.m_35.y;
    float _164 = in.m_35.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _166;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _174 = in.m_37.x;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _176;
    float _180 = 1.0 / _168;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _184 = _182 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _186 = in.m_37.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _198 = _196 != 0;
    float _200 = 1.0 / _178;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _202;
    float _206 = _158 * 2.0;
    float _208 = _158 + _154;
    float _210 = 1.0 / _184;
    float _212 = _156 + _154;
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _220 = _156 + _158;
    float _222 = _158 + (-0.5);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _152 + _224;
    float _228 = floor(_206);
    float _230 = _154 * 2.0;
    out.m_39.x = _174;
    float _232 = _226 * _200;
    float _234 = _156 + (-0.5);
    float _236 = _220 + (-1.0);
    out.m_39.y = _186;
    float _238 = _212 + (-1.0);
    float _240 = 1.0 / _172;
    float _242 = _208 + (-1.0);
    float _244 = _156 * 2.0;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _254 = _152 + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _256;
    bool _260 = _228 > 0.0;
    float _262 = _154 + (-0.5);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _152 + _264;
    bool _268 = _228 >= 0.0;
    bool _270 = isnan(_228);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = floor(_230);
    float _280 = _254 * _210;
    float _282 = _266 * _180;
    int _284 = _276 ? 0 : 1;
    float _286 = _248 * _240;
    float _288 = fma(_204, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _290 = ~_284;
    int _292 = _290 + 1;
    int _294 = _292 + 1;
    float _296 = floor(_244);
    int _298 = _294;
    if (!_260)
    {
        int _300 = ~_284;
        int _302 = _300 + 1;
        _298 = _302;
    }
    int _304 = _298;
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _308 = fma(_258, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _314 = !_190;
    int _316 = _314 ? 0 : 1;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    bool _322 = _278 > 0.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    bool _328 = _278 >= 0.0;
    bool _330 = isnan(_278);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = fma(_326, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _346 = _296 >= 0.0;
    bool _348 = isnan(_296);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = fma(_312, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    bool _362 = _296 > 0.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    int _368 = _354 ? 0 : 1;
    float _370 = fma(_360, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _320 * _100;
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = fma(_366, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _390 = exp2(_372);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = fma(_340, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _402 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_394, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_398, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _416 = abs(_316);
    float _418 = 1.0 / _386;
    float _420 = in.m_41.x;
    float _422 = in.m_41.y;
    float _424 = in.m_41.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _438 = !_198;
    int _440 = _438 ? 0 : 1;
    float _442 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _444 = float(_304);
    float _446 = -_390;
    float _448 = _446 + 1.0;
    float _450 = float(_416);
    float _452 = fma(_432, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_436, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _456 = abs(_440);
    float _458 = _410 ? _448 : 0.0;
    int _460 = ~_368;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    int _466 = _464;
    if (!_362)
    {
        int _468 = ~_368;
        int _470 = _468 + 1;
        _466 = _470;
    }
    int _472 = _466;
    if (_382)
    {
        float _474 = _458 * _418;
        _104 = _474;
    }
    float _476 = _104;
    int _478 = _336 ? 0 : 1;
    float _480 = _450 * _444;
    bool _482 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_152);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    int _494 = ~_478;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = float(_456);
    float _502 = float(_472);
    int _504 = _498;
    if (!_322)
    {
        int _506 = ~_478;
        int _508 = _506 + 1;
        _504 = _508;
    }
    int _510 = _504;
    float _512 = _480 * (-2.0);
    bool _514 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _516 = isnan(_152);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_492;
    float _528 = _526 + 1.0;
    float _530 = _500 * _502;
    bool _532 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_152);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_512, _420, _420);
    float _546 = _524 * _528;
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = fma(_344, _512, _344);
    bool _554 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _556 = isnan(_152);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _544);
    float _568 = _542 * _550;
    float _570 = -_542;
    float _572 = _570 + 1.0;
    float _574 = _530 * (-2.0);
    bool _576 = !_194;
    int _578 = _576 ? 0 : 1;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    bool _584 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _586 = isnan(_152);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = _564 * _572;
    float _598 = fma(_574, _424, _424);
    int _600 = abs(_578);
    float _602 = fma(_552, _476, _566);
    float _604 = fma(_250, _574, _250);
    float _606 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[196].z, _598);
    float _608 = _594 * _582;
    float _610 = float(_600);
    float _612 = -_594;
    float _614 = _612 + 1.0;
    float _616 = float(_510);
    float _618 = _288 * _608;
    float _620 = _342 * _608;
    float _622 = fma(_604, _476, _606);
    float _624 = _370 * _608;
    float _626 = _610 * _616;
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _630 = in.m_26.x;
    float _632 = in.m_26.y;
    float _634 = in.m_26.z;
    float _636 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _638 = _626 * (-2.0);
    float _640 = fma(_356, _596, _628);
    float _642 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _644 = fma(_400, _596, _636);
    float _646 = fma(_638, _422, _422);
    float _648 = fma(_306, _638, _306);
    float _650 = in.m_43.x;
    float _652 = in.m_43.y;
    float _654 = in.m_43.z;
    float _656 = _602 * 0.15915493667125701904296875;
    float _658 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _646);
    float _660 = _622 * 0.15915493667125701904296875;
    float _662 = fma(_412, _568, _640);
    float _664 = fma(_414, _596, _642);
    float _666 = fma(_648, _476, _658);
    float _668 = fma(_308, _568, _644);
    float _670 = _656 * 6.283185482025146484375;
    float _672 = sin(_670);
    float _674 = fma(_442, _546, _662);
    float _676 = _666 * 0.15915493667125701904296875;
    float _678 = fma(_388, _568, _664);
    float _680 = fma(_452, _546, _668);
    float _682 = in.m_37.w;
    float _684 = fma(_454, _546, _678);
    float _686 = _656 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _692 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _694 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _674);
    float _698 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _690);
    float _700 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _680);
    float _710 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _684);
    float _712 = _696 * _650;
    float _714 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _698);
    float _716 = _708 * _652;
    float _718 = _710 * _654;
    float _720 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = _660 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _728 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _700);
    float _730 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _732 = _720 * _214;
    float _734 = _726 * _216;
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = _676 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _672 * _706;
    float _746 = _688 * _706;
    float _748 = _736 * _218;
    float _750 = _714 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_39.w = _682;
    float _754 = _676 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _688 * _724;
    float _760 = _672 * _724;
    float _762 = fma(_742, _744, _758);
    float _764 = -_746;
    float _766 = fma(_742, _760, _764);
    float _768 = -_760;
    float _770 = fma(_742, _746, _768);
    float _772 = fma(_742, _758, _744);
    float _774 = _762 * _734;
    float _776 = _766 * _734;
    float _778 = _756 * _732;
    float _780 = _742 * _732;
    float _782 = _672 * _756;
    float _784 = _688 * _756;
    float _786 = fma(_706, _778, _774);
    float _788 = fma(_724, _778, _776);
    float _790 = -_780;
    float _792 = fma(_782, _734, _790);
    float _794 = in.m_37.z;
    float _796 = fma(_770, _748, _786);
    float _798 = fma(_772, _748, _788);
    float _800 = fma(_784, _748, _792);
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _804 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _802);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _806);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[9].z, _808);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c10)._m0[10].z, _812);
    float _820 = _738 + _814;
    float _822 = _750 + _816;
    float _824 = _752 + _818;
    float _826 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _830 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _832 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _826);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _828);
    float _838 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _830);
    float _840 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _832);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _834);
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _836);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _840);
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _852 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_39.z = _794;
    float _856 = _850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = _850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = _850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _864);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _874);
    float _884 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _878);
    float _886 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _892 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _882 + _892;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = _900 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _902;
    out.m_45.y = _898;
    out.m_45.z = _904;
    out.m_45.w = _888;
    out.gl_Position.x = _886;
    out.gl_Position.y = _880;
    out.gl_Position.z = _882;
    out.gl_Position.w = _892;
    out.m_47.z = _906;
    out.m_47.w = _892;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

