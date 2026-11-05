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
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _167 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_87);
        out.gl_Position.z = _2027;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_125);
        out.gl_Position.z = _2096;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _131 = as_type<int>(_127) & 1;
    bool _133 = _131 != 0;
    int _135 = as_type<int>(_127) & 2;
    bool _137 = _135 != 0;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_129;
    float _165;
    if (!_147)
    {
        float _149 = in.m_40.x;
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _155 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _157 = _155 * _151;
        float _159 = floor(_157);
        float _161 = -_159;
        float _163 = _157 + _161;
        _165 = _163;
        _167 = true;
    }
    else
    {
        float _169 = float(_71);
        float _171 = 1.0 / _169;
        float _173 = _105 * _171;
        _165 = _173;
    }
    _167 = false;
    float _175 = _165;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _175 + _181;
    float _185 = float(_71);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _175 + _187;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _197 = 1.0 / _185;
    float _199 = float(_179);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _209 = 1.0 / _199;
    float _211 = float(uint(_193));
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _215 = ~_193;
    int _217 = _215 + 1;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = float(_193);
    float _229 = 1.0 / _211;
    bool _231 = _193 == 0;
    float _233 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _235 = ~_193;
    int _237 = _235 + 1;
    float _239 = _219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = _209 * _105;
    float _243 = 1.0 / _203;
    out.m_42.x = _225;
    out.m_42.y = _233;
    out.m_42.z = _239;
    int _245 = as_type<int>(_229) + (-2);
    float _247 = trunc(_241);
    int _249 = int(_247);
    int _251 = ~_193;
    int _253 = _251 + 1;
    float _255 = float(uint(_249));
    float _257 = as_type<float>(_245) * _255;
    float _259 = trunc(_257);
    float _261 = precise::max(_259, 0.0);
    uint _264 = uint(_261);
    int _266 = _217 * int(_264);
    int _268 = _266 + _249;
    float _270 = in.m_40.x;
    float _272 = in.m_40.y;
    float _274 = float(uint(_268));
    float _276 = as_type<float>(_245) * _274;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _280 = _278 != 0;
    float _282 = trunc(_276);
    float _284 = precise::max(_282, 0.0);
    uint _286 = uint(_284);
    float _288 = _272 * 2.0;
    int _290 = int(_264) + int(_286);
    float _292 = floor(_288);
    bool _294 = !_280;
    float _296 = _294 ? 7.345489978790283203125 : 1.0;
    float _298 = float(_249);
    int _300 = _223 * _290;
    int _302 = _300 + _249;
    float _304 = _296 * _270;
    bool _306 = _298 >= _227;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    bool _312 = isnan(_227);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = uint(_302) >= uint(_193);
    float _320 = floor(_304);
    bool _322 = !_318;
    int _324 = _322 ? 0 : (-1);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _336 = _334 != 0;
    int _338 = ~_290;
    int _340 = _338 + _324;
    int _342 = _340 + 1;
    float _344 = trunc(_316);
    int _346 = int(_344);
    int _348 = _193 * _342;
    int _350 = _348 + _249;
    float _352 = -_320;
    float _354 = _304 + _352;
    bool _356 = !_231;
    int _358 = _356 ? _350 : (-1);
    int _360 = _193 + (-1);
    float _362 = _354 * _227;
    float _364 = _227 * _105;
    int _366 = ~_346;
    int _368 = _366 + 1;
    int _370 = _368 + 1;
    float _372 = _364 * _197;
    float _374 = trunc(_362);
    int _376 = int(_374);
    bool _378 = !_328;
    int _380 = _378 ? 0 : 1;
    int _382 = _358 * _370;
    int _384 = abs(_380);
    int _386 = _346 * _360;
    int _388 = _386 + _382;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    float _394 = trunc(_372);
    int _396 = int(_394);
    bool _398 = !_332;
    int _400 = _398 ? 0 : 1;
    bool _402 = !_392;
    int _404 = _402 ? 0 : 1;
    int _406 = abs(_400);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _410 = _408 != 0;
    int _412 = abs(_404);
    bool _414 = !_336;
    int _416 = _414 ? 0 : 1;
    int _418 = _376 * _412;
    int _420 = _418 + _249;
    bool _422 = !_410;
    int _424 = _422 ? 0 : 1;
    int _426 = abs(_416);
    int _428 = _388 * _406;
    int _430 = abs(_424);
    int _432 = _396 * _384;
    int _434 = _432 + _428;
    int _436 = ~_193;
    int _438 = _436 + 1;
    int _440 = _420 * _426;
    int _442 = _440 + _434;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _446 = _444 != 0;
    int _448 = _376 * _430;
    int _450 = _448 + _442;
    float _452 = float(uint(_420));
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = float(uint(_450));
    float _460 = as_type<float>(_245) * _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _464 = _272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _466 = as_type<float>(_245) * _458;
    int _468 = ~_193;
    int _470 = _468 + 1;
    float _472 = trunc(_460);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    float _478 = fma(_464, -2.0, _462);
    float _480 = trunc(_466);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = _470 * int(_484);
    int _488 = _486 + _450;
    float _490 = float(uint(_488));
    float _492 = as_type<float>(_245) * _490;
    float _494 = in.m_30.x;
    float _496 = in.m_30.y;
    float _498 = in.m_30.z;
    float _500 = trunc(_492);
    float _502 = precise::max(_500, 0.0);
    uint _504 = uint(_502);
    int _506 = int(_484) + int(_504);
    float _508 = _270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _510 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = -_195;
    float _514 = fma(_508, 2.0, _512);
    int _516 = _438 * int(_476);
    int _518 = _516 + _420;
    float _520 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _522 = _237 * _506;
    int _524 = _522 + _450;
    float _526 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _528 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _530 = float(uint(_518));
    float _532 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    bool _534 = uint(_524) >= uint(_193);
    float _536 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _542 = as_type<float>(_245) * _530;
    bool _544 = !_534;
    int _546 = _544 ? 0 : (-1);
    float _548 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _550 = 1.0 / _540;
    int _552 = ~_506;
    int _554 = _552 + _546;
    int _556 = _554 + 1;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _566 = 1.0 / _560;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _175 + _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _578 = _570 * _243;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    int _588 = _193 * _556;
    int _590 = _588 + _450;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_40.z;
    float _596 = _183 * _550;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _600 = _175 + _598;
    bool _602 = !_231;
    int _604 = _602 ? _590 : (-1);
    out.m_44.x = _580;
    out.m_44.y = _582;
    out.m_44.z = _592;
    out.m_44.w = _205;
    float _606 = 1.0 / _564;
    float _608 = _189 * _566;
    int _610 = _604 & 3;
    bool _612 = _610 != 0;
    int _614 = _604 & 3;
    bool _616 = _614 != 0;
    bool _618 = uint(_610) > 1u;
    float _620 = trunc(_542);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    int _626 = _604 >> 31;
    int _628 = _626 & 3;
    float _630 = _586 * _105;
    int _632 = _616 ? 0 : 1;
    float _634 = _272 + _270;
    int _636 = _604 + _628;
    float _638 = exp2(_630);
    int _640 = ~_632;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _594 + _270;
    int _648 = _644;
    if (!_618)
    {
        int _650 = ~_632;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 + (-1.0);
    int _658 = _636 >> 2;
    float _660 = _646 + (-1.0);
    float _662 = _270 * 2.0;
    bool _664 = _610 != 3;
    float _666 = _600 * _606;
    int _668 = _658 << 4;
    int _670 = _668 + 368;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _674 = int(_476) + int(_624);
    float _676 = floor(_662);
    uint _678 = uint(int(uint(_670) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    bool _694 = uint(_610) >= 2u;
    float _696 = -_638;
    float _698 = _696 + 1.0;
    int _700 = _253 * _674;
    int _702 = _700 + _420;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _706 = _694 ? 0 : 1;
    int _708 = _670 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    bool _726 = uint(_702) >= uint(_193);
    int _728 = ~_706;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (_664)
    {
        int _736 = ~_706;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _754 = !_726;
    int _756 = _754 ? 0 : (-1);
    float _758 = _750 ? _698 : 0.0;
    float _760 = _272 + _594;
    bool _762 = _676 > 0.0;
    bool _764 = _676 >= 0.0;
    bool _766 = isnan(_676);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = _760 + (-1.0);
    bool _776 = !_446;
    int _778 = _776 ? 0 : 1;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(1.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _798 = ~_674;
    int _800 = _798 + _756;
    int _802 = _800 + 1;
    float _804 = 1.0 / _794;
    int _806 = abs(_654);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _810 = abs(_740);
    int _812 = _193 * _802;
    int _814 = _812 + _420;
    float _816 = _594 * 2.0;
    float _818 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _808);
    float _820 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    float _822 = -_105;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    bool _826 = !_612;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    bool _832 = _610 != 3;
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _836 = int(_834);
    int _838 = abs(_828);
    float _840 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    if (_790)
    {
        float _842 = _758 * _804;
        _109 = _842;
    }
    float _844 = _109;
    int _846 = ~_838;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = -_840;
    float _854 = _852 + 1.0;
    int _856 = ~_806;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_832;
    int _864 = _862 ? 0 : (-1);
    int _866 = abs(_778);
    int _868 = _860 * as_type<int>(_692);
    int _870 = ~_810;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = abs(_864);
    int _878 = _850 * as_type<int>(_684);
    int _880 = _878 + _868;
    float _882 = floor(_816);
    bool _884 = !_231;
    int _886 = _884 ? _814 : (-1);
    int _888 = _874 * as_type<int>(_716);
    int _890 = _888 + _880;
    float _892 = float(uint(_836));
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = abs(_836);
    float _902 = 1.0 / _892;
    int _904 = ~_866;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = _898 * as_type<int>(_724);
    int _912 = _910 + _890;
    float _914 = float(uint(_900));
    int _916 = _772 ? 0 : 1;
    int _918 = _912 * _908;
    bool _920 = _292 > 0.0;
    float _922 = 1.0 / _914;
    bool _924 = _292 >= 0.0;
    bool _926 = isnan(_292);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    int _934 = _886 * _866;
    int _936 = _934 + _918;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    int _946 = _942;
    if (!_762)
    {
        int _948 = ~_916;
        int _950 = _948 + 1;
        _946 = _950;
    }
    int _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _964 = _962 != 0;
    float _966 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    bool _968 = _882 >= 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    int _978 = as_type<int>(_902) + (-2);
    float _980 = float(uint(_936));
    int _982 = _976 ? 0 : 1;
    bool _984 = _882 > 0.0;
    float _986 = as_type<float>(_978) * _980;
    int _988 = abs(_936);
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = as_type<int>(_922) + (-2);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = float(uint(_988));
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1004;
    int _1008 = ~_836;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1014 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1016 = isnan(_175);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = as_type<float>(_996) * _1002;
    float _1028 = fma(_1006, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1034 = ~_900;
    int _1036 = _1034 + 1;
    float _1038 = trunc(_1026);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1048 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1050 = isnan(_175);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1024;
    float _1062 = _1060 + 1.0;
    int _1064 = _1010 * int(_994);
    int _1066 = _1064 + _936;
    float _1068 = fma(_1032, _596, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1070 = fma(_1046, _596, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1072 = _1058 * _1062;
    bool _1074 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1076 = isnan(_175);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1082 = _1078 || _1080;
    float _1084 = float(_1082);
    float _1086 = -_1058;
    float _1088 = _1086 + 1.0;
    float _1090 = float(uint(_1066));
    bool _1092 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1094 = isnan(_175);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    bool _1104 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1106 = isnan(_175);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = as_type<float>(_978) * _1090;
    int _1118 = _1036 * int(_1042);
    int _1120 = _1118 + _988;
    float _1122 = -_1102;
    float _1124 = _1122 + 1.0;
    float _1126 = _1102 * _1088;
    float _1128 = trunc(_1116);
    float _1130 = precise::max(_1128, 0.0);
    uint _1132 = uint(_1130);
    float _1134 = float(uint(_1120));
    float _1136 = _1084 * _1124;
    float _1138 = -_1084;
    float _1140 = _1138 + 1.0;
    float _1142 = as_type<float>(_996) * _1134;
    float _1144 = _1114 * _1140;
    float _1146 = -_1114;
    float _1148 = _1146 + 1.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1150;
    float _1154 = trunc(_1142);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    float _1160 = _1028 * _1144;
    float _1162 = _1012 * _1144;
    float _1164 = fma(_1152, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1166;
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1160);
    float _1172 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1162);
    int _1174 = ~_982;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1168, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1182 = fma(_1070, _1136, _1170);
    float _1184 = fma(_1068, _1136, _1172);
    int _1186 = ~_900;
    int _1188 = _1186 + 1;
    int _1190 = _932 ? 0 : 1;
    int _1192 = _1178;
    if (!_984)
    {
        int _1194 = ~_982;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1164, _1126, _1182);
    int _1202 = int(_1042) + int(_1158);
    float _1204 = _548 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1206 = !_956;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1212 = ~_1190;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    float _1218 = _944 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1220 = _1216;
    if (!_920)
    {
        int _1222 = ~_1190;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1210 + _1228;
    int _1232 = int(_994) + int(_1132);
    bool _1234 = !_960;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = in.m_46.x;
    float _1240 = in.m_46.y;
    float _1242 = in.m_46.z;
    int _1244 = abs(_1208);
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1204 + _1246;
    int _1250 = abs(_1236);
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1254 = ~_836;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1218 + _1258;
    float _1262 = float(_1198);
    int _1264 = _1256 * _1232;
    int _1266 = _1264 + _936;
    float _1268 = float(_1244);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1252);
    float _1272 = float(_952);
    bool _1274 = uint(_1266) >= uint(_836);
    float _1276 = _1268 * _1262;
    float _1278 = float(_1250);
    int _1280 = _1188 * _1202;
    int _1282 = _1280 + _988;
    bool _1284 = !_1274;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = _1276 * (-2.0);
    bool _1290 = _836 == 0;
    float _1292 = _1278 * _1272;
    bool _1294 = uint(_1282) >= uint(_900);
    float _1296 = fma(_704, _1288, _704);
    int _1298 = ~_1232;
    int _1300 = _1298 + _1286;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1288, _1238, _1238);
    int _1306 = _936 ^ _836;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1310 = !_1294;
    int _1312 = _1310 ? 0 : (-1);
    int _1314 = _836 * _1302;
    int _1316 = _1314 + _936;
    uint _1318 = uint(int(uint(_1306) >> uint(31)));
    float _1320 = _1230 * _1230;
    int _1322 = ~_1312;
    int _1324 = _1202 + _1322;
    int _1326 = _1324 + 1;
    float _1328 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1270);
    int _1330 = ~int(_1318);
    int _1332 = _1330 + 1;
    float _1334 = _1292 * (-2.0);
    float _1336 = fma(_1248, _1248, _1320);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _270 > 0.5;
    bool _1342 = _836 == 0;
    float _1344 = fma(_780, _1334, _780);
    int _1346 = _1326 ^ _1332;
    float _1348 = fma(_1260, _1260, _1336);
    float _1350 = fma(_1334, _1240, _1240);
    float _1352 = -_141;
    int _1354 = _1340 ? as_type<int>(_1352) : as_type<int>(_141);
    float _1356 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1358 = !_1290;
    int _1360 = _1358 ? _1316 : (-1);
    int _1362 = ~_1332;
    int _1364 = _1362 + _1346;
    int _1366 = _1364 + 1;
    float _1368 = rsqrt(_1348);
    bool _1370 = _272 > 0.5;
    float _1372 = _272 + (-0.5);
    float _1374 = float(_1360);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1378 = !_1342;
    int _1380 = _1378 ? _1366 : (-1);
    float _1382 = -_145;
    int _1384 = _1370 ? as_type<int>(_1382) : as_type<int>(_145);
    float _1386 = fma(_1356, _1374, _824);
    bool _1388 = _1328 >= 0.0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1392 = _1390 != 0;
    float _1394 = float(_1380);
    bool _1396 = !_456;
    float _1398 = _1396 ? _145 : as_type<float>(_1384);
    bool _1400 = !_1392;
    float _1402 = _1400 ? _141 : as_type<float>(_1354);
    float _1404 = -_752;
    float _1406 = fma(_1376, _1394, _1404);
    float _1408 = _270 + (-0.5);
    float _1410 = _1398 + (-0.5);
    float _1412 = _1402 + 0.5;
    float _1414 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1416 = -_1376;
    float _1418 = fma(_1416, _1410, _1406);
    float _1420 = _1410;
    float _1422 = _1242;
    if (_1388)
    {
        _1420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1424 = _1420;
    float _1426 = fma(_1356, _1412, _1386);
    float _1428 = -_830;
    float _1430 = _1428 + 1.0;
    float _1432 = _1230 * _1368;
    float _1434 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1350);
    float _1436 = _1248 * _1368;
    float _1438 = -_1430;
    float _1440 = fma(_1402, _1438, _1426);
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    int _1446 = as_type<int>(_1424);
    if (_1388)
    {
        float _1448 = _1424 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    float _1452 = fma(_1398, _854, _1418);
    float _1454 = -_1436;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1458 = _1444 * _1444;
    bool _1460 = !_964;
    int _1462 = _1460 ? 0 : 1;
    if (_1388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4053 = as_type<float>(_1450);
        out.gl_Position.z = _4053;
    }
    float _1464 = fma(_1296, _844, _1414);
    float _1466 = fma(_1456, _1456, _1458);
    int _1468 = abs(_1462);
    out.m_48.x = _1440;
    out.m_48.y = _1452;
    if (_1388)
    {
        out.m_33.x = 0.0;
    }
    if (_1388)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1470 = -_1432;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1474 = -_1436;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1478 = _1260 * _1368;
    float _1480 = float(_1226);
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1494 = _594 + (-0.5);
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1498 = float(_1468);
    float _1500 = fma(_1344, _844, _1434);
    float _1502 = -_1478;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1506 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1496);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1492 + _1508;
    float _1512 = _1498 * _1480;
    float _1514 = fma(_1504, _1504, _1466);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1520 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1506);
    float _1522 = _1512 * (-2.0);
    float _1524 = in.m_50.x;
    float _1526 = in.m_50.y;
    float _1528 = _1464 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = fma(_1522, _1242, _1242);
    bool _1534 = _1520 >= 0.0;
    float _1536 = fma(_672, _1522, _672);
    float _1538 = _1500 * 0.15915493667125701904296875;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1546 = fma(_1518, _666, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1548 = _1528 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = fma(_1536, _844, _1540);
    float _1554 = fma(_1544, _666, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1556 = fma(_1546, _1072, _1200);
    float _1558 = fma(_1180, _1126, _1184);
    float _1560 = _1552 * 0.15915493667125701904296875;
    if (_1534)
    {
        _1422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1562 = _1422;
    float _1564 = _1528 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1556);
    int _1570 = as_type<int>(_1562);
    if (_1534)
    {
        out.m_33.x = 0.0;
    }
    float _1572 = fma(_1554, _1072, _1558);
    if (_1534)
    {
        float _1574 = _1562 * 5.0;
        _1570 = as_type<int>(_1574);
    }
    int _1576 = _1570;
    float _1578 = _1368 * _1530;
    float _1580 = _1568 * _1526;
    float _1582 = _1538 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_1576);
        out.gl_Position.z = _4276;
    }
    float _1586 = _1538 * 6.283185482025146484375;
    float _1588 = cos(_1586);
    float _1590 = _1560 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    if (_1534)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1594 = _1560 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1600 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1572);
    float _1602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _145);
    float _1604 = _1550 * _1584;
    float _1606 = _1598 * _1578;
    float _1608 = _1600 * _1524;
    float _1610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _141);
    float _1612 = _1602 * _1606;
    float _1614 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1616 = _1566 * _1588;
    float _1618 = _1566 * _1584;
    bool _1620 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1622 = isnan(0.5);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1614 * _1578;
    float _1632 = fma(_1592, _1616, _1604);
    float _1634 = _1596 * _1612;
    float _1636 = _1584 * _1596;
    float _1638 = _1610 * _1630;
    float _1640 = _1550 * _1588;
    float _1642 = _1566 * _1634;
    float _1644 = _1588 * _1596;
    float _1646 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1648 = _1646 * 0.5;
    float _1650 = fma(_1592, _1604, _1616);
    float _1652 = fma(_1632, _1638, _1642);
    float _1654 = -_1612;
    float _1656 = _1592 * _1654;
    float _1658 = -_1640;
    float _1660 = fma(_1592, _1618, _1658);
    float _1662 = -_1618;
    float _1664 = fma(_1592, _1640, _1662);
    float _1666 = _1550 * _1634;
    float _1668 = fma(_1644, _1638, _1656);
    float _1670 = fma(_1660, _1648, _1652);
    float _1672 = fma(_1664, _1638, _1666);
    float _1674 = fma(_1636, _1648, _1668);
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1650, _1648, _1672);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1676);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1690 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1684);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1688);
    float _1696 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1698 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1700 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1218 + _1696;
    float _1704 = _1204 + _1698;
    float _1706 = _1210 + _1700;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1714 = _1704 + _1712;
    float _1716 = _1710 * _1710;
    float _1718 = fma(_1714, _1714, _1716);
    float _1720 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = sqrt(_1718);
    float _1726 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1728 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    float _1730 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1726);
    float _1732 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1734 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = 1.0 / _1734;
    float _1740 = _1736 + _1734;
    bool _1742 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1744 = _1720;
    float _1746 = _1730;
    float _1748 = _1680;
    if (!_1742)
    {
        _1744 = _1704;
    }
    float _1750 = _1744;
    float _1752 = _1750;
    if (!_1742)
    {
        _1746 = _1702;
    }
    float _1754 = _1746;
    float _1756 = _1754;
    if (!_1742)
    {
        _1748 = _1706;
    }
    float _1758 = _1748;
    bool _1760 = !_1742;
    float _1762 = _1758;
    if (!_1760)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1768 = _1724 + _1766;
        float _1770 = rsqrt(_1718);
        float _1772 = _1768 * _1764;
        float _1774 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1772 * 0.15915493667125701904296875;
        float _1778 = _1776 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        float _1782 = _1776 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 + (-1.0);
        float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1790 = fma(_1784, _1774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = fma(_1706, _1780, _1788);
        float _1794 = _1770 * _1790;
        float _1796 = fma(_1714, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1798 = fma(_1710, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1762 = _1792;
        _1752 = _1796;
        _1756 = _1798;
    }
    float _1800 = _1762;
    float _1802 = _1752;
    float _1804 = _1756;
    float _1806 = -_1432;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _1810 = -_1436;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1802);
    float _1814 = _1740 * _1738;
    float _1816 = _1814 * 0.5;
    float _1818 = -_1478;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1804);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = _1802;
    if (_1628)
    {
        _1824 = 1.0;
    }
    float _1826 = _1824;
    float _1828 = _1826;
    if (!_1628)
    {
        float _1830 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1832 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1834 = _1830 * 0.15915493667125701904296875;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1840 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1834 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = 1.0 / _1844;
        float _1852 = _1836 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = _1848 * _1850;
        float _1858 = _1836 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1864 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1862;
        float _1866 = _1854 * _1856;
        float _1868 = 1.0 / _1840;
        float _1870 = 1.0 / _1866;
        float _1872 = 1.0 / _1864;
        float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1876 = _1868 * _1874;
        float _1878 = _1860 * _1870;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = fma(_1878, _1876, _1880);
        float _1884 = _1882 * _1872;
        float _1886 = precise::clamp(_1884, 0.0, 1.0);
        _1828 = _1886;
    }
    float _1888 = _1828;
    float _1890 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1894 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1898 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1904 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1896);
    float _1906 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1902);
    float _1912 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1922 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1916);
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1920);
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1934);
    float _1944 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    bool _1946 = _1888 > 0.0;
    bool _1948 = isnan(_1888);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1958 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1940);
    float _1962 = _1942 + _1944;
    float _1964 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1956);
    float _1966 = _1958 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1968 = _1962 * 0.5;
    out.m_33.x = _1966;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
    out.m_52.z = _1968;
    out.m_52.w = _1944;
    if (_1954)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1970;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _167 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_87);
        out.gl_Position.z = _2027;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_125);
        out.gl_Position.z = _2096;
    }
    if (_119)
    {
        return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _131 = as_type<int>(_127) & 1;
    bool _133 = _131 != 0;
    int _135 = as_type<int>(_127) & 2;
    bool _137 = _135 != 0;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_129;
    float _165;
    if (!_147)
    {
        float _149 = in.m_40.x;
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _155 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _157 = _155 * _151;
        float _159 = floor(_157);
        float _161 = -_159;
        float _163 = _157 + _161;
        _165 = _163;
        _167 = true;
    }
    else
    {
        float _169 = float(_71);
        float _171 = 1.0 / _169;
        float _173 = _105 * _171;
        _165 = _173;
    }
    _167 = false;
    float _175 = _165;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _175 + _181;
    float _185 = float(_71);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _175 + _187;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _197 = 1.0 / _185;
    float _199 = float(_179);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _209 = 1.0 / _199;
    float _211 = float(uint(_193));
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _215 = ~_193;
    int _217 = _215 + 1;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = float(_193);
    float _229 = 1.0 / _211;
    bool _231 = _193 == 0;
    float _233 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _235 = ~_193;
    int _237 = _235 + 1;
    float _239 = _219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = _209 * _105;
    float _243 = 1.0 / _203;
    out.m_42.x = _225;
    out.m_42.y = _233;
    out.m_42.z = _239;
    int _245 = as_type<int>(_229) + (-2);
    float _247 = trunc(_241);
    int _249 = int(_247);
    int _251 = ~_193;
    int _253 = _251 + 1;
    float _255 = float(uint(_249));
    float _257 = as_type<float>(_245) * _255;
    float _259 = trunc(_257);
    float _261 = precise::max(_259, 0.0);
    uint _264 = uint(_261);
    int _266 = _217 * int(_264);
    int _268 = _266 + _249;
    float _270 = in.m_40.x;
    float _272 = in.m_40.y;
    float _274 = float(uint(_268));
    float _276 = as_type<float>(_245) * _274;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _280 = _278 != 0;
    float _282 = trunc(_276);
    float _284 = precise::max(_282, 0.0);
    uint _286 = uint(_284);
    float _288 = _272 * 2.0;
    int _290 = int(_264) + int(_286);
    float _292 = floor(_288);
    bool _294 = !_280;
    float _296 = _294 ? 7.345489978790283203125 : 1.0;
    float _298 = float(_249);
    int _300 = _223 * _290;
    int _302 = _300 + _249;
    float _304 = _296 * _270;
    bool _306 = _298 >= _227;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    bool _312 = isnan(_227);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = uint(_302) >= uint(_193);
    float _320 = floor(_304);
    bool _322 = !_318;
    int _324 = _322 ? 0 : (-1);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _336 = _334 != 0;
    int _338 = ~_290;
    int _340 = _338 + _324;
    int _342 = _340 + 1;
    float _344 = trunc(_316);
    int _346 = int(_344);
    int _348 = _193 * _342;
    int _350 = _348 + _249;
    float _352 = -_320;
    float _354 = _304 + _352;
    bool _356 = !_231;
    int _358 = _356 ? _350 : (-1);
    int _360 = _193 + (-1);
    float _362 = _354 * _227;
    float _364 = _227 * _105;
    int _366 = ~_346;
    int _368 = _366 + 1;
    int _370 = _368 + 1;
    float _372 = _364 * _197;
    float _374 = trunc(_362);
    int _376 = int(_374);
    bool _378 = !_328;
    int _380 = _378 ? 0 : 1;
    int _382 = _358 * _370;
    int _384 = abs(_380);
    int _386 = _346 * _360;
    int _388 = _386 + _382;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    float _394 = trunc(_372);
    int _396 = int(_394);
    bool _398 = !_332;
    int _400 = _398 ? 0 : 1;
    bool _402 = !_392;
    int _404 = _402 ? 0 : 1;
    int _406 = abs(_400);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _410 = _408 != 0;
    int _412 = abs(_404);
    bool _414 = !_336;
    int _416 = _414 ? 0 : 1;
    int _418 = _376 * _412;
    int _420 = _418 + _249;
    bool _422 = !_410;
    int _424 = _422 ? 0 : 1;
    int _426 = abs(_416);
    int _428 = _388 * _406;
    int _430 = abs(_424);
    int _432 = _396 * _384;
    int _434 = _432 + _428;
    int _436 = ~_193;
    int _438 = _436 + 1;
    int _440 = _420 * _426;
    int _442 = _440 + _434;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _446 = _444 != 0;
    int _448 = _376 * _430;
    int _450 = _448 + _442;
    float _452 = float(uint(_420));
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = float(uint(_450));
    float _460 = as_type<float>(_245) * _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _464 = _272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _466 = as_type<float>(_245) * _458;
    int _468 = ~_193;
    int _470 = _468 + 1;
    float _472 = trunc(_460);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    float _478 = fma(_464, -2.0, _462);
    float _480 = trunc(_466);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = _470 * int(_484);
    int _488 = _486 + _450;
    float _490 = float(uint(_488));
    float _492 = as_type<float>(_245) * _490;
    float _494 = in.m_30.x;
    float _496 = in.m_30.y;
    float _498 = in.m_30.z;
    float _500 = trunc(_492);
    float _502 = precise::max(_500, 0.0);
    uint _504 = uint(_502);
    int _506 = int(_484) + int(_504);
    float _508 = _270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _510 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = -_195;
    float _514 = fma(_508, 2.0, _512);
    int _516 = _438 * int(_476);
    int _518 = _516 + _420;
    float _520 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _522 = _237 * _506;
    int _524 = _522 + _450;
    float _526 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _528 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _530 = float(uint(_518));
    float _532 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    bool _534 = uint(_524) >= uint(_193);
    float _536 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _542 = as_type<float>(_245) * _530;
    bool _544 = !_534;
    int _546 = _544 ? 0 : (-1);
    float _548 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _550 = 1.0 / _540;
    int _552 = ~_506;
    int _554 = _552 + _546;
    int _556 = _554 + 1;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _566 = 1.0 / _560;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _175 + _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _578 = _570 * _243;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    int _588 = _193 * _556;
    int _590 = _588 + _450;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_40.z;
    float _596 = _183 * _550;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _600 = _175 + _598;
    bool _602 = !_231;
    int _604 = _602 ? _590 : (-1);
    out.m_44.x = _580;
    out.m_44.y = _582;
    out.m_44.z = _592;
    out.m_44.w = _205;
    float _606 = 1.0 / _564;
    float _608 = _189 * _566;
    int _610 = _604 & 3;
    bool _612 = _610 != 0;
    int _614 = _604 & 3;
    bool _616 = _614 != 0;
    bool _618 = uint(_610) > 1u;
    float _620 = trunc(_542);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    int _626 = _604 >> 31;
    int _628 = _626 & 3;
    float _630 = _586 * _105;
    int _632 = _616 ? 0 : 1;
    float _634 = _272 + _270;
    int _636 = _604 + _628;
    float _638 = exp2(_630);
    int _640 = ~_632;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _594 + _270;
    int _648 = _644;
    if (!_618)
    {
        int _650 = ~_632;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 + (-1.0);
    int _658 = _636 >> 2;
    float _660 = _646 + (-1.0);
    float _662 = _270 * 2.0;
    bool _664 = _610 != 3;
    float _666 = _600 * _606;
    int _668 = _658 << 4;
    int _670 = _668 + 368;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _674 = int(_476) + int(_624);
    float _676 = floor(_662);
    uint _678 = uint(int(uint(_670) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    bool _694 = uint(_610) >= 2u;
    float _696 = -_638;
    float _698 = _696 + 1.0;
    int _700 = _253 * _674;
    int _702 = _700 + _420;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _706 = _694 ? 0 : 1;
    int _708 = _670 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    bool _726 = uint(_702) >= uint(_193);
    int _728 = ~_706;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (_664)
    {
        int _736 = ~_706;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _754 = !_726;
    int _756 = _754 ? 0 : (-1);
    float _758 = _750 ? _698 : 0.0;
    float _760 = _272 + _594;
    bool _762 = _676 > 0.0;
    bool _764 = _676 >= 0.0;
    bool _766 = isnan(_676);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = _760 + (-1.0);
    bool _776 = !_446;
    int _778 = _776 ? 0 : 1;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(1.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _798 = ~_674;
    int _800 = _798 + _756;
    int _802 = _800 + 1;
    float _804 = 1.0 / _794;
    int _806 = abs(_654);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _810 = abs(_740);
    int _812 = _193 * _802;
    int _814 = _812 + _420;
    float _816 = _594 * 2.0;
    float _818 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _808);
    float _820 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    float _822 = -_105;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    bool _826 = !_612;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    bool _832 = _610 != 3;
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _836 = int(_834);
    int _838 = abs(_828);
    float _840 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    if (_790)
    {
        float _842 = _758 * _804;
        _109 = _842;
    }
    float _844 = _109;
    int _846 = ~_838;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = -_840;
    float _854 = _852 + 1.0;
    int _856 = ~_806;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_832;
    int _864 = _862 ? 0 : (-1);
    int _866 = abs(_778);
    int _868 = _860 * as_type<int>(_692);
    int _870 = ~_810;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = abs(_864);
    int _878 = _850 * as_type<int>(_684);
    int _880 = _878 + _868;
    float _882 = floor(_816);
    bool _884 = !_231;
    int _886 = _884 ? _814 : (-1);
    int _888 = _874 * as_type<int>(_716);
    int _890 = _888 + _880;
    float _892 = float(uint(_836));
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = abs(_836);
    float _902 = 1.0 / _892;
    int _904 = ~_866;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = _898 * as_type<int>(_724);
    int _912 = _910 + _890;
    float _914 = float(uint(_900));
    int _916 = _772 ? 0 : 1;
    int _918 = _912 * _908;
    bool _920 = _292 > 0.0;
    float _922 = 1.0 / _914;
    bool _924 = _292 >= 0.0;
    bool _926 = isnan(_292);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    int _934 = _886 * _866;
    int _936 = _934 + _918;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    int _946 = _942;
    if (!_762)
    {
        int _948 = ~_916;
        int _950 = _948 + 1;
        _946 = _950;
    }
    int _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _964 = _962 != 0;
    float _966 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    bool _968 = _882 >= 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    int _978 = as_type<int>(_902) + (-2);
    float _980 = float(uint(_936));
    int _982 = _976 ? 0 : 1;
    bool _984 = _882 > 0.0;
    float _986 = as_type<float>(_978) * _980;
    int _988 = abs(_936);
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = as_type<int>(_922) + (-2);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = float(uint(_988));
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1004;
    int _1008 = ~_836;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1014 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1016 = isnan(_175);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = as_type<float>(_996) * _1002;
    float _1028 = fma(_1006, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1034 = ~_900;
    int _1036 = _1034 + 1;
    float _1038 = trunc(_1026);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1048 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1050 = isnan(_175);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1024;
    float _1062 = _1060 + 1.0;
    int _1064 = _1010 * int(_994);
    int _1066 = _1064 + _936;
    float _1068 = fma(_1032, _596, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1070 = fma(_1046, _596, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1072 = _1058 * _1062;
    bool _1074 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1076 = isnan(_175);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1082 = _1078 || _1080;
    float _1084 = float(_1082);
    float _1086 = -_1058;
    float _1088 = _1086 + 1.0;
    float _1090 = float(uint(_1066));
    bool _1092 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1094 = isnan(_175);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    bool _1104 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1106 = isnan(_175);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = as_type<float>(_978) * _1090;
    int _1118 = _1036 * int(_1042);
    int _1120 = _1118 + _988;
    float _1122 = -_1102;
    float _1124 = _1122 + 1.0;
    float _1126 = _1102 * _1088;
    float _1128 = trunc(_1116);
    float _1130 = precise::max(_1128, 0.0);
    uint _1132 = uint(_1130);
    float _1134 = float(uint(_1120));
    float _1136 = _1084 * _1124;
    float _1138 = -_1084;
    float _1140 = _1138 + 1.0;
    float _1142 = as_type<float>(_996) * _1134;
    float _1144 = _1114 * _1140;
    float _1146 = -_1114;
    float _1148 = _1146 + 1.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1150;
    float _1154 = trunc(_1142);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    float _1160 = _1028 * _1144;
    float _1162 = _1012 * _1144;
    float _1164 = fma(_1152, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1166;
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1160);
    float _1172 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1162);
    int _1174 = ~_982;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1168, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1182 = fma(_1070, _1136, _1170);
    float _1184 = fma(_1068, _1136, _1172);
    int _1186 = ~_900;
    int _1188 = _1186 + 1;
    int _1190 = _932 ? 0 : 1;
    int _1192 = _1178;
    if (!_984)
    {
        int _1194 = ~_982;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1164, _1126, _1182);
    int _1202 = int(_1042) + int(_1158);
    float _1204 = _548 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1206 = !_956;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1212 = ~_1190;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    float _1218 = _944 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1220 = _1216;
    if (!_920)
    {
        int _1222 = ~_1190;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1210 + _1228;
    int _1232 = int(_994) + int(_1132);
    bool _1234 = !_960;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = in.m_46.x;
    float _1240 = in.m_46.y;
    float _1242 = in.m_46.z;
    int _1244 = abs(_1208);
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1204 + _1246;
    int _1250 = abs(_1236);
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1254 = ~_836;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1218 + _1258;
    float _1262 = float(_1198);
    int _1264 = _1256 * _1232;
    int _1266 = _1264 + _936;
    float _1268 = float(_1244);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1252);
    float _1272 = float(_952);
    bool _1274 = uint(_1266) >= uint(_836);
    float _1276 = _1268 * _1262;
    float _1278 = float(_1250);
    int _1280 = _1188 * _1202;
    int _1282 = _1280 + _988;
    bool _1284 = !_1274;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = _1276 * (-2.0);
    bool _1290 = _836 == 0;
    float _1292 = _1278 * _1272;
    bool _1294 = uint(_1282) >= uint(_900);
    float _1296 = fma(_704, _1288, _704);
    int _1298 = ~_1232;
    int _1300 = _1298 + _1286;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1288, _1238, _1238);
    int _1306 = _936 ^ _836;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1310 = !_1294;
    int _1312 = _1310 ? 0 : (-1);
    int _1314 = _836 * _1302;
    int _1316 = _1314 + _936;
    uint _1318 = uint(int(uint(_1306) >> uint(31)));
    float _1320 = _1230 * _1230;
    int _1322 = ~_1312;
    int _1324 = _1202 + _1322;
    int _1326 = _1324 + 1;
    float _1328 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1270);
    int _1330 = ~int(_1318);
    int _1332 = _1330 + 1;
    float _1334 = _1292 * (-2.0);
    float _1336 = fma(_1248, _1248, _1320);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _270 > 0.5;
    bool _1342 = _836 == 0;
    float _1344 = fma(_780, _1334, _780);
    int _1346 = _1326 ^ _1332;
    float _1348 = fma(_1260, _1260, _1336);
    float _1350 = fma(_1334, _1240, _1240);
    float _1352 = -_141;
    int _1354 = _1340 ? as_type<int>(_1352) : as_type<int>(_141);
    float _1356 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1358 = !_1290;
    int _1360 = _1358 ? _1316 : (-1);
    int _1362 = ~_1332;
    int _1364 = _1362 + _1346;
    int _1366 = _1364 + 1;
    float _1368 = rsqrt(_1348);
    bool _1370 = _272 > 0.5;
    float _1372 = _272 + (-0.5);
    float _1374 = float(_1360);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1378 = !_1342;
    int _1380 = _1378 ? _1366 : (-1);
    float _1382 = -_145;
    int _1384 = _1370 ? as_type<int>(_1382) : as_type<int>(_145);
    float _1386 = fma(_1356, _1374, _824);
    bool _1388 = _1328 >= 0.0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1392 = _1390 != 0;
    float _1394 = float(_1380);
    bool _1396 = !_456;
    float _1398 = _1396 ? _145 : as_type<float>(_1384);
    bool _1400 = !_1392;
    float _1402 = _1400 ? _141 : as_type<float>(_1354);
    float _1404 = -_752;
    float _1406 = fma(_1376, _1394, _1404);
    float _1408 = _270 + (-0.5);
    float _1410 = _1398 + (-0.5);
    float _1412 = _1402 + 0.5;
    float _1414 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1416 = -_1376;
    float _1418 = fma(_1416, _1410, _1406);
    float _1420 = _1410;
    float _1422 = _1242;
    if (_1388)
    {
        _1420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1424 = _1420;
    float _1426 = fma(_1356, _1412, _1386);
    float _1428 = -_830;
    float _1430 = _1428 + 1.0;
    float _1432 = _1230 * _1368;
    float _1434 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1350);
    float _1436 = _1248 * _1368;
    float _1438 = -_1430;
    float _1440 = fma(_1402, _1438, _1426);
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    int _1446 = as_type<int>(_1424);
    if (_1388)
    {
        float _1448 = _1424 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    float _1452 = fma(_1398, _854, _1418);
    float _1454 = -_1436;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1458 = _1444 * _1444;
    bool _1460 = !_964;
    int _1462 = _1460 ? 0 : 1;
    if (_1388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4053 = as_type<float>(_1450);
        out.gl_Position.z = _4053;
    }
    float _1464 = fma(_1296, _844, _1414);
    float _1466 = fma(_1456, _1456, _1458);
    int _1468 = abs(_1462);
    out.m_48.x = _1440;
    out.m_48.y = _1452;
    if (_1388)
    {
        out.m_33.x = 0.0;
    }
    if (_1388)
    {
        return out;
    }
    float _1470 = -_1432;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1474 = -_1436;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1478 = _1260 * _1368;
    float _1480 = float(_1226);
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1494 = _594 + (-0.5);
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1498 = float(_1468);
    float _1500 = fma(_1344, _844, _1434);
    float _1502 = -_1478;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1506 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1496);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1492 + _1508;
    float _1512 = _1498 * _1480;
    float _1514 = fma(_1504, _1504, _1466);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1520 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1506);
    float _1522 = _1512 * (-2.0);
    float _1524 = in.m_50.x;
    float _1526 = in.m_50.y;
    float _1528 = _1464 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = fma(_1522, _1242, _1242);
    bool _1534 = _1520 >= 0.0;
    float _1536 = fma(_672, _1522, _672);
    float _1538 = _1500 * 0.15915493667125701904296875;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1546 = fma(_1518, _666, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1548 = _1528 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = fma(_1536, _844, _1540);
    float _1554 = fma(_1544, _666, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1556 = fma(_1546, _1072, _1200);
    float _1558 = fma(_1180, _1126, _1184);
    float _1560 = _1552 * 0.15915493667125701904296875;
    if (_1534)
    {
        _1422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1562 = _1422;
    float _1564 = _1528 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1556);
    int _1570 = as_type<int>(_1562);
    if (_1534)
    {
        out.m_33.x = 0.0;
    }
    float _1572 = fma(_1554, _1072, _1558);
    if (_1534)
    {
        float _1574 = _1562 * 5.0;
        _1570 = as_type<int>(_1574);
    }
    int _1576 = _1570;
    float _1578 = _1368 * _1530;
    float _1580 = _1568 * _1526;
    float _1582 = _1538 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_1576);
        out.gl_Position.z = _4276;
    }
    float _1586 = _1538 * 6.283185482025146484375;
    float _1588 = cos(_1586);
    float _1590 = _1560 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    if (_1534)
    {
        return out;
    }
    float _1594 = _1560 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1600 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1572);
    float _1602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _145);
    float _1604 = _1550 * _1584;
    float _1606 = _1598 * _1578;
    float _1608 = _1600 * _1524;
    float _1610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _141);
    float _1612 = _1602 * _1606;
    float _1614 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1616 = _1566 * _1588;
    float _1618 = _1566 * _1584;
    bool _1620 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1622 = isnan(0.5);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1614 * _1578;
    float _1632 = fma(_1592, _1616, _1604);
    float _1634 = _1596 * _1612;
    float _1636 = _1584 * _1596;
    float _1638 = _1610 * _1630;
    float _1640 = _1550 * _1588;
    float _1642 = _1566 * _1634;
    float _1644 = _1588 * _1596;
    float _1646 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1648 = _1646 * 0.5;
    float _1650 = fma(_1592, _1604, _1616);
    float _1652 = fma(_1632, _1638, _1642);
    float _1654 = -_1612;
    float _1656 = _1592 * _1654;
    float _1658 = -_1640;
    float _1660 = fma(_1592, _1618, _1658);
    float _1662 = -_1618;
    float _1664 = fma(_1592, _1640, _1662);
    float _1666 = _1550 * _1634;
    float _1668 = fma(_1644, _1638, _1656);
    float _1670 = fma(_1660, _1648, _1652);
    float _1672 = fma(_1664, _1638, _1666);
    float _1674 = fma(_1636, _1648, _1668);
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1650, _1648, _1672);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1676);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1690 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1684);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1688);
    float _1696 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1698 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1700 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1218 + _1696;
    float _1704 = _1204 + _1698;
    float _1706 = _1210 + _1700;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1714 = _1704 + _1712;
    float _1716 = _1710 * _1710;
    float _1718 = fma(_1714, _1714, _1716);
    float _1720 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = sqrt(_1718);
    float _1726 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1728 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    float _1730 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1726);
    float _1732 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1734 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = 1.0 / _1734;
    float _1740 = _1736 + _1734;
    bool _1742 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1744 = _1720;
    float _1746 = _1730;
    float _1748 = _1680;
    if (!_1742)
    {
        _1744 = _1704;
    }
    float _1750 = _1744;
    float _1752 = _1750;
    if (!_1742)
    {
        _1746 = _1702;
    }
    float _1754 = _1746;
    float _1756 = _1754;
    if (!_1742)
    {
        _1748 = _1706;
    }
    float _1758 = _1748;
    bool _1760 = !_1742;
    float _1762 = _1758;
    if (!_1760)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1768 = _1724 + _1766;
        float _1770 = rsqrt(_1718);
        float _1772 = _1768 * _1764;
        float _1774 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1772 * 0.15915493667125701904296875;
        float _1778 = _1776 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        float _1782 = _1776 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 + (-1.0);
        float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1790 = fma(_1784, _1774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = fma(_1706, _1780, _1788);
        float _1794 = _1770 * _1790;
        float _1796 = fma(_1714, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1798 = fma(_1710, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1762 = _1792;
        _1752 = _1796;
        _1756 = _1798;
    }
    float _1800 = _1762;
    float _1802 = _1752;
    float _1804 = _1756;
    float _1806 = -_1432;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _1810 = -_1436;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1802);
    float _1814 = _1740 * _1738;
    float _1816 = _1814 * 0.5;
    float _1818 = -_1478;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1804);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = _1802;
    if (_1628)
    {
        _1824 = 1.0;
    }
    float _1826 = _1824;
    float _1828 = _1826;
    if (!_1628)
    {
        float _1830 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1832 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1834 = _1830 * 0.15915493667125701904296875;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1840 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1834 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = 1.0 / _1844;
        float _1852 = _1836 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = _1848 * _1850;
        float _1858 = _1836 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1864 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1862;
        float _1866 = _1854 * _1856;
        float _1868 = 1.0 / _1840;
        float _1870 = 1.0 / _1866;
        float _1872 = 1.0 / _1864;
        float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1876 = _1868 * _1874;
        float _1878 = _1860 * _1870;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = fma(_1878, _1876, _1880);
        float _1884 = _1882 * _1872;
        float _1886 = precise::clamp(_1884, 0.0, 1.0);
        _1828 = _1886;
    }
    float _1888 = _1828;
    float _1890 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1894 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1898 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1904 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1896);
    float _1906 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1902);
    float _1912 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1922 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1916);
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1920);
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1934);
    float _1944 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    bool _1946 = _1888 > 0.0;
    bool _1948 = isnan(_1888);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1958 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1940);
    float _1962 = _1942 + _1944;
    float _1964 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1956);
    float _1966 = _1958 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1968 = _1962 * 0.5;
    out.m_33.x = _1966;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
    out.m_52.z = _1968;
    out.m_52.w = _1944;
    if (_1954)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1970;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _167 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_87);
        out.gl_Position.z = _2027;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = _105;
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_125);
        out.gl_Position.z = _2096;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _131 = as_type<int>(_127) & 1;
    bool _133 = _131 != 0;
    int _135 = as_type<int>(_127) & 2;
    bool _137 = _135 != 0;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_129;
    float _165;
    if (!_147)
    {
        float _149 = in.m_40.x;
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _155 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _157 = _155 * _151;
        float _159 = floor(_157);
        float _161 = -_159;
        float _163 = _157 + _161;
        _165 = _163;
        _167 = true;
    }
    else
    {
        float _169 = float(_71);
        float _171 = 1.0 / _169;
        float _173 = _105 * _171;
        _165 = _173;
    }
    _167 = false;
    float _175 = _165;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _183 = _175 + _181;
    float _185 = float(_71);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _175 + _187;
    float _191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _193 = int(_191);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _197 = 1.0 / _185;
    float _199 = float(_179);
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _209 = 1.0 / _199;
    float _211 = float(uint(_193));
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _215 = ~_193;
    int _217 = _215 + 1;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _221 = ~_193;
    int _223 = _221 + 1;
    float _225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = float(_193);
    float _229 = 1.0 / _211;
    bool _231 = _193 == 0;
    float _233 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _235 = ~_193;
    int _237 = _235 + 1;
    float _239 = _219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = _209 * _105;
    float _243 = 1.0 / _203;
    out.m_42.x = _225;
    out.m_42.y = _233;
    out.m_42.z = _239;
    int _245 = as_type<int>(_229) + (-2);
    float _247 = trunc(_241);
    int _249 = int(_247);
    int _251 = ~_193;
    int _253 = _251 + 1;
    float _255 = float(uint(_249));
    float _257 = as_type<float>(_245) * _255;
    float _259 = trunc(_257);
    float _261 = precise::max(_259, 0.0);
    uint _264 = uint(_261);
    int _266 = _217 * int(_264);
    int _268 = _266 + _249;
    float _270 = in.m_40.x;
    float _272 = in.m_40.y;
    float _274 = float(uint(_268));
    float _276 = as_type<float>(_245) * _274;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _280 = _278 != 0;
    float _282 = trunc(_276);
    float _284 = precise::max(_282, 0.0);
    uint _286 = uint(_284);
    float _288 = _272 * 2.0;
    int _290 = int(_264) + int(_286);
    float _292 = floor(_288);
    bool _294 = !_280;
    float _296 = _294 ? 7.345489978790283203125 : 1.0;
    float _298 = float(_249);
    int _300 = _223 * _290;
    int _302 = _300 + _249;
    float _304 = _296 * _270;
    bool _306 = _298 >= _227;
    bool _308 = isnan(_298);
    bool _310 = _306 || _308;
    bool _312 = isnan(_227);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = uint(_302) >= uint(_193);
    float _320 = floor(_304);
    bool _322 = !_318;
    int _324 = _322 ? 0 : (-1);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _336 = _334 != 0;
    int _338 = ~_290;
    int _340 = _338 + _324;
    int _342 = _340 + 1;
    float _344 = trunc(_316);
    int _346 = int(_344);
    int _348 = _193 * _342;
    int _350 = _348 + _249;
    float _352 = -_320;
    float _354 = _304 + _352;
    bool _356 = !_231;
    int _358 = _356 ? _350 : (-1);
    int _360 = _193 + (-1);
    float _362 = _354 * _227;
    float _364 = _227 * _105;
    int _366 = ~_346;
    int _368 = _366 + 1;
    int _370 = _368 + 1;
    float _372 = _364 * _197;
    float _374 = trunc(_362);
    int _376 = int(_374);
    bool _378 = !_328;
    int _380 = _378 ? 0 : 1;
    int _382 = _358 * _370;
    int _384 = abs(_380);
    int _386 = _346 * _360;
    int _388 = _386 + _382;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    float _394 = trunc(_372);
    int _396 = int(_394);
    bool _398 = !_332;
    int _400 = _398 ? 0 : 1;
    bool _402 = !_392;
    int _404 = _402 ? 0 : 1;
    int _406 = abs(_400);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _410 = _408 != 0;
    int _412 = abs(_404);
    bool _414 = !_336;
    int _416 = _414 ? 0 : 1;
    int _418 = _376 * _412;
    int _420 = _418 + _249;
    bool _422 = !_410;
    int _424 = _422 ? 0 : 1;
    int _426 = abs(_416);
    int _428 = _388 * _406;
    int _430 = abs(_424);
    int _432 = _396 * _384;
    int _434 = _432 + _428;
    int _436 = ~_193;
    int _438 = _436 + 1;
    int _440 = _420 * _426;
    int _442 = _440 + _434;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _446 = _444 != 0;
    int _448 = _376 * _430;
    int _450 = _448 + _442;
    float _452 = float(uint(_420));
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = float(uint(_450));
    float _460 = as_type<float>(_245) * _452;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _464 = _272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _466 = as_type<float>(_245) * _458;
    int _468 = ~_193;
    int _470 = _468 + 1;
    float _472 = trunc(_460);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    float _478 = fma(_464, -2.0, _462);
    float _480 = trunc(_466);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = _470 * int(_484);
    int _488 = _486 + _450;
    float _490 = float(uint(_488));
    float _492 = as_type<float>(_245) * _490;
    float _494 = in.m_30.x;
    float _496 = in.m_30.y;
    float _498 = in.m_30.z;
    float _500 = trunc(_492);
    float _502 = precise::max(_500, 0.0);
    uint _504 = uint(_502);
    int _506 = int(_484) + int(_504);
    float _508 = _270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _510 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = -_195;
    float _514 = fma(_508, 2.0, _512);
    int _516 = _438 * int(_476);
    int _518 = _516 + _420;
    float _520 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _522 = _237 * _506;
    int _524 = _522 + _450;
    float _526 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _528 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _530 = float(uint(_518));
    float _532 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    bool _534 = uint(_524) >= uint(_193);
    float _536 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _526);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _542 = as_type<float>(_245) * _530;
    bool _544 = !_534;
    int _546 = _544 ? 0 : (-1);
    float _548 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _550 = 1.0 / _540;
    int _552 = ~_506;
    int _554 = _552 + _546;
    int _556 = _554 + 1;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _566 = 1.0 / _560;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _175 + _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _578 = _570 * _243;
    float _580 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    int _588 = _193 * _556;
    int _590 = _588 + _450;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_40.z;
    float _596 = _183 * _550;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _600 = _175 + _598;
    bool _602 = !_231;
    int _604 = _602 ? _590 : (-1);
    out.m_44.x = _580;
    out.m_44.y = _582;
    out.m_44.z = _592;
    out.m_44.w = _205;
    float _606 = 1.0 / _564;
    float _608 = _189 * _566;
    int _610 = _604 & 3;
    bool _612 = _610 != 0;
    int _614 = _604 & 3;
    bool _616 = _614 != 0;
    bool _618 = uint(_610) > 1u;
    float _620 = trunc(_542);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    int _626 = _604 >> 31;
    int _628 = _626 & 3;
    float _630 = _586 * _105;
    int _632 = _616 ? 0 : 1;
    float _634 = _272 + _270;
    int _636 = _604 + _628;
    float _638 = exp2(_630);
    int _640 = ~_632;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _594 + _270;
    int _648 = _644;
    if (!_618)
    {
        int _650 = ~_632;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 + (-1.0);
    int _658 = _636 >> 2;
    float _660 = _646 + (-1.0);
    float _662 = _270 * 2.0;
    bool _664 = _610 != 3;
    float _666 = _600 * _606;
    int _668 = _658 << 4;
    int _670 = _668 + 368;
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _674 = int(_476) + int(_624);
    float _676 = floor(_662);
    uint _678 = uint(int(uint(_670) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    bool _694 = uint(_610) >= 2u;
    float _696 = -_638;
    float _698 = _696 + 1.0;
    int _700 = _253 * _674;
    int _702 = _700 + _420;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _706 = _694 ? 0 : 1;
    int _708 = _670 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    bool _726 = uint(_702) >= uint(_193);
    int _728 = ~_706;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (_664)
    {
        int _736 = ~_706;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _754 = !_726;
    int _756 = _754 ? 0 : (-1);
    float _758 = _750 ? _698 : 0.0;
    float _760 = _272 + _594;
    bool _762 = _676 > 0.0;
    bool _764 = _676 >= 0.0;
    bool _766 = isnan(_676);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = _760 + (-1.0);
    bool _776 = !_446;
    int _778 = _776 ? 0 : 1;
    float _780 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(1.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _798 = ~_674;
    int _800 = _798 + _756;
    int _802 = _800 + 1;
    float _804 = 1.0 / _794;
    int _806 = abs(_654);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _810 = abs(_740);
    int _812 = _193 * _802;
    int _814 = _812 + _420;
    float _816 = _594 * 2.0;
    float _818 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _808);
    float _820 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    float _822 = -_105;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    bool _826 = !_612;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    bool _832 = _610 != 3;
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _836 = int(_834);
    int _838 = abs(_828);
    float _840 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    if (_790)
    {
        float _842 = _758 * _804;
        _109 = _842;
    }
    float _844 = _109;
    int _846 = ~_838;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = -_840;
    float _854 = _852 + 1.0;
    int _856 = ~_806;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    bool _862 = !_832;
    int _864 = _862 ? 0 : (-1);
    int _866 = abs(_778);
    int _868 = _860 * as_type<int>(_692);
    int _870 = ~_810;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = abs(_864);
    int _878 = _850 * as_type<int>(_684);
    int _880 = _878 + _868;
    float _882 = floor(_816);
    bool _884 = !_231;
    int _886 = _884 ? _814 : (-1);
    int _888 = _874 * as_type<int>(_716);
    int _890 = _888 + _880;
    float _892 = float(uint(_836));
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = abs(_836);
    float _902 = 1.0 / _892;
    int _904 = ~_866;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = _898 * as_type<int>(_724);
    int _912 = _910 + _890;
    float _914 = float(uint(_900));
    int _916 = _772 ? 0 : 1;
    int _918 = _912 * _908;
    bool _920 = _292 > 0.0;
    float _922 = 1.0 / _914;
    bool _924 = _292 >= 0.0;
    bool _926 = isnan(_292);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    int _934 = _886 * _866;
    int _936 = _934 + _918;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    int _946 = _942;
    if (!_762)
    {
        int _948 = ~_916;
        int _950 = _948 + 1;
        _946 = _950;
    }
    int _952 = _946;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _964 = _962 != 0;
    float _966 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    bool _968 = _882 >= 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    int _978 = as_type<int>(_902) + (-2);
    float _980 = float(uint(_936));
    int _982 = _976 ? 0 : 1;
    bool _984 = _882 > 0.0;
    float _986 = as_type<float>(_978) * _980;
    int _988 = abs(_936);
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = as_type<int>(_922) + (-2);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = float(uint(_988));
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1004;
    int _1008 = ~_836;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1014 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1016 = isnan(_175);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = as_type<float>(_996) * _1002;
    float _1028 = fma(_1006, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1034 = ~_900;
    int _1036 = _1034 + 1;
    float _1038 = trunc(_1026);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1048 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1050 = isnan(_175);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1024;
    float _1062 = _1060 + 1.0;
    int _1064 = _1010 * int(_994);
    int _1066 = _1064 + _936;
    float _1068 = fma(_1032, _596, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1070 = fma(_1046, _596, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1072 = _1058 * _1062;
    bool _1074 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1076 = isnan(_175);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1082 = _1078 || _1080;
    float _1084 = float(_1082);
    float _1086 = -_1058;
    float _1088 = _1086 + 1.0;
    float _1090 = float(uint(_1066));
    bool _1092 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1094 = isnan(_175);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    bool _1104 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1106 = isnan(_175);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = as_type<float>(_978) * _1090;
    int _1118 = _1036 * int(_1042);
    int _1120 = _1118 + _988;
    float _1122 = -_1102;
    float _1124 = _1122 + 1.0;
    float _1126 = _1102 * _1088;
    float _1128 = trunc(_1116);
    float _1130 = precise::max(_1128, 0.0);
    uint _1132 = uint(_1130);
    float _1134 = float(uint(_1120));
    float _1136 = _1084 * _1124;
    float _1138 = -_1084;
    float _1140 = _1138 + 1.0;
    float _1142 = as_type<float>(_996) * _1134;
    float _1144 = _1114 * _1140;
    float _1146 = -_1114;
    float _1148 = _1146 + 1.0;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1150;
    float _1154 = trunc(_1142);
    float _1156 = precise::max(_1154, 0.0);
    uint _1158 = uint(_1156);
    float _1160 = _1028 * _1144;
    float _1162 = _1012 * _1144;
    float _1164 = fma(_1152, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1166;
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1160);
    float _1172 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1162);
    int _1174 = ~_982;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1168, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1182 = fma(_1070, _1136, _1170);
    float _1184 = fma(_1068, _1136, _1172);
    int _1186 = ~_900;
    int _1188 = _1186 + 1;
    int _1190 = _932 ? 0 : 1;
    int _1192 = _1178;
    if (!_984)
    {
        int _1194 = ~_982;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1164, _1126, _1182);
    int _1202 = int(_1042) + int(_1158);
    float _1204 = _548 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1206 = !_956;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1212 = ~_1190;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    float _1218 = _944 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1220 = _1216;
    if (!_920)
    {
        int _1222 = ~_1190;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1210 + _1228;
    int _1232 = int(_994) + int(_1132);
    bool _1234 = !_960;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = in.m_46.x;
    float _1240 = in.m_46.y;
    float _1242 = in.m_46.z;
    int _1244 = abs(_1208);
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1204 + _1246;
    int _1250 = abs(_1236);
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1254 = ~_836;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1218 + _1258;
    float _1262 = float(_1198);
    int _1264 = _1256 * _1232;
    int _1266 = _1264 + _936;
    float _1268 = float(_1244);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1252);
    float _1272 = float(_952);
    bool _1274 = uint(_1266) >= uint(_836);
    float _1276 = _1268 * _1262;
    float _1278 = float(_1250);
    int _1280 = _1188 * _1202;
    int _1282 = _1280 + _988;
    bool _1284 = !_1274;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = _1276 * (-2.0);
    bool _1290 = _836 == 0;
    float _1292 = _1278 * _1272;
    bool _1294 = uint(_1282) >= uint(_900);
    float _1296 = fma(_704, _1288, _704);
    int _1298 = ~_1232;
    int _1300 = _1298 + _1286;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1288, _1238, _1238);
    int _1306 = _936 ^ _836;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1310 = !_1294;
    int _1312 = _1310 ? 0 : (-1);
    int _1314 = _836 * _1302;
    int _1316 = _1314 + _936;
    uint _1318 = uint(int(uint(_1306) >> uint(31)));
    float _1320 = _1230 * _1230;
    int _1322 = ~_1312;
    int _1324 = _1202 + _1322;
    int _1326 = _1324 + 1;
    float _1328 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1270);
    int _1330 = ~int(_1318);
    int _1332 = _1330 + 1;
    float _1334 = _1292 * (-2.0);
    float _1336 = fma(_1248, _1248, _1320);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _270 > 0.5;
    bool _1342 = _836 == 0;
    float _1344 = fma(_780, _1334, _780);
    int _1346 = _1326 ^ _1332;
    float _1348 = fma(_1260, _1260, _1336);
    float _1350 = fma(_1334, _1240, _1240);
    float _1352 = -_141;
    int _1354 = _1340 ? as_type<int>(_1352) : as_type<int>(_141);
    float _1356 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1358 = !_1290;
    int _1360 = _1358 ? _1316 : (-1);
    int _1362 = ~_1332;
    int _1364 = _1362 + _1346;
    int _1366 = _1364 + 1;
    float _1368 = rsqrt(_1348);
    bool _1370 = _272 > 0.5;
    float _1372 = _272 + (-0.5);
    float _1374 = float(_1360);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1378 = !_1342;
    int _1380 = _1378 ? _1366 : (-1);
    float _1382 = -_145;
    int _1384 = _1370 ? as_type<int>(_1382) : as_type<int>(_145);
    float _1386 = fma(_1356, _1374, _824);
    bool _1388 = _1328 >= 0.0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1392 = _1390 != 0;
    float _1394 = float(_1380);
    bool _1396 = !_456;
    float _1398 = _1396 ? _145 : as_type<float>(_1384);
    bool _1400 = !_1392;
    float _1402 = _1400 ? _141 : as_type<float>(_1354);
    float _1404 = -_752;
    float _1406 = fma(_1376, _1394, _1404);
    float _1408 = _270 + (-0.5);
    float _1410 = _1398 + (-0.5);
    float _1412 = _1402 + 0.5;
    float _1414 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1416 = -_1376;
    float _1418 = fma(_1416, _1410, _1406);
    float _1420 = _1410;
    float _1422 = _1242;
    if (_1388)
    {
        _1420 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1424 = _1420;
    float _1426 = fma(_1356, _1412, _1386);
    float _1428 = -_830;
    float _1430 = _1428 + 1.0;
    float _1432 = _1230 * _1368;
    float _1434 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1350);
    float _1436 = _1248 * _1368;
    float _1438 = -_1430;
    float _1440 = fma(_1402, _1438, _1426);
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    int _1446 = as_type<int>(_1424);
    if (_1388)
    {
        float _1448 = _1424 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    float _1452 = fma(_1398, _854, _1418);
    float _1454 = -_1436;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1458 = _1444 * _1444;
    bool _1460 = !_964;
    int _1462 = _1460 ? 0 : 1;
    if (_1388)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4053 = as_type<float>(_1450);
        out.gl_Position.z = _4053;
    }
    float _1464 = fma(_1296, _844, _1414);
    float _1466 = fma(_1456, _1456, _1458);
    int _1468 = abs(_1462);
    out.m_48.x = _1440;
    out.m_48.y = _1452;
    if (_1388)
    {
        out.m_33.x = 0.0;
    }
    if (_1388)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1470 = -_1432;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1474 = -_1436;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1478 = _1260 * _1368;
    float _1480 = float(_1226);
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1494 = _594 + (-0.5);
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1498 = float(_1468);
    float _1500 = fma(_1344, _844, _1434);
    float _1502 = -_1478;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1506 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1496);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1492 + _1508;
    float _1512 = _1498 * _1480;
    float _1514 = fma(_1504, _1504, _1466);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1520 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1506);
    float _1522 = _1512 * (-2.0);
    float _1524 = in.m_50.x;
    float _1526 = in.m_50.y;
    float _1528 = _1464 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = fma(_1522, _1242, _1242);
    bool _1534 = _1520 >= 0.0;
    float _1536 = fma(_672, _1522, _672);
    float _1538 = _1500 * 0.15915493667125701904296875;
    float _1540 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1546 = fma(_1518, _666, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1548 = _1528 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = fma(_1536, _844, _1540);
    float _1554 = fma(_1544, _666, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1556 = fma(_1546, _1072, _1200);
    float _1558 = fma(_1180, _1126, _1184);
    float _1560 = _1552 * 0.15915493667125701904296875;
    if (_1534)
    {
        _1422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1562 = _1422;
    float _1564 = _1528 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1556);
    int _1570 = as_type<int>(_1562);
    if (_1534)
    {
        out.m_33.x = 0.0;
    }
    float _1572 = fma(_1554, _1072, _1558);
    if (_1534)
    {
        float _1574 = _1562 * 5.0;
        _1570 = as_type<int>(_1574);
    }
    int _1576 = _1570;
    float _1578 = _1368 * _1530;
    float _1580 = _1568 * _1526;
    float _1582 = _1538 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_1576);
        out.gl_Position.z = _4276;
    }
    float _1586 = _1538 * 6.283185482025146484375;
    float _1588 = cos(_1586);
    float _1590 = _1560 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    if (_1534)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1594 = _1560 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1600 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1572);
    float _1602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _145);
    float _1604 = _1550 * _1584;
    float _1606 = _1598 * _1578;
    float _1608 = _1600 * _1524;
    float _1610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _141);
    float _1612 = _1602 * _1606;
    float _1614 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1616 = _1566 * _1588;
    float _1618 = _1566 * _1584;
    bool _1620 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1622 = isnan(0.5);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1614 * _1578;
    float _1632 = fma(_1592, _1616, _1604);
    float _1634 = _1596 * _1612;
    float _1636 = _1584 * _1596;
    float _1638 = _1610 * _1630;
    float _1640 = _1550 * _1588;
    float _1642 = _1566 * _1634;
    float _1644 = _1588 * _1596;
    float _1646 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1648 = _1646 * 0.5;
    float _1650 = fma(_1592, _1604, _1616);
    float _1652 = fma(_1632, _1638, _1642);
    float _1654 = -_1612;
    float _1656 = _1592 * _1654;
    float _1658 = -_1640;
    float _1660 = fma(_1592, _1618, _1658);
    float _1662 = -_1618;
    float _1664 = fma(_1592, _1640, _1662);
    float _1666 = _1550 * _1634;
    float _1668 = fma(_1644, _1638, _1656);
    float _1670 = fma(_1660, _1648, _1652);
    float _1672 = fma(_1664, _1638, _1666);
    float _1674 = fma(_1636, _1648, _1668);
    float _1676 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1650, _1648, _1672);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1676);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1688 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1690 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1684);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1686);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1688);
    float _1696 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1698 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1700 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1702 = _1218 + _1696;
    float _1704 = _1204 + _1698;
    float _1706 = _1210 + _1700;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1714 = _1704 + _1712;
    float _1716 = _1710 * _1710;
    float _1718 = fma(_1714, _1714, _1716);
    float _1720 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = sqrt(_1718);
    float _1726 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1728 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    float _1730 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1726);
    float _1732 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1734 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = 1.0 / _1734;
    float _1740 = _1736 + _1734;
    bool _1742 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1744 = _1720;
    float _1746 = _1730;
    float _1748 = _1680;
    if (!_1742)
    {
        _1744 = _1704;
    }
    float _1750 = _1744;
    float _1752 = _1750;
    if (!_1742)
    {
        _1746 = _1702;
    }
    float _1754 = _1746;
    float _1756 = _1754;
    if (!_1742)
    {
        _1748 = _1706;
    }
    float _1758 = _1748;
    bool _1760 = !_1742;
    float _1762 = _1758;
    if (!_1760)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1768 = _1724 + _1766;
        float _1770 = rsqrt(_1718);
        float _1772 = _1768 * _1764;
        float _1774 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1772 * 0.15915493667125701904296875;
        float _1778 = _1776 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        float _1782 = _1776 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 + (-1.0);
        float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1790 = fma(_1784, _1774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = fma(_1706, _1780, _1788);
        float _1794 = _1770 * _1790;
        float _1796 = fma(_1714, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1798 = fma(_1710, _1794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1762 = _1792;
        _1752 = _1796;
        _1756 = _1798;
    }
    float _1800 = _1762;
    float _1802 = _1752;
    float _1804 = _1756;
    float _1806 = -_1432;
    float _1808 = fma(_1806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _1810 = -_1436;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1802);
    float _1814 = _1740 * _1738;
    float _1816 = _1814 * 0.5;
    float _1818 = -_1478;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1804);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1824 = _1802;
    if (_1628)
    {
        _1824 = 1.0;
    }
    float _1826 = _1824;
    float _1828 = _1826;
    if (!_1628)
    {
        float _1830 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1832 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1834 = _1830 * 0.15915493667125701904296875;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1840 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1834 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = 1.0 / _1844;
        float _1852 = _1836 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        float _1856 = _1848 * _1850;
        float _1858 = _1836 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1864 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1862;
        float _1866 = _1854 * _1856;
        float _1868 = 1.0 / _1840;
        float _1870 = 1.0 / _1866;
        float _1872 = 1.0 / _1864;
        float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1876 = _1868 * _1874;
        float _1878 = _1860 * _1870;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = fma(_1878, _1876, _1880);
        float _1884 = _1882 * _1872;
        float _1886 = precise::clamp(_1884, 0.0, 1.0);
        _1828 = _1886;
    }
    float _1888 = _1828;
    float _1890 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1894 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1898 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1904 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1896);
    float _1906 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1902);
    float _1912 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1922 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1916);
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1920);
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1934);
    float _1944 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    bool _1946 = _1888 > 0.0;
    bool _1948 = isnan(_1888);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1958 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1940);
    float _1962 = _1942 + _1944;
    float _1964 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1956);
    float _1966 = _1958 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1968 = _1962 * 0.5;
    out.m_33.x = _1966;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1944;
    out.m_52.z = _1968;
    out.m_52.w = _1944;
    if (_1954)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1970;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

