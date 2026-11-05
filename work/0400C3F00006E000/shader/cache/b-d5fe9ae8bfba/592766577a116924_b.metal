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
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_60 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_48 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _175 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1855 = as_type<float>(_95);
        out.gl_Position.z = _1855;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = _113;
    if (_109)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1925 = as_type<float>(_133);
        out.gl_Position.z = _1925;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _139 = as_type<int>(_135) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_135) & 2;
    bool _145 = _143 != 0;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_137;
    float _173;
    if (!_155)
    {
        float _157 = in.m_42.x;
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _163 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _165 = _163 * _159;
        float _167 = floor(_165);
        float _169 = -_167;
        float _171 = _165 + _169;
        _173 = _171;
        _175 = true;
    }
    else
    {
        float _177 = float(_79);
        float _179 = 1.0 / _177;
        float _181 = _113 * _179;
        _173 = _181;
    }
    _175 = false;
    float _183 = _173;
    float _185 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _187 = int(_185);
    float _189 = in.m_42.x;
    float _191 = in.m_42.y;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _195 = _193 != 0;
    float _197 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _199 = int(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_195)
    {
        _205 = 1.0;
    }
    float _207 = _205;
    float _209 = float(_187);
    float _211 = _207;
    if (!_195)
    {
        _211 = 7.345489978790283203125;
    }
    float _213 = _211;
    float _215 = 1.0 / _203;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _219 = float(uint(_199));
    float _221 = _189 * 2.0;
    float _223 = 1.0 / _209;
    int _225 = ~_199;
    int _227 = _225 + 1;
    float _229 = _191 * 2.0;
    bool _231 = _199 == 0;
    float _233 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _235 = ~_199;
    int _237 = _235 + 1;
    float _239 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _217);
    float _241 = 1.0 / _219;
    float _243 = _223 * _113;
    float _245 = floor(_221);
    int _247 = as_type<int>(_241) + (-2);
    float _249 = trunc(_243);
    int _251 = int(_249);
    float _253 = floor(_229);
    float _255 = float(uint(_251));
    float _257 = float(_251);
    float _259 = as_type<float>(_247) * _255;
    float _261 = trunc(_259);
    float _263 = precise::max(_261, 0.0);
    uint _266 = uint(_263);
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _270 = fma(_233, -2.0, _268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _183 + _272;
    float _276 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    int _278 = _227 * int(_266);
    int _280 = _278 + _251;
    float _282 = float(uint(_280));
    int _284 = ~_199;
    int _286 = _284 + 1;
    float _288 = as_type<float>(_247) * _282;
    float _290 = trunc(_288);
    float _292 = precise::max(_290, 0.0);
    uint _294 = uint(_292);
    int _296 = int(_266) + int(_294);
    float _298 = float(_199);
    float _300 = float(_79);
    bool _302 = _257 >= _298;
    bool _304 = isnan(_257);
    bool _306 = _302 || _304;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    int _314 = _286 * _296;
    int _316 = _314 + _251;
    float _318 = _189 * _213;
    float _320 = 1.0 / _300;
    bool _322 = uint(_316) >= uint(_199);
    bool _324 = !_322;
    int _326 = _324 ? 0 : (-1);
    float _328 = floor(_318);
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _340 = _338 != 0;
    int _342 = ~_296;
    int _344 = _342 + _326;
    int _346 = _344 + 1;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _350 = _348 != 0;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _354 = _352 != 0;
    float _356 = trunc(_312);
    int _358 = int(_356);
    int _360 = _199 * _346;
    int _362 = _360 + _251;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    bool _368 = !_231;
    int _370 = _368 ? _362 : (-1);
    float _372 = -_328;
    float _374 = _318 + _372;
    int _376 = _199 + (-1);
    float _378 = _374 * _298;
    float _380 = _298 * _113;
    bool _382 = !_350;
    int _384 = _382 ? 0 : 1;
    int _386 = ~_358;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = _380 * _320;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _396 = _394 != 0;
    int _398 = abs(_384);
    int _400 = _370 * _390;
    float _402 = trunc(_378);
    int _404 = int(_402);
    int _406 = _358 * _376;
    int _408 = _406 + _400;
    bool _410 = !_336;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_332;
    int _416 = _414 ? 0 : 1;
    int _418 = abs(_412);
    float _420 = trunc(_392);
    int _422 = int(_420);
    bool _424 = !_340;
    int _426 = _424 ? 0 : 1;
    int _428 = abs(_416);
    int _430 = _408 * _418;
    int _432 = abs(_426);
    int _434 = _404 * _398;
    int _436 = _434 + _251;
    bool _438 = !_396;
    int _440 = _438 ? 0 : 1;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _444 = _442 != 0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _450 = abs(_440);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _245 >= 0.0;
    bool _458 = isnan(_245);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _422 * _428;
    int _468 = _466 + _430;
    bool _470 = _245 > 0.0;
    bool _472 = _253 > 0.0;
    int _474 = _436 * _432;
    int _476 = _474 + _468;
    float _478 = in.m_44.x;
    float _480 = in.m_44.y;
    float _482 = in.m_44.z;
    float _484 = 1.0 / _448;
    int _486 = _404 * _450;
    int _488 = _486 + _476;
    float _490 = in.m_46.x;
    float _492 = in.m_46.y;
    float _494 = in.m_46.z;
    float _496 = float(uint(_488));
    float _498 = _454 * _113;
    float _500 = as_type<float>(_247) * _496;
    float _502 = in.m_32.x;
    float _504 = in.m_32.y;
    float _506 = in.m_32.z;
    float _508 = exp2(_498);
    float _510 = _274 * _484;
    float _512 = trunc(_500);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = -_508;
    float _520 = _518 + 1.0;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _504 * _480;
    int _526 = _237 * int(_516);
    int _528 = _526 + _488;
    float _530 = -_522;
    float _532 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[77].x, _530);
    float _534 = float(uint(_528));
    float _536 = _504 * _492;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _540 = _183 + _538;
    float _542 = -_113;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _546 = as_type<float>(_247) * _534;
    float _548 = _540 * _215;
    float _550 = in.m_42.z;
    float _552 = trunc(_546);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = fma(_502, _490, _536);
    float _560 = fma(_502, _478, _524);
    int _562 = _464 ? 0 : 1;
    int _564 = ~_199;
    int _566 = _564 + 1;
    float _568 = fma(_506, _494, _558);
    bool _570 = _253 >= 0.0;
    bool _572 = isnan(_253);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = fma(_506, _482, _560);
    int _582 = int(_516) + int(_556);
    int _584 = _578 ? 0 : 1;
    int _586 = ~_562;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _550 * 2.0;
    int _594 = _566 * _582;
    int _596 = _594 + _488;
    int _598 = ~_584;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    int _604 = _590;
    int _606 = _602;
    if (!_470)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _191 + _189;
    float _616 = floor(_592);
    if (!_472)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _606 = _620;
    }
    int _622 = _606;
    bool _624 = uint(_596) >= uint(_199);
    float _626 = _191 + _550;
    float _628 = _614 + (-1.0);
    bool _630 = !_624;
    int _632 = _630 ? 0 : (-1);
    float _634 = _626 + (-1.0);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _646 = _644 != 0;
    float _648 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _550 + _189;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = _550 + (-0.5);
    bool _656 = !_642;
    int _658 = _656 ? 0 : 1;
    float _660 = _650 + (-1.0);
    bool _662 = _616 >= 0.0;
    bool _664 = isnan(_616);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    int _676 = _670 ? 0 : 1;
    bool _678 = _616 > 0.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _680;
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = fma(_682, _548, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_183);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_690, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _712 = ~_676;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = fma(_696, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _720 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_183);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = _716;
    if (!_678)
    {
        int _734 = ~_676;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    bool _744 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_183);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _730 * _742;
    float _758 = -_730;
    float _760 = _758 + 1.0;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _754 * _760;
    float _778 = _770 ? _520 : 0.0;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    float _784 = 1.0 / _774;
    float _786 = _686 * _776;
    float _788 = _692 * _776;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _792 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _794 = isnan(1.0);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _800 = _796 || _798;
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _804 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    int _806 = ~_582;
    int _808 = _806 + _632;
    int _810 = _808 + 1;
    float _812 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _790);
    float _814 = fma(_718, _756, _802);
    float _816 = fma(_710, _756, _804);
    bool _818 = !_646;
    int _820 = _818 ? 0 : 1;
    float _822 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    bool _824 = !_638;
    int _826 = _824 ? 0 : 1;
    int _828 = _199 * _810;
    int _830 = _828 + _488;
    int _832 = abs(_658);
    float _834 = in.m_48.x;
    float _836 = in.m_48.y;
    int _838 = abs(_820);
    float _840 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _239);
    int _842 = abs(_826);
    if (_800)
    {
        float _844 = _778 * _784;
        _115 = _844;
    }
    float _846 = _115;
    float _848 = in.m_50.x;
    float _850 = in.m_50.y;
    float _852 = in.m_50.z;
    float _854 = float(uint(_436));
    float _856 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].x, _814);
    bool _858 = !_231;
    int _860 = _858 ? _830 : (-1);
    float _862 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].y, _816);
    float _864 = float(_612);
    float _866 = as_type<float>(_247) * _854;
    float _868 = float(_842);
    float _870 = float(_738);
    int _872 = _860 >> 31;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = float(_622);
    float _882 = _868 * _870;
    int _884 = _872 & 3;
    float _886 = float(_832);
    float _888 = float(_838);
    float _890 = _856 * _834;
    int _892 = _860 + _884;
    float _894 = _882 * (-2.0);
    float _896 = _886 * _864;
    float _898 = _888 * _880;
    int _900 = _892 >> 2;
    float _902 = fma(_894, _848, _848);
    float _904 = _896 * (-2.0);
    float _906 = fma(_648, _894, _648);
    float _908 = _898 * (-2.0);
    int _910 = _900 << 4;
    int _912 = _910 + 368;
    float _914 = fma(_652, _904, _652);
    float _916 = fma(_904, _850, _850);
    int _918 = ~_199;
    int _920 = _918 + 1;
    float _922 = _189 + (-0.5);
    float _924 = fma(_684, _908, _684);
    uint _926 = uint(int(uint(_912) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = fma(_908, _852, _852);
    float _944 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _902);
    int _946 = _920 * int(_878);
    int _948 = _946 + _436;
    float _950 = _191 + (-0.5);
    int _952 = _860 & 3;
    bool _954 = _952 != 0;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _958 = int(_956);
    int _960 = _860 & 3;
    bool _962 = _960 != 0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _916);
    float _966 = float(uint(_948));
    int _968 = _912 + 8;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    bool _986 = uint(_952) > 1u;
    float _988 = fma(_906, _846, _944);
    float _990 = fma(_914, _846, _964);
    float _992 = as_type<float>(_247) * _966;
    int _994 = _962 ? 0 : 1;
    float _996 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    bool _998 = _952 != 3;
    float _1000 = _988 * 0.15915493667125701904296875;
    int _1002 = ~_994;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = trunc(_992);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_199;
    int _1016 = _1014 + 1;
    float _1018 = _990 * 0.15915493667125701904296875;
    int _1020 = abs(_958);
    float _1022 = _862 * _836;
    int _1024 = _1006;
    if (!_986)
    {
        int _1026 = ~_994;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    bool _1032 = uint(_952) >= 2u;
    float _1034 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1036 = abs(_1030);
    float _1038 = fma(_924, _846, _996);
    bool _1040 = !_954;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _1000 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    int _1048 = int(_878) + int(_1012);
    int _1050 = _1032 ? 0 : 1;
    float _1052 = float(uint(_1020));
    int _1054 = _1016 * _1048;
    int _1056 = _1054 + _436;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_998)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = 1.0 / _1052;
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    bool _1080 = _952 != 3;
    int _1082 = abs(_1042);
    int _1084 = _1078 * as_type<int>(_940);
    bool _1086 = uint(_1056) >= uint(_199);
    float _1088 = _1000 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    int _1092 = abs(_1070);
    bool _1094 = !_1080;
    int _1096 = _1094 ? 0 : (-1);
    int _1098 = ~_1082;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    bool _1104 = !_1086;
    int _1106 = _1104 ? 0 : (-1);
    float _1108 = float(uint(_958));
    int _1110 = _1102 * as_type<int>(_932);
    int _1112 = _1110 + _1084;
    bool _1114 = !_354;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    int _1120 = ~_1092;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _1108;
    int _1128 = ~_1048;
    int _1130 = _1128 + _1106;
    int _1132 = _1130 + 1;
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _149);
    int _1136 = abs(_1116);
    int _1138 = _1124 * as_type<int>(_976);
    int _1140 = _1138 + _1112;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _199 * _1132;
    int _1150 = _1148 + _436;
    int _1152 = ~_1136;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1018 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1038 * 0.15915493667125701904296875;
    int _1164 = _1146 * as_type<int>(_984);
    int _1166 = _1164 + _1140;
    float _1168 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1170 = !_231;
    int _1172 = _1170 ? _1150 : (-1);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _153);
    int _1176 = _1166 * _1156;
    float _1178 = _1168 * _1134;
    float _1180 = _1018 * 6.283185482025146484375;
    float _1182 = cos(_1180);
    int _1184 = as_type<int>(_1126) + (-2);
    int _1186 = _1172 * _1136;
    int _1188 = _1186 + _1176;
    float _1190 = _1034 * _1174;
    int _1192 = as_type<int>(_1072) + (-2);
    bool _1194 = _189 > 0.5;
    float _1196 = _1162 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = float(uint(_1188));
    float _1202 = _1090 * _1160;
    int _1204 = abs(_1188);
    float _1206 = _1046 * _1160;
    bool _1208 = _191 > 0.5;
    float _1210 = as_type<float>(_1184) * _1200;
    int _1212 = ~_958;
    int _1214 = _1212 + 1;
    float _1216 = _1046 * _1182;
    float _1218 = _1162 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    bool _1222 = _958 == 0;
    float _1224 = -_1202;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1202, _1228);
    float _1232 = trunc(_1210);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _1090 * _1182;
    float _1240 = float(uint(_1204));
    float _1242 = _1160 * _1220;
    float _1244 = _1182 * _1220;
    float _1246 = as_type<float>(_1192) * _1240;
    float _1248 = _1220 * _1190;
    float _1250 = _1198 * _1190;
    float _1252 = fma(_1198, _1238, _1206);
    float _1254 = fma(_1198, _1206, _1238);
    float _1256 = trunc(_1246);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = _1090 * _1248;
    int _1264 = ~_1020;
    int _1266 = _1264 + 1;
    int _1268 = _1214 * int(_1236);
    int _1270 = _1268 + _1188;
    float _1272 = _1046 * _1248;
    float _1274 = fma(_1252, _1178, _1262);
    float _1276 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1278 = -_1250;
    float _1280 = fma(_1244, _1178, _1278);
    float _1282 = fma(_1226, _1178, _1272);
    float _1284 = float(uint(_1270));
    float _1286 = in.m_52.x;
    float _1288 = in.m_52.y;
    float _1290 = in.m_52.z;
    float _1292 = fma(_1230, _1276, _1274);
    float _1294 = fma(_1242, _1276, _1280);
    float _1296 = as_type<float>(_1184) * _1284;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1302 = _1266 * int(_1260);
    int _1304 = _1302 + _1204;
    float _1306 = fma(_1254, _1276, _1282);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1298);
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1300);
    float _1312 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1314 = float(uint(_1304));
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1320 = trunc(_1296);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = as_type<float>(_1192) * _1314;
    float _1330 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1332 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1334 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1338 = _1312 + _1332;
    float _1340 = _1330 + _1334;
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = _504 * _1288;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1338 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1340 + _1354;
    float _1358 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1336);
    float _1360 = fma(_502, _1286, _1348);
    float _1362 = _1352 * _1352;
    float _1364 = _1356 * _1356;
    int _1366 = ~_958;
    int _1368 = _1366 + 1;
    float _1370 = fma(_506, _1290, _1360);
    int _1372 = int(_1236) + int(_1324);
    float _1374 = _1362 + _1364;
    int _1376 = ~_1020;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1382 = _1188 ^ _958;
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1386 = int(_1260) + int(_1346);
    int _1388 = _1368 * _1372;
    int _1390 = _1388 + _1188;
    float _1392 = -_149;
    int _1394 = _1194 ? as_type<int>(_1392) : as_type<int>(_149);
    uint _1396 = uint(int(uint(_1382) >> uint(31)));
    float _1398 = sqrt(_1374);
    int _1400 = _1378 * _1386;
    int _1402 = _1400 + _1204;
    bool _1404 = uint(_1390) >= uint(_958);
    bool _1406 = !_366;
    float _1408 = _1406 ? _149 : as_type<float>(_1394);
    bool _1410 = uint(_1402) >= uint(_1020);
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : (-1);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1418 = !_1410;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = ~_1372;
    int _1426 = _1424 + _1414;
    int _1428 = _1426 + 1;
    int _1430 = ~_1420;
    int _1432 = _1386 + _1430;
    int _1434 = _1432 + 1;
    bool _1436 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1438 = _958 * _1428;
    int _1440 = _1438 + _1188;
    int _1442 = ~int(_1396);
    int _1444 = _1442 + 1;
    float _1446 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1448 = _958 == 0;
    int _1450 = _1434 ^ _1444;
    float _1452 = _1384 + _1446;
    bool _1454 = !_1448;
    float _1456 = _1454 ? as_type<float>(_1440) : as_type<float>(0xffffffffu /* nan */);
    int _1458 = ~_1444;
    int _1460 = _1458 + _1450;
    int _1462 = _1460 + 1;
    float _1464 = float(as_type<int>(_1456));
    float _1466 = as_type<float>(_1204);
    float _1468 = _1446;
    float _1470 = as_type<float>(_1444);
    float _1472 = _1384;
    float _1474 = _1456;
    if (!_1436)
    {
        _1466 = _1364;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (!_1436)
    {
        _1468 = _1362;
    }
    float _1480 = _1468;
    float _1482 = _1480;
    if (!_1436)
    {
        _1470 = _1338;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (!_1436)
    {
        _1472 = _1340;
    }
    float _1488 = _1472;
    float _1490 = _1488;
    if (!_1436)
    {
        _1474 = _1452;
    }
    float _1492 = _1474;
    bool _1494 = !_1436;
    float _1496 = _1492;
    if (!_1494)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1502 = _1398 + _1500;
        float _1504 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = rsqrt(_1374);
        float _1508 = _1502 * _1498;
        float _1510 = _1508 * 0.15915493667125701904296875;
        float _1512 = _1510 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = fma(_1514, _1504, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1506 * _1520;
        float _1524 = _1518 + (-1.0);
        float _1526 = fma(_1352, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1356, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1530 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1534 = _1526 + _1532;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1538 = _1528 + _1536;
        float _1540 = fma(_1452, _1518, _1530);
        float _1542 = _1534 * _1534;
        float _1544 = _1538 * _1538;
        _1496 = _1540;
        _1482 = _1542;
        _1478 = _1544;
        _1486 = _1526;
        _1490 = _1528;
    }
    float _1546 = _1496;
    float _1548 = _1482;
    float _1550 = _1478;
    float _1552 = _1486;
    float _1554 = _1490;
    bool _1556 = !_1222;
    int _1558 = _1556 ? _1462 : (-1);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1562 = _1546 + _1560;
    float _1564 = -_153;
    int _1566 = _1208 ? as_type<int>(_1564) : as_type<int>(_153);
    float _1568 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = float(_1558);
    float _1572 = fma(_1422, _1464, _544);
    bool _1574 = !_444;
    float _1576 = _1574 ? _153 : as_type<float>(_1566);
    float _1578 = _1408 + 0.5;
    float _1580 = fma(_1562, _1562, _1548);
    float _1582 = -_276;
    float _1584 = fma(_1568, _1570, _1582);
    float _1586 = -_840;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1422, _1578, _1572);
    float _1592 = _1576 + (-0.5);
    float _1594 = _1580 + _1550;
    float _1596 = -_1588;
    float _1598 = fma(_1408, _1596, _1590);
    float _1600 = -_1568;
    float _1602 = fma(_1600, _1592, _1584);
    float _1604 = -_822;
    float _1606 = _1604 + 1.0;
    float _1608 = sqrt(_1594);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = fma(_1576, _1606, _1602);
    out.m_54.x = _1622;
    out.m_54.y = _1626;
    out.m_54.z = _1628;
    out.m_54.w = _1624;
    bool _1638 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1640 = isnan(_1608);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1646 = _1642 || _1644;
    out.m_56.x = _1630;
    out.m_56.y = _1632;
    out.m_56.z = _1634;
    out.m_58.x = _1598;
    out.m_58.y = _1636;
    float _1648 = _1616;
    if (!_1646)
    {
        _1648 = 1.0;
    }
    float _1650 = _1648;
    bool _1652 = !_1646;
    float _1654 = _1650;
    if (!_1652)
    {
        bool _1656 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1658 = isnan(_1608);
        bool _1660 = _1656 || _1658;
        bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1664 = _1660 || _1662;
        if (!_1664)
        {
            float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1668 = _1608 + _1666;
            float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1672 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1670;
            float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1678 = 1.0 / _1672;
            float _1680 = _1668 * _1678;
            float _1682 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1654 = _1682;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1688 = isnan(_1608);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1698 = _1608 + _1696;
                float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1702 = _1700 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1708 = 1.0 / _1702;
                float _1710 = _1698 * _1708;
                float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1654 = _1712;
                _1684 = true;
            }
            else
            {
                _1654 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1684 = false;
    float _1714 = _1654;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1546 + _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1722 = _1552 + _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1726 = _1554 + _1724;
    float _1728 = fma(_1718, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1722, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1732 = fma(_1726, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1736);
    float _1746 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1748 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1740);
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1768);
    float _1778 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1782 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1776);
    float _1786 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1778);
    float _1788 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1786);
    float _1798 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    out.m_60.w = _1790;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1798;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _175 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1855 = as_type<float>(_95);
        out.gl_Position.z = _1855;
    }
    if (!_83)
    {
        return out;
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = _113;
    if (_109)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1925 = as_type<float>(_133);
        out.gl_Position.z = _1925;
    }
    if (_125)
    {
        return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _139 = as_type<int>(_135) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_135) & 2;
    bool _145 = _143 != 0;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_137;
    float _173;
    if (!_155)
    {
        float _157 = in.m_42.x;
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _163 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _165 = _163 * _159;
        float _167 = floor(_165);
        float _169 = -_167;
        float _171 = _165 + _169;
        _173 = _171;
        _175 = true;
    }
    else
    {
        float _177 = float(_79);
        float _179 = 1.0 / _177;
        float _181 = _113 * _179;
        _173 = _181;
    }
    _175 = false;
    float _183 = _173;
    float _185 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _187 = int(_185);
    float _189 = in.m_42.x;
    float _191 = in.m_42.y;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _195 = _193 != 0;
    float _197 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _199 = int(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_195)
    {
        _205 = 1.0;
    }
    float _207 = _205;
    float _209 = float(_187);
    float _211 = _207;
    if (!_195)
    {
        _211 = 7.345489978790283203125;
    }
    float _213 = _211;
    float _215 = 1.0 / _203;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _219 = float(uint(_199));
    float _221 = _189 * 2.0;
    float _223 = 1.0 / _209;
    int _225 = ~_199;
    int _227 = _225 + 1;
    float _229 = _191 * 2.0;
    bool _231 = _199 == 0;
    float _233 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _235 = ~_199;
    int _237 = _235 + 1;
    float _239 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _217);
    float _241 = 1.0 / _219;
    float _243 = _223 * _113;
    float _245 = floor(_221);
    int _247 = as_type<int>(_241) + (-2);
    float _249 = trunc(_243);
    int _251 = int(_249);
    float _253 = floor(_229);
    float _255 = float(uint(_251));
    float _257 = float(_251);
    float _259 = as_type<float>(_247) * _255;
    float _261 = trunc(_259);
    float _263 = precise::max(_261, 0.0);
    uint _266 = uint(_263);
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _270 = fma(_233, -2.0, _268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _183 + _272;
    float _276 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    int _278 = _227 * int(_266);
    int _280 = _278 + _251;
    float _282 = float(uint(_280));
    int _284 = ~_199;
    int _286 = _284 + 1;
    float _288 = as_type<float>(_247) * _282;
    float _290 = trunc(_288);
    float _292 = precise::max(_290, 0.0);
    uint _294 = uint(_292);
    int _296 = int(_266) + int(_294);
    float _298 = float(_199);
    float _300 = float(_79);
    bool _302 = _257 >= _298;
    bool _304 = isnan(_257);
    bool _306 = _302 || _304;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    int _314 = _286 * _296;
    int _316 = _314 + _251;
    float _318 = _189 * _213;
    float _320 = 1.0 / _300;
    bool _322 = uint(_316) >= uint(_199);
    bool _324 = !_322;
    int _326 = _324 ? 0 : (-1);
    float _328 = floor(_318);
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _340 = _338 != 0;
    int _342 = ~_296;
    int _344 = _342 + _326;
    int _346 = _344 + 1;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _350 = _348 != 0;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _354 = _352 != 0;
    float _356 = trunc(_312);
    int _358 = int(_356);
    int _360 = _199 * _346;
    int _362 = _360 + _251;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    bool _368 = !_231;
    int _370 = _368 ? _362 : (-1);
    float _372 = -_328;
    float _374 = _318 + _372;
    int _376 = _199 + (-1);
    float _378 = _374 * _298;
    float _380 = _298 * _113;
    bool _382 = !_350;
    int _384 = _382 ? 0 : 1;
    int _386 = ~_358;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = _380 * _320;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _396 = _394 != 0;
    int _398 = abs(_384);
    int _400 = _370 * _390;
    float _402 = trunc(_378);
    int _404 = int(_402);
    int _406 = _358 * _376;
    int _408 = _406 + _400;
    bool _410 = !_336;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_332;
    int _416 = _414 ? 0 : 1;
    int _418 = abs(_412);
    float _420 = trunc(_392);
    int _422 = int(_420);
    bool _424 = !_340;
    int _426 = _424 ? 0 : 1;
    int _428 = abs(_416);
    int _430 = _408 * _418;
    int _432 = abs(_426);
    int _434 = _404 * _398;
    int _436 = _434 + _251;
    bool _438 = !_396;
    int _440 = _438 ? 0 : 1;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _444 = _442 != 0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _450 = abs(_440);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _245 >= 0.0;
    bool _458 = isnan(_245);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _422 * _428;
    int _468 = _466 + _430;
    bool _470 = _245 > 0.0;
    bool _472 = _253 > 0.0;
    int _474 = _436 * _432;
    int _476 = _474 + _468;
    float _478 = in.m_44.x;
    float _480 = in.m_44.y;
    float _482 = in.m_44.z;
    float _484 = 1.0 / _448;
    int _486 = _404 * _450;
    int _488 = _486 + _476;
    float _490 = in.m_46.x;
    float _492 = in.m_46.y;
    float _494 = in.m_46.z;
    float _496 = float(uint(_488));
    float _498 = _454 * _113;
    float _500 = as_type<float>(_247) * _496;
    float _502 = in.m_32.x;
    float _504 = in.m_32.y;
    float _506 = in.m_32.z;
    float _508 = exp2(_498);
    float _510 = _274 * _484;
    float _512 = trunc(_500);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = -_508;
    float _520 = _518 + 1.0;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _504 * _480;
    int _526 = _237 * int(_516);
    int _528 = _526 + _488;
    float _530 = -_522;
    float _532 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[77].x, _530);
    float _534 = float(uint(_528));
    float _536 = _504 * _492;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _540 = _183 + _538;
    float _542 = -_113;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _546 = as_type<float>(_247) * _534;
    float _548 = _540 * _215;
    float _550 = in.m_42.z;
    float _552 = trunc(_546);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = fma(_502, _490, _536);
    float _560 = fma(_502, _478, _524);
    int _562 = _464 ? 0 : 1;
    int _564 = ~_199;
    int _566 = _564 + 1;
    float _568 = fma(_506, _494, _558);
    bool _570 = _253 >= 0.0;
    bool _572 = isnan(_253);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = fma(_506, _482, _560);
    int _582 = int(_516) + int(_556);
    int _584 = _578 ? 0 : 1;
    int _586 = ~_562;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _550 * 2.0;
    int _594 = _566 * _582;
    int _596 = _594 + _488;
    int _598 = ~_584;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    int _604 = _590;
    int _606 = _602;
    if (!_470)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _191 + _189;
    float _616 = floor(_592);
    if (!_472)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _606 = _620;
    }
    int _622 = _606;
    bool _624 = uint(_596) >= uint(_199);
    float _626 = _191 + _550;
    float _628 = _614 + (-1.0);
    bool _630 = !_624;
    int _632 = _630 ? 0 : (-1);
    float _634 = _626 + (-1.0);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _646 = _644 != 0;
    float _648 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _550 + _189;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = _550 + (-0.5);
    bool _656 = !_642;
    int _658 = _656 ? 0 : 1;
    float _660 = _650 + (-1.0);
    bool _662 = _616 >= 0.0;
    bool _664 = isnan(_616);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    int _676 = _670 ? 0 : 1;
    bool _678 = _616 > 0.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _680;
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = fma(_682, _548, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_183);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_690, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _712 = ~_676;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = fma(_696, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _720 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_183);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = _716;
    if (!_678)
    {
        int _734 = ~_676;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    bool _744 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_183);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _730 * _742;
    float _758 = -_730;
    float _760 = _758 + 1.0;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _754 * _760;
    float _778 = _770 ? _520 : 0.0;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    float _784 = 1.0 / _774;
    float _786 = _686 * _776;
    float _788 = _692 * _776;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _792 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _794 = isnan(1.0);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _800 = _796 || _798;
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _804 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    int _806 = ~_582;
    int _808 = _806 + _632;
    int _810 = _808 + 1;
    float _812 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _790);
    float _814 = fma(_718, _756, _802);
    float _816 = fma(_710, _756, _804);
    bool _818 = !_646;
    int _820 = _818 ? 0 : 1;
    float _822 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    bool _824 = !_638;
    int _826 = _824 ? 0 : 1;
    int _828 = _199 * _810;
    int _830 = _828 + _488;
    int _832 = abs(_658);
    float _834 = in.m_48.x;
    float _836 = in.m_48.y;
    int _838 = abs(_820);
    float _840 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _239);
    int _842 = abs(_826);
    if (_800)
    {
        float _844 = _778 * _784;
        _115 = _844;
    }
    float _846 = _115;
    float _848 = in.m_50.x;
    float _850 = in.m_50.y;
    float _852 = in.m_50.z;
    float _854 = float(uint(_436));
    float _856 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].x, _814);
    bool _858 = !_231;
    int _860 = _858 ? _830 : (-1);
    float _862 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].y, _816);
    float _864 = float(_612);
    float _866 = as_type<float>(_247) * _854;
    float _868 = float(_842);
    float _870 = float(_738);
    int _872 = _860 >> 31;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = float(_622);
    float _882 = _868 * _870;
    int _884 = _872 & 3;
    float _886 = float(_832);
    float _888 = float(_838);
    float _890 = _856 * _834;
    int _892 = _860 + _884;
    float _894 = _882 * (-2.0);
    float _896 = _886 * _864;
    float _898 = _888 * _880;
    int _900 = _892 >> 2;
    float _902 = fma(_894, _848, _848);
    float _904 = _896 * (-2.0);
    float _906 = fma(_648, _894, _648);
    float _908 = _898 * (-2.0);
    int _910 = _900 << 4;
    int _912 = _910 + 368;
    float _914 = fma(_652, _904, _652);
    float _916 = fma(_904, _850, _850);
    int _918 = ~_199;
    int _920 = _918 + 1;
    float _922 = _189 + (-0.5);
    float _924 = fma(_684, _908, _684);
    uint _926 = uint(int(uint(_912) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = fma(_908, _852, _852);
    float _944 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _902);
    int _946 = _920 * int(_878);
    int _948 = _946 + _436;
    float _950 = _191 + (-0.5);
    int _952 = _860 & 3;
    bool _954 = _952 != 0;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _958 = int(_956);
    int _960 = _860 & 3;
    bool _962 = _960 != 0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _916);
    float _966 = float(uint(_948));
    int _968 = _912 + 8;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    bool _986 = uint(_952) > 1u;
    float _988 = fma(_906, _846, _944);
    float _990 = fma(_914, _846, _964);
    float _992 = as_type<float>(_247) * _966;
    int _994 = _962 ? 0 : 1;
    float _996 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    bool _998 = _952 != 3;
    float _1000 = _988 * 0.15915493667125701904296875;
    int _1002 = ~_994;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = trunc(_992);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_199;
    int _1016 = _1014 + 1;
    float _1018 = _990 * 0.15915493667125701904296875;
    int _1020 = abs(_958);
    float _1022 = _862 * _836;
    int _1024 = _1006;
    if (!_986)
    {
        int _1026 = ~_994;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    bool _1032 = uint(_952) >= 2u;
    float _1034 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1036 = abs(_1030);
    float _1038 = fma(_924, _846, _996);
    bool _1040 = !_954;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _1000 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    int _1048 = int(_878) + int(_1012);
    int _1050 = _1032 ? 0 : 1;
    float _1052 = float(uint(_1020));
    int _1054 = _1016 * _1048;
    int _1056 = _1054 + _436;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_998)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = 1.0 / _1052;
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    bool _1080 = _952 != 3;
    int _1082 = abs(_1042);
    int _1084 = _1078 * as_type<int>(_940);
    bool _1086 = uint(_1056) >= uint(_199);
    float _1088 = _1000 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    int _1092 = abs(_1070);
    bool _1094 = !_1080;
    int _1096 = _1094 ? 0 : (-1);
    int _1098 = ~_1082;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    bool _1104 = !_1086;
    int _1106 = _1104 ? 0 : (-1);
    float _1108 = float(uint(_958));
    int _1110 = _1102 * as_type<int>(_932);
    int _1112 = _1110 + _1084;
    bool _1114 = !_354;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    int _1120 = ~_1092;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _1108;
    int _1128 = ~_1048;
    int _1130 = _1128 + _1106;
    int _1132 = _1130 + 1;
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _149);
    int _1136 = abs(_1116);
    int _1138 = _1124 * as_type<int>(_976);
    int _1140 = _1138 + _1112;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _199 * _1132;
    int _1150 = _1148 + _436;
    int _1152 = ~_1136;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1018 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1038 * 0.15915493667125701904296875;
    int _1164 = _1146 * as_type<int>(_984);
    int _1166 = _1164 + _1140;
    float _1168 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1170 = !_231;
    int _1172 = _1170 ? _1150 : (-1);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _153);
    int _1176 = _1166 * _1156;
    float _1178 = _1168 * _1134;
    float _1180 = _1018 * 6.283185482025146484375;
    float _1182 = cos(_1180);
    int _1184 = as_type<int>(_1126) + (-2);
    int _1186 = _1172 * _1136;
    int _1188 = _1186 + _1176;
    float _1190 = _1034 * _1174;
    int _1192 = as_type<int>(_1072) + (-2);
    bool _1194 = _189 > 0.5;
    float _1196 = _1162 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = float(uint(_1188));
    float _1202 = _1090 * _1160;
    int _1204 = abs(_1188);
    float _1206 = _1046 * _1160;
    bool _1208 = _191 > 0.5;
    float _1210 = as_type<float>(_1184) * _1200;
    int _1212 = ~_958;
    int _1214 = _1212 + 1;
    float _1216 = _1046 * _1182;
    float _1218 = _1162 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    bool _1222 = _958 == 0;
    float _1224 = -_1202;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1202, _1228);
    float _1232 = trunc(_1210);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _1090 * _1182;
    float _1240 = float(uint(_1204));
    float _1242 = _1160 * _1220;
    float _1244 = _1182 * _1220;
    float _1246 = as_type<float>(_1192) * _1240;
    float _1248 = _1220 * _1190;
    float _1250 = _1198 * _1190;
    float _1252 = fma(_1198, _1238, _1206);
    float _1254 = fma(_1198, _1206, _1238);
    float _1256 = trunc(_1246);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = _1090 * _1248;
    int _1264 = ~_1020;
    int _1266 = _1264 + 1;
    int _1268 = _1214 * int(_1236);
    int _1270 = _1268 + _1188;
    float _1272 = _1046 * _1248;
    float _1274 = fma(_1252, _1178, _1262);
    float _1276 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1278 = -_1250;
    float _1280 = fma(_1244, _1178, _1278);
    float _1282 = fma(_1226, _1178, _1272);
    float _1284 = float(uint(_1270));
    float _1286 = in.m_52.x;
    float _1288 = in.m_52.y;
    float _1290 = in.m_52.z;
    float _1292 = fma(_1230, _1276, _1274);
    float _1294 = fma(_1242, _1276, _1280);
    float _1296 = as_type<float>(_1184) * _1284;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1302 = _1266 * int(_1260);
    int _1304 = _1302 + _1204;
    float _1306 = fma(_1254, _1276, _1282);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1298);
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1300);
    float _1312 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1314 = float(uint(_1304));
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1320 = trunc(_1296);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = as_type<float>(_1192) * _1314;
    float _1330 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1332 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1334 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1338 = _1312 + _1332;
    float _1340 = _1330 + _1334;
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = _504 * _1288;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1338 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1340 + _1354;
    float _1358 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1336);
    float _1360 = fma(_502, _1286, _1348);
    float _1362 = _1352 * _1352;
    float _1364 = _1356 * _1356;
    int _1366 = ~_958;
    int _1368 = _1366 + 1;
    float _1370 = fma(_506, _1290, _1360);
    int _1372 = int(_1236) + int(_1324);
    float _1374 = _1362 + _1364;
    int _1376 = ~_1020;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1382 = _1188 ^ _958;
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1386 = int(_1260) + int(_1346);
    int _1388 = _1368 * _1372;
    int _1390 = _1388 + _1188;
    float _1392 = -_149;
    int _1394 = _1194 ? as_type<int>(_1392) : as_type<int>(_149);
    uint _1396 = uint(int(uint(_1382) >> uint(31)));
    float _1398 = sqrt(_1374);
    int _1400 = _1378 * _1386;
    int _1402 = _1400 + _1204;
    bool _1404 = uint(_1390) >= uint(_958);
    bool _1406 = !_366;
    float _1408 = _1406 ? _149 : as_type<float>(_1394);
    bool _1410 = uint(_1402) >= uint(_1020);
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : (-1);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1418 = !_1410;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = ~_1372;
    int _1426 = _1424 + _1414;
    int _1428 = _1426 + 1;
    int _1430 = ~_1420;
    int _1432 = _1386 + _1430;
    int _1434 = _1432 + 1;
    bool _1436 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1438 = _958 * _1428;
    int _1440 = _1438 + _1188;
    int _1442 = ~int(_1396);
    int _1444 = _1442 + 1;
    float _1446 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1448 = _958 == 0;
    int _1450 = _1434 ^ _1444;
    float _1452 = _1384 + _1446;
    bool _1454 = !_1448;
    float _1456 = _1454 ? as_type<float>(_1440) : as_type<float>(0xffffffffu /* nan */);
    int _1458 = ~_1444;
    int _1460 = _1458 + _1450;
    int _1462 = _1460 + 1;
    float _1464 = float(as_type<int>(_1456));
    float _1466 = as_type<float>(_1204);
    float _1468 = _1446;
    float _1470 = as_type<float>(_1444);
    float _1472 = _1384;
    float _1474 = _1456;
    if (!_1436)
    {
        _1466 = _1364;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (!_1436)
    {
        _1468 = _1362;
    }
    float _1480 = _1468;
    float _1482 = _1480;
    if (!_1436)
    {
        _1470 = _1338;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (!_1436)
    {
        _1472 = _1340;
    }
    float _1488 = _1472;
    float _1490 = _1488;
    if (!_1436)
    {
        _1474 = _1452;
    }
    float _1492 = _1474;
    bool _1494 = !_1436;
    float _1496 = _1492;
    if (!_1494)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1502 = _1398 + _1500;
        float _1504 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = rsqrt(_1374);
        float _1508 = _1502 * _1498;
        float _1510 = _1508 * 0.15915493667125701904296875;
        float _1512 = _1510 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = fma(_1514, _1504, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1506 * _1520;
        float _1524 = _1518 + (-1.0);
        float _1526 = fma(_1352, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1356, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1530 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1534 = _1526 + _1532;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1538 = _1528 + _1536;
        float _1540 = fma(_1452, _1518, _1530);
        float _1542 = _1534 * _1534;
        float _1544 = _1538 * _1538;
        _1496 = _1540;
        _1482 = _1542;
        _1478 = _1544;
        _1486 = _1526;
        _1490 = _1528;
    }
    float _1546 = _1496;
    float _1548 = _1482;
    float _1550 = _1478;
    float _1552 = _1486;
    float _1554 = _1490;
    bool _1556 = !_1222;
    int _1558 = _1556 ? _1462 : (-1);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1562 = _1546 + _1560;
    float _1564 = -_153;
    int _1566 = _1208 ? as_type<int>(_1564) : as_type<int>(_153);
    float _1568 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = float(_1558);
    float _1572 = fma(_1422, _1464, _544);
    bool _1574 = !_444;
    float _1576 = _1574 ? _153 : as_type<float>(_1566);
    float _1578 = _1408 + 0.5;
    float _1580 = fma(_1562, _1562, _1548);
    float _1582 = -_276;
    float _1584 = fma(_1568, _1570, _1582);
    float _1586 = -_840;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1422, _1578, _1572);
    float _1592 = _1576 + (-0.5);
    float _1594 = _1580 + _1550;
    float _1596 = -_1588;
    float _1598 = fma(_1408, _1596, _1590);
    float _1600 = -_1568;
    float _1602 = fma(_1600, _1592, _1584);
    float _1604 = -_822;
    float _1606 = _1604 + 1.0;
    float _1608 = sqrt(_1594);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = fma(_1576, _1606, _1602);
    out.m_54.x = _1622;
    out.m_54.y = _1626;
    out.m_54.z = _1628;
    out.m_54.w = _1624;
    bool _1638 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1640 = isnan(_1608);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1646 = _1642 || _1644;
    out.m_56.x = _1630;
    out.m_56.y = _1632;
    out.m_56.z = _1634;
    out.m_58.x = _1598;
    out.m_58.y = _1636;
    float _1648 = _1616;
    if (!_1646)
    {
        _1648 = 1.0;
    }
    float _1650 = _1648;
    bool _1652 = !_1646;
    float _1654 = _1650;
    if (!_1652)
    {
        bool _1656 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1658 = isnan(_1608);
        bool _1660 = _1656 || _1658;
        bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1664 = _1660 || _1662;
        if (!_1664)
        {
            float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1668 = _1608 + _1666;
            float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1672 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1670;
            float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1678 = 1.0 / _1672;
            float _1680 = _1668 * _1678;
            float _1682 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1654 = _1682;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1688 = isnan(_1608);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1698 = _1608 + _1696;
                float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1702 = _1700 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1708 = 1.0 / _1702;
                float _1710 = _1698 * _1708;
                float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1654 = _1712;
                _1684 = true;
            }
            else
            {
                _1654 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1684 = false;
    float _1714 = _1654;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1546 + _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1722 = _1552 + _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1726 = _1554 + _1724;
    float _1728 = fma(_1718, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1722, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1732 = fma(_1726, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1736);
    float _1746 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1748 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1740);
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1768);
    float _1778 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1782 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1776);
    float _1786 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1778);
    float _1788 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1786);
    float _1798 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    out.m_60.w = _1790;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1798;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _175 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1855 = as_type<float>(_95);
        out.gl_Position.z = _1855;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_37.w;
    bool _101 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_99;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _115 = _113;
    if (_109)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1925 = as_type<float>(_133);
        out.gl_Position.z = _1925;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _139 = as_type<int>(_135) & 1;
    bool _141 = _139 != 0;
    int _143 = as_type<int>(_135) & 2;
    bool _145 = _143 != 0;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_137;
    float _173;
    if (!_155)
    {
        float _157 = in.m_42.x;
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _163 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _165 = _163 * _159;
        float _167 = floor(_165);
        float _169 = -_167;
        float _171 = _165 + _169;
        _173 = _171;
        _175 = true;
    }
    else
    {
        float _177 = float(_79);
        float _179 = 1.0 / _177;
        float _181 = _113 * _179;
        _173 = _181;
    }
    _175 = false;
    float _183 = _173;
    float _185 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _187 = int(_185);
    float _189 = in.m_42.x;
    float _191 = in.m_42.y;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _195 = _193 != 0;
    float _197 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _199 = int(_197);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_195)
    {
        _205 = 1.0;
    }
    float _207 = _205;
    float _209 = float(_187);
    float _211 = _207;
    if (!_195)
    {
        _211 = 7.345489978790283203125;
    }
    float _213 = _211;
    float _215 = 1.0 / _203;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _219 = float(uint(_199));
    float _221 = _189 * 2.0;
    float _223 = 1.0 / _209;
    int _225 = ~_199;
    int _227 = _225 + 1;
    float _229 = _191 * 2.0;
    bool _231 = _199 == 0;
    float _233 = _191 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _235 = ~_199;
    int _237 = _235 + 1;
    float _239 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].z, _217);
    float _241 = 1.0 / _219;
    float _243 = _223 * _113;
    float _245 = floor(_221);
    int _247 = as_type<int>(_241) + (-2);
    float _249 = trunc(_243);
    int _251 = int(_249);
    float _253 = floor(_229);
    float _255 = float(uint(_251));
    float _257 = float(_251);
    float _259 = as_type<float>(_247) * _255;
    float _261 = trunc(_259);
    float _263 = precise::max(_261, 0.0);
    uint _266 = uint(_263);
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _270 = fma(_233, -2.0, _268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _183 + _272;
    float _276 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _270);
    int _278 = _227 * int(_266);
    int _280 = _278 + _251;
    float _282 = float(uint(_280));
    int _284 = ~_199;
    int _286 = _284 + 1;
    float _288 = as_type<float>(_247) * _282;
    float _290 = trunc(_288);
    float _292 = precise::max(_290, 0.0);
    uint _294 = uint(_292);
    int _296 = int(_266) + int(_294);
    float _298 = float(_199);
    float _300 = float(_79);
    bool _302 = _257 >= _298;
    bool _304 = isnan(_257);
    bool _306 = _302 || _304;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    int _314 = _286 * _296;
    int _316 = _314 + _251;
    float _318 = _189 * _213;
    float _320 = 1.0 / _300;
    bool _322 = uint(_316) >= uint(_199);
    bool _324 = !_322;
    int _326 = _324 ? 0 : (-1);
    float _328 = floor(_318);
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _336 = _334 != 0;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _340 = _338 != 0;
    int _342 = ~_296;
    int _344 = _342 + _326;
    int _346 = _344 + 1;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _350 = _348 != 0;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _354 = _352 != 0;
    float _356 = trunc(_312);
    int _358 = int(_356);
    int _360 = _199 * _346;
    int _362 = _360 + _251;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    bool _368 = !_231;
    int _370 = _368 ? _362 : (-1);
    float _372 = -_328;
    float _374 = _318 + _372;
    int _376 = _199 + (-1);
    float _378 = _374 * _298;
    float _380 = _298 * _113;
    bool _382 = !_350;
    int _384 = _382 ? 0 : 1;
    int _386 = ~_358;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = _380 * _320;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _396 = _394 != 0;
    int _398 = abs(_384);
    int _400 = _370 * _390;
    float _402 = trunc(_378);
    int _404 = int(_402);
    int _406 = _358 * _376;
    int _408 = _406 + _400;
    bool _410 = !_336;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_332;
    int _416 = _414 ? 0 : 1;
    int _418 = abs(_412);
    float _420 = trunc(_392);
    int _422 = int(_420);
    bool _424 = !_340;
    int _426 = _424 ? 0 : 1;
    int _428 = abs(_416);
    int _430 = _408 * _418;
    int _432 = abs(_426);
    int _434 = _404 * _398;
    int _436 = _434 + _251;
    bool _438 = !_396;
    int _440 = _438 ? 0 : 1;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _444 = _442 != 0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _450 = abs(_440);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _245 >= 0.0;
    bool _458 = isnan(_245);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _422 * _428;
    int _468 = _466 + _430;
    bool _470 = _245 > 0.0;
    bool _472 = _253 > 0.0;
    int _474 = _436 * _432;
    int _476 = _474 + _468;
    float _478 = in.m_44.x;
    float _480 = in.m_44.y;
    float _482 = in.m_44.z;
    float _484 = 1.0 / _448;
    int _486 = _404 * _450;
    int _488 = _486 + _476;
    float _490 = in.m_46.x;
    float _492 = in.m_46.y;
    float _494 = in.m_46.z;
    float _496 = float(uint(_488));
    float _498 = _454 * _113;
    float _500 = as_type<float>(_247) * _496;
    float _502 = in.m_32.x;
    float _504 = in.m_32.y;
    float _506 = in.m_32.z;
    float _508 = exp2(_498);
    float _510 = _274 * _484;
    float _512 = trunc(_500);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = -_508;
    float _520 = _518 + 1.0;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _504 * _480;
    int _526 = _237 * int(_516);
    int _528 = _526 + _488;
    float _530 = -_522;
    float _532 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[77].x, _530);
    float _534 = float(uint(_528));
    float _536 = _504 * _492;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _540 = _183 + _538;
    float _542 = -_113;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _546 = as_type<float>(_247) * _534;
    float _548 = _540 * _215;
    float _550 = in.m_42.z;
    float _552 = trunc(_546);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = fma(_502, _490, _536);
    float _560 = fma(_502, _478, _524);
    int _562 = _464 ? 0 : 1;
    int _564 = ~_199;
    int _566 = _564 + 1;
    float _568 = fma(_506, _494, _558);
    bool _570 = _253 >= 0.0;
    bool _572 = isnan(_253);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = fma(_506, _482, _560);
    int _582 = int(_516) + int(_556);
    int _584 = _578 ? 0 : 1;
    int _586 = ~_562;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = _550 * 2.0;
    int _594 = _566 * _582;
    int _596 = _594 + _488;
    int _598 = ~_584;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    int _604 = _590;
    int _606 = _602;
    if (!_470)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _191 + _189;
    float _616 = floor(_592);
    if (!_472)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _606 = _620;
    }
    int _622 = _606;
    bool _624 = uint(_596) >= uint(_199);
    float _626 = _191 + _550;
    float _628 = _614 + (-1.0);
    bool _630 = !_624;
    int _632 = _630 ? 0 : (-1);
    float _634 = _626 + (-1.0);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _646 = _644 != 0;
    float _648 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = _550 + _189;
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = _550 + (-0.5);
    bool _656 = !_642;
    int _658 = _656 ? 0 : 1;
    float _660 = _650 + (-1.0);
    bool _662 = _616 >= 0.0;
    bool _664 = isnan(_616);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _672;
    int _676 = _670 ? 0 : 1;
    bool _678 = _616 > 0.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _680;
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = fma(_674, _548, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _692 = fma(_682, _548, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_183);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_690, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _712 = ~_676;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = fma(_696, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _720 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_183);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = _716;
    if (!_678)
    {
        int _734 = ~_676;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    bool _744 = _183 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_183);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _730 * _742;
    float _758 = -_730;
    float _760 = _758 + 1.0;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    float _776 = _754 * _760;
    float _778 = _770 ? _520 : 0.0;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    float _784 = 1.0 / _774;
    float _786 = _686 * _776;
    float _788 = _692 * _776;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _792 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _794 = isnan(1.0);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _800 = _796 || _798;
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _786);
    float _804 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _788);
    int _806 = ~_582;
    int _808 = _806 + _632;
    int _810 = _808 + 1;
    float _812 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].w, _790);
    float _814 = fma(_718, _756, _802);
    float _816 = fma(_710, _756, _804);
    bool _818 = !_646;
    int _820 = _818 ? 0 : 1;
    float _822 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    bool _824 = !_638;
    int _826 = _824 ? 0 : 1;
    int _828 = _199 * _810;
    int _830 = _828 + _488;
    int _832 = abs(_658);
    float _834 = in.m_48.x;
    float _836 = in.m_48.y;
    int _838 = abs(_820);
    float _840 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _239);
    int _842 = abs(_826);
    if (_800)
    {
        float _844 = _778 * _784;
        _115 = _844;
    }
    float _846 = _115;
    float _848 = in.m_50.x;
    float _850 = in.m_50.y;
    float _852 = in.m_50.z;
    float _854 = float(uint(_436));
    float _856 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].x, _814);
    bool _858 = !_231;
    int _860 = _858 ? _830 : (-1);
    float _862 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[145].y, _816);
    float _864 = float(_612);
    float _866 = as_type<float>(_247) * _854;
    float _868 = float(_842);
    float _870 = float(_738);
    int _872 = _860 >> 31;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = float(_622);
    float _882 = _868 * _870;
    int _884 = _872 & 3;
    float _886 = float(_832);
    float _888 = float(_838);
    float _890 = _856 * _834;
    int _892 = _860 + _884;
    float _894 = _882 * (-2.0);
    float _896 = _886 * _864;
    float _898 = _888 * _880;
    int _900 = _892 >> 2;
    float _902 = fma(_894, _848, _848);
    float _904 = _896 * (-2.0);
    float _906 = fma(_648, _894, _648);
    float _908 = _898 * (-2.0);
    int _910 = _900 << 4;
    int _912 = _910 + 368;
    float _914 = fma(_652, _904, _652);
    float _916 = fma(_904, _850, _850);
    int _918 = ~_199;
    int _920 = _918 + 1;
    float _922 = _189 + (-0.5);
    float _924 = fma(_684, _908, _684);
    uint _926 = uint(int(uint(_912) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = fma(_908, _852, _852);
    float _944 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _902);
    int _946 = _920 * int(_878);
    int _948 = _946 + _436;
    float _950 = _191 + (-0.5);
    int _952 = _860 & 3;
    bool _954 = _952 != 0;
    float _956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _958 = int(_956);
    int _960 = _860 & 3;
    bool _962 = _960 != 0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _916);
    float _966 = float(uint(_948));
    int _968 = _912 + 8;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    bool _986 = uint(_952) > 1u;
    float _988 = fma(_906, _846, _944);
    float _990 = fma(_914, _846, _964);
    float _992 = as_type<float>(_247) * _966;
    int _994 = _962 ? 0 : 1;
    float _996 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    bool _998 = _952 != 3;
    float _1000 = _988 * 0.15915493667125701904296875;
    int _1002 = ~_994;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = trunc(_992);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_199;
    int _1016 = _1014 + 1;
    float _1018 = _990 * 0.15915493667125701904296875;
    int _1020 = abs(_958);
    float _1022 = _862 * _836;
    int _1024 = _1006;
    if (!_986)
    {
        int _1026 = ~_994;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    bool _1032 = uint(_952) >= 2u;
    float _1034 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1036 = abs(_1030);
    float _1038 = fma(_924, _846, _996);
    bool _1040 = !_954;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _1000 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    int _1048 = int(_878) + int(_1012);
    int _1050 = _1032 ? 0 : 1;
    float _1052 = float(uint(_1020));
    int _1054 = _1016 * _1048;
    int _1056 = _1054 + _436;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_998)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = 1.0 / _1052;
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    bool _1080 = _952 != 3;
    int _1082 = abs(_1042);
    int _1084 = _1078 * as_type<int>(_940);
    bool _1086 = uint(_1056) >= uint(_199);
    float _1088 = _1000 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    int _1092 = abs(_1070);
    bool _1094 = !_1080;
    int _1096 = _1094 ? 0 : (-1);
    int _1098 = ~_1082;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    bool _1104 = !_1086;
    int _1106 = _1104 ? 0 : (-1);
    float _1108 = float(uint(_958));
    int _1110 = _1102 * as_type<int>(_932);
    int _1112 = _1110 + _1084;
    bool _1114 = !_354;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    int _1120 = ~_1092;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _1108;
    int _1128 = ~_1048;
    int _1130 = _1128 + _1106;
    int _1132 = _1130 + 1;
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _149);
    int _1136 = abs(_1116);
    int _1138 = _1124 * as_type<int>(_976);
    int _1140 = _1138 + _1112;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _199 * _1132;
    int _1150 = _1148 + _436;
    int _1152 = ~_1136;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1018 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1038 * 0.15915493667125701904296875;
    int _1164 = _1146 * as_type<int>(_984);
    int _1166 = _1164 + _1140;
    float _1168 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1170 = !_231;
    int _1172 = _1170 ? _1150 : (-1);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _153);
    int _1176 = _1166 * _1156;
    float _1178 = _1168 * _1134;
    float _1180 = _1018 * 6.283185482025146484375;
    float _1182 = cos(_1180);
    int _1184 = as_type<int>(_1126) + (-2);
    int _1186 = _1172 * _1136;
    int _1188 = _1186 + _1176;
    float _1190 = _1034 * _1174;
    int _1192 = as_type<int>(_1072) + (-2);
    bool _1194 = _189 > 0.5;
    float _1196 = _1162 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = float(uint(_1188));
    float _1202 = _1090 * _1160;
    int _1204 = abs(_1188);
    float _1206 = _1046 * _1160;
    bool _1208 = _191 > 0.5;
    float _1210 = as_type<float>(_1184) * _1200;
    int _1212 = ~_958;
    int _1214 = _1212 + 1;
    float _1216 = _1046 * _1182;
    float _1218 = _1162 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    bool _1222 = _958 == 0;
    float _1224 = -_1202;
    float _1226 = fma(_1198, _1216, _1224);
    float _1228 = -_1216;
    float _1230 = fma(_1198, _1202, _1228);
    float _1232 = trunc(_1210);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _1090 * _1182;
    float _1240 = float(uint(_1204));
    float _1242 = _1160 * _1220;
    float _1244 = _1182 * _1220;
    float _1246 = as_type<float>(_1192) * _1240;
    float _1248 = _1220 * _1190;
    float _1250 = _1198 * _1190;
    float _1252 = fma(_1198, _1238, _1206);
    float _1254 = fma(_1198, _1206, _1238);
    float _1256 = trunc(_1246);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = _1090 * _1248;
    int _1264 = ~_1020;
    int _1266 = _1264 + 1;
    int _1268 = _1214 * int(_1236);
    int _1270 = _1268 + _1188;
    float _1272 = _1046 * _1248;
    float _1274 = fma(_1252, _1178, _1262);
    float _1276 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1278 = -_1250;
    float _1280 = fma(_1244, _1178, _1278);
    float _1282 = fma(_1226, _1178, _1272);
    float _1284 = float(uint(_1270));
    float _1286 = in.m_52.x;
    float _1288 = in.m_52.y;
    float _1290 = in.m_52.z;
    float _1292 = fma(_1230, _1276, _1274);
    float _1294 = fma(_1242, _1276, _1280);
    float _1296 = as_type<float>(_1184) * _1284;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1302 = _1266 * int(_1260);
    int _1304 = _1302 + _1204;
    float _1306 = fma(_1254, _1276, _1282);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1298);
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1300);
    float _1312 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1314 = float(uint(_1304));
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1320 = trunc(_1296);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = as_type<float>(_1192) * _1314;
    float _1330 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1332 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1334 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1338 = _1312 + _1332;
    float _1340 = _1330 + _1334;
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = _504 * _1288;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1352 = _1338 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1356 = _1340 + _1354;
    float _1358 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1336);
    float _1360 = fma(_502, _1286, _1348);
    float _1362 = _1352 * _1352;
    float _1364 = _1356 * _1356;
    int _1366 = ~_958;
    int _1368 = _1366 + 1;
    float _1370 = fma(_506, _1290, _1360);
    int _1372 = int(_1236) + int(_1324);
    float _1374 = _1362 + _1364;
    int _1376 = ~_1020;
    int _1378 = _1376 + 1;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1382 = _1188 ^ _958;
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1386 = int(_1260) + int(_1346);
    int _1388 = _1368 * _1372;
    int _1390 = _1388 + _1188;
    float _1392 = -_149;
    int _1394 = _1194 ? as_type<int>(_1392) : as_type<int>(_149);
    uint _1396 = uint(int(uint(_1382) >> uint(31)));
    float _1398 = sqrt(_1374);
    int _1400 = _1378 * _1386;
    int _1402 = _1400 + _1204;
    bool _1404 = uint(_1390) >= uint(_958);
    bool _1406 = !_366;
    float _1408 = _1406 ? _149 : as_type<float>(_1394);
    bool _1410 = uint(_1402) >= uint(_1020);
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : (-1);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1418 = !_1410;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = ~_1372;
    int _1426 = _1424 + _1414;
    int _1428 = _1426 + 1;
    int _1430 = ~_1420;
    int _1432 = _1386 + _1430;
    int _1434 = _1432 + 1;
    bool _1436 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1438 = _958 * _1428;
    int _1440 = _1438 + _1188;
    int _1442 = ~int(_1396);
    int _1444 = _1442 + 1;
    float _1446 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1448 = _958 == 0;
    int _1450 = _1434 ^ _1444;
    float _1452 = _1384 + _1446;
    bool _1454 = !_1448;
    float _1456 = _1454 ? as_type<float>(_1440) : as_type<float>(0xffffffffu /* nan */);
    int _1458 = ~_1444;
    int _1460 = _1458 + _1450;
    int _1462 = _1460 + 1;
    float _1464 = float(as_type<int>(_1456));
    float _1466 = as_type<float>(_1204);
    float _1468 = _1446;
    float _1470 = as_type<float>(_1444);
    float _1472 = _1384;
    float _1474 = _1456;
    if (!_1436)
    {
        _1466 = _1364;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (!_1436)
    {
        _1468 = _1362;
    }
    float _1480 = _1468;
    float _1482 = _1480;
    if (!_1436)
    {
        _1470 = _1338;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (!_1436)
    {
        _1472 = _1340;
    }
    float _1488 = _1472;
    float _1490 = _1488;
    if (!_1436)
    {
        _1474 = _1452;
    }
    float _1492 = _1474;
    bool _1494 = !_1436;
    float _1496 = _1492;
    if (!_1494)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1502 = _1398 + _1500;
        float _1504 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = rsqrt(_1374);
        float _1508 = _1502 * _1498;
        float _1510 = _1508 * 0.15915493667125701904296875;
        float _1512 = _1510 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        float _1520 = fma(_1514, _1504, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1506 * _1520;
        float _1524 = _1518 + (-1.0);
        float _1526 = fma(_1352, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1356, _1522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1530 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1534 = _1526 + _1532;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1538 = _1528 + _1536;
        float _1540 = fma(_1452, _1518, _1530);
        float _1542 = _1534 * _1534;
        float _1544 = _1538 * _1538;
        _1496 = _1540;
        _1482 = _1542;
        _1478 = _1544;
        _1486 = _1526;
        _1490 = _1528;
    }
    float _1546 = _1496;
    float _1548 = _1482;
    float _1550 = _1478;
    float _1552 = _1486;
    float _1554 = _1490;
    bool _1556 = !_1222;
    int _1558 = _1556 ? _1462 : (-1);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1562 = _1546 + _1560;
    float _1564 = -_153;
    int _1566 = _1208 ? as_type<int>(_1564) : as_type<int>(_153);
    float _1568 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = float(_1558);
    float _1572 = fma(_1422, _1464, _544);
    bool _1574 = !_444;
    float _1576 = _1574 ? _153 : as_type<float>(_1566);
    float _1578 = _1408 + 0.5;
    float _1580 = fma(_1562, _1562, _1548);
    float _1582 = -_276;
    float _1584 = fma(_1568, _1570, _1582);
    float _1586 = -_840;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1422, _1578, _1572);
    float _1592 = _1576 + (-0.5);
    float _1594 = _1580 + _1550;
    float _1596 = -_1588;
    float _1598 = fma(_1408, _1596, _1590);
    float _1600 = -_1568;
    float _1602 = fma(_1600, _1592, _1584);
    float _1604 = -_822;
    float _1606 = _1604 + 1.0;
    float _1608 = sqrt(_1594);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1630 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = fma(_1576, _1606, _1602);
    out.m_54.x = _1622;
    out.m_54.y = _1626;
    out.m_54.z = _1628;
    out.m_54.w = _1624;
    bool _1638 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1640 = isnan(_1608);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1646 = _1642 || _1644;
    out.m_56.x = _1630;
    out.m_56.y = _1632;
    out.m_56.z = _1634;
    out.m_58.x = _1598;
    out.m_58.y = _1636;
    float _1648 = _1616;
    if (!_1646)
    {
        _1648 = 1.0;
    }
    float _1650 = _1648;
    bool _1652 = !_1646;
    float _1654 = _1650;
    if (!_1652)
    {
        bool _1656 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1658 = isnan(_1608);
        bool _1660 = _1656 || _1658;
        bool _1662 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1664 = _1660 || _1662;
        if (!_1664)
        {
            float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1668 = _1608 + _1666;
            float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1672 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1670;
            float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1678 = 1.0 / _1672;
            float _1680 = _1668 * _1678;
            float _1682 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1654 = _1682;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1688 = isnan(_1608);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1698 = _1608 + _1696;
                float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1702 = _1700 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1706 = _1704 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1708 = 1.0 / _1702;
                float _1710 = _1698 * _1708;
                float _1712 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1654 = _1712;
                _1684 = true;
            }
            else
            {
                _1654 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1684 = false;
    float _1714 = _1654;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1546 + _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1722 = _1552 + _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1726 = _1554 + _1724;
    float _1728 = fma(_1718, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1722, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1732 = fma(_1726, _1714, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_35.x = 1.0;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1740 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1734);
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1736);
    float _1746 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    float _1748 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1740);
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1776 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1768);
    float _1778 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1782 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1776);
    float _1786 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1778);
    float _1788 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1796 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1786);
    float _1798 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    out.m_60.w = _1790;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1798;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

