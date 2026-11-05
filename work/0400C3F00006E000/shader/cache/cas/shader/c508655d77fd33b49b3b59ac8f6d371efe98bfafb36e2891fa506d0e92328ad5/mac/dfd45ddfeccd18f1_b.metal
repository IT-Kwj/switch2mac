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
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1381 = as_type<float>(_104);
        out.gl_Position.z = _1381;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_142);
        out.gl_Position.z = _1451;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = in.m_39.w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _180 = _178 != 0;
    float _182 = in.m_43.x;
    float _184 = _122 * 0.430000007152557373046875;
    float _186 = in.m_39.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _190 = _188 != 0;
    float _192 = _152 * _122;
    float _194 = in.m_39.z;
    float _196 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = in.m_43.y;
    bool _202 = _154 > 0.5;
    float _204 = _122 * 0.37000000476837158203125;
    float _206 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _210 = _160 * 2.0;
    bool _212 = false;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[2].y);
    if (_158)
    {
        bool _216 = _160 > 0.5;
        _212 = _216;
    }
    bool _218 = _212;
    float _220 = -_162;
    float _222 = fma(_208, 2.0, _220);
    float _224 = fma(_168, 6.283185482025146484375, _204);
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _228 = fma(_170, 6.283185482025146484375, _184);
    float _230 = _168;
    bool _232 = _218;
    if (_158)
    {
        float _234 = -_182;
        float _236 = _234 + 1.0;
        _214 = as_type<int>(_236);
    }
    int _238 = _214;
    if (!_158)
    {
        _230 = _182;
    }
    float _240 = _230;
    float _242 = in.m_45.x;
    float _244 = in.m_45.y;
    float _246 = in.m_45.z;
    float _248 = in.m_45.w;
    int _250 = 0;
    float _252 = _240;
    if (_166)
    {
        float _254 = -_182;
        float _256 = _254 + 1.0;
        _250 = as_type<int>(_256);
    }
    int _258 = _250;
    float _260 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_158)
    {
        float _262 = _218 ? as_type<float>(_238) : _182;
        _252 = _262;
    }
    float _264 = _252;
    float _266 = floor(_210);
    bool _268 = _186 > 0.5;
    float _270 = fma(_260, -2.0, _176);
    float _272 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _226);
    float _274 = _194 * 2.0;
    float _276 = in.m_47.x;
    float _278 = in.m_47.y;
    float _280 = in.m_47.z;
    float _282 = _274;
    if (_166)
    {
        bool _284 = _194 > 0.5;
        _232 = _284;
    }
    bool _286 = _232;
    float _288 = _186 + _194;
    float _290 = floor(_274);
    float _292 = _160 + _194;
    float _294 = -_200;
    float _296 = _294 + 1.0;
    float _298 = _288 + (-1.0);
    float _300 = _186 * 2.0;
    float _302 = _292 + (-1.0);
    float _304 = _224 * 0.15915493667125701904296875;
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _308 = _268 ? as_type<int>(_296) : as_type<int>(_200);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _312 = _200;
    if (!_166)
    {
        _282 = _182;
    }
    float _314 = _282;
    float _316 = _186 + _160;
    float _318 = _314;
    if (_166)
    {
        float _320 = _286 ? as_type<float>(_258) : _182;
        _318 = _320;
    }
    float _322 = _318;
    float _324 = floor(_300);
    float _326 = _316 + (-1.0);
    bool _328 = _266 >= 0.0;
    bool _330 = isnan(_266);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    bool _340 = _290 > 0.0;
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _346 = _174 ? as_type<float>(_308) : _200;
    float _348 = _280 * _244;
    bool _350 = _266 > 0.0;
    float _352 = _280;
    if (_180)
    {
        float _354 = _202 ? _296 : _200;
        _312 = _354;
    }
    float _356 = _312;
    float _358 = -_348;
    float _360 = fma(_278, _246, _358);
    float _362 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _272);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _366 = _290 >= 0.0;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _276 * _246;
    float _378 = _278 * _242;
    bool _380 = _324 > 0.0;
    bool _382 = _324 >= 0.0;
    bool _384 = isnan(_324);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -_376;
    float _394 = fma(_280, _242, _392);
    float _396 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = -_378;
    float _400 = fma(_276, _244, _398);
    float _402 = _360 * _248;
    float _404 = fma(_396, _346, -0.5);
    float _406 = _394 * _248;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _410 = _400 * _248;
    float _412 = _228 * 0.15915493667125701904296875;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _418 = _414;
    if (!_190)
    {
        _416 = _186;
    }
    float _420 = _416;
    float _422 = _304 * 6.283185482025146484375;
    float _424 = sin(_422);
    float _426 = _420;
    if (_190)
    {
        _426 = _160;
    }
    float _428 = _426;
    float _430 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    float _432 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _430);
    float _434 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _408);
    float _438 = _364 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _440 = _428;
    if (!_190)
    {
        _440 = _194;
    }
    float _442 = _440;
    float _444 = _412 * 6.283185482025146484375;
    float _446 = sin(_444);
    float _448 = fma(_438, _356, -0.5);
    float _450 = _442;
    if (_190)
    {
        _450 = _186;
    }
    float _452 = _450;
    float _454 = -_338;
    float _456 = fma(_432, _404, _454);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_190)
    {
        _418 = _194;
    }
    float _462 = _418;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _466 = _462;
    if (_190)
    {
        _466 = _186;
    }
    float _468 = _466;
    float _470 = fma(_460, -2.0, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    bool _476 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _480 = _476 || _478;
    bool _482 = isnan(1.0);
    bool _484 = _480 || _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[83].w, _464);
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _492 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _494 = -_486;
    float _496 = fma(_434, 2.0, _494);
    float _498 = _446 * 0.0040000001899898052215576171875;
    int _500 = _374 ? 0 : 1;
    int _502 = _390 ? 0 : 1;
    float _504 = fma(_424, 0.0030000000260770320892333984375, _498);
    float _506 = 1.0 / _474;
    int _508 = _336 ? 0 : 1;
    float _510 = 0.0;
    float _512 = _492;
    if (!_484)
    {
        float _514 = _492 * _492;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    int _520 = ~_500;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    int _526 = ~_508;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _518;
    int _534 = _524;
    int _536 = _530;
    if (!_484)
    {
        float _538 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = _540;
    if (!_340)
    {
        int _544 = ~_500;
        int _546 = _544 + 1;
        _534 = _546;
    }
    int _548 = _534;
    float _550 = exp2(_192);
    if (!_350)
    {
        int _552 = ~_508;
        int _554 = _552 + 1;
        _536 = _554;
    }
    int _556 = _536;
    int _558 = ~_502;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_380)
    {
        int _566 = ~_502;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    bool _572 = !_484;
    if (!_572)
    {
        float _574 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _576 = log2(_574);
        float _578 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _580 = _578 + 1.0;
        float _582 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _584 = _492 * _576;
        float _586 = 1.0 / _580;
        float _588 = _582 * 0.693147182464599609375;
        float _590 = exp2(_584);
        float _592 = 1.0 / _588;
        float _594 = _590 + (-1.0);
        float _596 = -_594;
        float _598 = fma(_596, _592, _492);
        float _600 = _598 * _586;
        float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _602;
    }
    float _604 = _542;
    bool _606 = !_484;
    if (!_606)
    {
        float _608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _610 = log2(_608);
        float _612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _614 = _612 + 1.0;
        float _616 = 1.0 / _614;
        float _618 = _492 * _610;
        float _620 = exp2(_618);
        float _622 = -_620;
        float _624 = _622 + 1.0;
        float _626 = _624 * _616;
        _512 = _626;
    }
    float _628 = _512;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = _490 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_122;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[76].x, _222);
    float _650 = fma(_632, _264, -0.5);
    float _652 = -_550;
    float _654 = _652 + 1.0;
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _488);
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _678 = _670 ? _654 : 0.0;
    float _680 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _436);
    float _682 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _684 = -_122;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    float _688 = _362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_644)
    {
        float _690 = _678 * _506;
        _124 = _690;
    }
    float _692 = _124;
    float _694 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _696 = in.m_35.x;
    float _698 = in.m_35.y;
    float _700 = in.m_35.z;
    float _702 = -_676;
    float _704 = fma(_672, _448, _702);
    float _706 = fma(_694, _322, -0.5);
    float _708 = fma(_682, _650, _648);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _712 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = fma(_504, _278, _658);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _760 = abs(_742);
    out.m_53.x = _738;
    out.m_53.y = _744;
    out.m_53.z = _746;
    float _762 = precise::max(_688, -400.0);
    float _764 = fma(_680, _706, _686);
    out.m_55.x = _754;
    out.m_55.y = _756;
    out.m_55.z = _758;
    float _766 = precise::min(_762, -50.0);
    float _768 = _504 * 0.20000000298023223876953125;
    float _770 = float(_548);
    float _772 = _186 + (-0.5);
    float _774 = _160 + (-0.5);
    float _776 = fma(_766, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _778 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _194 + (-0.5);
    bool _782 = _734 != 0.0;
    bool _784 = isnan(_734);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _794 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _796 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _798 = fma(_628, _696, _778);
    float _800 = float(_760);
    float _802 = fma(_628, _698, _794);
    float _804 = fma(_628, _700, _796);
    bool _806 = !_726;
    int _808 = _806 ? 0 : 1;
    float _810 = _276 * _768;
    float _812 = _800 * _770;
    float _814 = float(_556);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    int _818 = abs(_808);
    float _820 = _812 * (-2.0);
    float _822 = fma(_776, -0.5, 1.0);
    bool _824 = !_730;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _712;
    float _830 = float(_818);
    float _832 = fma(_820, _748, _748);
    float _834 = fma(_822, _656, _810);
    int _836 = abs(_826);
    float _838 = fma(_342, _820, _342);
    float _840 = _830 * _814;
    float _842 = _280 * _768;
    float _844 = in.m_37.w;
    float _846 = float(_570);
    float _848 = _840 * (-2.0);
    float _850 = float(_836);
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = fma(_822, _660, _842);
    float _860 = fma(_848, _750, _750);
    float _862 = fma(_306, _848, _306);
    float _864 = _850 * _846;
    float _866 = _456 + 0.5;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].y, _860);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[196].x, _832);
    float _872 = _864 * (-2.0);
    float _874 = _704 + 0.5;
    float _876 = fma(_862, _692, _868);
    float _878 = fma(_838, _692, _870);
    float _880 = fma(_872, _752, _752);
    float _882 = fma(_310, _872, _310);
    float _884 = _708 + 0.5;
    float _886 = _878 * 0.15915493667125701904296875;
    float _888 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _764 + 0.5;
    float _892 = _876 * 0.15915493667125701904296875;
    bool _894 = _834 == 0.0;
    bool _896 = !_790;
    bool _898 = _894 && _896;
    float _900 = fma(_882, _692, _888);
    float _902 = _886 * 6.283185482025146484375;
    float _904 = sin(_902);
    out.m_57.x = _884;
    out.m_57.y = _866;
    out.m_57.z = _890;
    out.m_57.w = _874;
    bool _906 = _858 == 0.0;
    bool _908 = _906 && _898;
    float _910 = fma(_804, _844, _856);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = fma(_802, _844, _854);
    float _916 = fma(_798, _844, _852);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _920 = _886 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _926 = in.m_41.z;
    float _928 = _924 * _792;
    float _930 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _692;
    float _938 = _914;
    if (_908)
    {
        _936 = _278;
    }
    float _940 = _936;
    float _942 = _940;
    if (!_908)
    {
        float _944 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _942 = _944;
    }
    float _946 = _942;
    float _948 = _918 * _930;
    float _950 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_908)
    {
        _938 = _276;
    }
    float _956 = _938;
    float _958 = _892 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].x, _950);
    float _964 = _956;
    if (!_908)
    {
        float _966 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _972 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].x, _954);
    float _974 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _962);
    if (!_908)
    {
        float _976 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _280);
        _352 = _976;
    }
    float _978 = _352;
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _970);
    float _982 = _912 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _904 * _934;
    float _988 = _922 * _934;
    float _990 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _972);
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_59.z = _926;
    float _994 = _912 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _922 * _960;
    float _1000 = _904 * _960;
    float _1002 = _960 * _984;
    float _1004 = _922 * _984;
    float _1006 = _904 * _984;
    float _1008 = _934 * _984;
    float _1010 = _1004 * _244;
    float _1012 = _1006 * _244;
    float _1014 = fma(_996, _998, _986);
    float _1016 = fma(_996, _986, _998);
    float _1018 = -_988;
    float _1020 = fma(_996, _1000, _1018);
    float _1022 = -_1000;
    float _1024 = fma(_996, _988, _1022);
    float _1026 = -_244;
    float _1028 = _996 * _1026;
    float _1030 = _1004 * _828;
    float _1032 = -_946;
    float _1034 = _996 * _1032;
    float _1036 = -_828;
    float _1038 = _996 * _1036;
    float _1040 = _1006 * _828;
    float _1042 = fma(_1014, _928, _1030);
    float _1044 = fma(_1002, _968, _1034);
    float _1046 = _1004 * _946;
    float _1048 = fma(_1002, _928, _1038);
    float _1050 = fma(_1024, _948, _1042);
    float _1052 = _1006 * _946;
    float _1054 = -_406;
    float _1056 = _996 * _1054;
    float _1058 = fma(_1002, _242, _1028);
    float _1060 = _1004 * _406;
    float _1062 = _1006 * _406;
    float _1064 = fma(_1020, _928, _1040);
    float _1066 = fma(_1014, _968, _1046);
    float _1068 = fma(_1008, _948, _1048);
    float _1070 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1072 = fma(_1014, _242, _1010);
    float _1074 = fma(_1020, _242, _1012);
    float _1076 = fma(_1016, _948, _1064);
    float _1078 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1070);
    float _1082 = fma(_1002, _402, _1056);
    float _1084 = fma(_1020, _968, _1052);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1080);
    float _1090 = fma(_1008, _978, _1044);
    float _1092 = fma(_1024, _978, _1066);
    float _1094 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1086);
    float _1098 = _992 + _1088;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1102 = fma(_1016, _978, _1084);
    float _1104 = _1094 + _1096;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1108 = _1098 + _1106;
    float _1110 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1112 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1100);
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1104 + _1116;
    float _1120 = _1108 * _1108;
    float _1122 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1110);
    float _1124 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    float _1126 = fma(_1014, _402, _1060);
    float _1128 = fma(_1118, _1118, _1120);
    float _1130 = fma(_1024, _246, _1072);
    float _1132 = fma(_1008, _246, _1058);
    float _1134 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = sqrt(_1128);
    float _1138 = fma(_1016, _246, _1074);
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1146 = fma(_1020, _402, _1062);
    float _1148 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1150 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1152 = fma(_1024, _410, _1126);
    float _1154 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1114);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1140);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1142);
    float _1160 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1144);
    float _1164 = fma(_1008, _410, _1082);
    float _1166 = fma(_1016, _410, _1146);
    bool _1168 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1150);
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1176 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1178 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1156);
    float _1182 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    out.m_61.x = _1148;
    out.m_61.y = _1154;
    out.m_61.z = _1160;
    float _1186 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1176 + _1170;
    out.m_63.x = _1180;
    out.m_63.y = _1182;
    out.m_63.z = _1184;
    float _1190 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1174);
    float _1192 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1194 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1196 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1198 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1192);
    float _1200 = _1180;
    float _1202 = _1184;
    float _1204 = _1182;
    if (!_1168)
    {
        _1200 = _1104;
    }
    float _1206 = _1200;
    float _1208 = _1206;
    if (!_1168)
    {
        _1202 = _1098;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    if (!_1168)
    {
        _1204 = _1188;
    }
    float _1214 = _1204;
    bool _1216 = !_1168;
    float _1218 = _1214;
    if (!_1216)
    {
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1224 = _1136 + _1222;
        float _1226 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1228 = rsqrt(_1128);
        float _1230 = _1224 * _1220;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1232 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        float _1242 = _1236 + (-1.0);
        float _1244 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = fma(_1240, _1226, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1248 = fma(_1188, _1236, _1244);
        float _1250 = _1228 * _1246;
        float _1252 = fma(_1118, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1254 = fma(_1108, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1218 = _1248;
        _1208 = _1252;
        _1212 = _1254;
    }
    float _1256 = _1218;
    float _1258 = _1208;
    float _1260 = _1212;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1274 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    out.m_65.x = _1194;
    out.m_65.y = _1196;
    out.m_65.z = _1198;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1278 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1272);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1274);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1294);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    float _1312 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1320 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1314);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_67.x = _1258;
    out.m_67.y = _1256;
    out.m_67.z = _1260;
    out.m_33.x = 1.0;
    out.m_69.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1320;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1318;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1381 = as_type<float>(_104);
        out.gl_Position.z = _1381;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_142);
        out.gl_Position.z = _1451;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = in.m_39.w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _180 = _178 != 0;
    float _182 = in.m_43.x;
    float _184 = _122 * 0.430000007152557373046875;
    float _186 = in.m_39.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _190 = _188 != 0;
    float _192 = _152 * _122;
    float _194 = in.m_39.z;
    float _196 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = in.m_43.y;
    bool _202 = _154 > 0.5;
    float _204 = _122 * 0.37000000476837158203125;
    float _206 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _210 = _160 * 2.0;
    bool _212 = false;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[2].y);
    if (_158)
    {
        bool _216 = _160 > 0.5;
        _212 = _216;
    }
    bool _218 = _212;
    float _220 = -_162;
    float _222 = fma(_208, 2.0, _220);
    float _224 = fma(_168, 6.283185482025146484375, _204);
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _228 = fma(_170, 6.283185482025146484375, _184);
    float _230 = _168;
    bool _232 = _218;
    if (_158)
    {
        float _234 = -_182;
        float _236 = _234 + 1.0;
        _214 = as_type<int>(_236);
    }
    int _238 = _214;
    if (!_158)
    {
        _230 = _182;
    }
    float _240 = _230;
    float _242 = in.m_45.x;
    float _244 = in.m_45.y;
    float _246 = in.m_45.z;
    float _248 = in.m_45.w;
    int _250 = 0;
    float _252 = _240;
    if (_166)
    {
        float _254 = -_182;
        float _256 = _254 + 1.0;
        _250 = as_type<int>(_256);
    }
    int _258 = _250;
    float _260 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_158)
    {
        float _262 = _218 ? as_type<float>(_238) : _182;
        _252 = _262;
    }
    float _264 = _252;
    float _266 = floor(_210);
    bool _268 = _186 > 0.5;
    float _270 = fma(_260, -2.0, _176);
    float _272 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _226);
    float _274 = _194 * 2.0;
    float _276 = in.m_47.x;
    float _278 = in.m_47.y;
    float _280 = in.m_47.z;
    float _282 = _274;
    if (_166)
    {
        bool _284 = _194 > 0.5;
        _232 = _284;
    }
    bool _286 = _232;
    float _288 = _186 + _194;
    float _290 = floor(_274);
    float _292 = _160 + _194;
    float _294 = -_200;
    float _296 = _294 + 1.0;
    float _298 = _288 + (-1.0);
    float _300 = _186 * 2.0;
    float _302 = _292 + (-1.0);
    float _304 = _224 * 0.15915493667125701904296875;
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _308 = _268 ? as_type<int>(_296) : as_type<int>(_200);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _312 = _200;
    if (!_166)
    {
        _282 = _182;
    }
    float _314 = _282;
    float _316 = _186 + _160;
    float _318 = _314;
    if (_166)
    {
        float _320 = _286 ? as_type<float>(_258) : _182;
        _318 = _320;
    }
    float _322 = _318;
    float _324 = floor(_300);
    float _326 = _316 + (-1.0);
    bool _328 = _266 >= 0.0;
    bool _330 = isnan(_266);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    bool _340 = _290 > 0.0;
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _346 = _174 ? as_type<float>(_308) : _200;
    float _348 = _280 * _244;
    bool _350 = _266 > 0.0;
    float _352 = _280;
    if (_180)
    {
        float _354 = _202 ? _296 : _200;
        _312 = _354;
    }
    float _356 = _312;
    float _358 = -_348;
    float _360 = fma(_278, _246, _358);
    float _362 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _272);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _366 = _290 >= 0.0;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _276 * _246;
    float _378 = _278 * _242;
    bool _380 = _324 > 0.0;
    bool _382 = _324 >= 0.0;
    bool _384 = isnan(_324);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -_376;
    float _394 = fma(_280, _242, _392);
    float _396 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = -_378;
    float _400 = fma(_276, _244, _398);
    float _402 = _360 * _248;
    float _404 = fma(_396, _346, -0.5);
    float _406 = _394 * _248;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _410 = _400 * _248;
    float _412 = _228 * 0.15915493667125701904296875;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _418 = _414;
    if (!_190)
    {
        _416 = _186;
    }
    float _420 = _416;
    float _422 = _304 * 6.283185482025146484375;
    float _424 = sin(_422);
    float _426 = _420;
    if (_190)
    {
        _426 = _160;
    }
    float _428 = _426;
    float _430 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    float _432 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _430);
    float _434 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _408);
    float _438 = _364 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _440 = _428;
    if (!_190)
    {
        _440 = _194;
    }
    float _442 = _440;
    float _444 = _412 * 6.283185482025146484375;
    float _446 = sin(_444);
    float _448 = fma(_438, _356, -0.5);
    float _450 = _442;
    if (_190)
    {
        _450 = _186;
    }
    float _452 = _450;
    float _454 = -_338;
    float _456 = fma(_432, _404, _454);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_190)
    {
        _418 = _194;
    }
    float _462 = _418;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _466 = _462;
    if (_190)
    {
        _466 = _186;
    }
    float _468 = _466;
    float _470 = fma(_460, -2.0, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    bool _476 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _480 = _476 || _478;
    bool _482 = isnan(1.0);
    bool _484 = _480 || _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[83].w, _464);
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _492 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _494 = -_486;
    float _496 = fma(_434, 2.0, _494);
    float _498 = _446 * 0.0040000001899898052215576171875;
    int _500 = _374 ? 0 : 1;
    int _502 = _390 ? 0 : 1;
    float _504 = fma(_424, 0.0030000000260770320892333984375, _498);
    float _506 = 1.0 / _474;
    int _508 = _336 ? 0 : 1;
    float _510 = 0.0;
    float _512 = _492;
    if (!_484)
    {
        float _514 = _492 * _492;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    int _520 = ~_500;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    int _526 = ~_508;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _518;
    int _534 = _524;
    int _536 = _530;
    if (!_484)
    {
        float _538 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = _540;
    if (!_340)
    {
        int _544 = ~_500;
        int _546 = _544 + 1;
        _534 = _546;
    }
    int _548 = _534;
    float _550 = exp2(_192);
    if (!_350)
    {
        int _552 = ~_508;
        int _554 = _552 + 1;
        _536 = _554;
    }
    int _556 = _536;
    int _558 = ~_502;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_380)
    {
        int _566 = ~_502;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    bool _572 = !_484;
    if (!_572)
    {
        float _574 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _576 = log2(_574);
        float _578 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _580 = _578 + 1.0;
        float _582 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _584 = _492 * _576;
        float _586 = 1.0 / _580;
        float _588 = _582 * 0.693147182464599609375;
        float _590 = exp2(_584);
        float _592 = 1.0 / _588;
        float _594 = _590 + (-1.0);
        float _596 = -_594;
        float _598 = fma(_596, _592, _492);
        float _600 = _598 * _586;
        float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _602;
    }
    float _604 = _542;
    bool _606 = !_484;
    if (!_606)
    {
        float _608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _610 = log2(_608);
        float _612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _614 = _612 + 1.0;
        float _616 = 1.0 / _614;
        float _618 = _492 * _610;
        float _620 = exp2(_618);
        float _622 = -_620;
        float _624 = _622 + 1.0;
        float _626 = _624 * _616;
        _512 = _626;
    }
    float _628 = _512;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = _490 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_122;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[76].x, _222);
    float _650 = fma(_632, _264, -0.5);
    float _652 = -_550;
    float _654 = _652 + 1.0;
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _488);
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _678 = _670 ? _654 : 0.0;
    float _680 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _436);
    float _682 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _684 = -_122;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    float _688 = _362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_644)
    {
        float _690 = _678 * _506;
        _124 = _690;
    }
    float _692 = _124;
    float _694 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _696 = in.m_35.x;
    float _698 = in.m_35.y;
    float _700 = in.m_35.z;
    float _702 = -_676;
    float _704 = fma(_672, _448, _702);
    float _706 = fma(_694, _322, -0.5);
    float _708 = fma(_682, _650, _648);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _712 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = fma(_504, _278, _658);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _760 = abs(_742);
    out.m_53.x = _738;
    out.m_53.y = _744;
    out.m_53.z = _746;
    float _762 = precise::max(_688, -400.0);
    float _764 = fma(_680, _706, _686);
    out.m_55.x = _754;
    out.m_55.y = _756;
    out.m_55.z = _758;
    float _766 = precise::min(_762, -50.0);
    float _768 = _504 * 0.20000000298023223876953125;
    float _770 = float(_548);
    float _772 = _186 + (-0.5);
    float _774 = _160 + (-0.5);
    float _776 = fma(_766, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _778 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _194 + (-0.5);
    bool _782 = _734 != 0.0;
    bool _784 = isnan(_734);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _794 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _796 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _798 = fma(_628, _696, _778);
    float _800 = float(_760);
    float _802 = fma(_628, _698, _794);
    float _804 = fma(_628, _700, _796);
    bool _806 = !_726;
    int _808 = _806 ? 0 : 1;
    float _810 = _276 * _768;
    float _812 = _800 * _770;
    float _814 = float(_556);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    int _818 = abs(_808);
    float _820 = _812 * (-2.0);
    float _822 = fma(_776, -0.5, 1.0);
    bool _824 = !_730;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _712;
    float _830 = float(_818);
    float _832 = fma(_820, _748, _748);
    float _834 = fma(_822, _656, _810);
    int _836 = abs(_826);
    float _838 = fma(_342, _820, _342);
    float _840 = _830 * _814;
    float _842 = _280 * _768;
    float _844 = in.m_37.w;
    float _846 = float(_570);
    float _848 = _840 * (-2.0);
    float _850 = float(_836);
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = fma(_822, _660, _842);
    float _860 = fma(_848, _750, _750);
    float _862 = fma(_306, _848, _306);
    float _864 = _850 * _846;
    float _866 = _456 + 0.5;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].y, _860);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[196].x, _832);
    float _872 = _864 * (-2.0);
    float _874 = _704 + 0.5;
    float _876 = fma(_862, _692, _868);
    float _878 = fma(_838, _692, _870);
    float _880 = fma(_872, _752, _752);
    float _882 = fma(_310, _872, _310);
    float _884 = _708 + 0.5;
    float _886 = _878 * 0.15915493667125701904296875;
    float _888 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _764 + 0.5;
    float _892 = _876 * 0.15915493667125701904296875;
    bool _894 = _834 == 0.0;
    bool _896 = !_790;
    bool _898 = _894 && _896;
    float _900 = fma(_882, _692, _888);
    float _902 = _886 * 6.283185482025146484375;
    float _904 = sin(_902);
    out.m_57.x = _884;
    out.m_57.y = _866;
    out.m_57.z = _890;
    out.m_57.w = _874;
    bool _906 = _858 == 0.0;
    bool _908 = _906 && _898;
    float _910 = fma(_804, _844, _856);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = fma(_802, _844, _854);
    float _916 = fma(_798, _844, _852);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _920 = _886 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _926 = in.m_41.z;
    float _928 = _924 * _792;
    float _930 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _692;
    float _938 = _914;
    if (_908)
    {
        _936 = _278;
    }
    float _940 = _936;
    float _942 = _940;
    if (!_908)
    {
        float _944 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _942 = _944;
    }
    float _946 = _942;
    float _948 = _918 * _930;
    float _950 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_908)
    {
        _938 = _276;
    }
    float _956 = _938;
    float _958 = _892 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].x, _950);
    float _964 = _956;
    if (!_908)
    {
        float _966 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _972 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].x, _954);
    float _974 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _962);
    if (!_908)
    {
        float _976 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _280);
        _352 = _976;
    }
    float _978 = _352;
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _970);
    float _982 = _912 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _904 * _934;
    float _988 = _922 * _934;
    float _990 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _972);
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_59.z = _926;
    float _994 = _912 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _922 * _960;
    float _1000 = _904 * _960;
    float _1002 = _960 * _984;
    float _1004 = _922 * _984;
    float _1006 = _904 * _984;
    float _1008 = _934 * _984;
    float _1010 = _1004 * _244;
    float _1012 = _1006 * _244;
    float _1014 = fma(_996, _998, _986);
    float _1016 = fma(_996, _986, _998);
    float _1018 = -_988;
    float _1020 = fma(_996, _1000, _1018);
    float _1022 = -_1000;
    float _1024 = fma(_996, _988, _1022);
    float _1026 = -_244;
    float _1028 = _996 * _1026;
    float _1030 = _1004 * _828;
    float _1032 = -_946;
    float _1034 = _996 * _1032;
    float _1036 = -_828;
    float _1038 = _996 * _1036;
    float _1040 = _1006 * _828;
    float _1042 = fma(_1014, _928, _1030);
    float _1044 = fma(_1002, _968, _1034);
    float _1046 = _1004 * _946;
    float _1048 = fma(_1002, _928, _1038);
    float _1050 = fma(_1024, _948, _1042);
    float _1052 = _1006 * _946;
    float _1054 = -_406;
    float _1056 = _996 * _1054;
    float _1058 = fma(_1002, _242, _1028);
    float _1060 = _1004 * _406;
    float _1062 = _1006 * _406;
    float _1064 = fma(_1020, _928, _1040);
    float _1066 = fma(_1014, _968, _1046);
    float _1068 = fma(_1008, _948, _1048);
    float _1070 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1072 = fma(_1014, _242, _1010);
    float _1074 = fma(_1020, _242, _1012);
    float _1076 = fma(_1016, _948, _1064);
    float _1078 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1070);
    float _1082 = fma(_1002, _402, _1056);
    float _1084 = fma(_1020, _968, _1052);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1080);
    float _1090 = fma(_1008, _978, _1044);
    float _1092 = fma(_1024, _978, _1066);
    float _1094 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1086);
    float _1098 = _992 + _1088;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1102 = fma(_1016, _978, _1084);
    float _1104 = _1094 + _1096;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1108 = _1098 + _1106;
    float _1110 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1112 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1100);
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1104 + _1116;
    float _1120 = _1108 * _1108;
    float _1122 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1110);
    float _1124 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    float _1126 = fma(_1014, _402, _1060);
    float _1128 = fma(_1118, _1118, _1120);
    float _1130 = fma(_1024, _246, _1072);
    float _1132 = fma(_1008, _246, _1058);
    float _1134 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = sqrt(_1128);
    float _1138 = fma(_1016, _246, _1074);
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1146 = fma(_1020, _402, _1062);
    float _1148 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1150 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1152 = fma(_1024, _410, _1126);
    float _1154 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1114);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1140);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1142);
    float _1160 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1144);
    float _1164 = fma(_1008, _410, _1082);
    float _1166 = fma(_1016, _410, _1146);
    bool _1168 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1150);
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1176 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1178 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1156);
    float _1182 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    out.m_61.x = _1148;
    out.m_61.y = _1154;
    out.m_61.z = _1160;
    float _1186 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1176 + _1170;
    out.m_63.x = _1180;
    out.m_63.y = _1182;
    out.m_63.z = _1184;
    float _1190 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1174);
    float _1192 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1194 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1196 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1198 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1192);
    float _1200 = _1180;
    float _1202 = _1184;
    float _1204 = _1182;
    if (!_1168)
    {
        _1200 = _1104;
    }
    float _1206 = _1200;
    float _1208 = _1206;
    if (!_1168)
    {
        _1202 = _1098;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    if (!_1168)
    {
        _1204 = _1188;
    }
    float _1214 = _1204;
    bool _1216 = !_1168;
    float _1218 = _1214;
    if (!_1216)
    {
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1224 = _1136 + _1222;
        float _1226 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1228 = rsqrt(_1128);
        float _1230 = _1224 * _1220;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1232 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        float _1242 = _1236 + (-1.0);
        float _1244 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = fma(_1240, _1226, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1248 = fma(_1188, _1236, _1244);
        float _1250 = _1228 * _1246;
        float _1252 = fma(_1118, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1254 = fma(_1108, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1218 = _1248;
        _1208 = _1252;
        _1212 = _1254;
    }
    float _1256 = _1218;
    float _1258 = _1208;
    float _1260 = _1212;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1274 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    out.m_65.x = _1194;
    out.m_65.y = _1196;
    out.m_65.z = _1198;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1278 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1272);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1274);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1294);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    float _1312 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1320 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1314);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_67.x = _1258;
    out.m_67.y = _1256;
    out.m_67.z = _1260;
    out.m_33.x = 1.0;
    out.m_69.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1320;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1318;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1381 = as_type<float>(_104);
        out.gl_Position.z = _1381;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1451 = as_type<float>(_142);
        out.gl_Position.z = _1451;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = in.m_39.w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.x;
    float _162 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _180 = _178 != 0;
    float _182 = in.m_43.x;
    float _184 = _122 * 0.430000007152557373046875;
    float _186 = in.m_39.y;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _190 = _188 != 0;
    float _192 = _152 * _122;
    float _194 = in.m_39.z;
    float _196 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _200 = in.m_43.y;
    bool _202 = _154 > 0.5;
    float _204 = _122 * 0.37000000476837158203125;
    float _206 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _210 = _160 * 2.0;
    bool _212 = false;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[2].y);
    if (_158)
    {
        bool _216 = _160 > 0.5;
        _212 = _216;
    }
    bool _218 = _212;
    float _220 = -_162;
    float _222 = fma(_208, 2.0, _220);
    float _224 = fma(_168, 6.283185482025146484375, _204);
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _228 = fma(_170, 6.283185482025146484375, _184);
    float _230 = _168;
    bool _232 = _218;
    if (_158)
    {
        float _234 = -_182;
        float _236 = _234 + 1.0;
        _214 = as_type<int>(_236);
    }
    int _238 = _214;
    if (!_158)
    {
        _230 = _182;
    }
    float _240 = _230;
    float _242 = in.m_45.x;
    float _244 = in.m_45.y;
    float _246 = in.m_45.z;
    float _248 = in.m_45.w;
    int _250 = 0;
    float _252 = _240;
    if (_166)
    {
        float _254 = -_182;
        float _256 = _254 + 1.0;
        _250 = as_type<int>(_256);
    }
    int _258 = _250;
    float _260 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_158)
    {
        float _262 = _218 ? as_type<float>(_238) : _182;
        _252 = _262;
    }
    float _264 = _252;
    float _266 = floor(_210);
    bool _268 = _186 > 0.5;
    float _270 = fma(_260, -2.0, _176);
    float _272 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _226);
    float _274 = _194 * 2.0;
    float _276 = in.m_47.x;
    float _278 = in.m_47.y;
    float _280 = in.m_47.z;
    float _282 = _274;
    if (_166)
    {
        bool _284 = _194 > 0.5;
        _232 = _284;
    }
    bool _286 = _232;
    float _288 = _186 + _194;
    float _290 = floor(_274);
    float _292 = _160 + _194;
    float _294 = -_200;
    float _296 = _294 + 1.0;
    float _298 = _288 + (-1.0);
    float _300 = _186 * 2.0;
    float _302 = _292 + (-1.0);
    float _304 = _224 * 0.15915493667125701904296875;
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _308 = _268 ? as_type<int>(_296) : as_type<int>(_200);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _312 = _200;
    if (!_166)
    {
        _282 = _182;
    }
    float _314 = _282;
    float _316 = _186 + _160;
    float _318 = _314;
    if (_166)
    {
        float _320 = _286 ? as_type<float>(_258) : _182;
        _318 = _320;
    }
    float _322 = _318;
    float _324 = floor(_300);
    float _326 = _316 + (-1.0);
    bool _328 = _266 >= 0.0;
    bool _330 = isnan(_266);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    bool _340 = _290 > 0.0;
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _346 = _174 ? as_type<float>(_308) : _200;
    float _348 = _280 * _244;
    bool _350 = _266 > 0.0;
    float _352 = _280;
    if (_180)
    {
        float _354 = _202 ? _296 : _200;
        _312 = _354;
    }
    float _356 = _312;
    float _358 = -_348;
    float _360 = fma(_278, _246, _358);
    float _362 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _272);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _366 = _290 >= 0.0;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _276 * _246;
    float _378 = _278 * _242;
    bool _380 = _324 > 0.0;
    bool _382 = _324 >= 0.0;
    bool _384 = isnan(_324);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -_376;
    float _394 = fma(_280, _242, _392);
    float _396 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _398 = -_378;
    float _400 = fma(_276, _244, _398);
    float _402 = _360 * _248;
    float _404 = fma(_396, _346, -0.5);
    float _406 = _394 * _248;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _410 = _400 * _248;
    float _412 = _228 * 0.15915493667125701904296875;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _418 = _414;
    if (!_190)
    {
        _416 = _186;
    }
    float _420 = _416;
    float _422 = _304 * 6.283185482025146484375;
    float _424 = sin(_422);
    float _426 = _420;
    if (_190)
    {
        _426 = _160;
    }
    float _428 = _426;
    float _430 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    float _432 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _430);
    float _434 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _408);
    float _438 = _364 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _440 = _428;
    if (!_190)
    {
        _440 = _194;
    }
    float _442 = _440;
    float _444 = _412 * 6.283185482025146484375;
    float _446 = sin(_444);
    float _448 = fma(_438, _356, -0.5);
    float _450 = _442;
    if (_190)
    {
        _450 = _186;
    }
    float _452 = _450;
    float _454 = -_338;
    float _456 = fma(_432, _404, _454);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_190)
    {
        _418 = _194;
    }
    float _462 = _418;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _466 = _462;
    if (_190)
    {
        _466 = _186;
    }
    float _468 = _466;
    float _470 = fma(_460, -2.0, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    bool _476 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _480 = _476 || _478;
    bool _482 = isnan(1.0);
    bool _484 = _480 || _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[83].w, _464);
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _492 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _494 = -_486;
    float _496 = fma(_434, 2.0, _494);
    float _498 = _446 * 0.0040000001899898052215576171875;
    int _500 = _374 ? 0 : 1;
    int _502 = _390 ? 0 : 1;
    float _504 = fma(_424, 0.0030000000260770320892333984375, _498);
    float _506 = 1.0 / _474;
    int _508 = _336 ? 0 : 1;
    float _510 = 0.0;
    float _512 = _492;
    if (!_484)
    {
        float _514 = _492 * _492;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    int _520 = ~_500;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    int _526 = ~_508;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _518;
    int _534 = _524;
    int _536 = _530;
    if (!_484)
    {
        float _538 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = _540;
    if (!_340)
    {
        int _544 = ~_500;
        int _546 = _544 + 1;
        _534 = _546;
    }
    int _548 = _534;
    float _550 = exp2(_192);
    if (!_350)
    {
        int _552 = ~_508;
        int _554 = _552 + 1;
        _536 = _554;
    }
    int _556 = _536;
    int _558 = ~_502;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_380)
    {
        int _566 = ~_502;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    bool _572 = !_484;
    if (!_572)
    {
        float _574 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _576 = log2(_574);
        float _578 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _580 = _578 + 1.0;
        float _582 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _584 = _492 * _576;
        float _586 = 1.0 / _580;
        float _588 = _582 * 0.693147182464599609375;
        float _590 = exp2(_584);
        float _592 = 1.0 / _588;
        float _594 = _590 + (-1.0);
        float _596 = -_594;
        float _598 = fma(_596, _592, _492);
        float _600 = _598 * _586;
        float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _602;
    }
    float _604 = _542;
    bool _606 = !_484;
    if (!_606)
    {
        float _608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _610 = log2(_608);
        float _612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _614 = _612 + 1.0;
        float _616 = 1.0 / _614;
        float _618 = _492 * _610;
        float _620 = exp2(_618);
        float _622 = -_620;
        float _624 = _622 + 1.0;
        float _626 = _624 * _616;
        _512 = _626;
    }
    float _628 = _512;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = _490 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_122;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[76].x, _222);
    float _650 = fma(_632, _264, -0.5);
    float _652 = -_550;
    float _654 = _652 + 1.0;
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _488);
    float _674 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _676 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _678 = _670 ? _654 : 0.0;
    float _680 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _436);
    float _682 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _684 = -_122;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    float _688 = _362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_644)
    {
        float _690 = _678 * _506;
        _124 = _690;
    }
    float _692 = _124;
    float _694 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _696 = in.m_35.x;
    float _698 = in.m_35.y;
    float _700 = in.m_35.z;
    float _702 = -_676;
    float _704 = fma(_672, _448, _702);
    float _706 = fma(_694, _322, -0.5);
    float _708 = fma(_682, _650, _648);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _712 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = fma(_504, _278, _658);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _760 = abs(_742);
    out.m_53.x = _738;
    out.m_53.y = _744;
    out.m_53.z = _746;
    float _762 = precise::max(_688, -400.0);
    float _764 = fma(_680, _706, _686);
    out.m_55.x = _754;
    out.m_55.y = _756;
    out.m_55.z = _758;
    float _766 = precise::min(_762, -50.0);
    float _768 = _504 * 0.20000000298023223876953125;
    float _770 = float(_548);
    float _772 = _186 + (-0.5);
    float _774 = _160 + (-0.5);
    float _776 = fma(_766, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _778 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = _194 + (-0.5);
    bool _782 = _734 != 0.0;
    bool _784 = isnan(_734);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _794 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _796 = _604 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _798 = fma(_628, _696, _778);
    float _800 = float(_760);
    float _802 = fma(_628, _698, _794);
    float _804 = fma(_628, _700, _796);
    bool _806 = !_726;
    int _808 = _806 ? 0 : 1;
    float _810 = _276 * _768;
    float _812 = _800 * _770;
    float _814 = float(_556);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    int _818 = abs(_808);
    float _820 = _812 * (-2.0);
    float _822 = fma(_776, -0.5, 1.0);
    bool _824 = !_730;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _712;
    float _830 = float(_818);
    float _832 = fma(_820, _748, _748);
    float _834 = fma(_822, _656, _810);
    int _836 = abs(_826);
    float _838 = fma(_342, _820, _342);
    float _840 = _830 * _814;
    float _842 = _280 * _768;
    float _844 = in.m_37.w;
    float _846 = float(_570);
    float _848 = _840 * (-2.0);
    float _850 = float(_836);
    float _852 = in.m_30.x;
    float _854 = in.m_30.y;
    float _856 = in.m_30.z;
    float _858 = fma(_822, _660, _842);
    float _860 = fma(_848, _750, _750);
    float _862 = fma(_306, _848, _306);
    float _864 = _850 * _846;
    float _866 = _456 + 0.5;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].y, _860);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[196].x, _832);
    float _872 = _864 * (-2.0);
    float _874 = _704 + 0.5;
    float _876 = fma(_862, _692, _868);
    float _878 = fma(_838, _692, _870);
    float _880 = fma(_872, _752, _752);
    float _882 = fma(_310, _872, _310);
    float _884 = _708 + 0.5;
    float _886 = _878 * 0.15915493667125701904296875;
    float _888 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _890 = _764 + 0.5;
    float _892 = _876 * 0.15915493667125701904296875;
    bool _894 = _834 == 0.0;
    bool _896 = !_790;
    bool _898 = _894 && _896;
    float _900 = fma(_882, _692, _888);
    float _902 = _886 * 6.283185482025146484375;
    float _904 = sin(_902);
    out.m_57.x = _884;
    out.m_57.y = _866;
    out.m_57.z = _890;
    out.m_57.w = _874;
    bool _906 = _858 == 0.0;
    bool _908 = _906 && _898;
    float _910 = fma(_804, _844, _856);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = fma(_802, _844, _854);
    float _916 = fma(_798, _844, _852);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _920 = _886 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _834);
    float _926 = in.m_41.z;
    float _928 = _924 * _792;
    float _930 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _692;
    float _938 = _914;
    if (_908)
    {
        _936 = _278;
    }
    float _940 = _936;
    float _942 = _940;
    if (!_908)
    {
        float _944 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _942 = _944;
    }
    float _946 = _942;
    float _948 = _918 * _930;
    float _950 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_908)
    {
        _938 = _276;
    }
    float _956 = _938;
    float _958 = _892 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].x, _950);
    float _964 = _956;
    if (!_908)
    {
        float _966 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _972 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].x, _954);
    float _974 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _962);
    if (!_908)
    {
        float _976 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _280);
        _352 = _976;
    }
    float _978 = _352;
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _970);
    float _982 = _912 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _904 * _934;
    float _988 = _922 * _934;
    float _990 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _972);
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_59.z = _926;
    float _994 = _912 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _922 * _960;
    float _1000 = _904 * _960;
    float _1002 = _960 * _984;
    float _1004 = _922 * _984;
    float _1006 = _904 * _984;
    float _1008 = _934 * _984;
    float _1010 = _1004 * _244;
    float _1012 = _1006 * _244;
    float _1014 = fma(_996, _998, _986);
    float _1016 = fma(_996, _986, _998);
    float _1018 = -_988;
    float _1020 = fma(_996, _1000, _1018);
    float _1022 = -_1000;
    float _1024 = fma(_996, _988, _1022);
    float _1026 = -_244;
    float _1028 = _996 * _1026;
    float _1030 = _1004 * _828;
    float _1032 = -_946;
    float _1034 = _996 * _1032;
    float _1036 = -_828;
    float _1038 = _996 * _1036;
    float _1040 = _1006 * _828;
    float _1042 = fma(_1014, _928, _1030);
    float _1044 = fma(_1002, _968, _1034);
    float _1046 = _1004 * _946;
    float _1048 = fma(_1002, _928, _1038);
    float _1050 = fma(_1024, _948, _1042);
    float _1052 = _1006 * _946;
    float _1054 = -_406;
    float _1056 = _996 * _1054;
    float _1058 = fma(_1002, _242, _1028);
    float _1060 = _1004 * _406;
    float _1062 = _1006 * _406;
    float _1064 = fma(_1020, _928, _1040);
    float _1066 = fma(_1014, _968, _1046);
    float _1068 = fma(_1008, _948, _1048);
    float _1070 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1072 = fma(_1014, _242, _1010);
    float _1074 = fma(_1020, _242, _1012);
    float _1076 = fma(_1016, _948, _1064);
    float _1078 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1070);
    float _1082 = fma(_1002, _402, _1056);
    float _1084 = fma(_1020, _968, _1052);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1080);
    float _1090 = fma(_1008, _978, _1044);
    float _1092 = fma(_1024, _978, _1066);
    float _1094 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1086);
    float _1098 = _992 + _1088;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1102 = fma(_1016, _978, _1084);
    float _1104 = _1094 + _1096;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1108 = _1098 + _1106;
    float _1110 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1112 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1114 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1100);
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1104 + _1116;
    float _1120 = _1108 * _1108;
    float _1122 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1110);
    float _1124 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1112);
    float _1126 = fma(_1014, _402, _1060);
    float _1128 = fma(_1118, _1118, _1120);
    float _1130 = fma(_1024, _246, _1072);
    float _1132 = fma(_1008, _246, _1058);
    float _1134 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = sqrt(_1128);
    float _1138 = fma(_1016, _246, _1074);
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1146 = fma(_1020, _402, _1062);
    float _1148 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1122);
    float _1150 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1152 = fma(_1024, _410, _1126);
    float _1154 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1114);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1140);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1142);
    float _1160 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1124);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1144);
    float _1164 = fma(_1008, _410, _1082);
    float _1166 = fma(_1016, _410, _1146);
    bool _1168 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1150);
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1176 = _990 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1178 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1180 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1156);
    float _1182 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    out.m_61.x = _1148;
    out.m_61.y = _1154;
    out.m_61.z = _1160;
    float _1186 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1176 + _1170;
    out.m_63.x = _1180;
    out.m_63.y = _1182;
    out.m_63.z = _1184;
    float _1190 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1174);
    float _1192 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1178);
    float _1194 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1196 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1198 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1192);
    float _1200 = _1180;
    float _1202 = _1184;
    float _1204 = _1182;
    if (!_1168)
    {
        _1200 = _1104;
    }
    float _1206 = _1200;
    float _1208 = _1206;
    if (!_1168)
    {
        _1202 = _1098;
    }
    float _1210 = _1202;
    float _1212 = _1210;
    if (!_1168)
    {
        _1204 = _1188;
    }
    float _1214 = _1204;
    bool _1216 = !_1168;
    float _1218 = _1214;
    if (!_1216)
    {
        float _1220 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1224 = _1136 + _1222;
        float _1226 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1228 = rsqrt(_1128);
        float _1230 = _1224 * _1220;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1232 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        float _1242 = _1236 + (-1.0);
        float _1244 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = fma(_1240, _1226, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1248 = fma(_1188, _1236, _1244);
        float _1250 = _1228 * _1246;
        float _1252 = fma(_1118, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1254 = fma(_1108, _1250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1218 = _1248;
        _1208 = _1252;
        _1212 = _1254;
    }
    float _1256 = _1218;
    float _1258 = _1208;
    float _1260 = _1212;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1264);
    float _1274 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    out.m_65.x = _1194;
    out.m_65.y = _1196;
    out.m_65.z = _1198;
    float _1276 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1278 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1272);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1274);
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1288 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1296 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1294);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    float _1312 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1320 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1314);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_67.x = _1258;
    out.m_67.y = _1256;
    out.m_67.z = _1260;
    out.m_33.x = 1.0;
    out.m_69.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1320;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1318;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

