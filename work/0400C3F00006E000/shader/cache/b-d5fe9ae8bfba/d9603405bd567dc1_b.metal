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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = in.m_32.w;
    float _85 = trunc(_81);
    int _88 = int(_85);
    float _90 = -_83;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _92;
    bool _96 = _88 >= 1;
    float _98 = 0.0;
    float _100 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1110 = as_type<float>(_108);
        out.gl_Position.z = _1110;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _112 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_83);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_88);
    float _126 = in.m_39.y;
    bool _128 = _92 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    float _134 = _124;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _110 = as_type<int>(_138);
    }
    int _140 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1174 = as_type<float>(_140);
        out.gl_Position.z = _1174;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _150 = log2(_148);
    float _152 = precise::max(_92, 120.0);
    float _154 = _122 * 2.0;
    float _156 = in.m_39.z;
    float _158 = _126 * 2.0;
    float _160 = in.m_45.y;
    float _162 = floor(_154);
    float _164 = fma(_152, 0.004999999888241291046142578125, -0.599999964237213134765625);
    float _166 = _122 + _126;
    float _168 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _164 * 0.15915493667125701904296875;
    float _172 = _166 + (-1.0);
    bool _174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _176 = isnan(0.0);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _182 = _178 || _180;
    float _184 = _150 * _92;
    float _186 = floor(_158);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _190 = in.m_47.z;
    float _192 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _194 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = exp2(_184);
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _126 + _156;
    float _202 = _156 * 2.0;
    float _204 = _122 + _156;
    bool _206 = _162 >= 0.0;
    bool _208 = isnan(_162);
    bool _210 = _206 || _208;
    bool _212 = isnan(0.0);
    bool _214 = _210 || _212;
    float _216 = _200 + (-1.0);
    out.m_49.y = _160;
    float _218 = _204 + (-1.0);
    float _220 = floor(_202);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _224 = _186 > 0.0;
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _228 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _230 = _186 >= 0.0;
    bool _232 = isnan(_186);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = -_196;
    float _242 = _240 + 1.0;
    float _244 = _170 * 6.283185482025146484375;
    float _246 = sin(_244);
    bool _248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(1.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _260 = 1.0 + _258;
    float _262 = in.m_47.x;
    float _264 = in.m_47.y;
    float _266 = _182 ? _242 : 0.0;
    bool _268 = _162 > 0.0;
    bool _270 = _220 > 0.0;
    float _272 = 1.0 / _260;
    bool _274 = _220 >= 0.0;
    bool _276 = isnan(_220);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    int _284 = _214 ? 0 : 1;
    bool _286 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _290 = _286 || _288;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    float _296 = _246 * 0.3499999940395355224609375;
    int _298 = _238 ? 0 : 1;
    float _300 = _296 * 0.15915493667125701904296875;
    int _302 = _282 ? 0 : 1;
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    int _306 = ~_284;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~_298;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    int _322 = _310;
    int _324 = _320;
    float _326 = _168;
    if (_256)
    {
        float _328 = _266 * _272;
        _100 = _328;
    }
    float _330 = _100;
    float _332 = 0.0;
    if (!_294)
    {
        float _334 = _168 * _168;
        float _336 = _334 * 0.5;
        _332 = _336;
    }
    float _338 = _332;
    int _340 = ~_302;
    int _342 = _340 + 1;
    int _344 = _342 + 1;
    float _346 = _304 * _228;
    float _348 = _338;
    int _350 = _344;
    if (!_268)
    {
        int _352 = ~_284;
        int _354 = _352 + 1;
        _322 = _354;
    }
    int _356 = _322;
    if (!_294)
    {
        float _358 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _358;
    }
    float _360 = _348;
    float _362 = _360;
    if (!_224)
    {
        int _364 = ~_298;
        int _366 = _364 + 1;
        _324 = _366;
    }
    int _368 = _324;
    if (!_270)
    {
        int _370 = ~_302;
        int _372 = _370 + 1;
        _350 = _372;
    }
    int _374 = _350;
    bool _376 = !_294;
    if (!_376)
    {
        float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = log2(_378);
        float _382 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _384 = _382 + 1.0;
        float _386 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = _168 * _380;
        float _390 = 1.0 / _384;
        float _392 = _386 * 0.693147182464599609375;
        float _394 = exp2(_388);
        float _396 = 1.0 / _392;
        float _398 = _394 + (-1.0);
        float _400 = -_398;
        float _402 = fma(_400, _396, _168);
        float _404 = _402 * _390;
        float _406 = _404 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _406;
    }
    float _408 = _362;
    bool _410 = !_294;
    if (!_410)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = 1.0 / _418;
        float _422 = _168 * _414;
        float _424 = exp2(_422);
        float _426 = -_424;
        float _428 = _426 + 1.0;
        float _430 = _428 * _420;
        _326 = _430;
    }
    float _432 = _326;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _444 = _442 != 0;
    float _446 = _300 * 6.283185482025146484375;
    float _448 = cos(_446);
    float _450 = in.m_51.x;
    float _452 = in.m_51.y;
    float _454 = float(_374);
    float _456 = _314 * _264;
    bool _458 = !_436;
    int _460 = _458 ? 0 : 1;
    float _462 = in.m_53.x;
    float _464 = in.m_53.y;
    float _466 = in.m_53.z;
    float _468 = _122 + (-0.5);
    int _470 = abs(_460);
    float _472 = _126 + (-0.5);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _476 = _156 + (-0.5);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _480 = _448 * _264;
    float _482 = float(_470);
    float _484 = -_456;
    float _486 = fma(_448, _262, _484);
    bool _488 = !_440;
    int _490 = _488 ? 0 : 1;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _494 = float(_356);
    float _496 = _482 * _454;
    float _498 = fma(_314, _262, _480);
    int _500 = abs(_490);
    float _502 = _314 * _452;
    float _504 = _496 * (-2.0);
    float _506 = _448 * _452;
    float _508 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_504, _462, _462);
    float _514 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = in.m_32.x;
    float _518 = in.m_32.y;
    float _520 = in.m_32.z;
    float _522 = -_502;
    float _524 = fma(_448, _450, _522);
    float _526 = fma(_314, _450, _506);
    float _528 = fma(_188, _504, _188);
    float _530 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].x, _512);
    bool _532 = !_444;
    int _534 = _532 ? 0 : 1;
    out.m_55.x = _508;
    out.m_55.y = _510;
    out.m_55.z = _514;
    float _536 = float(_368);
    float _538 = fma(_528, _330, _530);
    int _540 = abs(_534);
    float _542 = in.m_43.w;
    float _544 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _546 = _538 * 0.15915493667125701904296875;
    float _548 = float(_540);
    float _550 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _552 = _498 != 0.0;
    bool _554 = isnan(_498);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _546 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = float(_500);
    float _568 = _548 * _536;
    bool _570 = _486 == 0.0;
    bool _572 = !_560;
    bool _574 = _570 && _572;
    bool _576 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _578 = isnan(0.5);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _584 = _580 || _582;
    float _586 = _566 * _494;
    float _588 = _568 * (-2.0);
    float _590 = in.m_30.x;
    float _592 = in.m_30.y;
    float _594 = in.m_30.z;
    bool _596 = _190 == 0.0;
    bool _598 = _596 && _574;
    float _600 = _586 * (-2.0);
    float _602 = fma(_588, _466, _466);
    float _604 = fma(_226, _588, _226);
    float _606 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_600, _464, _464);
    float _610 = fma(_222, _600, _222);
    float _612 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _602);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _616 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _618 = fma(_432, _516, _544);
    float _620 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _624 = fma(_610, _330, _616);
    float _626 = _546 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = fma(_432, _518, _620);
    float _632 = fma(_432, _520, _622);
    float _634 = fma(_604, _330, _612);
    float _636 = _624 * 0.15915493667125701904296875;
    float _638 = _614 * _550;
    float _640 = _526;
    float _642 = _524;
    if (!_598)
    {
        float _644 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _640 = _644;
    }
    float _646 = _640;
    float _648 = _634 * 0.15915493667125701904296875;
    float _650 = _636 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_632, _542, _594);
    float _656 = fma(_618, _542, _590);
    float _658 = fma(_630, _542, _592);
    float _660 = in.m_51.z;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    if (!_598)
    {
        float _664 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _642 = _664;
    }
    float _666 = _642;
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _670 = _636 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _668);
    float _680 = _662 * _606;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _684 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _688 = _648 * 6.283185482025146484375;
    float _690 = cos(_688);
    float _692 = _564 * _652;
    float _694 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = _628 * _652;
    float _700 = _648 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = _628 * _672;
    float _706 = _564 * _672;
    float _708 = _660;
    if (!_598)
    {
        float _710 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _660);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = _628 * _690;
    float _716 = _672 * _690;
    float _718 = _564 * _690;
    float _720 = _652 * _690;
    float _722 = fma(_702, _704, _692);
    float _724 = fma(_702, _692, _704);
    float _726 = _714 * _680;
    float _728 = -_698;
    float _730 = fma(_702, _706, _728);
    float _732 = -_680;
    float _734 = _702 * _732;
    float _736 = -_706;
    float _738 = fma(_702, _698, _736);
    float _740 = fma(_722, _638, _726);
    float _742 = -_646;
    float _744 = _702 * _742;
    float _746 = fma(_716, _638, _734);
    float _748 = _718 * _680;
    float _750 = fma(_738, _346, _740);
    float _752 = fma(_716, _666, _744);
    float _754 = _718 * _646;
    float _756 = fma(_730, _638, _748);
    float _758 = fma(_720, _346, _746);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = fma(_730, _666, _754);
    float _764 = fma(_724, _346, _756);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _770 = _714 * _646;
    float _772 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _766);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_722, _666, _770);
    float _780 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].z, _774);
    float _784 = _772 + _776;
    float _786 = fma(_720, _712, _752);
    float _788 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _780 + _782;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _794 = _784 + _792;
    float _796 = fma(_738, _712, _778);
    float _798 = fma(_724, _712, _762);
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _802 = _790 + _800;
    float _804 = _794 * _794;
    float _806 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = fma(_802, _802, _804);
    float _812 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _806);
    float _814 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = sqrt(_810);
    float _820 = in.m_57.w;
    float _822 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _826 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _814);
    float _828 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _830 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _822);
    float _834 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _826);
    float _836 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_59.w = _824;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _840 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _844 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _846 = 1.0 / _836;
    bool _848 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _844);
    out.m_61.x = _834;
    out.m_61.y = _838;
    out.m_61.z = _842;
    float _854 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _856 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[9].z, _852);
    float _858 = _854 + _836;
    float _860 = _788 + _856;
    out.m_63.w = _820;
    float _862 = _834;
    float _864 = _842;
    float _866 = _838;
    float _868 = _824;
    if (!_848)
    {
        _862 = _790;
    }
    float _870 = _862;
    float _872 = _870;
    if (!_848)
    {
        _864 = _784;
    }
    float _874 = _864;
    float _876 = _858 * _846;
    float _878 = _876 * 0.5;
    float _880 = _874;
    if (!_848)
    {
        _866 = _860;
    }
    float _882 = _866;
    bool _884 = !_848;
    float _886 = _882;
    if (!_884)
    {
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _892 = _818 + _890;
        float _894 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = rsqrt(_810);
        float _898 = _892 * _888;
        float _900 = _898 * 0.15915493667125701904296875;
        float _902 = _900 * 6.283185482025146484375;
        float _904 = cos(_902);
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        float _910 = _904 + (-1.0);
        float _912 = _910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = fma(_908, _894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _916 = fma(_860, _904, _912);
        float _918 = _896 * _914;
        float _920 = fma(_802, _918, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _922 = fma(_794, _918, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _886 = _916;
        _868 = _918;
        _872 = _920;
        _880 = _922;
    }
    float _924 = _886;
    float _926 = _868;
    float _928 = _872;
    float _930 = _880;
    float _932 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926;
    if (_584)
    {
        _934 = 1.0;
    }
    float _936 = _934;
    float _938 = _936;
    if (!_584)
    {
        float _940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _940);
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _948 = 1.0 / _942;
        float _950 = 1.0 / _946;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _956 = fma(_948, _952, _954);
        float _958 = _956 * _950;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _968 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _990);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1002);
    float _1014 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    bool _1020 = _962 > 0.0;
    bool _1022 = isnan(_962);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1012);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1036 = _1016 + _1018;
    float _1038 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1030);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1042 = _1036 * 0.5;
    out.m_65.x = _928;
    out.m_65.y = _924;
    out.m_65.z = _930;
    out.m_37.x = _1040;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1038;
    out.gl_Position.z = _1016;
    out.gl_Position.w = _1018;
    out.m_67.z = _1042;
    out.m_67.w = _1018;
    if (_1028)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1044;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = in.m_32.w;
    float _85 = trunc(_81);
    int _88 = int(_85);
    float _90 = -_83;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _92;
    bool _96 = _88 >= 1;
    float _98 = 0.0;
    float _100 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1110 = as_type<float>(_108);
        out.gl_Position.z = _1110;
    }
    if (!_96)
    {
        return out;
    }
    bool _112 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_83);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_88);
    float _126 = in.m_39.y;
    bool _128 = _92 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    float _134 = _124;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _110 = as_type<int>(_138);
    }
    int _140 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1174 = as_type<float>(_140);
        out.gl_Position.z = _1174;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _150 = log2(_148);
    float _152 = precise::max(_92, 120.0);
    float _154 = _122 * 2.0;
    float _156 = in.m_39.z;
    float _158 = _126 * 2.0;
    float _160 = in.m_45.y;
    float _162 = floor(_154);
    float _164 = fma(_152, 0.004999999888241291046142578125, -0.599999964237213134765625);
    float _166 = _122 + _126;
    float _168 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _164 * 0.15915493667125701904296875;
    float _172 = _166 + (-1.0);
    bool _174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _176 = isnan(0.0);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _182 = _178 || _180;
    float _184 = _150 * _92;
    float _186 = floor(_158);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _190 = in.m_47.z;
    float _192 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _194 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = exp2(_184);
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _126 + _156;
    float _202 = _156 * 2.0;
    float _204 = _122 + _156;
    bool _206 = _162 >= 0.0;
    bool _208 = isnan(_162);
    bool _210 = _206 || _208;
    bool _212 = isnan(0.0);
    bool _214 = _210 || _212;
    float _216 = _200 + (-1.0);
    out.m_49.y = _160;
    float _218 = _204 + (-1.0);
    float _220 = floor(_202);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _224 = _186 > 0.0;
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _228 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _230 = _186 >= 0.0;
    bool _232 = isnan(_186);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = -_196;
    float _242 = _240 + 1.0;
    float _244 = _170 * 6.283185482025146484375;
    float _246 = sin(_244);
    bool _248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(1.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _260 = 1.0 + _258;
    float _262 = in.m_47.x;
    float _264 = in.m_47.y;
    float _266 = _182 ? _242 : 0.0;
    bool _268 = _162 > 0.0;
    bool _270 = _220 > 0.0;
    float _272 = 1.0 / _260;
    bool _274 = _220 >= 0.0;
    bool _276 = isnan(_220);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    int _284 = _214 ? 0 : 1;
    bool _286 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _290 = _286 || _288;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    float _296 = _246 * 0.3499999940395355224609375;
    int _298 = _238 ? 0 : 1;
    float _300 = _296 * 0.15915493667125701904296875;
    int _302 = _282 ? 0 : 1;
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    int _306 = ~_284;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~_298;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    int _322 = _310;
    int _324 = _320;
    float _326 = _168;
    if (_256)
    {
        float _328 = _266 * _272;
        _100 = _328;
    }
    float _330 = _100;
    float _332 = 0.0;
    if (!_294)
    {
        float _334 = _168 * _168;
        float _336 = _334 * 0.5;
        _332 = _336;
    }
    float _338 = _332;
    int _340 = ~_302;
    int _342 = _340 + 1;
    int _344 = _342 + 1;
    float _346 = _304 * _228;
    float _348 = _338;
    int _350 = _344;
    if (!_268)
    {
        int _352 = ~_284;
        int _354 = _352 + 1;
        _322 = _354;
    }
    int _356 = _322;
    if (!_294)
    {
        float _358 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _358;
    }
    float _360 = _348;
    float _362 = _360;
    if (!_224)
    {
        int _364 = ~_298;
        int _366 = _364 + 1;
        _324 = _366;
    }
    int _368 = _324;
    if (!_270)
    {
        int _370 = ~_302;
        int _372 = _370 + 1;
        _350 = _372;
    }
    int _374 = _350;
    bool _376 = !_294;
    if (!_376)
    {
        float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = log2(_378);
        float _382 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _384 = _382 + 1.0;
        float _386 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = _168 * _380;
        float _390 = 1.0 / _384;
        float _392 = _386 * 0.693147182464599609375;
        float _394 = exp2(_388);
        float _396 = 1.0 / _392;
        float _398 = _394 + (-1.0);
        float _400 = -_398;
        float _402 = fma(_400, _396, _168);
        float _404 = _402 * _390;
        float _406 = _404 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _406;
    }
    float _408 = _362;
    bool _410 = !_294;
    if (!_410)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = 1.0 / _418;
        float _422 = _168 * _414;
        float _424 = exp2(_422);
        float _426 = -_424;
        float _428 = _426 + 1.0;
        float _430 = _428 * _420;
        _326 = _430;
    }
    float _432 = _326;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _444 = _442 != 0;
    float _446 = _300 * 6.283185482025146484375;
    float _448 = cos(_446);
    float _450 = in.m_51.x;
    float _452 = in.m_51.y;
    float _454 = float(_374);
    float _456 = _314 * _264;
    bool _458 = !_436;
    int _460 = _458 ? 0 : 1;
    float _462 = in.m_53.x;
    float _464 = in.m_53.y;
    float _466 = in.m_53.z;
    float _468 = _122 + (-0.5);
    int _470 = abs(_460);
    float _472 = _126 + (-0.5);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _476 = _156 + (-0.5);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _480 = _448 * _264;
    float _482 = float(_470);
    float _484 = -_456;
    float _486 = fma(_448, _262, _484);
    bool _488 = !_440;
    int _490 = _488 ? 0 : 1;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _494 = float(_356);
    float _496 = _482 * _454;
    float _498 = fma(_314, _262, _480);
    int _500 = abs(_490);
    float _502 = _314 * _452;
    float _504 = _496 * (-2.0);
    float _506 = _448 * _452;
    float _508 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_504, _462, _462);
    float _514 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = in.m_32.x;
    float _518 = in.m_32.y;
    float _520 = in.m_32.z;
    float _522 = -_502;
    float _524 = fma(_448, _450, _522);
    float _526 = fma(_314, _450, _506);
    float _528 = fma(_188, _504, _188);
    float _530 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].x, _512);
    bool _532 = !_444;
    int _534 = _532 ? 0 : 1;
    out.m_55.x = _508;
    out.m_55.y = _510;
    out.m_55.z = _514;
    float _536 = float(_368);
    float _538 = fma(_528, _330, _530);
    int _540 = abs(_534);
    float _542 = in.m_43.w;
    float _544 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _546 = _538 * 0.15915493667125701904296875;
    float _548 = float(_540);
    float _550 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _552 = _498 != 0.0;
    bool _554 = isnan(_498);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _546 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = float(_500);
    float _568 = _548 * _536;
    bool _570 = _486 == 0.0;
    bool _572 = !_560;
    bool _574 = _570 && _572;
    bool _576 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _578 = isnan(0.5);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _584 = _580 || _582;
    float _586 = _566 * _494;
    float _588 = _568 * (-2.0);
    float _590 = in.m_30.x;
    float _592 = in.m_30.y;
    float _594 = in.m_30.z;
    bool _596 = _190 == 0.0;
    bool _598 = _596 && _574;
    float _600 = _586 * (-2.0);
    float _602 = fma(_588, _466, _466);
    float _604 = fma(_226, _588, _226);
    float _606 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_600, _464, _464);
    float _610 = fma(_222, _600, _222);
    float _612 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _602);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _616 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _618 = fma(_432, _516, _544);
    float _620 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _624 = fma(_610, _330, _616);
    float _626 = _546 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = fma(_432, _518, _620);
    float _632 = fma(_432, _520, _622);
    float _634 = fma(_604, _330, _612);
    float _636 = _624 * 0.15915493667125701904296875;
    float _638 = _614 * _550;
    float _640 = _526;
    float _642 = _524;
    if (!_598)
    {
        float _644 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _640 = _644;
    }
    float _646 = _640;
    float _648 = _634 * 0.15915493667125701904296875;
    float _650 = _636 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_632, _542, _594);
    float _656 = fma(_618, _542, _590);
    float _658 = fma(_630, _542, _592);
    float _660 = in.m_51.z;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    if (!_598)
    {
        float _664 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _642 = _664;
    }
    float _666 = _642;
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _670 = _636 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _668);
    float _680 = _662 * _606;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _684 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _688 = _648 * 6.283185482025146484375;
    float _690 = cos(_688);
    float _692 = _564 * _652;
    float _694 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = _628 * _652;
    float _700 = _648 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = _628 * _672;
    float _706 = _564 * _672;
    float _708 = _660;
    if (!_598)
    {
        float _710 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _660);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = _628 * _690;
    float _716 = _672 * _690;
    float _718 = _564 * _690;
    float _720 = _652 * _690;
    float _722 = fma(_702, _704, _692);
    float _724 = fma(_702, _692, _704);
    float _726 = _714 * _680;
    float _728 = -_698;
    float _730 = fma(_702, _706, _728);
    float _732 = -_680;
    float _734 = _702 * _732;
    float _736 = -_706;
    float _738 = fma(_702, _698, _736);
    float _740 = fma(_722, _638, _726);
    float _742 = -_646;
    float _744 = _702 * _742;
    float _746 = fma(_716, _638, _734);
    float _748 = _718 * _680;
    float _750 = fma(_738, _346, _740);
    float _752 = fma(_716, _666, _744);
    float _754 = _718 * _646;
    float _756 = fma(_730, _638, _748);
    float _758 = fma(_720, _346, _746);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = fma(_730, _666, _754);
    float _764 = fma(_724, _346, _756);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _770 = _714 * _646;
    float _772 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _766);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_722, _666, _770);
    float _780 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].z, _774);
    float _784 = _772 + _776;
    float _786 = fma(_720, _712, _752);
    float _788 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _780 + _782;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _794 = _784 + _792;
    float _796 = fma(_738, _712, _778);
    float _798 = fma(_724, _712, _762);
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _802 = _790 + _800;
    float _804 = _794 * _794;
    float _806 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = fma(_802, _802, _804);
    float _812 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _806);
    float _814 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = sqrt(_810);
    float _820 = in.m_57.w;
    float _822 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _826 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _814);
    float _828 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _830 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _822);
    float _834 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _826);
    float _836 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_59.w = _824;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _840 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _844 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _846 = 1.0 / _836;
    bool _848 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _844);
    out.m_61.x = _834;
    out.m_61.y = _838;
    out.m_61.z = _842;
    float _854 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _856 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[9].z, _852);
    float _858 = _854 + _836;
    float _860 = _788 + _856;
    out.m_63.w = _820;
    float _862 = _834;
    float _864 = _842;
    float _866 = _838;
    float _868 = _824;
    if (!_848)
    {
        _862 = _790;
    }
    float _870 = _862;
    float _872 = _870;
    if (!_848)
    {
        _864 = _784;
    }
    float _874 = _864;
    float _876 = _858 * _846;
    float _878 = _876 * 0.5;
    float _880 = _874;
    if (!_848)
    {
        _866 = _860;
    }
    float _882 = _866;
    bool _884 = !_848;
    float _886 = _882;
    if (!_884)
    {
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _892 = _818 + _890;
        float _894 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = rsqrt(_810);
        float _898 = _892 * _888;
        float _900 = _898 * 0.15915493667125701904296875;
        float _902 = _900 * 6.283185482025146484375;
        float _904 = cos(_902);
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        float _910 = _904 + (-1.0);
        float _912 = _910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = fma(_908, _894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _916 = fma(_860, _904, _912);
        float _918 = _896 * _914;
        float _920 = fma(_802, _918, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _922 = fma(_794, _918, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _886 = _916;
        _868 = _918;
        _872 = _920;
        _880 = _922;
    }
    float _924 = _886;
    float _926 = _868;
    float _928 = _872;
    float _930 = _880;
    float _932 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926;
    if (_584)
    {
        _934 = 1.0;
    }
    float _936 = _934;
    float _938 = _936;
    if (!_584)
    {
        float _940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _940);
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _948 = 1.0 / _942;
        float _950 = 1.0 / _946;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _956 = fma(_948, _952, _954);
        float _958 = _956 * _950;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _968 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _990);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1002);
    float _1014 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    bool _1020 = _962 > 0.0;
    bool _1022 = isnan(_962);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1012);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1036 = _1016 + _1018;
    float _1038 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1030);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1042 = _1036 * 0.5;
    out.m_65.x = _928;
    out.m_65.y = _924;
    out.m_65.z = _930;
    out.m_37.x = _1040;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1038;
    out.gl_Position.z = _1016;
    out.gl_Position.w = _1018;
    out.m_67.z = _1042;
    out.m_67.w = _1018;
    if (_1028)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1044;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_30.w;
    float _83 = in.m_32.w;
    float _85 = trunc(_81);
    int _88 = int(_85);
    float _90 = -_83;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _92;
    bool _96 = _88 >= 1;
    float _98 = 0.0;
    float _100 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1110 = as_type<float>(_108);
        out.gl_Position.z = _1110;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _112 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_83);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_88);
    float _126 = in.m_39.y;
    bool _128 = _92 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    float _134 = _124;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _110 = as_type<int>(_138);
    }
    int _140 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1174 = as_type<float>(_140);
        out.gl_Position.z = _1174;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _150 = log2(_148);
    float _152 = precise::max(_92, 120.0);
    float _154 = _122 * 2.0;
    float _156 = in.m_39.z;
    float _158 = _126 * 2.0;
    float _160 = in.m_45.y;
    float _162 = floor(_154);
    float _164 = fma(_152, 0.004999999888241291046142578125, -0.599999964237213134765625);
    float _166 = _122 + _126;
    float _168 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _164 * 0.15915493667125701904296875;
    float _172 = _166 + (-1.0);
    bool _174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _176 = isnan(0.0);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _182 = _178 || _180;
    float _184 = _150 * _92;
    float _186 = floor(_158);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _190 = in.m_47.z;
    float _192 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _194 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = exp2(_184);
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = _126 + _156;
    float _202 = _156 * 2.0;
    float _204 = _122 + _156;
    bool _206 = _162 >= 0.0;
    bool _208 = isnan(_162);
    bool _210 = _206 || _208;
    bool _212 = isnan(0.0);
    bool _214 = _210 || _212;
    float _216 = _200 + (-1.0);
    out.m_49.y = _160;
    float _218 = _204 + (-1.0);
    float _220 = floor(_202);
    float _222 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _224 = _186 > 0.0;
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _228 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _230 = _186 >= 0.0;
    bool _232 = isnan(_186);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = -_196;
    float _242 = _240 + 1.0;
    float _244 = _170 * 6.283185482025146484375;
    float _246 = sin(_244);
    bool _248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(1.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _260 = 1.0 + _258;
    float _262 = in.m_47.x;
    float _264 = in.m_47.y;
    float _266 = _182 ? _242 : 0.0;
    bool _268 = _162 > 0.0;
    bool _270 = _220 > 0.0;
    float _272 = 1.0 / _260;
    bool _274 = _220 >= 0.0;
    bool _276 = isnan(_220);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    int _284 = _214 ? 0 : 1;
    bool _286 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _290 = _286 || _288;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    float _296 = _246 * 0.3499999940395355224609375;
    int _298 = _238 ? 0 : 1;
    float _300 = _296 * 0.15915493667125701904296875;
    int _302 = _282 ? 0 : 1;
    float _304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    int _306 = ~_284;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~_298;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    int _322 = _310;
    int _324 = _320;
    float _326 = _168;
    if (_256)
    {
        float _328 = _266 * _272;
        _100 = _328;
    }
    float _330 = _100;
    float _332 = 0.0;
    if (!_294)
    {
        float _334 = _168 * _168;
        float _336 = _334 * 0.5;
        _332 = _336;
    }
    float _338 = _332;
    int _340 = ~_302;
    int _342 = _340 + 1;
    int _344 = _342 + 1;
    float _346 = _304 * _228;
    float _348 = _338;
    int _350 = _344;
    if (!_268)
    {
        int _352 = ~_284;
        int _354 = _352 + 1;
        _322 = _354;
    }
    int _356 = _322;
    if (!_294)
    {
        float _358 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _358;
    }
    float _360 = _348;
    float _362 = _360;
    if (!_224)
    {
        int _364 = ~_298;
        int _366 = _364 + 1;
        _324 = _366;
    }
    int _368 = _324;
    if (!_270)
    {
        int _370 = ~_302;
        int _372 = _370 + 1;
        _350 = _372;
    }
    int _374 = _350;
    bool _376 = !_294;
    if (!_376)
    {
        float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = log2(_378);
        float _382 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _384 = _382 + 1.0;
        float _386 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = _168 * _380;
        float _390 = 1.0 / _384;
        float _392 = _386 * 0.693147182464599609375;
        float _394 = exp2(_388);
        float _396 = 1.0 / _392;
        float _398 = _394 + (-1.0);
        float _400 = -_398;
        float _402 = fma(_400, _396, _168);
        float _404 = _402 * _390;
        float _406 = _404 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _406;
    }
    float _408 = _362;
    bool _410 = !_294;
    if (!_410)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = 1.0 / _418;
        float _422 = _168 * _414;
        float _424 = exp2(_422);
        float _426 = -_424;
        float _428 = _426 + 1.0;
        float _430 = _428 * _420;
        _326 = _430;
    }
    float _432 = _326;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _444 = _442 != 0;
    float _446 = _300 * 6.283185482025146484375;
    float _448 = cos(_446);
    float _450 = in.m_51.x;
    float _452 = in.m_51.y;
    float _454 = float(_374);
    float _456 = _314 * _264;
    bool _458 = !_436;
    int _460 = _458 ? 0 : 1;
    float _462 = in.m_53.x;
    float _464 = in.m_53.y;
    float _466 = in.m_53.z;
    float _468 = _122 + (-0.5);
    int _470 = abs(_460);
    float _472 = _126 + (-0.5);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _476 = _156 + (-0.5);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _480 = _448 * _264;
    float _482 = float(_470);
    float _484 = -_456;
    float _486 = fma(_448, _262, _484);
    bool _488 = !_440;
    int _490 = _488 ? 0 : 1;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _494 = float(_356);
    float _496 = _482 * _454;
    float _498 = fma(_314, _262, _480);
    int _500 = abs(_490);
    float _502 = _314 * _452;
    float _504 = _496 * (-2.0);
    float _506 = _448 * _452;
    float _508 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_504, _462, _462);
    float _514 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = in.m_32.x;
    float _518 = in.m_32.y;
    float _520 = in.m_32.z;
    float _522 = -_502;
    float _524 = fma(_448, _450, _522);
    float _526 = fma(_314, _450, _506);
    float _528 = fma(_188, _504, _188);
    float _530 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].x, _512);
    bool _532 = !_444;
    int _534 = _532 ? 0 : 1;
    out.m_55.x = _508;
    out.m_55.y = _510;
    out.m_55.z = _514;
    float _536 = float(_368);
    float _538 = fma(_528, _330, _530);
    int _540 = abs(_534);
    float _542 = in.m_43.w;
    float _544 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _546 = _538 * 0.15915493667125701904296875;
    float _548 = float(_540);
    float _550 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _552 = _498 != 0.0;
    bool _554 = isnan(_498);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _546 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = float(_500);
    float _568 = _548 * _536;
    bool _570 = _486 == 0.0;
    bool _572 = !_560;
    bool _574 = _570 && _572;
    bool _576 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _578 = isnan(0.5);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _584 = _580 || _582;
    float _586 = _566 * _494;
    float _588 = _568 * (-2.0);
    float _590 = in.m_30.x;
    float _592 = in.m_30.y;
    float _594 = in.m_30.z;
    bool _596 = _190 == 0.0;
    bool _598 = _596 && _574;
    float _600 = _586 * (-2.0);
    float _602 = fma(_588, _466, _466);
    float _604 = fma(_226, _588, _226);
    float _606 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_600, _464, _464);
    float _610 = fma(_222, _600, _222);
    float _612 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[196].z, _602);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _616 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _618 = fma(_432, _516, _544);
    float _620 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _622 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _624 = fma(_610, _330, _616);
    float _626 = _546 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = fma(_432, _518, _620);
    float _632 = fma(_432, _520, _622);
    float _634 = fma(_604, _330, _612);
    float _636 = _624 * 0.15915493667125701904296875;
    float _638 = _614 * _550;
    float _640 = _526;
    float _642 = _524;
    if (!_598)
    {
        float _644 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _640 = _644;
    }
    float _646 = _640;
    float _648 = _634 * 0.15915493667125701904296875;
    float _650 = _636 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = fma(_632, _542, _594);
    float _656 = fma(_618, _542, _590);
    float _658 = fma(_630, _542, _592);
    float _660 = in.m_51.z;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    if (!_598)
    {
        float _664 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _642 = _664;
    }
    float _666 = _642;
    float _668 = _658 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _670 = _636 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _658 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _658 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].x, _668);
    float _680 = _662 * _606;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _684 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _688 = _648 * 6.283185482025146484375;
    float _690 = cos(_688);
    float _692 = _564 * _652;
    float _694 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = _628 * _652;
    float _700 = _648 * 6.283185482025146484375;
    float _702 = sin(_700);
    float _704 = _628 * _672;
    float _706 = _564 * _672;
    float _708 = _660;
    if (!_598)
    {
        float _710 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _660);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = _628 * _690;
    float _716 = _672 * _690;
    float _718 = _564 * _690;
    float _720 = _652 * _690;
    float _722 = fma(_702, _704, _692);
    float _724 = fma(_702, _692, _704);
    float _726 = _714 * _680;
    float _728 = -_698;
    float _730 = fma(_702, _706, _728);
    float _732 = -_680;
    float _734 = _702 * _732;
    float _736 = -_706;
    float _738 = fma(_702, _698, _736);
    float _740 = fma(_722, _638, _726);
    float _742 = -_646;
    float _744 = _702 * _742;
    float _746 = fma(_716, _638, _734);
    float _748 = _718 * _680;
    float _750 = fma(_738, _346, _740);
    float _752 = fma(_716, _666, _744);
    float _754 = _718 * _646;
    float _756 = fma(_730, _638, _748);
    float _758 = fma(_720, _346, _746);
    float _760 = _750 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = fma(_730, _666, _754);
    float _764 = fma(_724, _346, _756);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _770 = _714 * _646;
    float _772 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _766);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_722, _666, _770);
    float _780 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[8].z, _774);
    float _784 = _772 + _776;
    float _786 = fma(_720, _712, _752);
    float _788 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _780 + _782;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _794 = _784 + _792;
    float _796 = fma(_738, _712, _778);
    float _798 = fma(_724, _712, _762);
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _802 = _790 + _800;
    float _804 = _794 * _794;
    float _806 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = fma(_802, _802, _804);
    float _812 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _806);
    float _814 = _796 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = sqrt(_810);
    float _820 = in.m_57.w;
    float _822 = _796 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _826 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _814);
    float _828 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _830 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _822);
    float _834 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _826);
    float _836 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_59.w = _824;
    float _838 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _840 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _844 = _750 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _846 = 1.0 / _836;
    bool _848 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _844);
    out.m_61.x = _834;
    out.m_61.y = _838;
    out.m_61.z = _842;
    float _854 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _856 = fma(_764, (*spvDescriptorSet0.vp_c10)._m0[9].z, _852);
    float _858 = _854 + _836;
    float _860 = _788 + _856;
    out.m_63.w = _820;
    float _862 = _834;
    float _864 = _842;
    float _866 = _838;
    float _868 = _824;
    if (!_848)
    {
        _862 = _790;
    }
    float _870 = _862;
    float _872 = _870;
    if (!_848)
    {
        _864 = _784;
    }
    float _874 = _864;
    float _876 = _858 * _846;
    float _878 = _876 * 0.5;
    float _880 = _874;
    if (!_848)
    {
        _866 = _860;
    }
    float _882 = _866;
    bool _884 = !_848;
    float _886 = _882;
    if (!_884)
    {
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _892 = _818 + _890;
        float _894 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = rsqrt(_810);
        float _898 = _892 * _888;
        float _900 = _898 * 0.15915493667125701904296875;
        float _902 = _900 * 6.283185482025146484375;
        float _904 = cos(_902);
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        float _910 = _904 + (-1.0);
        float _912 = _910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = fma(_908, _894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _916 = fma(_860, _904, _912);
        float _918 = _896 * _914;
        float _920 = fma(_802, _918, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _922 = fma(_794, _918, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _886 = _916;
        _868 = _918;
        _872 = _920;
        _880 = _922;
    }
    float _924 = _886;
    float _926 = _868;
    float _928 = _872;
    float _930 = _880;
    float _932 = _924 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _934 = _926;
    if (_584)
    {
        _934 = 1.0;
    }
    float _936 = _934;
    float _938 = _936;
    if (!_584)
    {
        float _940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _942 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _940);
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _948 = 1.0 / _942;
        float _950 = 1.0 / _946;
        float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _956 = fma(_948, _952, _954);
        float _958 = _956 * _950;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _924 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _932);
    float _968 = _924 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _924 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _990);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _992);
    float _1002 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1002);
    float _1014 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    bool _1020 = _962 > 0.0;
    bool _1022 = isnan(_962);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan(0.0);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1012);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1014);
    float _1034 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1036 = _1016 + _1018;
    float _1038 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1030);
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1042 = _1036 * 0.5;
    out.m_65.x = _928;
    out.m_65.y = _924;
    out.m_65.z = _930;
    out.m_37.x = _1040;
    out.gl_Position.x = _1032;
    out.gl_Position.y = _1038;
    out.gl_Position.z = _1016;
    out.gl_Position.w = _1018;
    out.m_67.z = _1042;
    out.m_67.w = _1018;
    if (_1028)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1044;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

