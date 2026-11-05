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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_54 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1700 = false;
    bool _169 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1871 = as_type<float>(_89);
        out.gl_Position.z = _1871;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _109 = _113;
    }
    float _115 = _109;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    if (_121)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _83;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_127);
        out.gl_Position.z = _1940;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    bool _131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _133 = as_type<int>(_129) & 1;
    bool _135 = _133 != 0;
    int _137 = as_type<int>(_129) & 2;
    bool _139 = _137 != 0;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_131;
    float _167;
    if (!_149)
    {
        float _151 = in.m_42.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_73);
        float _173 = 1.0 / _171;
        float _175 = _107 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _181 = int(_179);
    float _183 = in.m_42.x;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _187 = _185 != 0;
    float _189 = in.m_42.y;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_187)
    {
        _195 = 1.0;
    }
    float _197 = _195;
    float _199 = float(_181);
    float _201 = _197;
    if (!_187)
    {
        _201 = 7.345489978790283203125;
    }
    float _203 = _201;
    float _205 = 1.0 / _199;
    float _207 = float(uint(_193));
    float _209 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _211 = ~_193;
    int _213 = _211 + 1;
    float _215 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _217 = 1.0 / _207;
    float _219 = _205 * _107;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = trunc(_219);
    int _227 = int(_225);
    int _229 = as_type<int>(_217) + (-2);
    float _231 = float(uint(_227));
    float _233 = as_type<float>(_229) * _231;
    float _235 = trunc(_233);
    float _237 = precise::max(_235, 0.0);
    uint _240 = uint(_237);
    int _242 = _223 * int(_240);
    int _244 = _242 + _227;
    float _246 = float(uint(_244));
    float _248 = as_type<float>(_229) * _246;
    float _250 = _183 * _203;
    float _252 = trunc(_248);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    float _258 = floor(_250);
    int _260 = int(_240) + int(_256);
    float _262 = float(_193);
    float _264 = float(_227);
    bool _266 = _264 >= _262;
    bool _268 = isnan(_264);
    bool _270 = _266 || _268;
    bool _272 = isnan(_262);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    int _278 = _213 * _260;
    int _280 = _278 + _227;
    float _282 = float(_73);
    float _284 = trunc(_276);
    int _286 = int(_284);
    bool _288 = uint(_280) >= uint(_193);
    float _290 = -_258;
    float _292 = _250 + _290;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _296 = !_288;
    int _298 = _296 ? 0 : (-1);
    float _300 = 1.0 / _282;
    bool _302 = _193 == 0;
    float _304 = _262 * _107;
    int _306 = ~_260;
    int _308 = _306 + _298;
    int _310 = _308 + 1;
    float _312 = -_294;
    float _314 = fma(_209, 2.0, _312);
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _326 = _324 != 0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = _193 * _310;
    int _334 = _332 + _227;
    int _336 = ~_286;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _344 = _342 != 0;
    float _346 = 1.0 / _330;
    bool _348 = !_302;
    int _350 = _348 ? _334 : (-1);
    float _352 = _304 * _300;
    float _354 = _292 * _262;
    bool _356 = !_322;
    int _358 = _356 ? 0 : 1;
    int _360 = _350 * _340;
    int _362 = _193 + (-1);
    float _364 = trunc(_352);
    int _366 = int(_364);
    int _368 = abs(_358);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _183 * 2.0;
    int _374 = _286 * _362;
    int _376 = _374 + _360;
    bool _378 = !_344;
    int _380 = _378 ? 0 : 1;
    float _382 = fma(_215, -2.0, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = trunc(_354);
    int _390 = int(_388);
    bool _392 = !_318;
    int _394 = _392 ? 0 : 1;
    float _396 = in.m_42.z;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _376 * _368;
    int _404 = abs(_394);
    int _406 = abs(_380);
    float _408 = floor(_372);
    bool _410 = !_326;
    int _412 = _410 ? 0 : 1;
    int _414 = _366 * _404;
    int _416 = _414 + _402;
    bool _418 = !_400;
    int _420 = _418 ? 0 : 1;
    int _422 = abs(_412);
    int _424 = abs(_420);
    int _426 = _390 * _406;
    int _428 = _426 + _227;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _177 + _430;
    float _434 = _189 * 2.0;
    float _436 = 1.0 / _386;
    int _438 = _428 * _422;
    int _440 = _438 + _416;
    float _442 = _432 * _346;
    int _444 = _390 * _424;
    int _446 = _444 + _440;
    bool _448 = _408 > 0.0;
    float _450 = _183 + _396;
    bool _452 = _408 >= 0.0;
    bool _454 = isnan(_408);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = floor(_434);
    float _464 = float(uint(_446));
    float _466 = _450 + (-1.0);
    float _468 = _396 * 2.0;
    float _470 = _183 + _189;
    float _472 = as_type<float>(_229) * _464;
    float _474 = _189 + _396;
    float _476 = _470 + (-1.0);
    float _478 = floor(_468);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _482 = _177 + _480;
    float _484 = _474 + (-1.0);
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _488 = _460 ? 0 : 1;
    float _490 = _482 * _436;
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _494 = _462 > 0.0;
    float _496 = trunc(_472);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _396 + (-0.5);
    int _514 = ~_488;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    int _532 = _518;
    if (!_448)
    {
        int _534 = ~_488;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = ~_193;
    int _546 = _544 + 1;
    int _548 = _510 ? 0 : 1;
    bool _550 = _478 > 0.0;
    bool _552 = _478 >= 0.0;
    bool _554 = isnan(_478);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    int _562 = _546 * int(_500);
    int _564 = _562 + _446;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _566;
    bool _570 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _572 = isnan(_177);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _584 = float(uint(_564));
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _592 = isnan(_177);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = as_type<float>(_229) * _584;
    float _610 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = _542 * _107;
    bool _614 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_177);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = trunc(_608);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = _600 * _606;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = _624 * _634;
    float _648 = fma(_640, _490, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = exp2(_612);
    float _652 = _610 * _646;
    float _654 = fma(_644, _490, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = _582 * _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    int _662 = int(_500) + int(_630);
    int _664 = ~_193;
    int _666 = _664 + 1;
    float _668 = 1.0 / _660;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _672 = ~_548;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _676;
    if (!_494)
    {
        int _680 = ~_548;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    int _690 = _666 * _662;
    int _692 = _690 + _446;
    int _694 = _560 ? 0 : 1;
    float _696 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    bool _698 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = -_624;
    float _710 = _708 + 1.0;
    bool _712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(1.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _724 = _706 ? _688 : 0.0;
    float _726 = -_107;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _314);
    bool _730 = uint(_692) >= uint(_193);
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    bool _734 = !_522;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _722);
    float _740 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _696);
    float _742 = fma(_648, _636, _732);
    int _744 = abs(_736);
    float _746 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _382);
    float _748 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _738);
    if (_720)
    {
        float _750 = _724 * _668;
        _111 = _750;
    }
    float _752 = _111;
    float _754 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    bool _756 = !_730;
    int _758 = _756 ? 0 : (-1);
    float _760 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].x, _742);
    int _762 = ~_694;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_654, _636, _754);
    int _770 = _766;
    if (!_550)
    {
        int _772 = ~_694;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    int _784 = ~_662;
    int _786 = _784 + _758;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_776);
    int _794 = _193 * _788;
    int _796 = _794 + _446;
    float _798 = float(uint(_428));
    float _800 = in.m_46.x;
    float _802 = in.m_46.y;
    float _804 = in.m_46.z;
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _792;
    bool _812 = !_530;
    int _814 = _812 ? 0 : 1;
    float _816 = as_type<float>(_229) * _798;
    int _818 = abs(_808);
    int _820 = abs(_814);
    bool _822 = !_302;
    int _824 = _822 ? _796 : (-1);
    float _826 = trunc(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = _824 >> 31;
    float _834 = _782 * _780;
    float _836 = float(_538);
    float _838 = float(_818);
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = float(_684);
    int _844 = _832 & 3;
    float _846 = _838 * _836;
    int _848 = ~_193;
    int _850 = _848 + 1;
    float _852 = float(_820);
    float _854 = _810 * (-2.0);
    int _856 = _824 + _844;
    float _858 = _852 * _842;
    float _860 = _760 * _778;
    int _862 = _856 >> 2;
    float _864 = fma(_486, _854, _486);
    int _866 = _850 * int(_830);
    int _868 = _866 + _428;
    float _870 = fma(_854, _800, _800);
    int _872 = _862 << 4;
    int _874 = _872 + 368;
    float _876 = _846 * (-2.0);
    float _878 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _880 = int(_878);
    float _882 = float(uint(_868));
    float _884 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    uint _886 = uint(int(uint(_874) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[int(_896)][_898];
    float _902 = fma(_492, _876, _492);
    float _904 = fma(_876, _802, _802);
    float _906 = _183 + (-0.5);
    float _908 = _189 + (-0.5);
    float _910 = _858 * (-2.0);
    float _912 = as_type<float>(_229) * _882;
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _916 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[196].y, _904);
    float _918 = fma(_602, _910, _602);
    int _920 = _874 + 8;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[int(_932)][_934];
    float _938 = trunc(_912);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = fma(_910, _804, _804);
    int _946 = _824 & 3;
    bool _948 = _946 != 0;
    float _950 = fma(_864, _752, _914);
    int _952 = _824 & 3;
    bool _954 = _952 != 0;
    float _956 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _944);
    bool _958 = uint(_946) > 1u;
    float _960 = fma(_902, _752, _916);
    int _962 = _954 ? 0 : 1;
    float _964 = _950 * 0.15915493667125701904296875;
    bool _966 = _946 != 3;
    float _968 = fma(_918, _752, _956);
    int _970 = ~_193;
    int _972 = _970 + 1;
    float _974 = _960 * 0.15915493667125701904296875;
    int _976 = abs(_880);
    float _978 = _968 * 0.15915493667125701904296875;
    int _980 = int(_830) + int(_942);
    float _982 = _964 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = ~_962;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_880);
    if (!_958)
    {
        int _996 = ~_962;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    int _1002 = _972 * _980;
    int _1004 = _1002 + _428;
    bool _1006 = uint(_946) >= 2u;
    int _1008 = abs(_1000);
    int _1010 = _1006 ? 0 : 1;
    bool _1012 = _946 != 3;
    bool _1014 = !_948;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = float(uint(_976));
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_966)
    {
        int _1028 = ~_1010;
        int _1030 = _1028 + 1;
        _1026 = _1030;
    }
    int _1032 = _1026;
    float _1034 = 1.0 / _1018;
    int _1036 = ~_1008;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    int _1042 = abs(_1016);
    bool _1044 = uint(_1004) >= uint(_193);
    int _1046 = _1040 * as_type<int>(_900);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1050 = _1048 != 0;
    float _1052 = _964 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    int _1056 = abs(_1032);
    bool _1058 = !_1012;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = ~_1042;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1044;
    int _1070 = _1068 ? 0 : (-1);
    bool _1072 = !_1050;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = _1066 * as_type<int>(_892);
    int _1078 = _1076 + _1046;
    int _1080 = abs(_1060);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _147);
    int _1084 = ~_1056;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _974 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    int _1094 = ~_980;
    int _1096 = _1094 + _1070;
    int _1098 = _1096 + 1;
    float _1100 = _840 * _1082;
    int _1102 = abs(_1074);
    int _1104 = _1088 * as_type<int>(_928);
    int _1106 = _1104 + _1078;
    int _1108 = ~_1080;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    int _1114 = _193 * _1098;
    int _1116 = _1114 + _428;
    float _1118 = float(uint(_880));
    float _1120 = _974 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    int _1124 = _1112 * as_type<int>(_936);
    int _1126 = _1124 + _1106;
    bool _1128 = !_302;
    int _1130 = _1128 ? _1116 : (-1);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    int _1134 = ~_1102;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = as_type<int>(_1034) + (-2);
    float _1142 = 1.0 / _1118;
    float _1144 = _884 * _1132;
    int _1146 = _1126 * _1138;
    float _1148 = _984 * _1092;
    bool _1150 = _183 > 0.5;
    int _1152 = _1130 * _1102;
    int _1154 = _1152 + _1146;
    float _1156 = _1054 * _1092;
    float _1158 = _978 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _984 * _1122;
    float _1164 = _1054 * _1122;
    int _1166 = abs(_1154);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1174 = _1172 != 0;
    float _1176 = _978 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = as_type<int>(_1142) + (-2);
    float _1182 = float(uint(_1154));
    bool _1184 = _189 > 0.5;
    float _1186 = as_type<float>(_1180) * _1182;
    float _1188 = float(uint(_1166));
    float _1190 = _1092 * _1160;
    float _1192 = _1160 * _1100;
    float _1194 = _1122 * _1160;
    float _1196 = as_type<float>(_1140) * _1188;
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = -_1156;
    float _1206 = fma(_1178, _1162, _1204);
    float _1208 = -_1162;
    float _1210 = fma(_1178, _1156, _1208);
    int _1212 = ~_880;
    int _1214 = _1212 + 1;
    float _1216 = in.m_32.x;
    float _1218 = in.m_32.y;
    float _1220 = in.m_32.z;
    float _1222 = _1178 * _1100;
    float _1224 = fma(_1178, _1164, _1148);
    float _1226 = fma(_1178, _1148, _1164);
    float _1228 = trunc(_1196);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    float _1234 = _1054 * _1192;
    float _1236 = -_1222;
    float _1238 = fma(_1194, _1144, _1236);
    int _1240 = ~_976;
    int _1242 = _1240 + 1;
    float _1244 = _984 * _1192;
    float _1246 = fma(_1224, _1144, _1234);
    float _1248 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1250 = _1214 * int(_1202);
    int _1252 = _1250 + _1154;
    float _1254 = fma(_1206, _1144, _1244);
    float _1256 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1258 = fma(_1190, _1248, _1238);
    float _1260 = fma(_1210, _1248, _1246);
    float _1262 = float(uint(_1252));
    float _1264 = fma(_1226, _1248, _1254);
    float _1266 = _1256 * _183;
    int _1268 = _1242 * int(_1232);
    int _1270 = _1268 + _1166;
    float _1272 = as_type<float>(_1180) * _1262;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1276 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1278 = float(uint(_1270));
    float _1280 = trunc(_1266);
    int _1282 = int(_1280);
    float _1284 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1286 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1276);
    float _1288 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1274);
    float _1290 = as_type<float>(_1140) * _1278;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1284);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1286);
    float _1298 = trunc(_1272);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1306 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1294);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1310 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1304);
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1318 = trunc(_1290);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1326 = _1282 << 4;
    int _1328 = _1326 + 1712;
    float _1330 = _1314 + _1316;
    float _1332 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = _1310 + _1324;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1338 = _1328 + 8;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
    int _1344 = int(_1340) & 3;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[int(_1342)][_1344];
    int _1348 = int(_1202) + int(_1302);
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1334 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1330 + _1354;
    int _1358 = ~_880;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1364 = _1352 * _1352;
    float _1366 = _1356 * _1356;
    uint _1368 = uint(int(uint(_1328) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    int _1384 = int(_1232) + int(_1322);
    int _1386 = _1360 * _1348;
    int _1388 = _1386 + _1154;
    float _1390 = _1364 + _1366;
    int _1392 = ~_976;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1336);
    float _1398 = -_143;
    int _1400 = _1150 ? as_type<int>(_1398) : as_type<int>(_143);
    float _1402 = sqrt(_1390);
    float _1404 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    int _1406 = _1394 * _1384;
    int _1408 = _1406 + _1166;
    bool _1410 = !_1170;
    float _1412 = _1410 ? _143 : as_type<float>(_1400);
    float _1414 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    int _1416 = _1154 ^ _880;
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1420 = uint(_1408) >= uint(_976);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1424 = uint(_1388) >= uint(_880);
    bool _1426 = !_1420;
    int _1428 = _1426 ? 0 : (-1);
    uint _1430 = uint(int(uint(_1416) >> uint(31)));
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1434 = ~_1428;
    int _1436 = _1384 + _1434;
    int _1438 = _1436 + 1;
    bool _1440 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1444 = !_1424;
    int _1446 = _1444 ? 0 : (-1);
    float _1448 = _1418 + _1432;
    int _1450 = ~int(_1430);
    int _1452 = _1450 + 1;
    int _1454 = ~_1348;
    int _1456 = _1454 + _1446;
    int _1458 = _1456 + 1;
    int _1460 = _1438 ^ _1452;
    bool _1462 = _880 == 0;
    int _1464 = _880 * _1458;
    int _1466 = _1464 + _1154;
    bool _1468 = _880 == 0;
    float _1470 = _1432;
    float _1472 = as_type<float>(_1458);
    float _1474 = _1364;
    float _1476 = _1334;
    if (!_1440)
    {
        _1470 = _1364;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (!_1440)
    {
        _1472 = _1334;
    }
    float _1482 = _1472;
    int _1484 = ~_1452;
    int _1486 = _1484 + _1460;
    int _1488 = _1486 + 1;
    float _1490 = _1482;
    if (!_1440)
    {
        _994 = _1366;
    }
    float _1492 = _994;
    float _1494 = _1492;
    if (!_1440)
    {
        _1474 = _1330;
    }
    float _1496 = _1474;
    float _1498 = _1496;
    if (!_1440)
    {
        _1476 = _1448;
    }
    float _1500 = _1476;
    bool _1502 = !_1440;
    float _1504 = _1500;
    if (!_1502)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1510 = _1402 + _1508;
        float _1512 = rsqrt(_1390);
        float _1514 = _1510 * _1506;
        float _1516 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = _1514 * 0.15915493667125701904296875;
        float _1520 = _1518 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = fma(_1522, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = _1512 * _1528;
        float _1532 = _1526 + (-1.0);
        float _1534 = fma(_1352, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1356, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1542 = _1534 + _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1536 + _1544;
        float _1548 = fma(_1448, _1526, _1538);
        float _1550 = _1542 * _1542;
        float _1552 = _1546 * _1546;
        _1504 = _1548;
        _1480 = _1550;
        _1494 = _1552;
        _1490 = _1534;
        _1498 = _1536;
    }
    float _1554 = _1504;
    float _1556 = _1480;
    float _1558 = _1494;
    float _1560 = _1490;
    float _1562 = _1498;
    bool _1564 = !_1462;
    int _1566 = _1564 ? _1466 : (-1);
    float _1568 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1570 = !_1468;
    int _1572 = _1570 ? _1488 : (-1);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1576 = _1554 + _1574;
    float _1578 = -_147;
    int _1580 = _1184 ? as_type<int>(_1578) : as_type<int>(_147);
    float _1582 = -_740;
    float _1584 = _1582 + 1.0;
    float _1586 = float(_1566);
    float _1588 = fma(_1576, _1576, _1556);
    float _1590 = float(_1572);
    float _1592 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1594 = !_1174;
    float _1596 = _1594 ? _147 : as_type<float>(_1580);
    float _1598 = fma(_1568, _1586, _728);
    float _1600 = _1412 + 0.5;
    float _1602 = -_746;
    float _1604 = fma(_1592, _1590, _1602);
    float _1606 = _1588 + _1558;
    float _1608 = _1596 + (-0.5);
    float _1610 = fma(_1568, _1600, _1598);
    float _1612 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1614 = -_1592;
    float _1616 = fma(_1614, _1608, _1604);
    float _1618 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = -_1584;
    float _1622 = fma(_1412, _1620, _1610);
    float _1624 = sqrt(_1606);
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1632 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1634 = -_748;
    float _1636 = _1634 + 1.0;
    float _1638 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = fma(_1596, _1636, _1616);
    out.m_48.x = _1642;
    out.m_48.y = _1644;
    out.m_48.z = _1646;
    bool _1654 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1656 = isnan(_1624);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1662 = _1658 || _1660;
    out.m_50.x = _1648;
    out.m_50.y = _1638;
    out.m_50.z = _1650;
    out.m_50.w = _1640;
    out.m_52.x = _1622;
    out.m_52.y = _1652;
    float _1664 = _1632;
    if (!_1662)
    {
        _1664 = 1.0;
    }
    float _1666 = _1664;
    bool _1668 = !_1662;
    float _1670 = _1666;
    if (!_1668)
    {
        bool _1672 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1674 = isnan(_1624);
        bool _1676 = _1672 || _1674;
        bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1680 = _1676 || _1678;
        if (!_1680)
        {
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = _1624 + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1692 = _1690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1694 = 1.0 / _1688;
            float _1696 = _1684 * _1694;
            float _1698 = fma(_1696, _1692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1670 = _1698;
            _1700 = true;
        }
        else
        {
            bool _1702 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1704 = isnan(_1624);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1710 = _1706 || _1708;
            if (!_1710)
            {
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1624 + _1712;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1724 = 1.0 / _1718;
                float _1726 = _1714 * _1724;
                float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1670 = _1728;
                _1700 = true;
            }
            else
            {
                _1670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1700 = false;
    float _1730 = _1670;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1734 = _1554 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1560 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1562 + _1740;
    out.m_35.x = 1.0;
    float _1744 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1746 = fma(_1738, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1748 = fma(_1742, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1756);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1760);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1790 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1782);
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1786);
    float _1796 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1788);
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1800 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1804 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1796);
    float _1806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1808 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1810 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1814 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1804);
    out.m_54.w = _1806;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1812;
    out.gl_Position.w = _1814;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1700 = false;
    bool _169 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1871 = as_type<float>(_89);
        out.gl_Position.z = _1871;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _109 = _113;
    }
    float _115 = _109;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    if (_121)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _83;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_127);
        out.gl_Position.z = _1940;
    }
    if (_121)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    bool _131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _133 = as_type<int>(_129) & 1;
    bool _135 = _133 != 0;
    int _137 = as_type<int>(_129) & 2;
    bool _139 = _137 != 0;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_131;
    float _167;
    if (!_149)
    {
        float _151 = in.m_42.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_73);
        float _173 = 1.0 / _171;
        float _175 = _107 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _181 = int(_179);
    float _183 = in.m_42.x;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _187 = _185 != 0;
    float _189 = in.m_42.y;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_187)
    {
        _195 = 1.0;
    }
    float _197 = _195;
    float _199 = float(_181);
    float _201 = _197;
    if (!_187)
    {
        _201 = 7.345489978790283203125;
    }
    float _203 = _201;
    float _205 = 1.0 / _199;
    float _207 = float(uint(_193));
    float _209 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _211 = ~_193;
    int _213 = _211 + 1;
    float _215 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _217 = 1.0 / _207;
    float _219 = _205 * _107;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = trunc(_219);
    int _227 = int(_225);
    int _229 = as_type<int>(_217) + (-2);
    float _231 = float(uint(_227));
    float _233 = as_type<float>(_229) * _231;
    float _235 = trunc(_233);
    float _237 = precise::max(_235, 0.0);
    uint _240 = uint(_237);
    int _242 = _223 * int(_240);
    int _244 = _242 + _227;
    float _246 = float(uint(_244));
    float _248 = as_type<float>(_229) * _246;
    float _250 = _183 * _203;
    float _252 = trunc(_248);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    float _258 = floor(_250);
    int _260 = int(_240) + int(_256);
    float _262 = float(_193);
    float _264 = float(_227);
    bool _266 = _264 >= _262;
    bool _268 = isnan(_264);
    bool _270 = _266 || _268;
    bool _272 = isnan(_262);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    int _278 = _213 * _260;
    int _280 = _278 + _227;
    float _282 = float(_73);
    float _284 = trunc(_276);
    int _286 = int(_284);
    bool _288 = uint(_280) >= uint(_193);
    float _290 = -_258;
    float _292 = _250 + _290;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _296 = !_288;
    int _298 = _296 ? 0 : (-1);
    float _300 = 1.0 / _282;
    bool _302 = _193 == 0;
    float _304 = _262 * _107;
    int _306 = ~_260;
    int _308 = _306 + _298;
    int _310 = _308 + 1;
    float _312 = -_294;
    float _314 = fma(_209, 2.0, _312);
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _326 = _324 != 0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = _193 * _310;
    int _334 = _332 + _227;
    int _336 = ~_286;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _344 = _342 != 0;
    float _346 = 1.0 / _330;
    bool _348 = !_302;
    int _350 = _348 ? _334 : (-1);
    float _352 = _304 * _300;
    float _354 = _292 * _262;
    bool _356 = !_322;
    int _358 = _356 ? 0 : 1;
    int _360 = _350 * _340;
    int _362 = _193 + (-1);
    float _364 = trunc(_352);
    int _366 = int(_364);
    int _368 = abs(_358);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _183 * 2.0;
    int _374 = _286 * _362;
    int _376 = _374 + _360;
    bool _378 = !_344;
    int _380 = _378 ? 0 : 1;
    float _382 = fma(_215, -2.0, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = trunc(_354);
    int _390 = int(_388);
    bool _392 = !_318;
    int _394 = _392 ? 0 : 1;
    float _396 = in.m_42.z;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _376 * _368;
    int _404 = abs(_394);
    int _406 = abs(_380);
    float _408 = floor(_372);
    bool _410 = !_326;
    int _412 = _410 ? 0 : 1;
    int _414 = _366 * _404;
    int _416 = _414 + _402;
    bool _418 = !_400;
    int _420 = _418 ? 0 : 1;
    int _422 = abs(_412);
    int _424 = abs(_420);
    int _426 = _390 * _406;
    int _428 = _426 + _227;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _177 + _430;
    float _434 = _189 * 2.0;
    float _436 = 1.0 / _386;
    int _438 = _428 * _422;
    int _440 = _438 + _416;
    float _442 = _432 * _346;
    int _444 = _390 * _424;
    int _446 = _444 + _440;
    bool _448 = _408 > 0.0;
    float _450 = _183 + _396;
    bool _452 = _408 >= 0.0;
    bool _454 = isnan(_408);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = floor(_434);
    float _464 = float(uint(_446));
    float _466 = _450 + (-1.0);
    float _468 = _396 * 2.0;
    float _470 = _183 + _189;
    float _472 = as_type<float>(_229) * _464;
    float _474 = _189 + _396;
    float _476 = _470 + (-1.0);
    float _478 = floor(_468);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _482 = _177 + _480;
    float _484 = _474 + (-1.0);
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _488 = _460 ? 0 : 1;
    float _490 = _482 * _436;
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _494 = _462 > 0.0;
    float _496 = trunc(_472);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _396 + (-0.5);
    int _514 = ~_488;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    int _532 = _518;
    if (!_448)
    {
        int _534 = ~_488;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = ~_193;
    int _546 = _544 + 1;
    int _548 = _510 ? 0 : 1;
    bool _550 = _478 > 0.0;
    bool _552 = _478 >= 0.0;
    bool _554 = isnan(_478);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    int _562 = _546 * int(_500);
    int _564 = _562 + _446;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _566;
    bool _570 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _572 = isnan(_177);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _584 = float(uint(_564));
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _592 = isnan(_177);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = as_type<float>(_229) * _584;
    float _610 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = _542 * _107;
    bool _614 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_177);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = trunc(_608);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = _600 * _606;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = _624 * _634;
    float _648 = fma(_640, _490, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = exp2(_612);
    float _652 = _610 * _646;
    float _654 = fma(_644, _490, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = _582 * _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    int _662 = int(_500) + int(_630);
    int _664 = ~_193;
    int _666 = _664 + 1;
    float _668 = 1.0 / _660;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _672 = ~_548;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _676;
    if (!_494)
    {
        int _680 = ~_548;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    int _690 = _666 * _662;
    int _692 = _690 + _446;
    int _694 = _560 ? 0 : 1;
    float _696 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    bool _698 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = -_624;
    float _710 = _708 + 1.0;
    bool _712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(1.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _724 = _706 ? _688 : 0.0;
    float _726 = -_107;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _314);
    bool _730 = uint(_692) >= uint(_193);
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    bool _734 = !_522;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _722);
    float _740 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _696);
    float _742 = fma(_648, _636, _732);
    int _744 = abs(_736);
    float _746 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _382);
    float _748 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _738);
    if (_720)
    {
        float _750 = _724 * _668;
        _111 = _750;
    }
    float _752 = _111;
    float _754 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    bool _756 = !_730;
    int _758 = _756 ? 0 : (-1);
    float _760 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].x, _742);
    int _762 = ~_694;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_654, _636, _754);
    int _770 = _766;
    if (!_550)
    {
        int _772 = ~_694;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    int _784 = ~_662;
    int _786 = _784 + _758;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_776);
    int _794 = _193 * _788;
    int _796 = _794 + _446;
    float _798 = float(uint(_428));
    float _800 = in.m_46.x;
    float _802 = in.m_46.y;
    float _804 = in.m_46.z;
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _792;
    bool _812 = !_530;
    int _814 = _812 ? 0 : 1;
    float _816 = as_type<float>(_229) * _798;
    int _818 = abs(_808);
    int _820 = abs(_814);
    bool _822 = !_302;
    int _824 = _822 ? _796 : (-1);
    float _826 = trunc(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = _824 >> 31;
    float _834 = _782 * _780;
    float _836 = float(_538);
    float _838 = float(_818);
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = float(_684);
    int _844 = _832 & 3;
    float _846 = _838 * _836;
    int _848 = ~_193;
    int _850 = _848 + 1;
    float _852 = float(_820);
    float _854 = _810 * (-2.0);
    int _856 = _824 + _844;
    float _858 = _852 * _842;
    float _860 = _760 * _778;
    int _862 = _856 >> 2;
    float _864 = fma(_486, _854, _486);
    int _866 = _850 * int(_830);
    int _868 = _866 + _428;
    float _870 = fma(_854, _800, _800);
    int _872 = _862 << 4;
    int _874 = _872 + 368;
    float _876 = _846 * (-2.0);
    float _878 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _880 = int(_878);
    float _882 = float(uint(_868));
    float _884 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    uint _886 = uint(int(uint(_874) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[int(_896)][_898];
    float _902 = fma(_492, _876, _492);
    float _904 = fma(_876, _802, _802);
    float _906 = _183 + (-0.5);
    float _908 = _189 + (-0.5);
    float _910 = _858 * (-2.0);
    float _912 = as_type<float>(_229) * _882;
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _916 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[196].y, _904);
    float _918 = fma(_602, _910, _602);
    int _920 = _874 + 8;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[int(_932)][_934];
    float _938 = trunc(_912);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = fma(_910, _804, _804);
    int _946 = _824 & 3;
    bool _948 = _946 != 0;
    float _950 = fma(_864, _752, _914);
    int _952 = _824 & 3;
    bool _954 = _952 != 0;
    float _956 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _944);
    bool _958 = uint(_946) > 1u;
    float _960 = fma(_902, _752, _916);
    int _962 = _954 ? 0 : 1;
    float _964 = _950 * 0.15915493667125701904296875;
    bool _966 = _946 != 3;
    float _968 = fma(_918, _752, _956);
    int _970 = ~_193;
    int _972 = _970 + 1;
    float _974 = _960 * 0.15915493667125701904296875;
    int _976 = abs(_880);
    float _978 = _968 * 0.15915493667125701904296875;
    int _980 = int(_830) + int(_942);
    float _982 = _964 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = ~_962;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_880);
    if (!_958)
    {
        int _996 = ~_962;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    int _1002 = _972 * _980;
    int _1004 = _1002 + _428;
    bool _1006 = uint(_946) >= 2u;
    int _1008 = abs(_1000);
    int _1010 = _1006 ? 0 : 1;
    bool _1012 = _946 != 3;
    bool _1014 = !_948;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = float(uint(_976));
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_966)
    {
        int _1028 = ~_1010;
        int _1030 = _1028 + 1;
        _1026 = _1030;
    }
    int _1032 = _1026;
    float _1034 = 1.0 / _1018;
    int _1036 = ~_1008;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    int _1042 = abs(_1016);
    bool _1044 = uint(_1004) >= uint(_193);
    int _1046 = _1040 * as_type<int>(_900);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1050 = _1048 != 0;
    float _1052 = _964 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    int _1056 = abs(_1032);
    bool _1058 = !_1012;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = ~_1042;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1044;
    int _1070 = _1068 ? 0 : (-1);
    bool _1072 = !_1050;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = _1066 * as_type<int>(_892);
    int _1078 = _1076 + _1046;
    int _1080 = abs(_1060);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _147);
    int _1084 = ~_1056;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _974 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    int _1094 = ~_980;
    int _1096 = _1094 + _1070;
    int _1098 = _1096 + 1;
    float _1100 = _840 * _1082;
    int _1102 = abs(_1074);
    int _1104 = _1088 * as_type<int>(_928);
    int _1106 = _1104 + _1078;
    int _1108 = ~_1080;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    int _1114 = _193 * _1098;
    int _1116 = _1114 + _428;
    float _1118 = float(uint(_880));
    float _1120 = _974 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    int _1124 = _1112 * as_type<int>(_936);
    int _1126 = _1124 + _1106;
    bool _1128 = !_302;
    int _1130 = _1128 ? _1116 : (-1);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    int _1134 = ~_1102;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = as_type<int>(_1034) + (-2);
    float _1142 = 1.0 / _1118;
    float _1144 = _884 * _1132;
    int _1146 = _1126 * _1138;
    float _1148 = _984 * _1092;
    bool _1150 = _183 > 0.5;
    int _1152 = _1130 * _1102;
    int _1154 = _1152 + _1146;
    float _1156 = _1054 * _1092;
    float _1158 = _978 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _984 * _1122;
    float _1164 = _1054 * _1122;
    int _1166 = abs(_1154);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1174 = _1172 != 0;
    float _1176 = _978 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = as_type<int>(_1142) + (-2);
    float _1182 = float(uint(_1154));
    bool _1184 = _189 > 0.5;
    float _1186 = as_type<float>(_1180) * _1182;
    float _1188 = float(uint(_1166));
    float _1190 = _1092 * _1160;
    float _1192 = _1160 * _1100;
    float _1194 = _1122 * _1160;
    float _1196 = as_type<float>(_1140) * _1188;
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = -_1156;
    float _1206 = fma(_1178, _1162, _1204);
    float _1208 = -_1162;
    float _1210 = fma(_1178, _1156, _1208);
    int _1212 = ~_880;
    int _1214 = _1212 + 1;
    float _1216 = in.m_32.x;
    float _1218 = in.m_32.y;
    float _1220 = in.m_32.z;
    float _1222 = _1178 * _1100;
    float _1224 = fma(_1178, _1164, _1148);
    float _1226 = fma(_1178, _1148, _1164);
    float _1228 = trunc(_1196);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    float _1234 = _1054 * _1192;
    float _1236 = -_1222;
    float _1238 = fma(_1194, _1144, _1236);
    int _1240 = ~_976;
    int _1242 = _1240 + 1;
    float _1244 = _984 * _1192;
    float _1246 = fma(_1224, _1144, _1234);
    float _1248 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1250 = _1214 * int(_1202);
    int _1252 = _1250 + _1154;
    float _1254 = fma(_1206, _1144, _1244);
    float _1256 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1258 = fma(_1190, _1248, _1238);
    float _1260 = fma(_1210, _1248, _1246);
    float _1262 = float(uint(_1252));
    float _1264 = fma(_1226, _1248, _1254);
    float _1266 = _1256 * _183;
    int _1268 = _1242 * int(_1232);
    int _1270 = _1268 + _1166;
    float _1272 = as_type<float>(_1180) * _1262;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1276 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1278 = float(uint(_1270));
    float _1280 = trunc(_1266);
    int _1282 = int(_1280);
    float _1284 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1286 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1276);
    float _1288 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1274);
    float _1290 = as_type<float>(_1140) * _1278;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1284);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1286);
    float _1298 = trunc(_1272);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1306 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1294);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1310 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1304);
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1318 = trunc(_1290);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1326 = _1282 << 4;
    int _1328 = _1326 + 1712;
    float _1330 = _1314 + _1316;
    float _1332 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = _1310 + _1324;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1338 = _1328 + 8;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
    int _1344 = int(_1340) & 3;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[int(_1342)][_1344];
    int _1348 = int(_1202) + int(_1302);
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1334 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1330 + _1354;
    int _1358 = ~_880;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1364 = _1352 * _1352;
    float _1366 = _1356 * _1356;
    uint _1368 = uint(int(uint(_1328) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    int _1384 = int(_1232) + int(_1322);
    int _1386 = _1360 * _1348;
    int _1388 = _1386 + _1154;
    float _1390 = _1364 + _1366;
    int _1392 = ~_976;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1336);
    float _1398 = -_143;
    int _1400 = _1150 ? as_type<int>(_1398) : as_type<int>(_143);
    float _1402 = sqrt(_1390);
    float _1404 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    int _1406 = _1394 * _1384;
    int _1408 = _1406 + _1166;
    bool _1410 = !_1170;
    float _1412 = _1410 ? _143 : as_type<float>(_1400);
    float _1414 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    int _1416 = _1154 ^ _880;
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1420 = uint(_1408) >= uint(_976);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1424 = uint(_1388) >= uint(_880);
    bool _1426 = !_1420;
    int _1428 = _1426 ? 0 : (-1);
    uint _1430 = uint(int(uint(_1416) >> uint(31)));
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1434 = ~_1428;
    int _1436 = _1384 + _1434;
    int _1438 = _1436 + 1;
    bool _1440 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1444 = !_1424;
    int _1446 = _1444 ? 0 : (-1);
    float _1448 = _1418 + _1432;
    int _1450 = ~int(_1430);
    int _1452 = _1450 + 1;
    int _1454 = ~_1348;
    int _1456 = _1454 + _1446;
    int _1458 = _1456 + 1;
    int _1460 = _1438 ^ _1452;
    bool _1462 = _880 == 0;
    int _1464 = _880 * _1458;
    int _1466 = _1464 + _1154;
    bool _1468 = _880 == 0;
    float _1470 = _1432;
    float _1472 = as_type<float>(_1458);
    float _1474 = _1364;
    float _1476 = _1334;
    if (!_1440)
    {
        _1470 = _1364;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (!_1440)
    {
        _1472 = _1334;
    }
    float _1482 = _1472;
    int _1484 = ~_1452;
    int _1486 = _1484 + _1460;
    int _1488 = _1486 + 1;
    float _1490 = _1482;
    if (!_1440)
    {
        _994 = _1366;
    }
    float _1492 = _994;
    float _1494 = _1492;
    if (!_1440)
    {
        _1474 = _1330;
    }
    float _1496 = _1474;
    float _1498 = _1496;
    if (!_1440)
    {
        _1476 = _1448;
    }
    float _1500 = _1476;
    bool _1502 = !_1440;
    float _1504 = _1500;
    if (!_1502)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1510 = _1402 + _1508;
        float _1512 = rsqrt(_1390);
        float _1514 = _1510 * _1506;
        float _1516 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = _1514 * 0.15915493667125701904296875;
        float _1520 = _1518 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = fma(_1522, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = _1512 * _1528;
        float _1532 = _1526 + (-1.0);
        float _1534 = fma(_1352, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1356, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1542 = _1534 + _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1536 + _1544;
        float _1548 = fma(_1448, _1526, _1538);
        float _1550 = _1542 * _1542;
        float _1552 = _1546 * _1546;
        _1504 = _1548;
        _1480 = _1550;
        _1494 = _1552;
        _1490 = _1534;
        _1498 = _1536;
    }
    float _1554 = _1504;
    float _1556 = _1480;
    float _1558 = _1494;
    float _1560 = _1490;
    float _1562 = _1498;
    bool _1564 = !_1462;
    int _1566 = _1564 ? _1466 : (-1);
    float _1568 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1570 = !_1468;
    int _1572 = _1570 ? _1488 : (-1);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1576 = _1554 + _1574;
    float _1578 = -_147;
    int _1580 = _1184 ? as_type<int>(_1578) : as_type<int>(_147);
    float _1582 = -_740;
    float _1584 = _1582 + 1.0;
    float _1586 = float(_1566);
    float _1588 = fma(_1576, _1576, _1556);
    float _1590 = float(_1572);
    float _1592 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1594 = !_1174;
    float _1596 = _1594 ? _147 : as_type<float>(_1580);
    float _1598 = fma(_1568, _1586, _728);
    float _1600 = _1412 + 0.5;
    float _1602 = -_746;
    float _1604 = fma(_1592, _1590, _1602);
    float _1606 = _1588 + _1558;
    float _1608 = _1596 + (-0.5);
    float _1610 = fma(_1568, _1600, _1598);
    float _1612 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1614 = -_1592;
    float _1616 = fma(_1614, _1608, _1604);
    float _1618 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = -_1584;
    float _1622 = fma(_1412, _1620, _1610);
    float _1624 = sqrt(_1606);
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1632 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1634 = -_748;
    float _1636 = _1634 + 1.0;
    float _1638 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = fma(_1596, _1636, _1616);
    out.m_48.x = _1642;
    out.m_48.y = _1644;
    out.m_48.z = _1646;
    bool _1654 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1656 = isnan(_1624);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1662 = _1658 || _1660;
    out.m_50.x = _1648;
    out.m_50.y = _1638;
    out.m_50.z = _1650;
    out.m_50.w = _1640;
    out.m_52.x = _1622;
    out.m_52.y = _1652;
    float _1664 = _1632;
    if (!_1662)
    {
        _1664 = 1.0;
    }
    float _1666 = _1664;
    bool _1668 = !_1662;
    float _1670 = _1666;
    if (!_1668)
    {
        bool _1672 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1674 = isnan(_1624);
        bool _1676 = _1672 || _1674;
        bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1680 = _1676 || _1678;
        if (!_1680)
        {
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = _1624 + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1692 = _1690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1694 = 1.0 / _1688;
            float _1696 = _1684 * _1694;
            float _1698 = fma(_1696, _1692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1670 = _1698;
            _1700 = true;
        }
        else
        {
            bool _1702 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1704 = isnan(_1624);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1710 = _1706 || _1708;
            if (!_1710)
            {
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1624 + _1712;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1724 = 1.0 / _1718;
                float _1726 = _1714 * _1724;
                float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1670 = _1728;
                _1700 = true;
            }
            else
            {
                _1670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1700 = false;
    float _1730 = _1670;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1734 = _1554 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1560 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1562 + _1740;
    out.m_35.x = 1.0;
    float _1744 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1746 = fma(_1738, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1748 = fma(_1742, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1756);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1760);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1790 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1782);
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1786);
    float _1796 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1788);
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1800 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1804 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1796);
    float _1806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1808 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1810 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1814 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1804);
    out.m_54.w = _1806;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1812;
    out.gl_Position.w = _1814;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1700 = false;
    bool _169 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1871 = as_type<float>(_89);
        out.gl_Position.z = _1871;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = _107;
    if (_103)
    {
        float _113 = float(_73);
        _109 = _113;
    }
    float _115 = _109;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    if (_121)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _83;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_127);
        out.gl_Position.z = _1940;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    bool _131 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _133 = as_type<int>(_129) & 1;
    bool _135 = _133 != 0;
    int _137 = as_type<int>(_129) & 2;
    bool _139 = _137 != 0;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_131;
    float _167;
    if (!_149)
    {
        float _151 = in.m_42.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_73);
        float _173 = 1.0 / _171;
        float _175 = _107 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _181 = int(_179);
    float _183 = in.m_42.x;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _187 = _185 != 0;
    float _189 = in.m_42.y;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_187)
    {
        _195 = 1.0;
    }
    float _197 = _195;
    float _199 = float(_181);
    float _201 = _197;
    if (!_187)
    {
        _201 = 7.345489978790283203125;
    }
    float _203 = _201;
    float _205 = 1.0 / _199;
    float _207 = float(uint(_193));
    float _209 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _211 = ~_193;
    int _213 = _211 + 1;
    float _215 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _217 = 1.0 / _207;
    float _219 = _205 * _107;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = trunc(_219);
    int _227 = int(_225);
    int _229 = as_type<int>(_217) + (-2);
    float _231 = float(uint(_227));
    float _233 = as_type<float>(_229) * _231;
    float _235 = trunc(_233);
    float _237 = precise::max(_235, 0.0);
    uint _240 = uint(_237);
    int _242 = _223 * int(_240);
    int _244 = _242 + _227;
    float _246 = float(uint(_244));
    float _248 = as_type<float>(_229) * _246;
    float _250 = _183 * _203;
    float _252 = trunc(_248);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    float _258 = floor(_250);
    int _260 = int(_240) + int(_256);
    float _262 = float(_193);
    float _264 = float(_227);
    bool _266 = _264 >= _262;
    bool _268 = isnan(_264);
    bool _270 = _266 || _268;
    bool _272 = isnan(_262);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    int _278 = _213 * _260;
    int _280 = _278 + _227;
    float _282 = float(_73);
    float _284 = trunc(_276);
    int _286 = int(_284);
    bool _288 = uint(_280) >= uint(_193);
    float _290 = -_258;
    float _292 = _250 + _290;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _296 = !_288;
    int _298 = _296 ? 0 : (-1);
    float _300 = 1.0 / _282;
    bool _302 = _193 == 0;
    float _304 = _262 * _107;
    int _306 = ~_260;
    int _308 = _306 + _298;
    int _310 = _308 + 1;
    float _312 = -_294;
    float _314 = fma(_209, 2.0, _312);
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _326 = _324 != 0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    int _332 = _193 * _310;
    int _334 = _332 + _227;
    int _336 = ~_286;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _344 = _342 != 0;
    float _346 = 1.0 / _330;
    bool _348 = !_302;
    int _350 = _348 ? _334 : (-1);
    float _352 = _304 * _300;
    float _354 = _292 * _262;
    bool _356 = !_322;
    int _358 = _356 ? 0 : 1;
    int _360 = _350 * _340;
    int _362 = _193 + (-1);
    float _364 = trunc(_352);
    int _366 = int(_364);
    int _368 = abs(_358);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _183 * 2.0;
    int _374 = _286 * _362;
    int _376 = _374 + _360;
    bool _378 = !_344;
    int _380 = _378 ? 0 : 1;
    float _382 = fma(_215, -2.0, _370);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = trunc(_354);
    int _390 = int(_388);
    bool _392 = !_318;
    int _394 = _392 ? 0 : 1;
    float _396 = in.m_42.z;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _376 * _368;
    int _404 = abs(_394);
    int _406 = abs(_380);
    float _408 = floor(_372);
    bool _410 = !_326;
    int _412 = _410 ? 0 : 1;
    int _414 = _366 * _404;
    int _416 = _414 + _402;
    bool _418 = !_400;
    int _420 = _418 ? 0 : 1;
    int _422 = abs(_412);
    int _424 = abs(_420);
    int _426 = _390 * _406;
    int _428 = _426 + _227;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _177 + _430;
    float _434 = _189 * 2.0;
    float _436 = 1.0 / _386;
    int _438 = _428 * _422;
    int _440 = _438 + _416;
    float _442 = _432 * _346;
    int _444 = _390 * _424;
    int _446 = _444 + _440;
    bool _448 = _408 > 0.0;
    float _450 = _183 + _396;
    bool _452 = _408 >= 0.0;
    bool _454 = isnan(_408);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = floor(_434);
    float _464 = float(uint(_446));
    float _466 = _450 + (-1.0);
    float _468 = _396 * 2.0;
    float _470 = _183 + _189;
    float _472 = as_type<float>(_229) * _464;
    float _474 = _189 + _396;
    float _476 = _470 + (-1.0);
    float _478 = floor(_468);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _482 = _177 + _480;
    float _484 = _474 + (-1.0);
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _488 = _460 ? 0 : 1;
    float _490 = _482 * _436;
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _494 = _462 > 0.0;
    float _496 = trunc(_472);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _396 + (-0.5);
    int _514 = ~_488;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    int _532 = _518;
    if (!_448)
    {
        int _534 = ~_488;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = ~_193;
    int _546 = _544 + 1;
    int _548 = _510 ? 0 : 1;
    bool _550 = _478 > 0.0;
    bool _552 = _478 >= 0.0;
    bool _554 = isnan(_478);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    int _562 = _546 * int(_500);
    int _564 = _562 + _446;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _566;
    bool _570 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _572 = isnan(_177);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _584 = float(uint(_564));
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _592 = isnan(_177);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _604 = -_580;
    float _606 = _604 + 1.0;
    float _608 = as_type<float>(_229) * _584;
    float _610 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _612 = _542 * _107;
    bool _614 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_177);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = trunc(_608);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = _600 * _606;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = _624 * _634;
    float _648 = fma(_640, _490, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = exp2(_612);
    float _652 = _610 * _646;
    float _654 = fma(_644, _490, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = _582 * _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _660 = 1.0 + _658;
    int _662 = int(_500) + int(_630);
    int _664 = ~_193;
    int _666 = _664 + 1;
    float _668 = 1.0 / _660;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _672 = ~_548;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _676;
    if (!_494)
    {
        int _680 = ~_548;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    int _690 = _666 * _662;
    int _692 = _690 + _446;
    int _694 = _560 ? 0 : 1;
    float _696 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    bool _698 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = -_624;
    float _710 = _708 + 1.0;
    bool _712 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(1.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _724 = _706 ? _688 : 0.0;
    float _726 = -_107;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _314);
    bool _730 = uint(_692) >= uint(_193);
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    bool _734 = !_522;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _722);
    float _740 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _696);
    float _742 = fma(_648, _636, _732);
    int _744 = abs(_736);
    float _746 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _382);
    float _748 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _738);
    if (_720)
    {
        float _750 = _724 * _668;
        _111 = _750;
    }
    float _752 = _111;
    float _754 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    bool _756 = !_730;
    int _758 = _756 ? 0 : (-1);
    float _760 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].x, _742);
    int _762 = ~_694;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_654, _636, _754);
    int _770 = _766;
    if (!_550)
    {
        int _772 = ~_694;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    int _784 = ~_662;
    int _786 = _784 + _758;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_776);
    int _794 = _193 * _788;
    int _796 = _794 + _446;
    float _798 = float(uint(_428));
    float _800 = in.m_46.x;
    float _802 = in.m_46.y;
    float _804 = in.m_46.z;
    bool _806 = !_526;
    int _808 = _806 ? 0 : 1;
    float _810 = _790 * _792;
    bool _812 = !_530;
    int _814 = _812 ? 0 : 1;
    float _816 = as_type<float>(_229) * _798;
    int _818 = abs(_808);
    int _820 = abs(_814);
    bool _822 = !_302;
    int _824 = _822 ? _796 : (-1);
    float _826 = trunc(_816);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = _824 >> 31;
    float _834 = _782 * _780;
    float _836 = float(_538);
    float _838 = float(_818);
    float _840 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = float(_684);
    int _844 = _832 & 3;
    float _846 = _838 * _836;
    int _848 = ~_193;
    int _850 = _848 + 1;
    float _852 = float(_820);
    float _854 = _810 * (-2.0);
    int _856 = _824 + _844;
    float _858 = _852 * _842;
    float _860 = _760 * _778;
    int _862 = _856 >> 2;
    float _864 = fma(_486, _854, _486);
    int _866 = _850 * int(_830);
    int _868 = _866 + _428;
    float _870 = fma(_854, _800, _800);
    int _872 = _862 << 4;
    int _874 = _872 + 368;
    float _876 = _846 * (-2.0);
    float _878 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _880 = int(_878);
    float _882 = float(uint(_868));
    float _884 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    uint _886 = uint(int(uint(_874) >> uint(2)));
    uint _888 = uint(int(uint(int(_886)) >> uint(2)));
    int _890 = int(_886) & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    int _894 = int(_886) + 1;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    int _898 = _894 & 3;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[int(_896)][_898];
    float _902 = fma(_492, _876, _492);
    float _904 = fma(_876, _802, _802);
    float _906 = _183 + (-0.5);
    float _908 = _189 + (-0.5);
    float _910 = _858 * (-2.0);
    float _912 = as_type<float>(_229) * _882;
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _916 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[196].y, _904);
    float _918 = fma(_602, _910, _602);
    int _920 = _874 + 8;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    uint _924 = uint(int(uint(int(_922)) >> uint(2)));
    int _926 = int(_922) & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    int _930 = int(_922) + 1;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    int _934 = _930 & 3;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[int(_932)][_934];
    float _938 = trunc(_912);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = fma(_910, _804, _804);
    int _946 = _824 & 3;
    bool _948 = _946 != 0;
    float _950 = fma(_864, _752, _914);
    int _952 = _824 & 3;
    bool _954 = _952 != 0;
    float _956 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _944);
    bool _958 = uint(_946) > 1u;
    float _960 = fma(_902, _752, _916);
    int _962 = _954 ? 0 : 1;
    float _964 = _950 * 0.15915493667125701904296875;
    bool _966 = _946 != 3;
    float _968 = fma(_918, _752, _956);
    int _970 = ~_193;
    int _972 = _970 + 1;
    float _974 = _960 * 0.15915493667125701904296875;
    int _976 = abs(_880);
    float _978 = _968 * 0.15915493667125701904296875;
    int _980 = int(_830) + int(_942);
    float _982 = _964 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = ~_962;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    float _994 = as_type<float>(_880);
    if (!_958)
    {
        int _996 = ~_962;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    int _1002 = _972 * _980;
    int _1004 = _1002 + _428;
    bool _1006 = uint(_946) >= 2u;
    int _1008 = abs(_1000);
    int _1010 = _1006 ? 0 : 1;
    bool _1012 = _946 != 3;
    bool _1014 = !_948;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = float(uint(_976));
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_966)
    {
        int _1028 = ~_1010;
        int _1030 = _1028 + 1;
        _1026 = _1030;
    }
    int _1032 = _1026;
    float _1034 = 1.0 / _1018;
    int _1036 = ~_1008;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    int _1042 = abs(_1016);
    bool _1044 = uint(_1004) >= uint(_193);
    int _1046 = _1040 * as_type<int>(_900);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1050 = _1048 != 0;
    float _1052 = _964 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    int _1056 = abs(_1032);
    bool _1058 = !_1012;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = ~_1042;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1044;
    int _1070 = _1068 ? 0 : (-1);
    bool _1072 = !_1050;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = _1066 * as_type<int>(_892);
    int _1078 = _1076 + _1046;
    int _1080 = abs(_1060);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _147);
    int _1084 = ~_1056;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = _974 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    int _1094 = ~_980;
    int _1096 = _1094 + _1070;
    int _1098 = _1096 + 1;
    float _1100 = _840 * _1082;
    int _1102 = abs(_1074);
    int _1104 = _1088 * as_type<int>(_928);
    int _1106 = _1104 + _1078;
    int _1108 = ~_1080;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    int _1114 = _193 * _1098;
    int _1116 = _1114 + _428;
    float _1118 = float(uint(_880));
    float _1120 = _974 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    int _1124 = _1112 * as_type<int>(_936);
    int _1126 = _1124 + _1106;
    bool _1128 = !_302;
    int _1130 = _1128 ? _1116 : (-1);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    int _1134 = ~_1102;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = as_type<int>(_1034) + (-2);
    float _1142 = 1.0 / _1118;
    float _1144 = _884 * _1132;
    int _1146 = _1126 * _1138;
    float _1148 = _984 * _1092;
    bool _1150 = _183 > 0.5;
    int _1152 = _1130 * _1102;
    int _1154 = _1152 + _1146;
    float _1156 = _1054 * _1092;
    float _1158 = _978 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _984 * _1122;
    float _1164 = _1054 * _1122;
    int _1166 = abs(_1154);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1174 = _1172 != 0;
    float _1176 = _978 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = as_type<int>(_1142) + (-2);
    float _1182 = float(uint(_1154));
    bool _1184 = _189 > 0.5;
    float _1186 = as_type<float>(_1180) * _1182;
    float _1188 = float(uint(_1166));
    float _1190 = _1092 * _1160;
    float _1192 = _1160 * _1100;
    float _1194 = _1122 * _1160;
    float _1196 = as_type<float>(_1140) * _1188;
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = -_1156;
    float _1206 = fma(_1178, _1162, _1204);
    float _1208 = -_1162;
    float _1210 = fma(_1178, _1156, _1208);
    int _1212 = ~_880;
    int _1214 = _1212 + 1;
    float _1216 = in.m_32.x;
    float _1218 = in.m_32.y;
    float _1220 = in.m_32.z;
    float _1222 = _1178 * _1100;
    float _1224 = fma(_1178, _1164, _1148);
    float _1226 = fma(_1178, _1148, _1164);
    float _1228 = trunc(_1196);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    float _1234 = _1054 * _1192;
    float _1236 = -_1222;
    float _1238 = fma(_1194, _1144, _1236);
    int _1240 = ~_976;
    int _1242 = _1240 + 1;
    float _1244 = _984 * _1192;
    float _1246 = fma(_1224, _1144, _1234);
    float _1248 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1250 = _1214 * int(_1202);
    int _1252 = _1250 + _1154;
    float _1254 = fma(_1206, _1144, _1244);
    float _1256 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1258 = fma(_1190, _1248, _1238);
    float _1260 = fma(_1210, _1248, _1246);
    float _1262 = float(uint(_1252));
    float _1264 = fma(_1226, _1248, _1254);
    float _1266 = _1256 * _183;
    int _1268 = _1242 * int(_1232);
    int _1270 = _1268 + _1166;
    float _1272 = as_type<float>(_1180) * _1262;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1276 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1278 = float(uint(_1270));
    float _1280 = trunc(_1266);
    int _1282 = int(_1280);
    float _1284 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1286 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1276);
    float _1288 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1274);
    float _1290 = as_type<float>(_1140) * _1278;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1284);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1286);
    float _1298 = trunc(_1272);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1306 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1294);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1310 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1312 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1304);
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1318 = trunc(_1290);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    float _1324 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1326 = _1282 << 4;
    int _1328 = _1326 + 1712;
    float _1330 = _1314 + _1316;
    float _1332 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = _1310 + _1324;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1338 = _1328 + 8;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
    int _1344 = int(_1340) & 3;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[int(_1342)][_1344];
    int _1348 = int(_1202) + int(_1302);
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1334 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1330 + _1354;
    int _1358 = ~_880;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1364 = _1352 * _1352;
    float _1366 = _1356 * _1356;
    uint _1368 = uint(int(uint(_1328) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    int _1384 = int(_1232) + int(_1322);
    int _1386 = _1360 * _1348;
    int _1388 = _1386 + _1154;
    float _1390 = _1364 + _1366;
    int _1392 = ~_976;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1336);
    float _1398 = -_143;
    int _1400 = _1150 ? as_type<int>(_1398) : as_type<int>(_143);
    float _1402 = sqrt(_1390);
    float _1404 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    int _1406 = _1394 * _1384;
    int _1408 = _1406 + _1166;
    bool _1410 = !_1170;
    float _1412 = _1410 ? _143 : as_type<float>(_1400);
    float _1414 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    int _1416 = _1154 ^ _880;
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1420 = uint(_1408) >= uint(_976);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1424 = uint(_1388) >= uint(_880);
    bool _1426 = !_1420;
    int _1428 = _1426 ? 0 : (-1);
    uint _1430 = uint(int(uint(_1416) >> uint(31)));
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1434 = ~_1428;
    int _1436 = _1384 + _1434;
    int _1438 = _1436 + 1;
    bool _1440 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1444 = !_1424;
    int _1446 = _1444 ? 0 : (-1);
    float _1448 = _1418 + _1432;
    int _1450 = ~int(_1430);
    int _1452 = _1450 + 1;
    int _1454 = ~_1348;
    int _1456 = _1454 + _1446;
    int _1458 = _1456 + 1;
    int _1460 = _1438 ^ _1452;
    bool _1462 = _880 == 0;
    int _1464 = _880 * _1458;
    int _1466 = _1464 + _1154;
    bool _1468 = _880 == 0;
    float _1470 = _1432;
    float _1472 = as_type<float>(_1458);
    float _1474 = _1364;
    float _1476 = _1334;
    if (!_1440)
    {
        _1470 = _1364;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (!_1440)
    {
        _1472 = _1334;
    }
    float _1482 = _1472;
    int _1484 = ~_1452;
    int _1486 = _1484 + _1460;
    int _1488 = _1486 + 1;
    float _1490 = _1482;
    if (!_1440)
    {
        _994 = _1366;
    }
    float _1492 = _994;
    float _1494 = _1492;
    if (!_1440)
    {
        _1474 = _1330;
    }
    float _1496 = _1474;
    float _1498 = _1496;
    if (!_1440)
    {
        _1476 = _1448;
    }
    float _1500 = _1476;
    bool _1502 = !_1440;
    float _1504 = _1500;
    if (!_1502)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1510 = _1402 + _1508;
        float _1512 = rsqrt(_1390);
        float _1514 = _1510 * _1506;
        float _1516 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1518 = _1514 * 0.15915493667125701904296875;
        float _1520 = _1518 * 6.283185482025146484375;
        float _1522 = sin(_1520);
        float _1524 = _1518 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = fma(_1522, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1530 = _1512 * _1528;
        float _1532 = _1526 + (-1.0);
        float _1534 = fma(_1352, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1536 = fma(_1356, _1530, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1538 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1542 = _1534 + _1540;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1536 + _1544;
        float _1548 = fma(_1448, _1526, _1538);
        float _1550 = _1542 * _1542;
        float _1552 = _1546 * _1546;
        _1504 = _1548;
        _1480 = _1550;
        _1494 = _1552;
        _1490 = _1534;
        _1498 = _1536;
    }
    float _1554 = _1504;
    float _1556 = _1480;
    float _1558 = _1494;
    float _1560 = _1490;
    float _1562 = _1498;
    bool _1564 = !_1462;
    int _1566 = _1564 ? _1466 : (-1);
    float _1568 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1570 = !_1468;
    int _1572 = _1570 ? _1488 : (-1);
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1576 = _1554 + _1574;
    float _1578 = -_147;
    int _1580 = _1184 ? as_type<int>(_1578) : as_type<int>(_147);
    float _1582 = -_740;
    float _1584 = _1582 + 1.0;
    float _1586 = float(_1566);
    float _1588 = fma(_1576, _1576, _1556);
    float _1590 = float(_1572);
    float _1592 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1594 = !_1174;
    float _1596 = _1594 ? _147 : as_type<float>(_1580);
    float _1598 = fma(_1568, _1586, _728);
    float _1600 = _1412 + 0.5;
    float _1602 = -_746;
    float _1604 = fma(_1592, _1590, _1602);
    float _1606 = _1588 + _1558;
    float _1608 = _1596 + (-0.5);
    float _1610 = fma(_1568, _1600, _1598);
    float _1612 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1614 = -_1592;
    float _1616 = fma(_1614, _1608, _1604);
    float _1618 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = -_1584;
    float _1622 = fma(_1412, _1620, _1610);
    float _1624 = sqrt(_1606);
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1632 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1634 = -_748;
    float _1636 = _1634 + 1.0;
    float _1638 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = fma(_1596, _1636, _1616);
    out.m_48.x = _1642;
    out.m_48.y = _1644;
    out.m_48.z = _1646;
    bool _1654 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1656 = isnan(_1624);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1662 = _1658 || _1660;
    out.m_50.x = _1648;
    out.m_50.y = _1638;
    out.m_50.z = _1650;
    out.m_50.w = _1640;
    out.m_52.x = _1622;
    out.m_52.y = _1652;
    float _1664 = _1632;
    if (!_1662)
    {
        _1664 = 1.0;
    }
    float _1666 = _1664;
    bool _1668 = !_1662;
    float _1670 = _1666;
    if (!_1668)
    {
        bool _1672 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1674 = isnan(_1624);
        bool _1676 = _1672 || _1674;
        bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1680 = _1676 || _1678;
        if (!_1680)
        {
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = _1624 + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1692 = _1690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1694 = 1.0 / _1688;
            float _1696 = _1684 * _1694;
            float _1698 = fma(_1696, _1692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1670 = _1698;
            _1700 = true;
        }
        else
        {
            bool _1702 = _1624 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1704 = isnan(_1624);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1710 = _1706 || _1708;
            if (!_1710)
            {
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1624 + _1712;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1724 = 1.0 / _1718;
                float _1726 = _1714 * _1724;
                float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1670 = _1728;
                _1700 = true;
            }
            else
            {
                _1670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1700 = false;
    float _1730 = _1670;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1734 = _1554 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1560 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1562 + _1740;
    out.m_35.x = 1.0;
    float _1744 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1746 = fma(_1738, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1748 = fma(_1742, _1730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1752);
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1756);
    float _1766 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1760);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1762);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1776 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1790 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1782);
    float _1792 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1784);
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1786);
    float _1796 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1788);
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1800 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1804 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1796);
    float _1806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1808 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1810 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1812 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1814 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1804);
    out.m_54.w = _1806;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _1812;
    out.gl_Position.w = _1814;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

