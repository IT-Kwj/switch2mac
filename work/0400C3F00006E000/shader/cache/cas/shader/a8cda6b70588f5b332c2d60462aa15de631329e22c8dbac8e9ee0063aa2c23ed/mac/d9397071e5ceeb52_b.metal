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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_59 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
    float4 m_45 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _446 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2104 = as_type<float>(_96);
        out.gl_Position.z = _2104;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2173 = as_type<float>(_132);
        out.gl_Position.z = _2173;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_37.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_39.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _298 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _300 = isnan(_284);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _314 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = isnan(_284);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _328;
    float _332 = -_308;
    float _334 = _332 + 1.0;
    bool _336 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _338 = isnan(_284);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _296;
    float _352 = 1.0 / _312;
    float _354 = _330 * _326;
    float _356 = -_324;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _364 = _324 * _334;
    float _366 = fma(_354, _288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _368 = _346 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _370;
    float _374 = _362 * _350;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _284 + _388;
    float _392 = _366 * _368;
    float _394 = -_346;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = _284 + _398;
    float _402 = fma(_374, _390, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = -_386;
    float _406 = _404 + 1.0;
    float _408 = _372 * _352;
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _412 = _308 * _406;
    float _414 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _416 = fma(_402, _364, _410);
    float _418 = fma(_414, _412, _416);
    float _420 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[118].x, _418);
    float _422 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _422;
    bool _424 = !_348;
    float _426 = _364;
    float _444;
    if (!_424)
    {
        float _428 = in.m_39.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_80);
        float _450 = 1.0 / _448;
        float _452 = _114 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _458 = int(_456);
    float _460 = in.m_43.y;
    float _462 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = in.m_39.y;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _468 = _466 != 0;
    float _470 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = in.m_43.x;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _484 = _482 != 0;
    float _486 = in.m_39.x;
    float _488 = float(_458);
    float _490 = in.m_45.w;
    float _492 = 1.0 / _488;
    float _494 = float(uint(_474));
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _498 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _500 = _464 > 0.5;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _504 = 1.0 / _494;
    float _506 = float(_80);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _510 = _114 * _492;
    int _512 = ~_474;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_47.w = _490;
    float _520 = 1.0 / _506;
    int _522 = as_type<int>(_504) + (-2);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _524;
    float _528 = trunc(_510);
    int _530 = int(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _536 = 1.0 / _518;
    float _538 = float(uint(_530));
    float _540 = as_type<float>(_522) * _538;
    float _542 = in.m_39.w;
    float _544 = _526 * _536;
    float _546 = trunc(_540);
    float _548 = precise::max(_546, 0.0);
    uint _551 = uint(_548);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = _514 * int(_551);
    int _557 = _555 + _530;
    float _559 = float(uint(_557));
    float _561 = -_460;
    float _563 = _561 + 1.0;
    bool _565 = _542 > 0.5;
    int _567 = ~_474;
    int _569 = _567 + 1;
    float _571 = as_type<float>(_522) * _559;
    int _573 = _565 ? as_type<int>(_563) : as_type<int>(_460);
    float _575 = _559;
    float _577 = _460;
    bool _579 = _500;
    int _581 = as_type<int>(_540);
    if (!_468)
    {
        _575 = _476;
    }
    float _583 = _575;
    float _585 = _484 ? as_type<float>(_573) : _460;
    float _587 = trunc(_571);
    float _589 = precise::max(_587, 0.0);
    uint _591 = uint(_589);
    float _593 = _583;
    if (_480)
    {
        float _595 = _500 ? _563 : _460;
        _577 = _595;
    }
    float _597 = _577;
    if (_468)
    {
        bool _599 = _486 > 0.5;
        _579 = _599;
    }
    bool _601 = _579;
    if (!_468)
    {
        _426 = _583;
    }
    float _603 = _426;
    float _605 = _603;
    if (_468)
    {
        _593 = _476;
    }
    float _607 = _593;
    if (_468)
    {
        float _609 = -_607;
        float _611 = _609 + 1.0;
        _581 = as_type<int>(_611);
    }
    int _613 = _581;
    int _615 = int(_551) + int(_591);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_49.x;
    float _631 = in.m_49.y;
    float _633 = in.m_49.z;
    if (_468)
    {
        float _635 = _601 ? as_type<float>(_613) : _607;
        _605 = _635;
    }
    float _637 = _605;
    int _639 = _569 * _615;
    int _641 = _639 + _530;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _645 = _643 != 0;
    bool _647 = uint(_641) >= uint(_474);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _651 = _649 != 0;
    float _653 = in.m_37.x;
    float _655 = in.m_37.y;
    float _657 = in.m_37.z;
    bool _659 = !_647;
    int _661 = _659 ? 0 : (-1);
    bool _663 = !_623;
    int _665 = _663 ? 0 : 1;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _683 = !_651;
    float _685 = _683 ? 7.345489978790283203125 : 1.0;
    float _687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _689 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _691 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _695 = _464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _697 = !_619;
    int _699 = _697 ? 0 : 1;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = fma(_695, -2.0, _508);
    float _715 = _655 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _470);
    bool _719 = !_627;
    int _721 = _719 ? 0 : 1;
    float _723 = _653 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = _657 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _727 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.5);
    bool _735 = _731 || _733;
    float _737 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    float _739 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _741 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = -_741;
    float _749 = _747 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = -_701;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -_496;
    float _757 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _755);
    float _759 = -_498;
    float _761 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _759);
    float _763 = -_502;
    float _765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _769 = (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _771 = _633;
    bool _773 = _645;
    if (_677)
    {
        float _775 = in.m_39.z;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = -_745;
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _749 * _749;
    float _787 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _789 = -_767;
    float _791 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _793 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _795 = -_779;
    float _797 = _795 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _799 = fma(_783, _783, _785);
    float _801 = -_787;
    float _803 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _801);
    float _805 = -_793;
    float _807 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _805);
    float _809 = fma(_797, _797, _799);
    float _811 = float(_474);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _799;
    if (!_651)
    {
        float _819 = in.m_39.z;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _825 = rsqrt(_809);
    float _827 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _831 = abs(_721);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    float _835 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_51.x = _745;
    out.m_51.y = _741;
    out.m_51.z = _779;
    float _837 = 1.0 / _815;
    float _839 = _835 * _633;
    if (_735)
    {
        _771 = 1.0;
    }
    float _841 = _771;
    float _843 = _797 * _825;
    float _845 = _114 * _811;
    float _847 = _749 * _825;
    float _849 = _845 * _520;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _853 = !_645;
    int _855 = _853 ? 0 : 1;
    float _857 = _534 * _837;
    float _859 = _837;
    float _861 = _841;
    if (_677)
    {
        bool _863 = _777 > 0.5;
        _773 = _863;
    }
    bool _865 = _773;
    float _867 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_651)
    {
        _859 = _464;
    }
    float _871 = _859;
    float _873 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _875 = _867 * _687;
    float _877 = _869 * _693;
    float _879 = _783 * _825;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _887 = _454 + _885;
    float _889 = _879 * _879;
    float _891 = _685 * _486;
    float _893 = fma(_585, _883, -0.5);
    float _895 = fma(_544, _887, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _897 = fma(_843, _843, _889);
    float _899 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _901 = _871;
    float _903 = _887;
    if (_651)
    {
        _901 = _486;
    }
    float _905 = _901;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _909 = _454 + _907;
    float _911 = _821;
    if (!_651)
    {
        _903 = _821;
    }
    float _913 = _903;
    float _915 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _917 = rsqrt(_897);
    float _919 = _913;
    if (_651)
    {
        _919 = _464;
    }
    float _921 = _919;
    float _923 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_651)
    {
        _911 = _464;
    }
    float _925 = _911;
    float _927 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _929 = -_899;
    float _931 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _933 = fma(_857, _909, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _935 = -_923;
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].y, _935);
    float _939 = -_927;
    float _941 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].y, _939);
    float _943 = -_823;
    float _945 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].w, _931);
    float _949 = -_827;
    float _951 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _949);
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].w, _941);
    bool _955 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _957 = isnan(_454);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_829;
    float _971 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _973 = _843 * _917;
    float _975 = _879 * _917;
    float _977 = -_967;
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    bool _981 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _983 = isnan(_454);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_973;
    float _995 = _843 * _993;
    float _997 = _847 * _975;
    float _999 = floor(_891);
    bool _1001 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1003 = isnan(_454);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = fma(_879, _975, _1013);
    float _1017 = -_965;
    float _1019 = _1017 + 1.0;
    float _1021 = -_991;
    float _1023 = _1021 + 1.0;
    float _1025 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].w, _951);
    float _1027 = _1015 * _1015;
    float _1029 = _991 * _1019;
    float _1031 = -_973;
    float _1033 = _847 * _1031;
    float _1035 = _1011 * _1023;
    float _1037 = fma(_997, _997, _1027);
    float _1039 = _803 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _1043 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].w, _937);
    float _1045 = -_1039;
    float _1047 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1045);
    float _1049 = fma(_1033, _1033, _1037);
    float _1051 = _895 * _1035;
    float _1053 = -_999;
    float _1055 = _891 + _1053;
    float _1057 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = float(_530);
    float _1063 = rsqrt(_1049);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1041);
    float _1069 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    bool _1071 = _1061 >= _811;
    bool _1073 = isnan(_1061);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_811);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1085 = _1055 * _811;
    float _1087 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].w, _945);
    int _1089 = ~_615;
    int _1091 = _1089 + _661;
    int _1093 = _1091 + 1;
    float _1095 = 1.0 / _1067;
    float _1097 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[0].w, _971);
    bool _1099 = _474 == 0;
    int _1101 = _474 * _1093;
    int _1103 = _1101 + _530;
    bool _1105 = !_669;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1111 = _474 + (-1);
    float _1113 = trunc(_1081);
    int _1115 = int(_1113);
    float _1117 = _1015 * _1063;
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    bool _1121 = !_1099;
    int _1123 = _1121 ? _1103 : (-1);
    float _1125 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    int _1127 = abs(_855);
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = _921 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = fma(_1087, _1095, -1.0);
    float _1137 = _1131 * _1095;
    float _1139 = trunc(_1085);
    int _1141 = int(_1139);
    float _1143 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _597, -0.5);
    float _1145 = fma(_1131, _1135, 1.0);
    float _1147 = _1043 * _1137;
    int _1149 = ~_1115;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = _1145 * _1145;
    float _1157 = trunc(_849);
    int _1159 = int(_1157);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1163 = _1123 * _1153;
    float _1165 = _1097 * _1137;
    float _1167 = fma(_1147, _1147, _1155);
    int _1169 = abs(_665);
    int _1171 = _1115 * _1111;
    int _1173 = _1171 + _1163;
    int _1175 = abs(_1107);
    float _1177 = fma(_1165, _1165, _1167);
    int _1179 = abs(_699);
    float _1181 = -_1161;
    float _1183 = fma(_1083, 2.0, _1181);
    int _1185 = _1141 * _1175;
    int _1187 = _1185 + _530;
    float _1189 = as_type<float>(_1175);
    int _1191 = _1127;
    float _1193 = _933;
    if (!_677)
    {
        _1189 = _607;
    }
    float _1195 = _1189;
    float _1197 = rsqrt(_1177);
    float _1199 = -_114;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1183);
    int _1203 = _1173 * _1169;
    float _1205 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1207 = _1159 * _1179;
    int _1209 = _1207 + _1203;
    float _1211 = _1195;
    if (_677)
    {
        float _1213 = -_607;
        float _1215 = _1213 + 1.0;
        _1191 = as_type<int>(_1215);
    }
    int _1217 = _1191;
    int _1219 = _1187 * _831;
    int _1221 = _1219 + _1209;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_677)
    {
        float _1225 = _865 ? as_type<float>(_1217) : _607;
        _1211 = _1225;
    }
    float _1227 = _1211;
    int _1229 = _1141 * _1127;
    int _1231 = _1229 + _1221;
    float _1233 = -_833;
    float _1235 = fma(_1205, _1143, _1233);
    float _1237 = _1145 * _1197;
    float _1239 = _1165 * _1197;
    float _1241 = _1147 * _1197;
    float _1243 = float(uint(_1231));
    float _1245 = _843 * _1237;
    float _1247 = -_1239;
    float _1249 = _879 * _1247;
    float _1251 = -_1241;
    float _1253 = _847 * _1251;
    float _1255 = -_1239;
    float _1257 = -_1245;
    float _1259 = fma(_847, _1255, _1257);
    float _1261 = -_1241;
    float _1263 = -_1249;
    float _1265 = fma(_843, _1261, _1263);
    float _1267 = as_type<float>(_522) * _1243;
    float _1269 = -_1253;
    float _1271 = fma(_879, _1237, _1269);
    float _1273 = -_1011;
    float _1275 = _1273 + 1.0;
    float _1277 = _1265 * _1265;
    float _1279 = trunc(_1267);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1051);
    float _1289 = fma(_1259, _1259, _1277);
    int _1291 = ~_474;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1133, -2.0, _1285);
    float _1297 = fma(_1271, _1271, _1289);
    float _1299 = fma(_933, _1029, _1287);
    float _1301 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1305 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _873);
    float _1307 = rsqrt(_1297);
    float _1309 = -_114;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _753);
    float _1313 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1315 = _1293 * int(_1283);
    int _1317 = _1315 + _1231;
    float _1319 = fma(_1301, _1227, -0.5);
    float _1321 = fma(_1305, _1303, _1311);
    float _1323 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1313);
    float _1325 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1327 = float(uint(_1317));
    float _1329 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1125);
    float _1331 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1295);
    float _1333 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1323);
    float _1335 = fma(_1325, _1319, _1201);
    float _1337 = as_type<float>(_522) * _1327;
    int _1339 = ~_474;
    int _1341 = _1339 + 1;
    float _1343 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1259 * _1307;
    float _1347 = _1271 * _1307;
    float _1349 = trunc(_1337);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = _1265 * _1307;
    float _1357 = _843 * _1345;
    float _1359 = float(uint(_1187));
    float _1361 = -_1331;
    float _1363 = fma(_1329, _893, _1361);
    float _1365 = _879 * _1355;
    float _1367 = -_1357;
    float _1369 = fma(_879, _1347, _1367);
    float _1371 = _847 * _1347;
    float _1373 = 1.0 / _1343;
    float _1375 = -_1365;
    float _1377 = fma(_847, _1345, _1375);
    float _1379 = as_type<float>(_522) * _1359;
    float _1381 = -_1371;
    float _1383 = fma(_843, _1355, _1381);
    float _1385 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = _1369 * _1369;
    float _1389 = _1331;
    float _1391 = _1387;
    float _1393 = _1343;
    float _1395 = _1379;
    if (!_735)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1397 = _1389;
    float _1399 = _1235 + 0.5;
    float _1401 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1403 = fma(_1383, _1383, _1387);
    float _1405 = trunc(_1379);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = int(_1283) + int(_1353);
    float _1413 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1415 = fma(_1377, _1377, _1403);
    int _1417 = ~_474;
    int _1419 = _1417 + 1;
    float _1421 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1425 = _1341 * _1411;
    int _1427 = _1425 + _1231;
    float _1429 = rsqrt(_1415);
    float _1431 = _1423 + _1343;
    float _1433 = as_type<float>(_1419);
    if (!_735)
    {
        _1391 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1435 = _1391;
    if (!_735)
    {
        float _1437 = -_1397;
        float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1393 = _1439;
    }
    float _1441 = _1393;
    bool _1443 = uint(_1427) >= uint(_474);
    float _1445 = _1431 * _1373;
    float _1447 = _1445 * 0.5;
    int _1449 = _1419 * int(_1409);
    int _1451 = _1449 + _1187;
    bool _1453 = !_1443;
    int _1455 = _1453 ? 0 : (-1);
    float _1457 = _1441;
    if (!_735)
    {
        float _1459 = -_1435;
        float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1433 = _1461;
    }
    float _1463 = _1433;
    if (!_735)
    {
        float _1465 = 1.0 / _1441;
        _1457 = _1465;
    }
    float _1467 = _1457;
    float _1469 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1471 = ~_1411;
    int _1473 = _1471 + _1455;
    int _1475 = _1473 + 1;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    float _1481 = float(uint(_1451));
    float _1483 = _1377 * _1429;
    float _1485 = _1369 * _1429;
    int _1487 = _474 * _1475;
    int _1489 = _1487 + _1231;
    float _1491 = 1.0 / _1479;
    float _1493 = as_type<float>(_522) * _1481;
    float _1495 = _1383 * _1429;
    float _1497 = _879 * _1483;
    bool _1499 = !_1099;
    int _1501 = _1499 ? _1489 : (-1);
    float _1503 = _843 * _1485;
    float _1505 = _847 * _1495;
    float _1507 = -_1497;
    float _1509 = fma(_843, _1495, _1507);
    int _1511 = _1501 >> 31;
    float _1513 = -_1503;
    float _1515 = fma(_847, _1483, _1513);
    float _1517 = -_1505;
    float _1519 = fma(_879, _1485, _1517);
    float _1521 = _1509 * _1509;
    int _1523 = _1511 & 3;
    float _1525 = _1463;
    float _1527 = _1467;
    if (!_735)
    {
        float _1529 = 1.0 / _1463;
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1321 + 0.5;
    float _1535 = fma(_1515, _1515, _1521);
    int _1537 = _1501 + _1523;
    if (!_735)
    {
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1541 = -_1435;
        float _1543 = fma(_1491, _1539, _1541);
        _1395 = _1543;
    }
    float _1545 = _1395;
    if (!_735)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1549 = -_1397;
        float _1551 = fma(_1491, _1547, _1549);
        _1193 = _1551;
    }
    float _1553 = _1193;
    float _1555 = fma(_1519, _1519, _1535);
    int _1557 = _1537 >> 2;
    float _1559 = trunc(_1493);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = _1501 & 3;
    bool _1567 = _1565 != 0;
    float _1569 = _1335 + 0.5;
    int _1571 = _1557 << 4;
    int _1573 = _1571 + 368;
    float _1575 = _1363 + 0.5;
    bool _1577 = uint(_1565) > 1u;
    float _1579 = _877 * _1483;
    uint _1581 = uint(int(uint(_1573) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    float _1597 = rsqrt(_1555);
    float _1599 = _1575;
    if (!_735)
    {
        float _1601 = _1545 * _1531;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _861 = _1603;
    }
    float _1605 = _861;
    int _1607 = _1501 & 3;
    bool _1609 = _1607 != 0;
    out.m_53.x = _1533;
    out.m_53.y = _1399;
    out.m_53.z = _1569;
    out.m_53.w = _1575;
    int _1611 = ~_474;
    int _1613 = _1611 + 1;
    float _1615 = _877 * _1495;
    float _1617 = _1605;
    if (!_735)
    {
        float _1619 = _1553 * _1467;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1527 = _1621;
    }
    float _1623 = _1527;
    out.m_55.w = _1469;
    int _1625 = int(_1409) + int(_1563);
    float _1627 = _875 * _1597;
    int _1629 = _1573 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = _1609 ? 0 : 1;
    float _1649 = fma(_1519, _1627, _1579);
    float _1651 = fma(_1515, _1627, _1615);
    int _1653 = ~_1647;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1657;
    if (!_1577)
    {
        int _1661 = ~_1647;
        int _1663 = _1661 + 1;
        _1659 = _1663;
    }
    int _1665 = _1659;
    int _1667 = _1613 * _1625;
    int _1669 = _1667 + _1187;
    float _1671 = fma(_839, _843, _1649);
    bool _1673 = _1565 != 3;
    float _1675 = fma(_839, _879, _1651);
    bool _1677 = uint(_1565) >= 2u;
    float _1679 = _779 + _1671;
    if (_735)
    {
        _1599 = 1.0;
    }
    float _1681 = _1599;
    float _1683 = _745 + _1675;
    int _1685 = _1677 ? 0 : 1;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1679 + _1687;
    float _1691 = _1681;
    float _1693 = _1689;
    if (!_735)
    {
        float _1695 = -_1623;
        float _1697 = _1695 + 1.0;
        _1691 = _1697;
    }
    float _1699 = _1691;
    bool _1701 = !_1567;
    int _1703 = _1701 ? 0 : 1;
    bool _1705 = uint(_1669) >= uint(_474);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1709 = _1683 + _1707;
    bool _1711 = _1565 != 3;
    float _1713 = _1689 * _1689;
    int _1715 = ~_1685;
    int _1717 = _1715 + 1;
    int _1719 = _1717 + 1;
    int _1721 = _1719;
    if (_1673)
    {
        int _1723 = ~_1685;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    int _1729 = abs(_1703);
    float _1731 = fma(_1709, _1709, _1713);
    int _1733 = abs(_1665);
    bool _1735 = !_1705;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = sqrt(_1731);
    int _1741 = ~_1733;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = ~_1625;
    int _1749 = _1747 + _1737;
    int _1751 = _1749 + 1;
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = _1745 * as_type<int>(_1595);
    int _1759 = abs(_1727);
    float _1761 = _877 * _1485;
    int _1763 = ~_1729;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    int _1769 = _474 * _1751;
    int _1771 = _1769 + _1187;
    int _1773 = abs(_1755);
    float _1775 = fma(_1509, _1627, _1761);
    int _1777 = _1767 * as_type<int>(_1587);
    int _1779 = _1777 + _1757;
    bool _1781 = !_673;
    int _1783 = _1781 ? 0 : 1;
    float _1785 = fma(_839, _847, _1775);
    float _1787 = _1605 * _1699;
    int _1789 = ~_1759;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _741 + _1785;
    bool _1797 = _1739 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1799 = abs(_1783);
    int _1801 = _1793 * as_type<int>(_1637);
    int _1803 = _1801 + _1779;
    int _1805 = ~_1773;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    bool _1811 = _1605 > 0.0;
    bool _1813 = isnan(_1605);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    int _1821 = _1809 * as_type<int>(_1645);
    int _1823 = _1821 + _1803;
    int _1825 = ~_1799;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    bool _1831 = _1699 <= 0.0;
    bool _1833 = !_1819;
    bool _1835 = _1831 || _1833;
    float _1837 = as_type<float>(_1823);
    float _1839 = as_type<float>(_1803);
    if (!_1797)
    {
        _1617 = _1679;
    }
    float _1841 = _1617;
    int _1843 = _1823 * _1829;
    float _1845 = _1841;
    if (!_1797)
    {
        _1837 = _1683;
    }
    float _1847 = _1837;
    float _1849 = _1847;
    if (!_1797)
    {
        _1839 = _1795;
    }
    float _1851 = _1839;
    bool _1853 = !_1797;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1739 + _1859;
        float _1863 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = rsqrt(_1731);
        float _1867 = _1861 * _1857;
        float _1869 = _1867 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1865 * _1881;
        float _1887 = fma(_1795, _1873, _1883);
        float _1889 = fma(_1709, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1689, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1855 = _1887;
        _1849 = _1889;
        _1845 = _1891;
    }
    float _1893 = _1855;
    float _1895 = _1849;
    float _1897 = _1845;
    bool _1899 = !_1099;
    int _1901 = _1899 ? _1771 : (-1);
    float _1903 = _1895;
    float _1905 = _1897;
    if (_711)
    {
        _1693 = _1893;
    }
    float _1907 = _1693;
    float _1909 = _1907;
    if (!_711)
    {
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1913 = _741 + _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1917 = _745 + _1915;
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1921 = -_741;
        float _1923 = _1921 + _1893;
        float _1925 = _1913 * _1913;
        float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1929 = _779 + _1927;
        float _1931 = fma(_1917, _1917, _1925);
        float _1933 = -_745;
        float _1935 = _1933 + _1895;
        float _1937 = fma(_1929, _1929, _1931);
        float _1939 = sqrt(_1937);
        float _1941 = precise::min(_1939, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1943 = _1941 * _1919;
        float _1945 = -_779;
        float _1947 = _1945 + _1897;
        float _1949 = fma(_1935, _1943, _745);
        float _1951 = fma(_1923, _1943, _741);
        float _1953 = fma(_1947, _1943, _779);
        _1909 = _1951;
        _1903 = _1949;
        _1905 = _1953;
    }
    float _1955 = _1909;
    float _1957 = _1903;
    float _1959 = _1905;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1963 = _1901 * _1799;
    int _1965 = _1963 + _1843;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1969 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1961);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1979 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1971);
    float _1981 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1973);
    float _1983 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1975);
    float _1985 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1977);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1989 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1981);
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1999 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1997);
    float _2007 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2013);
    float _2025 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2033 = float(_1965);
    float _2035 = _2025 + _2027;
    float _2037 = _2029 + _2027;
    float _2039 = _2027 * 0.5;
    float _2041 = _2035 * 0.5;
    float _2043 = _2037 * 0.5;
    float _2045 = fma(_2023, -0.5, _2039);
    out.m_33.x = _2031;
    out.m_57.x = _2033;
    out.m_59.x = _1957;
    out.m_59.y = _1955;
    out.m_59.z = _1959;
    out.gl_Position.x = _2025;
    out.gl_Position.y = _2023;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _2027;
    out.m_61.x = _2041;
    out.m_61.y = _2045;
    out.m_61.z = _2043;
    out.m_61.w = _2027;
    if (!_1835)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2047;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _446 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2104 = as_type<float>(_96);
        out.gl_Position.z = _2104;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2173 = as_type<float>(_132);
        out.gl_Position.z = _2173;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_37.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_39.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _298 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _300 = isnan(_284);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _314 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = isnan(_284);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _328;
    float _332 = -_308;
    float _334 = _332 + 1.0;
    bool _336 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _338 = isnan(_284);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _296;
    float _352 = 1.0 / _312;
    float _354 = _330 * _326;
    float _356 = -_324;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _364 = _324 * _334;
    float _366 = fma(_354, _288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _368 = _346 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _370;
    float _374 = _362 * _350;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _284 + _388;
    float _392 = _366 * _368;
    float _394 = -_346;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = _284 + _398;
    float _402 = fma(_374, _390, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = -_386;
    float _406 = _404 + 1.0;
    float _408 = _372 * _352;
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _412 = _308 * _406;
    float _414 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _416 = fma(_402, _364, _410);
    float _418 = fma(_414, _412, _416);
    float _420 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[118].x, _418);
    float _422 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _422;
    bool _424 = !_348;
    float _426 = _364;
    float _444;
    if (!_424)
    {
        float _428 = in.m_39.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_80);
        float _450 = 1.0 / _448;
        float _452 = _114 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _458 = int(_456);
    float _460 = in.m_43.y;
    float _462 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = in.m_39.y;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _468 = _466 != 0;
    float _470 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = in.m_43.x;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _484 = _482 != 0;
    float _486 = in.m_39.x;
    float _488 = float(_458);
    float _490 = in.m_45.w;
    float _492 = 1.0 / _488;
    float _494 = float(uint(_474));
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _498 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _500 = _464 > 0.5;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _504 = 1.0 / _494;
    float _506 = float(_80);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _510 = _114 * _492;
    int _512 = ~_474;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_47.w = _490;
    float _520 = 1.0 / _506;
    int _522 = as_type<int>(_504) + (-2);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _524;
    float _528 = trunc(_510);
    int _530 = int(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _536 = 1.0 / _518;
    float _538 = float(uint(_530));
    float _540 = as_type<float>(_522) * _538;
    float _542 = in.m_39.w;
    float _544 = _526 * _536;
    float _546 = trunc(_540);
    float _548 = precise::max(_546, 0.0);
    uint _551 = uint(_548);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = _514 * int(_551);
    int _557 = _555 + _530;
    float _559 = float(uint(_557));
    float _561 = -_460;
    float _563 = _561 + 1.0;
    bool _565 = _542 > 0.5;
    int _567 = ~_474;
    int _569 = _567 + 1;
    float _571 = as_type<float>(_522) * _559;
    int _573 = _565 ? as_type<int>(_563) : as_type<int>(_460);
    float _575 = _559;
    float _577 = _460;
    bool _579 = _500;
    int _581 = as_type<int>(_540);
    if (!_468)
    {
        _575 = _476;
    }
    float _583 = _575;
    float _585 = _484 ? as_type<float>(_573) : _460;
    float _587 = trunc(_571);
    float _589 = precise::max(_587, 0.0);
    uint _591 = uint(_589);
    float _593 = _583;
    if (_480)
    {
        float _595 = _500 ? _563 : _460;
        _577 = _595;
    }
    float _597 = _577;
    if (_468)
    {
        bool _599 = _486 > 0.5;
        _579 = _599;
    }
    bool _601 = _579;
    if (!_468)
    {
        _426 = _583;
    }
    float _603 = _426;
    float _605 = _603;
    if (_468)
    {
        _593 = _476;
    }
    float _607 = _593;
    if (_468)
    {
        float _609 = -_607;
        float _611 = _609 + 1.0;
        _581 = as_type<int>(_611);
    }
    int _613 = _581;
    int _615 = int(_551) + int(_591);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_49.x;
    float _631 = in.m_49.y;
    float _633 = in.m_49.z;
    if (_468)
    {
        float _635 = _601 ? as_type<float>(_613) : _607;
        _605 = _635;
    }
    float _637 = _605;
    int _639 = _569 * _615;
    int _641 = _639 + _530;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _645 = _643 != 0;
    bool _647 = uint(_641) >= uint(_474);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _651 = _649 != 0;
    float _653 = in.m_37.x;
    float _655 = in.m_37.y;
    float _657 = in.m_37.z;
    bool _659 = !_647;
    int _661 = _659 ? 0 : (-1);
    bool _663 = !_623;
    int _665 = _663 ? 0 : 1;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _683 = !_651;
    float _685 = _683 ? 7.345489978790283203125 : 1.0;
    float _687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _689 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _691 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _695 = _464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _697 = !_619;
    int _699 = _697 ? 0 : 1;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = fma(_695, -2.0, _508);
    float _715 = _655 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _470);
    bool _719 = !_627;
    int _721 = _719 ? 0 : 1;
    float _723 = _653 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = _657 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _727 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.5);
    bool _735 = _731 || _733;
    float _737 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    float _739 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _741 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = -_741;
    float _749 = _747 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = -_701;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -_496;
    float _757 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _755);
    float _759 = -_498;
    float _761 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _759);
    float _763 = -_502;
    float _765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _769 = (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _771 = _633;
    bool _773 = _645;
    if (_677)
    {
        float _775 = in.m_39.z;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = -_745;
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _749 * _749;
    float _787 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _789 = -_767;
    float _791 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _793 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _795 = -_779;
    float _797 = _795 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _799 = fma(_783, _783, _785);
    float _801 = -_787;
    float _803 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _801);
    float _805 = -_793;
    float _807 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _805);
    float _809 = fma(_797, _797, _799);
    float _811 = float(_474);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _799;
    if (!_651)
    {
        float _819 = in.m_39.z;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _825 = rsqrt(_809);
    float _827 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _831 = abs(_721);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    float _835 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_51.x = _745;
    out.m_51.y = _741;
    out.m_51.z = _779;
    float _837 = 1.0 / _815;
    float _839 = _835 * _633;
    if (_735)
    {
        _771 = 1.0;
    }
    float _841 = _771;
    float _843 = _797 * _825;
    float _845 = _114 * _811;
    float _847 = _749 * _825;
    float _849 = _845 * _520;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _853 = !_645;
    int _855 = _853 ? 0 : 1;
    float _857 = _534 * _837;
    float _859 = _837;
    float _861 = _841;
    if (_677)
    {
        bool _863 = _777 > 0.5;
        _773 = _863;
    }
    bool _865 = _773;
    float _867 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_651)
    {
        _859 = _464;
    }
    float _871 = _859;
    float _873 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _875 = _867 * _687;
    float _877 = _869 * _693;
    float _879 = _783 * _825;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _887 = _454 + _885;
    float _889 = _879 * _879;
    float _891 = _685 * _486;
    float _893 = fma(_585, _883, -0.5);
    float _895 = fma(_544, _887, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _897 = fma(_843, _843, _889);
    float _899 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _901 = _871;
    float _903 = _887;
    if (_651)
    {
        _901 = _486;
    }
    float _905 = _901;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _909 = _454 + _907;
    float _911 = _821;
    if (!_651)
    {
        _903 = _821;
    }
    float _913 = _903;
    float _915 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _917 = rsqrt(_897);
    float _919 = _913;
    if (_651)
    {
        _919 = _464;
    }
    float _921 = _919;
    float _923 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_651)
    {
        _911 = _464;
    }
    float _925 = _911;
    float _927 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _929 = -_899;
    float _931 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _933 = fma(_857, _909, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _935 = -_923;
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].y, _935);
    float _939 = -_927;
    float _941 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].y, _939);
    float _943 = -_823;
    float _945 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].w, _931);
    float _949 = -_827;
    float _951 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _949);
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].w, _941);
    bool _955 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _957 = isnan(_454);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_829;
    float _971 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _973 = _843 * _917;
    float _975 = _879 * _917;
    float _977 = -_967;
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    bool _981 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _983 = isnan(_454);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_973;
    float _995 = _843 * _993;
    float _997 = _847 * _975;
    float _999 = floor(_891);
    bool _1001 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1003 = isnan(_454);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = fma(_879, _975, _1013);
    float _1017 = -_965;
    float _1019 = _1017 + 1.0;
    float _1021 = -_991;
    float _1023 = _1021 + 1.0;
    float _1025 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].w, _951);
    float _1027 = _1015 * _1015;
    float _1029 = _991 * _1019;
    float _1031 = -_973;
    float _1033 = _847 * _1031;
    float _1035 = _1011 * _1023;
    float _1037 = fma(_997, _997, _1027);
    float _1039 = _803 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _1043 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].w, _937);
    float _1045 = -_1039;
    float _1047 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1045);
    float _1049 = fma(_1033, _1033, _1037);
    float _1051 = _895 * _1035;
    float _1053 = -_999;
    float _1055 = _891 + _1053;
    float _1057 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = float(_530);
    float _1063 = rsqrt(_1049);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1041);
    float _1069 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    bool _1071 = _1061 >= _811;
    bool _1073 = isnan(_1061);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_811);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1085 = _1055 * _811;
    float _1087 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].w, _945);
    int _1089 = ~_615;
    int _1091 = _1089 + _661;
    int _1093 = _1091 + 1;
    float _1095 = 1.0 / _1067;
    float _1097 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[0].w, _971);
    bool _1099 = _474 == 0;
    int _1101 = _474 * _1093;
    int _1103 = _1101 + _530;
    bool _1105 = !_669;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1111 = _474 + (-1);
    float _1113 = trunc(_1081);
    int _1115 = int(_1113);
    float _1117 = _1015 * _1063;
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    bool _1121 = !_1099;
    int _1123 = _1121 ? _1103 : (-1);
    float _1125 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    int _1127 = abs(_855);
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = _921 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = fma(_1087, _1095, -1.0);
    float _1137 = _1131 * _1095;
    float _1139 = trunc(_1085);
    int _1141 = int(_1139);
    float _1143 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _597, -0.5);
    float _1145 = fma(_1131, _1135, 1.0);
    float _1147 = _1043 * _1137;
    int _1149 = ~_1115;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = _1145 * _1145;
    float _1157 = trunc(_849);
    int _1159 = int(_1157);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1163 = _1123 * _1153;
    float _1165 = _1097 * _1137;
    float _1167 = fma(_1147, _1147, _1155);
    int _1169 = abs(_665);
    int _1171 = _1115 * _1111;
    int _1173 = _1171 + _1163;
    int _1175 = abs(_1107);
    float _1177 = fma(_1165, _1165, _1167);
    int _1179 = abs(_699);
    float _1181 = -_1161;
    float _1183 = fma(_1083, 2.0, _1181);
    int _1185 = _1141 * _1175;
    int _1187 = _1185 + _530;
    float _1189 = as_type<float>(_1175);
    int _1191 = _1127;
    float _1193 = _933;
    if (!_677)
    {
        _1189 = _607;
    }
    float _1195 = _1189;
    float _1197 = rsqrt(_1177);
    float _1199 = -_114;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1183);
    int _1203 = _1173 * _1169;
    float _1205 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1207 = _1159 * _1179;
    int _1209 = _1207 + _1203;
    float _1211 = _1195;
    if (_677)
    {
        float _1213 = -_607;
        float _1215 = _1213 + 1.0;
        _1191 = as_type<int>(_1215);
    }
    int _1217 = _1191;
    int _1219 = _1187 * _831;
    int _1221 = _1219 + _1209;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_677)
    {
        float _1225 = _865 ? as_type<float>(_1217) : _607;
        _1211 = _1225;
    }
    float _1227 = _1211;
    int _1229 = _1141 * _1127;
    int _1231 = _1229 + _1221;
    float _1233 = -_833;
    float _1235 = fma(_1205, _1143, _1233);
    float _1237 = _1145 * _1197;
    float _1239 = _1165 * _1197;
    float _1241 = _1147 * _1197;
    float _1243 = float(uint(_1231));
    float _1245 = _843 * _1237;
    float _1247 = -_1239;
    float _1249 = _879 * _1247;
    float _1251 = -_1241;
    float _1253 = _847 * _1251;
    float _1255 = -_1239;
    float _1257 = -_1245;
    float _1259 = fma(_847, _1255, _1257);
    float _1261 = -_1241;
    float _1263 = -_1249;
    float _1265 = fma(_843, _1261, _1263);
    float _1267 = as_type<float>(_522) * _1243;
    float _1269 = -_1253;
    float _1271 = fma(_879, _1237, _1269);
    float _1273 = -_1011;
    float _1275 = _1273 + 1.0;
    float _1277 = _1265 * _1265;
    float _1279 = trunc(_1267);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1051);
    float _1289 = fma(_1259, _1259, _1277);
    int _1291 = ~_474;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1133, -2.0, _1285);
    float _1297 = fma(_1271, _1271, _1289);
    float _1299 = fma(_933, _1029, _1287);
    float _1301 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1305 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _873);
    float _1307 = rsqrt(_1297);
    float _1309 = -_114;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _753);
    float _1313 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1315 = _1293 * int(_1283);
    int _1317 = _1315 + _1231;
    float _1319 = fma(_1301, _1227, -0.5);
    float _1321 = fma(_1305, _1303, _1311);
    float _1323 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1313);
    float _1325 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1327 = float(uint(_1317));
    float _1329 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1125);
    float _1331 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1295);
    float _1333 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1323);
    float _1335 = fma(_1325, _1319, _1201);
    float _1337 = as_type<float>(_522) * _1327;
    int _1339 = ~_474;
    int _1341 = _1339 + 1;
    float _1343 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1259 * _1307;
    float _1347 = _1271 * _1307;
    float _1349 = trunc(_1337);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = _1265 * _1307;
    float _1357 = _843 * _1345;
    float _1359 = float(uint(_1187));
    float _1361 = -_1331;
    float _1363 = fma(_1329, _893, _1361);
    float _1365 = _879 * _1355;
    float _1367 = -_1357;
    float _1369 = fma(_879, _1347, _1367);
    float _1371 = _847 * _1347;
    float _1373 = 1.0 / _1343;
    float _1375 = -_1365;
    float _1377 = fma(_847, _1345, _1375);
    float _1379 = as_type<float>(_522) * _1359;
    float _1381 = -_1371;
    float _1383 = fma(_843, _1355, _1381);
    float _1385 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = _1369 * _1369;
    float _1389 = _1331;
    float _1391 = _1387;
    float _1393 = _1343;
    float _1395 = _1379;
    if (!_735)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1397 = _1389;
    float _1399 = _1235 + 0.5;
    float _1401 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1403 = fma(_1383, _1383, _1387);
    float _1405 = trunc(_1379);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = int(_1283) + int(_1353);
    float _1413 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1415 = fma(_1377, _1377, _1403);
    int _1417 = ~_474;
    int _1419 = _1417 + 1;
    float _1421 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1425 = _1341 * _1411;
    int _1427 = _1425 + _1231;
    float _1429 = rsqrt(_1415);
    float _1431 = _1423 + _1343;
    float _1433 = as_type<float>(_1419);
    if (!_735)
    {
        _1391 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1435 = _1391;
    if (!_735)
    {
        float _1437 = -_1397;
        float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1393 = _1439;
    }
    float _1441 = _1393;
    bool _1443 = uint(_1427) >= uint(_474);
    float _1445 = _1431 * _1373;
    float _1447 = _1445 * 0.5;
    int _1449 = _1419 * int(_1409);
    int _1451 = _1449 + _1187;
    bool _1453 = !_1443;
    int _1455 = _1453 ? 0 : (-1);
    float _1457 = _1441;
    if (!_735)
    {
        float _1459 = -_1435;
        float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1433 = _1461;
    }
    float _1463 = _1433;
    if (!_735)
    {
        float _1465 = 1.0 / _1441;
        _1457 = _1465;
    }
    float _1467 = _1457;
    float _1469 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1471 = ~_1411;
    int _1473 = _1471 + _1455;
    int _1475 = _1473 + 1;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    float _1481 = float(uint(_1451));
    float _1483 = _1377 * _1429;
    float _1485 = _1369 * _1429;
    int _1487 = _474 * _1475;
    int _1489 = _1487 + _1231;
    float _1491 = 1.0 / _1479;
    float _1493 = as_type<float>(_522) * _1481;
    float _1495 = _1383 * _1429;
    float _1497 = _879 * _1483;
    bool _1499 = !_1099;
    int _1501 = _1499 ? _1489 : (-1);
    float _1503 = _843 * _1485;
    float _1505 = _847 * _1495;
    float _1507 = -_1497;
    float _1509 = fma(_843, _1495, _1507);
    int _1511 = _1501 >> 31;
    float _1513 = -_1503;
    float _1515 = fma(_847, _1483, _1513);
    float _1517 = -_1505;
    float _1519 = fma(_879, _1485, _1517);
    float _1521 = _1509 * _1509;
    int _1523 = _1511 & 3;
    float _1525 = _1463;
    float _1527 = _1467;
    if (!_735)
    {
        float _1529 = 1.0 / _1463;
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1321 + 0.5;
    float _1535 = fma(_1515, _1515, _1521);
    int _1537 = _1501 + _1523;
    if (!_735)
    {
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1541 = -_1435;
        float _1543 = fma(_1491, _1539, _1541);
        _1395 = _1543;
    }
    float _1545 = _1395;
    if (!_735)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1549 = -_1397;
        float _1551 = fma(_1491, _1547, _1549);
        _1193 = _1551;
    }
    float _1553 = _1193;
    float _1555 = fma(_1519, _1519, _1535);
    int _1557 = _1537 >> 2;
    float _1559 = trunc(_1493);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = _1501 & 3;
    bool _1567 = _1565 != 0;
    float _1569 = _1335 + 0.5;
    int _1571 = _1557 << 4;
    int _1573 = _1571 + 368;
    float _1575 = _1363 + 0.5;
    bool _1577 = uint(_1565) > 1u;
    float _1579 = _877 * _1483;
    uint _1581 = uint(int(uint(_1573) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    float _1597 = rsqrt(_1555);
    float _1599 = _1575;
    if (!_735)
    {
        float _1601 = _1545 * _1531;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _861 = _1603;
    }
    float _1605 = _861;
    int _1607 = _1501 & 3;
    bool _1609 = _1607 != 0;
    out.m_53.x = _1533;
    out.m_53.y = _1399;
    out.m_53.z = _1569;
    out.m_53.w = _1575;
    int _1611 = ~_474;
    int _1613 = _1611 + 1;
    float _1615 = _877 * _1495;
    float _1617 = _1605;
    if (!_735)
    {
        float _1619 = _1553 * _1467;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1527 = _1621;
    }
    float _1623 = _1527;
    out.m_55.w = _1469;
    int _1625 = int(_1409) + int(_1563);
    float _1627 = _875 * _1597;
    int _1629 = _1573 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = _1609 ? 0 : 1;
    float _1649 = fma(_1519, _1627, _1579);
    float _1651 = fma(_1515, _1627, _1615);
    int _1653 = ~_1647;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1657;
    if (!_1577)
    {
        int _1661 = ~_1647;
        int _1663 = _1661 + 1;
        _1659 = _1663;
    }
    int _1665 = _1659;
    int _1667 = _1613 * _1625;
    int _1669 = _1667 + _1187;
    float _1671 = fma(_839, _843, _1649);
    bool _1673 = _1565 != 3;
    float _1675 = fma(_839, _879, _1651);
    bool _1677 = uint(_1565) >= 2u;
    float _1679 = _779 + _1671;
    if (_735)
    {
        _1599 = 1.0;
    }
    float _1681 = _1599;
    float _1683 = _745 + _1675;
    int _1685 = _1677 ? 0 : 1;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1679 + _1687;
    float _1691 = _1681;
    float _1693 = _1689;
    if (!_735)
    {
        float _1695 = -_1623;
        float _1697 = _1695 + 1.0;
        _1691 = _1697;
    }
    float _1699 = _1691;
    bool _1701 = !_1567;
    int _1703 = _1701 ? 0 : 1;
    bool _1705 = uint(_1669) >= uint(_474);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1709 = _1683 + _1707;
    bool _1711 = _1565 != 3;
    float _1713 = _1689 * _1689;
    int _1715 = ~_1685;
    int _1717 = _1715 + 1;
    int _1719 = _1717 + 1;
    int _1721 = _1719;
    if (_1673)
    {
        int _1723 = ~_1685;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    int _1729 = abs(_1703);
    float _1731 = fma(_1709, _1709, _1713);
    int _1733 = abs(_1665);
    bool _1735 = !_1705;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = sqrt(_1731);
    int _1741 = ~_1733;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = ~_1625;
    int _1749 = _1747 + _1737;
    int _1751 = _1749 + 1;
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = _1745 * as_type<int>(_1595);
    int _1759 = abs(_1727);
    float _1761 = _877 * _1485;
    int _1763 = ~_1729;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    int _1769 = _474 * _1751;
    int _1771 = _1769 + _1187;
    int _1773 = abs(_1755);
    float _1775 = fma(_1509, _1627, _1761);
    int _1777 = _1767 * as_type<int>(_1587);
    int _1779 = _1777 + _1757;
    bool _1781 = !_673;
    int _1783 = _1781 ? 0 : 1;
    float _1785 = fma(_839, _847, _1775);
    float _1787 = _1605 * _1699;
    int _1789 = ~_1759;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _741 + _1785;
    bool _1797 = _1739 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1799 = abs(_1783);
    int _1801 = _1793 * as_type<int>(_1637);
    int _1803 = _1801 + _1779;
    int _1805 = ~_1773;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    bool _1811 = _1605 > 0.0;
    bool _1813 = isnan(_1605);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    int _1821 = _1809 * as_type<int>(_1645);
    int _1823 = _1821 + _1803;
    int _1825 = ~_1799;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    bool _1831 = _1699 <= 0.0;
    bool _1833 = !_1819;
    bool _1835 = _1831 || _1833;
    float _1837 = as_type<float>(_1823);
    float _1839 = as_type<float>(_1803);
    if (!_1797)
    {
        _1617 = _1679;
    }
    float _1841 = _1617;
    int _1843 = _1823 * _1829;
    float _1845 = _1841;
    if (!_1797)
    {
        _1837 = _1683;
    }
    float _1847 = _1837;
    float _1849 = _1847;
    if (!_1797)
    {
        _1839 = _1795;
    }
    float _1851 = _1839;
    bool _1853 = !_1797;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1739 + _1859;
        float _1863 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = rsqrt(_1731);
        float _1867 = _1861 * _1857;
        float _1869 = _1867 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1865 * _1881;
        float _1887 = fma(_1795, _1873, _1883);
        float _1889 = fma(_1709, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1689, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1855 = _1887;
        _1849 = _1889;
        _1845 = _1891;
    }
    float _1893 = _1855;
    float _1895 = _1849;
    float _1897 = _1845;
    bool _1899 = !_1099;
    int _1901 = _1899 ? _1771 : (-1);
    float _1903 = _1895;
    float _1905 = _1897;
    if (_711)
    {
        _1693 = _1893;
    }
    float _1907 = _1693;
    float _1909 = _1907;
    if (!_711)
    {
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1913 = _741 + _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1917 = _745 + _1915;
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1921 = -_741;
        float _1923 = _1921 + _1893;
        float _1925 = _1913 * _1913;
        float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1929 = _779 + _1927;
        float _1931 = fma(_1917, _1917, _1925);
        float _1933 = -_745;
        float _1935 = _1933 + _1895;
        float _1937 = fma(_1929, _1929, _1931);
        float _1939 = sqrt(_1937);
        float _1941 = precise::min(_1939, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1943 = _1941 * _1919;
        float _1945 = -_779;
        float _1947 = _1945 + _1897;
        float _1949 = fma(_1935, _1943, _745);
        float _1951 = fma(_1923, _1943, _741);
        float _1953 = fma(_1947, _1943, _779);
        _1909 = _1951;
        _1903 = _1949;
        _1905 = _1953;
    }
    float _1955 = _1909;
    float _1957 = _1903;
    float _1959 = _1905;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1963 = _1901 * _1799;
    int _1965 = _1963 + _1843;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1969 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1961);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1979 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1971);
    float _1981 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1973);
    float _1983 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1975);
    float _1985 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1977);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1989 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1981);
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1999 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1997);
    float _2007 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2013);
    float _2025 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2033 = float(_1965);
    float _2035 = _2025 + _2027;
    float _2037 = _2029 + _2027;
    float _2039 = _2027 * 0.5;
    float _2041 = _2035 * 0.5;
    float _2043 = _2037 * 0.5;
    float _2045 = fma(_2023, -0.5, _2039);
    out.m_33.x = _2031;
    out.m_57.x = _2033;
    out.m_59.x = _1957;
    out.m_59.y = _1955;
    out.m_59.z = _1959;
    out.gl_Position.x = _2025;
    out.gl_Position.y = _2023;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _2027;
    out.m_61.x = _2041;
    out.m_61.y = _2045;
    out.m_61.z = _2043;
    out.m_61.w = _2027;
    if (!_1835)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2047;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _446 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2104 = as_type<float>(_96);
        out.gl_Position.z = _2104;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2173 = as_type<float>(_132);
        out.gl_Position.z = _2173;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_37.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_39.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _298 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _300 = isnan(_284);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _314 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = isnan(_284);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _328;
    float _332 = -_308;
    float _334 = _332 + 1.0;
    bool _336 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _338 = isnan(_284);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _296;
    float _352 = 1.0 / _312;
    float _354 = _330 * _326;
    float _356 = -_324;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _364 = _324 * _334;
    float _366 = fma(_354, _288, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _368 = _346 * _358;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _370;
    float _374 = _362 * _350;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _390 = _284 + _388;
    float _392 = _366 * _368;
    float _394 = -_346;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = _284 + _398;
    float _402 = fma(_374, _390, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _404 = -_386;
    float _406 = _404 + 1.0;
    float _408 = _372 * _352;
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _412 = _308 * _406;
    float _414 = fma(_408, _400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _416 = fma(_402, _364, _410);
    float _418 = fma(_414, _412, _416);
    float _420 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[118].x, _418);
    float _422 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _422;
    bool _424 = !_348;
    float _426 = _364;
    float _444;
    if (!_424)
    {
        float _428 = in.m_39.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_80);
        float _450 = 1.0 / _448;
        float _452 = _114 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _458 = int(_456);
    float _460 = in.m_43.y;
    float _462 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = in.m_39.y;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _468 = _466 != 0;
    float _470 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = in.m_43.x;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _484 = _482 != 0;
    float _486 = in.m_39.x;
    float _488 = float(_458);
    float _490 = in.m_45.w;
    float _492 = 1.0 / _488;
    float _494 = float(uint(_474));
    float _496 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _498 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _500 = _464 > 0.5;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _504 = 1.0 / _494;
    float _506 = float(_80);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _510 = _114 * _492;
    int _512 = ~_474;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_47.w = _490;
    float _520 = 1.0 / _506;
    int _522 = as_type<int>(_504) + (-2);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _524;
    float _528 = trunc(_510);
    int _530 = int(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _536 = 1.0 / _518;
    float _538 = float(uint(_530));
    float _540 = as_type<float>(_522) * _538;
    float _542 = in.m_39.w;
    float _544 = _526 * _536;
    float _546 = trunc(_540);
    float _548 = precise::max(_546, 0.0);
    uint _551 = uint(_548);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = _514 * int(_551);
    int _557 = _555 + _530;
    float _559 = float(uint(_557));
    float _561 = -_460;
    float _563 = _561 + 1.0;
    bool _565 = _542 > 0.5;
    int _567 = ~_474;
    int _569 = _567 + 1;
    float _571 = as_type<float>(_522) * _559;
    int _573 = _565 ? as_type<int>(_563) : as_type<int>(_460);
    float _575 = _559;
    float _577 = _460;
    bool _579 = _500;
    int _581 = as_type<int>(_540);
    if (!_468)
    {
        _575 = _476;
    }
    float _583 = _575;
    float _585 = _484 ? as_type<float>(_573) : _460;
    float _587 = trunc(_571);
    float _589 = precise::max(_587, 0.0);
    uint _591 = uint(_589);
    float _593 = _583;
    if (_480)
    {
        float _595 = _500 ? _563 : _460;
        _577 = _595;
    }
    float _597 = _577;
    if (_468)
    {
        bool _599 = _486 > 0.5;
        _579 = _599;
    }
    bool _601 = _579;
    if (!_468)
    {
        _426 = _583;
    }
    float _603 = _426;
    float _605 = _603;
    if (_468)
    {
        _593 = _476;
    }
    float _607 = _593;
    if (_468)
    {
        float _609 = -_607;
        float _611 = _609 + 1.0;
        _581 = as_type<int>(_611);
    }
    int _613 = _581;
    int _615 = int(_551) + int(_591);
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_49.x;
    float _631 = in.m_49.y;
    float _633 = in.m_49.z;
    if (_468)
    {
        float _635 = _601 ? as_type<float>(_613) : _607;
        _605 = _635;
    }
    float _637 = _605;
    int _639 = _569 * _615;
    int _641 = _639 + _530;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _645 = _643 != 0;
    bool _647 = uint(_641) >= uint(_474);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _651 = _649 != 0;
    float _653 = in.m_37.x;
    float _655 = in.m_37.y;
    float _657 = in.m_37.z;
    bool _659 = !_647;
    int _661 = _659 ? 0 : (-1);
    bool _663 = !_623;
    int _665 = _663 ? 0 : 1;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _669 = _667 != 0;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _683 = !_651;
    float _685 = _683 ? 7.345489978790283203125 : 1.0;
    float _687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _689 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _691 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _631);
    float _695 = _464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _697 = !_619;
    int _699 = _697 ? 0 : 1;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.5);
    bool _711 = _707 || _709;
    float _713 = fma(_695, -2.0, _508);
    float _715 = _655 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _470);
    bool _719 = !_627;
    int _721 = _719 ? 0 : 1;
    float _723 = _653 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = _657 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _727 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.5);
    bool _735 = _731 || _733;
    float _737 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    float _739 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _741 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _743 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _747 = -_741;
    float _749 = _747 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _751 = -_701;
    float _753 = fma(_743, 2.0, _751);
    float _755 = -_496;
    float _757 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _755);
    float _759 = -_498;
    float _761 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _759);
    float _763 = -_502;
    float _765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _769 = (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _771 = _633;
    bool _773 = _645;
    if (_677)
    {
        float _775 = in.m_39.z;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _739 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = -_745;
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _749 * _749;
    float _787 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _789 = -_767;
    float _791 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _793 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _795 = -_779;
    float _797 = _795 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _799 = fma(_783, _783, _785);
    float _801 = -_787;
    float _803 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _801);
    float _805 = -_793;
    float _807 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _805);
    float _809 = fma(_797, _797, _799);
    float _811 = float(_474);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _799;
    if (!_651)
    {
        float _819 = in.m_39.z;
        _817 = _819;
    }
    float _821 = _817;
    float _823 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _825 = rsqrt(_809);
    float _827 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _831 = abs(_721);
    float _833 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _713);
    float _835 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_51.x = _745;
    out.m_51.y = _741;
    out.m_51.z = _779;
    float _837 = 1.0 / _815;
    float _839 = _835 * _633;
    if (_735)
    {
        _771 = 1.0;
    }
    float _841 = _771;
    float _843 = _797 * _825;
    float _845 = _114 * _811;
    float _847 = _749 * _825;
    float _849 = _845 * _520;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _853 = !_645;
    int _855 = _853 ? 0 : 1;
    float _857 = _534 * _837;
    float _859 = _837;
    float _861 = _841;
    if (_677)
    {
        bool _863 = _777 > 0.5;
        _773 = _863;
    }
    bool _865 = _773;
    float _867 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _869 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_651)
    {
        _859 = _464;
    }
    float _871 = _859;
    float _873 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _875 = _867 * _687;
    float _877 = _869 * _693;
    float _879 = _783 * _825;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _887 = _454 + _885;
    float _889 = _879 * _879;
    float _891 = _685 * _486;
    float _893 = fma(_585, _883, -0.5);
    float _895 = fma(_544, _887, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _897 = fma(_843, _843, _889);
    float _899 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _901 = _871;
    float _903 = _887;
    if (_651)
    {
        _901 = _486;
    }
    float _905 = _901;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _909 = _454 + _907;
    float _911 = _821;
    if (!_651)
    {
        _903 = _821;
    }
    float _913 = _903;
    float _915 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _917 = rsqrt(_897);
    float _919 = _913;
    if (_651)
    {
        _919 = _464;
    }
    float _921 = _919;
    float _923 = _761 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_651)
    {
        _911 = _464;
    }
    float _925 = _911;
    float _927 = _761 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _929 = -_899;
    float _931 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _929);
    float _933 = fma(_857, _909, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _935 = -_923;
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].y, _935);
    float _939 = -_927;
    float _941 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].y, _939);
    float _943 = -_823;
    float _945 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _943);
    float _947 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].w, _931);
    float _949 = -_827;
    float _951 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].x, _949);
    float _953 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].w, _941);
    bool _955 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _957 = isnan(_454);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_829;
    float _971 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _973 = _843 * _917;
    float _975 = _879 * _917;
    float _977 = -_967;
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].x, _977);
    bool _981 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _983 = isnan(_454);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -_973;
    float _995 = _843 * _993;
    float _997 = _847 * _975;
    float _999 = floor(_891);
    bool _1001 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1003 = isnan(_454);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = fma(_879, _975, _1013);
    float _1017 = -_965;
    float _1019 = _1017 + 1.0;
    float _1021 = -_991;
    float _1023 = _1021 + 1.0;
    float _1025 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].w, _951);
    float _1027 = _1015 * _1015;
    float _1029 = _991 * _1019;
    float _1031 = -_973;
    float _1033 = _847 * _1031;
    float _1035 = _1011 * _1023;
    float _1037 = fma(_997, _997, _1027);
    float _1039 = _803 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _1043 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].w, _937);
    float _1045 = -_1039;
    float _1047 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1045);
    float _1049 = fma(_1033, _1033, _1037);
    float _1051 = _895 * _1035;
    float _1053 = -_999;
    float _1055 = _891 + _1053;
    float _1057 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = float(_530);
    float _1063 = rsqrt(_1049);
    float _1065 = -_1057;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1041);
    float _1069 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    bool _1071 = _1061 >= _811;
    bool _1073 = isnan(_1061);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_811);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _905 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1085 = _1055 * _811;
    float _1087 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].w, _945);
    int _1089 = ~_615;
    int _1091 = _1089 + _661;
    int _1093 = _1091 + 1;
    float _1095 = 1.0 / _1067;
    float _1097 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[0].w, _971);
    bool _1099 = _474 == 0;
    int _1101 = _474 * _1093;
    int _1103 = _1101 + _530;
    bool _1105 = !_669;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1111 = _474 + (-1);
    float _1113 = trunc(_1081);
    int _1115 = int(_1113);
    float _1117 = _1015 * _1063;
    float _1119 = precise::clamp(_1117, 0.0, 1.0);
    bool _1121 = !_1099;
    int _1123 = _1121 ? _1103 : (-1);
    float _1125 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    int _1127 = abs(_855);
    float _1129 = -_1119;
    float _1131 = _1129 + 1.0;
    float _1133 = _921 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1135 = fma(_1087, _1095, -1.0);
    float _1137 = _1131 * _1095;
    float _1139 = trunc(_1085);
    int _1141 = int(_1139);
    float _1143 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _597, -0.5);
    float _1145 = fma(_1131, _1135, 1.0);
    float _1147 = _1043 * _1137;
    int _1149 = ~_1115;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = _1145 * _1145;
    float _1157 = trunc(_849);
    int _1159 = int(_1157);
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1163 = _1123 * _1153;
    float _1165 = _1097 * _1137;
    float _1167 = fma(_1147, _1147, _1155);
    int _1169 = abs(_665);
    int _1171 = _1115 * _1111;
    int _1173 = _1171 + _1163;
    int _1175 = abs(_1107);
    float _1177 = fma(_1165, _1165, _1167);
    int _1179 = abs(_699);
    float _1181 = -_1161;
    float _1183 = fma(_1083, 2.0, _1181);
    int _1185 = _1141 * _1175;
    int _1187 = _1185 + _530;
    float _1189 = as_type<float>(_1175);
    int _1191 = _1127;
    float _1193 = _933;
    if (!_677)
    {
        _1189 = _607;
    }
    float _1195 = _1189;
    float _1197 = rsqrt(_1177);
    float _1199 = -_114;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1183);
    int _1203 = _1173 * _1169;
    float _1205 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1207 = _1159 * _1179;
    int _1209 = _1207 + _1203;
    float _1211 = _1195;
    if (_677)
    {
        float _1213 = -_607;
        float _1215 = _1213 + 1.0;
        _1191 = as_type<int>(_1215);
    }
    int _1217 = _1191;
    int _1219 = _1187 * _831;
    int _1221 = _1219 + _1209;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_677)
    {
        float _1225 = _865 ? as_type<float>(_1217) : _607;
        _1211 = _1225;
    }
    float _1227 = _1211;
    int _1229 = _1141 * _1127;
    int _1231 = _1229 + _1221;
    float _1233 = -_833;
    float _1235 = fma(_1205, _1143, _1233);
    float _1237 = _1145 * _1197;
    float _1239 = _1165 * _1197;
    float _1241 = _1147 * _1197;
    float _1243 = float(uint(_1231));
    float _1245 = _843 * _1237;
    float _1247 = -_1239;
    float _1249 = _879 * _1247;
    float _1251 = -_1241;
    float _1253 = _847 * _1251;
    float _1255 = -_1239;
    float _1257 = -_1245;
    float _1259 = fma(_847, _1255, _1257);
    float _1261 = -_1241;
    float _1263 = -_1249;
    float _1265 = fma(_843, _1261, _1263);
    float _1267 = as_type<float>(_522) * _1243;
    float _1269 = -_1253;
    float _1271 = fma(_879, _1237, _1269);
    float _1273 = -_1011;
    float _1275 = _1273 + 1.0;
    float _1277 = _1265 * _1265;
    float _1279 = trunc(_1267);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1051);
    float _1289 = fma(_1259, _1259, _1277);
    int _1291 = ~_474;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1133, -2.0, _1285);
    float _1297 = fma(_1271, _1271, _1289);
    float _1299 = fma(_933, _1029, _1287);
    float _1301 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1305 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _873);
    float _1307 = rsqrt(_1297);
    float _1309 = -_114;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _753);
    float _1313 = _741 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1315 = _1293 * int(_1283);
    int _1317 = _1315 + _1231;
    float _1319 = fma(_1301, _1227, -0.5);
    float _1321 = fma(_1305, _1303, _1311);
    float _1323 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1313);
    float _1325 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1327 = float(uint(_1317));
    float _1329 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1125);
    float _1331 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1295);
    float _1333 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1323);
    float _1335 = fma(_1325, _1319, _1201);
    float _1337 = as_type<float>(_522) * _1327;
    int _1339 = ~_474;
    int _1341 = _1339 + 1;
    float _1343 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = _1259 * _1307;
    float _1347 = _1271 * _1307;
    float _1349 = trunc(_1337);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    float _1355 = _1265 * _1307;
    float _1357 = _843 * _1345;
    float _1359 = float(uint(_1187));
    float _1361 = -_1331;
    float _1363 = fma(_1329, _893, _1361);
    float _1365 = _879 * _1355;
    float _1367 = -_1357;
    float _1369 = fma(_879, _1347, _1367);
    float _1371 = _847 * _1347;
    float _1373 = 1.0 / _1343;
    float _1375 = -_1365;
    float _1377 = fma(_847, _1345, _1375);
    float _1379 = as_type<float>(_522) * _1359;
    float _1381 = -_1371;
    float _1383 = fma(_843, _1355, _1381);
    float _1385 = _741 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1387 = _1369 * _1369;
    float _1389 = _1331;
    float _1391 = _1387;
    float _1393 = _1343;
    float _1395 = _1379;
    if (!_735)
    {
        _1389 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1397 = _1389;
    float _1399 = _1235 + 0.5;
    float _1401 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1385);
    float _1403 = fma(_1383, _1383, _1387);
    float _1405 = trunc(_1379);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = int(_1283) + int(_1353);
    float _1413 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1401);
    float _1415 = fma(_1377, _1377, _1403);
    int _1417 = ~_474;
    int _1419 = _1417 + 1;
    float _1421 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1425 = _1341 * _1411;
    int _1427 = _1425 + _1231;
    float _1429 = rsqrt(_1415);
    float _1431 = _1423 + _1343;
    float _1433 = as_type<float>(_1419);
    if (!_735)
    {
        _1391 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1435 = _1391;
    if (!_735)
    {
        float _1437 = -_1397;
        float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1393 = _1439;
    }
    float _1441 = _1393;
    bool _1443 = uint(_1427) >= uint(_474);
    float _1445 = _1431 * _1373;
    float _1447 = _1445 * 0.5;
    int _1449 = _1419 * int(_1409);
    int _1451 = _1449 + _1187;
    bool _1453 = !_1443;
    int _1455 = _1453 ? 0 : (-1);
    float _1457 = _1441;
    if (!_735)
    {
        float _1459 = -_1435;
        float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1433 = _1461;
    }
    float _1463 = _1433;
    if (!_735)
    {
        float _1465 = 1.0 / _1441;
        _1457 = _1465;
    }
    float _1467 = _1457;
    float _1469 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1471 = ~_1411;
    int _1473 = _1471 + _1455;
    int _1475 = _1473 + 1;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    float _1481 = float(uint(_1451));
    float _1483 = _1377 * _1429;
    float _1485 = _1369 * _1429;
    int _1487 = _474 * _1475;
    int _1489 = _1487 + _1231;
    float _1491 = 1.0 / _1479;
    float _1493 = as_type<float>(_522) * _1481;
    float _1495 = _1383 * _1429;
    float _1497 = _879 * _1483;
    bool _1499 = !_1099;
    int _1501 = _1499 ? _1489 : (-1);
    float _1503 = _843 * _1485;
    float _1505 = _847 * _1495;
    float _1507 = -_1497;
    float _1509 = fma(_843, _1495, _1507);
    int _1511 = _1501 >> 31;
    float _1513 = -_1503;
    float _1515 = fma(_847, _1483, _1513);
    float _1517 = -_1505;
    float _1519 = fma(_879, _1485, _1517);
    float _1521 = _1509 * _1509;
    int _1523 = _1511 & 3;
    float _1525 = _1463;
    float _1527 = _1467;
    if (!_735)
    {
        float _1529 = 1.0 / _1463;
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1321 + 0.5;
    float _1535 = fma(_1515, _1515, _1521);
    int _1537 = _1501 + _1523;
    if (!_735)
    {
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1541 = -_1435;
        float _1543 = fma(_1491, _1539, _1541);
        _1395 = _1543;
    }
    float _1545 = _1395;
    if (!_735)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1549 = -_1397;
        float _1551 = fma(_1491, _1547, _1549);
        _1193 = _1551;
    }
    float _1553 = _1193;
    float _1555 = fma(_1519, _1519, _1535);
    int _1557 = _1537 >> 2;
    float _1559 = trunc(_1493);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = _1501 & 3;
    bool _1567 = _1565 != 0;
    float _1569 = _1335 + 0.5;
    int _1571 = _1557 << 4;
    int _1573 = _1571 + 368;
    float _1575 = _1363 + 0.5;
    bool _1577 = uint(_1565) > 1u;
    float _1579 = _877 * _1483;
    uint _1581 = uint(int(uint(_1573) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    float _1597 = rsqrt(_1555);
    float _1599 = _1575;
    if (!_735)
    {
        float _1601 = _1545 * _1531;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _861 = _1603;
    }
    float _1605 = _861;
    int _1607 = _1501 & 3;
    bool _1609 = _1607 != 0;
    out.m_53.x = _1533;
    out.m_53.y = _1399;
    out.m_53.z = _1569;
    out.m_53.w = _1575;
    int _1611 = ~_474;
    int _1613 = _1611 + 1;
    float _1615 = _877 * _1495;
    float _1617 = _1605;
    if (!_735)
    {
        float _1619 = _1553 * _1467;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        _1527 = _1621;
    }
    float _1623 = _1527;
    out.m_55.w = _1469;
    int _1625 = int(_1409) + int(_1563);
    float _1627 = _875 * _1597;
    int _1629 = _1573 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = _1609 ? 0 : 1;
    float _1649 = fma(_1519, _1627, _1579);
    float _1651 = fma(_1515, _1627, _1615);
    int _1653 = ~_1647;
    int _1655 = _1653 + 1;
    int _1657 = _1655 + 1;
    int _1659 = _1657;
    if (!_1577)
    {
        int _1661 = ~_1647;
        int _1663 = _1661 + 1;
        _1659 = _1663;
    }
    int _1665 = _1659;
    int _1667 = _1613 * _1625;
    int _1669 = _1667 + _1187;
    float _1671 = fma(_839, _843, _1649);
    bool _1673 = _1565 != 3;
    float _1675 = fma(_839, _879, _1651);
    bool _1677 = uint(_1565) >= 2u;
    float _1679 = _779 + _1671;
    if (_735)
    {
        _1599 = 1.0;
    }
    float _1681 = _1599;
    float _1683 = _745 + _1675;
    int _1685 = _1677 ? 0 : 1;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1689 = _1679 + _1687;
    float _1691 = _1681;
    float _1693 = _1689;
    if (!_735)
    {
        float _1695 = -_1623;
        float _1697 = _1695 + 1.0;
        _1691 = _1697;
    }
    float _1699 = _1691;
    bool _1701 = !_1567;
    int _1703 = _1701 ? 0 : 1;
    bool _1705 = uint(_1669) >= uint(_474);
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1709 = _1683 + _1707;
    bool _1711 = _1565 != 3;
    float _1713 = _1689 * _1689;
    int _1715 = ~_1685;
    int _1717 = _1715 + 1;
    int _1719 = _1717 + 1;
    int _1721 = _1719;
    if (_1673)
    {
        int _1723 = ~_1685;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    int _1729 = abs(_1703);
    float _1731 = fma(_1709, _1709, _1713);
    int _1733 = abs(_1665);
    bool _1735 = !_1705;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = sqrt(_1731);
    int _1741 = ~_1733;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = ~_1625;
    int _1749 = _1747 + _1737;
    int _1751 = _1749 + 1;
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = _1745 * as_type<int>(_1595);
    int _1759 = abs(_1727);
    float _1761 = _877 * _1485;
    int _1763 = ~_1729;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    int _1769 = _474 * _1751;
    int _1771 = _1769 + _1187;
    int _1773 = abs(_1755);
    float _1775 = fma(_1509, _1627, _1761);
    int _1777 = _1767 * as_type<int>(_1587);
    int _1779 = _1777 + _1757;
    bool _1781 = !_673;
    int _1783 = _1781 ? 0 : 1;
    float _1785 = fma(_839, _847, _1775);
    float _1787 = _1605 * _1699;
    int _1789 = ~_1759;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _741 + _1785;
    bool _1797 = _1739 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1799 = abs(_1783);
    int _1801 = _1793 * as_type<int>(_1637);
    int _1803 = _1801 + _1779;
    int _1805 = ~_1773;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    bool _1811 = _1605 > 0.0;
    bool _1813 = isnan(_1605);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    int _1821 = _1809 * as_type<int>(_1645);
    int _1823 = _1821 + _1803;
    int _1825 = ~_1799;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    bool _1831 = _1699 <= 0.0;
    bool _1833 = !_1819;
    bool _1835 = _1831 || _1833;
    float _1837 = as_type<float>(_1823);
    float _1839 = as_type<float>(_1803);
    if (!_1797)
    {
        _1617 = _1679;
    }
    float _1841 = _1617;
    int _1843 = _1823 * _1829;
    float _1845 = _1841;
    if (!_1797)
    {
        _1837 = _1683;
    }
    float _1847 = _1837;
    float _1849 = _1847;
    if (!_1797)
    {
        _1839 = _1795;
    }
    float _1851 = _1839;
    bool _1853 = !_1797;
    float _1855 = _1851;
    if (!_1853)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1861 = _1739 + _1859;
        float _1863 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = rsqrt(_1731);
        float _1867 = _1861 * _1857;
        float _1869 = _1867 * 0.15915493667125701904296875;
        float _1871 = _1869 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1869 * 6.283185482025146484375;
        float _1877 = sin(_1875);
        float _1879 = _1873 + (-1.0);
        float _1881 = fma(_1877, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1885 = _1865 * _1881;
        float _1887 = fma(_1795, _1873, _1883);
        float _1889 = fma(_1709, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1891 = fma(_1689, _1885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1855 = _1887;
        _1849 = _1889;
        _1845 = _1891;
    }
    float _1893 = _1855;
    float _1895 = _1849;
    float _1897 = _1845;
    bool _1899 = !_1099;
    int _1901 = _1899 ? _1771 : (-1);
    float _1903 = _1895;
    float _1905 = _1897;
    if (_711)
    {
        _1693 = _1893;
    }
    float _1907 = _1693;
    float _1909 = _1907;
    if (!_711)
    {
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1913 = _741 + _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1917 = _745 + _1915;
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1921 = -_741;
        float _1923 = _1921 + _1893;
        float _1925 = _1913 * _1913;
        float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1929 = _779 + _1927;
        float _1931 = fma(_1917, _1917, _1925);
        float _1933 = -_745;
        float _1935 = _1933 + _1895;
        float _1937 = fma(_1929, _1929, _1931);
        float _1939 = sqrt(_1937);
        float _1941 = precise::min(_1939, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1943 = _1941 * _1919;
        float _1945 = -_779;
        float _1947 = _1945 + _1897;
        float _1949 = fma(_1935, _1943, _745);
        float _1951 = fma(_1923, _1943, _741);
        float _1953 = fma(_1947, _1943, _779);
        _1909 = _1951;
        _1903 = _1949;
        _1905 = _1953;
    }
    float _1955 = _1909;
    float _1957 = _1903;
    float _1959 = _1905;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1963 = _1901 * _1799;
    int _1965 = _1963 + _1843;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1969 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1961);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1979 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1971);
    float _1981 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1973);
    float _1983 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1975);
    float _1985 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1977);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1989 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1981);
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1999 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1997);
    float _2007 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2009 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2013);
    float _2025 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2015);
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2017);
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2033 = float(_1965);
    float _2035 = _2025 + _2027;
    float _2037 = _2029 + _2027;
    float _2039 = _2027 * 0.5;
    float _2041 = _2035 * 0.5;
    float _2043 = _2037 * 0.5;
    float _2045 = fma(_2023, -0.5, _2039);
    out.m_33.x = _2031;
    out.m_57.x = _2033;
    out.m_59.x = _1957;
    out.m_59.y = _1955;
    out.m_59.z = _1959;
    out.gl_Position.x = _2025;
    out.gl_Position.y = _2023;
    out.gl_Position.z = _2029;
    out.gl_Position.w = _2027;
    out.m_61.x = _2041;
    out.m_61.y = _2045;
    out.m_61.z = _2043;
    out.m_61.w = _2027;
    if (!_1835)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2047 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2047;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

