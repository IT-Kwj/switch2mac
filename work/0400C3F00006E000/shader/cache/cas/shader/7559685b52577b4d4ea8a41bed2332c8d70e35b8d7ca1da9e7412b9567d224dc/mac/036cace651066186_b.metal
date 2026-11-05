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
    float4 m_53 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_57 [[user(locn9)]];
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _522 = false;
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
        float _2214 = as_type<float>(_96);
        out.gl_Position.z = _2214;
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
        float _2283 = as_type<float>(_132);
        out.gl_Position.z = _2283;
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
    bool _286 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _288 = isnan(_284);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _300;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _320 * _308;
    float _342 = -_320;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_284);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _304;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _338 * _344;
    bool _370 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_284);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _388 = 1.0 / _326;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _394 = _348 * _322;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _284 + _396;
    float _400 = _360 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _406 = _380 * _384;
    float _408 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = 1.0 / _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _416 = _408 * _406;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _284 + _418;
    float _422 = -_380;
    float _424 = _422 + 1.0;
    float _426 = _414 * _362;
    float _428 = 1.0 / _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _438 = fma(_426, _420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _416);
    float _442 = _432 * _388;
    bool _444 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _446 = isnan(_284);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _456;
    float _460 = _436 * _410;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _284 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _468 = _284 + _466;
    float _470 = fma(_438, _400, _440);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _474 = _284 + _472;
    float _476 = fma(_442, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = fma(_460, _468, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = _458 * _428;
    float _486 = fma(_476, _368, _470);
    float _488 = _296 * _482;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _492 = fma(_478, _340, _486);
    float _494 = fma(_490, _488, _492);
    float _496 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[120].x, _494);
    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _498;
    bool _500 = !_386;
    float _502 = _368;
    float _520;
    if (!_500)
    {
        float _504 = in.m_39.x;
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _508 = _504 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _512 = _510 * _506;
        float _514 = floor(_512);
        float _516 = -_514;
        float _518 = _512 + _516;
        _520 = _518;
        _522 = true;
    }
    else
    {
        float _524 = float(_80);
        float _526 = 1.0 / _524;
        float _528 = _114 * _526;
        _520 = _528;
    }
    _522 = false;
    float _530 = _520;
    float _532 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _534 = int(_532);
    float _536 = in.m_43.y;
    float _538 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = in.m_43.x;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _544 = _542 != 0;
    float _546 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _550 = int(_548);
    float _552 = in.m_39.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _560 = _558 != 0;
    float _562 = in.m_39.y;
    float _564 = float(_534);
    float _566 = in.m_45.w;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _570 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _572 = float(uint(_550));
    float _574 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = 1.0 / _564;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = float(_550);
    float _586 = 1.0 / _572;
    bool _588 = _562 > 0.5;
    float _590 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _592;
    out.m_47.w = _566;
    float _596 = _114 * _584;
    float _598 = _114 * _578;
    int _600 = ~_550;
    int _602 = _600 + 1;
    float _604 = 1.0 / _582;
    float _606 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _610 = as_type<int>(_586) + (-2);
    float _612 = trunc(_598);
    int _614 = int(_612);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(uint(_614));
    float _620 = as_type<float>(_610) * _618;
    float _622 = in.m_39.w;
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    int _631 = _602 * int(_629);
    int _633 = _631 + _614;
    float _635 = float(uint(_633));
    float _637 = -_536;
    float _639 = _637 + 1.0;
    bool _641 = _622 > 0.5;
    int _643 = ~_550;
    int _645 = _643 + 1;
    float _647 = as_type<float>(_610) * _635;
    float _649 = _635;
    bool _651 = _641;
    float _653 = _536;
    if (!_544)
    {
        _649 = _540;
    }
    float _655 = _649;
    int _657 = _641 ? as_type<int>(_639) : as_type<int>(_536);
    float _659 = _655;
    if (_544)
    {
        bool _661 = _552 > 0.5;
        _651 = _661;
    }
    bool _663 = _651;
    float _665 = trunc(_647);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    if (!_544)
    {
        _502 = _655;
    }
    float _671 = _502;
    float _673 = _671;
    if (_544)
    {
        _659 = _540;
    }
    float _675 = _659;
    float _677 = _560 ? as_type<float>(_657) : _536;
    if (_556)
    {
        float _679 = _588 ? _639 : _536;
        _653 = _679;
    }
    float _681 = _653;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _697 = _695 != 0;
    int _699 = int(_629) + int(_669);
    int _701 = int(_669);
    float _703 = _681;
    if (_544)
    {
        float _705 = -_675;
        float _707 = _705 + 1.0;
        _701 = as_type<int>(_707);
    }
    int _709 = _701;
    float _711 = in.m_49.x;
    float _713 = in.m_49.y;
    float _715 = in.m_49.z;
    bool _717 = !_689;
    int _719 = _717 ? 0 : 1;
    int _721 = _645 * _699;
    int _723 = _721 + _614;
    if (_544)
    {
        float _725 = _663 ? as_type<float>(_709) : _675;
        _673 = _725;
    }
    float _727 = _673;
    bool _729 = uint(_723) >= uint(_550);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = in.m_37.x;
    float _737 = in.m_37.y;
    float _739 = in.m_37.z;
    bool _741 = !_729;
    int _743 = _741 ? 0 : (-1);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _755 = _753 != 0;
    float _757 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _759 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _761 = !_733;
    float _763 = _761 ? 7.345489978790283203125 : 1.0;
    float _765 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _757);
    float _767 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _759);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _773 = !_685;
    int _775 = _773 ? 0 : 1;
    bool _777 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    float _787 = 0.0;
    bool _789 = _747;
    if (_755)
    {
        float _791 = in.m_39.z;
        _787 = _791;
    }
    float _793 = _787;
    bool _795 = !_693;
    int _797 = _795 ? 0 : 1;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.5);
    bool _809 = _805 || _807;
    float _811 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _813 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _815 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _765);
    float _817 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _819 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _823 = _817 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _825 = -_570;
    float _827 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _829 = -_574;
    float _831 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _829);
    float _833 = -_576;
    float _835 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _839 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -_823;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _851 = fma(_590, -2.0, _837);
    float _853 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _855 = -_821;
    float _857 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _855);
    float _859 = float(_80);
    float _861 = _819 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = -_839;
    float _865 = _863 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _843 * _843;
    float _869 = -_845;
    float _871 = fma(_608, 2.0, _869);
    float _873 = 1.0 / _849;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _881 = -_861;
    float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = fma(_865, _865, _867);
    float _887 = -_875;
    float _889 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _887);
    float _891 = -_853;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _891);
    float _895 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = 1.0 / _879;
    float _899 = fma(_883, _883, _885);
    float _901 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _530 + _903;
    float _907 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    int _909 = abs(_719);
    float _911 = -_114;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    out.m_51.x = _839;
    out.m_51.y = _823;
    out.m_51.z = _861;
    float _915 = 1.0 / _859;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _925 = _919 * _873;
    float _927 = _923 * _604;
    float _929 = rsqrt(_899);
    float _931 = _594 * _897;
    float _933 = _923;
    float _935 = _905;
    if (!_733)
    {
        _933 = _562;
    }
    float _937 = _933;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _941 = _897;
    float _943 = _937;
    if (!_733)
    {
        float _945 = in.m_39.z;
        _941 = _945;
    }
    float _947 = _941;
    if (_733)
    {
        _943 = _552;
    }
    float _949 = _943;
    float _951 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _939);
    float _953 = _596 * _915;
    bool _955 = !_747;
    int _957 = _955 ? 0 : 1;
    float _959 = _901 * _771;
    if (_755)
    {
        bool _961 = _793 > 0.5;
        _789 = _961;
    }
    bool _963 = _789;
    float _965 = _763 * _552;
    float _967 = _895 * _769;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _971 = _530 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _530 + _973;
    float _977 = _865 * _929;
    float _979 = _883 * _929;
    float _981 = fma(_927, _971, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _983 = fma(_925, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _985 = _977 * _977;
    float _987 = fma(_931, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _989 = floor(_965);
    float _991 = _831 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = fma(_979, _979, _985);
    float _995 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _997 = _831 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _999 = abs(_957);
    float _1001 = _947;
    if (!_733)
    {
        _935 = _947;
    }
    float _1003 = _935;
    float _1005 = rsqrt(_993);
    float _1007 = _1003;
    if (_733)
    {
        _1007 = _562;
    }
    float _1009 = _1007;
    float _1011 = -_997;
    float _1013 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1011);
    if (_733)
    {
        _1001 = _562;
    }
    float _1015 = _1001;
    float _1017 = fma(_677, _606, -0.5);
    float _1019 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1021 = _843 * _929;
    float _1023 = float(_614);
    float _1025 = -_989;
    float _1027 = _965 + _1025;
    float _1029 = -_1019;
    float _1031 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1033 = -_991;
    float _1035 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1033);
    bool _1037 = _1023 >= _584;
    bool _1039 = isnan(_1023);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(_584);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _1027 * _584;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1031);
    float _1053 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1013);
    float _1057 = _979 * _1005;
    float _1059 = _977 * _1005;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1065 = -_1057;
    float _1067 = _979 * _1065;
    float _1069 = _1021 * _1059;
    float _1071 = trunc(_1047);
    int _1073 = int(_1071);
    float _1075 = -_1061;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_977, _1059, _1079);
    float _1083 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1085 = -_1057;
    float _1087 = _1021 * _1085;
    float _1089 = -_1063;
    float _1091 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1093 = _1081 * _1081;
    float _1095 = -_1083;
    float _1097 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1099 = -_1053;
    float _1101 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1103 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1091);
    float _1105 = fma(_1069, _1069, _1093);
    float _1107 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1097);
    float _1109 = trunc(_1049);
    int _1111 = int(_1109);
    int _1113 = ~_699;
    int _1115 = _1113 + _743;
    int _1117 = _1115 + 1;
    float _1119 = fma(_1087, _1087, _1105);
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1077);
    float _1123 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1035);
    bool _1125 = _550 == 0;
    int _1127 = _550 * _1117;
    int _1129 = _1127 + _614;
    float _1131 = -_1103;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1121);
    float _1135 = rsqrt(_1119);
    float _1137 = -_907;
    float _1139 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1137);
    int _1141 = ~_1073;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1101);
    bool _1149 = !_1125;
    int _1151 = _1149 ? _1129 : (-1);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1139);
    int _1155 = _550 + (-1);
    float _1157 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    float _1159 = 1.0 / _1133;
    int _1161 = _1151 * _1145;
    int _1163 = abs(_797);
    int _1165 = _1111 * _999;
    int _1167 = _1165 + _614;
    int _1169 = abs(_775);
    int _1171 = _1073 * _1155;
    int _1173 = _1171 + _1161;
    float _1175 = trunc(_953);
    int _1177 = int(_1175);
    float _1179 = _1081 * _1135;
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    int _1183 = _1173 * _909;
    bool _1185 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1187 = isnan(_530);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1181;
    float _1199 = _1197 + 1.0;
    float _1201 = fma(_1153, _1159, -1.0);
    float _1203 = _1199 * _1159;
    bool _1205 = !_697;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _1123 * _1203;
    int _1211 = _1177 * _1169;
    int _1213 = _1211 + _1183;
    float _1215 = fma(_1199, _1201, 1.0);
    bool _1217 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1219 = isnan(_530);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1231 = _1167 * _1163;
    int _1233 = _1231 + _1213;
    float _1235 = _1147 * _1203;
    bool _1237 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_530);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1227;
    float _1251 = _1249 + 1.0;
    float _1253 = _1215 * _1215;
    bool _1255 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1257 = isnan(_530);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = _1195 * _1251;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = fma(_1209, _1209, _1253);
    int _1275 = abs(_1207);
    float _1277 = _1265 * _1271;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1235, _1235, _1273);
    float _1283 = -_1265;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1289 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1291 = _1247 * _1285;
    float _1293 = rsqrt(_1281);
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _681, -0.5);
    float _1297 = _983 * _1291;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_755)
    {
        float _1301 = -_675;
        float _1303 = _1301 + 1.0;
        _1299 = as_type<int>(_1303);
    }
    int _1305 = _1299;
    float _1307 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1309 = _1111 * _1275;
    int _1311 = _1309 + _1233;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1315 = -_1247;
    float _1317 = _1315 + 1.0;
    if (!_755)
    {
        _703 = _675;
    }
    float _1319 = _703;
    float _1321 = -_1229;
    float _1323 = fma(_1289, 2.0, _1321);
    float _1325 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1313);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1297);
    float _1329 = _1319;
    if (_755)
    {
        float _1331 = _963 ? as_type<float>(_1305) : _675;
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = -_1307;
    float _1337 = fma(_1157, _1295, _1335);
    float _1339 = float(uint(_1311));
    float _1341 = _1235 * _1293;
    float _1343 = _1215 * _1293;
    float _1345 = _1209 * _1293;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1349 = -_1341;
    float _1351 = _977 * _1349;
    float _1353 = _979 * _1343;
    float _1355 = as_type<float>(_610) * _1339;
    float _1357 = -_1345;
    float _1359 = _1021 * _1357;
    float _1361 = -_1345;
    float _1363 = -_1351;
    float _1365 = fma(_979, _1361, _1363);
    float _1367 = -_1341;
    float _1369 = -_1353;
    float _1371 = fma(_1021, _1367, _1369);
    float _1373 = -_1359;
    float _1375 = fma(_977, _1343, _1373);
    float _1377 = _1365 * _1365;
    float _1379 = trunc(_1355);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = fma(_1371, _1371, _1377);
    float _1391 = fma(_981, _1277, _1327);
    float _1393 = fma(_1385, -2.0, _1387);
    float _1395 = fma(_1375, _1375, _1389);
    int _1397 = ~_550;
    int _1399 = _1397 + 1;
    float _1401 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1403 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = fma(_987, _1267, _1391);
    float _1407 = rsqrt(_1395);
    float _1409 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1411 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _951);
    float _1413 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1287);
    int _1415 = _1399 * int(_1383);
    int _1417 = _1415 + _1311;
    float _1419 = -_114;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1323);
    float _1423 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1425 = fma(_1403, _1333, -0.5);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1405);
    float _1429 = float(uint(_1417));
    float _1431 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1393);
    float _1433 = fma(_1411, _1401, _913);
    float _1435 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1423);
    float _1437 = fma(_1413, _1425, _1421);
    float _1439 = as_type<float>(_610) * _1429;
    float _1441 = -_1431;
    float _1443 = fma(_1409, _1017, _1441);
    float _1445 = _1371 * _1407;
    float _1447 = _1375 * _1407;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = _1365 * _1407;
    float _1457 = _979 * _1445;
    float _1459 = _1021 * _1447;
    float _1461 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1435);
    float _1463 = _977 * _1455;
    float _1465 = -_1457;
    float _1467 = fma(_977, _1447, _1465);
    float _1469 = float(uint(_1167));
    float _1471 = -_1459;
    float _1473 = fma(_979, _1455, _1471);
    float _1475 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = -_1463;
    float _1479 = fma(_1021, _1445, _1477);
    int _1481 = ~_550;
    int _1483 = _1481 + 1;
    float _1485 = as_type<float>(_610) * _1469;
    float _1487 = _1467 * _1467;
    float _1489 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1491 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    float _1499 = fma(_1473, _1473, _1487);
    int _1501 = int(_1383) + int(_1453);
    float _1503 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1505 = fma(_1479, _1479, _1499);
    int _1507 = ~_550;
    int _1509 = _1507 + 1;
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = 1.0 / _1491;
    int _1515 = _1483 * _1501;
    int _1517 = _1515 + _1311;
    float _1519 = _1337 + 0.5;
    float _1521 = as_type<float>(_1383);
    float _1523 = _1431;
    float _1525 = as_type<float>(_1509);
    float _1527 = _1511;
    float _1529 = _1505;
    float _1531 = _1443;
    float _1533 = _1433;
    if (!_809)
    {
        _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1535 = _1521;
    float _1537 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1539 = uint(_1517) >= uint(_550);
    float _1541 = rsqrt(_1505);
    int _1543 = _1509 * int(_1497);
    int _1545 = _1543 + _1167;
    bool _1547 = !_1539;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = _1511 + _1491;
    if (!_809)
    {
        float _1553 = -_1535;
        float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1523 = _1555;
    }
    float _1557 = _1523;
    if (!_809)
    {
        _1525 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1559 = _1525;
    out.m_53.w = _1537;
    int _1561 = ~_1501;
    int _1563 = _1561 + _1549;
    int _1565 = _1563 + 1;
    float _1567 = _1551 * _1513;
    float _1569 = _1567 * 0.5;
    if (!_809)
    {
        float _1571 = 1.0 / _1557;
        _1527 = _1571;
    }
    float _1573 = _1527;
    float _1575 = float(uint(_1545));
    int _1577 = _550 * _1565;
    int _1579 = _1577 + _1311;
    float _1581 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = _1581;
    if (!_809)
    {
        float _1589 = -_1559;
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1529 = _1591;
    }
    float _1593 = _1529;
    float _1595 = _1479 * _1541;
    float _1597 = _1467 * _1541;
    float _1599 = _1473 * _1541;
    bool _1601 = !_1125;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _977 * _1595;
    float _1607 = _979 * _1597;
    float _1609 = as_type<float>(_610) * _1575;
    int _1611 = _1603 >> 31;
    float _1613 = -_1605;
    float _1615 = fma(_979, _1599, _1613);
    float _1617 = _1021 * _1599;
    float _1619 = -_1607;
    float _1621 = fma(_1021, _1595, _1619);
    float _1623 = 1.0 / _1585;
    float _1625 = _1615 * _1615;
    int _1627 = _1611 & 3;
    float _1629 = -_1617;
    float _1631 = fma(_977, _1597, _1629);
    float _1633 = _1433 + 0.5;
    float _1635 = fma(_1621, _1621, _1625);
    int _1637 = _1603 + _1627;
    float _1639 = _1581 * _715;
    float _1641 = trunc(_1609);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = fma(_1631, _1631, _1635);
    int _1649 = _1637 >> 2;
    float _1651 = _1437 + 0.5;
    float _1653 = _1443 + 0.5;
    float _1655 = _1633;
    if (_809)
    {
        _1531 = 1.0;
    }
    float _1657 = _1531;
    float _1659 = _959 * _1599;
    int _1661 = _1603 & 3;
    bool _1663 = _1661 != 0;
    float _1665 = rsqrt(_1647);
    int _1667 = _1649 << 4;
    int _1669 = _1667 + 368;
    float _1671 = _1657;
    if (!_809)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1675 = -_1535;
        float _1677 = fma(_1623, _1673, _1675);
        _1533 = _1677;
    }
    float _1679 = _1533;
    if (!_809)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1683 = -_1559;
        float _1685 = fma(_1623, _1681, _1683);
        _1587 = _1685;
    }
    float _1687 = _1587;
    int _1689 = _1603 & 3;
    bool _1691 = _1689 != 0;
    uint _1693 = uint(int(uint(_1669) >> uint(2)));
    uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
    int _1697 = int(_1693) & 3;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[int(_1695)][_1697];
    int _1701 = int(_1693) + 1;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    int _1705 = _1701 & 3;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[int(_1703)][_1705];
    out.m_55.x = _1633;
    out.m_55.y = _1519;
    out.m_55.z = _1651;
    out.m_55.w = _1653;
    if (!_809)
    {
        float _1709 = _1679 * _1573;
        float _1711 = precise::clamp(_1709, 0.0, 1.0);
        _1671 = _1711;
    }
    float _1713 = _1671;
    float _1715 = _1593;
    if (!_809)
    {
        float _1717 = 1.0 / _1593;
        _1715 = _1717;
    }
    float _1719 = _1715;
    bool _1721 = uint(_1689) > 1u;
    int _1723 = int(_1497) + int(_1645);
    int _1725 = _1669 + 8;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = ~_550;
    int _1745 = _1743 + 1;
    float _1747 = _967 * _1665;
    int _1749 = _1745 * _1723;
    int _1751 = _1749 + _1167;
    float _1753 = _959 * _1595;
    int _1755 = _1663 ? 0 : 1;
    float _1757 = fma(_1621, _1747, _1659);
    if (_809)
    {
        _1655 = 1.0;
    }
    float _1759 = _1655;
    float _1761 = fma(_1631, _1747, _1753);
    float _1763 = _1719;
    float _1765 = _1759;
    if (!_809)
    {
        float _1767 = _1687 * _1719;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        _1763 = _1769;
    }
    float _1771 = _1763;
    int _1773 = ~_1755;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1639, _977, _1757);
    int _1781 = _1777;
    if (!_1721)
    {
        int _1783 = ~_1755;
        int _1785 = _1783 + 1;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = fma(_1639, _979, _1761);
    bool _1791 = _1689 != 3;
    if (!_809)
    {
        float _1793 = -_1771;
        float _1795 = _1793 + 1.0;
        _1765 = _1795;
    }
    float _1797 = _1765;
    bool _1799 = uint(_1689) >= 2u;
    float _1801 = _861 + _1789;
    float _1803 = _839 + _1779;
    bool _1805 = !_1691;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = _959 * _1597;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1801 + _1811;
    int _1815 = _1799 ? 0 : 1;
    int _1817 = abs(_1787);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1821 = _1803 + _1819;
    float _1823 = _1813 * _1813;
    int _1825 = ~_1815;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = fma(_1615, _1747, _1809);
    int _1833 = _1829;
    if (_1791)
    {
        int _1835 = ~_1815;
        int _1837 = _1835 + 1;
        _1833 = _1837;
    }
    int _1839 = _1833;
    int _1841 = abs(_1807);
    float _1843 = fma(_1821, _1821, _1823);
    bool _1845 = uint(_1751) >= uint(_550);
    float _1847 = fma(_1639, _1021, _1831);
    int _1849 = ~_1817;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = sqrt(_1843);
    bool _1857 = !_1845;
    int _1859 = _1857 ? 0 : (-1);
    float _1861 = _823 + _1847;
    bool _1863 = _1689 != 3;
    int _1865 = _1853 * as_type<int>(_1707);
    int _1867 = ~_1841;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = abs(_1839);
    int _1875 = ~_1723;
    int _1877 = _1875 + _1859;
    int _1879 = _1877 + 1;
    int _1881 = _1871 * as_type<int>(_1699);
    int _1883 = _1881 + _1865;
    bool _1885 = !_1863;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _550 * _1879;
    int _1891 = _1889 + _1167;
    bool _1893 = !_751;
    int _1895 = _1893 ? 0 : 1;
    int _1897 = abs(_1887);
    int _1899 = ~_1873;
    int _1901 = _1899 + 1;
    int _1903 = _1901 + 1;
    bool _1905 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1907 = abs(_1895);
    int _1909 = _1903 * as_type<int>(_1733);
    int _1911 = _1909 + _1883;
    int _1913 = ~_1897;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    bool _1919 = _1713 > 0.0;
    bool _1921 = isnan(_1713);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    int _1929 = _1917 * as_type<int>(_1741);
    int _1931 = _1929 + _1911;
    int _1933 = ~_1907;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    float _1939 = _1713 * _1797;
    bool _1941 = _1797 <= 0.0;
    bool _1943 = !_1927;
    bool _1945 = _1941 || _1943;
    float _1947 = _1733;
    float _1949 = as_type<float>(_1931);
    float _1951 = as_type<float>(_1937);
    if (!_1905)
    {
        _1947 = _1801;
    }
    float _1953 = _1947;
    int _1955 = _1931 * _1937;
    float _1957 = _1953;
    if (!_1905)
    {
        _1949 = _1803;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    if (!_1905)
    {
        _1951 = _1861;
    }
    float _1963 = _1951;
    bool _1965 = !_1905;
    float _1967 = _1963;
    if (!_1965)
    {
        float _1969 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1973 = _1855 + _1971;
        float _1975 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = rsqrt(_1843);
        float _1979 = _1973 * _1969;
        float _1981 = _1979 * 0.15915493667125701904296875;
        float _1983 = _1981 * 6.283185482025146484375;
        float _1985 = cos(_1983);
        float _1987 = _1981 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1985 + (-1.0);
        float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1995 = fma(_1989, _1975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1997 = fma(_1861, _1985, _1993);
        float _1999 = _1977 * _1995;
        float _2001 = fma(_1821, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2003 = fma(_1813, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1961 = _2001;
        _1967 = _1997;
        _1957 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _1967;
    float _2009 = _1957;
    bool _2011 = !_1125;
    int _2013 = _2011 ? _1891 : (-1);
    float _2015 = _2007;
    float _2017 = _2005;
    float _2019 = _2009;
    if (!_785)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2023 = _823 + _2021;
        float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2027 = _839 + _2025;
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2031 = _2023 * _2023;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2035 = _861 + _2033;
        float _2037 = fma(_2027, _2027, _2031);
        float _2039 = -_839;
        float _2041 = _2039 + _2005;
        float _2043 = fma(_2035, _2035, _2037);
        float _2045 = sqrt(_2043);
        float _2047 = precise::min(_2045, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2049 = _2047 * _2029;
        float _2051 = -_823;
        float _2053 = _2051 + _2007;
        float _2055 = -_861;
        float _2057 = _2055 + _2009;
        float _2059 = fma(_2041, _2049, _839);
        float _2061 = fma(_2053, _2049, _823);
        float _2063 = fma(_2057, _2049, _861);
        _2015 = _2061;
        _2017 = _2059;
        _2019 = _2063;
    }
    float _2065 = _2015;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2073 = _2013 * _1907;
    int _2075 = _2073 + _1955;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2071);
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2085 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2077);
    float _2087 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2079);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2091 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2083);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2087);
    float _2097 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2099 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2091);
    float _2101 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2105 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2109 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2111 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2109);
    float _2119 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2111);
    float _2121 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2125 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2115);
    float _2127 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2129 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2131 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2123);
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2129);
    float _2139 = _1939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2141 = float(_2075);
    out.m_57.x = _2067;
    out.m_57.y = _2065;
    out.m_57.z = _2069;
    float _2143 = _2133 + _2137;
    float _2145 = _2135 + _2137;
    float _2147 = _2137 * 0.5;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2151 = _2143 * 0.5;
    float _2153 = _2145 * 0.5;
    float _2155 = fma(_2131, -0.5, _2147);
    out.m_33.x = _2149;
    out.m_59.x = _2141;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _2137;
    out.m_61.x = _2151;
    out.m_61.y = _2155;
    out.m_61.z = _2153;
    out.m_61.w = _2137;
    if (!_1945)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2157;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _522 = false;
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
        float _2214 = as_type<float>(_96);
        out.gl_Position.z = _2214;
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
        float _2283 = as_type<float>(_132);
        out.gl_Position.z = _2283;
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
    bool _286 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _288 = isnan(_284);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _300;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _320 * _308;
    float _342 = -_320;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_284);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _304;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _338 * _344;
    bool _370 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_284);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _388 = 1.0 / _326;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _394 = _348 * _322;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _284 + _396;
    float _400 = _360 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _406 = _380 * _384;
    float _408 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = 1.0 / _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _416 = _408 * _406;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _284 + _418;
    float _422 = -_380;
    float _424 = _422 + 1.0;
    float _426 = _414 * _362;
    float _428 = 1.0 / _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _438 = fma(_426, _420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _416);
    float _442 = _432 * _388;
    bool _444 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _446 = isnan(_284);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _456;
    float _460 = _436 * _410;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _284 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _468 = _284 + _466;
    float _470 = fma(_438, _400, _440);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _474 = _284 + _472;
    float _476 = fma(_442, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = fma(_460, _468, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = _458 * _428;
    float _486 = fma(_476, _368, _470);
    float _488 = _296 * _482;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _492 = fma(_478, _340, _486);
    float _494 = fma(_490, _488, _492);
    float _496 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[120].x, _494);
    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _498;
    bool _500 = !_386;
    float _502 = _368;
    float _520;
    if (!_500)
    {
        float _504 = in.m_39.x;
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _508 = _504 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _512 = _510 * _506;
        float _514 = floor(_512);
        float _516 = -_514;
        float _518 = _512 + _516;
        _520 = _518;
        _522 = true;
    }
    else
    {
        float _524 = float(_80);
        float _526 = 1.0 / _524;
        float _528 = _114 * _526;
        _520 = _528;
    }
    _522 = false;
    float _530 = _520;
    float _532 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _534 = int(_532);
    float _536 = in.m_43.y;
    float _538 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = in.m_43.x;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _544 = _542 != 0;
    float _546 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _550 = int(_548);
    float _552 = in.m_39.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _560 = _558 != 0;
    float _562 = in.m_39.y;
    float _564 = float(_534);
    float _566 = in.m_45.w;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _570 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _572 = float(uint(_550));
    float _574 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = 1.0 / _564;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = float(_550);
    float _586 = 1.0 / _572;
    bool _588 = _562 > 0.5;
    float _590 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _592;
    out.m_47.w = _566;
    float _596 = _114 * _584;
    float _598 = _114 * _578;
    int _600 = ~_550;
    int _602 = _600 + 1;
    float _604 = 1.0 / _582;
    float _606 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _610 = as_type<int>(_586) + (-2);
    float _612 = trunc(_598);
    int _614 = int(_612);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(uint(_614));
    float _620 = as_type<float>(_610) * _618;
    float _622 = in.m_39.w;
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    int _631 = _602 * int(_629);
    int _633 = _631 + _614;
    float _635 = float(uint(_633));
    float _637 = -_536;
    float _639 = _637 + 1.0;
    bool _641 = _622 > 0.5;
    int _643 = ~_550;
    int _645 = _643 + 1;
    float _647 = as_type<float>(_610) * _635;
    float _649 = _635;
    bool _651 = _641;
    float _653 = _536;
    if (!_544)
    {
        _649 = _540;
    }
    float _655 = _649;
    int _657 = _641 ? as_type<int>(_639) : as_type<int>(_536);
    float _659 = _655;
    if (_544)
    {
        bool _661 = _552 > 0.5;
        _651 = _661;
    }
    bool _663 = _651;
    float _665 = trunc(_647);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    if (!_544)
    {
        _502 = _655;
    }
    float _671 = _502;
    float _673 = _671;
    if (_544)
    {
        _659 = _540;
    }
    float _675 = _659;
    float _677 = _560 ? as_type<float>(_657) : _536;
    if (_556)
    {
        float _679 = _588 ? _639 : _536;
        _653 = _679;
    }
    float _681 = _653;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _697 = _695 != 0;
    int _699 = int(_629) + int(_669);
    int _701 = int(_669);
    float _703 = _681;
    if (_544)
    {
        float _705 = -_675;
        float _707 = _705 + 1.0;
        _701 = as_type<int>(_707);
    }
    int _709 = _701;
    float _711 = in.m_49.x;
    float _713 = in.m_49.y;
    float _715 = in.m_49.z;
    bool _717 = !_689;
    int _719 = _717 ? 0 : 1;
    int _721 = _645 * _699;
    int _723 = _721 + _614;
    if (_544)
    {
        float _725 = _663 ? as_type<float>(_709) : _675;
        _673 = _725;
    }
    float _727 = _673;
    bool _729 = uint(_723) >= uint(_550);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = in.m_37.x;
    float _737 = in.m_37.y;
    float _739 = in.m_37.z;
    bool _741 = !_729;
    int _743 = _741 ? 0 : (-1);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _755 = _753 != 0;
    float _757 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _759 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _761 = !_733;
    float _763 = _761 ? 7.345489978790283203125 : 1.0;
    float _765 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _757);
    float _767 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _759);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _773 = !_685;
    int _775 = _773 ? 0 : 1;
    bool _777 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    float _787 = 0.0;
    bool _789 = _747;
    if (_755)
    {
        float _791 = in.m_39.z;
        _787 = _791;
    }
    float _793 = _787;
    bool _795 = !_693;
    int _797 = _795 ? 0 : 1;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.5);
    bool _809 = _805 || _807;
    float _811 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _813 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _815 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _765);
    float _817 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _819 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _823 = _817 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _825 = -_570;
    float _827 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _829 = -_574;
    float _831 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _829);
    float _833 = -_576;
    float _835 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _839 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -_823;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _851 = fma(_590, -2.0, _837);
    float _853 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _855 = -_821;
    float _857 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _855);
    float _859 = float(_80);
    float _861 = _819 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = -_839;
    float _865 = _863 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _843 * _843;
    float _869 = -_845;
    float _871 = fma(_608, 2.0, _869);
    float _873 = 1.0 / _849;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _881 = -_861;
    float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = fma(_865, _865, _867);
    float _887 = -_875;
    float _889 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _887);
    float _891 = -_853;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _891);
    float _895 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = 1.0 / _879;
    float _899 = fma(_883, _883, _885);
    float _901 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _530 + _903;
    float _907 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    int _909 = abs(_719);
    float _911 = -_114;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    out.m_51.x = _839;
    out.m_51.y = _823;
    out.m_51.z = _861;
    float _915 = 1.0 / _859;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _925 = _919 * _873;
    float _927 = _923 * _604;
    float _929 = rsqrt(_899);
    float _931 = _594 * _897;
    float _933 = _923;
    float _935 = _905;
    if (!_733)
    {
        _933 = _562;
    }
    float _937 = _933;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _941 = _897;
    float _943 = _937;
    if (!_733)
    {
        float _945 = in.m_39.z;
        _941 = _945;
    }
    float _947 = _941;
    if (_733)
    {
        _943 = _552;
    }
    float _949 = _943;
    float _951 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _939);
    float _953 = _596 * _915;
    bool _955 = !_747;
    int _957 = _955 ? 0 : 1;
    float _959 = _901 * _771;
    if (_755)
    {
        bool _961 = _793 > 0.5;
        _789 = _961;
    }
    bool _963 = _789;
    float _965 = _763 * _552;
    float _967 = _895 * _769;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _971 = _530 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _530 + _973;
    float _977 = _865 * _929;
    float _979 = _883 * _929;
    float _981 = fma(_927, _971, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _983 = fma(_925, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _985 = _977 * _977;
    float _987 = fma(_931, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _989 = floor(_965);
    float _991 = _831 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = fma(_979, _979, _985);
    float _995 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _997 = _831 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _999 = abs(_957);
    float _1001 = _947;
    if (!_733)
    {
        _935 = _947;
    }
    float _1003 = _935;
    float _1005 = rsqrt(_993);
    float _1007 = _1003;
    if (_733)
    {
        _1007 = _562;
    }
    float _1009 = _1007;
    float _1011 = -_997;
    float _1013 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1011);
    if (_733)
    {
        _1001 = _562;
    }
    float _1015 = _1001;
    float _1017 = fma(_677, _606, -0.5);
    float _1019 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1021 = _843 * _929;
    float _1023 = float(_614);
    float _1025 = -_989;
    float _1027 = _965 + _1025;
    float _1029 = -_1019;
    float _1031 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1033 = -_991;
    float _1035 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1033);
    bool _1037 = _1023 >= _584;
    bool _1039 = isnan(_1023);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(_584);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _1027 * _584;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1031);
    float _1053 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1013);
    float _1057 = _979 * _1005;
    float _1059 = _977 * _1005;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1065 = -_1057;
    float _1067 = _979 * _1065;
    float _1069 = _1021 * _1059;
    float _1071 = trunc(_1047);
    int _1073 = int(_1071);
    float _1075 = -_1061;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_977, _1059, _1079);
    float _1083 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1085 = -_1057;
    float _1087 = _1021 * _1085;
    float _1089 = -_1063;
    float _1091 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1093 = _1081 * _1081;
    float _1095 = -_1083;
    float _1097 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1099 = -_1053;
    float _1101 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1103 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1091);
    float _1105 = fma(_1069, _1069, _1093);
    float _1107 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1097);
    float _1109 = trunc(_1049);
    int _1111 = int(_1109);
    int _1113 = ~_699;
    int _1115 = _1113 + _743;
    int _1117 = _1115 + 1;
    float _1119 = fma(_1087, _1087, _1105);
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1077);
    float _1123 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1035);
    bool _1125 = _550 == 0;
    int _1127 = _550 * _1117;
    int _1129 = _1127 + _614;
    float _1131 = -_1103;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1121);
    float _1135 = rsqrt(_1119);
    float _1137 = -_907;
    float _1139 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1137);
    int _1141 = ~_1073;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1101);
    bool _1149 = !_1125;
    int _1151 = _1149 ? _1129 : (-1);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1139);
    int _1155 = _550 + (-1);
    float _1157 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    float _1159 = 1.0 / _1133;
    int _1161 = _1151 * _1145;
    int _1163 = abs(_797);
    int _1165 = _1111 * _999;
    int _1167 = _1165 + _614;
    int _1169 = abs(_775);
    int _1171 = _1073 * _1155;
    int _1173 = _1171 + _1161;
    float _1175 = trunc(_953);
    int _1177 = int(_1175);
    float _1179 = _1081 * _1135;
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    int _1183 = _1173 * _909;
    bool _1185 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1187 = isnan(_530);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1181;
    float _1199 = _1197 + 1.0;
    float _1201 = fma(_1153, _1159, -1.0);
    float _1203 = _1199 * _1159;
    bool _1205 = !_697;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _1123 * _1203;
    int _1211 = _1177 * _1169;
    int _1213 = _1211 + _1183;
    float _1215 = fma(_1199, _1201, 1.0);
    bool _1217 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1219 = isnan(_530);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1231 = _1167 * _1163;
    int _1233 = _1231 + _1213;
    float _1235 = _1147 * _1203;
    bool _1237 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_530);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1227;
    float _1251 = _1249 + 1.0;
    float _1253 = _1215 * _1215;
    bool _1255 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1257 = isnan(_530);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = _1195 * _1251;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = fma(_1209, _1209, _1253);
    int _1275 = abs(_1207);
    float _1277 = _1265 * _1271;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1235, _1235, _1273);
    float _1283 = -_1265;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1289 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1291 = _1247 * _1285;
    float _1293 = rsqrt(_1281);
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _681, -0.5);
    float _1297 = _983 * _1291;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_755)
    {
        float _1301 = -_675;
        float _1303 = _1301 + 1.0;
        _1299 = as_type<int>(_1303);
    }
    int _1305 = _1299;
    float _1307 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1309 = _1111 * _1275;
    int _1311 = _1309 + _1233;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1315 = -_1247;
    float _1317 = _1315 + 1.0;
    if (!_755)
    {
        _703 = _675;
    }
    float _1319 = _703;
    float _1321 = -_1229;
    float _1323 = fma(_1289, 2.0, _1321);
    float _1325 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1313);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1297);
    float _1329 = _1319;
    if (_755)
    {
        float _1331 = _963 ? as_type<float>(_1305) : _675;
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = -_1307;
    float _1337 = fma(_1157, _1295, _1335);
    float _1339 = float(uint(_1311));
    float _1341 = _1235 * _1293;
    float _1343 = _1215 * _1293;
    float _1345 = _1209 * _1293;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1349 = -_1341;
    float _1351 = _977 * _1349;
    float _1353 = _979 * _1343;
    float _1355 = as_type<float>(_610) * _1339;
    float _1357 = -_1345;
    float _1359 = _1021 * _1357;
    float _1361 = -_1345;
    float _1363 = -_1351;
    float _1365 = fma(_979, _1361, _1363);
    float _1367 = -_1341;
    float _1369 = -_1353;
    float _1371 = fma(_1021, _1367, _1369);
    float _1373 = -_1359;
    float _1375 = fma(_977, _1343, _1373);
    float _1377 = _1365 * _1365;
    float _1379 = trunc(_1355);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = fma(_1371, _1371, _1377);
    float _1391 = fma(_981, _1277, _1327);
    float _1393 = fma(_1385, -2.0, _1387);
    float _1395 = fma(_1375, _1375, _1389);
    int _1397 = ~_550;
    int _1399 = _1397 + 1;
    float _1401 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1403 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = fma(_987, _1267, _1391);
    float _1407 = rsqrt(_1395);
    float _1409 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1411 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _951);
    float _1413 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1287);
    int _1415 = _1399 * int(_1383);
    int _1417 = _1415 + _1311;
    float _1419 = -_114;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1323);
    float _1423 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1425 = fma(_1403, _1333, -0.5);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1405);
    float _1429 = float(uint(_1417));
    float _1431 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1393);
    float _1433 = fma(_1411, _1401, _913);
    float _1435 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1423);
    float _1437 = fma(_1413, _1425, _1421);
    float _1439 = as_type<float>(_610) * _1429;
    float _1441 = -_1431;
    float _1443 = fma(_1409, _1017, _1441);
    float _1445 = _1371 * _1407;
    float _1447 = _1375 * _1407;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = _1365 * _1407;
    float _1457 = _979 * _1445;
    float _1459 = _1021 * _1447;
    float _1461 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1435);
    float _1463 = _977 * _1455;
    float _1465 = -_1457;
    float _1467 = fma(_977, _1447, _1465);
    float _1469 = float(uint(_1167));
    float _1471 = -_1459;
    float _1473 = fma(_979, _1455, _1471);
    float _1475 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = -_1463;
    float _1479 = fma(_1021, _1445, _1477);
    int _1481 = ~_550;
    int _1483 = _1481 + 1;
    float _1485 = as_type<float>(_610) * _1469;
    float _1487 = _1467 * _1467;
    float _1489 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1491 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    float _1499 = fma(_1473, _1473, _1487);
    int _1501 = int(_1383) + int(_1453);
    float _1503 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1505 = fma(_1479, _1479, _1499);
    int _1507 = ~_550;
    int _1509 = _1507 + 1;
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = 1.0 / _1491;
    int _1515 = _1483 * _1501;
    int _1517 = _1515 + _1311;
    float _1519 = _1337 + 0.5;
    float _1521 = as_type<float>(_1383);
    float _1523 = _1431;
    float _1525 = as_type<float>(_1509);
    float _1527 = _1511;
    float _1529 = _1505;
    float _1531 = _1443;
    float _1533 = _1433;
    if (!_809)
    {
        _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1535 = _1521;
    float _1537 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1539 = uint(_1517) >= uint(_550);
    float _1541 = rsqrt(_1505);
    int _1543 = _1509 * int(_1497);
    int _1545 = _1543 + _1167;
    bool _1547 = !_1539;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = _1511 + _1491;
    if (!_809)
    {
        float _1553 = -_1535;
        float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1523 = _1555;
    }
    float _1557 = _1523;
    if (!_809)
    {
        _1525 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1559 = _1525;
    out.m_53.w = _1537;
    int _1561 = ~_1501;
    int _1563 = _1561 + _1549;
    int _1565 = _1563 + 1;
    float _1567 = _1551 * _1513;
    float _1569 = _1567 * 0.5;
    if (!_809)
    {
        float _1571 = 1.0 / _1557;
        _1527 = _1571;
    }
    float _1573 = _1527;
    float _1575 = float(uint(_1545));
    int _1577 = _550 * _1565;
    int _1579 = _1577 + _1311;
    float _1581 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = _1581;
    if (!_809)
    {
        float _1589 = -_1559;
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1529 = _1591;
    }
    float _1593 = _1529;
    float _1595 = _1479 * _1541;
    float _1597 = _1467 * _1541;
    float _1599 = _1473 * _1541;
    bool _1601 = !_1125;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _977 * _1595;
    float _1607 = _979 * _1597;
    float _1609 = as_type<float>(_610) * _1575;
    int _1611 = _1603 >> 31;
    float _1613 = -_1605;
    float _1615 = fma(_979, _1599, _1613);
    float _1617 = _1021 * _1599;
    float _1619 = -_1607;
    float _1621 = fma(_1021, _1595, _1619);
    float _1623 = 1.0 / _1585;
    float _1625 = _1615 * _1615;
    int _1627 = _1611 & 3;
    float _1629 = -_1617;
    float _1631 = fma(_977, _1597, _1629);
    float _1633 = _1433 + 0.5;
    float _1635 = fma(_1621, _1621, _1625);
    int _1637 = _1603 + _1627;
    float _1639 = _1581 * _715;
    float _1641 = trunc(_1609);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = fma(_1631, _1631, _1635);
    int _1649 = _1637 >> 2;
    float _1651 = _1437 + 0.5;
    float _1653 = _1443 + 0.5;
    float _1655 = _1633;
    if (_809)
    {
        _1531 = 1.0;
    }
    float _1657 = _1531;
    float _1659 = _959 * _1599;
    int _1661 = _1603 & 3;
    bool _1663 = _1661 != 0;
    float _1665 = rsqrt(_1647);
    int _1667 = _1649 << 4;
    int _1669 = _1667 + 368;
    float _1671 = _1657;
    if (!_809)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1675 = -_1535;
        float _1677 = fma(_1623, _1673, _1675);
        _1533 = _1677;
    }
    float _1679 = _1533;
    if (!_809)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1683 = -_1559;
        float _1685 = fma(_1623, _1681, _1683);
        _1587 = _1685;
    }
    float _1687 = _1587;
    int _1689 = _1603 & 3;
    bool _1691 = _1689 != 0;
    uint _1693 = uint(int(uint(_1669) >> uint(2)));
    uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
    int _1697 = int(_1693) & 3;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[int(_1695)][_1697];
    int _1701 = int(_1693) + 1;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    int _1705 = _1701 & 3;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[int(_1703)][_1705];
    out.m_55.x = _1633;
    out.m_55.y = _1519;
    out.m_55.z = _1651;
    out.m_55.w = _1653;
    if (!_809)
    {
        float _1709 = _1679 * _1573;
        float _1711 = precise::clamp(_1709, 0.0, 1.0);
        _1671 = _1711;
    }
    float _1713 = _1671;
    float _1715 = _1593;
    if (!_809)
    {
        float _1717 = 1.0 / _1593;
        _1715 = _1717;
    }
    float _1719 = _1715;
    bool _1721 = uint(_1689) > 1u;
    int _1723 = int(_1497) + int(_1645);
    int _1725 = _1669 + 8;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = ~_550;
    int _1745 = _1743 + 1;
    float _1747 = _967 * _1665;
    int _1749 = _1745 * _1723;
    int _1751 = _1749 + _1167;
    float _1753 = _959 * _1595;
    int _1755 = _1663 ? 0 : 1;
    float _1757 = fma(_1621, _1747, _1659);
    if (_809)
    {
        _1655 = 1.0;
    }
    float _1759 = _1655;
    float _1761 = fma(_1631, _1747, _1753);
    float _1763 = _1719;
    float _1765 = _1759;
    if (!_809)
    {
        float _1767 = _1687 * _1719;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        _1763 = _1769;
    }
    float _1771 = _1763;
    int _1773 = ~_1755;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1639, _977, _1757);
    int _1781 = _1777;
    if (!_1721)
    {
        int _1783 = ~_1755;
        int _1785 = _1783 + 1;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = fma(_1639, _979, _1761);
    bool _1791 = _1689 != 3;
    if (!_809)
    {
        float _1793 = -_1771;
        float _1795 = _1793 + 1.0;
        _1765 = _1795;
    }
    float _1797 = _1765;
    bool _1799 = uint(_1689) >= 2u;
    float _1801 = _861 + _1789;
    float _1803 = _839 + _1779;
    bool _1805 = !_1691;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = _959 * _1597;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1801 + _1811;
    int _1815 = _1799 ? 0 : 1;
    int _1817 = abs(_1787);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1821 = _1803 + _1819;
    float _1823 = _1813 * _1813;
    int _1825 = ~_1815;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = fma(_1615, _1747, _1809);
    int _1833 = _1829;
    if (_1791)
    {
        int _1835 = ~_1815;
        int _1837 = _1835 + 1;
        _1833 = _1837;
    }
    int _1839 = _1833;
    int _1841 = abs(_1807);
    float _1843 = fma(_1821, _1821, _1823);
    bool _1845 = uint(_1751) >= uint(_550);
    float _1847 = fma(_1639, _1021, _1831);
    int _1849 = ~_1817;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = sqrt(_1843);
    bool _1857 = !_1845;
    int _1859 = _1857 ? 0 : (-1);
    float _1861 = _823 + _1847;
    bool _1863 = _1689 != 3;
    int _1865 = _1853 * as_type<int>(_1707);
    int _1867 = ~_1841;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = abs(_1839);
    int _1875 = ~_1723;
    int _1877 = _1875 + _1859;
    int _1879 = _1877 + 1;
    int _1881 = _1871 * as_type<int>(_1699);
    int _1883 = _1881 + _1865;
    bool _1885 = !_1863;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _550 * _1879;
    int _1891 = _1889 + _1167;
    bool _1893 = !_751;
    int _1895 = _1893 ? 0 : 1;
    int _1897 = abs(_1887);
    int _1899 = ~_1873;
    int _1901 = _1899 + 1;
    int _1903 = _1901 + 1;
    bool _1905 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1907 = abs(_1895);
    int _1909 = _1903 * as_type<int>(_1733);
    int _1911 = _1909 + _1883;
    int _1913 = ~_1897;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    bool _1919 = _1713 > 0.0;
    bool _1921 = isnan(_1713);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    int _1929 = _1917 * as_type<int>(_1741);
    int _1931 = _1929 + _1911;
    int _1933 = ~_1907;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    float _1939 = _1713 * _1797;
    bool _1941 = _1797 <= 0.0;
    bool _1943 = !_1927;
    bool _1945 = _1941 || _1943;
    float _1947 = _1733;
    float _1949 = as_type<float>(_1931);
    float _1951 = as_type<float>(_1937);
    if (!_1905)
    {
        _1947 = _1801;
    }
    float _1953 = _1947;
    int _1955 = _1931 * _1937;
    float _1957 = _1953;
    if (!_1905)
    {
        _1949 = _1803;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    if (!_1905)
    {
        _1951 = _1861;
    }
    float _1963 = _1951;
    bool _1965 = !_1905;
    float _1967 = _1963;
    if (!_1965)
    {
        float _1969 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1973 = _1855 + _1971;
        float _1975 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = rsqrt(_1843);
        float _1979 = _1973 * _1969;
        float _1981 = _1979 * 0.15915493667125701904296875;
        float _1983 = _1981 * 6.283185482025146484375;
        float _1985 = cos(_1983);
        float _1987 = _1981 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1985 + (-1.0);
        float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1995 = fma(_1989, _1975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1997 = fma(_1861, _1985, _1993);
        float _1999 = _1977 * _1995;
        float _2001 = fma(_1821, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2003 = fma(_1813, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1961 = _2001;
        _1967 = _1997;
        _1957 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _1967;
    float _2009 = _1957;
    bool _2011 = !_1125;
    int _2013 = _2011 ? _1891 : (-1);
    float _2015 = _2007;
    float _2017 = _2005;
    float _2019 = _2009;
    if (!_785)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2023 = _823 + _2021;
        float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2027 = _839 + _2025;
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2031 = _2023 * _2023;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2035 = _861 + _2033;
        float _2037 = fma(_2027, _2027, _2031);
        float _2039 = -_839;
        float _2041 = _2039 + _2005;
        float _2043 = fma(_2035, _2035, _2037);
        float _2045 = sqrt(_2043);
        float _2047 = precise::min(_2045, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2049 = _2047 * _2029;
        float _2051 = -_823;
        float _2053 = _2051 + _2007;
        float _2055 = -_861;
        float _2057 = _2055 + _2009;
        float _2059 = fma(_2041, _2049, _839);
        float _2061 = fma(_2053, _2049, _823);
        float _2063 = fma(_2057, _2049, _861);
        _2015 = _2061;
        _2017 = _2059;
        _2019 = _2063;
    }
    float _2065 = _2015;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2073 = _2013 * _1907;
    int _2075 = _2073 + _1955;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2071);
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2085 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2077);
    float _2087 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2079);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2091 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2083);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2087);
    float _2097 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2099 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2091);
    float _2101 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2105 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2109 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2111 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2109);
    float _2119 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2111);
    float _2121 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2125 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2115);
    float _2127 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2129 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2131 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2123);
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2129);
    float _2139 = _1939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2141 = float(_2075);
    out.m_57.x = _2067;
    out.m_57.y = _2065;
    out.m_57.z = _2069;
    float _2143 = _2133 + _2137;
    float _2145 = _2135 + _2137;
    float _2147 = _2137 * 0.5;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2151 = _2143 * 0.5;
    float _2153 = _2145 * 0.5;
    float _2155 = fma(_2131, -0.5, _2147);
    out.m_33.x = _2149;
    out.m_59.x = _2141;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _2137;
    out.m_61.x = _2151;
    out.m_61.y = _2155;
    out.m_61.z = _2153;
    out.m_61.w = _2137;
    if (!_1945)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2157;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _522 = false;
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
        float _2214 = as_type<float>(_96);
        out.gl_Position.z = _2214;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2283 = as_type<float>(_132);
        out.gl_Position.z = _2283;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _286 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _288 = isnan(_284);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _300;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _328 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_284);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _320 * _308;
    float _342 = -_320;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _346;
    bool _350 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_284);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _304;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _338 * _344;
    bool _370 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_284);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_360;
    float _384 = _382 + 1.0;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _388 = 1.0 / _326;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _394 = _348 * _322;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _284 + _396;
    float _400 = _360 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _406 = _380 * _384;
    float _408 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = 1.0 / _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _416 = _408 * _406;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _420 = _284 + _418;
    float _422 = -_380;
    float _424 = _422 + 1.0;
    float _426 = _414 * _362;
    float _428 = 1.0 / _404;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _438 = fma(_426, _420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _416);
    float _442 = _432 * _388;
    bool _444 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _446 = isnan(_284);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _456;
    float _460 = _436 * _410;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _284 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _468 = _284 + _466;
    float _470 = fma(_438, _400, _440);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _474 = _284 + _472;
    float _476 = fma(_442, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = fma(_460, _468, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = _458 * _428;
    float _486 = fma(_476, _368, _470);
    float _488 = _296 * _482;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _492 = fma(_478, _340, _486);
    float _494 = fma(_490, _488, _492);
    float _496 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[120].x, _494);
    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _498;
    bool _500 = !_386;
    float _502 = _368;
    float _520;
    if (!_500)
    {
        float _504 = in.m_39.x;
        float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _508 = _504 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _512 = _510 * _506;
        float _514 = floor(_512);
        float _516 = -_514;
        float _518 = _512 + _516;
        _520 = _518;
        _522 = true;
    }
    else
    {
        float _524 = float(_80);
        float _526 = 1.0 / _524;
        float _528 = _114 * _526;
        _520 = _528;
    }
    _522 = false;
    float _530 = _520;
    float _532 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _534 = int(_532);
    float _536 = in.m_43.y;
    float _538 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = in.m_43.x;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _544 = _542 != 0;
    float _546 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _550 = int(_548);
    float _552 = in.m_39.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _560 = _558 != 0;
    float _562 = in.m_39.y;
    float _564 = float(_534);
    float _566 = in.m_45.w;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _570 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _572 = float(uint(_550));
    float _574 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _576 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _578 = 1.0 / _564;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = float(_550);
    float _586 = 1.0 / _572;
    bool _588 = _562 > 0.5;
    float _590 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _592;
    out.m_47.w = _566;
    float _596 = _114 * _584;
    float _598 = _114 * _578;
    int _600 = ~_550;
    int _602 = _600 + 1;
    float _604 = 1.0 / _582;
    float _606 = _568 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _608 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _610 = as_type<int>(_586) + (-2);
    float _612 = trunc(_598);
    int _614 = int(_612);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(uint(_614));
    float _620 = as_type<float>(_610) * _618;
    float _622 = in.m_39.w;
    float _624 = trunc(_620);
    float _626 = precise::max(_624, 0.0);
    uint _629 = uint(_626);
    int _631 = _602 * int(_629);
    int _633 = _631 + _614;
    float _635 = float(uint(_633));
    float _637 = -_536;
    float _639 = _637 + 1.0;
    bool _641 = _622 > 0.5;
    int _643 = ~_550;
    int _645 = _643 + 1;
    float _647 = as_type<float>(_610) * _635;
    float _649 = _635;
    bool _651 = _641;
    float _653 = _536;
    if (!_544)
    {
        _649 = _540;
    }
    float _655 = _649;
    int _657 = _641 ? as_type<int>(_639) : as_type<int>(_536);
    float _659 = _655;
    if (_544)
    {
        bool _661 = _552 > 0.5;
        _651 = _661;
    }
    bool _663 = _651;
    float _665 = trunc(_647);
    float _667 = precise::max(_665, 0.0);
    uint _669 = uint(_667);
    if (!_544)
    {
        _502 = _655;
    }
    float _671 = _502;
    float _673 = _671;
    if (_544)
    {
        _659 = _540;
    }
    float _675 = _659;
    float _677 = _560 ? as_type<float>(_657) : _536;
    if (_556)
    {
        float _679 = _588 ? _639 : _536;
        _653 = _679;
    }
    float _681 = _653;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _697 = _695 != 0;
    int _699 = int(_629) + int(_669);
    int _701 = int(_669);
    float _703 = _681;
    if (_544)
    {
        float _705 = -_675;
        float _707 = _705 + 1.0;
        _701 = as_type<int>(_707);
    }
    int _709 = _701;
    float _711 = in.m_49.x;
    float _713 = in.m_49.y;
    float _715 = in.m_49.z;
    bool _717 = !_689;
    int _719 = _717 ? 0 : 1;
    int _721 = _645 * _699;
    int _723 = _721 + _614;
    if (_544)
    {
        float _725 = _663 ? as_type<float>(_709) : _675;
        _673 = _725;
    }
    float _727 = _673;
    bool _729 = uint(_723) >= uint(_550);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = in.m_37.x;
    float _737 = in.m_37.y;
    float _739 = in.m_37.z;
    bool _741 = !_729;
    int _743 = _741 ? 0 : (-1);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _755 = _753 != 0;
    float _757 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _759 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _761 = !_733;
    float _763 = _761 ? 7.345489978790283203125 : 1.0;
    float _765 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _757);
    float _767 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _759);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _773 = !_685;
    int _775 = _773 ? 0 : 1;
    bool _777 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    float _787 = 0.0;
    bool _789 = _747;
    if (_755)
    {
        float _791 = in.m_39.z;
        _787 = _791;
    }
    float _793 = _787;
    bool _795 = !_693;
    int _797 = _795 ? 0 : 1;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.5);
    bool _809 = _805 || _807;
    float _811 = _737 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _813 = _739 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _815 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _765);
    float _817 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _819 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _823 = _817 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _825 = -_570;
    float _827 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _825);
    float _829 = -_574;
    float _831 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _829);
    float _833 = -_576;
    float _835 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _839 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -_823;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _851 = fma(_590, -2.0, _837);
    float _853 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _855 = -_821;
    float _857 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _855);
    float _859 = float(_80);
    float _861 = _819 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = -_839;
    float _865 = _863 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _843 * _843;
    float _869 = -_845;
    float _871 = fma(_608, 2.0, _869);
    float _873 = 1.0 / _849;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _881 = -_861;
    float _883 = _881 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = fma(_865, _865, _867);
    float _887 = -_875;
    float _889 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _887);
    float _891 = -_853;
    float _893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _891);
    float _895 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _897 = 1.0 / _879;
    float _899 = fma(_883, _883, _885);
    float _901 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _530 + _903;
    float _907 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    int _909 = abs(_719);
    float _911 = -_114;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    out.m_51.x = _839;
    out.m_51.y = _823;
    out.m_51.z = _861;
    float _915 = 1.0 / _859;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _925 = _919 * _873;
    float _927 = _923 * _604;
    float _929 = rsqrt(_899);
    float _931 = _594 * _897;
    float _933 = _923;
    float _935 = _905;
    if (!_733)
    {
        _933 = _562;
    }
    float _937 = _933;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _941 = _897;
    float _943 = _937;
    if (!_733)
    {
        float _945 = in.m_39.z;
        _941 = _945;
    }
    float _947 = _941;
    if (_733)
    {
        _943 = _552;
    }
    float _949 = _943;
    float _951 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _939);
    float _953 = _596 * _915;
    bool _955 = !_747;
    int _957 = _955 ? 0 : 1;
    float _959 = _901 * _771;
    if (_755)
    {
        bool _961 = _793 > 0.5;
        _789 = _961;
    }
    bool _963 = _789;
    float _965 = _763 * _552;
    float _967 = _895 * _769;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _971 = _530 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _975 = _530 + _973;
    float _977 = _865 * _929;
    float _979 = _883 * _929;
    float _981 = fma(_927, _971, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _983 = fma(_925, _975, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _985 = _977 * _977;
    float _987 = fma(_931, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _989 = floor(_965);
    float _991 = _831 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = fma(_979, _979, _985);
    float _995 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _997 = _831 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _999 = abs(_957);
    float _1001 = _947;
    if (!_733)
    {
        _935 = _947;
    }
    float _1003 = _935;
    float _1005 = rsqrt(_993);
    float _1007 = _1003;
    if (_733)
    {
        _1007 = _562;
    }
    float _1009 = _1007;
    float _1011 = -_997;
    float _1013 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1011);
    if (_733)
    {
        _1001 = _562;
    }
    float _1015 = _1001;
    float _1017 = fma(_677, _606, -0.5);
    float _1019 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1021 = _843 * _929;
    float _1023 = float(_614);
    float _1025 = -_989;
    float _1027 = _965 + _1025;
    float _1029 = -_1019;
    float _1031 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1029);
    float _1033 = -_991;
    float _1035 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1033);
    bool _1037 = _1023 >= _584;
    bool _1039 = isnan(_1023);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(_584);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _1027 * _584;
    float _1051 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1031);
    float _1053 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1055 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1013);
    float _1057 = _979 * _1005;
    float _1059 = _977 * _1005;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _889 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1065 = -_1057;
    float _1067 = _979 * _1065;
    float _1069 = _1021 * _1059;
    float _1071 = trunc(_1047);
    int _1073 = int(_1071);
    float _1075 = -_1061;
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1079 = -_1067;
    float _1081 = fma(_977, _1059, _1079);
    float _1083 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1085 = -_1057;
    float _1087 = _1021 * _1085;
    float _1089 = -_1063;
    float _1091 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1093 = _1081 * _1081;
    float _1095 = -_1083;
    float _1097 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1095);
    float _1099 = -_1053;
    float _1101 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1103 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1091);
    float _1105 = fma(_1069, _1069, _1093);
    float _1107 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1097);
    float _1109 = trunc(_1049);
    int _1111 = int(_1109);
    int _1113 = ~_699;
    int _1115 = _1113 + _743;
    int _1117 = _1115 + 1;
    float _1119 = fma(_1087, _1087, _1105);
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1077);
    float _1123 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1035);
    bool _1125 = _550 == 0;
    int _1127 = _550 * _1117;
    int _1129 = _1127 + _614;
    float _1131 = -_1103;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1121);
    float _1135 = rsqrt(_1119);
    float _1137 = -_907;
    float _1139 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1137);
    int _1141 = ~_1073;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    float _1147 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1101);
    bool _1149 = !_1125;
    int _1151 = _1149 ? _1129 : (-1);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1139);
    int _1155 = _550 + (-1);
    float _1157 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    float _1159 = 1.0 / _1133;
    int _1161 = _1151 * _1145;
    int _1163 = abs(_797);
    int _1165 = _1111 * _999;
    int _1167 = _1165 + _614;
    int _1169 = abs(_775);
    int _1171 = _1073 * _1155;
    int _1173 = _1171 + _1161;
    float _1175 = trunc(_953);
    int _1177 = int(_1175);
    float _1179 = _1081 * _1135;
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    int _1183 = _1173 * _909;
    bool _1185 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1187 = isnan(_530);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1181;
    float _1199 = _1197 + 1.0;
    float _1201 = fma(_1153, _1159, -1.0);
    float _1203 = _1199 * _1159;
    bool _1205 = !_697;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = _1123 * _1203;
    int _1211 = _1177 * _1169;
    int _1213 = _1211 + _1183;
    float _1215 = fma(_1199, _1201, 1.0);
    bool _1217 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1219 = isnan(_530);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1225 = _1221 || _1223;
    float _1227 = float(_1225);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1231 = _1167 * _1163;
    int _1233 = _1231 + _1213;
    float _1235 = _1147 * _1203;
    bool _1237 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1239 = isnan(_530);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -_1227;
    float _1251 = _1249 + 1.0;
    float _1253 = _1215 * _1215;
    bool _1255 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1257 = isnan(_530);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = _1195 * _1251;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = fma(_1209, _1209, _1253);
    int _1275 = abs(_1207);
    float _1277 = _1265 * _1271;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1235, _1235, _1273);
    float _1283 = -_1265;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1289 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1291 = _1247 * _1285;
    float _1293 = rsqrt(_1281);
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _681, -0.5);
    float _1297 = _983 * _1291;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_755)
    {
        float _1301 = -_675;
        float _1303 = _1301 + 1.0;
        _1299 = as_type<int>(_1303);
    }
    int _1305 = _1299;
    float _1307 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _851);
    int _1309 = _1111 * _1275;
    int _1311 = _1309 + _1233;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1315 = -_1247;
    float _1317 = _1315 + 1.0;
    if (!_755)
    {
        _703 = _675;
    }
    float _1319 = _703;
    float _1321 = -_1229;
    float _1323 = fma(_1289, 2.0, _1321);
    float _1325 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1313);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1297);
    float _1329 = _1319;
    if (_755)
    {
        float _1331 = _963 ? as_type<float>(_1305) : _675;
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = -_1307;
    float _1337 = fma(_1157, _1295, _1335);
    float _1339 = float(uint(_1311));
    float _1341 = _1235 * _1293;
    float _1343 = _1215 * _1293;
    float _1345 = _1209 * _1293;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1349 = -_1341;
    float _1351 = _977 * _1349;
    float _1353 = _979 * _1343;
    float _1355 = as_type<float>(_610) * _1339;
    float _1357 = -_1345;
    float _1359 = _1021 * _1357;
    float _1361 = -_1345;
    float _1363 = -_1351;
    float _1365 = fma(_979, _1361, _1363);
    float _1367 = -_1341;
    float _1369 = -_1353;
    float _1371 = fma(_1021, _1367, _1369);
    float _1373 = -_1359;
    float _1375 = fma(_977, _1343, _1373);
    float _1377 = _1365 * _1365;
    float _1379 = trunc(_1355);
    float _1381 = precise::max(_1379, 0.0);
    uint _1383 = uint(_1381);
    float _1385 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = fma(_1371, _1371, _1377);
    float _1391 = fma(_981, _1277, _1327);
    float _1393 = fma(_1385, -2.0, _1387);
    float _1395 = fma(_1375, _1375, _1389);
    int _1397 = ~_550;
    int _1399 = _1397 + 1;
    float _1401 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1403 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = fma(_987, _1267, _1391);
    float _1407 = rsqrt(_1395);
    float _1409 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1411 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _951);
    float _1413 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1287);
    int _1415 = _1399 * int(_1383);
    int _1417 = _1415 + _1311;
    float _1419 = -_114;
    float _1421 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1323);
    float _1423 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1425 = fma(_1403, _1333, -0.5);
    float _1427 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1405);
    float _1429 = float(uint(_1417));
    float _1431 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1393);
    float _1433 = fma(_1411, _1401, _913);
    float _1435 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1423);
    float _1437 = fma(_1413, _1425, _1421);
    float _1439 = as_type<float>(_610) * _1429;
    float _1441 = -_1431;
    float _1443 = fma(_1409, _1017, _1441);
    float _1445 = _1371 * _1407;
    float _1447 = _1375 * _1407;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = _1365 * _1407;
    float _1457 = _979 * _1445;
    float _1459 = _1021 * _1447;
    float _1461 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1435);
    float _1463 = _977 * _1455;
    float _1465 = -_1457;
    float _1467 = fma(_977, _1447, _1465);
    float _1469 = float(uint(_1167));
    float _1471 = -_1459;
    float _1473 = fma(_979, _1455, _1471);
    float _1475 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = -_1463;
    float _1479 = fma(_1021, _1445, _1477);
    int _1481 = ~_550;
    int _1483 = _1481 + 1;
    float _1485 = as_type<float>(_610) * _1469;
    float _1487 = _1467 * _1467;
    float _1489 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1491 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    float _1499 = fma(_1473, _1473, _1487);
    int _1501 = int(_1383) + int(_1453);
    float _1503 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1505 = fma(_1479, _1479, _1499);
    int _1507 = ~_550;
    int _1509 = _1507 + 1;
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1513 = 1.0 / _1491;
    int _1515 = _1483 * _1501;
    int _1517 = _1515 + _1311;
    float _1519 = _1337 + 0.5;
    float _1521 = as_type<float>(_1383);
    float _1523 = _1431;
    float _1525 = as_type<float>(_1509);
    float _1527 = _1511;
    float _1529 = _1505;
    float _1531 = _1443;
    float _1533 = _1433;
    if (!_809)
    {
        _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1535 = _1521;
    float _1537 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1539 = uint(_1517) >= uint(_550);
    float _1541 = rsqrt(_1505);
    int _1543 = _1509 * int(_1497);
    int _1545 = _1543 + _1167;
    bool _1547 = !_1539;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = _1511 + _1491;
    if (!_809)
    {
        float _1553 = -_1535;
        float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1523 = _1555;
    }
    float _1557 = _1523;
    if (!_809)
    {
        _1525 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1559 = _1525;
    out.m_53.w = _1537;
    int _1561 = ~_1501;
    int _1563 = _1561 + _1549;
    int _1565 = _1563 + 1;
    float _1567 = _1551 * _1513;
    float _1569 = _1567 * 0.5;
    if (!_809)
    {
        float _1571 = 1.0 / _1557;
        _1527 = _1571;
    }
    float _1573 = _1527;
    float _1575 = float(uint(_1545));
    int _1577 = _550 * _1565;
    int _1579 = _1577 + _1311;
    float _1581 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1583);
    float _1587 = _1581;
    if (!_809)
    {
        float _1589 = -_1559;
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1529 = _1591;
    }
    float _1593 = _1529;
    float _1595 = _1479 * _1541;
    float _1597 = _1467 * _1541;
    float _1599 = _1473 * _1541;
    bool _1601 = !_1125;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _977 * _1595;
    float _1607 = _979 * _1597;
    float _1609 = as_type<float>(_610) * _1575;
    int _1611 = _1603 >> 31;
    float _1613 = -_1605;
    float _1615 = fma(_979, _1599, _1613);
    float _1617 = _1021 * _1599;
    float _1619 = -_1607;
    float _1621 = fma(_1021, _1595, _1619);
    float _1623 = 1.0 / _1585;
    float _1625 = _1615 * _1615;
    int _1627 = _1611 & 3;
    float _1629 = -_1617;
    float _1631 = fma(_977, _1597, _1629);
    float _1633 = _1433 + 0.5;
    float _1635 = fma(_1621, _1621, _1625);
    int _1637 = _1603 + _1627;
    float _1639 = _1581 * _715;
    float _1641 = trunc(_1609);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    float _1647 = fma(_1631, _1631, _1635);
    int _1649 = _1637 >> 2;
    float _1651 = _1437 + 0.5;
    float _1653 = _1443 + 0.5;
    float _1655 = _1633;
    if (_809)
    {
        _1531 = 1.0;
    }
    float _1657 = _1531;
    float _1659 = _959 * _1599;
    int _1661 = _1603 & 3;
    bool _1663 = _1661 != 0;
    float _1665 = rsqrt(_1647);
    int _1667 = _1649 << 4;
    int _1669 = _1667 + 368;
    float _1671 = _1657;
    if (!_809)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1675 = -_1535;
        float _1677 = fma(_1623, _1673, _1675);
        _1533 = _1677;
    }
    float _1679 = _1533;
    if (!_809)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1683 = -_1559;
        float _1685 = fma(_1623, _1681, _1683);
        _1587 = _1685;
    }
    float _1687 = _1587;
    int _1689 = _1603 & 3;
    bool _1691 = _1689 != 0;
    uint _1693 = uint(int(uint(_1669) >> uint(2)));
    uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
    int _1697 = int(_1693) & 3;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[int(_1695)][_1697];
    int _1701 = int(_1693) + 1;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    int _1705 = _1701 & 3;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[int(_1703)][_1705];
    out.m_55.x = _1633;
    out.m_55.y = _1519;
    out.m_55.z = _1651;
    out.m_55.w = _1653;
    if (!_809)
    {
        float _1709 = _1679 * _1573;
        float _1711 = precise::clamp(_1709, 0.0, 1.0);
        _1671 = _1711;
    }
    float _1713 = _1671;
    float _1715 = _1593;
    if (!_809)
    {
        float _1717 = 1.0 / _1593;
        _1715 = _1717;
    }
    float _1719 = _1715;
    bool _1721 = uint(_1689) > 1u;
    int _1723 = int(_1497) + int(_1645);
    int _1725 = _1669 + 8;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = ~_550;
    int _1745 = _1743 + 1;
    float _1747 = _967 * _1665;
    int _1749 = _1745 * _1723;
    int _1751 = _1749 + _1167;
    float _1753 = _959 * _1595;
    int _1755 = _1663 ? 0 : 1;
    float _1757 = fma(_1621, _1747, _1659);
    if (_809)
    {
        _1655 = 1.0;
    }
    float _1759 = _1655;
    float _1761 = fma(_1631, _1747, _1753);
    float _1763 = _1719;
    float _1765 = _1759;
    if (!_809)
    {
        float _1767 = _1687 * _1719;
        float _1769 = precise::clamp(_1767, 0.0, 1.0);
        _1763 = _1769;
    }
    float _1771 = _1763;
    int _1773 = ~_1755;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1639, _977, _1757);
    int _1781 = _1777;
    if (!_1721)
    {
        int _1783 = ~_1755;
        int _1785 = _1783 + 1;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = fma(_1639, _979, _1761);
    bool _1791 = _1689 != 3;
    if (!_809)
    {
        float _1793 = -_1771;
        float _1795 = _1793 + 1.0;
        _1765 = _1795;
    }
    float _1797 = _1765;
    bool _1799 = uint(_1689) >= 2u;
    float _1801 = _861 + _1789;
    float _1803 = _839 + _1779;
    bool _1805 = !_1691;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = _959 * _1597;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1813 = _1801 + _1811;
    int _1815 = _1799 ? 0 : 1;
    int _1817 = abs(_1787);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1821 = _1803 + _1819;
    float _1823 = _1813 * _1813;
    int _1825 = ~_1815;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = fma(_1615, _1747, _1809);
    int _1833 = _1829;
    if (_1791)
    {
        int _1835 = ~_1815;
        int _1837 = _1835 + 1;
        _1833 = _1837;
    }
    int _1839 = _1833;
    int _1841 = abs(_1807);
    float _1843 = fma(_1821, _1821, _1823);
    bool _1845 = uint(_1751) >= uint(_550);
    float _1847 = fma(_1639, _1021, _1831);
    int _1849 = ~_1817;
    int _1851 = _1849 + 1;
    int _1853 = _1851 + 1;
    float _1855 = sqrt(_1843);
    bool _1857 = !_1845;
    int _1859 = _1857 ? 0 : (-1);
    float _1861 = _823 + _1847;
    bool _1863 = _1689 != 3;
    int _1865 = _1853 * as_type<int>(_1707);
    int _1867 = ~_1841;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = abs(_1839);
    int _1875 = ~_1723;
    int _1877 = _1875 + _1859;
    int _1879 = _1877 + 1;
    int _1881 = _1871 * as_type<int>(_1699);
    int _1883 = _1881 + _1865;
    bool _1885 = !_1863;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _550 * _1879;
    int _1891 = _1889 + _1167;
    bool _1893 = !_751;
    int _1895 = _1893 ? 0 : 1;
    int _1897 = abs(_1887);
    int _1899 = ~_1873;
    int _1901 = _1899 + 1;
    int _1903 = _1901 + 1;
    bool _1905 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1907 = abs(_1895);
    int _1909 = _1903 * as_type<int>(_1733);
    int _1911 = _1909 + _1883;
    int _1913 = ~_1897;
    int _1915 = _1913 + 1;
    int _1917 = _1915 + 1;
    bool _1919 = _1713 > 0.0;
    bool _1921 = isnan(_1713);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    int _1929 = _1917 * as_type<int>(_1741);
    int _1931 = _1929 + _1911;
    int _1933 = ~_1907;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    float _1939 = _1713 * _1797;
    bool _1941 = _1797 <= 0.0;
    bool _1943 = !_1927;
    bool _1945 = _1941 || _1943;
    float _1947 = _1733;
    float _1949 = as_type<float>(_1931);
    float _1951 = as_type<float>(_1937);
    if (!_1905)
    {
        _1947 = _1801;
    }
    float _1953 = _1947;
    int _1955 = _1931 * _1937;
    float _1957 = _1953;
    if (!_1905)
    {
        _1949 = _1803;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    if (!_1905)
    {
        _1951 = _1861;
    }
    float _1963 = _1951;
    bool _1965 = !_1905;
    float _1967 = _1963;
    if (!_1965)
    {
        float _1969 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1973 = _1855 + _1971;
        float _1975 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = rsqrt(_1843);
        float _1979 = _1973 * _1969;
        float _1981 = _1979 * 0.15915493667125701904296875;
        float _1983 = _1981 * 6.283185482025146484375;
        float _1985 = cos(_1983);
        float _1987 = _1981 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1985 + (-1.0);
        float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1995 = fma(_1989, _1975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1997 = fma(_1861, _1985, _1993);
        float _1999 = _1977 * _1995;
        float _2001 = fma(_1821, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2003 = fma(_1813, _1999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1961 = _2001;
        _1967 = _1997;
        _1957 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _1967;
    float _2009 = _1957;
    bool _2011 = !_1125;
    int _2013 = _2011 ? _1891 : (-1);
    float _2015 = _2007;
    float _2017 = _2005;
    float _2019 = _2009;
    if (!_785)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2023 = _823 + _2021;
        float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2027 = _839 + _2025;
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2031 = _2023 * _2023;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2035 = _861 + _2033;
        float _2037 = fma(_2027, _2027, _2031);
        float _2039 = -_839;
        float _2041 = _2039 + _2005;
        float _2043 = fma(_2035, _2035, _2037);
        float _2045 = sqrt(_2043);
        float _2047 = precise::min(_2045, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2049 = _2047 * _2029;
        float _2051 = -_823;
        float _2053 = _2051 + _2007;
        float _2055 = -_861;
        float _2057 = _2055 + _2009;
        float _2059 = fma(_2041, _2049, _839);
        float _2061 = fma(_2053, _2049, _823);
        float _2063 = fma(_2057, _2049, _861);
        _2015 = _2061;
        _2017 = _2059;
        _2019 = _2063;
    }
    float _2065 = _2015;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2073 = _2013 * _1907;
    int _2075 = _2073 + _1955;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2081 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2071);
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2085 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2077);
    float _2087 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2079);
    float _2089 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2091 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2083);
    float _2093 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2085);
    float _2095 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2087);
    float _2097 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2099 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2091);
    float _2101 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2105 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2109 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2111 = _2097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2109);
    float _2119 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2111);
    float _2121 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2125 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2115);
    float _2127 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2129 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2131 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2123);
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2125);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2129);
    float _2139 = _1939 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2141 = float(_2075);
    out.m_57.x = _2067;
    out.m_57.y = _2065;
    out.m_57.z = _2069;
    float _2143 = _2133 + _2137;
    float _2145 = _2135 + _2137;
    float _2147 = _2137 * 0.5;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2151 = _2143 * 0.5;
    float _2153 = _2145 * 0.5;
    float _2155 = fma(_2131, -0.5, _2147);
    out.m_33.x = _2149;
    out.m_59.x = _2141;
    out.gl_Position.x = _2133;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _2137;
    out.m_61.x = _2151;
    out.m_61.y = _2155;
    out.m_61.z = _2153;
    out.m_61.w = _2137;
    if (!_1945)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2157;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

