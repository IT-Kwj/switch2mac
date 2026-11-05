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
    float4 m_49 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_39 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_35 [[attribute(7)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1015 = as_type<float>(_84);
        out.gl_Position.z = _1015;
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
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1085 = as_type<float>(_122);
        out.gl_Position.z = _1085;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_33.x;
    float _126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_33.y;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _144 = in.m_33.z;
    float _146 = 0.0;
    float _148 = _128;
    if (!_140)
    {
        float _150 = _128 * _128;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _142 * _126;
    float _158 = _154;
    if (!_140)
    {
        float _160 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    float _164 = _124 * 2.0;
    float _166 = _130 * 2.0;
    float _168 = floor(_164);
    float _170 = _144 * 2.0;
    float _172 = floor(_166);
    float _174 = floor(_170);
    bool _176 = _168 > 0.0;
    bool _178 = _168 >= 0.0;
    bool _180 = isnan(_168);
    bool _182 = _178 || _180;
    bool _184 = isnan(0.0);
    bool _186 = _182 || _184;
    bool _188 = _172 > 0.0;
    bool _190 = _172 >= 0.0;
    bool _192 = isnan(_172);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    int _200 = _186 ? 0 : 1;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _174 > 0.0;
    bool _208 = _174 >= 0.0;
    bool _210 = isnan(_174);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    int _218 = _198 ? 0 : 1;
    int _220 = _216 ? 0 : 1;
    int _222 = ~_200;
    int _224 = _222 + 1;
    int _226 = _224 + 1;
    int _228 = ~_218;
    int _230 = _228 + 1;
    int _232 = _230 + 1;
    int _234 = ~_220;
    int _236 = _234 + 1;
    int _238 = _236 + 1;
    int _240 = _226;
    int _242 = _232;
    int _244 = _238;
    float _246 = _162;
    if (!_176)
    {
        int _248 = ~_200;
        int _250 = _248 + 1;
        _240 = _250;
    }
    int _252 = _240;
    if (!_188)
    {
        int _254 = ~_218;
        int _256 = _254 + 1;
        _242 = _256;
    }
    int _258 = _242;
    if (!_206)
    {
        int _260 = ~_220;
        int _262 = _260 + 1;
        _244 = _262;
    }
    int _264 = _244;
    bool _266 = !_140;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _128 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _128);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = !_140;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _128 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _148 = _320;
    }
    float _322 = _148;
    float _324 = in.m_35.x;
    float _326 = in.m_35.y;
    float _328 = in.m_35.z;
    float _330 = float(_264);
    float _332 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[20].x, _156);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _344 = _342 != 0;
    float _346 = in.m_33.w;
    float _348 = float(_258);
    float _350 = float(_252);
    float _352 = in.m_37.x;
    float _354 = in.m_37.y;
    float _356 = in.m_37.z;
    bool _358 = !_336;
    int _360 = _358 ? 0 : 1;
    bool _362 = !_344;
    int _364 = _362 ? 0 : 1;
    float _366 = in.m_39.x;
    float _368 = in.m_39.y;
    float _370 = in.m_39.z;
    int _372 = abs(_360);
    int _374 = abs(_364);
    float _376 = in.m_41.x;
    float _378 = float(_372);
    float _380 = float(_374);
    bool _382 = !_340;
    int _384 = _382 ? 0 : 1;
    float _386 = _378 * _330;
    float _388 = _380 * _348;
    int _390 = abs(_384);
    float _392 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _394 = log2(_392);
    float _396 = _386 * (-2.0);
    float _398 = _388 * (-2.0);
    float _400 = in.m_41.y;
    float _402 = float(_390);
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = _124 + _130;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = _402 * _350;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _368);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _422 = _420 != 0;
    float _424 = _412 * (-2.0);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = _394 * _102;
    float _434 = _124 + _144;
    bool _436 = _346 > 0.5;
    float _438 = fma(_424, _354, _354);
    float _440 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = _406 + (-1.0);
    float _444 = exp2(_432);
    float _446 = _434 + (-1.0);
    float _448 = _130 + _144;
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _366);
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _448 + (-1.0);
    float _462 = -_400;
    float _464 = _462 + 1.0;
    float _466 = fma(_396, _352, _352);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _470 = 1.0 / _458;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _474 = _436 ? as_type<int>(_464) : as_type<int>(_400);
    float _476 = _332 * 6.283185482025146484375;
    bool _478 = _130 > 0.5;
    float _480 = fma(_398, _356, _356);
    bool _482 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(1.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _476 * 0.15915493667125701904296875;
    float _494 = floor(_332);
    float _496 = _422 ? as_type<float>(_474) : _400;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    bool _506 = _422;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    bool _510 = _478;
    float _512 = _500;
    if (_428)
    {
        float _514 = _478 ? _464 : _400;
        _502 = _514;
    }
    float _516 = _502;
    if (_410)
    {
        float _518 = -_376;
        float _520 = _518 + 1.0;
        _504 = as_type<int>(_520);
    }
    int _522 = _504;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = in.m_31.x;
    float _536 = in.m_31.y;
    float _538 = in.m_31.z;
    if (_410)
    {
        bool _540 = _124 > 0.5;
        _506 = _540;
    }
    bool _542 = _506;
    float _544 = _492 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _532 ? _500 : 0.0;
    int _550 = 0;
    if (_416)
    {
        float _552 = -_376;
        float _554 = _552 + 1.0;
        _550 = as_type<int>(_554);
    }
    int _556 = _550;
    if (!_410)
    {
        _508 = _376;
    }
    float _558 = _508;
    float _560 = fma(_450, _396, _450);
    float _562 = _558;
    if (_410)
    {
        float _564 = _542 ? as_type<float>(_522) : _376;
        _562 = _564;
    }
    float _566 = _562;
    if (_490)
    {
        float _568 = _548 * _470;
        _104 = _568;
    }
    float _570 = _104;
    if (_416)
    {
        bool _572 = _144 > 0.5;
        _510 = _572;
    }
    bool _574 = _510;
    float _576 = -_494;
    float _578 = _332 + _576;
    if (!_416)
    {
        _512 = _376;
    }
    float _580 = _512;
    float _582 = in.m_35.w;
    float _584 = _580;
    if (_416)
    {
        float _586 = _574 ? as_type<float>(_556) : _376;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _124 + (-0.5);
    float _592 = in.m_26.x;
    float _594 = in.m_26.y;
    float _596 = in.m_26.z;
    bool _598 = _578 < 0.5;
    float _600 = float(_598);
    float _602 = fma(_546, 0.5, 0.5);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _466);
    float _606 = -_578;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _610 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _612 = -_602;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _616 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _624 = _622 != 0;
    float _626 = fma(_322, _536, _610);
    float _628 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _630 = fma(_322, _534, _616);
    float _632 = _130 + (-0.5);
    bool _634 = !_620;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_322, _538, _628);
    bool _640 = !_204;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_472, _424, _472);
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _438);
    float _648 = fma(_468, _398, _468);
    int _650 = abs(_642);
    float _652 = fma(_560, _570, _604);
    float _654 = fma(_644, _570, _646);
    float _656 = -_600;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _662 = fma(_630, _582, _592);
    int _664 = abs(_636);
    float _666 = fma(_626, _582, _594);
    float _668 = _144 + (-0.5);
    float _670 = _652 * 0.15915493667125701904296875;
    float _672 = float(_664);
    float _674 = _654 * 0.15915493667125701904296875;
    bool _676 = !_624;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].z, _480);
    float _682 = _670 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = abs(_608);
    float _688 = _672 * _686;
    int _690 = abs(_678);
    float _692 = fma(_648, _570, _680);
    float _694 = float(_650);
    float _696 = fma(_638, _582, _596);
    float _698 = _692 * 0.15915493667125701904296875;
    float _700 = _670 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_694, _614, _688);
    float _706 = float(_690);
    float _708 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = abs(_658);
    float _716 = fma(_706, _714, _704);
    float _718 = _674 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _708);
    float _724 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _726 = _716 * _430;
    float _728 = _716 * _404;
    float _730 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _732 = _716 * _440;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _674 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _744 = _734 * _418;
    float _746 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _748 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].z, _730);
    float _750 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _698 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _740 * _452;
    float _760 = _684 * _720;
    float _762 = _702 * _720;
    float _764 = _750 * _454;
    float _766 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _772 = _698 * 6.283185482025146484375;
    float _774 = sin(_772);
    out.m_29.x = _770;
    float _776 = _756 * _744;
    float _778 = _702 * _738;
    float _780 = _720 * _756;
    float _782 = _702 * _776;
    float _784 = _684 * _738;
    float _786 = _738 * _756;
    float _788 = _684 * _776;
    float _790 = fma(_774, _778, _760);
    float _792 = _774 * _744;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _796 = fma(_790, _758, _782);
    float _798 = -_784;
    float _800 = fma(_774, _762, _798);
    float _802 = -_792;
    float _804 = fma(_786, _758, _802);
    float _806 = -_762;
    float _808 = fma(_774, _784, _806);
    float _810 = fma(_774, _760, _778);
    float _812 = fma(_800, _764, _796);
    float _814 = fma(_780, _764, _804);
    float _816 = fma(_808, _758, _788);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = fma(_810, _764, _816);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _846 = _766 + _840;
    float _848 = _752 + _842;
    float _850 = _768 + _844;
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = _846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _852);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _866 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _878 = _846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_43.x = _866;
    out.m_43.y = _868;
    out.m_43.z = _870;
    out.m_43.w = _864;
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _872);
    float _882 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _878);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _880);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _892);
    float _902 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _886);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _894);
    float _906 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _910 = _660 * _794;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _916 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].x, _908);
    float _918 = _496 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _920 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _900);
    float _922 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _914);
    float _926 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _916);
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _932 = _926 * _898;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _938 = _918 * _912;
    float _940 = _922 * _818;
    float _942 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_47.x = _940;
    out.m_47.y = _932;
    out.m_47.z = _910;
    out.m_47.w = _938;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _950 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _924);
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _920);
    float _956 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _928);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _930);
    out.m_49.x = _946;
    out.m_49.y = _950;
    out.m_49.z = _942;
    out.gl_Position.x = _954;
    out.gl_Position.y = _952;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1015 = as_type<float>(_84);
        out.gl_Position.z = _1015;
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
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1085 = as_type<float>(_122);
        out.gl_Position.z = _1085;
    }
    if (_114)
    {
        return out;
    }
    float _124 = in.m_33.x;
    float _126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_33.y;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _144 = in.m_33.z;
    float _146 = 0.0;
    float _148 = _128;
    if (!_140)
    {
        float _150 = _128 * _128;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _142 * _126;
    float _158 = _154;
    if (!_140)
    {
        float _160 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    float _164 = _124 * 2.0;
    float _166 = _130 * 2.0;
    float _168 = floor(_164);
    float _170 = _144 * 2.0;
    float _172 = floor(_166);
    float _174 = floor(_170);
    bool _176 = _168 > 0.0;
    bool _178 = _168 >= 0.0;
    bool _180 = isnan(_168);
    bool _182 = _178 || _180;
    bool _184 = isnan(0.0);
    bool _186 = _182 || _184;
    bool _188 = _172 > 0.0;
    bool _190 = _172 >= 0.0;
    bool _192 = isnan(_172);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    int _200 = _186 ? 0 : 1;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _174 > 0.0;
    bool _208 = _174 >= 0.0;
    bool _210 = isnan(_174);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    int _218 = _198 ? 0 : 1;
    int _220 = _216 ? 0 : 1;
    int _222 = ~_200;
    int _224 = _222 + 1;
    int _226 = _224 + 1;
    int _228 = ~_218;
    int _230 = _228 + 1;
    int _232 = _230 + 1;
    int _234 = ~_220;
    int _236 = _234 + 1;
    int _238 = _236 + 1;
    int _240 = _226;
    int _242 = _232;
    int _244 = _238;
    float _246 = _162;
    if (!_176)
    {
        int _248 = ~_200;
        int _250 = _248 + 1;
        _240 = _250;
    }
    int _252 = _240;
    if (!_188)
    {
        int _254 = ~_218;
        int _256 = _254 + 1;
        _242 = _256;
    }
    int _258 = _242;
    if (!_206)
    {
        int _260 = ~_220;
        int _262 = _260 + 1;
        _244 = _262;
    }
    int _264 = _244;
    bool _266 = !_140;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _128 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _128);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = !_140;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _128 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _148 = _320;
    }
    float _322 = _148;
    float _324 = in.m_35.x;
    float _326 = in.m_35.y;
    float _328 = in.m_35.z;
    float _330 = float(_264);
    float _332 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[20].x, _156);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _344 = _342 != 0;
    float _346 = in.m_33.w;
    float _348 = float(_258);
    float _350 = float(_252);
    float _352 = in.m_37.x;
    float _354 = in.m_37.y;
    float _356 = in.m_37.z;
    bool _358 = !_336;
    int _360 = _358 ? 0 : 1;
    bool _362 = !_344;
    int _364 = _362 ? 0 : 1;
    float _366 = in.m_39.x;
    float _368 = in.m_39.y;
    float _370 = in.m_39.z;
    int _372 = abs(_360);
    int _374 = abs(_364);
    float _376 = in.m_41.x;
    float _378 = float(_372);
    float _380 = float(_374);
    bool _382 = !_340;
    int _384 = _382 ? 0 : 1;
    float _386 = _378 * _330;
    float _388 = _380 * _348;
    int _390 = abs(_384);
    float _392 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _394 = log2(_392);
    float _396 = _386 * (-2.0);
    float _398 = _388 * (-2.0);
    float _400 = in.m_41.y;
    float _402 = float(_390);
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = _124 + _130;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = _402 * _350;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _368);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _422 = _420 != 0;
    float _424 = _412 * (-2.0);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = _394 * _102;
    float _434 = _124 + _144;
    bool _436 = _346 > 0.5;
    float _438 = fma(_424, _354, _354);
    float _440 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = _406 + (-1.0);
    float _444 = exp2(_432);
    float _446 = _434 + (-1.0);
    float _448 = _130 + _144;
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _366);
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _448 + (-1.0);
    float _462 = -_400;
    float _464 = _462 + 1.0;
    float _466 = fma(_396, _352, _352);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _470 = 1.0 / _458;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _474 = _436 ? as_type<int>(_464) : as_type<int>(_400);
    float _476 = _332 * 6.283185482025146484375;
    bool _478 = _130 > 0.5;
    float _480 = fma(_398, _356, _356);
    bool _482 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(1.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _476 * 0.15915493667125701904296875;
    float _494 = floor(_332);
    float _496 = _422 ? as_type<float>(_474) : _400;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    bool _506 = _422;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    bool _510 = _478;
    float _512 = _500;
    if (_428)
    {
        float _514 = _478 ? _464 : _400;
        _502 = _514;
    }
    float _516 = _502;
    if (_410)
    {
        float _518 = -_376;
        float _520 = _518 + 1.0;
        _504 = as_type<int>(_520);
    }
    int _522 = _504;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = in.m_31.x;
    float _536 = in.m_31.y;
    float _538 = in.m_31.z;
    if (_410)
    {
        bool _540 = _124 > 0.5;
        _506 = _540;
    }
    bool _542 = _506;
    float _544 = _492 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _532 ? _500 : 0.0;
    int _550 = 0;
    if (_416)
    {
        float _552 = -_376;
        float _554 = _552 + 1.0;
        _550 = as_type<int>(_554);
    }
    int _556 = _550;
    if (!_410)
    {
        _508 = _376;
    }
    float _558 = _508;
    float _560 = fma(_450, _396, _450);
    float _562 = _558;
    if (_410)
    {
        float _564 = _542 ? as_type<float>(_522) : _376;
        _562 = _564;
    }
    float _566 = _562;
    if (_490)
    {
        float _568 = _548 * _470;
        _104 = _568;
    }
    float _570 = _104;
    if (_416)
    {
        bool _572 = _144 > 0.5;
        _510 = _572;
    }
    bool _574 = _510;
    float _576 = -_494;
    float _578 = _332 + _576;
    if (!_416)
    {
        _512 = _376;
    }
    float _580 = _512;
    float _582 = in.m_35.w;
    float _584 = _580;
    if (_416)
    {
        float _586 = _574 ? as_type<float>(_556) : _376;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _124 + (-0.5);
    float _592 = in.m_26.x;
    float _594 = in.m_26.y;
    float _596 = in.m_26.z;
    bool _598 = _578 < 0.5;
    float _600 = float(_598);
    float _602 = fma(_546, 0.5, 0.5);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _466);
    float _606 = -_578;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _610 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _612 = -_602;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _616 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _624 = _622 != 0;
    float _626 = fma(_322, _536, _610);
    float _628 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _630 = fma(_322, _534, _616);
    float _632 = _130 + (-0.5);
    bool _634 = !_620;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_322, _538, _628);
    bool _640 = !_204;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_472, _424, _472);
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _438);
    float _648 = fma(_468, _398, _468);
    int _650 = abs(_642);
    float _652 = fma(_560, _570, _604);
    float _654 = fma(_644, _570, _646);
    float _656 = -_600;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _662 = fma(_630, _582, _592);
    int _664 = abs(_636);
    float _666 = fma(_626, _582, _594);
    float _668 = _144 + (-0.5);
    float _670 = _652 * 0.15915493667125701904296875;
    float _672 = float(_664);
    float _674 = _654 * 0.15915493667125701904296875;
    bool _676 = !_624;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].z, _480);
    float _682 = _670 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = abs(_608);
    float _688 = _672 * _686;
    int _690 = abs(_678);
    float _692 = fma(_648, _570, _680);
    float _694 = float(_650);
    float _696 = fma(_638, _582, _596);
    float _698 = _692 * 0.15915493667125701904296875;
    float _700 = _670 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_694, _614, _688);
    float _706 = float(_690);
    float _708 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = abs(_658);
    float _716 = fma(_706, _714, _704);
    float _718 = _674 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _708);
    float _724 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _726 = _716 * _430;
    float _728 = _716 * _404;
    float _730 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _732 = _716 * _440;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _674 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _744 = _734 * _418;
    float _746 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _748 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].z, _730);
    float _750 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _698 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _740 * _452;
    float _760 = _684 * _720;
    float _762 = _702 * _720;
    float _764 = _750 * _454;
    float _766 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _772 = _698 * 6.283185482025146484375;
    float _774 = sin(_772);
    out.m_29.x = _770;
    float _776 = _756 * _744;
    float _778 = _702 * _738;
    float _780 = _720 * _756;
    float _782 = _702 * _776;
    float _784 = _684 * _738;
    float _786 = _738 * _756;
    float _788 = _684 * _776;
    float _790 = fma(_774, _778, _760);
    float _792 = _774 * _744;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _796 = fma(_790, _758, _782);
    float _798 = -_784;
    float _800 = fma(_774, _762, _798);
    float _802 = -_792;
    float _804 = fma(_786, _758, _802);
    float _806 = -_762;
    float _808 = fma(_774, _784, _806);
    float _810 = fma(_774, _760, _778);
    float _812 = fma(_800, _764, _796);
    float _814 = fma(_780, _764, _804);
    float _816 = fma(_808, _758, _788);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = fma(_810, _764, _816);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _846 = _766 + _840;
    float _848 = _752 + _842;
    float _850 = _768 + _844;
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = _846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _852);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _866 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _878 = _846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_43.x = _866;
    out.m_43.y = _868;
    out.m_43.z = _870;
    out.m_43.w = _864;
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _872);
    float _882 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _878);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _880);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _892);
    float _902 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _886);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _894);
    float _906 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _910 = _660 * _794;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _916 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].x, _908);
    float _918 = _496 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _920 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _900);
    float _922 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _914);
    float _926 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _916);
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _932 = _926 * _898;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _938 = _918 * _912;
    float _940 = _922 * _818;
    float _942 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_47.x = _940;
    out.m_47.y = _932;
    out.m_47.z = _910;
    out.m_47.w = _938;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _950 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _924);
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _920);
    float _956 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _928);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _930);
    out.m_49.x = _946;
    out.m_49.y = _950;
    out.m_49.z = _942;
    out.gl_Position.x = _954;
    out.gl_Position.y = _952;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1015 = as_type<float>(_84);
        out.gl_Position.z = _1015;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1085 = as_type<float>(_122);
        out.gl_Position.z = _1085;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_33.x;
    float _126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_33.y;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _144 = in.m_33.z;
    float _146 = 0.0;
    float _148 = _128;
    if (!_140)
    {
        float _150 = _128 * _128;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _142 * _126;
    float _158 = _154;
    if (!_140)
    {
        float _160 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    float _164 = _124 * 2.0;
    float _166 = _130 * 2.0;
    float _168 = floor(_164);
    float _170 = _144 * 2.0;
    float _172 = floor(_166);
    float _174 = floor(_170);
    bool _176 = _168 > 0.0;
    bool _178 = _168 >= 0.0;
    bool _180 = isnan(_168);
    bool _182 = _178 || _180;
    bool _184 = isnan(0.0);
    bool _186 = _182 || _184;
    bool _188 = _172 > 0.0;
    bool _190 = _172 >= 0.0;
    bool _192 = isnan(_172);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    int _200 = _186 ? 0 : 1;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _174 > 0.0;
    bool _208 = _174 >= 0.0;
    bool _210 = isnan(_174);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    int _218 = _198 ? 0 : 1;
    int _220 = _216 ? 0 : 1;
    int _222 = ~_200;
    int _224 = _222 + 1;
    int _226 = _224 + 1;
    int _228 = ~_218;
    int _230 = _228 + 1;
    int _232 = _230 + 1;
    int _234 = ~_220;
    int _236 = _234 + 1;
    int _238 = _236 + 1;
    int _240 = _226;
    int _242 = _232;
    int _244 = _238;
    float _246 = _162;
    if (!_176)
    {
        int _248 = ~_200;
        int _250 = _248 + 1;
        _240 = _250;
    }
    int _252 = _240;
    if (!_188)
    {
        int _254 = ~_218;
        int _256 = _254 + 1;
        _242 = _256;
    }
    int _258 = _242;
    if (!_206)
    {
        int _260 = ~_220;
        int _262 = _260 + 1;
        _244 = _262;
    }
    int _264 = _244;
    bool _266 = !_140;
    if (!_266)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _128 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _128);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = !_140;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _128 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _148 = _320;
    }
    float _322 = _148;
    float _324 = in.m_35.x;
    float _326 = in.m_35.y;
    float _328 = in.m_35.z;
    float _330 = float(_264);
    float _332 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[20].x, _156);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _344 = _342 != 0;
    float _346 = in.m_33.w;
    float _348 = float(_258);
    float _350 = float(_252);
    float _352 = in.m_37.x;
    float _354 = in.m_37.y;
    float _356 = in.m_37.z;
    bool _358 = !_336;
    int _360 = _358 ? 0 : 1;
    bool _362 = !_344;
    int _364 = _362 ? 0 : 1;
    float _366 = in.m_39.x;
    float _368 = in.m_39.y;
    float _370 = in.m_39.z;
    int _372 = abs(_360);
    int _374 = abs(_364);
    float _376 = in.m_41.x;
    float _378 = float(_372);
    float _380 = float(_374);
    bool _382 = !_340;
    int _384 = _382 ? 0 : 1;
    float _386 = _378 * _330;
    float _388 = _380 * _348;
    int _390 = abs(_384);
    float _392 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _394 = log2(_392);
    float _396 = _386 * (-2.0);
    float _398 = _388 * (-2.0);
    float _400 = in.m_41.y;
    float _402 = float(_390);
    float _404 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = _124 + _130;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = _402 * _350;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _368);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _422 = _420 != 0;
    float _424 = _412 * (-2.0);
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = _394 * _102;
    float _434 = _124 + _144;
    bool _436 = _346 > 0.5;
    float _438 = fma(_424, _354, _354);
    float _440 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = _406 + (-1.0);
    float _444 = exp2(_432);
    float _446 = _434 + (-1.0);
    float _448 = _130 + _144;
    float _450 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _366);
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _448 + (-1.0);
    float _462 = -_400;
    float _464 = _462 + 1.0;
    float _466 = fma(_396, _352, _352);
    float _468 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _470 = 1.0 / _458;
    float _472 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _474 = _436 ? as_type<int>(_464) : as_type<int>(_400);
    float _476 = _332 * 6.283185482025146484375;
    bool _478 = _130 > 0.5;
    float _480 = fma(_398, _356, _356);
    bool _482 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(1.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _476 * 0.15915493667125701904296875;
    float _494 = floor(_332);
    float _496 = _422 ? as_type<float>(_474) : _400;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    bool _506 = _422;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    bool _510 = _478;
    float _512 = _500;
    if (_428)
    {
        float _514 = _478 ? _464 : _400;
        _502 = _514;
    }
    float _516 = _502;
    if (_410)
    {
        float _518 = -_376;
        float _520 = _518 + 1.0;
        _504 = as_type<int>(_520);
    }
    int _522 = _504;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = in.m_31.x;
    float _536 = in.m_31.y;
    float _538 = in.m_31.z;
    if (_410)
    {
        bool _540 = _124 > 0.5;
        _506 = _540;
    }
    bool _542 = _506;
    float _544 = _492 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _532 ? _500 : 0.0;
    int _550 = 0;
    if (_416)
    {
        float _552 = -_376;
        float _554 = _552 + 1.0;
        _550 = as_type<int>(_554);
    }
    int _556 = _550;
    if (!_410)
    {
        _508 = _376;
    }
    float _558 = _508;
    float _560 = fma(_450, _396, _450);
    float _562 = _558;
    if (_410)
    {
        float _564 = _542 ? as_type<float>(_522) : _376;
        _562 = _564;
    }
    float _566 = _562;
    if (_490)
    {
        float _568 = _548 * _470;
        _104 = _568;
    }
    float _570 = _104;
    if (_416)
    {
        bool _572 = _144 > 0.5;
        _510 = _572;
    }
    bool _574 = _510;
    float _576 = -_494;
    float _578 = _332 + _576;
    if (!_416)
    {
        _512 = _376;
    }
    float _580 = _512;
    float _582 = in.m_35.w;
    float _584 = _580;
    if (_416)
    {
        float _586 = _574 ? as_type<float>(_556) : _376;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _124 + (-0.5);
    float _592 = in.m_26.x;
    float _594 = in.m_26.y;
    float _596 = in.m_26.z;
    bool _598 = _578 < 0.5;
    float _600 = float(_598);
    float _602 = fma(_546, 0.5, 0.5);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _466);
    float _606 = -_578;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _610 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _612 = -_602;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _616 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _624 = _622 != 0;
    float _626 = fma(_322, _536, _610);
    float _628 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _630 = fma(_322, _534, _616);
    float _632 = _130 + (-0.5);
    bool _634 = !_620;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_322, _538, _628);
    bool _640 = !_204;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_472, _424, _472);
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _438);
    float _648 = fma(_468, _398, _468);
    int _650 = abs(_642);
    float _652 = fma(_560, _570, _604);
    float _654 = fma(_644, _570, _646);
    float _656 = -_600;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _662 = fma(_630, _582, _592);
    int _664 = abs(_636);
    float _666 = fma(_626, _582, _594);
    float _668 = _144 + (-0.5);
    float _670 = _652 * 0.15915493667125701904296875;
    float _672 = float(_664);
    float _674 = _654 * 0.15915493667125701904296875;
    bool _676 = !_624;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].z, _480);
    float _682 = _670 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = abs(_608);
    float _688 = _672 * _686;
    int _690 = abs(_678);
    float _692 = fma(_648, _570, _680);
    float _694 = float(_650);
    float _696 = fma(_638, _582, _596);
    float _698 = _692 * 0.15915493667125701904296875;
    float _700 = _670 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_694, _614, _688);
    float _706 = float(_690);
    float _708 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = abs(_658);
    float _716 = fma(_706, _714, _704);
    float _718 = _674 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _708);
    float _724 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _726 = _716 * _430;
    float _728 = _716 * _404;
    float _730 = fma(_662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _732 = _716 * _440;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _674 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _744 = _734 * _418;
    float _746 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[5].z, _724);
    float _748 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[6].z, _730);
    float _750 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _698 * 6.283185482025146484375;
    float _756 = cos(_754);
    float _758 = _740 * _452;
    float _760 = _684 * _720;
    float _762 = _702 * _720;
    float _764 = _750 * _454;
    float _766 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _768 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _772 = _698 * 6.283185482025146484375;
    float _774 = sin(_772);
    out.m_29.x = _770;
    float _776 = _756 * _744;
    float _778 = _702 * _738;
    float _780 = _720 * _756;
    float _782 = _702 * _776;
    float _784 = _684 * _738;
    float _786 = _738 * _756;
    float _788 = _684 * _776;
    float _790 = fma(_774, _778, _760);
    float _792 = _774 * _744;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _796 = fma(_790, _758, _782);
    float _798 = -_784;
    float _800 = fma(_774, _762, _798);
    float _802 = -_792;
    float _804 = fma(_786, _758, _802);
    float _806 = -_762;
    float _808 = fma(_774, _784, _806);
    float _810 = fma(_774, _760, _778);
    float _812 = fma(_800, _764, _796);
    float _814 = fma(_780, _764, _804);
    float _816 = fma(_808, _758, _788);
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _824 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _826 = fma(_810, _764, _816);
    float _828 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _820);
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _822);
    float _832 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _824);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _846 = _766 + _840;
    float _848 = _752 + _842;
    float _850 = _768 + _844;
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = _846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _852);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _866 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _870 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _860);
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _862);
    float _878 = _846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_43.x = _866;
    out.m_43.y = _868;
    out.m_43.z = _870;
    out.m_43.w = _864;
    float _880 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _872);
    float _882 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _878);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _880);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _892);
    float _902 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _886);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _894);
    float _906 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _910 = _660 * _794;
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _916 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].x, _908);
    float _918 = _496 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _920 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _900);
    float _922 = _566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _914);
    float _926 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _928 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _916);
    float _930 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _932 = _926 * _898;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _938 = _918 * _912;
    float _940 = _922 * _818;
    float _942 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_47.x = _940;
    out.m_47.y = _932;
    out.m_47.z = _910;
    out.m_47.w = _938;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _950 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _924);
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _920);
    float _956 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _928);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _930);
    out.m_49.x = _946;
    out.m_49.y = _950;
    out.m_49.z = _942;
    out.gl_Position.x = _954;
    out.gl_Position.y = _952;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

