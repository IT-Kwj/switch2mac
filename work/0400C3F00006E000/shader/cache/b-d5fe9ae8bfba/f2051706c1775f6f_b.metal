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
    float4 m_35 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_47 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_32 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
    float4 m_51 [[attribute(11)]];
    float4 m_55 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_88);
    float _102 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1810 = as_type<float>(_110);
        out.gl_Position.z = _1810;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _114 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_83);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_88);
    bool _126 = _92 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    if (_130)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _100;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _112 = as_type<int>(_134);
    }
    int _136 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_136);
        out.gl_Position.z = _1865;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_39.x;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = in.m_39.z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _148 = _146 != 0;
    float _150 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_39.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _162 = _138 * 2.0;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _166 = _144 * 2.0;
    float _168 = floor(_162);
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _174 = _152 * 2.0;
    float _176 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _178 = floor(_166);
    float _180 = fma(_176, -2.0, _154);
    float _182 = _152 + _138;
    float _184 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _186 = -_156;
    float _188 = fma(_184, 2.0, _186);
    float _190 = floor(_174);
    bool _192 = _168 > 0.0;
    bool _194 = _168 >= 0.0;
    bool _196 = isnan(_168);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    float _204 = _184;
    float _206 = _150;
    if (_148)
    {
        _204 = _138;
    }
    float _208 = _204;
    float _210 = _208;
    if (!_148)
    {
        _210 = _144;
    }
    float _212 = _210;
    bool _214 = _178 > 0.0;
    bool _216 = _178 >= 0.0;
    bool _218 = isnan(_178);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _228 = _178;
    float _230 = _226;
    if (!_148)
    {
        _228 = _152;
    }
    float _232 = _228;
    float _234 = _232;
    if (_148)
    {
        _234 = _138;
    }
    float _236 = _234;
    float _238 = -_158;
    float _240 = fma(_226, 2.0, _238);
    bool _242 = _190 > 0.0;
    bool _244 = _190 >= 0.0;
    bool _246 = isnan(_190);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _182 + (-1.0);
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _258 = _202 ? 0 : 1;
    float _260 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[83].z, _256);
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _266 = ~_258;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    if (!_192)
    {
        int _274 = ~_258;
        int _276 = _274 + 1;
        _272 = _276;
    }
    int _278 = _272;
    float _280 = -_160;
    float _282 = fma(_264, 2.0, _280);
    bool _284 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _288 = _284 || _286;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    if (!_148)
    {
        _230 = _144;
    }
    float _294 = _230;
    float _296 = _224 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _298 = _294;
    float _300 = _296;
    if (_148)
    {
        _298 = _152;
    }
    float _302 = _298;
    int _304 = ~as_type<int>(_296);
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    float _312 = _302;
    if (!_214)
    {
        int _314 = ~as_type<int>(_296);
        int _316 = _314 + 1;
        _310 = _316;
    }
    int _318 = _310;
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[83].w, _164);
    if (!_148)
    {
        _300 = _144;
    }
    float _322 = _300;
    float _324 = 0.0;
    float _326 = _322;
    if (!_292)
    {
        float _328 = _150 * _150;
        float _330 = _328 * 0.5;
        _324 = _330;
    }
    float _332 = _324;
    float _334 = _332;
    if (_148)
    {
        _312 = _152;
    }
    float _336 = _312;
    float _338 = _336;
    if (_148)
    {
        _326 = _152;
    }
    float _340 = _326;
    if (!_292)
    {
        float _342 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _342;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_148)
    {
        _338 = _138;
    }
    float _348 = _338;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _354 = !_292;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _150 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _150);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _384;
    }
    float _386 = _346;
    bool _388 = !_292;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _150 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _206 = _408;
    }
    float _410 = _206;
    float _412 = _142 * _92;
    float _414 = fma(_350, -2.0, _170);
    float _416 = fma(_352, -2.0, _172);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = -_92;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _188);
    float _434 = exp2(_412);
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    float _450 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[76].y, _180);
    float _452 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].z, _262);
    float _454 = 1.0 / _448;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _474 = !_420;
    int _476 = _474 ? 0 : 1;
    float _478 = -_434;
    float _480 = _478 + 1.0;
    float _482 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _456);
    float _484 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _486 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _470);
    float _488 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _472);
    float _490 = _466 ? _480 : 0.0;
    float _492 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].z, _482);
    float _494 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].w, _484);
    float _496 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].z, _486);
    float _498 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].w, _488);
    int _500 = abs(_476);
    float _502 = -_92;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[86].x, _240);
    float _506 = -_92;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _510 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].w, _320);
    float _512 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[81].y, _414);
    float _514 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[86].y, _416);
    bool _516 = _466;
    int _518 = _428 ? (-1) : 0;
    int _520 = as_type<int>(_450);
    if (_444)
    {
        float _522 = _490 * _454;
        _102 = _522;
    }
    float _524 = _102;
    int _526 = _252 ? 0 : 1;
    float _528 = float(_318);
    float _530 = float(_500);
    float _532 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _534 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _536 = precise::max(_532, _534);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _540 = ~_526;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = _530 * _528;
    int _548 = _544;
    if (!_242)
    {
        int _550 = ~_526;
        int _552 = _550 + 1;
        _548 = _552;
    }
    int _554 = _548;
    float _556 = _138 + (-0.5);
    float _558 = _546 * (-2.0);
    bool _560 = !_424;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _566 = _536 >= 16.0;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _570 = abs(_562);
    float _572 = fma(_260, _558, _260);
    float _574 = _566 ? _538 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _576 = _152 + _144;
    float _578 = float(_278);
    float _580 = fma(_572, _524, _564);
    float _582 = float(_570);
    float _584 = _576 + (-1.0);
    float _586 = _566 ? _568 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _588 = _580 * 0.15915493667125701904296875;
    float _590 = abs(_574);
    bool _592 = _590 != 0.0;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _582 * _578;
    bool _604 = !_428;
    int _606 = _604 ? 0 : 1;
    float _608 = in.m_41.x;
    float _610 = in.m_41.y;
    float _612 = in.m_41.z;
    float _614 = _588 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = abs(_586);
    bool _620 = _618 == 0.0;
    bool _622 = !_600;
    bool _624 = _620 && _622;
    float _626 = in.m_43.x;
    float _628 = in.m_43.y;
    float _630 = in.m_43.z;
    int _632 = abs(_606);
    float _634 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _636 = float(_554);
    float _638 = _602 * (-2.0);
    float _640 = float(_632);
    float _642 = _144 + _138;
    float _644 = abs(_586);
    bool _646 = _644 == 0.0;
    float _648 = fma(_634, _638, _634);
    float _650 = _642 + (-1.0);
    float _652 = _640 * _636;
    float _654 = _152 + (-0.5);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    if (_624)
    {
        bool _658 = as_type<int>(_586) >= 0;
        _516 = _658;
    }
    bool _660 = _516;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = _652 * (-2.0);
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _668 = _144 + (-0.5);
    int _670 = as_type<int>(_668);
    int _672 = _660 ? (-1) : 0;
    if (_624)
    {
        int _674 = _660 ? 0 : 1078530011;
        _656 = _674;
    }
    int _676 = _656;
    float _678 = fma(_662, _664, _662);
    float _680 = fma(_648, _524, _666);
    float _682 = _668 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_624)
    {
        int _684 = int(0x80000000) & as_type<int>(_574);
        int _686 = _676 | _684;
        _670 = _686;
    }
    int _688 = _670;
    bool _690 = !_600;
    bool _692 = _690 && _646;
    int _694 = _688;
    float _696 = as_type<float>(_688);
    if (!_692)
    {
        float _698 = abs(_574);
        bool _700 = _698 != as_type<float>(0x7f800000u /* inf */);
        bool _702 = isnan(_698);
        bool _704 = _700 || _702;
        bool _706 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _708 = _704 || _706;
        float _710 = abs(_586);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        float _714 = abs(_586);
        bool _716 = _714 == as_type<float>(0x7f800000u /* inf */);
        bool _718 = !_708;
        bool _720 = _716 && _718;
        if (_720)
        {
            bool _722 = as_type<int>(_586) >= 0;
            _672 = _722 ? (-1) : 0;
        }
        int _724 = _672;
        if (_720)
        {
            _694 = 1075235812;
        }
        int _726 = _694;
        int _728 = _726;
        if (_720)
        {
            int _730 = ~_724;
            int _732 = (_730 != 0) ? _726 : 1061752795;
            _728 = _732;
        }
        int _734 = _728;
        float _736 = as_type<float>(_734);
        if (_720)
        {
            int _738 = int(0x80000000) & as_type<int>(_574);
            int _740 = _734 | _738;
            _736 = as_type<float>(_740);
        }
        float _742 = _736;
        bool _744 = !_708;
        bool _746 = _744 && _712;
        _696 = _742;
        if (!_746)
        {
            float _748 = abs(_574);
            float _750 = abs(_586);
            float _752 = precise::max(_748, _750);
            float _754 = abs(_574);
            float _756 = abs(_586);
            float _758 = precise::min(_754, _756);
            float _760 = 1.0 / _752;
            float _762 = abs(_574);
            float _764 = abs(_586);
            bool _766 = _762 > _764;
            bool _768 = as_type<int>(_586) >= 0;
            float _770 = abs(_574);
            float _772 = abs(_586);
            float _774 = _770 + _772;
            int _776 = as_type<int>(_574) & int(0x80000000);
            bool _778 = _774 > as_type<float>(0x7f800000u /* inf */);
            bool _780 = isnan(_774);
            bool _782 = _778 || _780;
            bool _784 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _786 = _782 || _784;
            float _788 = _758 * _760;
            float _790 = _788 * _788;
            float _792 = _790 + 11.33538818359375;
            float _794 = fma(_790, _792, 28.84246826171875);
            float _796 = fma(_790, _794, 19.6966705322265625);
            float _798 = fma(_790, -0.82336294651031494140625, -5.674867153167724609375);
            float _800 = fma(_790, _798, -6.565555095672607421875);
            float _802 = 1.0 / _796;
            float _804 = _790 * _800;
            float _806 = _788 * _804;
            float _808 = fma(_806, _802, _788);
            float _810 = _808;
            _696 = _774;
            if (_766)
            {
                float _812 = -_808;
                float _814 = _812 + 1.57079637050628662109375;
                _810 = _814;
            }
            float _816 = _810;
            int _818 = as_type<int>(_816);
            if (!_768)
            {
                float _820 = -_816;
                float _822 = _820 + 3.1415927410125732421875;
                _818 = as_type<int>(_822);
            }
            int _824 = _818;
            if (!_786)
            {
                int _826 = _776 | _824;
                _696 = as_type<float>(_826);
            }
        }
    }
    float _828 = _696;
    float _830 = fma(_678, _524, _682);
    float _832 = _680 + _828;
    float _834 = in.m_32.x;
    float _836 = in.m_32.y;
    float _838 = in.m_32.z;
    float _840 = _608 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _842 = _832 * 0.15915493667125701904296875;
    float _844 = in.m_41.w;
    float _846 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _850 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = _830 * 0.15915493667125701904296875;
    float _860 = _612 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _862 = _848 * _850;
    float _864 = in.m_45.x;
    float _866 = in.m_45.y;
    float _868 = in.m_45.z;
    float _870 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _872 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _874 = _588 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = in.m_47.x;
    float _880 = in.m_47.y;
    float _882 = in.m_47.z;
    float _884 = _610 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    bool _888 = _152 > 0.5;
    float _890 = in.m_49.x;
    float _892 = in.m_49.y;
    float _894 = in.m_49.z;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _898 = _144 > 0.5;
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_410, _836, _870);
    float _906 = fma(_410, _834, _846);
    float _908 = fma(_410, _838, _872);
    float _910 = _886 * _896;
    float _912 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _842 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_904, _844, _854);
    float _920 = fma(_906, _844, _852);
    float _922 = fma(_908, _844, _856);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _630);
    float _926 = _918 * _866;
    float _928 = _842 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _918 * _880;
    float _934 = fma(_920, _864, _926);
    float _936 = _924 * _912;
    float _938 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _938;
    float _942 = _918 * _892;
    float _944 = fma(_920, _878, _932);
    float _946 = fma(_922, _868, _934);
    float _948 = _858 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_920, _890, _942);
    float _954 = fma(_922, _882, _944);
    float _956 = _876 * _902;
    float _958 = _616 * _916;
    float _960 = fma(_922, _894, _952);
    float _962 = _876 * _916;
    float _964 = _916 * _902;
    float _966 = _876 * _930;
    float _968 = _616 * _930;
    float _970 = _930 * _902;
    float _972 = _956 * _910;
    float _974 = _616 * _902;
    float _976 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = in.m_51.y;
    float _980 = fma(_950, _966, _958);
    float _982 = -_962;
    float _984 = fma(_950, _968, _982);
    float _986 = -_910;
    float _988 = _950 * _986;
    float _990 = -_968;
    float _992 = fma(_950, _962, _990);
    float _994 = fma(_980, _862, _972);
    float _996 = _974 * _910;
    float _998 = fma(_970, _862, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1000;
    float _1004 = fma(_992, _936, _994);
    float _1006 = _946 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = fma(_964, _936, _998);
    float _1010 = fma(_950, _958, _966);
    float _1012 = _1004 + _976;
    float _1014 = fma(_984, _862, _996);
    float _1016 = _1008 + _1006;
    float _1018 = abs(_1002);
    float _1020 = abs(_940);
    float _1022 = precise::max(_1018, _1020);
    float _1024 = -_1012;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1028 = fma(_1010, _936, _1014);
    float _1030 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1032 = in.m_39.w;
    bool _1034 = _1022 >= 16.0;
    float _1036 = -_1016;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1040 = _1026 * _1026;
    float _1042 = _1028 + _1030;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1038, _1038, _1040);
    float _1048 = -_1042;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1054 = _1052 != 0;
    float _1056 = in.m_51.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = fma(_1050, _1050, _1046);
    float _1064 = -_978;
    float _1066 = _1064 + 1.0;
    float _1068 = _1002;
    float _1070 = _940;
    float _1072 = _978;
    bool _1074 = _1054;
    int _1076 = as_type<int>(_906);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1034)
    {
        float _1080 = _1002 * 0.0625;
        _1068 = _1080;
    }
    float _1082 = _1068;
    float _1084 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1086 = sqrt(_1062);
    int _1088 = _888 ? as_type<int>(_1066) : as_type<int>(_978);
    if (_1034)
    {
        float _1090 = _940 * 0.0625;
        _1070 = _1090;
    }
    float _1092 = _1070;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1096 = _1094 != 0;
    float _1098 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1100 = _898 ? as_type<int>(_1066) : as_type<int>(_978);
    float _1102 = _1060 ? as_type<float>(_1088) : _978;
    float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1106 = _1032 > 0.5;
    float _1108 = _1096 ? as_type<float>(_1100) : _978;
    float _1110 = fma(_1098, _1102, -0.5);
    if (_1054)
    {
        float _1112 = _1106 ? _1066 : _978;
        _1072 = _1112;
    }
    float _1114 = _1072;
    float _1116 = _1084 * 3.2999999523162841796875;
    float _1118 = abs(_1082);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = fma(_1086, 13.0, _1116);
    float _1138 = abs(_1092);
    bool _1140 = _1138 == 0.0;
    bool _1142 = !_1128;
    bool _1144 = _1140 && _1142;
    float _1146 = _1130 * 7.30000019073486328125;
    float _1148 = abs(_1092);
    bool _1150 = _1148 == 0.0;
    float _1152 = _1136 * 0.01745329238474369049072265625;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1156 = fma(_1086, 22.299999237060546875, _1146);
    float _1158 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1160 = _1152 * 0.15915493667125701904296875;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_53.x;
    float _1168 = in.m_53.y;
    float _1170 = in.m_53.z;
    float _1172 = _1156 * 0.01745329238474369049072265625;
    bool _1174 = _1128;
    if (_1134)
    {
        bool _1176 = _138 > 0.5;
        _518 = _1176 ? (-1) : 0;
    }
    int _1178 = _518;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1182 = _1178;
    if (_1144)
    {
        bool _1184 = as_type<int>(_1092) >= 0;
        _1074 = _1184;
    }
    bool _1186 = _1074;
    float _1188 = _1172 * 0.15915493667125701904296875;
    float _1190 = fma(_1108, _1158, -0.5);
    if (_1144)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1076 = _1192;
    }
    int _1194 = _1076;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1198 = _1196 != 0;
    float _1200 = _1160 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1194;
    if (_1144)
    {
        int _1206 = int(0x80000000) & as_type<int>(_1082);
        int _1208 = _1194 | _1206;
        _1204 = _1208;
    }
    int _1210 = _1204;
    bool _1212 = _628 != 0.0;
    bool _1214 = isnan(_628);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    int _1222 = _1210;
    float _1224 = as_type<float>(_1210);
    float _1226 = _1056;
    if (!_1134)
    {
        _1078 = _1056;
    }
    float _1228 = _1078;
    bool _1230 = _626 == 0.0;
    bool _1232 = !_1220;
    bool _1234 = _1230 && _1232;
    float _1236 = _1188 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = _630 == 0.0;
    bool _1242 = _1240 && _1234;
    bool _1244 = !_1128;
    bool _1246 = _1244 && _1150;
    float _1248 = _1168;
    float _1250 = _1166;
    float _1252 = _1170;
    float _1254 = _1228;
    if (!_1246)
    {
        float _1256 = abs(_1082);
        bool _1258 = _1256 != as_type<float>(0x7f800000u /* inf */);
        bool _1260 = isnan(_1256);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1266 = _1262 || _1264;
        float _1268 = abs(_1092);
        bool _1270 = _1268 == as_type<float>(0x7f800000u /* inf */);
        bool _1272 = !_1266;
        bool _1274 = _1270 && _1272;
        _1174 = _1266;
        if (_1274)
        {
            _1222 = 1075235812;
        }
        int _1276 = _1222;
        int _1278 = _1276;
        if (_1274)
        {
            bool _1280 = as_type<int>(_1092) >= 0;
            _1182 = _1280 ? (-1) : 0;
        }
        int _1282 = _1182;
        if (_1274)
        {
            int _1284 = ~_1282;
            int _1286 = (_1284 != 0) ? _1276 : 1061752795;
            _1278 = _1286;
        }
        int _1288 = _1278;
        float _1290 = as_type<float>(_1288);
        if (_1274)
        {
            int _1292 = int(0x80000000) & as_type<int>(_1082);
            int _1294 = _1288 | _1292;
            _1290 = as_type<float>(_1294);
        }
        float _1296 = _1290;
        float _1298 = abs(_1092);
        bool _1300 = _1298 == as_type<float>(0x7f800000u /* inf */);
        bool _1302 = !_1266;
        bool _1304 = _1302 && _1300;
        _1224 = _1296;
        if (!_1304)
        {
            float _1306 = abs(_1082);
            float _1308 = abs(_1092);
            float _1310 = precise::max(_1306, _1308);
            float _1312 = abs(_1082);
            float _1314 = abs(_1092);
            float _1316 = precise::min(_1312, _1314);
            float _1318 = 1.0 / _1310;
            float _1320 = abs(_1082);
            float _1322 = abs(_1092);
            bool _1324 = _1320 > _1322;
            float _1326 = _1316 * _1318;
            float _1328 = _1326 * _1326;
            float _1330 = _1328 + 11.33538818359375;
            float _1332 = fma(_1328, _1330, 28.84246826171875);
            float _1334 = fma(_1328, _1332, 19.6966705322265625);
            float _1336 = fma(_1328, -0.82336294651031494140625, -5.674867153167724609375);
            float _1338 = fma(_1328, _1336, -6.565555095672607421875);
            float _1340 = 1.0 / _1334;
            float _1342 = _1328 * _1338;
            float _1344 = _1326 * _1342;
            float _1346 = fma(_1344, _1340, _1326);
            float _1348 = abs(_1082);
            float _1350 = abs(_1092);
            float _1352 = _1348 + _1350;
            float _1354 = _1346;
            _1224 = _1352;
            if (_1324)
            {
                float _1356 = -_1346;
                float _1358 = _1356 + 1.57079637050628662109375;
                _1354 = _1358;
            }
            float _1360 = _1354;
            bool _1362 = as_type<int>(_1092) >= 0;
            int _1364 = as_type<int>(_1082) & int(0x80000000);
            int _1366 = as_type<int>(_1360);
            if (!_1362)
            {
                float _1368 = -_1360;
                float _1370 = _1368 + 3.1415927410125732421875;
                _1366 = as_type<int>(_1370);
            }
            int _1372 = _1366;
            bool _1374 = _1352 > as_type<float>(0x7f800000u /* inf */);
            bool _1376 = isnan(_1352);
            bool _1378 = _1374 || _1376;
            bool _1380 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1382 = _1378 || _1380;
            _1174 = _1382;
            if (!_1382)
            {
                int _1384 = _1364 | _1372;
                _1224 = as_type<float>(_1384);
            }
        }
    }
    float _1386 = _1224;
    bool _1388 = _1174;
    bool _1390 = _1388;
    if (!_1242)
    {
        float _1392 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1168);
        _1248 = _1392;
    }
    float _1394 = _1248;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1242)
    {
        float _1398 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1166);
        _1250 = _1398;
    }
    float _1400 = _1250;
    float _1402 = -_1394;
    float _1404 = _950 * _1402;
    float _1406 = fma(_1086, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    if (!_1242)
    {
        float _1410 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1252 = _1410;
    }
    float _1412 = _1252;
    float _1414 = _1386 * (-0.15915493667125701904296875);
    float _1416 = fma(_970, _1400, _1404);
    float _1418 = fma(_1408, -2.0, 3.0);
    float _1420 = _1408 * _1408;
    float _1422 = _1202 + _1238;
    float _1424 = _974 * _1394;
    float _1426 = fma(_964, _1412, _1416);
    float _1428 = _1414 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1418 * _1420;
    float _1434 = _1422 * 0.100000001490116119384765625;
    float _1436 = fma(_984, _1400, _1424);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1440 = as_type<int>(_1434);
    int _1442 = as_type<int>(_1420);
    if (_1134)
    {
        bool _1444 = _138 > 0.5;
        _1390 = _1444;
    }
    bool _1446 = _1390;
    float _1448 = _1432 * _1434;
    float _1450 = -_450;
    float _1452 = fma(_494, _1110, _1450);
    float _1454 = _1414 * 6.283185482025146484375;
    float _1456 = cos(_1454);
    float _1458 = fma(_1010, _1412, _1436);
    float _1460 = fma(_1426, _1448, _1016);
    if (_1134)
    {
        float _1462 = -_1056;
        float _1464 = _1462 + 1.0;
        _1440 = as_type<int>(_1464);
    }
    int _1466 = _1440;
    float _1468 = as_type<float>(_1466);
    if (_1164)
    {
        float _1470 = -_1056;
        float _1472 = _1470 + 1.0;
        _520 = as_type<int>(_1472);
    }
    int _1474 = _520;
    float _1476 = fma(_1458, _1448, _1042);
    float _1478 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1480 = _1460 + _1478;
    bool _1482 = _144 > 0.5;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1486 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1488 = _1476 + _1486;
    float _1490 = _1430 * _1480;
    if (_1134)
    {
        float _1492 = _1446 ? as_type<float>(_1466) : _1056;
        _1254 = _1492;
    }
    float _1494 = _1254;
    if (_1198)
    {
        float _1496 = -_1056;
        float _1498 = _1496 + 1.0;
        _1442 = as_type<int>(_1498);
    }
    int _1500 = _1442;
    bool _1502 = _152 > 0.5;
    float _1504 = -_514;
    float _1506 = fma(_498, _1190, _1504);
    float _1508 = in.m_55.w;
    float _1510 = _1456 * _1480;
    float _1512 = -_1490;
    float _1514 = fma(_1456, _1488, _1512);
    if (!_1164)
    {
        _1468 = _1056;
    }
    float _1516 = _1468;
    float _1518 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1520 = fma(_1430, _1488, _1510);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1524 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1526 = _1516;
    if (_1164)
    {
        float _1528 = _1482 ? as_type<float>(_1474) : _1056;
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1536 = _1522 + _1534;
    if (_1198)
    {
        float _1538 = _1502 ? as_type<float>(_1500) : _1056;
        _1226 = _1538;
    }
    float _1540 = _1226;
    float _1542 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1546 = _1532 + _1544;
    float _1548 = _1536 * _1536;
    float _1550 = fma(_1524, _1494, -0.5);
    float _1552 = fma(_1518, _1530, -0.5);
    float _1554 = fma(_1542, _1540, -0.5);
    float _1556 = fma(_1546, _1546, _1548);
    float _1558 = fma(_492, _1550, _432);
    float _1560 = _1506 + 0.5;
    float _1562 = fma(_496, _1554, _504);
    float _1564 = sqrt(_1556);
    float _1566 = _956 * _1394;
    out.m_57.w = _1508;
    float _1568 = _1562 + 0.5;
    float _1570 = fma(_1438, _1114, -0.5);
    float _1572 = fma(_980, _1400, _1566);
    float _1574 = fma(_452, _1552, _508);
    float _1576 = _1452 + 0.5;
    out.m_59.x = _1568;
    out.m_59.y = _1560;
    float _1578 = -_512;
    float _1580 = fma(_510, _1570, _1578);
    float _1582 = fma(_992, _1412, _1572);
    float _1584 = _1558 + 0.5;
    float _1586 = _1574 + 0.5;
    float _1588 = _1580 + 0.5;
    float _1590 = _1426 * _1430;
    float _1592 = fma(_1582, _1448, _1012);
    bool _1594 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1426 * _1456;
    out.m_61.x = _1584;
    out.m_61.y = _1576;
    out.m_61.z = _1586;
    out.m_61.w = _1588;
    float _1598 = -_1590;
    float _1600 = fma(_1458, _1456, _1598);
    float _1602 = fma(_1458, _1430, _1596);
    float _1604 = _1584;
    float _1606 = _1586;
    float _1608 = _1576;
    if (!_1594)
    {
        _1604 = _1532;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    if (!_1594)
    {
        _1606 = _1522;
    }
    float _1614 = _1606;
    float _1616 = _1614;
    if (!_1594)
    {
        _1608 = _1592;
    }
    float _1618 = _1608;
    bool _1620 = !_1594;
    float _1622 = _1618;
    if (!_1620)
    {
        float _1624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1628 = _1564 + _1626;
        float _1630 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = rsqrt(_1556);
        float _1634 = _1628 * _1624;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1636 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 + (-1.0);
        float _1648 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1650 = fma(_1644, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = fma(_1592, _1640, _1648);
        float _1654 = _1632 * _1650;
        float _1656 = fma(_1546, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = fma(_1536, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1622 = _1652;
        _1612 = _1656;
        _1616 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1612;
    float _1664 = _1616;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1668);
    float _1678 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1670);
    out.m_63.x = _1602;
    out.m_63.y = _1582;
    out.m_63.z = _1600;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1674);
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1684 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1686 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1704 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1702);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1714 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1718 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1720 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1716);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1718);
    float _1728 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1720);
    out.m_65.x = _1662;
    out.m_65.y = _1660;
    out.m_65.z = _1664;
    float _1730 = _1724 + _1728;
    float _1732 = _1726 + _1728;
    float _1734 = _1728 * 0.5;
    float _1736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1738 = _1730 * 0.5;
    float _1740 = _1732 * 0.5;
    float _1742 = fma(_1722, -0.5, _1734);
    out.m_37.x = _1736;
    out.gl_Position.x = _1724;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1728;
    out.m_67.x = _1738;
    out.m_67.y = _1742;
    out.m_67.z = _1740;
    out.m_67.w = _1728;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_88);
    float _102 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1810 = as_type<float>(_110);
        out.gl_Position.z = _1810;
    }
    if (!_96)
    {
        return out;
    }
    bool _114 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_83);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_88);
    bool _126 = _92 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    if (_130)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _100;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _112 = as_type<int>(_134);
    }
    int _136 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_136);
        out.gl_Position.z = _1865;
    }
    if (_130)
    {
        return out;
    }
    float _138 = in.m_39.x;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = in.m_39.z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _148 = _146 != 0;
    float _150 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_39.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _162 = _138 * 2.0;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _166 = _144 * 2.0;
    float _168 = floor(_162);
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _174 = _152 * 2.0;
    float _176 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _178 = floor(_166);
    float _180 = fma(_176, -2.0, _154);
    float _182 = _152 + _138;
    float _184 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _186 = -_156;
    float _188 = fma(_184, 2.0, _186);
    float _190 = floor(_174);
    bool _192 = _168 > 0.0;
    bool _194 = _168 >= 0.0;
    bool _196 = isnan(_168);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    float _204 = _184;
    float _206 = _150;
    if (_148)
    {
        _204 = _138;
    }
    float _208 = _204;
    float _210 = _208;
    if (!_148)
    {
        _210 = _144;
    }
    float _212 = _210;
    bool _214 = _178 > 0.0;
    bool _216 = _178 >= 0.0;
    bool _218 = isnan(_178);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _228 = _178;
    float _230 = _226;
    if (!_148)
    {
        _228 = _152;
    }
    float _232 = _228;
    float _234 = _232;
    if (_148)
    {
        _234 = _138;
    }
    float _236 = _234;
    float _238 = -_158;
    float _240 = fma(_226, 2.0, _238);
    bool _242 = _190 > 0.0;
    bool _244 = _190 >= 0.0;
    bool _246 = isnan(_190);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _182 + (-1.0);
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _258 = _202 ? 0 : 1;
    float _260 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[83].z, _256);
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _266 = ~_258;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    if (!_192)
    {
        int _274 = ~_258;
        int _276 = _274 + 1;
        _272 = _276;
    }
    int _278 = _272;
    float _280 = -_160;
    float _282 = fma(_264, 2.0, _280);
    bool _284 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _288 = _284 || _286;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    if (!_148)
    {
        _230 = _144;
    }
    float _294 = _230;
    float _296 = _224 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _298 = _294;
    float _300 = _296;
    if (_148)
    {
        _298 = _152;
    }
    float _302 = _298;
    int _304 = ~as_type<int>(_296);
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    float _312 = _302;
    if (!_214)
    {
        int _314 = ~as_type<int>(_296);
        int _316 = _314 + 1;
        _310 = _316;
    }
    int _318 = _310;
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[83].w, _164);
    if (!_148)
    {
        _300 = _144;
    }
    float _322 = _300;
    float _324 = 0.0;
    float _326 = _322;
    if (!_292)
    {
        float _328 = _150 * _150;
        float _330 = _328 * 0.5;
        _324 = _330;
    }
    float _332 = _324;
    float _334 = _332;
    if (_148)
    {
        _312 = _152;
    }
    float _336 = _312;
    float _338 = _336;
    if (_148)
    {
        _326 = _152;
    }
    float _340 = _326;
    if (!_292)
    {
        float _342 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _342;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_148)
    {
        _338 = _138;
    }
    float _348 = _338;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _354 = !_292;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _150 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _150);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _384;
    }
    float _386 = _346;
    bool _388 = !_292;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _150 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _206 = _408;
    }
    float _410 = _206;
    float _412 = _142 * _92;
    float _414 = fma(_350, -2.0, _170);
    float _416 = fma(_352, -2.0, _172);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = -_92;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _188);
    float _434 = exp2(_412);
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    float _450 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[76].y, _180);
    float _452 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].z, _262);
    float _454 = 1.0 / _448;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _474 = !_420;
    int _476 = _474 ? 0 : 1;
    float _478 = -_434;
    float _480 = _478 + 1.0;
    float _482 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _456);
    float _484 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _486 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _470);
    float _488 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _472);
    float _490 = _466 ? _480 : 0.0;
    float _492 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].z, _482);
    float _494 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].w, _484);
    float _496 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].z, _486);
    float _498 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].w, _488);
    int _500 = abs(_476);
    float _502 = -_92;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[86].x, _240);
    float _506 = -_92;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _510 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].w, _320);
    float _512 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[81].y, _414);
    float _514 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[86].y, _416);
    bool _516 = _466;
    int _518 = _428 ? (-1) : 0;
    int _520 = as_type<int>(_450);
    if (_444)
    {
        float _522 = _490 * _454;
        _102 = _522;
    }
    float _524 = _102;
    int _526 = _252 ? 0 : 1;
    float _528 = float(_318);
    float _530 = float(_500);
    float _532 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _534 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _536 = precise::max(_532, _534);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _540 = ~_526;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = _530 * _528;
    int _548 = _544;
    if (!_242)
    {
        int _550 = ~_526;
        int _552 = _550 + 1;
        _548 = _552;
    }
    int _554 = _548;
    float _556 = _138 + (-0.5);
    float _558 = _546 * (-2.0);
    bool _560 = !_424;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _566 = _536 >= 16.0;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _570 = abs(_562);
    float _572 = fma(_260, _558, _260);
    float _574 = _566 ? _538 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _576 = _152 + _144;
    float _578 = float(_278);
    float _580 = fma(_572, _524, _564);
    float _582 = float(_570);
    float _584 = _576 + (-1.0);
    float _586 = _566 ? _568 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _588 = _580 * 0.15915493667125701904296875;
    float _590 = abs(_574);
    bool _592 = _590 != 0.0;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _582 * _578;
    bool _604 = !_428;
    int _606 = _604 ? 0 : 1;
    float _608 = in.m_41.x;
    float _610 = in.m_41.y;
    float _612 = in.m_41.z;
    float _614 = _588 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = abs(_586);
    bool _620 = _618 == 0.0;
    bool _622 = !_600;
    bool _624 = _620 && _622;
    float _626 = in.m_43.x;
    float _628 = in.m_43.y;
    float _630 = in.m_43.z;
    int _632 = abs(_606);
    float _634 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _636 = float(_554);
    float _638 = _602 * (-2.0);
    float _640 = float(_632);
    float _642 = _144 + _138;
    float _644 = abs(_586);
    bool _646 = _644 == 0.0;
    float _648 = fma(_634, _638, _634);
    float _650 = _642 + (-1.0);
    float _652 = _640 * _636;
    float _654 = _152 + (-0.5);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    if (_624)
    {
        bool _658 = as_type<int>(_586) >= 0;
        _516 = _658;
    }
    bool _660 = _516;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = _652 * (-2.0);
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _668 = _144 + (-0.5);
    int _670 = as_type<int>(_668);
    int _672 = _660 ? (-1) : 0;
    if (_624)
    {
        int _674 = _660 ? 0 : 1078530011;
        _656 = _674;
    }
    int _676 = _656;
    float _678 = fma(_662, _664, _662);
    float _680 = fma(_648, _524, _666);
    float _682 = _668 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_624)
    {
        int _684 = int(0x80000000) & as_type<int>(_574);
        int _686 = _676 | _684;
        _670 = _686;
    }
    int _688 = _670;
    bool _690 = !_600;
    bool _692 = _690 && _646;
    int _694 = _688;
    float _696 = as_type<float>(_688);
    if (!_692)
    {
        float _698 = abs(_574);
        bool _700 = _698 != as_type<float>(0x7f800000u /* inf */);
        bool _702 = isnan(_698);
        bool _704 = _700 || _702;
        bool _706 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _708 = _704 || _706;
        float _710 = abs(_586);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        float _714 = abs(_586);
        bool _716 = _714 == as_type<float>(0x7f800000u /* inf */);
        bool _718 = !_708;
        bool _720 = _716 && _718;
        if (_720)
        {
            bool _722 = as_type<int>(_586) >= 0;
            _672 = _722 ? (-1) : 0;
        }
        int _724 = _672;
        if (_720)
        {
            _694 = 1075235812;
        }
        int _726 = _694;
        int _728 = _726;
        if (_720)
        {
            int _730 = ~_724;
            int _732 = (_730 != 0) ? _726 : 1061752795;
            _728 = _732;
        }
        int _734 = _728;
        float _736 = as_type<float>(_734);
        if (_720)
        {
            int _738 = int(0x80000000) & as_type<int>(_574);
            int _740 = _734 | _738;
            _736 = as_type<float>(_740);
        }
        float _742 = _736;
        bool _744 = !_708;
        bool _746 = _744 && _712;
        _696 = _742;
        if (!_746)
        {
            float _748 = abs(_574);
            float _750 = abs(_586);
            float _752 = precise::max(_748, _750);
            float _754 = abs(_574);
            float _756 = abs(_586);
            float _758 = precise::min(_754, _756);
            float _760 = 1.0 / _752;
            float _762 = abs(_574);
            float _764 = abs(_586);
            bool _766 = _762 > _764;
            bool _768 = as_type<int>(_586) >= 0;
            float _770 = abs(_574);
            float _772 = abs(_586);
            float _774 = _770 + _772;
            int _776 = as_type<int>(_574) & int(0x80000000);
            bool _778 = _774 > as_type<float>(0x7f800000u /* inf */);
            bool _780 = isnan(_774);
            bool _782 = _778 || _780;
            bool _784 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _786 = _782 || _784;
            float _788 = _758 * _760;
            float _790 = _788 * _788;
            float _792 = _790 + 11.33538818359375;
            float _794 = fma(_790, _792, 28.84246826171875);
            float _796 = fma(_790, _794, 19.6966705322265625);
            float _798 = fma(_790, -0.82336294651031494140625, -5.674867153167724609375);
            float _800 = fma(_790, _798, -6.565555095672607421875);
            float _802 = 1.0 / _796;
            float _804 = _790 * _800;
            float _806 = _788 * _804;
            float _808 = fma(_806, _802, _788);
            float _810 = _808;
            _696 = _774;
            if (_766)
            {
                float _812 = -_808;
                float _814 = _812 + 1.57079637050628662109375;
                _810 = _814;
            }
            float _816 = _810;
            int _818 = as_type<int>(_816);
            if (!_768)
            {
                float _820 = -_816;
                float _822 = _820 + 3.1415927410125732421875;
                _818 = as_type<int>(_822);
            }
            int _824 = _818;
            if (!_786)
            {
                int _826 = _776 | _824;
                _696 = as_type<float>(_826);
            }
        }
    }
    float _828 = _696;
    float _830 = fma(_678, _524, _682);
    float _832 = _680 + _828;
    float _834 = in.m_32.x;
    float _836 = in.m_32.y;
    float _838 = in.m_32.z;
    float _840 = _608 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _842 = _832 * 0.15915493667125701904296875;
    float _844 = in.m_41.w;
    float _846 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _850 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = _830 * 0.15915493667125701904296875;
    float _860 = _612 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _862 = _848 * _850;
    float _864 = in.m_45.x;
    float _866 = in.m_45.y;
    float _868 = in.m_45.z;
    float _870 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _872 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _874 = _588 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = in.m_47.x;
    float _880 = in.m_47.y;
    float _882 = in.m_47.z;
    float _884 = _610 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    bool _888 = _152 > 0.5;
    float _890 = in.m_49.x;
    float _892 = in.m_49.y;
    float _894 = in.m_49.z;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _898 = _144 > 0.5;
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_410, _836, _870);
    float _906 = fma(_410, _834, _846);
    float _908 = fma(_410, _838, _872);
    float _910 = _886 * _896;
    float _912 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _842 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_904, _844, _854);
    float _920 = fma(_906, _844, _852);
    float _922 = fma(_908, _844, _856);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _630);
    float _926 = _918 * _866;
    float _928 = _842 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _918 * _880;
    float _934 = fma(_920, _864, _926);
    float _936 = _924 * _912;
    float _938 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _938;
    float _942 = _918 * _892;
    float _944 = fma(_920, _878, _932);
    float _946 = fma(_922, _868, _934);
    float _948 = _858 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_920, _890, _942);
    float _954 = fma(_922, _882, _944);
    float _956 = _876 * _902;
    float _958 = _616 * _916;
    float _960 = fma(_922, _894, _952);
    float _962 = _876 * _916;
    float _964 = _916 * _902;
    float _966 = _876 * _930;
    float _968 = _616 * _930;
    float _970 = _930 * _902;
    float _972 = _956 * _910;
    float _974 = _616 * _902;
    float _976 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = in.m_51.y;
    float _980 = fma(_950, _966, _958);
    float _982 = -_962;
    float _984 = fma(_950, _968, _982);
    float _986 = -_910;
    float _988 = _950 * _986;
    float _990 = -_968;
    float _992 = fma(_950, _962, _990);
    float _994 = fma(_980, _862, _972);
    float _996 = _974 * _910;
    float _998 = fma(_970, _862, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1000;
    float _1004 = fma(_992, _936, _994);
    float _1006 = _946 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = fma(_964, _936, _998);
    float _1010 = fma(_950, _958, _966);
    float _1012 = _1004 + _976;
    float _1014 = fma(_984, _862, _996);
    float _1016 = _1008 + _1006;
    float _1018 = abs(_1002);
    float _1020 = abs(_940);
    float _1022 = precise::max(_1018, _1020);
    float _1024 = -_1012;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1028 = fma(_1010, _936, _1014);
    float _1030 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1032 = in.m_39.w;
    bool _1034 = _1022 >= 16.0;
    float _1036 = -_1016;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1040 = _1026 * _1026;
    float _1042 = _1028 + _1030;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1038, _1038, _1040);
    float _1048 = -_1042;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1054 = _1052 != 0;
    float _1056 = in.m_51.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = fma(_1050, _1050, _1046);
    float _1064 = -_978;
    float _1066 = _1064 + 1.0;
    float _1068 = _1002;
    float _1070 = _940;
    float _1072 = _978;
    bool _1074 = _1054;
    int _1076 = as_type<int>(_906);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1034)
    {
        float _1080 = _1002 * 0.0625;
        _1068 = _1080;
    }
    float _1082 = _1068;
    float _1084 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1086 = sqrt(_1062);
    int _1088 = _888 ? as_type<int>(_1066) : as_type<int>(_978);
    if (_1034)
    {
        float _1090 = _940 * 0.0625;
        _1070 = _1090;
    }
    float _1092 = _1070;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1096 = _1094 != 0;
    float _1098 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1100 = _898 ? as_type<int>(_1066) : as_type<int>(_978);
    float _1102 = _1060 ? as_type<float>(_1088) : _978;
    float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1106 = _1032 > 0.5;
    float _1108 = _1096 ? as_type<float>(_1100) : _978;
    float _1110 = fma(_1098, _1102, -0.5);
    if (_1054)
    {
        float _1112 = _1106 ? _1066 : _978;
        _1072 = _1112;
    }
    float _1114 = _1072;
    float _1116 = _1084 * 3.2999999523162841796875;
    float _1118 = abs(_1082);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = fma(_1086, 13.0, _1116);
    float _1138 = abs(_1092);
    bool _1140 = _1138 == 0.0;
    bool _1142 = !_1128;
    bool _1144 = _1140 && _1142;
    float _1146 = _1130 * 7.30000019073486328125;
    float _1148 = abs(_1092);
    bool _1150 = _1148 == 0.0;
    float _1152 = _1136 * 0.01745329238474369049072265625;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1156 = fma(_1086, 22.299999237060546875, _1146);
    float _1158 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1160 = _1152 * 0.15915493667125701904296875;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_53.x;
    float _1168 = in.m_53.y;
    float _1170 = in.m_53.z;
    float _1172 = _1156 * 0.01745329238474369049072265625;
    bool _1174 = _1128;
    if (_1134)
    {
        bool _1176 = _138 > 0.5;
        _518 = _1176 ? (-1) : 0;
    }
    int _1178 = _518;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1182 = _1178;
    if (_1144)
    {
        bool _1184 = as_type<int>(_1092) >= 0;
        _1074 = _1184;
    }
    bool _1186 = _1074;
    float _1188 = _1172 * 0.15915493667125701904296875;
    float _1190 = fma(_1108, _1158, -0.5);
    if (_1144)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1076 = _1192;
    }
    int _1194 = _1076;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1198 = _1196 != 0;
    float _1200 = _1160 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1194;
    if (_1144)
    {
        int _1206 = int(0x80000000) & as_type<int>(_1082);
        int _1208 = _1194 | _1206;
        _1204 = _1208;
    }
    int _1210 = _1204;
    bool _1212 = _628 != 0.0;
    bool _1214 = isnan(_628);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    int _1222 = _1210;
    float _1224 = as_type<float>(_1210);
    float _1226 = _1056;
    if (!_1134)
    {
        _1078 = _1056;
    }
    float _1228 = _1078;
    bool _1230 = _626 == 0.0;
    bool _1232 = !_1220;
    bool _1234 = _1230 && _1232;
    float _1236 = _1188 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = _630 == 0.0;
    bool _1242 = _1240 && _1234;
    bool _1244 = !_1128;
    bool _1246 = _1244 && _1150;
    float _1248 = _1168;
    float _1250 = _1166;
    float _1252 = _1170;
    float _1254 = _1228;
    if (!_1246)
    {
        float _1256 = abs(_1082);
        bool _1258 = _1256 != as_type<float>(0x7f800000u /* inf */);
        bool _1260 = isnan(_1256);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1266 = _1262 || _1264;
        float _1268 = abs(_1092);
        bool _1270 = _1268 == as_type<float>(0x7f800000u /* inf */);
        bool _1272 = !_1266;
        bool _1274 = _1270 && _1272;
        _1174 = _1266;
        if (_1274)
        {
            _1222 = 1075235812;
        }
        int _1276 = _1222;
        int _1278 = _1276;
        if (_1274)
        {
            bool _1280 = as_type<int>(_1092) >= 0;
            _1182 = _1280 ? (-1) : 0;
        }
        int _1282 = _1182;
        if (_1274)
        {
            int _1284 = ~_1282;
            int _1286 = (_1284 != 0) ? _1276 : 1061752795;
            _1278 = _1286;
        }
        int _1288 = _1278;
        float _1290 = as_type<float>(_1288);
        if (_1274)
        {
            int _1292 = int(0x80000000) & as_type<int>(_1082);
            int _1294 = _1288 | _1292;
            _1290 = as_type<float>(_1294);
        }
        float _1296 = _1290;
        float _1298 = abs(_1092);
        bool _1300 = _1298 == as_type<float>(0x7f800000u /* inf */);
        bool _1302 = !_1266;
        bool _1304 = _1302 && _1300;
        _1224 = _1296;
        if (!_1304)
        {
            float _1306 = abs(_1082);
            float _1308 = abs(_1092);
            float _1310 = precise::max(_1306, _1308);
            float _1312 = abs(_1082);
            float _1314 = abs(_1092);
            float _1316 = precise::min(_1312, _1314);
            float _1318 = 1.0 / _1310;
            float _1320 = abs(_1082);
            float _1322 = abs(_1092);
            bool _1324 = _1320 > _1322;
            float _1326 = _1316 * _1318;
            float _1328 = _1326 * _1326;
            float _1330 = _1328 + 11.33538818359375;
            float _1332 = fma(_1328, _1330, 28.84246826171875);
            float _1334 = fma(_1328, _1332, 19.6966705322265625);
            float _1336 = fma(_1328, -0.82336294651031494140625, -5.674867153167724609375);
            float _1338 = fma(_1328, _1336, -6.565555095672607421875);
            float _1340 = 1.0 / _1334;
            float _1342 = _1328 * _1338;
            float _1344 = _1326 * _1342;
            float _1346 = fma(_1344, _1340, _1326);
            float _1348 = abs(_1082);
            float _1350 = abs(_1092);
            float _1352 = _1348 + _1350;
            float _1354 = _1346;
            _1224 = _1352;
            if (_1324)
            {
                float _1356 = -_1346;
                float _1358 = _1356 + 1.57079637050628662109375;
                _1354 = _1358;
            }
            float _1360 = _1354;
            bool _1362 = as_type<int>(_1092) >= 0;
            int _1364 = as_type<int>(_1082) & int(0x80000000);
            int _1366 = as_type<int>(_1360);
            if (!_1362)
            {
                float _1368 = -_1360;
                float _1370 = _1368 + 3.1415927410125732421875;
                _1366 = as_type<int>(_1370);
            }
            int _1372 = _1366;
            bool _1374 = _1352 > as_type<float>(0x7f800000u /* inf */);
            bool _1376 = isnan(_1352);
            bool _1378 = _1374 || _1376;
            bool _1380 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1382 = _1378 || _1380;
            _1174 = _1382;
            if (!_1382)
            {
                int _1384 = _1364 | _1372;
                _1224 = as_type<float>(_1384);
            }
        }
    }
    float _1386 = _1224;
    bool _1388 = _1174;
    bool _1390 = _1388;
    if (!_1242)
    {
        float _1392 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1168);
        _1248 = _1392;
    }
    float _1394 = _1248;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1242)
    {
        float _1398 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1166);
        _1250 = _1398;
    }
    float _1400 = _1250;
    float _1402 = -_1394;
    float _1404 = _950 * _1402;
    float _1406 = fma(_1086, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    if (!_1242)
    {
        float _1410 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1252 = _1410;
    }
    float _1412 = _1252;
    float _1414 = _1386 * (-0.15915493667125701904296875);
    float _1416 = fma(_970, _1400, _1404);
    float _1418 = fma(_1408, -2.0, 3.0);
    float _1420 = _1408 * _1408;
    float _1422 = _1202 + _1238;
    float _1424 = _974 * _1394;
    float _1426 = fma(_964, _1412, _1416);
    float _1428 = _1414 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1418 * _1420;
    float _1434 = _1422 * 0.100000001490116119384765625;
    float _1436 = fma(_984, _1400, _1424);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1440 = as_type<int>(_1434);
    int _1442 = as_type<int>(_1420);
    if (_1134)
    {
        bool _1444 = _138 > 0.5;
        _1390 = _1444;
    }
    bool _1446 = _1390;
    float _1448 = _1432 * _1434;
    float _1450 = -_450;
    float _1452 = fma(_494, _1110, _1450);
    float _1454 = _1414 * 6.283185482025146484375;
    float _1456 = cos(_1454);
    float _1458 = fma(_1010, _1412, _1436);
    float _1460 = fma(_1426, _1448, _1016);
    if (_1134)
    {
        float _1462 = -_1056;
        float _1464 = _1462 + 1.0;
        _1440 = as_type<int>(_1464);
    }
    int _1466 = _1440;
    float _1468 = as_type<float>(_1466);
    if (_1164)
    {
        float _1470 = -_1056;
        float _1472 = _1470 + 1.0;
        _520 = as_type<int>(_1472);
    }
    int _1474 = _520;
    float _1476 = fma(_1458, _1448, _1042);
    float _1478 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1480 = _1460 + _1478;
    bool _1482 = _144 > 0.5;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1486 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1488 = _1476 + _1486;
    float _1490 = _1430 * _1480;
    if (_1134)
    {
        float _1492 = _1446 ? as_type<float>(_1466) : _1056;
        _1254 = _1492;
    }
    float _1494 = _1254;
    if (_1198)
    {
        float _1496 = -_1056;
        float _1498 = _1496 + 1.0;
        _1442 = as_type<int>(_1498);
    }
    int _1500 = _1442;
    bool _1502 = _152 > 0.5;
    float _1504 = -_514;
    float _1506 = fma(_498, _1190, _1504);
    float _1508 = in.m_55.w;
    float _1510 = _1456 * _1480;
    float _1512 = -_1490;
    float _1514 = fma(_1456, _1488, _1512);
    if (!_1164)
    {
        _1468 = _1056;
    }
    float _1516 = _1468;
    float _1518 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1520 = fma(_1430, _1488, _1510);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1524 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1526 = _1516;
    if (_1164)
    {
        float _1528 = _1482 ? as_type<float>(_1474) : _1056;
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1536 = _1522 + _1534;
    if (_1198)
    {
        float _1538 = _1502 ? as_type<float>(_1500) : _1056;
        _1226 = _1538;
    }
    float _1540 = _1226;
    float _1542 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1546 = _1532 + _1544;
    float _1548 = _1536 * _1536;
    float _1550 = fma(_1524, _1494, -0.5);
    float _1552 = fma(_1518, _1530, -0.5);
    float _1554 = fma(_1542, _1540, -0.5);
    float _1556 = fma(_1546, _1546, _1548);
    float _1558 = fma(_492, _1550, _432);
    float _1560 = _1506 + 0.5;
    float _1562 = fma(_496, _1554, _504);
    float _1564 = sqrt(_1556);
    float _1566 = _956 * _1394;
    out.m_57.w = _1508;
    float _1568 = _1562 + 0.5;
    float _1570 = fma(_1438, _1114, -0.5);
    float _1572 = fma(_980, _1400, _1566);
    float _1574 = fma(_452, _1552, _508);
    float _1576 = _1452 + 0.5;
    out.m_59.x = _1568;
    out.m_59.y = _1560;
    float _1578 = -_512;
    float _1580 = fma(_510, _1570, _1578);
    float _1582 = fma(_992, _1412, _1572);
    float _1584 = _1558 + 0.5;
    float _1586 = _1574 + 0.5;
    float _1588 = _1580 + 0.5;
    float _1590 = _1426 * _1430;
    float _1592 = fma(_1582, _1448, _1012);
    bool _1594 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1426 * _1456;
    out.m_61.x = _1584;
    out.m_61.y = _1576;
    out.m_61.z = _1586;
    out.m_61.w = _1588;
    float _1598 = -_1590;
    float _1600 = fma(_1458, _1456, _1598);
    float _1602 = fma(_1458, _1430, _1596);
    float _1604 = _1584;
    float _1606 = _1586;
    float _1608 = _1576;
    if (!_1594)
    {
        _1604 = _1532;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    if (!_1594)
    {
        _1606 = _1522;
    }
    float _1614 = _1606;
    float _1616 = _1614;
    if (!_1594)
    {
        _1608 = _1592;
    }
    float _1618 = _1608;
    bool _1620 = !_1594;
    float _1622 = _1618;
    if (!_1620)
    {
        float _1624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1628 = _1564 + _1626;
        float _1630 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = rsqrt(_1556);
        float _1634 = _1628 * _1624;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1636 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 + (-1.0);
        float _1648 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1650 = fma(_1644, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = fma(_1592, _1640, _1648);
        float _1654 = _1632 * _1650;
        float _1656 = fma(_1546, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = fma(_1536, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1622 = _1652;
        _1612 = _1656;
        _1616 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1612;
    float _1664 = _1616;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1668);
    float _1678 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1670);
    out.m_63.x = _1602;
    out.m_63.y = _1582;
    out.m_63.z = _1600;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1674);
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1684 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1686 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1704 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1702);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1714 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1718 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1720 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1716);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1718);
    float _1728 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1720);
    out.m_65.x = _1662;
    out.m_65.y = _1660;
    out.m_65.z = _1664;
    float _1730 = _1724 + _1728;
    float _1732 = _1726 + _1728;
    float _1734 = _1728 * 0.5;
    float _1736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1738 = _1730 * 0.5;
    float _1740 = _1732 * 0.5;
    float _1742 = fma(_1722, -0.5, _1734);
    out.m_37.x = _1736;
    out.gl_Position.x = _1724;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1728;
    out.m_67.x = _1738;
    out.m_67.y = _1742;
    out.m_67.z = _1740;
    out.m_67.w = _1728;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_88);
    float _102 = _92;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _98;
    if (!_96)
    {
        out.m_37.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1810 = as_type<float>(_110);
        out.gl_Position.z = _1810;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _114 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_83);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_88);
    bool _126 = _92 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    if (_130)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _100;
    if (_130)
    {
        out.m_37.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _112 = as_type<int>(_134);
    }
    int _136 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_136);
        out.gl_Position.z = _1865;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_39.x;
    float _140 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _142 = log2(_140);
    float _144 = in.m_39.z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _148 = _146 != 0;
    float _150 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_39.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _162 = _138 * 2.0;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _166 = _144 * 2.0;
    float _168 = floor(_162);
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _174 = _152 * 2.0;
    float _176 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _178 = floor(_166);
    float _180 = fma(_176, -2.0, _154);
    float _182 = _152 + _138;
    float _184 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _186 = -_156;
    float _188 = fma(_184, 2.0, _186);
    float _190 = floor(_174);
    bool _192 = _168 > 0.0;
    bool _194 = _168 >= 0.0;
    bool _196 = isnan(_168);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    float _204 = _184;
    float _206 = _150;
    if (_148)
    {
        _204 = _138;
    }
    float _208 = _204;
    float _210 = _208;
    if (!_148)
    {
        _210 = _144;
    }
    float _212 = _210;
    bool _214 = _178 > 0.0;
    bool _216 = _178 >= 0.0;
    bool _218 = isnan(_178);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _228 = _178;
    float _230 = _226;
    if (!_148)
    {
        _228 = _152;
    }
    float _232 = _228;
    float _234 = _232;
    if (_148)
    {
        _234 = _138;
    }
    float _236 = _234;
    float _238 = -_158;
    float _240 = fma(_226, 2.0, _238);
    bool _242 = _190 > 0.0;
    bool _244 = _190 >= 0.0;
    bool _246 = isnan(_190);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _182 + (-1.0);
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _258 = _202 ? 0 : 1;
    float _260 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[83].z, _256);
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _266 = ~_258;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    if (!_192)
    {
        int _274 = ~_258;
        int _276 = _274 + 1;
        _272 = _276;
    }
    int _278 = _272;
    float _280 = -_160;
    float _282 = fma(_264, 2.0, _280);
    bool _284 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _288 = _284 || _286;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    if (!_148)
    {
        _230 = _144;
    }
    float _294 = _230;
    float _296 = _224 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _298 = _294;
    float _300 = _296;
    if (_148)
    {
        _298 = _152;
    }
    float _302 = _298;
    int _304 = ~as_type<int>(_296);
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    float _312 = _302;
    if (!_214)
    {
        int _314 = ~as_type<int>(_296);
        int _316 = _314 + 1;
        _310 = _316;
    }
    int _318 = _310;
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[83].w, _164);
    if (!_148)
    {
        _300 = _144;
    }
    float _322 = _300;
    float _324 = 0.0;
    float _326 = _322;
    if (!_292)
    {
        float _328 = _150 * _150;
        float _330 = _328 * 0.5;
        _324 = _330;
    }
    float _332 = _324;
    float _334 = _332;
    if (_148)
    {
        _312 = _152;
    }
    float _336 = _312;
    float _338 = _336;
    if (_148)
    {
        _326 = _152;
    }
    float _340 = _326;
    if (!_292)
    {
        float _342 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _342;
    }
    float _344 = _334;
    float _346 = _344;
    if (!_148)
    {
        _338 = _138;
    }
    float _348 = _338;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _354 = !_292;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _150 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _150);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _384;
    }
    float _386 = _346;
    bool _388 = !_292;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _150 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _206 = _408;
    }
    float _410 = _206;
    float _412 = _142 * _92;
    float _414 = fma(_350, -2.0, _170);
    float _416 = fma(_352, -2.0, _172);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = -_92;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _188);
    float _434 = exp2(_412);
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    float _450 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[76].y, _180);
    float _452 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].z, _262);
    float _454 = 1.0 / _448;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _474 = !_420;
    int _476 = _474 ? 0 : 1;
    float _478 = -_434;
    float _480 = _478 + 1.0;
    float _482 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _456);
    float _484 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _486 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[88].z, _470);
    float _488 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _472);
    float _490 = _466 ? _480 : 0.0;
    float _492 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].z, _482);
    float _494 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[77].w, _484);
    float _496 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].z, _486);
    float _498 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[87].w, _488);
    int _500 = abs(_476);
    float _502 = -_92;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[86].x, _240);
    float _506 = -_92;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _282);
    float _510 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[82].w, _320);
    float _512 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[81].y, _414);
    float _514 = fma(_92, (*spvDescriptorSet0.vp_c9)._m0[86].y, _416);
    bool _516 = _466;
    int _518 = _428 ? (-1) : 0;
    int _520 = as_type<int>(_450);
    if (_444)
    {
        float _522 = _490 * _454;
        _102 = _522;
    }
    float _524 = _102;
    int _526 = _252 ? 0 : 1;
    float _528 = float(_318);
    float _530 = float(_500);
    float _532 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _534 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _536 = precise::max(_532, _534);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _540 = ~_526;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = _530 * _528;
    int _548 = _544;
    if (!_242)
    {
        int _550 = ~_526;
        int _552 = _550 + 1;
        _548 = _552;
    }
    int _554 = _548;
    float _556 = _138 + (-0.5);
    float _558 = _546 * (-2.0);
    bool _560 = !_424;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _566 = _536 >= 16.0;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _570 = abs(_562);
    float _572 = fma(_260, _558, _260);
    float _574 = _566 ? _538 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _576 = _152 + _144;
    float _578 = float(_278);
    float _580 = fma(_572, _524, _564);
    float _582 = float(_570);
    float _584 = _576 + (-1.0);
    float _586 = _566 ? _568 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _588 = _580 * 0.15915493667125701904296875;
    float _590 = abs(_574);
    bool _592 = _590 != 0.0;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _582 * _578;
    bool _604 = !_428;
    int _606 = _604 ? 0 : 1;
    float _608 = in.m_41.x;
    float _610 = in.m_41.y;
    float _612 = in.m_41.z;
    float _614 = _588 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = abs(_586);
    bool _620 = _618 == 0.0;
    bool _622 = !_600;
    bool _624 = _620 && _622;
    float _626 = in.m_43.x;
    float _628 = in.m_43.y;
    float _630 = in.m_43.z;
    int _632 = abs(_606);
    float _634 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _636 = float(_554);
    float _638 = _602 * (-2.0);
    float _640 = float(_632);
    float _642 = _144 + _138;
    float _644 = abs(_586);
    bool _646 = _644 == 0.0;
    float _648 = fma(_634, _638, _634);
    float _650 = _642 + (-1.0);
    float _652 = _640 * _636;
    float _654 = _152 + (-0.5);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    if (_624)
    {
        bool _658 = as_type<int>(_586) >= 0;
        _516 = _658;
    }
    bool _660 = _516;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = _652 * (-2.0);
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _668 = _144 + (-0.5);
    int _670 = as_type<int>(_668);
    int _672 = _660 ? (-1) : 0;
    if (_624)
    {
        int _674 = _660 ? 0 : 1078530011;
        _656 = _674;
    }
    int _676 = _656;
    float _678 = fma(_662, _664, _662);
    float _680 = fma(_648, _524, _666);
    float _682 = _668 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_624)
    {
        int _684 = int(0x80000000) & as_type<int>(_574);
        int _686 = _676 | _684;
        _670 = _686;
    }
    int _688 = _670;
    bool _690 = !_600;
    bool _692 = _690 && _646;
    int _694 = _688;
    float _696 = as_type<float>(_688);
    if (!_692)
    {
        float _698 = abs(_574);
        bool _700 = _698 != as_type<float>(0x7f800000u /* inf */);
        bool _702 = isnan(_698);
        bool _704 = _700 || _702;
        bool _706 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _708 = _704 || _706;
        float _710 = abs(_586);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        float _714 = abs(_586);
        bool _716 = _714 == as_type<float>(0x7f800000u /* inf */);
        bool _718 = !_708;
        bool _720 = _716 && _718;
        if (_720)
        {
            bool _722 = as_type<int>(_586) >= 0;
            _672 = _722 ? (-1) : 0;
        }
        int _724 = _672;
        if (_720)
        {
            _694 = 1075235812;
        }
        int _726 = _694;
        int _728 = _726;
        if (_720)
        {
            int _730 = ~_724;
            int _732 = (_730 != 0) ? _726 : 1061752795;
            _728 = _732;
        }
        int _734 = _728;
        float _736 = as_type<float>(_734);
        if (_720)
        {
            int _738 = int(0x80000000) & as_type<int>(_574);
            int _740 = _734 | _738;
            _736 = as_type<float>(_740);
        }
        float _742 = _736;
        bool _744 = !_708;
        bool _746 = _744 && _712;
        _696 = _742;
        if (!_746)
        {
            float _748 = abs(_574);
            float _750 = abs(_586);
            float _752 = precise::max(_748, _750);
            float _754 = abs(_574);
            float _756 = abs(_586);
            float _758 = precise::min(_754, _756);
            float _760 = 1.0 / _752;
            float _762 = abs(_574);
            float _764 = abs(_586);
            bool _766 = _762 > _764;
            bool _768 = as_type<int>(_586) >= 0;
            float _770 = abs(_574);
            float _772 = abs(_586);
            float _774 = _770 + _772;
            int _776 = as_type<int>(_574) & int(0x80000000);
            bool _778 = _774 > as_type<float>(0x7f800000u /* inf */);
            bool _780 = isnan(_774);
            bool _782 = _778 || _780;
            bool _784 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _786 = _782 || _784;
            float _788 = _758 * _760;
            float _790 = _788 * _788;
            float _792 = _790 + 11.33538818359375;
            float _794 = fma(_790, _792, 28.84246826171875);
            float _796 = fma(_790, _794, 19.6966705322265625);
            float _798 = fma(_790, -0.82336294651031494140625, -5.674867153167724609375);
            float _800 = fma(_790, _798, -6.565555095672607421875);
            float _802 = 1.0 / _796;
            float _804 = _790 * _800;
            float _806 = _788 * _804;
            float _808 = fma(_806, _802, _788);
            float _810 = _808;
            _696 = _774;
            if (_766)
            {
                float _812 = -_808;
                float _814 = _812 + 1.57079637050628662109375;
                _810 = _814;
            }
            float _816 = _810;
            int _818 = as_type<int>(_816);
            if (!_768)
            {
                float _820 = -_816;
                float _822 = _820 + 3.1415927410125732421875;
                _818 = as_type<int>(_822);
            }
            int _824 = _818;
            if (!_786)
            {
                int _826 = _776 | _824;
                _696 = as_type<float>(_826);
            }
        }
    }
    float _828 = _696;
    float _830 = fma(_678, _524, _682);
    float _832 = _680 + _828;
    float _834 = in.m_32.x;
    float _836 = in.m_32.y;
    float _838 = in.m_32.z;
    float _840 = _608 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _842 = _832 * 0.15915493667125701904296875;
    float _844 = in.m_41.w;
    float _846 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _850 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = _830 * 0.15915493667125701904296875;
    float _860 = _612 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _862 = _848 * _850;
    float _864 = in.m_45.x;
    float _866 = in.m_45.y;
    float _868 = in.m_45.z;
    float _870 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _872 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _874 = _588 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = in.m_47.x;
    float _880 = in.m_47.y;
    float _882 = in.m_47.z;
    float _884 = _610 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    bool _888 = _152 > 0.5;
    float _890 = in.m_49.x;
    float _892 = in.m_49.y;
    float _894 = in.m_49.z;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _898 = _144 > 0.5;
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_410, _836, _870);
    float _906 = fma(_410, _834, _846);
    float _908 = fma(_410, _838, _872);
    float _910 = _886 * _896;
    float _912 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _842 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_904, _844, _854);
    float _920 = fma(_906, _844, _852);
    float _922 = fma(_908, _844, _856);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _630);
    float _926 = _918 * _866;
    float _928 = _842 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _918 * _880;
    float _934 = fma(_920, _864, _926);
    float _936 = _924 * _912;
    float _938 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _938;
    float _942 = _918 * _892;
    float _944 = fma(_920, _878, _932);
    float _946 = fma(_922, _868, _934);
    float _948 = _858 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_920, _890, _942);
    float _954 = fma(_922, _882, _944);
    float _956 = _876 * _902;
    float _958 = _616 * _916;
    float _960 = fma(_922, _894, _952);
    float _962 = _876 * _916;
    float _964 = _916 * _902;
    float _966 = _876 * _930;
    float _968 = _616 * _930;
    float _970 = _930 * _902;
    float _972 = _956 * _910;
    float _974 = _616 * _902;
    float _976 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = in.m_51.y;
    float _980 = fma(_950, _966, _958);
    float _982 = -_962;
    float _984 = fma(_950, _968, _982);
    float _986 = -_910;
    float _988 = _950 * _986;
    float _990 = -_968;
    float _992 = fma(_950, _962, _990);
    float _994 = fma(_980, _862, _972);
    float _996 = _974 * _910;
    float _998 = fma(_970, _862, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1000;
    float _1004 = fma(_992, _936, _994);
    float _1006 = _946 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = fma(_964, _936, _998);
    float _1010 = fma(_950, _958, _966);
    float _1012 = _1004 + _976;
    float _1014 = fma(_984, _862, _996);
    float _1016 = _1008 + _1006;
    float _1018 = abs(_1002);
    float _1020 = abs(_940);
    float _1022 = precise::max(_1018, _1020);
    float _1024 = -_1012;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1028 = fma(_1010, _936, _1014);
    float _1030 = _960 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1032 = in.m_39.w;
    bool _1034 = _1022 >= 16.0;
    float _1036 = -_1016;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1040 = _1026 * _1026;
    float _1042 = _1028 + _1030;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1038, _1038, _1040);
    float _1048 = -_1042;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1054 = _1052 != 0;
    float _1056 = in.m_51.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1060 = _1058 != 0;
    float _1062 = fma(_1050, _1050, _1046);
    float _1064 = -_978;
    float _1066 = _1064 + 1.0;
    float _1068 = _1002;
    float _1070 = _940;
    float _1072 = _978;
    bool _1074 = _1054;
    int _1076 = as_type<int>(_906);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1034)
    {
        float _1080 = _1002 * 0.0625;
        _1068 = _1080;
    }
    float _1082 = _1068;
    float _1084 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1086 = sqrt(_1062);
    int _1088 = _888 ? as_type<int>(_1066) : as_type<int>(_978);
    if (_1034)
    {
        float _1090 = _940 * 0.0625;
        _1070 = _1090;
    }
    float _1092 = _1070;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1096 = _1094 != 0;
    float _1098 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1100 = _898 ? as_type<int>(_1066) : as_type<int>(_978);
    float _1102 = _1060 ? as_type<float>(_1088) : _978;
    float _1104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1106 = _1032 > 0.5;
    float _1108 = _1096 ? as_type<float>(_1100) : _978;
    float _1110 = fma(_1098, _1102, -0.5);
    if (_1054)
    {
        float _1112 = _1106 ? _1066 : _978;
        _1072 = _1112;
    }
    float _1114 = _1072;
    float _1116 = _1084 * 3.2999999523162841796875;
    float _1118 = abs(_1082);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = fma(_1086, 13.0, _1116);
    float _1138 = abs(_1092);
    bool _1140 = _1138 == 0.0;
    bool _1142 = !_1128;
    bool _1144 = _1140 && _1142;
    float _1146 = _1130 * 7.30000019073486328125;
    float _1148 = abs(_1092);
    bool _1150 = _1148 == 0.0;
    float _1152 = _1136 * 0.01745329238474369049072265625;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1156 = fma(_1086, 22.299999237060546875, _1146);
    float _1158 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1160 = _1152 * 0.15915493667125701904296875;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_53.x;
    float _1168 = in.m_53.y;
    float _1170 = in.m_53.z;
    float _1172 = _1156 * 0.01745329238474369049072265625;
    bool _1174 = _1128;
    if (_1134)
    {
        bool _1176 = _138 > 0.5;
        _518 = _1176 ? (-1) : 0;
    }
    int _1178 = _518;
    float _1180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1182 = _1178;
    if (_1144)
    {
        bool _1184 = as_type<int>(_1092) >= 0;
        _1074 = _1184;
    }
    bool _1186 = _1074;
    float _1188 = _1172 * 0.15915493667125701904296875;
    float _1190 = fma(_1108, _1158, -0.5);
    if (_1144)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1076 = _1192;
    }
    int _1194 = _1076;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1198 = _1196 != 0;
    float _1200 = _1160 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1194;
    if (_1144)
    {
        int _1206 = int(0x80000000) & as_type<int>(_1082);
        int _1208 = _1194 | _1206;
        _1204 = _1208;
    }
    int _1210 = _1204;
    bool _1212 = _628 != 0.0;
    bool _1214 = isnan(_628);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    int _1222 = _1210;
    float _1224 = as_type<float>(_1210);
    float _1226 = _1056;
    if (!_1134)
    {
        _1078 = _1056;
    }
    float _1228 = _1078;
    bool _1230 = _626 == 0.0;
    bool _1232 = !_1220;
    bool _1234 = _1230 && _1232;
    float _1236 = _1188 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = _630 == 0.0;
    bool _1242 = _1240 && _1234;
    bool _1244 = !_1128;
    bool _1246 = _1244 && _1150;
    float _1248 = _1168;
    float _1250 = _1166;
    float _1252 = _1170;
    float _1254 = _1228;
    if (!_1246)
    {
        float _1256 = abs(_1082);
        bool _1258 = _1256 != as_type<float>(0x7f800000u /* inf */);
        bool _1260 = isnan(_1256);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1266 = _1262 || _1264;
        float _1268 = abs(_1092);
        bool _1270 = _1268 == as_type<float>(0x7f800000u /* inf */);
        bool _1272 = !_1266;
        bool _1274 = _1270 && _1272;
        _1174 = _1266;
        if (_1274)
        {
            _1222 = 1075235812;
        }
        int _1276 = _1222;
        int _1278 = _1276;
        if (_1274)
        {
            bool _1280 = as_type<int>(_1092) >= 0;
            _1182 = _1280 ? (-1) : 0;
        }
        int _1282 = _1182;
        if (_1274)
        {
            int _1284 = ~_1282;
            int _1286 = (_1284 != 0) ? _1276 : 1061752795;
            _1278 = _1286;
        }
        int _1288 = _1278;
        float _1290 = as_type<float>(_1288);
        if (_1274)
        {
            int _1292 = int(0x80000000) & as_type<int>(_1082);
            int _1294 = _1288 | _1292;
            _1290 = as_type<float>(_1294);
        }
        float _1296 = _1290;
        float _1298 = abs(_1092);
        bool _1300 = _1298 == as_type<float>(0x7f800000u /* inf */);
        bool _1302 = !_1266;
        bool _1304 = _1302 && _1300;
        _1224 = _1296;
        if (!_1304)
        {
            float _1306 = abs(_1082);
            float _1308 = abs(_1092);
            float _1310 = precise::max(_1306, _1308);
            float _1312 = abs(_1082);
            float _1314 = abs(_1092);
            float _1316 = precise::min(_1312, _1314);
            float _1318 = 1.0 / _1310;
            float _1320 = abs(_1082);
            float _1322 = abs(_1092);
            bool _1324 = _1320 > _1322;
            float _1326 = _1316 * _1318;
            float _1328 = _1326 * _1326;
            float _1330 = _1328 + 11.33538818359375;
            float _1332 = fma(_1328, _1330, 28.84246826171875);
            float _1334 = fma(_1328, _1332, 19.6966705322265625);
            float _1336 = fma(_1328, -0.82336294651031494140625, -5.674867153167724609375);
            float _1338 = fma(_1328, _1336, -6.565555095672607421875);
            float _1340 = 1.0 / _1334;
            float _1342 = _1328 * _1338;
            float _1344 = _1326 * _1342;
            float _1346 = fma(_1344, _1340, _1326);
            float _1348 = abs(_1082);
            float _1350 = abs(_1092);
            float _1352 = _1348 + _1350;
            float _1354 = _1346;
            _1224 = _1352;
            if (_1324)
            {
                float _1356 = -_1346;
                float _1358 = _1356 + 1.57079637050628662109375;
                _1354 = _1358;
            }
            float _1360 = _1354;
            bool _1362 = as_type<int>(_1092) >= 0;
            int _1364 = as_type<int>(_1082) & int(0x80000000);
            int _1366 = as_type<int>(_1360);
            if (!_1362)
            {
                float _1368 = -_1360;
                float _1370 = _1368 + 3.1415927410125732421875;
                _1366 = as_type<int>(_1370);
            }
            int _1372 = _1366;
            bool _1374 = _1352 > as_type<float>(0x7f800000u /* inf */);
            bool _1376 = isnan(_1352);
            bool _1378 = _1374 || _1376;
            bool _1380 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1382 = _1378 || _1380;
            _1174 = _1382;
            if (!_1382)
            {
                int _1384 = _1364 | _1372;
                _1224 = as_type<float>(_1384);
            }
        }
    }
    float _1386 = _1224;
    bool _1388 = _1174;
    bool _1390 = _1388;
    if (!_1242)
    {
        float _1392 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1168);
        _1248 = _1392;
    }
    float _1394 = _1248;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1242)
    {
        float _1398 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1166);
        _1250 = _1398;
    }
    float _1400 = _1250;
    float _1402 = -_1394;
    float _1404 = _950 * _1402;
    float _1406 = fma(_1086, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    if (!_1242)
    {
        float _1410 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1252 = _1410;
    }
    float _1412 = _1252;
    float _1414 = _1386 * (-0.15915493667125701904296875);
    float _1416 = fma(_970, _1400, _1404);
    float _1418 = fma(_1408, -2.0, 3.0);
    float _1420 = _1408 * _1408;
    float _1422 = _1202 + _1238;
    float _1424 = _974 * _1394;
    float _1426 = fma(_964, _1412, _1416);
    float _1428 = _1414 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1418 * _1420;
    float _1434 = _1422 * 0.100000001490116119384765625;
    float _1436 = fma(_984, _1400, _1424);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1440 = as_type<int>(_1434);
    int _1442 = as_type<int>(_1420);
    if (_1134)
    {
        bool _1444 = _138 > 0.5;
        _1390 = _1444;
    }
    bool _1446 = _1390;
    float _1448 = _1432 * _1434;
    float _1450 = -_450;
    float _1452 = fma(_494, _1110, _1450);
    float _1454 = _1414 * 6.283185482025146484375;
    float _1456 = cos(_1454);
    float _1458 = fma(_1010, _1412, _1436);
    float _1460 = fma(_1426, _1448, _1016);
    if (_1134)
    {
        float _1462 = -_1056;
        float _1464 = _1462 + 1.0;
        _1440 = as_type<int>(_1464);
    }
    int _1466 = _1440;
    float _1468 = as_type<float>(_1466);
    if (_1164)
    {
        float _1470 = -_1056;
        float _1472 = _1470 + 1.0;
        _520 = as_type<int>(_1472);
    }
    int _1474 = _520;
    float _1476 = fma(_1458, _1448, _1042);
    float _1478 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1480 = _1460 + _1478;
    bool _1482 = _144 > 0.5;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1486 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1488 = _1476 + _1486;
    float _1490 = _1430 * _1480;
    if (_1134)
    {
        float _1492 = _1446 ? as_type<float>(_1466) : _1056;
        _1254 = _1492;
    }
    float _1494 = _1254;
    if (_1198)
    {
        float _1496 = -_1056;
        float _1498 = _1496 + 1.0;
        _1442 = as_type<int>(_1498);
    }
    int _1500 = _1442;
    bool _1502 = _152 > 0.5;
    float _1504 = -_514;
    float _1506 = fma(_498, _1190, _1504);
    float _1508 = in.m_55.w;
    float _1510 = _1456 * _1480;
    float _1512 = -_1490;
    float _1514 = fma(_1456, _1488, _1512);
    if (!_1164)
    {
        _1468 = _1056;
    }
    float _1516 = _1468;
    float _1518 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1520 = fma(_1430, _1488, _1510);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1524 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1526 = _1516;
    if (_1164)
    {
        float _1528 = _1482 ? as_type<float>(_1474) : _1056;
        _1526 = _1528;
    }
    float _1530 = _1526;
    float _1532 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1536 = _1522 + _1534;
    if (_1198)
    {
        float _1538 = _1502 ? as_type<float>(_1500) : _1056;
        _1226 = _1538;
    }
    float _1540 = _1226;
    float _1542 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1546 = _1532 + _1544;
    float _1548 = _1536 * _1536;
    float _1550 = fma(_1524, _1494, -0.5);
    float _1552 = fma(_1518, _1530, -0.5);
    float _1554 = fma(_1542, _1540, -0.5);
    float _1556 = fma(_1546, _1546, _1548);
    float _1558 = fma(_492, _1550, _432);
    float _1560 = _1506 + 0.5;
    float _1562 = fma(_496, _1554, _504);
    float _1564 = sqrt(_1556);
    float _1566 = _956 * _1394;
    out.m_57.w = _1508;
    float _1568 = _1562 + 0.5;
    float _1570 = fma(_1438, _1114, -0.5);
    float _1572 = fma(_980, _1400, _1566);
    float _1574 = fma(_452, _1552, _508);
    float _1576 = _1452 + 0.5;
    out.m_59.x = _1568;
    out.m_59.y = _1560;
    float _1578 = -_512;
    float _1580 = fma(_510, _1570, _1578);
    float _1582 = fma(_992, _1412, _1572);
    float _1584 = _1558 + 0.5;
    float _1586 = _1574 + 0.5;
    float _1588 = _1580 + 0.5;
    float _1590 = _1426 * _1430;
    float _1592 = fma(_1582, _1448, _1012);
    bool _1594 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1426 * _1456;
    out.m_61.x = _1584;
    out.m_61.y = _1576;
    out.m_61.z = _1586;
    out.m_61.w = _1588;
    float _1598 = -_1590;
    float _1600 = fma(_1458, _1456, _1598);
    float _1602 = fma(_1458, _1430, _1596);
    float _1604 = _1584;
    float _1606 = _1586;
    float _1608 = _1576;
    if (!_1594)
    {
        _1604 = _1532;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    if (!_1594)
    {
        _1606 = _1522;
    }
    float _1614 = _1606;
    float _1616 = _1614;
    if (!_1594)
    {
        _1608 = _1592;
    }
    float _1618 = _1608;
    bool _1620 = !_1594;
    float _1622 = _1618;
    if (!_1620)
    {
        float _1624 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1628 = _1564 + _1626;
        float _1630 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = rsqrt(_1556);
        float _1634 = _1628 * _1624;
        float _1636 = _1634 * 0.15915493667125701904296875;
        float _1638 = _1636 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1636 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 + (-1.0);
        float _1648 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1650 = fma(_1644, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1652 = fma(_1592, _1640, _1648);
        float _1654 = _1632 * _1650;
        float _1656 = fma(_1546, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = fma(_1536, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1622 = _1652;
        _1612 = _1656;
        _1616 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1612;
    float _1664 = _1616;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1668);
    float _1678 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1670);
    out.m_63.x = _1602;
    out.m_63.y = _1582;
    out.m_63.z = _1600;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1674);
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1684 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1686 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1704 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1702);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1714 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1718 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1720 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1716);
    float _1726 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1718);
    float _1728 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1720);
    out.m_65.x = _1662;
    out.m_65.y = _1660;
    out.m_65.z = _1664;
    float _1730 = _1724 + _1728;
    float _1732 = _1726 + _1728;
    float _1734 = _1728 * 0.5;
    float _1736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1738 = _1730 * 0.5;
    float _1740 = _1732 * 0.5;
    float _1742 = fma(_1722, -0.5, _1734);
    out.m_37.x = _1736;
    out.gl_Position.x = _1724;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1728;
    out.m_67.x = _1738;
    out.m_67.y = _1742;
    out.m_67.z = _1740;
    out.m_67.w = _1728;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

