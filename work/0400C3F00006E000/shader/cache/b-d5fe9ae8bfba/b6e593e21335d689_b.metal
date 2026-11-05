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
    float4 m_60 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1776 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1947 = as_type<float>(_97);
        out.gl_Position.z = _1947;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_135);
        out.gl_Position.z = _2017;
    }
    if (_127)
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
        float _159 = in.m_42.x;
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
    float _191 = in.m_44.x;
    float _193 = in.m_44.y;
    float _195 = in.m_44.z;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = float(_81);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _209 = int(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _185 + _219;
    float _223 = float(_189);
    float _225 = 1.0 / _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _227 = 1.0;
    }
    float _229 = _227;
    float _231 = _229;
    if (!_199)
    {
        _231 = 7.345489978790283203125;
    }
    float _233 = _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _235;
    float _239 = 1.0 / _223;
    float _241 = float(uint(_209));
    int _243 = ~_209;
    int _245 = _243 + 1;
    int _247 = _209 + (-1);
    int _249 = ~_209;
    int _251 = _249 + 1;
    float _253 = 1.0 / _241;
    float _255 = _239 * _115;
    float _257 = 1.0 / _213;
    float _259 = in.m_32.x;
    float _261 = in.m_32.y;
    float _263 = in.m_32.z;
    int _265 = as_type<int>(_253) + (-2);
    float _267 = trunc(_255);
    int _269 = int(_267);
    float _271 = in.m_46.x;
    float _273 = in.m_46.y;
    float _275 = in.m_46.z;
    float _277 = float(_209);
    float _279 = 1.0 / _217;
    float _281 = float(uint(_269));
    float _283 = _261 * _193;
    float _285 = _277 * _115;
    float _287 = as_type<float>(_265) * _281;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = in.m_42.z;
    float _295 = _221 * _279;
    float _297 = trunc(_287);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = _261 * _273;
    float _306 = fma(_259, _191, _283);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _185 + _308;
    float _312 = fma(_259, _271, _304);
    float _314 = fma(_263, _195, _306);
    float _316 = float(_269);
    float _318 = 1.0 / _201;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _322 = _310 * _257;
    float _324 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _326 = _245 * int(_302);
    int _328 = _326 + _269;
    int _330 = ~_209;
    int _332 = _330 + 1;
    float _334 = float(uint(_328));
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _340 = _285 * _318;
    float _342 = as_type<float>(_265) * _334;
    float _344 = fma(_338, -2.0, _336);
    float _346 = _289 * 2.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _185 + _348;
    float _352 = trunc(_340);
    int _354 = int(_352);
    float _356 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _358 = -_320;
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[77].x, _358);
    float _362 = _350 * _225;
    float _364 = trunc(_342);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = floor(_346);
    int _372 = int(_302) + int(_368);
    float _374 = _289 * _233;
    int _376 = _332 * _372;
    int _378 = _376 + _269;
    float _380 = fma(_263, _275, _312);
    float _382 = floor(_374);
    bool _384 = _316 >= _277;
    bool _386 = isnan(_316);
    bool _388 = _384 || _386;
    bool _390 = isnan(_277);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _291 + _293;
    bool _398 = uint(_378) >= uint(_209);
    float _400 = _291 + _289;
    bool _402 = _370 > 0.0;
    float _404 = _291 * 2.0;
    bool _406 = _370 >= 0.0;
    bool _408 = isnan(_370);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _400 + (-1.0);
    float _418 = trunc(_394);
    int _420 = int(_418);
    bool _422 = !_398;
    int _424 = _422 ? 0 : (-1);
    float _426 = _396 + (-1.0);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _430 = ~_372;
    int _432 = _430 + _424;
    int _434 = _432 + 1;
    float _436 = _293 + _289;
    float _438 = -_382;
    float _440 = _374 + _438;
    float _442 = floor(_404);
    int _444 = _209 * _434;
    int _446 = _444 + _269;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _458 = _456 != 0;
    float _460 = _293 * 2.0;
    bool _462 = _209 == 0;
    float _464 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _466 = ~_420;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = floor(_460);
    float _474 = _436 + (-1.0);
    bool _476 = !_462;
    int _478 = _476 ? _446 : (-1);
    float _480 = _440 * _277;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = _478 * _470;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _492 = _490 != 0;
    float _494 = trunc(_480);
    int _496 = int(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    int _502 = _420 * _247;
    int _504 = _502 + _488;
    bool _506 = !_492;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _514 = !_450;
    int _516 = _514 ? 0 : 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _522 = !_458;
    int _524 = _522 ? 0 : 1;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    float _534 = fma(_500, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _536 = abs(_486);
    float _538 = fma(_237, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _540 = abs(_508);
    float _542 = fma(_512, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _544 = abs(_516);
    float _546 = fma(_520, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _548 = !_532;
    int _550 = _548 ? 0 : 1;
    int _552 = _504 * _536;
    int _554 = abs(_524);
    int _556 = _354 * _544;
    int _558 = _556 + _552;
    int _560 = abs(_550);
    int _562 = _496 * _540;
    int _564 = _562 + _269;
    float _566 = _528 * _115;
    int _568 = _564 * _554;
    int _570 = _568 + _558;
    bool _572 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_185);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    int _584 = _496 * _560;
    int _586 = _584 + _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _588;
    float _592 = exp2(_566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _594;
    bool _598 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _600 = isnan(_185);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_590, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _612 = float(uint(_586));
    float _614 = fma(_596, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _616 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_185);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _630 = isnan(_185);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = as_type<float>(_265) * _612;
    bool _642 = _472 > 0.0;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = _472 >= 0.0;
    bool _652 = isnan(_472);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _662 = 1.0 + _660;
    int _664 = _414 ? 0 : 1;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = -_592;
    float _672 = _670 + 1.0;
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = 1.0 / _662;
    float _686 = _582 * _668;
    float _688 = -_582;
    float _690 = _688 + 1.0;
    float _692 = _682 ? _672 : 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = _626 * _690;
    float _708 = -_626;
    float _710 = _708 + 1.0;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _714 = _251 * int(_648);
    int _716 = _714 + _586;
    float _718 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _720 = _608 * _710;
    float _722 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].w, _712);
    float _724 = -_115;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _728 = float(uint(_716));
    float _730 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = -_608;
    float _734 = _732 + 1.0;
    float _736 = _534 * _720;
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _722);
    float _740 = _261;
    if (_704)
    {
        float _742 = _692 * _684;
        _117 = _742;
    }
    float _744 = _117;
    float _746 = _538 * _720;
    float _748 = as_type<float>(_265) * _728;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    bool _752 = _442 > 0.0;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].y, _746);
    bool _756 = _442 >= 0.0;
    bool _758 = isnan(_442);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_542, _706, _750);
    float _768 = trunc(_748);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = fma(_546, _706, _754);
    int _776 = _764 ? 0 : 1;
    float _778 = fma(_610, _686, _766);
    int _780 = ~_664;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_614, _686, _774);
    int _788 = _784;
    if (!_402)
    {
        int _790 = ~_664;
        int _792 = _790 + 1;
        _788 = _792;
    }
    int _794 = _788;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].x, _778);
    bool _798 = _293 > 0.5;
    float _800 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    bool _802 = _291 > 0.5;
    float _804 = _291 + (-0.5);
    float _806 = float(uint(_564));
    int _808 = ~_776;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _812;
    if (!_752)
    {
        int _816 = ~_776;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    float _822 = as_type<float>(_265) * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = -_155;
    int _834 = _798 ? as_type<int>(_832) : as_type<int>(_155);
    float _836 = -_151;
    int _838 = _802 ? as_type<int>(_836) : as_type<int>(_151);
    float _840 = trunc(_822);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _658 ? 0 : 1;
    bool _848 = !_826;
    float _850 = _848 ? _151 : as_type<float>(_838);
    bool _852 = !_830;
    float _854 = _852 ? _155 : as_type<float>(_834);
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    int _860 = ~_209;
    int _862 = _860 + 1;
    int _864 = int(_648) + int(_772);
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    int _878 = ~_846;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = _862 * _864;
    int _886 = _884 + _586;
    int _888 = _882;
    if (!_642)
    {
        int _890 = ~_846;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    bool _896 = !_872;
    int _898 = _896 ? 0 : 1;
    bool _900 = !_876;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_868;
    int _906 = _904 ? 0 : 1;
    float _908 = float(_794);
    int _910 = abs(_898);
    bool _912 = uint(_886) >= uint(_209);
    int _914 = abs(_902);
    float _916 = in.m_50.x;
    float _918 = in.m_50.y;
    float _920 = in.m_50.z;
    float _922 = float(_820);
    float _924 = _796 * _856;
    int _926 = abs(_906);
    float _928 = _800 * _858;
    int _930 = ~_209;
    int _932 = _930 + 1;
    float _934 = float(_894);
    float _936 = float(_914);
    int _938 = _932 * int(_844);
    int _940 = _938 + _564;
    bool _942 = !_912;
    int _944 = _942 ? 0 : (-1);
    float _946 = float(_910);
    float _948 = _936 * _922;
    int _950 = ~_864;
    int _952 = _950 + _944;
    int _954 = _952 + 1;
    float _956 = float(_926);
    float _958 = _946 * _908;
    float _960 = float(uint(_940));
    int _962 = _209 * _954;
    int _964 = _962 + _586;
    float _966 = _956 * _934;
    float _968 = _958 * (-2.0);
    float _970 = as_type<float>(_265) * _960;
    bool _972 = !_462;
    int _974 = _972 ? _964 : (-1);
    float _976 = _966 * (-2.0);
    float _978 = fma(_968, _918, _918);
    float _980 = _948 * (-2.0);
    int _982 = _974 >> 31;
    float _984 = fma(_428, _976, _428);
    float _986 = fma(_976, _916, _916);
    float _988 = _289 + (-0.5);
    float _990 = fma(_464, _968, _464);
    int _992 = _982 & 3;
    float _994 = trunc(_970);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _986);
    float _1002 = fma(_980, _920, _920);
    int _1004 = _974 + _992;
    float _1006 = fma(_482, _980, _482);
    float _1008 = fma(_984, _744, _1000);
    int _1010 = ~_209;
    int _1012 = _1010 + 1;
    float _1014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1016 = _1004 >> 2;
    float _1018 = _1008 * 0.15915493667125701904296875;
    float _1020 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1024 = _1016 << 4;
    int _1026 = _1024 + 368;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1030 = fma(_990, _744, _1020);
    int _1032 = _974 & 3;
    bool _1034 = _1032 != 0;
    uint _1036 = uint(int(uint(_1026) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_844) + int(_998);
    float _1054 = _293 + (-0.5);
    float _1056 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1058 = _974 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1014 * _1028;
    int _1064 = _1012 * _1052;
    int _1066 = _1064 + _564;
    bool _1068 = _1032 != 3;
    int _1070 = _1026 + 8;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    float _1088 = _1056 * _1022;
    float _1090 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1002);
    bool _1092 = uint(_1066) >= uint(_209);
    float _1094 = _1030 * 0.15915493667125701904296875;
    bool _1096 = uint(_1032) >= 2u;
    float _1098 = fma(_1006, _744, _1090);
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1106 = int(_1104);
    bool _1108 = uint(_1032) > 1u;
    float _1110 = _1098 * 0.15915493667125701904296875;
    int _1112 = ~_1052;
    int _1114 = _1112 + _1102;
    int _1116 = _1114 + 1;
    int _1118 = _1060 ? 0 : 1;
    int _1120 = _1096 ? 0 : 1;
    int _1122 = _209 * _1116;
    int _1124 = _1122 + _564;
    int _1126 = ~_1118;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = _1018 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    bool _1136 = !_1034;
    int _1138 = _1136 ? 0 : 1;
    bool _1140 = _1032 != 3;
    int _1142 = _1130;
    if (!_1108)
    {
        int _1144 = ~_1118;
        int _1146 = _1144 + 1;
        _1142 = _1146;
    }
    int _1148 = _1142;
    int _1150 = ~_1120;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _1018 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    int _1160 = _1154;
    if (_1068)
    {
        int _1162 = ~_1120;
        int _1164 = _1162 + 1;
        _1160 = _1164;
    }
    int _1166 = _1160;
    int _1168 = abs(_1148);
    int _1170 = abs(_1138);
    bool _1172 = !_1140;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = _1094 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = abs(_1166);
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = abs(_1174);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1186 * as_type<int>(_1050);
    float _1198 = _1094 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = _1194 * as_type<int>(_1042);
    int _1208 = _1206 + _1196;
    int _1210 = ~_1180;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    bool _1216 = !_1204;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1188;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    int _1226 = _1214 * as_type<int>(_1078);
    int _1228 = _1226 + _1208;
    int _1230 = abs(_1106);
    float _1232 = _1110 * 6.283185482025146484375;
    float _1234 = cos(_1232);
    int _1236 = abs(_1218);
    int _1238 = _1224 * as_type<int>(_1086);
    int _1240 = _1238 + _1228;
    float _1242 = float(uint(_1106));
    float _1244 = _1158 * _1178;
    float _1246 = _1134 * _1200;
    int _1248 = ~_1236;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1110 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    bool _1258 = !_462;
    int _1260 = _1258 ? _1124 : (-1);
    bool _1262 = _289 > 0.5;
    int _1264 = _1240 * _1252;
    float _1266 = _1158 * _1200;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = 1.0 / _1242;
    float _1274 = float(uint(_1230));
    int _1276 = _1260 * _1236;
    int _1278 = _1276 + _1264;
    float _1280 = _1134 * _1178;
    float _1282 = _1234 * _1062;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1274;
    float _1290 = _1178 * _1234;
    float _1292 = _1200 * _1234;
    float _1294 = -_1244;
    float _1296 = fma(_1256, _1246, _1294);
    float _1298 = _1256 * _1062;
    float _1300 = -_1246;
    float _1302 = fma(_1256, _1244, _1300);
    float _1304 = fma(_1256, _1266, _1280);
    float _1306 = fma(_1256, _1280, _1266);
    int _1308 = as_type<int>(_1272) + (-2);
    float _1310 = -_1298;
    float _1312 = fma(_1292, _1088, _1310);
    float _1314 = float(uint(_1278));
    float _1316 = _1158 * _1282;
    int _1318 = abs(_1278);
    float _1320 = _1134 * _1282;
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1324 = as_type<float>(_1308) * _1314;
    float _1326 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1328 = as_type<int>(_1288) + (-2);
    float _1330 = fma(_1304, _1088, _1316);
    float _1332 = float(uint(_1318));
    float _1334 = fma(_1296, _1088, _1320);
    float _1336 = trunc(_1324);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1302, _1326, _1330);
    float _1344 = fma(_1290, _1326, _1312);
    float _1346 = as_type<float>(_1328) * _1332;
    float _1348 = fma(_1306, _1326, _1334);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1354 = ~_1106;
    int _1356 = _1354 + 1;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = trunc(_1346);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1352);
    float _1370 = in.m_52.x;
    float _1372 = in.m_52.y;
    float _1374 = in.m_52.z;
    int _1376 = ~_1230;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1366);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1368);
    int _1384 = _1356 * int(_1340);
    int _1386 = _1384 + _1278;
    float _1388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1394 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1396 = float(uint(_1386));
    float _1398 = _324 + _1390;
    float _1400 = _1388 + _1392;
    float _1402 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    int _1404 = _1378 * int(_1364);
    int _1406 = _1404 + _1318;
    float _1408 = as_type<float>(_1308) * _1396;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1412 = _1398 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1416 = _1400 + _1414;
    float _1418 = float(uint(_1406));
    float _1420 = _1412 * _1412;
    float _1422 = _1416 * _1416;
    float _1424 = trunc(_1408);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1328) * _1418;
    float _1432 = _1420 + _1422;
    float _1434 = _261 * _1372;
    float _1436 = sqrt(_1432);
    float _1438 = fma(_259, _1370, _1434);
    float _1440 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1442 = ~_1230;
    int _1444 = _1442 + 1;
    float _1446 = fma(_263, _1374, _1438);
    int _1448 = ~_1106;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1430);
    float _1454 = precise::max(_1452, 0.0);
    uint _1456 = uint(_1454);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _1458 + _1440;
    int _1464 = _1450 * _1460;
    int _1466 = _1464 + _1278;
    bool _1468 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1472 = uint(_1466) >= uint(_1106);
    int _1474 = int(_1364) + int(_1456);
    int _1476 = _1444 * _1474;
    int _1478 = _1476 + _1318;
    float _1480 = as_type<float>(_1466);
    float _1482 = as_type<float>(_1478);
    float _1484 = _1458;
    float _1486 = _1374;
    if (!_1468)
    {
        _1480 = _1422;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (!_1468)
    {
        _740 = _1420;
    }
    float _1492 = _740;
    bool _1494 = uint(_1478) >= uint(_1230);
    float _1496 = _1492;
    if (!_1468)
    {
        _1482 = _1398;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1468)
    {
        _1484 = _1400;
    }
    float _1502 = _1484;
    int _1504 = _1278 ^ _1106;
    bool _1506 = !_1472;
    int _1508 = _1506 ? 0 : (-1);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : (-1);
    float _1514 = _1502;
    if (!_1468)
    {
        _1486 = _1462;
    }
    float _1516 = _1486;
    bool _1518 = !_1468;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1436 + _1524;
        float _1528 = rsqrt(_1432);
        float _1530 = _1526 * _1522;
        float _1532 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = fma(_1538, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1546 = _1528 * _1544;
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1412, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1552 = fma(_1416, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1558 = _1550 + _1556;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1562 = _1552 + _1560;
        float _1564 = fma(_1462, _1542, _1554);
        float _1566 = _1558 * _1558;
        float _1568 = _1562 * _1562;
        _1520 = _1564;
        _1496 = _1566;
        _1490 = _1568;
        _1500 = _1550;
        _1514 = _1552;
    }
    float _1570 = _1520;
    float _1572 = _1496;
    float _1574 = _1490;
    float _1576 = _1500;
    float _1578 = _1514;
    uint _1580 = uint(int(uint(_1504) >> uint(31)));
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1584 = _1570 + _1582;
    int _1586 = ~_1512;
    int _1588 = _1474 + _1586;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1594 = ~int(_1580);
    int _1596 = _1594 + 1;
    float _1598 = fma(_1584, _1584, _1572);
    int _1600 = ~_1460;
    int _1602 = _1600 + _1508;
    int _1604 = _1602 + 1;
    float _1606 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1608 = -_151;
    int _1610 = _1262 ? as_type<int>(_1608) : as_type<int>(_151);
    float _1612 = _850 + 0.5;
    int _1614 = _1590 ^ _1596;
    float _1616 = -_854;
    float _1618 = _1616 + 0.5;
    bool _1620 = _1106 == 0;
    float _1622 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1624 = _1106 == 0;
    int _1626 = _1106 * _1604;
    int _1628 = _1626 + _1278;
    bool _1630 = !_1270;
    float _1632 = _1630 ? _151 : as_type<float>(_1610);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1636 = ~_1596;
    int _1638 = _1636 + _1614;
    int _1640 = _1638 + 1;
    float _1642 = _1598 + _1574;
    bool _1644 = !_1620;
    int _1646 = _1644 ? _1628 : (-1);
    float _1648 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1650 = !_1624;
    int _1652 = _1650 ? _1640 : (-1);
    float _1654 = -_730;
    float _1656 = _1654 + 1.0;
    float _1658 = -_155;
    int _1660 = _802 ? as_type<int>(_1658) : as_type<int>(_155);
    float _1662 = sqrt(_1642);
    float _1664 = float(_1646);
    float _1666 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1668 = float(_1652);
    float _1670 = -_738;
    float _1672 = _1670 + 1.0;
    bool _1674 = !_1286;
    float _1676 = _1674 ? _155 : as_type<float>(_1660);
    float _1678 = fma(_1606, _1664, _726);
    float _1680 = _1632 + 0.5;
    float _1682 = -_356;
    float _1684 = fma(_1666, _1668, _1682);
    float _1686 = _1676 + (-0.5);
    float _1688 = fma(_1606, _1680, _1678);
    float _1690 = _1622 * _1592;
    float _1692 = -_1666;
    float _1694 = fma(_1692, _1686, _1684);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = _1648 * _1634;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = -_1656;
    float _1726 = fma(_1632, _1724, _1688);
    float _1728 = fma(_1676, _1672, _1694);
    out.m_54.x = _1710;
    out.m_54.y = _1714;
    out.m_54.z = _1716;
    out.m_54.w = _1712;
    bool _1730 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1732 = isnan(_1662);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1738 = _1734 || _1736;
    out.m_56.x = _1718;
    out.m_56.y = _1720;
    out.m_56.z = _1722;
    out.m_58.x = _1690;
    out.m_58.y = _1706;
    out.m_60.x = _1726;
    out.m_60.y = _1728;
    float _1740 = _1632;
    if (!_1738)
    {
        _1740 = 1.0;
    }
    float _1742 = _1740;
    bool _1744 = !_1738;
    float _1746 = _1742;
    if (!_1744)
    {
        bool _1748 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1750 = isnan(_1662);
        bool _1752 = _1748 || _1750;
        bool _1754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1756 = _1752 || _1754;
        if (!_1756)
        {
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = _1662 + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1770 = 1.0 / _1764;
            float _1772 = _1760 * _1770;
            float _1774 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1746 = _1774;
            _1776 = true;
        }
        else
        {
            bool _1778 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1780 = isnan(_1662);
            bool _1782 = _1778 || _1780;
            bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1786 = _1782 || _1784;
            if (!_1786)
            {
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1662 + _1788;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1800 = 1.0 / _1794;
                float _1802 = _1790 * _1800;
                float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1746 = _1804;
                _1776 = true;
            }
            else
            {
                _1746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1776 = false;
    float _1806 = _1746;
    float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1810 = _1570 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1814 = _1576 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1818 = _1578 + _1816;
    out.m_35.x = 1.0;
    float _1820 = fma(_1810, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1822 = fma(_1814, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1824 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1826 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1834 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1828);
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1832);
    float _1842 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1834);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1836);
    float _1846 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1838);
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1874);
    float _1886 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1888 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1878);
    float _1890 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    out.m_62.w = _1882;
    out.gl_Position.x = _1886;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1776 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1947 = as_type<float>(_97);
        out.gl_Position.z = _1947;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_135);
        out.gl_Position.z = _2017;
    }
    if (_127)
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
        float _159 = in.m_42.x;
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
    float _191 = in.m_44.x;
    float _193 = in.m_44.y;
    float _195 = in.m_44.z;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = float(_81);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _209 = int(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _185 + _219;
    float _223 = float(_189);
    float _225 = 1.0 / _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _227 = 1.0;
    }
    float _229 = _227;
    float _231 = _229;
    if (!_199)
    {
        _231 = 7.345489978790283203125;
    }
    float _233 = _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _235;
    float _239 = 1.0 / _223;
    float _241 = float(uint(_209));
    int _243 = ~_209;
    int _245 = _243 + 1;
    int _247 = _209 + (-1);
    int _249 = ~_209;
    int _251 = _249 + 1;
    float _253 = 1.0 / _241;
    float _255 = _239 * _115;
    float _257 = 1.0 / _213;
    float _259 = in.m_32.x;
    float _261 = in.m_32.y;
    float _263 = in.m_32.z;
    int _265 = as_type<int>(_253) + (-2);
    float _267 = trunc(_255);
    int _269 = int(_267);
    float _271 = in.m_46.x;
    float _273 = in.m_46.y;
    float _275 = in.m_46.z;
    float _277 = float(_209);
    float _279 = 1.0 / _217;
    float _281 = float(uint(_269));
    float _283 = _261 * _193;
    float _285 = _277 * _115;
    float _287 = as_type<float>(_265) * _281;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = in.m_42.z;
    float _295 = _221 * _279;
    float _297 = trunc(_287);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = _261 * _273;
    float _306 = fma(_259, _191, _283);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _185 + _308;
    float _312 = fma(_259, _271, _304);
    float _314 = fma(_263, _195, _306);
    float _316 = float(_269);
    float _318 = 1.0 / _201;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _322 = _310 * _257;
    float _324 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _326 = _245 * int(_302);
    int _328 = _326 + _269;
    int _330 = ~_209;
    int _332 = _330 + 1;
    float _334 = float(uint(_328));
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _340 = _285 * _318;
    float _342 = as_type<float>(_265) * _334;
    float _344 = fma(_338, -2.0, _336);
    float _346 = _289 * 2.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _185 + _348;
    float _352 = trunc(_340);
    int _354 = int(_352);
    float _356 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _358 = -_320;
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[77].x, _358);
    float _362 = _350 * _225;
    float _364 = trunc(_342);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = floor(_346);
    int _372 = int(_302) + int(_368);
    float _374 = _289 * _233;
    int _376 = _332 * _372;
    int _378 = _376 + _269;
    float _380 = fma(_263, _275, _312);
    float _382 = floor(_374);
    bool _384 = _316 >= _277;
    bool _386 = isnan(_316);
    bool _388 = _384 || _386;
    bool _390 = isnan(_277);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _291 + _293;
    bool _398 = uint(_378) >= uint(_209);
    float _400 = _291 + _289;
    bool _402 = _370 > 0.0;
    float _404 = _291 * 2.0;
    bool _406 = _370 >= 0.0;
    bool _408 = isnan(_370);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _400 + (-1.0);
    float _418 = trunc(_394);
    int _420 = int(_418);
    bool _422 = !_398;
    int _424 = _422 ? 0 : (-1);
    float _426 = _396 + (-1.0);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _430 = ~_372;
    int _432 = _430 + _424;
    int _434 = _432 + 1;
    float _436 = _293 + _289;
    float _438 = -_382;
    float _440 = _374 + _438;
    float _442 = floor(_404);
    int _444 = _209 * _434;
    int _446 = _444 + _269;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _458 = _456 != 0;
    float _460 = _293 * 2.0;
    bool _462 = _209 == 0;
    float _464 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _466 = ~_420;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = floor(_460);
    float _474 = _436 + (-1.0);
    bool _476 = !_462;
    int _478 = _476 ? _446 : (-1);
    float _480 = _440 * _277;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = _478 * _470;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _492 = _490 != 0;
    float _494 = trunc(_480);
    int _496 = int(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    int _502 = _420 * _247;
    int _504 = _502 + _488;
    bool _506 = !_492;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _514 = !_450;
    int _516 = _514 ? 0 : 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _522 = !_458;
    int _524 = _522 ? 0 : 1;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    float _534 = fma(_500, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _536 = abs(_486);
    float _538 = fma(_237, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _540 = abs(_508);
    float _542 = fma(_512, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _544 = abs(_516);
    float _546 = fma(_520, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _548 = !_532;
    int _550 = _548 ? 0 : 1;
    int _552 = _504 * _536;
    int _554 = abs(_524);
    int _556 = _354 * _544;
    int _558 = _556 + _552;
    int _560 = abs(_550);
    int _562 = _496 * _540;
    int _564 = _562 + _269;
    float _566 = _528 * _115;
    int _568 = _564 * _554;
    int _570 = _568 + _558;
    bool _572 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_185);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    int _584 = _496 * _560;
    int _586 = _584 + _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _588;
    float _592 = exp2(_566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _594;
    bool _598 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _600 = isnan(_185);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_590, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _612 = float(uint(_586));
    float _614 = fma(_596, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _616 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_185);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _630 = isnan(_185);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = as_type<float>(_265) * _612;
    bool _642 = _472 > 0.0;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = _472 >= 0.0;
    bool _652 = isnan(_472);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _662 = 1.0 + _660;
    int _664 = _414 ? 0 : 1;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = -_592;
    float _672 = _670 + 1.0;
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = 1.0 / _662;
    float _686 = _582 * _668;
    float _688 = -_582;
    float _690 = _688 + 1.0;
    float _692 = _682 ? _672 : 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = _626 * _690;
    float _708 = -_626;
    float _710 = _708 + 1.0;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _714 = _251 * int(_648);
    int _716 = _714 + _586;
    float _718 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _720 = _608 * _710;
    float _722 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].w, _712);
    float _724 = -_115;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _728 = float(uint(_716));
    float _730 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = -_608;
    float _734 = _732 + 1.0;
    float _736 = _534 * _720;
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _722);
    float _740 = _261;
    if (_704)
    {
        float _742 = _692 * _684;
        _117 = _742;
    }
    float _744 = _117;
    float _746 = _538 * _720;
    float _748 = as_type<float>(_265) * _728;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    bool _752 = _442 > 0.0;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].y, _746);
    bool _756 = _442 >= 0.0;
    bool _758 = isnan(_442);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_542, _706, _750);
    float _768 = trunc(_748);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = fma(_546, _706, _754);
    int _776 = _764 ? 0 : 1;
    float _778 = fma(_610, _686, _766);
    int _780 = ~_664;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_614, _686, _774);
    int _788 = _784;
    if (!_402)
    {
        int _790 = ~_664;
        int _792 = _790 + 1;
        _788 = _792;
    }
    int _794 = _788;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].x, _778);
    bool _798 = _293 > 0.5;
    float _800 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    bool _802 = _291 > 0.5;
    float _804 = _291 + (-0.5);
    float _806 = float(uint(_564));
    int _808 = ~_776;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _812;
    if (!_752)
    {
        int _816 = ~_776;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    float _822 = as_type<float>(_265) * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = -_155;
    int _834 = _798 ? as_type<int>(_832) : as_type<int>(_155);
    float _836 = -_151;
    int _838 = _802 ? as_type<int>(_836) : as_type<int>(_151);
    float _840 = trunc(_822);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _658 ? 0 : 1;
    bool _848 = !_826;
    float _850 = _848 ? _151 : as_type<float>(_838);
    bool _852 = !_830;
    float _854 = _852 ? _155 : as_type<float>(_834);
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    int _860 = ~_209;
    int _862 = _860 + 1;
    int _864 = int(_648) + int(_772);
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    int _878 = ~_846;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = _862 * _864;
    int _886 = _884 + _586;
    int _888 = _882;
    if (!_642)
    {
        int _890 = ~_846;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    bool _896 = !_872;
    int _898 = _896 ? 0 : 1;
    bool _900 = !_876;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_868;
    int _906 = _904 ? 0 : 1;
    float _908 = float(_794);
    int _910 = abs(_898);
    bool _912 = uint(_886) >= uint(_209);
    int _914 = abs(_902);
    float _916 = in.m_50.x;
    float _918 = in.m_50.y;
    float _920 = in.m_50.z;
    float _922 = float(_820);
    float _924 = _796 * _856;
    int _926 = abs(_906);
    float _928 = _800 * _858;
    int _930 = ~_209;
    int _932 = _930 + 1;
    float _934 = float(_894);
    float _936 = float(_914);
    int _938 = _932 * int(_844);
    int _940 = _938 + _564;
    bool _942 = !_912;
    int _944 = _942 ? 0 : (-1);
    float _946 = float(_910);
    float _948 = _936 * _922;
    int _950 = ~_864;
    int _952 = _950 + _944;
    int _954 = _952 + 1;
    float _956 = float(_926);
    float _958 = _946 * _908;
    float _960 = float(uint(_940));
    int _962 = _209 * _954;
    int _964 = _962 + _586;
    float _966 = _956 * _934;
    float _968 = _958 * (-2.0);
    float _970 = as_type<float>(_265) * _960;
    bool _972 = !_462;
    int _974 = _972 ? _964 : (-1);
    float _976 = _966 * (-2.0);
    float _978 = fma(_968, _918, _918);
    float _980 = _948 * (-2.0);
    int _982 = _974 >> 31;
    float _984 = fma(_428, _976, _428);
    float _986 = fma(_976, _916, _916);
    float _988 = _289 + (-0.5);
    float _990 = fma(_464, _968, _464);
    int _992 = _982 & 3;
    float _994 = trunc(_970);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _986);
    float _1002 = fma(_980, _920, _920);
    int _1004 = _974 + _992;
    float _1006 = fma(_482, _980, _482);
    float _1008 = fma(_984, _744, _1000);
    int _1010 = ~_209;
    int _1012 = _1010 + 1;
    float _1014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1016 = _1004 >> 2;
    float _1018 = _1008 * 0.15915493667125701904296875;
    float _1020 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1024 = _1016 << 4;
    int _1026 = _1024 + 368;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1030 = fma(_990, _744, _1020);
    int _1032 = _974 & 3;
    bool _1034 = _1032 != 0;
    uint _1036 = uint(int(uint(_1026) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_844) + int(_998);
    float _1054 = _293 + (-0.5);
    float _1056 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1058 = _974 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1014 * _1028;
    int _1064 = _1012 * _1052;
    int _1066 = _1064 + _564;
    bool _1068 = _1032 != 3;
    int _1070 = _1026 + 8;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    float _1088 = _1056 * _1022;
    float _1090 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1002);
    bool _1092 = uint(_1066) >= uint(_209);
    float _1094 = _1030 * 0.15915493667125701904296875;
    bool _1096 = uint(_1032) >= 2u;
    float _1098 = fma(_1006, _744, _1090);
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1106 = int(_1104);
    bool _1108 = uint(_1032) > 1u;
    float _1110 = _1098 * 0.15915493667125701904296875;
    int _1112 = ~_1052;
    int _1114 = _1112 + _1102;
    int _1116 = _1114 + 1;
    int _1118 = _1060 ? 0 : 1;
    int _1120 = _1096 ? 0 : 1;
    int _1122 = _209 * _1116;
    int _1124 = _1122 + _564;
    int _1126 = ~_1118;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = _1018 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    bool _1136 = !_1034;
    int _1138 = _1136 ? 0 : 1;
    bool _1140 = _1032 != 3;
    int _1142 = _1130;
    if (!_1108)
    {
        int _1144 = ~_1118;
        int _1146 = _1144 + 1;
        _1142 = _1146;
    }
    int _1148 = _1142;
    int _1150 = ~_1120;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _1018 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    int _1160 = _1154;
    if (_1068)
    {
        int _1162 = ~_1120;
        int _1164 = _1162 + 1;
        _1160 = _1164;
    }
    int _1166 = _1160;
    int _1168 = abs(_1148);
    int _1170 = abs(_1138);
    bool _1172 = !_1140;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = _1094 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = abs(_1166);
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = abs(_1174);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1186 * as_type<int>(_1050);
    float _1198 = _1094 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = _1194 * as_type<int>(_1042);
    int _1208 = _1206 + _1196;
    int _1210 = ~_1180;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    bool _1216 = !_1204;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1188;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    int _1226 = _1214 * as_type<int>(_1078);
    int _1228 = _1226 + _1208;
    int _1230 = abs(_1106);
    float _1232 = _1110 * 6.283185482025146484375;
    float _1234 = cos(_1232);
    int _1236 = abs(_1218);
    int _1238 = _1224 * as_type<int>(_1086);
    int _1240 = _1238 + _1228;
    float _1242 = float(uint(_1106));
    float _1244 = _1158 * _1178;
    float _1246 = _1134 * _1200;
    int _1248 = ~_1236;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1110 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    bool _1258 = !_462;
    int _1260 = _1258 ? _1124 : (-1);
    bool _1262 = _289 > 0.5;
    int _1264 = _1240 * _1252;
    float _1266 = _1158 * _1200;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = 1.0 / _1242;
    float _1274 = float(uint(_1230));
    int _1276 = _1260 * _1236;
    int _1278 = _1276 + _1264;
    float _1280 = _1134 * _1178;
    float _1282 = _1234 * _1062;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1274;
    float _1290 = _1178 * _1234;
    float _1292 = _1200 * _1234;
    float _1294 = -_1244;
    float _1296 = fma(_1256, _1246, _1294);
    float _1298 = _1256 * _1062;
    float _1300 = -_1246;
    float _1302 = fma(_1256, _1244, _1300);
    float _1304 = fma(_1256, _1266, _1280);
    float _1306 = fma(_1256, _1280, _1266);
    int _1308 = as_type<int>(_1272) + (-2);
    float _1310 = -_1298;
    float _1312 = fma(_1292, _1088, _1310);
    float _1314 = float(uint(_1278));
    float _1316 = _1158 * _1282;
    int _1318 = abs(_1278);
    float _1320 = _1134 * _1282;
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1324 = as_type<float>(_1308) * _1314;
    float _1326 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1328 = as_type<int>(_1288) + (-2);
    float _1330 = fma(_1304, _1088, _1316);
    float _1332 = float(uint(_1318));
    float _1334 = fma(_1296, _1088, _1320);
    float _1336 = trunc(_1324);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1302, _1326, _1330);
    float _1344 = fma(_1290, _1326, _1312);
    float _1346 = as_type<float>(_1328) * _1332;
    float _1348 = fma(_1306, _1326, _1334);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1354 = ~_1106;
    int _1356 = _1354 + 1;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = trunc(_1346);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1352);
    float _1370 = in.m_52.x;
    float _1372 = in.m_52.y;
    float _1374 = in.m_52.z;
    int _1376 = ~_1230;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1366);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1368);
    int _1384 = _1356 * int(_1340);
    int _1386 = _1384 + _1278;
    float _1388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1394 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1396 = float(uint(_1386));
    float _1398 = _324 + _1390;
    float _1400 = _1388 + _1392;
    float _1402 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    int _1404 = _1378 * int(_1364);
    int _1406 = _1404 + _1318;
    float _1408 = as_type<float>(_1308) * _1396;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1412 = _1398 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1416 = _1400 + _1414;
    float _1418 = float(uint(_1406));
    float _1420 = _1412 * _1412;
    float _1422 = _1416 * _1416;
    float _1424 = trunc(_1408);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1328) * _1418;
    float _1432 = _1420 + _1422;
    float _1434 = _261 * _1372;
    float _1436 = sqrt(_1432);
    float _1438 = fma(_259, _1370, _1434);
    float _1440 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1442 = ~_1230;
    int _1444 = _1442 + 1;
    float _1446 = fma(_263, _1374, _1438);
    int _1448 = ~_1106;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1430);
    float _1454 = precise::max(_1452, 0.0);
    uint _1456 = uint(_1454);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _1458 + _1440;
    int _1464 = _1450 * _1460;
    int _1466 = _1464 + _1278;
    bool _1468 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1472 = uint(_1466) >= uint(_1106);
    int _1474 = int(_1364) + int(_1456);
    int _1476 = _1444 * _1474;
    int _1478 = _1476 + _1318;
    float _1480 = as_type<float>(_1466);
    float _1482 = as_type<float>(_1478);
    float _1484 = _1458;
    float _1486 = _1374;
    if (!_1468)
    {
        _1480 = _1422;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (!_1468)
    {
        _740 = _1420;
    }
    float _1492 = _740;
    bool _1494 = uint(_1478) >= uint(_1230);
    float _1496 = _1492;
    if (!_1468)
    {
        _1482 = _1398;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1468)
    {
        _1484 = _1400;
    }
    float _1502 = _1484;
    int _1504 = _1278 ^ _1106;
    bool _1506 = !_1472;
    int _1508 = _1506 ? 0 : (-1);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : (-1);
    float _1514 = _1502;
    if (!_1468)
    {
        _1486 = _1462;
    }
    float _1516 = _1486;
    bool _1518 = !_1468;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1436 + _1524;
        float _1528 = rsqrt(_1432);
        float _1530 = _1526 * _1522;
        float _1532 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = fma(_1538, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1546 = _1528 * _1544;
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1412, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1552 = fma(_1416, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1558 = _1550 + _1556;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1562 = _1552 + _1560;
        float _1564 = fma(_1462, _1542, _1554);
        float _1566 = _1558 * _1558;
        float _1568 = _1562 * _1562;
        _1520 = _1564;
        _1496 = _1566;
        _1490 = _1568;
        _1500 = _1550;
        _1514 = _1552;
    }
    float _1570 = _1520;
    float _1572 = _1496;
    float _1574 = _1490;
    float _1576 = _1500;
    float _1578 = _1514;
    uint _1580 = uint(int(uint(_1504) >> uint(31)));
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1584 = _1570 + _1582;
    int _1586 = ~_1512;
    int _1588 = _1474 + _1586;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1594 = ~int(_1580);
    int _1596 = _1594 + 1;
    float _1598 = fma(_1584, _1584, _1572);
    int _1600 = ~_1460;
    int _1602 = _1600 + _1508;
    int _1604 = _1602 + 1;
    float _1606 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1608 = -_151;
    int _1610 = _1262 ? as_type<int>(_1608) : as_type<int>(_151);
    float _1612 = _850 + 0.5;
    int _1614 = _1590 ^ _1596;
    float _1616 = -_854;
    float _1618 = _1616 + 0.5;
    bool _1620 = _1106 == 0;
    float _1622 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1624 = _1106 == 0;
    int _1626 = _1106 * _1604;
    int _1628 = _1626 + _1278;
    bool _1630 = !_1270;
    float _1632 = _1630 ? _151 : as_type<float>(_1610);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1636 = ~_1596;
    int _1638 = _1636 + _1614;
    int _1640 = _1638 + 1;
    float _1642 = _1598 + _1574;
    bool _1644 = !_1620;
    int _1646 = _1644 ? _1628 : (-1);
    float _1648 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1650 = !_1624;
    int _1652 = _1650 ? _1640 : (-1);
    float _1654 = -_730;
    float _1656 = _1654 + 1.0;
    float _1658 = -_155;
    int _1660 = _802 ? as_type<int>(_1658) : as_type<int>(_155);
    float _1662 = sqrt(_1642);
    float _1664 = float(_1646);
    float _1666 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1668 = float(_1652);
    float _1670 = -_738;
    float _1672 = _1670 + 1.0;
    bool _1674 = !_1286;
    float _1676 = _1674 ? _155 : as_type<float>(_1660);
    float _1678 = fma(_1606, _1664, _726);
    float _1680 = _1632 + 0.5;
    float _1682 = -_356;
    float _1684 = fma(_1666, _1668, _1682);
    float _1686 = _1676 + (-0.5);
    float _1688 = fma(_1606, _1680, _1678);
    float _1690 = _1622 * _1592;
    float _1692 = -_1666;
    float _1694 = fma(_1692, _1686, _1684);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = _1648 * _1634;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = -_1656;
    float _1726 = fma(_1632, _1724, _1688);
    float _1728 = fma(_1676, _1672, _1694);
    out.m_54.x = _1710;
    out.m_54.y = _1714;
    out.m_54.z = _1716;
    out.m_54.w = _1712;
    bool _1730 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1732 = isnan(_1662);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1738 = _1734 || _1736;
    out.m_56.x = _1718;
    out.m_56.y = _1720;
    out.m_56.z = _1722;
    out.m_58.x = _1690;
    out.m_58.y = _1706;
    out.m_60.x = _1726;
    out.m_60.y = _1728;
    float _1740 = _1632;
    if (!_1738)
    {
        _1740 = 1.0;
    }
    float _1742 = _1740;
    bool _1744 = !_1738;
    float _1746 = _1742;
    if (!_1744)
    {
        bool _1748 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1750 = isnan(_1662);
        bool _1752 = _1748 || _1750;
        bool _1754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1756 = _1752 || _1754;
        if (!_1756)
        {
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = _1662 + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1770 = 1.0 / _1764;
            float _1772 = _1760 * _1770;
            float _1774 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1746 = _1774;
            _1776 = true;
        }
        else
        {
            bool _1778 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1780 = isnan(_1662);
            bool _1782 = _1778 || _1780;
            bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1786 = _1782 || _1784;
            if (!_1786)
            {
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1662 + _1788;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1800 = 1.0 / _1794;
                float _1802 = _1790 * _1800;
                float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1746 = _1804;
                _1776 = true;
            }
            else
            {
                _1746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1776 = false;
    float _1806 = _1746;
    float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1810 = _1570 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1814 = _1576 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1818 = _1578 + _1816;
    out.m_35.x = 1.0;
    float _1820 = fma(_1810, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1822 = fma(_1814, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1824 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1826 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1834 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1828);
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1832);
    float _1842 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1834);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1836);
    float _1846 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1838);
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1874);
    float _1886 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1888 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1878);
    float _1890 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    out.m_62.w = _1882;
    out.gl_Position.x = _1886;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1776 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1947 = as_type<float>(_97);
        out.gl_Position.z = _1947;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_37.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_35.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_135);
        out.gl_Position.z = _2017;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _159 = in.m_42.x;
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
    float _191 = in.m_44.x;
    float _193 = in.m_44.y;
    float _195 = in.m_44.z;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _199 = _197 != 0;
    float _201 = float(_81);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _209 = int(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _185 + _219;
    float _223 = float(_189);
    float _225 = 1.0 / _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_199)
    {
        _227 = 1.0;
    }
    float _229 = _227;
    float _231 = _229;
    if (!_199)
    {
        _231 = 7.345489978790283203125;
    }
    float _233 = _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _235;
    float _239 = 1.0 / _223;
    float _241 = float(uint(_209));
    int _243 = ~_209;
    int _245 = _243 + 1;
    int _247 = _209 + (-1);
    int _249 = ~_209;
    int _251 = _249 + 1;
    float _253 = 1.0 / _241;
    float _255 = _239 * _115;
    float _257 = 1.0 / _213;
    float _259 = in.m_32.x;
    float _261 = in.m_32.y;
    float _263 = in.m_32.z;
    int _265 = as_type<int>(_253) + (-2);
    float _267 = trunc(_255);
    int _269 = int(_267);
    float _271 = in.m_46.x;
    float _273 = in.m_46.y;
    float _275 = in.m_46.z;
    float _277 = float(_209);
    float _279 = 1.0 / _217;
    float _281 = float(uint(_269));
    float _283 = _261 * _193;
    float _285 = _277 * _115;
    float _287 = as_type<float>(_265) * _281;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = in.m_42.z;
    float _295 = _221 * _279;
    float _297 = trunc(_287);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = _261 * _273;
    float _306 = fma(_259, _191, _283);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _185 + _308;
    float _312 = fma(_259, _271, _304);
    float _314 = fma(_263, _195, _306);
    float _316 = float(_269);
    float _318 = 1.0 / _201;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _322 = _310 * _257;
    float _324 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _326 = _245 * int(_302);
    int _328 = _326 + _269;
    int _330 = ~_209;
    int _332 = _330 + 1;
    float _334 = float(uint(_328));
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = _291 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _340 = _285 * _318;
    float _342 = as_type<float>(_265) * _334;
    float _344 = fma(_338, -2.0, _336);
    float _346 = _289 * 2.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _185 + _348;
    float _352 = trunc(_340);
    int _354 = int(_352);
    float _356 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _344);
    float _358 = -_320;
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[77].x, _358);
    float _362 = _350 * _225;
    float _364 = trunc(_342);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = floor(_346);
    int _372 = int(_302) + int(_368);
    float _374 = _289 * _233;
    int _376 = _332 * _372;
    int _378 = _376 + _269;
    float _380 = fma(_263, _275, _312);
    float _382 = floor(_374);
    bool _384 = _316 >= _277;
    bool _386 = isnan(_316);
    bool _388 = _384 || _386;
    bool _390 = isnan(_277);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _291 + _293;
    bool _398 = uint(_378) >= uint(_209);
    float _400 = _291 + _289;
    bool _402 = _370 > 0.0;
    float _404 = _291 * 2.0;
    bool _406 = _370 >= 0.0;
    bool _408 = isnan(_370);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _400 + (-1.0);
    float _418 = trunc(_394);
    int _420 = int(_418);
    bool _422 = !_398;
    int _424 = _422 ? 0 : (-1);
    float _426 = _396 + (-1.0);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _430 = ~_372;
    int _432 = _430 + _424;
    int _434 = _432 + 1;
    float _436 = _293 + _289;
    float _438 = -_382;
    float _440 = _374 + _438;
    float _442 = floor(_404);
    int _444 = _209 * _434;
    int _446 = _444 + _269;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _458 = _456 != 0;
    float _460 = _293 * 2.0;
    bool _462 = _209 == 0;
    float _464 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _466 = ~_420;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = floor(_460);
    float _474 = _436 + (-1.0);
    bool _476 = !_462;
    int _478 = _476 ? _446 : (-1);
    float _480 = _440 * _277;
    float _482 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = _478 * _470;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _492 = _490 != 0;
    float _494 = trunc(_480);
    int _496 = int(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    int _502 = _420 * _247;
    int _504 = _502 + _488;
    bool _506 = !_492;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _514 = !_450;
    int _516 = _514 ? 0 : 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _522 = !_458;
    int _524 = _522 ? 0 : 1;
    float _526 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _528 = log2(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    float _534 = fma(_500, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _536 = abs(_486);
    float _538 = fma(_237, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _540 = abs(_508);
    float _542 = fma(_512, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _544 = abs(_516);
    float _546 = fma(_520, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _548 = !_532;
    int _550 = _548 ? 0 : 1;
    int _552 = _504 * _536;
    int _554 = abs(_524);
    int _556 = _354 * _544;
    int _558 = _556 + _552;
    int _560 = abs(_550);
    int _562 = _496 * _540;
    int _564 = _562 + _269;
    float _566 = _528 * _115;
    int _568 = _564 * _554;
    int _570 = _568 + _558;
    bool _572 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_185);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    int _584 = _496 * _560;
    int _586 = _584 + _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _588;
    float _592 = exp2(_566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _594;
    bool _598 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _600 = isnan(_185);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_590, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _612 = float(uint(_586));
    float _614 = fma(_596, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _616 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_185);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _630 = isnan(_185);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = as_type<float>(_265) * _612;
    bool _642 = _472 > 0.0;
    float _644 = trunc(_640);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = _472 >= 0.0;
    bool _652 = isnan(_472);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _662 = 1.0 + _660;
    int _664 = _414 ? 0 : 1;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = -_592;
    float _672 = _670 + 1.0;
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = 1.0 / _662;
    float _686 = _582 * _668;
    float _688 = -_582;
    float _690 = _688 + 1.0;
    float _692 = _682 ? _672 : 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = _626 * _690;
    float _708 = -_626;
    float _710 = _708 + 1.0;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _714 = _251 * int(_648);
    int _716 = _714 + _586;
    float _718 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _720 = _608 * _710;
    float _722 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[78].w, _712);
    float _724 = -_115;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _728 = float(uint(_716));
    float _730 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = -_608;
    float _734 = _732 + 1.0;
    float _736 = _534 * _720;
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _722);
    float _740 = _261;
    if (_704)
    {
        float _742 = _692 * _684;
        _117 = _742;
    }
    float _744 = _117;
    float _746 = _538 * _720;
    float _748 = as_type<float>(_265) * _728;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].x, _736);
    bool _752 = _442 > 0.0;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[143].y, _746);
    bool _756 = _442 >= 0.0;
    bool _758 = isnan(_442);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_542, _706, _750);
    float _768 = trunc(_748);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = fma(_546, _706, _754);
    int _776 = _764 ? 0 : 1;
    float _778 = fma(_610, _686, _766);
    int _780 = ~_664;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_614, _686, _774);
    int _788 = _784;
    if (!_402)
    {
        int _790 = ~_664;
        int _792 = _790 + 1;
        _788 = _792;
    }
    int _794 = _788;
    float _796 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].x, _778);
    bool _798 = _293 > 0.5;
    float _800 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    bool _802 = _291 > 0.5;
    float _804 = _291 + (-0.5);
    float _806 = float(uint(_564));
    int _808 = ~_776;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _812;
    if (!_752)
    {
        int _816 = ~_776;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    float _822 = as_type<float>(_265) * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _830 = _828 != 0;
    float _832 = -_155;
    int _834 = _798 ? as_type<int>(_832) : as_type<int>(_155);
    float _836 = -_151;
    int _838 = _802 ? as_type<int>(_836) : as_type<int>(_151);
    float _840 = trunc(_822);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _658 ? 0 : 1;
    bool _848 = !_826;
    float _850 = _848 ? _151 : as_type<float>(_838);
    bool _852 = !_830;
    float _854 = _852 ? _155 : as_type<float>(_834);
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    int _860 = ~_209;
    int _862 = _860 + 1;
    int _864 = int(_648) + int(_772);
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    int _878 = ~_846;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = _862 * _864;
    int _886 = _884 + _586;
    int _888 = _882;
    if (!_642)
    {
        int _890 = ~_846;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    bool _896 = !_872;
    int _898 = _896 ? 0 : 1;
    bool _900 = !_876;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_868;
    int _906 = _904 ? 0 : 1;
    float _908 = float(_794);
    int _910 = abs(_898);
    bool _912 = uint(_886) >= uint(_209);
    int _914 = abs(_902);
    float _916 = in.m_50.x;
    float _918 = in.m_50.y;
    float _920 = in.m_50.z;
    float _922 = float(_820);
    float _924 = _796 * _856;
    int _926 = abs(_906);
    float _928 = _800 * _858;
    int _930 = ~_209;
    int _932 = _930 + 1;
    float _934 = float(_894);
    float _936 = float(_914);
    int _938 = _932 * int(_844);
    int _940 = _938 + _564;
    bool _942 = !_912;
    int _944 = _942 ? 0 : (-1);
    float _946 = float(_910);
    float _948 = _936 * _922;
    int _950 = ~_864;
    int _952 = _950 + _944;
    int _954 = _952 + 1;
    float _956 = float(_926);
    float _958 = _946 * _908;
    float _960 = float(uint(_940));
    int _962 = _209 * _954;
    int _964 = _962 + _586;
    float _966 = _956 * _934;
    float _968 = _958 * (-2.0);
    float _970 = as_type<float>(_265) * _960;
    bool _972 = !_462;
    int _974 = _972 ? _964 : (-1);
    float _976 = _966 * (-2.0);
    float _978 = fma(_968, _918, _918);
    float _980 = _948 * (-2.0);
    int _982 = _974 >> 31;
    float _984 = fma(_428, _976, _428);
    float _986 = fma(_976, _916, _916);
    float _988 = _289 + (-0.5);
    float _990 = fma(_464, _968, _464);
    int _992 = _982 & 3;
    float _994 = trunc(_970);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _986);
    float _1002 = fma(_980, _920, _920);
    int _1004 = _974 + _992;
    float _1006 = fma(_482, _980, _482);
    float _1008 = fma(_984, _744, _1000);
    int _1010 = ~_209;
    int _1012 = _1010 + 1;
    float _1014 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1016 = _1004 >> 2;
    float _1018 = _1008 * 0.15915493667125701904296875;
    float _1020 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    int _1024 = _1016 << 4;
    int _1026 = _1024 + 368;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1030 = fma(_990, _744, _1020);
    int _1032 = _974 & 3;
    bool _1034 = _1032 != 0;
    uint _1036 = uint(int(uint(_1026) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_844) + int(_998);
    float _1054 = _293 + (-0.5);
    float _1056 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1058 = _974 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1014 * _1028;
    int _1064 = _1012 * _1052;
    int _1066 = _1064 + _564;
    bool _1068 = _1032 != 3;
    int _1070 = _1026 + 8;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
    int _1076 = int(_1072) & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = int(_1072) + 1;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    int _1084 = _1080 & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    float _1088 = _1056 * _1022;
    float _1090 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1002);
    bool _1092 = uint(_1066) >= uint(_209);
    float _1094 = _1030 * 0.15915493667125701904296875;
    bool _1096 = uint(_1032) >= 2u;
    float _1098 = fma(_1006, _744, _1090);
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1106 = int(_1104);
    bool _1108 = uint(_1032) > 1u;
    float _1110 = _1098 * 0.15915493667125701904296875;
    int _1112 = ~_1052;
    int _1114 = _1112 + _1102;
    int _1116 = _1114 + 1;
    int _1118 = _1060 ? 0 : 1;
    int _1120 = _1096 ? 0 : 1;
    int _1122 = _209 * _1116;
    int _1124 = _1122 + _564;
    int _1126 = ~_1118;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = _1018 * 6.283185482025146484375;
    float _1134 = sin(_1132);
    bool _1136 = !_1034;
    int _1138 = _1136 ? 0 : 1;
    bool _1140 = _1032 != 3;
    int _1142 = _1130;
    if (!_1108)
    {
        int _1144 = ~_1118;
        int _1146 = _1144 + 1;
        _1142 = _1146;
    }
    int _1148 = _1142;
    int _1150 = ~_1120;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _1018 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    int _1160 = _1154;
    if (_1068)
    {
        int _1162 = ~_1120;
        int _1164 = _1162 + 1;
        _1160 = _1164;
    }
    int _1166 = _1160;
    int _1168 = abs(_1148);
    int _1170 = abs(_1138);
    bool _1172 = !_1140;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = _1094 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    int _1180 = abs(_1166);
    int _1182 = ~_1168;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = abs(_1174);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1186 * as_type<int>(_1050);
    float _1198 = _1094 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1204 = _1202 != 0;
    int _1206 = _1194 * as_type<int>(_1042);
    int _1208 = _1206 + _1196;
    int _1210 = ~_1180;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    bool _1216 = !_1204;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1188;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    int _1226 = _1214 * as_type<int>(_1078);
    int _1228 = _1226 + _1208;
    int _1230 = abs(_1106);
    float _1232 = _1110 * 6.283185482025146484375;
    float _1234 = cos(_1232);
    int _1236 = abs(_1218);
    int _1238 = _1224 * as_type<int>(_1086);
    int _1240 = _1238 + _1228;
    float _1242 = float(uint(_1106));
    float _1244 = _1158 * _1178;
    float _1246 = _1134 * _1200;
    int _1248 = ~_1236;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1110 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    bool _1258 = !_462;
    int _1260 = _1258 ? _1124 : (-1);
    bool _1262 = _289 > 0.5;
    int _1264 = _1240 * _1252;
    float _1266 = _1158 * _1200;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = 1.0 / _1242;
    float _1274 = float(uint(_1230));
    int _1276 = _1260 * _1236;
    int _1278 = _1276 + _1264;
    float _1280 = _1134 * _1178;
    float _1282 = _1234 * _1062;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1274;
    float _1290 = _1178 * _1234;
    float _1292 = _1200 * _1234;
    float _1294 = -_1244;
    float _1296 = fma(_1256, _1246, _1294);
    float _1298 = _1256 * _1062;
    float _1300 = -_1246;
    float _1302 = fma(_1256, _1244, _1300);
    float _1304 = fma(_1256, _1266, _1280);
    float _1306 = fma(_1256, _1280, _1266);
    int _1308 = as_type<int>(_1272) + (-2);
    float _1310 = -_1298;
    float _1312 = fma(_1292, _1088, _1310);
    float _1314 = float(uint(_1278));
    float _1316 = _1158 * _1282;
    int _1318 = abs(_1278);
    float _1320 = _1134 * _1282;
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1324 = as_type<float>(_1308) * _1314;
    float _1326 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1328 = as_type<int>(_1288) + (-2);
    float _1330 = fma(_1304, _1088, _1316);
    float _1332 = float(uint(_1318));
    float _1334 = fma(_1296, _1088, _1320);
    float _1336 = trunc(_1324);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = fma(_1302, _1326, _1330);
    float _1344 = fma(_1290, _1326, _1312);
    float _1346 = as_type<float>(_1328) * _1332;
    float _1348 = fma(_1306, _1326, _1334);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1354 = ~_1106;
    int _1356 = _1354 + 1;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = trunc(_1346);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1352);
    float _1370 = in.m_52.x;
    float _1372 = in.m_52.y;
    float _1374 = in.m_52.z;
    int _1376 = ~_1230;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1366);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1368);
    int _1384 = _1356 * int(_1340);
    int _1386 = _1384 + _1278;
    float _1388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1394 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1396 = float(uint(_1386));
    float _1398 = _324 + _1390;
    float _1400 = _1388 + _1392;
    float _1402 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    int _1404 = _1378 * int(_1364);
    int _1406 = _1404 + _1318;
    float _1408 = as_type<float>(_1308) * _1396;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1412 = _1398 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1416 = _1400 + _1414;
    float _1418 = float(uint(_1406));
    float _1420 = _1412 * _1412;
    float _1422 = _1416 * _1416;
    float _1424 = trunc(_1408);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    float _1430 = as_type<float>(_1328) * _1418;
    float _1432 = _1420 + _1422;
    float _1434 = _261 * _1372;
    float _1436 = sqrt(_1432);
    float _1438 = fma(_259, _1370, _1434);
    float _1440 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1442 = ~_1230;
    int _1444 = _1442 + 1;
    float _1446 = fma(_263, _1374, _1438);
    int _1448 = ~_1106;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1430);
    float _1454 = precise::max(_1452, 0.0);
    uint _1456 = uint(_1454);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1460 = int(_1340) + int(_1428);
    float _1462 = _1458 + _1440;
    int _1464 = _1450 * _1460;
    int _1466 = _1464 + _1278;
    bool _1468 = _1436 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1472 = uint(_1466) >= uint(_1106);
    int _1474 = int(_1364) + int(_1456);
    int _1476 = _1444 * _1474;
    int _1478 = _1476 + _1318;
    float _1480 = as_type<float>(_1466);
    float _1482 = as_type<float>(_1478);
    float _1484 = _1458;
    float _1486 = _1374;
    if (!_1468)
    {
        _1480 = _1422;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (!_1468)
    {
        _740 = _1420;
    }
    float _1492 = _740;
    bool _1494 = uint(_1478) >= uint(_1230);
    float _1496 = _1492;
    if (!_1468)
    {
        _1482 = _1398;
    }
    float _1498 = _1482;
    float _1500 = _1498;
    if (!_1468)
    {
        _1484 = _1400;
    }
    float _1502 = _1484;
    int _1504 = _1278 ^ _1106;
    bool _1506 = !_1472;
    int _1508 = _1506 ? 0 : (-1);
    bool _1510 = !_1494;
    int _1512 = _1510 ? 0 : (-1);
    float _1514 = _1502;
    if (!_1468)
    {
        _1486 = _1462;
    }
    float _1516 = _1486;
    bool _1518 = !_1468;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1436 + _1524;
        float _1528 = rsqrt(_1432);
        float _1530 = _1526 * _1522;
        float _1532 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = cos(_1540);
        float _1544 = fma(_1538, _1532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1546 = _1528 * _1544;
        float _1548 = _1542 + (-1.0);
        float _1550 = fma(_1412, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1552 = fma(_1416, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1558 = _1550 + _1556;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1562 = _1552 + _1560;
        float _1564 = fma(_1462, _1542, _1554);
        float _1566 = _1558 * _1558;
        float _1568 = _1562 * _1562;
        _1520 = _1564;
        _1496 = _1566;
        _1490 = _1568;
        _1500 = _1550;
        _1514 = _1552;
    }
    float _1570 = _1520;
    float _1572 = _1496;
    float _1574 = _1490;
    float _1576 = _1500;
    float _1578 = _1514;
    uint _1580 = uint(int(uint(_1504) >> uint(31)));
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1584 = _1570 + _1582;
    int _1586 = ~_1512;
    int _1588 = _1474 + _1586;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1594 = ~int(_1580);
    int _1596 = _1594 + 1;
    float _1598 = fma(_1584, _1584, _1572);
    int _1600 = ~_1460;
    int _1602 = _1600 + _1508;
    int _1604 = _1602 + 1;
    float _1606 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1608 = -_151;
    int _1610 = _1262 ? as_type<int>(_1608) : as_type<int>(_151);
    float _1612 = _850 + 0.5;
    int _1614 = _1590 ^ _1596;
    float _1616 = -_854;
    float _1618 = _1616 + 0.5;
    bool _1620 = _1106 == 0;
    float _1622 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1624 = _1106 == 0;
    int _1626 = _1106 * _1604;
    int _1628 = _1626 + _1278;
    bool _1630 = !_1270;
    float _1632 = _1630 ? _151 : as_type<float>(_1610);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1636 = ~_1596;
    int _1638 = _1636 + _1614;
    int _1640 = _1638 + 1;
    float _1642 = _1598 + _1574;
    bool _1644 = !_1620;
    int _1646 = _1644 ? _1628 : (-1);
    float _1648 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1650 = !_1624;
    int _1652 = _1650 ? _1640 : (-1);
    float _1654 = -_730;
    float _1656 = _1654 + 1.0;
    float _1658 = -_155;
    int _1660 = _802 ? as_type<int>(_1658) : as_type<int>(_155);
    float _1662 = sqrt(_1642);
    float _1664 = float(_1646);
    float _1666 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1668 = float(_1652);
    float _1670 = -_738;
    float _1672 = _1670 + 1.0;
    bool _1674 = !_1286;
    float _1676 = _1674 ? _155 : as_type<float>(_1660);
    float _1678 = fma(_1606, _1664, _726);
    float _1680 = _1632 + 0.5;
    float _1682 = -_356;
    float _1684 = fma(_1666, _1668, _1682);
    float _1686 = _1676 + (-0.5);
    float _1688 = fma(_1606, _1680, _1678);
    float _1690 = _1622 * _1592;
    float _1692 = -_1666;
    float _1694 = fma(_1692, _1686, _1684);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = _1648 * _1634;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = -_1656;
    float _1726 = fma(_1632, _1724, _1688);
    float _1728 = fma(_1676, _1672, _1694);
    out.m_54.x = _1710;
    out.m_54.y = _1714;
    out.m_54.z = _1716;
    out.m_54.w = _1712;
    bool _1730 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1732 = isnan(_1662);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1738 = _1734 || _1736;
    out.m_56.x = _1718;
    out.m_56.y = _1720;
    out.m_56.z = _1722;
    out.m_58.x = _1690;
    out.m_58.y = _1706;
    out.m_60.x = _1726;
    out.m_60.y = _1728;
    float _1740 = _1632;
    if (!_1738)
    {
        _1740 = 1.0;
    }
    float _1742 = _1740;
    bool _1744 = !_1738;
    float _1746 = _1742;
    if (!_1744)
    {
        bool _1748 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1750 = isnan(_1662);
        bool _1752 = _1748 || _1750;
        bool _1754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1756 = _1752 || _1754;
        if (!_1756)
        {
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = _1662 + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1762;
            float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1770 = 1.0 / _1764;
            float _1772 = _1760 * _1770;
            float _1774 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1746 = _1774;
            _1776 = true;
        }
        else
        {
            bool _1778 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1780 = isnan(_1662);
            bool _1782 = _1778 || _1780;
            bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1786 = _1782 || _1784;
            if (!_1786)
            {
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1662 + _1788;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1800 = 1.0 / _1794;
                float _1802 = _1790 * _1800;
                float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1746 = _1804;
                _1776 = true;
            }
            else
            {
                _1746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1776 = false;
    float _1806 = _1746;
    float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1810 = _1570 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1814 = _1576 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1818 = _1578 + _1816;
    out.m_35.x = 1.0;
    float _1820 = fma(_1810, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1822 = fma(_1814, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1824 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1826 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1834 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1828);
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1832);
    float _1842 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1834);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1836);
    float _1846 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1838);
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1866);
    float _1876 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1874);
    float _1886 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1888 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1878);
    float _1890 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    out.m_62.w = _1882;
    out.gl_Position.x = _1886;
    out.gl_Position.y = _1884;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

