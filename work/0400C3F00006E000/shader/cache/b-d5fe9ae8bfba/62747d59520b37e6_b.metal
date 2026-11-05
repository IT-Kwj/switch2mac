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
    float4 m_52 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_56 [[attribute(0)]];
    float4 m_42 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_40 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1875 = as_type<float>(_97);
        out.gl_Position.z = _1875;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_35.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = _115;
    if (_111)
    {
        float _121 = float(_81);
        _117 = _121;
    }
    float _123 = _117;
    bool _125 = _115 >= _123;
    bool _127 = !_111;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_33.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_135);
        out.gl_Position.z = _1944;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_40.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_81);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _189 = int(_187);
    float _191 = in.m_40.x;
    float _193 = in.m_40.y;
    float _195 = float(_81);
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _203 = int(_201);
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _209 = 1.0;
    }
    float _211 = _209;
    float _213 = float(_189);
    float _215 = _211;
    if (!_199)
    {
        _215 = 7.345489978790283203125;
    }
    float _217 = _215;
    float _219 = 1.0 / _195;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = float(uint(_203));
    float _243 = 1.0 / _213;
    int _245 = ~_203;
    int _247 = _245 + 1;
    float _249 = _193 * 2.0;
    float _251 = float(_203);
    float _253 = _191 * 2.0;
    bool _255 = _203 == 0;
    float _257 = -_239;
    float _259 = _257 + 1.0;
    int _261 = ~_203;
    int _263 = _261 + 1;
    float _265 = 1.0 / _241;
    float _267 = _243 * _115;
    float _269 = 1.0 / _207;
    out.m_33.x = 1.0;
    int _271 = as_type<int>(_265) + (-2);
    float _273 = trunc(_267);
    int _275 = int(_273);
    float _277 = 1.0 / _223;
    float _279 = float(uint(_275));
    float _281 = floor(_253);
    float _283 = as_type<float>(_271) * _279;
    float _285 = trunc(_283);
    float _287 = precise::max(_285, 0.0);
    uint _290 = uint(_287);
    float _292 = floor(_249);
    int _294 = ~_203;
    int _296 = _294 + 1;
    int _298 = _247 * int(_290);
    int _300 = _298 + _275;
    float _302 = 1.0 / _227;
    float _304 = float(uint(_300));
    float _306 = as_type<float>(_271) * _304;
    float _308 = _191 * _217;
    float _310 = trunc(_306);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    float _316 = floor(_308);
    int _318 = int(_290) + int(_314);
    float _320 = float(_275);
    int _322 = _296 * _318;
    int _324 = _322 + _275;
    bool _326 = _320 >= _251;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan(_251);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_316;
    float _340 = _308 + _338;
    bool _342 = uint(_324) >= uint(_203);
    float _344 = _340 * _251;
    float _346 = trunc(_336);
    int _348 = int(_346);
    float _350 = _251 * _115;
    bool _352 = !_342;
    int _354 = _352 ? 0 : (-1);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _358 = _356 != 0;
    int _360 = ~_318;
    int _362 = _360 + _354;
    int _364 = _362 + 1;
    float _366 = trunc(_344);
    int _368 = int(_366);
    bool _370 = !_358;
    int _372 = _370 ? 0 : 1;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    int _386 = abs(_372);
    int _388 = _203 * _364;
    int _390 = _388 + _275;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _394 = _392 != 0;
    float _396 = _350 * _219;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    int _404 = ~_348;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    bool _410 = !_255;
    int _412 = _410 ? _390 : (-1);
    float _414 = trunc(_396);
    int _416 = int(_414);
    int _418 = _368 * _386;
    int _420 = _418 + _275;
    bool _422 = !_376;
    int _424 = _422 ? 0 : 1;
    int _426 = _412 * _408;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    int _432 = _203 + (-1);
    int _434 = abs(_430);
    bool _436 = !_384;
    int _438 = _436 ? 0 : 1;
    int _440 = _348 * _432;
    int _442 = _440 + _426;
    int _444 = abs(_424);
    int _446 = abs(_438);
    int _448 = _442 * _434;
    bool _450 = !_394;
    int _452 = _450 ? 0 : 1;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _456 = _454 != 0;
    int _458 = _416 * _444;
    int _460 = _458 + _448;
    int _462 = abs(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = _420 * _446;
    int _470 = _468 + _460;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _474 = _472 != 0;
    float _476 = in.m_40.z;
    int _478 = _368 * _462;
    int _480 = _478 + _470;
    bool _482 = _281 >= 0.0;
    bool _484 = isnan(_281);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = in.m_30.x;
    float _494 = in.m_30.y;
    float _496 = in.m_30.z;
    bool _498 = _292 > 0.0;
    float _500 = float(uint(_480));
    float _502 = in.m_44.x;
    float _504 = in.m_44.y;
    float _506 = in.m_44.z;
    bool _508 = _281 > 0.0;
    float _510 = as_type<float>(_271) * _500;
    float _512 = in.m_46.x;
    float _514 = in.m_46.y;
    float _516 = in.m_46.z;
    float _518 = trunc(_510);
    float _520 = precise::max(_518, 0.0);
    uint _522 = uint(_520);
    float _524 = _494 * _400;
    float _526 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _528 = _494 * _504;
    int _530 = _263 * int(_522);
    int _532 = _530 + _480;
    float _534 = fma(_492, _502, _528);
    float _536 = _494 * _514;
    float _538 = float(uint(_532));
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _546 = _185 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _550 = _185 + _548;
    float _552 = as_type<float>(_271) * _538;
    float _554 = fma(_526, -2.0, _542);
    float _556 = fma(_492, _398, _524);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = _185 + _558;
    float _562 = _546 * _277;
    int _564 = ~_203;
    int _566 = _564 + 1;
    float _568 = trunc(_552);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    float _574 = _560 * _269;
    float _576 = fma(_496, _402, _556);
    float _578 = _550 * _302;
    float _580 = -_540;
    float _582 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[77].x, _580);
    int _584 = _490 ? 0 : 1;
    float _586 = _476 * 2.0;
    bool _588 = _292 >= 0.0;
    bool _590 = isnan(_292);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = fma(_492, _512, _536);
    float _604 = _193 + _191;
    float _606 = fma(_496, _506, _534);
    int _608 = ~_584;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = _604 + (-1.0);
    int _616 = _612;
    if (!_508)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = floor(_586);
    int _626 = int(_522) + int(_572);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _630 = _596 ? 0 : 1;
    float _632 = fma(_496, _516, _602);
    int _634 = _566 * _626;
    int _636 = _634 + _480;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = _600 * _115;
    int _646 = _642;
    if (!_498)
    {
        int _648 = ~_630;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = _476 + _191;
    bool _656 = uint(_636) >= uint(_203);
    float _658 = _193 + _476;
    float _660 = _654 + (-1.0);
    bool _662 = !_656;
    int _664 = _662 ? 0 : (-1);
    float _666 = _658 + (-1.0);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _682 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _684 = isnan(_185);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _696 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_185);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = exp2(_644);
    bool _710 = !_674;
    int _712 = _710 ? 0 : 1;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _718 = _624 >= 0.0;
    bool _720 = isnan(_624);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_185);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _259;
    int _746 = _726 ? 0 : 1;
    float _748 = -_692;
    float _750 = _748 + 1.0;
    bool _752 = _624 > 0.0;
    float _754 = _742 * _730;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _756;
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _764;
    float _768 = fma(_716, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _770 = fma(_758, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _772 = _239 * _762;
    float _774 = fma(_766, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _780 = _770 * _744;
    float _782 = _774 * _744;
    float _784 = fma(_778, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _786 = -_708;
    float _788 = _786 + 1.0;
    int _790 = ~_746;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _780);
    int _798 = _794;
    if (!_752)
    {
        int _800 = ~_746;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _806;
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _814 = 1.0 + _812;
    bool _816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _574, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _828 = fma(_784, _772, _810);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _830;
    float _834 = 1.0 / _814;
    float _836 = _824 ? _788 : 0.0;
    float _838 = fma(_826, _754, _828);
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_832, _574, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _852 = fma(_768, _772, _796);
    float _854 = float(uint(_420));
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _862 = ~_626;
    int _864 = _862 + _664;
    int _866 = _864 + 1;
    float _868 = fma(_850, _754, _852);
    float _870 = as_type<float>(_271) * _854;
    float _872 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _856);
    float _874 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    int _876 = _203 * _866;
    int _878 = _876 + _480;
    float _880 = -_115;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    bool _884 = !_670;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _890 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _892 = trunc(_870);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    if (_848)
    {
        float _898 = _836 * _834;
        _119 = _898;
    }
    float _900 = _119;
    bool _902 = !_678;
    int _904 = _902 ? 0 : 1;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    int _912 = abs(_886);
    float _914 = _476 + (-0.5);
    int _916 = abs(_712);
    float _918 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _920 = abs(_904);
    float _922 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _924 = ~_203;
    int _926 = _924 + 1;
    float _928 = float(_622);
    float _930 = float(_912);
    float _932 = float(_804);
    float _934 = float(_916);
    float _936 = float(_652);
    float _938 = _930 * _932;
    bool _940 = !_255;
    int _942 = _940 ? _878 : (-1);
    float _944 = _934 * _928;
    float _946 = float(_920);
    float _948 = _938 * (-2.0);
    float _950 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _868);
    int _952 = _942 >> 31;
    float _954 = _946 * _936;
    float _956 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    int _958 = _926 * int(_896);
    int _960 = _958 + _420;
    int _962 = _952 & 3;
    float _964 = fma(_628, _948, _628);
    int _966 = _942 & 3;
    bool _968 = _966 != 0;
    float _970 = _954 * (-2.0);
    float _972 = float(uint(_960));
    float _974 = fma(_948, _906, _906);
    int _976 = _942 + _962;
    float _978 = _944 * (-2.0);
    bool _980 = _191 > 0.5;
    float _982 = as_type<float>(_271) * _972;
    int _984 = _976 >> 2;
    float _986 = _191 + (-0.5);
    int _988 = _968 ? 0 : 1;
    float _990 = trunc(_982);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = _984 << 4;
    int _998 = _996 + 368;
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    int _1002 = _942 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_680, _970, _680);
    uint _1008 = uint(int(uint(_998) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    float _1024 = fma(_964, _900, _1000);
    bool _1026 = uint(_1002) > 1u;
    float _1028 = fma(_694, _978, _694);
    float _1030 = fma(_978, _908, _908);
    int _1032 = ~_988;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    float _1038 = in.m_50.x;
    float _1040 = in.m_50.y;
    float _1042 = _1024 * 0.15915493667125701904296875;
    int _1044 = _998 + 8;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[int(_1056)][_1058];
    float _1062 = fma(_970, _910, _910);
    float _1064 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1066 = int(_1064);
    int _1068 = int(_896) + int(_994);
    int _1070 = ~_203;
    int _1072 = _1070 + 1;
    float _1074 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    int _1076 = _1036;
    if (!_1026)
    {
        int _1078 = ~_988;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = _1002 != 3;
    int _1086 = _1072 * _1068;
    int _1088 = _1086 + _420;
    bool _1090 = !_1004;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_1006, _900, _1074);
    bool _1096 = !_1084;
    int _1098 = _1096 ? 0 : (-1);
    bool _1100 = uint(_1088) >= uint(_203);
    bool _1102 = uint(_1002) >= 2u;
    bool _1104 = !_1100;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = _1002 != 3;
    float _1110 = _950 * _1038;
    int _1112 = _1102 ? 0 : 1;
    float _1114 = _956 * _1040;
    bool _1116 = _193 > 0.5;
    float _1118 = _193 + (-0.5);
    int _1120 = abs(_1082);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1124 = ~_1112;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = ~_1068;
    int _1138 = _1136 + _1106;
    int _1140 = _1138 + 1;
    float _1142 = fma(_1028, _900, _1130);
    int _1144 = _1128;
    if (_1108)
    {
        int _1146 = ~_1112;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1154 = ~_1120;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1142 * 0.15915493667125701904296875;
    int _1162 = abs(_1092);
    float _1164 = _1042 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = abs(_1150);
    int _1170 = _1158 * as_type<int>(_1022);
    bool _1172 = !_456;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _203 * _1140;
    int _1178 = _1176 + _420;
    int _1180 = abs(_1098);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1184 = ~_1162;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1122 * _1182;
    int _1196 = abs(_1174);
    int _1198 = _1188 * as_type<int>(_1014);
    int _1200 = _1198 + _1170;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    int _1204 = ~_1168;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = _1160 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    int _1214 = abs(_1066);
    float _1216 = _1094 * 0.15915493667125701904296875;
    int _1218 = _1208 * as_type<int>(_1052);
    int _1220 = _1218 + _1200;
    int _1222 = ~_1180;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1152 * _1202;
    float _1230 = float(uint(_1214));
    float _1232 = _1216 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    int _1236 = ~_1196;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _1226 * as_type<int>(_1060);
    int _1244 = _1242 + _1220;
    bool _1246 = !_255;
    int _1248 = _1246 ? _1178 : (-1);
    float _1250 = float(uint(_1066));
    int _1252 = _1244 * _1240;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1262 = _1258 || _1260;
    float _1264 = 1.0 / _1230;
    float _1266 = _1134 * _1212;
    int _1268 = _1248 * _1196;
    int _1270 = _1268 + _1252;
    float _1272 = _1166 * _1192;
    float _1274 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1276 = -_151;
    int _1278 = _980 ? as_type<int>(_1276) : as_type<int>(_151);
    int _1280 = abs(_1270);
    float _1282 = _1216 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = -_1272;
    float _1288 = fma(_1234, _1266, _1286);
    bool _1290 = !_466;
    float _1292 = _1290 ? _151 : as_type<float>(_1278);
    int _1294 = ~_1066;
    int _1296 = _1294 + 1;
    float _1298 = -_155;
    float _1300 = _1116 ? _1298 : _155;
    float _1302 = 1.0 / _1250;
    float _1304 = -_1266;
    float _1306 = fma(_1234, _1272, _1304);
    float _1308 = _1134 * _1192;
    int _1310 = as_type<int>(_1264) + (-2);
    float _1312 = float(uint(_1280));
    float _1314 = _1212 * _1284;
    float _1316 = _1284 * _1228;
    float _1318 = _1166 * _1212;
    float _1320 = _1192 * _1284;
    float _1322 = _1234 * _1228;
    float _1324 = _1166 * _1316;
    float _1326 = as_type<float>(_1310) * _1312;
    float _1328 = fma(_1234, _1318, _1308);
    float _1330 = -_1322;
    float _1332 = fma(_1314, _1194, _1330);
    float _1334 = _1134 * _1316;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1328, _1194, _1324);
    int _1344 = as_type<int>(_1302) + (-2);
    float _1346 = fma(_1234, _1308, _1318);
    float _1348 = float(uint(_1270));
    float _1350 = fma(_1306, _1274, _1342);
    float _1352 = fma(_1288, _1194, _1334);
    float _1354 = fma(_1320, _1274, _1332);
    int _1356 = ~_1066;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1344) * _1348;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1364 = fma(_1346, _1274, _1352);
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = trunc(_1360);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1362);
    float _1376 = _576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1378 = ~int(_1340);
    int _1380 = _1378 + 1;
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1386 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1382);
    int _1390 = _1380 * _1214;
    int _1392 = _1390 + _1280;
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _918 + _1394;
    float _1400 = float(uint(_1392));
    int _1402 = _1358 * int(_1372);
    int _1404 = _1402 + _1270;
    float _1406 = _1376 + _1396;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1410 = _1398 + _1408;
    float _1412 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1414 = as_type<float>(_1310) * _1400;
    float _1416 = float(uint(_1404));
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1406 + _1418;
    float _1422 = _1410 * _1410;
    float _1424 = trunc(_1414);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1344) * _1416;
    float _1432 = fma(_1420, _1420, _1422);
    float _1434 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1412);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1438 = sqrt(_1432);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = trunc(_1430);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _922 + _1448;
    bool _1464 = !_474;
    float _1466 = _1464 ? _155 : _1300;
    out.m_52.x = _1450;
    out.m_52.y = _1452;
    out.m_52.z = _1446;
    out.m_52.w = _1440;
    int _1468 = ~_1460;
    int _1470 = _1468 + 1;
    bool _1472 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1474 = _1470 * _1214;
    int _1476 = _1474 + _1280;
    int _1478 = int(_1372) + int(_1458);
    float _1480 = _1300;
    float _1482 = _1406;
    float _1484 = _1398;
    if (!_1472)
    {
        _1480 = _1462;
    }
    float _1486 = _1480;
    int _1488 = _1296 * _1478;
    int _1490 = _1488 + _1270;
    bool _1492 = !_1472;
    float _1494 = _1486;
    if (!_1492)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1500 = _1438 + _1498;
        float _1502 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = rsqrt(_1432);
        float _1506 = _1500 * _1496;
        float _1508 = _1506 * 0.15915493667125701904296875;
        float _1510 = _1508 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1508 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        float _1518 = _1512 + (-1.0);
        float _1520 = fma(_1516, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = _1504 * _1520;
        float _1526 = fma(_1462, _1512, _1522);
        float _1528 = fma(_1420, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1530 = fma(_1410, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1494 = _1526;
        _1482 = _1528;
        _1484 = _1530;
    }
    float _1532 = _1494;
    float _1534 = _1482;
    float _1536 = _1484;
    float _1538 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1538);
    float _1548 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1550 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    bool _1552 = uint(_1476) >= uint(_1214);
    float _1554 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    bool _1556 = uint(_1490) >= uint(_1066);
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1560 = _1270 ^ _1066;
    float _1562 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    bool _1564 = !_1552;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    bool _1570 = !_1556;
    int _1572 = _1570 ? 0 : (-1);
    float _1574 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    uint _1576 = uint(int(uint(_1560) >> uint(31)));
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1580 = ~_1566;
    int _1582 = _1460 + _1580;
    int _1584 = _1582 + 1;
    float _1586 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1588 = ~_1478;
    int _1590 = _1588 + _1572;
    int _1592 = _1590 + 1;
    float _1594 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1596 = ~int(_1576);
    int _1598 = _1596 + 1;
    float _1600 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1554);
    bool _1602 = _1066 == 0;
    int _1604 = _1066 * _1592;
    int _1606 = _1604 + _1270;
    int _1608 = _1584 ^ _1598;
    float _1610 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1612 = _1066 == 0;
    float _1614 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _1616 = ~_1598;
    int _1618 = _1616 + _1608;
    int _1620 = _1618 + 1;
    float _1622 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1624 = !_1602;
    int _1626 = _1624 ? _1606 : (-1);
    float _1628 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1632 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = float(_1626);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1640 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1630);
    float _1642 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = fma(_1610, _1634, _882);
    bool _1646 = !_1612;
    int _1648 = _1646 ? _1620 : (-1);
    float _1650 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1292 + 0.5;
    float _1654 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1656 = float(_1648);
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1660 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1640);
    float _1662 = fma(_1610, _1652, _1644);
    float _1664 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1666 = -_860;
    float _1668 = fma(_1650, _1656, _1666);
    float _1670 = -_888;
    float _1672 = _1670 + 1.0;
    float _1674 = _1466 + (-0.5);
    float _1676 = _1656;
    if (_1262)
    {
        _1676 = 1.0;
    }
    float _1678 = _1676;
    float _1680 = _1678;
    if (!_1262)
    {
        float _1682 = as_type<float>(in.m_56.w);
        int _1684 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1686 = _1684 == 4;
        bool _1688 = _1684 == 8;
        bool _1690 = _1684 == 12;
        int _1692 = as_type<int>(_1682) << 16;
        int _1694 = as_type<int>(_1682) << 8;
        int _1696 = as_type<int>(_1682) << 24;
        int _1698 = _1692 >> 24;
        int _1700 = _1694 >> 24;
        int _1702 = as_type<int>(_1682) >> 24;
        int _1704 = _1696 >> 24;
        float _1706 = float(_1698);
        float _1708 = float(_1700);
        float _1710 = float(_1702);
        float _1712 = _1706 * 0.0078740157186985015869140625;
        float _1714 = float(_1704);
        float _1716 = _1708 * 0.0078740157186985015869140625;
        float _1718 = _1710 * 0.0078740157186985015869140625;
        float _1720 = precise::min(_1712, 1.0);
        float _1722 = _1714 * 0.0078740157186985015869140625;
        float _1724 = precise::min(_1716, 1.0);
        float _1726 = precise::min(_1718, 1.0);
        float _1728 = precise::min(_1722, 1.0);
        float _1730 = precise::max(_1720, -1.0);
        float _1732 = precise::max(_1724, -1.0);
        float _1734 = precise::max(_1726, -1.0);
        float _1736 = precise::max(_1728, -1.0);
        float _1738 = _1736;
        if (_1686)
        {
            _1738 = _1730;
        }
        float _1740 = _1738;
        float _1742 = _1740;
        if (_1688)
        {
            _1742 = _1732;
        }
        float _1744 = _1742;
        float _1746 = _1744;
        if (_1690)
        {
            _1746 = _1734;
        }
        float _1748 = _1746;
        float _1750 = abs(_1748);
        float _1752 = (-0.0) + _1750;
        _1680 = _1752;
    }
    float _1754 = _1680;
    bool _1756 = _1754 != 0.0;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1672;
    float _1768 = fma(_1292, _1766, _1662);
    float _1770 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = -_1650;
    float _1774 = fma(_1772, _1674, _1668);
    float _1776 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1778 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1654);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = -_890;
    float _1786 = _1784 + 1.0;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1776;
    float _1792 = _1780;
    if (!_1764)
    {
        _1790 = 0.0;
    }
    float _1794 = _1790;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1764)
    {
        _1792 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1798 = _1792;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1802 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1808 = _1794 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1812 = as_type<int>(_1798);
    if (!_1764)
    {
        float _1814 = _1798 * 5.0;
        _1812 = as_type<int>(_1814);
    }
    int _1816 = _1812;
    float _1818 = fma(_1466, _1786, _1774);
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1806;
    out.m_58.x = _1788;
    out.m_58.y = _1802;
    out.m_58.z = _1810;
    out.m_60.w = _1808;
    if (!_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4463 = as_type<float>(_1816);
        out.gl_Position.z = _4463;
    }
    out.m_62.x = _1768;
    out.m_62.y = _1818;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1875 = as_type<float>(_97);
        out.gl_Position.z = _1875;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_35.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = _115;
    if (_111)
    {
        float _121 = float(_81);
        _117 = _121;
    }
    float _123 = _117;
    bool _125 = _115 >= _123;
    bool _127 = !_111;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_33.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_135);
        out.gl_Position.z = _1944;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_40.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_81);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _189 = int(_187);
    float _191 = in.m_40.x;
    float _193 = in.m_40.y;
    float _195 = float(_81);
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _203 = int(_201);
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _209 = 1.0;
    }
    float _211 = _209;
    float _213 = float(_189);
    float _215 = _211;
    if (!_199)
    {
        _215 = 7.345489978790283203125;
    }
    float _217 = _215;
    float _219 = 1.0 / _195;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = float(uint(_203));
    float _243 = 1.0 / _213;
    int _245 = ~_203;
    int _247 = _245 + 1;
    float _249 = _193 * 2.0;
    float _251 = float(_203);
    float _253 = _191 * 2.0;
    bool _255 = _203 == 0;
    float _257 = -_239;
    float _259 = _257 + 1.0;
    int _261 = ~_203;
    int _263 = _261 + 1;
    float _265 = 1.0 / _241;
    float _267 = _243 * _115;
    float _269 = 1.0 / _207;
    out.m_33.x = 1.0;
    int _271 = as_type<int>(_265) + (-2);
    float _273 = trunc(_267);
    int _275 = int(_273);
    float _277 = 1.0 / _223;
    float _279 = float(uint(_275));
    float _281 = floor(_253);
    float _283 = as_type<float>(_271) * _279;
    float _285 = trunc(_283);
    float _287 = precise::max(_285, 0.0);
    uint _290 = uint(_287);
    float _292 = floor(_249);
    int _294 = ~_203;
    int _296 = _294 + 1;
    int _298 = _247 * int(_290);
    int _300 = _298 + _275;
    float _302 = 1.0 / _227;
    float _304 = float(uint(_300));
    float _306 = as_type<float>(_271) * _304;
    float _308 = _191 * _217;
    float _310 = trunc(_306);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    float _316 = floor(_308);
    int _318 = int(_290) + int(_314);
    float _320 = float(_275);
    int _322 = _296 * _318;
    int _324 = _322 + _275;
    bool _326 = _320 >= _251;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan(_251);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_316;
    float _340 = _308 + _338;
    bool _342 = uint(_324) >= uint(_203);
    float _344 = _340 * _251;
    float _346 = trunc(_336);
    int _348 = int(_346);
    float _350 = _251 * _115;
    bool _352 = !_342;
    int _354 = _352 ? 0 : (-1);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _358 = _356 != 0;
    int _360 = ~_318;
    int _362 = _360 + _354;
    int _364 = _362 + 1;
    float _366 = trunc(_344);
    int _368 = int(_366);
    bool _370 = !_358;
    int _372 = _370 ? 0 : 1;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    int _386 = abs(_372);
    int _388 = _203 * _364;
    int _390 = _388 + _275;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _394 = _392 != 0;
    float _396 = _350 * _219;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    int _404 = ~_348;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    bool _410 = !_255;
    int _412 = _410 ? _390 : (-1);
    float _414 = trunc(_396);
    int _416 = int(_414);
    int _418 = _368 * _386;
    int _420 = _418 + _275;
    bool _422 = !_376;
    int _424 = _422 ? 0 : 1;
    int _426 = _412 * _408;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    int _432 = _203 + (-1);
    int _434 = abs(_430);
    bool _436 = !_384;
    int _438 = _436 ? 0 : 1;
    int _440 = _348 * _432;
    int _442 = _440 + _426;
    int _444 = abs(_424);
    int _446 = abs(_438);
    int _448 = _442 * _434;
    bool _450 = !_394;
    int _452 = _450 ? 0 : 1;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _456 = _454 != 0;
    int _458 = _416 * _444;
    int _460 = _458 + _448;
    int _462 = abs(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = _420 * _446;
    int _470 = _468 + _460;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _474 = _472 != 0;
    float _476 = in.m_40.z;
    int _478 = _368 * _462;
    int _480 = _478 + _470;
    bool _482 = _281 >= 0.0;
    bool _484 = isnan(_281);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = in.m_30.x;
    float _494 = in.m_30.y;
    float _496 = in.m_30.z;
    bool _498 = _292 > 0.0;
    float _500 = float(uint(_480));
    float _502 = in.m_44.x;
    float _504 = in.m_44.y;
    float _506 = in.m_44.z;
    bool _508 = _281 > 0.0;
    float _510 = as_type<float>(_271) * _500;
    float _512 = in.m_46.x;
    float _514 = in.m_46.y;
    float _516 = in.m_46.z;
    float _518 = trunc(_510);
    float _520 = precise::max(_518, 0.0);
    uint _522 = uint(_520);
    float _524 = _494 * _400;
    float _526 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _528 = _494 * _504;
    int _530 = _263 * int(_522);
    int _532 = _530 + _480;
    float _534 = fma(_492, _502, _528);
    float _536 = _494 * _514;
    float _538 = float(uint(_532));
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _546 = _185 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _550 = _185 + _548;
    float _552 = as_type<float>(_271) * _538;
    float _554 = fma(_526, -2.0, _542);
    float _556 = fma(_492, _398, _524);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = _185 + _558;
    float _562 = _546 * _277;
    int _564 = ~_203;
    int _566 = _564 + 1;
    float _568 = trunc(_552);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    float _574 = _560 * _269;
    float _576 = fma(_496, _402, _556);
    float _578 = _550 * _302;
    float _580 = -_540;
    float _582 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[77].x, _580);
    int _584 = _490 ? 0 : 1;
    float _586 = _476 * 2.0;
    bool _588 = _292 >= 0.0;
    bool _590 = isnan(_292);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = fma(_492, _512, _536);
    float _604 = _193 + _191;
    float _606 = fma(_496, _506, _534);
    int _608 = ~_584;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = _604 + (-1.0);
    int _616 = _612;
    if (!_508)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = floor(_586);
    int _626 = int(_522) + int(_572);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _630 = _596 ? 0 : 1;
    float _632 = fma(_496, _516, _602);
    int _634 = _566 * _626;
    int _636 = _634 + _480;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = _600 * _115;
    int _646 = _642;
    if (!_498)
    {
        int _648 = ~_630;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = _476 + _191;
    bool _656 = uint(_636) >= uint(_203);
    float _658 = _193 + _476;
    float _660 = _654 + (-1.0);
    bool _662 = !_656;
    int _664 = _662 ? 0 : (-1);
    float _666 = _658 + (-1.0);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _682 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _684 = isnan(_185);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _696 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_185);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = exp2(_644);
    bool _710 = !_674;
    int _712 = _710 ? 0 : 1;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _718 = _624 >= 0.0;
    bool _720 = isnan(_624);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_185);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _259;
    int _746 = _726 ? 0 : 1;
    float _748 = -_692;
    float _750 = _748 + 1.0;
    bool _752 = _624 > 0.0;
    float _754 = _742 * _730;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _756;
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _764;
    float _768 = fma(_716, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _770 = fma(_758, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _772 = _239 * _762;
    float _774 = fma(_766, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _780 = _770 * _744;
    float _782 = _774 * _744;
    float _784 = fma(_778, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _786 = -_708;
    float _788 = _786 + 1.0;
    int _790 = ~_746;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _780);
    int _798 = _794;
    if (!_752)
    {
        int _800 = ~_746;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _806;
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _814 = 1.0 + _812;
    bool _816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _574, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _828 = fma(_784, _772, _810);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _830;
    float _834 = 1.0 / _814;
    float _836 = _824 ? _788 : 0.0;
    float _838 = fma(_826, _754, _828);
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_832, _574, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _852 = fma(_768, _772, _796);
    float _854 = float(uint(_420));
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _862 = ~_626;
    int _864 = _862 + _664;
    int _866 = _864 + 1;
    float _868 = fma(_850, _754, _852);
    float _870 = as_type<float>(_271) * _854;
    float _872 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _856);
    float _874 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    int _876 = _203 * _866;
    int _878 = _876 + _480;
    float _880 = -_115;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    bool _884 = !_670;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _890 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _892 = trunc(_870);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    if (_848)
    {
        float _898 = _836 * _834;
        _119 = _898;
    }
    float _900 = _119;
    bool _902 = !_678;
    int _904 = _902 ? 0 : 1;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    int _912 = abs(_886);
    float _914 = _476 + (-0.5);
    int _916 = abs(_712);
    float _918 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _920 = abs(_904);
    float _922 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _924 = ~_203;
    int _926 = _924 + 1;
    float _928 = float(_622);
    float _930 = float(_912);
    float _932 = float(_804);
    float _934 = float(_916);
    float _936 = float(_652);
    float _938 = _930 * _932;
    bool _940 = !_255;
    int _942 = _940 ? _878 : (-1);
    float _944 = _934 * _928;
    float _946 = float(_920);
    float _948 = _938 * (-2.0);
    float _950 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _868);
    int _952 = _942 >> 31;
    float _954 = _946 * _936;
    float _956 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    int _958 = _926 * int(_896);
    int _960 = _958 + _420;
    int _962 = _952 & 3;
    float _964 = fma(_628, _948, _628);
    int _966 = _942 & 3;
    bool _968 = _966 != 0;
    float _970 = _954 * (-2.0);
    float _972 = float(uint(_960));
    float _974 = fma(_948, _906, _906);
    int _976 = _942 + _962;
    float _978 = _944 * (-2.0);
    bool _980 = _191 > 0.5;
    float _982 = as_type<float>(_271) * _972;
    int _984 = _976 >> 2;
    float _986 = _191 + (-0.5);
    int _988 = _968 ? 0 : 1;
    float _990 = trunc(_982);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = _984 << 4;
    int _998 = _996 + 368;
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    int _1002 = _942 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_680, _970, _680);
    uint _1008 = uint(int(uint(_998) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    float _1024 = fma(_964, _900, _1000);
    bool _1026 = uint(_1002) > 1u;
    float _1028 = fma(_694, _978, _694);
    float _1030 = fma(_978, _908, _908);
    int _1032 = ~_988;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    float _1038 = in.m_50.x;
    float _1040 = in.m_50.y;
    float _1042 = _1024 * 0.15915493667125701904296875;
    int _1044 = _998 + 8;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[int(_1056)][_1058];
    float _1062 = fma(_970, _910, _910);
    float _1064 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1066 = int(_1064);
    int _1068 = int(_896) + int(_994);
    int _1070 = ~_203;
    int _1072 = _1070 + 1;
    float _1074 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    int _1076 = _1036;
    if (!_1026)
    {
        int _1078 = ~_988;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = _1002 != 3;
    int _1086 = _1072 * _1068;
    int _1088 = _1086 + _420;
    bool _1090 = !_1004;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_1006, _900, _1074);
    bool _1096 = !_1084;
    int _1098 = _1096 ? 0 : (-1);
    bool _1100 = uint(_1088) >= uint(_203);
    bool _1102 = uint(_1002) >= 2u;
    bool _1104 = !_1100;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = _1002 != 3;
    float _1110 = _950 * _1038;
    int _1112 = _1102 ? 0 : 1;
    float _1114 = _956 * _1040;
    bool _1116 = _193 > 0.5;
    float _1118 = _193 + (-0.5);
    int _1120 = abs(_1082);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1124 = ~_1112;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = ~_1068;
    int _1138 = _1136 + _1106;
    int _1140 = _1138 + 1;
    float _1142 = fma(_1028, _900, _1130);
    int _1144 = _1128;
    if (_1108)
    {
        int _1146 = ~_1112;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1154 = ~_1120;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1142 * 0.15915493667125701904296875;
    int _1162 = abs(_1092);
    float _1164 = _1042 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = abs(_1150);
    int _1170 = _1158 * as_type<int>(_1022);
    bool _1172 = !_456;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _203 * _1140;
    int _1178 = _1176 + _420;
    int _1180 = abs(_1098);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1184 = ~_1162;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1122 * _1182;
    int _1196 = abs(_1174);
    int _1198 = _1188 * as_type<int>(_1014);
    int _1200 = _1198 + _1170;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    int _1204 = ~_1168;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = _1160 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    int _1214 = abs(_1066);
    float _1216 = _1094 * 0.15915493667125701904296875;
    int _1218 = _1208 * as_type<int>(_1052);
    int _1220 = _1218 + _1200;
    int _1222 = ~_1180;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1152 * _1202;
    float _1230 = float(uint(_1214));
    float _1232 = _1216 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    int _1236 = ~_1196;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _1226 * as_type<int>(_1060);
    int _1244 = _1242 + _1220;
    bool _1246 = !_255;
    int _1248 = _1246 ? _1178 : (-1);
    float _1250 = float(uint(_1066));
    int _1252 = _1244 * _1240;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1262 = _1258 || _1260;
    float _1264 = 1.0 / _1230;
    float _1266 = _1134 * _1212;
    int _1268 = _1248 * _1196;
    int _1270 = _1268 + _1252;
    float _1272 = _1166 * _1192;
    float _1274 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1276 = -_151;
    int _1278 = _980 ? as_type<int>(_1276) : as_type<int>(_151);
    int _1280 = abs(_1270);
    float _1282 = _1216 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = -_1272;
    float _1288 = fma(_1234, _1266, _1286);
    bool _1290 = !_466;
    float _1292 = _1290 ? _151 : as_type<float>(_1278);
    int _1294 = ~_1066;
    int _1296 = _1294 + 1;
    float _1298 = -_155;
    float _1300 = _1116 ? _1298 : _155;
    float _1302 = 1.0 / _1250;
    float _1304 = -_1266;
    float _1306 = fma(_1234, _1272, _1304);
    float _1308 = _1134 * _1192;
    int _1310 = as_type<int>(_1264) + (-2);
    float _1312 = float(uint(_1280));
    float _1314 = _1212 * _1284;
    float _1316 = _1284 * _1228;
    float _1318 = _1166 * _1212;
    float _1320 = _1192 * _1284;
    float _1322 = _1234 * _1228;
    float _1324 = _1166 * _1316;
    float _1326 = as_type<float>(_1310) * _1312;
    float _1328 = fma(_1234, _1318, _1308);
    float _1330 = -_1322;
    float _1332 = fma(_1314, _1194, _1330);
    float _1334 = _1134 * _1316;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1328, _1194, _1324);
    int _1344 = as_type<int>(_1302) + (-2);
    float _1346 = fma(_1234, _1308, _1318);
    float _1348 = float(uint(_1270));
    float _1350 = fma(_1306, _1274, _1342);
    float _1352 = fma(_1288, _1194, _1334);
    float _1354 = fma(_1320, _1274, _1332);
    int _1356 = ~_1066;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1344) * _1348;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1364 = fma(_1346, _1274, _1352);
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = trunc(_1360);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1362);
    float _1376 = _576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1378 = ~int(_1340);
    int _1380 = _1378 + 1;
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1386 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1382);
    int _1390 = _1380 * _1214;
    int _1392 = _1390 + _1280;
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _918 + _1394;
    float _1400 = float(uint(_1392));
    int _1402 = _1358 * int(_1372);
    int _1404 = _1402 + _1270;
    float _1406 = _1376 + _1396;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1410 = _1398 + _1408;
    float _1412 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1414 = as_type<float>(_1310) * _1400;
    float _1416 = float(uint(_1404));
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1406 + _1418;
    float _1422 = _1410 * _1410;
    float _1424 = trunc(_1414);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1344) * _1416;
    float _1432 = fma(_1420, _1420, _1422);
    float _1434 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1412);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1438 = sqrt(_1432);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = trunc(_1430);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _922 + _1448;
    bool _1464 = !_474;
    float _1466 = _1464 ? _155 : _1300;
    out.m_52.x = _1450;
    out.m_52.y = _1452;
    out.m_52.z = _1446;
    out.m_52.w = _1440;
    int _1468 = ~_1460;
    int _1470 = _1468 + 1;
    bool _1472 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1474 = _1470 * _1214;
    int _1476 = _1474 + _1280;
    int _1478 = int(_1372) + int(_1458);
    float _1480 = _1300;
    float _1482 = _1406;
    float _1484 = _1398;
    if (!_1472)
    {
        _1480 = _1462;
    }
    float _1486 = _1480;
    int _1488 = _1296 * _1478;
    int _1490 = _1488 + _1270;
    bool _1492 = !_1472;
    float _1494 = _1486;
    if (!_1492)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1500 = _1438 + _1498;
        float _1502 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = rsqrt(_1432);
        float _1506 = _1500 * _1496;
        float _1508 = _1506 * 0.15915493667125701904296875;
        float _1510 = _1508 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1508 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        float _1518 = _1512 + (-1.0);
        float _1520 = fma(_1516, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = _1504 * _1520;
        float _1526 = fma(_1462, _1512, _1522);
        float _1528 = fma(_1420, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1530 = fma(_1410, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1494 = _1526;
        _1482 = _1528;
        _1484 = _1530;
    }
    float _1532 = _1494;
    float _1534 = _1482;
    float _1536 = _1484;
    float _1538 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1538);
    float _1548 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1550 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    bool _1552 = uint(_1476) >= uint(_1214);
    float _1554 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    bool _1556 = uint(_1490) >= uint(_1066);
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1560 = _1270 ^ _1066;
    float _1562 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    bool _1564 = !_1552;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    bool _1570 = !_1556;
    int _1572 = _1570 ? 0 : (-1);
    float _1574 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    uint _1576 = uint(int(uint(_1560) >> uint(31)));
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1580 = ~_1566;
    int _1582 = _1460 + _1580;
    int _1584 = _1582 + 1;
    float _1586 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1588 = ~_1478;
    int _1590 = _1588 + _1572;
    int _1592 = _1590 + 1;
    float _1594 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1596 = ~int(_1576);
    int _1598 = _1596 + 1;
    float _1600 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1554);
    bool _1602 = _1066 == 0;
    int _1604 = _1066 * _1592;
    int _1606 = _1604 + _1270;
    int _1608 = _1584 ^ _1598;
    float _1610 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1612 = _1066 == 0;
    float _1614 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _1616 = ~_1598;
    int _1618 = _1616 + _1608;
    int _1620 = _1618 + 1;
    float _1622 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1624 = !_1602;
    int _1626 = _1624 ? _1606 : (-1);
    float _1628 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1632 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = float(_1626);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1640 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1630);
    float _1642 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = fma(_1610, _1634, _882);
    bool _1646 = !_1612;
    int _1648 = _1646 ? _1620 : (-1);
    float _1650 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1292 + 0.5;
    float _1654 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1656 = float(_1648);
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1660 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1640);
    float _1662 = fma(_1610, _1652, _1644);
    float _1664 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1666 = -_860;
    float _1668 = fma(_1650, _1656, _1666);
    float _1670 = -_888;
    float _1672 = _1670 + 1.0;
    float _1674 = _1466 + (-0.5);
    float _1676 = _1656;
    if (_1262)
    {
        _1676 = 1.0;
    }
    float _1678 = _1676;
    float _1680 = _1678;
    if (!_1262)
    {
        float _1682 = as_type<float>(in.m_56.w);
        int _1684 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1686 = _1684 == 4;
        bool _1688 = _1684 == 8;
        bool _1690 = _1684 == 12;
        int _1692 = as_type<int>(_1682) << 16;
        int _1694 = as_type<int>(_1682) << 8;
        int _1696 = as_type<int>(_1682) << 24;
        int _1698 = _1692 >> 24;
        int _1700 = _1694 >> 24;
        int _1702 = as_type<int>(_1682) >> 24;
        int _1704 = _1696 >> 24;
        float _1706 = float(_1698);
        float _1708 = float(_1700);
        float _1710 = float(_1702);
        float _1712 = _1706 * 0.0078740157186985015869140625;
        float _1714 = float(_1704);
        float _1716 = _1708 * 0.0078740157186985015869140625;
        float _1718 = _1710 * 0.0078740157186985015869140625;
        float _1720 = precise::min(_1712, 1.0);
        float _1722 = _1714 * 0.0078740157186985015869140625;
        float _1724 = precise::min(_1716, 1.0);
        float _1726 = precise::min(_1718, 1.0);
        float _1728 = precise::min(_1722, 1.0);
        float _1730 = precise::max(_1720, -1.0);
        float _1732 = precise::max(_1724, -1.0);
        float _1734 = precise::max(_1726, -1.0);
        float _1736 = precise::max(_1728, -1.0);
        float _1738 = _1736;
        if (_1686)
        {
            _1738 = _1730;
        }
        float _1740 = _1738;
        float _1742 = _1740;
        if (_1688)
        {
            _1742 = _1732;
        }
        float _1744 = _1742;
        float _1746 = _1744;
        if (_1690)
        {
            _1746 = _1734;
        }
        float _1748 = _1746;
        float _1750 = abs(_1748);
        float _1752 = (-0.0) + _1750;
        _1680 = _1752;
    }
    float _1754 = _1680;
    bool _1756 = _1754 != 0.0;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1672;
    float _1768 = fma(_1292, _1766, _1662);
    float _1770 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = -_1650;
    float _1774 = fma(_1772, _1674, _1668);
    float _1776 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1778 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1654);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = -_890;
    float _1786 = _1784 + 1.0;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1776;
    float _1792 = _1780;
    if (!_1764)
    {
        _1790 = 0.0;
    }
    float _1794 = _1790;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1764)
    {
        _1792 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1798 = _1792;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1802 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1808 = _1794 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1812 = as_type<int>(_1798);
    if (!_1764)
    {
        float _1814 = _1798 * 5.0;
        _1812 = as_type<int>(_1814);
    }
    int _1816 = _1812;
    float _1818 = fma(_1466, _1786, _1774);
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1806;
    out.m_58.x = _1788;
    out.m_58.y = _1802;
    out.m_58.z = _1810;
    out.m_60.w = _1808;
    if (!_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4463 = as_type<float>(_1816);
        out.gl_Position.z = _4463;
    }
    out.m_62.x = _1768;
    out.m_62.y = _1818;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1875 = as_type<float>(_97);
        out.gl_Position.z = _1875;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_35.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = _115;
    if (_111)
    {
        float _121 = float(_81);
        _117 = _121;
    }
    float _123 = _117;
    bool _125 = _115 >= _123;
    bool _127 = !_111;
    bool _129 = _125 || _127;
    if (_129)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _91;
    if (_129)
    {
        out.m_33.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_135);
        out.gl_Position.z = _1944;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_40.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_81);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _189 = int(_187);
    float _191 = in.m_40.x;
    float _193 = in.m_40.y;
    float _195 = float(_81);
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _203 = int(_201);
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _209 = 1.0;
    }
    float _211 = _209;
    float _213 = float(_189);
    float _215 = _211;
    if (!_199)
    {
        _215 = 7.345489978790283203125;
    }
    float _217 = _215;
    float _219 = 1.0 / _195;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = float(uint(_203));
    float _243 = 1.0 / _213;
    int _245 = ~_203;
    int _247 = _245 + 1;
    float _249 = _193 * 2.0;
    float _251 = float(_203);
    float _253 = _191 * 2.0;
    bool _255 = _203 == 0;
    float _257 = -_239;
    float _259 = _257 + 1.0;
    int _261 = ~_203;
    int _263 = _261 + 1;
    float _265 = 1.0 / _241;
    float _267 = _243 * _115;
    float _269 = 1.0 / _207;
    out.m_33.x = 1.0;
    int _271 = as_type<int>(_265) + (-2);
    float _273 = trunc(_267);
    int _275 = int(_273);
    float _277 = 1.0 / _223;
    float _279 = float(uint(_275));
    float _281 = floor(_253);
    float _283 = as_type<float>(_271) * _279;
    float _285 = trunc(_283);
    float _287 = precise::max(_285, 0.0);
    uint _290 = uint(_287);
    float _292 = floor(_249);
    int _294 = ~_203;
    int _296 = _294 + 1;
    int _298 = _247 * int(_290);
    int _300 = _298 + _275;
    float _302 = 1.0 / _227;
    float _304 = float(uint(_300));
    float _306 = as_type<float>(_271) * _304;
    float _308 = _191 * _217;
    float _310 = trunc(_306);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    float _316 = floor(_308);
    int _318 = int(_290) + int(_314);
    float _320 = float(_275);
    int _322 = _296 * _318;
    int _324 = _322 + _275;
    bool _326 = _320 >= _251;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan(_251);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_316;
    float _340 = _308 + _338;
    bool _342 = uint(_324) >= uint(_203);
    float _344 = _340 * _251;
    float _346 = trunc(_336);
    int _348 = int(_346);
    float _350 = _251 * _115;
    bool _352 = !_342;
    int _354 = _352 ? 0 : (-1);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _358 = _356 != 0;
    int _360 = ~_318;
    int _362 = _360 + _354;
    int _364 = _362 + 1;
    float _366 = trunc(_344);
    int _368 = int(_366);
    bool _370 = !_358;
    int _372 = _370 ? 0 : 1;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    int _386 = abs(_372);
    int _388 = _203 * _364;
    int _390 = _388 + _275;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _394 = _392 != 0;
    float _396 = _350 * _219;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    int _404 = ~_348;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    bool _410 = !_255;
    int _412 = _410 ? _390 : (-1);
    float _414 = trunc(_396);
    int _416 = int(_414);
    int _418 = _368 * _386;
    int _420 = _418 + _275;
    bool _422 = !_376;
    int _424 = _422 ? 0 : 1;
    int _426 = _412 * _408;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    int _432 = _203 + (-1);
    int _434 = abs(_430);
    bool _436 = !_384;
    int _438 = _436 ? 0 : 1;
    int _440 = _348 * _432;
    int _442 = _440 + _426;
    int _444 = abs(_424);
    int _446 = abs(_438);
    int _448 = _442 * _434;
    bool _450 = !_394;
    int _452 = _450 ? 0 : 1;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _456 = _454 != 0;
    int _458 = _416 * _444;
    int _460 = _458 + _448;
    int _462 = abs(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = _420 * _446;
    int _470 = _468 + _460;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _474 = _472 != 0;
    float _476 = in.m_40.z;
    int _478 = _368 * _462;
    int _480 = _478 + _470;
    bool _482 = _281 >= 0.0;
    bool _484 = isnan(_281);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = in.m_30.x;
    float _494 = in.m_30.y;
    float _496 = in.m_30.z;
    bool _498 = _292 > 0.0;
    float _500 = float(uint(_480));
    float _502 = in.m_44.x;
    float _504 = in.m_44.y;
    float _506 = in.m_44.z;
    bool _508 = _281 > 0.0;
    float _510 = as_type<float>(_271) * _500;
    float _512 = in.m_46.x;
    float _514 = in.m_46.y;
    float _516 = in.m_46.z;
    float _518 = trunc(_510);
    float _520 = precise::max(_518, 0.0);
    uint _522 = uint(_520);
    float _524 = _494 * _400;
    float _526 = _193 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _528 = _494 * _504;
    int _530 = _263 * int(_522);
    int _532 = _530 + _480;
    float _534 = fma(_492, _502, _528);
    float _536 = _494 * _514;
    float _538 = float(uint(_532));
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _546 = _185 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _550 = _185 + _548;
    float _552 = as_type<float>(_271) * _538;
    float _554 = fma(_526, -2.0, _542);
    float _556 = fma(_492, _398, _524);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = _185 + _558;
    float _562 = _546 * _277;
    int _564 = ~_203;
    int _566 = _564 + 1;
    float _568 = trunc(_552);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    float _574 = _560 * _269;
    float _576 = fma(_496, _402, _556);
    float _578 = _550 * _302;
    float _580 = -_540;
    float _582 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[77].x, _580);
    int _584 = _490 ? 0 : 1;
    float _586 = _476 * 2.0;
    bool _588 = _292 >= 0.0;
    bool _590 = isnan(_292);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = fma(_492, _512, _536);
    float _604 = _193 + _191;
    float _606 = fma(_496, _506, _534);
    int _608 = ~_584;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = _604 + (-1.0);
    int _616 = _612;
    if (!_508)
    {
        int _618 = ~_584;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = floor(_586);
    int _626 = int(_522) + int(_572);
    float _628 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _630 = _596 ? 0 : 1;
    float _632 = fma(_496, _516, _602);
    int _634 = _566 * _626;
    int _636 = _634 + _480;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = _600 * _115;
    int _646 = _642;
    if (!_498)
    {
        int _648 = ~_630;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = _476 + _191;
    bool _656 = uint(_636) >= uint(_203);
    float _658 = _193 + _476;
    float _660 = _654 + (-1.0);
    bool _662 = !_656;
    int _664 = _662 ? 0 : (-1);
    float _666 = _658 + (-1.0);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _682 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _684 = isnan(_185);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _696 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_185);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = exp2(_644);
    bool _710 = !_674;
    int _712 = _710 ? 0 : 1;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _718 = _624 >= 0.0;
    bool _720 = isnan(_624);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_185);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _259;
    int _746 = _726 ? 0 : 1;
    float _748 = -_692;
    float _750 = _748 + 1.0;
    bool _752 = _624 > 0.0;
    float _754 = _742 * _730;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _756;
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _764;
    float _768 = fma(_716, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _770 = fma(_758, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _772 = _239 * _762;
    float _774 = fma(_766, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _780 = _770 * _744;
    float _782 = _774 * _744;
    float _784 = fma(_778, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _786 = -_708;
    float _788 = _786 + 1.0;
    int _790 = ~_746;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _780);
    int _798 = _794;
    if (!_752)
    {
        int _800 = ~_746;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _806;
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _814 = 1.0 + _812;
    bool _816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = fma(_808, _574, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _828 = fma(_784, _772, _810);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _830;
    float _834 = 1.0 / _814;
    float _836 = _824 ? _788 : 0.0;
    float _838 = fma(_826, _754, _828);
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_832, _574, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _852 = fma(_768, _772, _796);
    float _854 = float(uint(_420));
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _862 = ~_626;
    int _864 = _862 + _664;
    int _866 = _864 + 1;
    float _868 = fma(_850, _754, _852);
    float _870 = as_type<float>(_271) * _854;
    float _872 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _856);
    float _874 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    int _876 = _203 * _866;
    int _878 = _876 + _480;
    float _880 = -_115;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _582);
    bool _884 = !_670;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _890 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _892 = trunc(_870);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    if (_848)
    {
        float _898 = _836 * _834;
        _119 = _898;
    }
    float _900 = _119;
    bool _902 = !_678;
    int _904 = _902 ? 0 : 1;
    float _906 = in.m_48.x;
    float _908 = in.m_48.y;
    float _910 = in.m_48.z;
    int _912 = abs(_886);
    float _914 = _476 + (-0.5);
    int _916 = abs(_712);
    float _918 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _920 = abs(_904);
    float _922 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _924 = ~_203;
    int _926 = _924 + 1;
    float _928 = float(_622);
    float _930 = float(_912);
    float _932 = float(_804);
    float _934 = float(_916);
    float _936 = float(_652);
    float _938 = _930 * _932;
    bool _940 = !_255;
    int _942 = _940 ? _878 : (-1);
    float _944 = _934 * _928;
    float _946 = float(_920);
    float _948 = _938 * (-2.0);
    float _950 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _868);
    int _952 = _942 >> 31;
    float _954 = _946 * _936;
    float _956 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _838);
    int _958 = _926 * int(_896);
    int _960 = _958 + _420;
    int _962 = _952 & 3;
    float _964 = fma(_628, _948, _628);
    int _966 = _942 & 3;
    bool _968 = _966 != 0;
    float _970 = _954 * (-2.0);
    float _972 = float(uint(_960));
    float _974 = fma(_948, _906, _906);
    int _976 = _942 + _962;
    float _978 = _944 * (-2.0);
    bool _980 = _191 > 0.5;
    float _982 = as_type<float>(_271) * _972;
    int _984 = _976 >> 2;
    float _986 = _191 + (-0.5);
    int _988 = _968 ? 0 : 1;
    float _990 = trunc(_982);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = _984 << 4;
    int _998 = _996 + 368;
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    int _1002 = _942 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_680, _970, _680);
    uint _1008 = uint(int(uint(_998) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    float _1024 = fma(_964, _900, _1000);
    bool _1026 = uint(_1002) > 1u;
    float _1028 = fma(_694, _978, _694);
    float _1030 = fma(_978, _908, _908);
    int _1032 = ~_988;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    float _1038 = in.m_50.x;
    float _1040 = in.m_50.y;
    float _1042 = _1024 * 0.15915493667125701904296875;
    int _1044 = _998 + 8;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[int(_1056)][_1058];
    float _1062 = fma(_970, _910, _910);
    float _1064 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1066 = int(_1064);
    int _1068 = int(_896) + int(_994);
    int _1070 = ~_203;
    int _1072 = _1070 + 1;
    float _1074 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    int _1076 = _1036;
    if (!_1026)
    {
        int _1078 = ~_988;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = _1002 != 3;
    int _1086 = _1072 * _1068;
    int _1088 = _1086 + _420;
    bool _1090 = !_1004;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = fma(_1006, _900, _1074);
    bool _1096 = !_1084;
    int _1098 = _1096 ? 0 : (-1);
    bool _1100 = uint(_1088) >= uint(_203);
    bool _1102 = uint(_1002) >= 2u;
    bool _1104 = !_1100;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = _1002 != 3;
    float _1110 = _950 * _1038;
    int _1112 = _1102 ? 0 : 1;
    float _1114 = _956 * _1040;
    bool _1116 = _193 > 0.5;
    float _1118 = _193 + (-0.5);
    int _1120 = abs(_1082);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1124 = ~_1112;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1030);
    float _1132 = _1042 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    int _1136 = ~_1068;
    int _1138 = _1136 + _1106;
    int _1140 = _1138 + 1;
    float _1142 = fma(_1028, _900, _1130);
    int _1144 = _1128;
    if (_1108)
    {
        int _1146 = ~_1112;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1154 = ~_1120;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1142 * 0.15915493667125701904296875;
    int _1162 = abs(_1092);
    float _1164 = _1042 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    int _1168 = abs(_1150);
    int _1170 = _1158 * as_type<int>(_1022);
    bool _1172 = !_456;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _203 * _1140;
    int _1178 = _1176 + _420;
    int _1180 = abs(_1098);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1184 = ~_1162;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1122 * _1182;
    int _1196 = abs(_1174);
    int _1198 = _1188 * as_type<int>(_1014);
    int _1200 = _1198 + _1170;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    int _1204 = ~_1168;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = _1160 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    int _1214 = abs(_1066);
    float _1216 = _1094 * 0.15915493667125701904296875;
    int _1218 = _1208 * as_type<int>(_1052);
    int _1220 = _1218 + _1200;
    int _1222 = ~_1180;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1152 * _1202;
    float _1230 = float(uint(_1214));
    float _1232 = _1216 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    int _1236 = ~_1196;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _1226 * as_type<int>(_1060);
    int _1244 = _1242 + _1220;
    bool _1246 = !_255;
    int _1248 = _1246 ? _1178 : (-1);
    float _1250 = float(uint(_1066));
    int _1252 = _1244 * _1240;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1262 = _1258 || _1260;
    float _1264 = 1.0 / _1230;
    float _1266 = _1134 * _1212;
    int _1268 = _1248 * _1196;
    int _1270 = _1268 + _1252;
    float _1272 = _1166 * _1192;
    float _1274 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1276 = -_151;
    int _1278 = _980 ? as_type<int>(_1276) : as_type<int>(_151);
    int _1280 = abs(_1270);
    float _1282 = _1216 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = -_1272;
    float _1288 = fma(_1234, _1266, _1286);
    bool _1290 = !_466;
    float _1292 = _1290 ? _151 : as_type<float>(_1278);
    int _1294 = ~_1066;
    int _1296 = _1294 + 1;
    float _1298 = -_155;
    float _1300 = _1116 ? _1298 : _155;
    float _1302 = 1.0 / _1250;
    float _1304 = -_1266;
    float _1306 = fma(_1234, _1272, _1304);
    float _1308 = _1134 * _1192;
    int _1310 = as_type<int>(_1264) + (-2);
    float _1312 = float(uint(_1280));
    float _1314 = _1212 * _1284;
    float _1316 = _1284 * _1228;
    float _1318 = _1166 * _1212;
    float _1320 = _1192 * _1284;
    float _1322 = _1234 * _1228;
    float _1324 = _1166 * _1316;
    float _1326 = as_type<float>(_1310) * _1312;
    float _1328 = fma(_1234, _1318, _1308);
    float _1330 = -_1322;
    float _1332 = fma(_1314, _1194, _1330);
    float _1334 = _1134 * _1316;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1328, _1194, _1324);
    int _1344 = as_type<int>(_1302) + (-2);
    float _1346 = fma(_1234, _1308, _1318);
    float _1348 = float(uint(_1270));
    float _1350 = fma(_1306, _1274, _1342);
    float _1352 = fma(_1288, _1194, _1334);
    float _1354 = fma(_1320, _1274, _1332);
    int _1356 = ~_1066;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1344) * _1348;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1364 = fma(_1346, _1274, _1352);
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = trunc(_1360);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1362);
    float _1376 = _576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1378 = ~int(_1340);
    int _1380 = _1378 + 1;
    float _1382 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1386 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1382);
    int _1390 = _1380 * _1214;
    int _1392 = _1390 + _1280;
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1396 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _918 + _1394;
    float _1400 = float(uint(_1392));
    int _1402 = _1358 * int(_1372);
    int _1404 = _1402 + _1270;
    float _1406 = _1376 + _1396;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1410 = _1398 + _1408;
    float _1412 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1414 = as_type<float>(_1310) * _1400;
    float _1416 = float(uint(_1404));
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1406 + _1418;
    float _1422 = _1410 * _1410;
    float _1424 = trunc(_1414);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1344) * _1416;
    float _1432 = fma(_1420, _1420, _1422);
    float _1434 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1412);
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1438 = sqrt(_1432);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1448 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = trunc(_1430);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _922 + _1448;
    bool _1464 = !_474;
    float _1466 = _1464 ? _155 : _1300;
    out.m_52.x = _1450;
    out.m_52.y = _1452;
    out.m_52.z = _1446;
    out.m_52.w = _1440;
    int _1468 = ~_1460;
    int _1470 = _1468 + 1;
    bool _1472 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1474 = _1470 * _1214;
    int _1476 = _1474 + _1280;
    int _1478 = int(_1372) + int(_1458);
    float _1480 = _1300;
    float _1482 = _1406;
    float _1484 = _1398;
    if (!_1472)
    {
        _1480 = _1462;
    }
    float _1486 = _1480;
    int _1488 = _1296 * _1478;
    int _1490 = _1488 + _1270;
    bool _1492 = !_1472;
    float _1494 = _1486;
    if (!_1492)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1500 = _1438 + _1498;
        float _1502 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = rsqrt(_1432);
        float _1506 = _1500 * _1496;
        float _1508 = _1506 * 0.15915493667125701904296875;
        float _1510 = _1508 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1508 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        float _1518 = _1512 + (-1.0);
        float _1520 = fma(_1516, _1502, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = _1504 * _1520;
        float _1526 = fma(_1462, _1512, _1522);
        float _1528 = fma(_1420, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1530 = fma(_1410, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1494 = _1526;
        _1482 = _1528;
        _1484 = _1530;
    }
    float _1532 = _1494;
    float _1534 = _1482;
    float _1536 = _1484;
    float _1538 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1538);
    float _1548 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1550 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    bool _1552 = uint(_1476) >= uint(_1214);
    float _1554 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    bool _1556 = uint(_1490) >= uint(_1066);
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1560 = _1270 ^ _1066;
    float _1562 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    bool _1564 = !_1552;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1548);
    bool _1570 = !_1556;
    int _1572 = _1570 ? 0 : (-1);
    float _1574 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    uint _1576 = uint(int(uint(_1560) >> uint(31)));
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1580 = ~_1566;
    int _1582 = _1460 + _1580;
    int _1584 = _1582 + 1;
    float _1586 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1588 = ~_1478;
    int _1590 = _1588 + _1572;
    int _1592 = _1590 + 1;
    float _1594 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1596 = ~int(_1576);
    int _1598 = _1596 + 1;
    float _1600 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1554);
    bool _1602 = _1066 == 0;
    int _1604 = _1066 * _1592;
    int _1606 = _1604 + _1270;
    int _1608 = _1584 ^ _1598;
    float _1610 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1612 = _1066 == 0;
    float _1614 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _1616 = ~_1598;
    int _1618 = _1616 + _1608;
    int _1620 = _1618 + 1;
    float _1622 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1624 = !_1602;
    int _1626 = _1624 ? _1606 : (-1);
    float _1628 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1632 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = float(_1626);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1640 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1630);
    float _1642 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = fma(_1610, _1634, _882);
    bool _1646 = !_1612;
    int _1648 = _1646 ? _1620 : (-1);
    float _1650 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1292 + 0.5;
    float _1654 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1656 = float(_1648);
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1660 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1640);
    float _1662 = fma(_1610, _1652, _1644);
    float _1664 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1666 = -_860;
    float _1668 = fma(_1650, _1656, _1666);
    float _1670 = -_888;
    float _1672 = _1670 + 1.0;
    float _1674 = _1466 + (-0.5);
    float _1676 = _1656;
    if (_1262)
    {
        _1676 = 1.0;
    }
    float _1678 = _1676;
    float _1680 = _1678;
    if (!_1262)
    {
        float _1682 = as_type<float>(in.m_56.w);
        int _1684 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1686 = _1684 == 4;
        bool _1688 = _1684 == 8;
        bool _1690 = _1684 == 12;
        int _1692 = as_type<int>(_1682) << 16;
        int _1694 = as_type<int>(_1682) << 8;
        int _1696 = as_type<int>(_1682) << 24;
        int _1698 = _1692 >> 24;
        int _1700 = _1694 >> 24;
        int _1702 = as_type<int>(_1682) >> 24;
        int _1704 = _1696 >> 24;
        float _1706 = float(_1698);
        float _1708 = float(_1700);
        float _1710 = float(_1702);
        float _1712 = _1706 * 0.0078740157186985015869140625;
        float _1714 = float(_1704);
        float _1716 = _1708 * 0.0078740157186985015869140625;
        float _1718 = _1710 * 0.0078740157186985015869140625;
        float _1720 = precise::min(_1712, 1.0);
        float _1722 = _1714 * 0.0078740157186985015869140625;
        float _1724 = precise::min(_1716, 1.0);
        float _1726 = precise::min(_1718, 1.0);
        float _1728 = precise::min(_1722, 1.0);
        float _1730 = precise::max(_1720, -1.0);
        float _1732 = precise::max(_1724, -1.0);
        float _1734 = precise::max(_1726, -1.0);
        float _1736 = precise::max(_1728, -1.0);
        float _1738 = _1736;
        if (_1686)
        {
            _1738 = _1730;
        }
        float _1740 = _1738;
        float _1742 = _1740;
        if (_1688)
        {
            _1742 = _1732;
        }
        float _1744 = _1742;
        float _1746 = _1744;
        if (_1690)
        {
            _1746 = _1734;
        }
        float _1748 = _1746;
        float _1750 = abs(_1748);
        float _1752 = (-0.0) + _1750;
        _1680 = _1752;
    }
    float _1754 = _1680;
    bool _1756 = _1754 != 0.0;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1672;
    float _1768 = fma(_1292, _1766, _1662);
    float _1770 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = -_1650;
    float _1774 = fma(_1772, _1674, _1668);
    float _1776 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1778 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1654);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = -_890;
    float _1786 = _1784 + 1.0;
    float _1788 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1776;
    float _1792 = _1780;
    if (!_1764)
    {
        _1790 = 0.0;
    }
    float _1794 = _1790;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1764)
    {
        _1792 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1798 = _1792;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1802 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1806 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1664);
    float _1808 = _1794 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1812 = as_type<int>(_1798);
    if (!_1764)
    {
        float _1814 = _1798 * 5.0;
        _1812 = as_type<int>(_1814);
    }
    int _1816 = _1812;
    float _1818 = fma(_1466, _1786, _1774);
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _1804;
    out.gl_Position.w = _1806;
    out.m_58.x = _1788;
    out.m_58.y = _1802;
    out.m_58.z = _1810;
    out.m_60.w = _1808;
    if (!_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4463 = as_type<float>(_1816);
        out.gl_Position.z = _4463;
    }
    out.m_62.x = _1768;
    out.m_62.y = _1818;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

