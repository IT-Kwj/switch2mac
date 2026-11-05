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
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2107 = as_type<float>(_89);
        out.gl_Position.z = _2107;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_127);
        out.gl_Position.z = _2177;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = 0.0;
    float _153 = _137;
    if (!_147)
    {
        float _155 = _137 * _137;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _163 = _159;
    if (!_147)
    {
        float _165 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_135) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_135) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_175;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_179;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_171;
    float _201 = _161 + _199;
    bool _203 = _201 < 0.5;
    float _205 = float(_203);
    float _207 = fma(_193, 0.5, 0.5);
    bool _209 = !_147;
    float _211 = _167;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _153 = _265;
    }
    float _267 = _153;
    float _269 = -_201;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = -_207;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = in.m_35.x;
    float _279 = in.m_35.y;
    float _281 = in.m_35.z;
    bool _283 = !_185;
    int _285 = _283 ? 0 : 1;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = -_205;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = in.m_42.w;
    bool _307 = !_291;
    int _309 = _307 ? 0 : 1;
    float _311 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    int _325 = abs(_309);
    float _327 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _329 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _321);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _333 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    int _339 = abs(_285);
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = fma(_267, _277, _331);
    float _347 = float(_325);
    float _349 = fma(_267, _279, _333);
    int _351 = abs(_343);
    float _353 = fma(_267, _281, _337);
    float _355 = float(_339);
    float _357 = abs(_271);
    float _359 = _347 * _357;
    float _361 = float(_351);
    float _363 = fma(_355, _275, _359);
    float _365 = fma(_345, _305, _315);
    float _367 = fma(_349, _305, _317);
    float _369 = fma(_353, _305, _319);
    float _371 = abs(_299);
    float _373 = fma(_361, _371, _363);
    bool _375 = !_335;
    float _393;
    float _395;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _383 = _381 * _377;
        float _385 = float(_73);
        float _387 = floor(_383);
        float _389 = -_387;
        float _391 = _383 + _389;
        _393 = _391;
        _395 = _385;
        _397 = true;
    }
    else
    {
        float _399 = float(_73);
        float _401 = 1.0 / _399;
        float _403 = _107 * _401;
        _393 = _403;
        _395 = _399;
    }
    _397 = false;
    float _405 = _393;
    float _407 = _395;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _129 * 2.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _405 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _405 + _419;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _425 = int(_423);
    bool _427 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_405);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(_411);
    float _441 = 1.0 / _407;
    float _443 = float(uint(_425));
    float _445 = 1.0 / _439;
    int _447 = ~_425;
    int _449 = _447 + 1;
    int _451 = ~_425;
    int _453 = _451 + 1;
    int _455 = ~_425;
    int _457 = _455 + 1;
    float _459 = 1.0 / _443;
    float _461 = _445 * _107;
    float _463 = float(_425);
    float _465 = floor(_413);
    int _467 = as_type<int>(_459) + (-2);
    float _469 = trunc(_461);
    int _471 = int(_469);
    float _473 = float(uint(_471));
    float _475 = as_type<float>(_467) * _473;
    int _477 = ~_425;
    int _479 = _477 + 1;
    float _481 = trunc(_475);
    float _483 = precise::max(_481, 0.0);
    uint _486 = uint(_483);
    float _488 = float(_471);
    int _490 = _479 * int(_486);
    int _492 = _490 + _471;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_467) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = trunc(_496);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    bool _508 = !_500;
    float _510 = _508 ? 7.345489978790283203125 : 1.0;
    float _512 = _510 * _129;
    float _514 = floor(_512);
    int _516 = int(_486) + int(_506);
    bool _518 = _488 >= _463;
    bool _520 = isnan(_488);
    bool _522 = _518 || _520;
    bool _524 = isnan(_463);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    int _530 = _449 * _516;
    int _532 = _530 + _471;
    float _534 = trunc(_528);
    int _536 = int(_534);
    bool _538 = uint(_532) >= uint(_425);
    float _540 = -_514;
    float _542 = _512 + _540;
    int _544 = _425 + (-1);
    bool _546 = !_538;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _560 = _558 != 0;
    int _562 = ~_516;
    int _564 = _562 + _548;
    int _566 = _564 + 1;
    bool _568 = _425 == 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _572 = _570 != 0;
    int _574 = _425 * _566;
    int _576 = _574 + _471;
    float _578 = _463 * _107;
    int _580 = ~_536;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _542 * _463;
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = _578 * _441;
    bool _600 = !_568;
    int _602 = _600 ? _576 : (-1);
    bool _604 = !_556;
    int _606 = _604 ? 0 : 1;
    float _608 = trunc(_586);
    int _610 = int(_608);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _614 = _612 != 0;
    int _616 = _602 * _584;
    int _618 = abs(_606);
    float _620 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _622 = !_552;
    int _624 = _622 ? 0 : 1;
    int _626 = _536 * _544;
    int _628 = _626 + _616;
    float _630 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = trunc(_598);
    int _634 = int(_632);
    int _636 = abs(_624);
    int _638 = _628 * _618;
    float _640 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = in.m_37.y;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _650 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _620);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    int _658 = abs(_646);
    float _660 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _648);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _664 = _662 != 0;
    float _666 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    bool _668 = !_560;
    int _670 = _668 ? 0 : 1;
    int _672 = _610 * _658;
    int _674 = _672 + _471;
    bool _676 = !_664;
    int _678 = _676 ? 0 : 1;
    int _680 = _634 * _636;
    int _682 = _680 + _638;
    float _684 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = abs(_670);
    float _688 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _656);
    int _690 = abs(_678);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _694 = _654 * _107;
    int _696 = _674 * _686;
    int _698 = _696 + _682;
    float _700 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = exp2(_694);
    int _704 = _610 * _690;
    int _706 = _704 + _698;
    float _708 = _642 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _712 = -_692;
    float _714 = fma(_684, 2.0, _712);
    bool _716 = _129 > 0.5;
    float _718 = _660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = float(uint(_706));
    float _722 = fma(_708, -2.0, _710);
    float _724 = -_107;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _714);
    float _728 = -_189;
    int _730 = _716 ? as_type<int>(_728) : as_type<int>(_189);
    float _732 = as_type<float>(_467) * _720;
    float _734 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _762 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _760);
    float _764 = _596 ? _748 : 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _766;
    float _770 = 1.0 / _752;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _778 = _642 > 0.5;
    bool _780 = _465 >= 0.0;
    bool _782 = isnan(_465);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[78].w, _776);
    float _792 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    float _794 = -_197;
    int _796 = _778 ? as_type<int>(_794) : as_type<int>(_197);
    float _798 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    int _800 = _453 * int(_758);
    int _802 = _800 + _706;
    float _804 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    float _806 = in.m_37.z;
    bool _808 = _465 > 0.0;
    float _810 = 1.0 / _774;
    float _812 = float(uint(_802));
    if (_744)
    {
        float _814 = _764 * _770;
        _109 = _814;
    }
    float _816 = _109;
    float _818 = -_804;
    float _820 = _818 + 1.0;
    float _822 = as_type<float>(_467) * _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _824;
    float _828 = 1.0 / _768;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    int _842 = ~_425;
    int _844 = _842 + 1;
    float _846 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = trunc(_822);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _856 = !_840;
    float _858 = _856 ? _189 : as_type<float>(_730);
    float _860 = _417 * _810;
    bool _862 = !_834;
    float _864 = _862 ? _197 : as_type<float>(_796);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _878 = _876 != 0;
    float _880 = 1.0 / _826;
    float _882 = _642 * 2.0;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _129 + _642;
    float _888 = _421 * _828;
    out.m_44.x = _884;
    out.m_44.y = _846;
    out.m_44.z = _854;
    int _890 = int(_758) + int(_852);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _894 = _405 + _892;
    float _896 = floor(_882);
    float _898 = _886 + (-1.0);
    float _900 = float(uint(_674));
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _904 = _894 * _880;
    float _906 = _806 * 2.0;
    int _908 = _844 * _890;
    int _910 = _908 + _706;
    float _912 = _129 + _806;
    int _914 = _788 ? 0 : 1;
    float _916 = floor(_906);
    float _918 = _912 + (-1.0);
    bool _920 = uint(_910) >= uint(_425);
    float _922 = _642 + _806;
    float _924 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _928 = !_920;
    int _930 = _928 ? 0 : (-1);
    float _932 = _922 + (-1.0);
    int _934 = ~_914;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _924 * _129;
    int _942 = ~_890;
    int _944 = _942 + _930;
    int _946 = _944 + 1;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _948;
    int _952 = _938;
    if (!_808)
    {
        int _954 = ~_914;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = trunc(_940);
    int _962 = int(_960);
    bool _964 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _966 = isnan(_405);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    int _976 = _425 * _946;
    int _978 = _976 + _706;
    bool _980 = _916 >= 0.0;
    bool _982 = isnan(_916);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _994 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _996 = isnan(_405);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1008 = _988 ? 0 : 1;
    float _1010 = _642 + (-0.5);
    bool _1012 = _916 > 0.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1014;
    bool _1018 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1020 = isnan(_405);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1034 = _896 >= 0.0;
    bool _1036 = isnan(_896);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = -_974;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1028;
    float _1050 = _1048 + 1.0;
    int _1052 = _1042 ? 0 : 1;
    int _1054 = _962 << 4;
    int _1056 = _1054 + 1712;
    float _1058 = _1004 * _1050;
    float _1060 = as_type<float>(_467) * _900;
    float _1062 = -_1004;
    float _1064 = _1062 + 1.0;
    float _1066 = _858 + 0.5;
    bool _1068 = _896 > 0.0;
    float _1070 = fma(_1016, _888, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1072 = _974 * _1064;
    float _1074 = trunc(_1060);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = fma(_992, _860, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1082 = fma(_1032, _860, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[80].x, _726);
    float _1086 = fma(_950, _888, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = _437 * _1046;
    uint _1090 = uint(int(uint(_1056) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[int(_1100)][_1102];
    bool _1106 = !_568;
    int _1108 = _1106 ? _978 : (-1);
    float _1110 = _864 + (-0.5);
    float _1112 = _1070 * _1088;
    float _1114 = _1086 * _1088;
    int _1116 = _1108 >> 31;
    float _1118 = -_1110;
    float _1120 = -_792;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1120);
    float _1124 = -_437;
    float _1126 = _1124 + 1.0;
    int _1128 = _1056 + 8;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = _1116 & 3;
    float _1140 = fma(_864, _820, _1122);
    int _1142 = ~_1052;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1112);
    int _1150 = _1108 + _1138;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1114);
    int _1154 = _1146;
    float _1156 = _1010;
    if (!_1068)
    {
        int _1158 = ~_1052;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    int _1164 = _457 * int(_1078);
    int _1166 = _1164 + _674;
    int _1168 = _1150 >> 2;
    float _1170 = fma(_1082, _1072, _1152);
    bool _1172 = !_874;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1166));
    int _1178 = _1168 << 4;
    int _1180 = _1178 + 368;
    int _1182 = ~_1008;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_467) * _1176;
    float _1190 = -_798;
    float _1192 = _1190 + 1.0;
    int _1194 = _1186;
    if (!_1012)
    {
        int _1196 = ~_1008;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    uint _1202 = uint(int(uint(_1180) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    bool _1218 = !_870;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -_1192;
    float _1224 = fma(_858, _1222, _1084);
    int _1226 = abs(_1174);
    float _1228 = trunc(_1188);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    int _1234 = _1108 & 3;
    bool _1236 = _1234 != 0;
    int _1238 = _1108 & 3;
    bool _1240 = _1238 != 0;
    out.m_46.x = _1224;
    out.m_46.y = _1140;
    bool _1242 = uint(_1234) > 1u;
    float _1244 = float(_958);
    float _1246 = float(_1226);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1250 = abs(_1220);
    float _1252 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1256 = _1180 + 8;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[int(_1268)][_1270];
    int _1274 = _1240 ? 0 : 1;
    float _1276 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1246 * _1244;
    int _1282 = ~_1274;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1290 = _1286;
    if (!_1242)
    {
        int _1292 = ~_1274;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _718 + _1298;
    bool _1302 = _1234 != 3;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1306 = abs(_1296);
    int _1308 = ~_425;
    int _1310 = _1308 + 1;
    out.m_48.x = _1276;
    out.m_48.y = _1278;
    out.m_48.z = _1304;
    out.m_48.w = _1248;
    int _1312 = int(_1078) + int(_1232);
    float _1314 = float(_1250);
    float _1316 = float(_1200);
    int _1318 = _1310 * _1312;
    int _1320 = _1318 + _674;
    float _1322 = _1314 * _1316;
    bool _1324 = uint(_1320) >= uint(_425);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _700 + _1326;
    bool _1330 = !_1236;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = uint(_1234) >= 2u;
    int _1336 = abs(_1332);
    int _1338 = _1334 ? 0 : 1;
    int _1340 = ~_1306;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1336;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = _1344 * as_type<int>(_1216);
    bool _1360 = _1234 != 3;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1364 = _1356;
    if (_1302)
    {
        int _1366 = ~_1338;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    int _1372 = _1350 * as_type<int>(_1208);
    int _1374 = _1372 + _1358;
    bool _1376 = !_1360;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = in.m_50.x;
    float _1382 = in.m_50.y;
    float _1384 = in.m_50.z;
    int _1386 = abs(_1370);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _734 + _1388;
    int _1392 = abs(_1378);
    float _1394 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1362);
    bool _1396 = !_1324;
    int _1398 = _1396 ? 0 : (-1);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1394);
    bool _1402 = !_614;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = ~_1312;
    int _1408 = _1406 + _1398;
    int _1410 = _1408 + 1;
    int _1412 = ~_1386;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = abs(_1404);
    int _1420 = _425 * _1410;
    int _1422 = _1420 + _674;
    float _1424 = _1328 * _1328;
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _1416 * as_type<int>(_1264);
    int _1434 = _1432 + _1374;
    float _1436 = _1280 * (-2.0);
    bool _1438 = _1400 >= 0.0;
    float _1440 = fma(_1300, _1300, _1424);
    int _1442 = _1430 * as_type<int>(_1272);
    int _1444 = _1442 + _1434;
    float _1446 = fma(_1436, _1382, _1382);
    float _1448 = fma(_1006, _1436, _1006);
    int _1450 = ~_1418;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1390, _1390, _1440);
    bool _1458 = !_568;
    int _1460 = _1458 ? _1422 : (-1);
    float _1462 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1446);
    bool _1464 = !_878;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1444 * _1454;
    float _1470 = _1322 * (-2.0);
    float _1472 = rsqrt(_1456);
    float _1474 = _1384;
    if (_1438)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1476 = _1156;
    int _1478 = _1460 * _1418;
    int _1480 = _1478 + _1468;
    int _1482 = abs(_1466);
    int _1484 = as_type<int>(_1476);
    if (_1438)
    {
        out.m_33.x = 0.0;
    }
    if (_1438)
    {
        float _1486 = _1476 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = float(_1480);
    float _1492 = fma(_902, _1470, _902);
    float _1494 = fma(_1470, _1380, _1380);
    float _1496 = fma(_1448, _816, _1462);
    if (_1438)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4201 = as_type<float>(_1488);
        out.gl_Position.z = _4201;
    }
    float _1498 = _129 + (-0.5);
    float _1500 = float(_1482);
    out.m_52.x = _1490;
    float _1502 = float(_1162);
    float _1504 = _1328 * _1472;
    float _1506 = _1300 * _1472;
    float _1508 = _1390 * _1472;
    if (_1438)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1510 = -_1504;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1328);
    float _1514 = -_1504;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _1518 = -_1506;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1522 = -_1506;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1526 = _1512 * _1512;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1494);
    float _1534 = _1496 * 0.15915493667125701904296875;
    float _1536 = fma(_1520, _1520, _1526);
    float _1538 = -_1508;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1542 = -_1508;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _734);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1524 + _1546;
    float _1550 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1552 = _1500 * _1502;
    float _1554 = in.m_42.x;
    float _1556 = in.m_42.y;
    float _1558 = fma(_1540, _1540, _1536);
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1544 + _1560;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1550);
    float _1566 = _1552 * (-2.0);
    float _1568 = fma(_1492, _816, _1532);
    float _1570 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1564);
    float _1572 = fma(_926, _1566, _926);
    float _1574 = fma(_1566, _1384, _1384);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1576;
    float _1580 = _806 + (-0.5);
    bool _1582 = _1570 >= 0.0;
    float _1584 = _1568 * 0.15915493667125701904296875;
    float _1586 = fma(_1578, _904, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1588 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1574);
    float _1590 = fma(_1080, _1072, _1148);
    float _1592 = fma(_1586, _1058, _1170);
    float _1594 = fma(_1572, _816, _1588);
    float _1596 = _1534 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1600;
    float _1604 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1592);
    float _1606 = _1594 * 0.15915493667125701904296875;
    if (_1582)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1608 = _1474;
    float _1610 = _1604 * _1556;
    float _1612 = fma(_1602, _904, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1614 = _1534 * 6.283185482025146484375;
    float _1616 = cos(_1614);
    int _1618 = as_type<int>(_1608);
    if (_1582)
    {
        float _1620 = _1608 * 5.0;
        _1618 = as_type<int>(_1620);
    }
    int _1622 = _1618;
    if (_1582)
    {
        out.m_33.x = 0.0;
    }
    float _1624 = fma(_1612, _1058, _1590);
    if (_1582)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4432 = as_type<float>(_1622);
        out.gl_Position.z = _4432;
    }
    float _1626 = sqrt(_1558);
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    float _1632 = _1584 * 6.283185482025146484375;
    float _1634 = cos(_1632);
    float _1636 = _1606 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    if (_1582)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1640 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1624);
    float _1642 = _373 * _1610;
    float _1644 = _1606 * 6.283185482025146484375;
    float _1646 = cos(_1644);
    float _1648 = _1472 * _1626;
    float _1650 = _1640 * _1554;
    float _1652 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1658 = _373 * _1650;
    float _1660 = _1648 * _1652;
    float _1662 = _1634 * _1598;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1666 = _1654 * _1660;
    float _1668 = _1630 * _1598;
    float _1670 = _1634 * _1616;
    float _1672 = _1648 * _1664;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1676 = _1674 * 0.5;
    float _1678 = _1646 * _1666;
    float _1680 = _1598 * _1646;
    float _1682 = _1656 * _1672;
    float _1684 = fma(_1638, _1670, _1668);
    float _1686 = _1634 * _1678;
    float _1688 = _1616 * _1646;
    float _1690 = _1630 * _1616;
    float _1692 = -_1666;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1684, _1682, _1686);
    float _1698 = _1630 * _1678;
    float _1700 = -_1690;
    float _1702 = fma(_1638, _1662, _1700);
    float _1704 = -_1662;
    float _1706 = fma(_1638, _1690, _1704);
    float _1708 = fma(_1688, _1682, _1694);
    float _1710 = fma(_1638, _1668, _1670);
    float _1712 = fma(_1702, _1676, _1696);
    float _1714 = fma(_1706, _1682, _1698);
    float _1716 = fma(_1680, _1676, _1708);
    bool _1718 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1720 = isnan(0.5);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1726 = _1722 || _1724;
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1730 = fma(_1710, _1676, _1714);
    float _1732 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1728);
    bool _1738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1740 = isnan(0.5);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1746 = _1742 || _1744;
    float _1748 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1750 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1734);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1764 = _734 + _1758;
    float _1766 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1760);
    float _1768 = _718 + _1762;
    float _1770 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1774 = _1764 + _1772;
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1780 = _1768 + _1778;
    float _1782 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1770);
    float _1784 = _1774 * _1774;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = 1.0 / _1786;
    float _1794 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = _700 + _1794;
    float _1800 = _1796 + _1786;
    float _1802 = sqrt(_1790);
    bool _1804 = _1802 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1734;
    float _1808 = _1796;
    float _1810 = _1770;
    if (!_1804)
    {
        _1806 = _1768;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    if (!_1804)
    {
        _1808 = _1764;
    }
    float _1816 = _1808;
    float _1818 = _1816;
    if (!_1804)
    {
        _1810 = _1798;
    }
    float _1820 = _1810;
    bool _1822 = !_1804;
    float _1824 = _1820;
    if (!_1822)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1830 = _1802 + _1828;
        float _1832 = rsqrt(_1790);
        float _1834 = _1830 * _1826;
        float _1836 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * 0.15915493667125701904296875;
        float _1840 = _1838 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = _1832 * _1848;
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1780, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1774, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1858 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = fma(_1798, _1846, _1858);
        _1814 = _1854;
        _1824 = _1860;
        _1818 = _1856;
    }
    float _1862 = _1814;
    float _1864 = _1824;
    float _1866 = _1818;
    float _1868 = -_1506;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1862);
    float _1872 = -_1504;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1864);
    float _1876 = -_1508;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _1880 = _1800 * _1792;
    float _1882 = _1880 * 0.5;
    float _1884 = _1874;
    float _1886 = _1870;
    float _1888 = _1878;
    if (!_1726)
    {
        float _1890 = _1530 * _1530;
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1894 = -_718;
        float _1896 = _1894 + _1862;
        float _1898 = -_734;
        float _1900 = _1898 + _1866;
        float _1902 = fma(_1548, _1548, _1890);
        float _1904 = fma(_1562, _1562, _1902);
        float _1906 = 1.0 / _1648;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1892;
        float _1914 = _1912 * _1906;
        float _1916 = -_700;
        float _1918 = _1916 + _1864;
        float _1920 = fma(_1896, _1914, _1524);
        float _1922 = fma(_1918, _1914, _1516);
        float _1924 = fma(_1900, _1914, _1544);
        _1884 = _1922;
        _1886 = _1920;
        _1888 = _1924;
    }
    float _1926 = _1884;
    float _1928 = _1886;
    float _1930 = _1888;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1932);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1936);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1948 = _1926;
    if (_1746)
    {
        _1948 = 1.0;
    }
    float _1950 = _1948;
    float _1952 = _1950;
    if (!_1746)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1956 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1954);
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1962 = 1.0 / _1956;
        float _1964 = 1.0 / _1960;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1970 = fma(_1962, _1966, _1968);
        float _1972 = _1970 * _1964;
        float _1974 = precise::clamp(_1972, 0.0, 1.0);
        float _1976 = -_1974;
        float _1978 = _1976 + 1.0;
        _1952 = _1978;
    }
    float _1980 = _1952;
    float _1982 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1984 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1986 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1946);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = _373 * _1988;
    float _2006 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1998);
    float _2008 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    float _2018 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2010);
    float _2022 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2024 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    bool _2028 = _1980 > 0.0;
    bool _2030 = isnan(_1980);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2042 = _2024 + _2026;
    float _2044 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float _2046 = _2004 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = _2042 * 0.5;
    out.m_33.x = _2046;
    out.gl_Position.x = _2040;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _2026;
    out.m_54.z = _2048;
    out.m_54.w = _2026;
    if (_2036)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2050 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2050;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2107 = as_type<float>(_89);
        out.gl_Position.z = _2107;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_127);
        out.gl_Position.z = _2177;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = 0.0;
    float _153 = _137;
    if (!_147)
    {
        float _155 = _137 * _137;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _163 = _159;
    if (!_147)
    {
        float _165 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_135) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_135) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_175;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_179;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_171;
    float _201 = _161 + _199;
    bool _203 = _201 < 0.5;
    float _205 = float(_203);
    float _207 = fma(_193, 0.5, 0.5);
    bool _209 = !_147;
    float _211 = _167;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _153 = _265;
    }
    float _267 = _153;
    float _269 = -_201;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = -_207;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = in.m_35.x;
    float _279 = in.m_35.y;
    float _281 = in.m_35.z;
    bool _283 = !_185;
    int _285 = _283 ? 0 : 1;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = -_205;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = in.m_42.w;
    bool _307 = !_291;
    int _309 = _307 ? 0 : 1;
    float _311 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    int _325 = abs(_309);
    float _327 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _329 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _321);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _333 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    int _339 = abs(_285);
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = fma(_267, _277, _331);
    float _347 = float(_325);
    float _349 = fma(_267, _279, _333);
    int _351 = abs(_343);
    float _353 = fma(_267, _281, _337);
    float _355 = float(_339);
    float _357 = abs(_271);
    float _359 = _347 * _357;
    float _361 = float(_351);
    float _363 = fma(_355, _275, _359);
    float _365 = fma(_345, _305, _315);
    float _367 = fma(_349, _305, _317);
    float _369 = fma(_353, _305, _319);
    float _371 = abs(_299);
    float _373 = fma(_361, _371, _363);
    bool _375 = !_335;
    float _393;
    float _395;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _383 = _381 * _377;
        float _385 = float(_73);
        float _387 = floor(_383);
        float _389 = -_387;
        float _391 = _383 + _389;
        _393 = _391;
        _395 = _385;
        _397 = true;
    }
    else
    {
        float _399 = float(_73);
        float _401 = 1.0 / _399;
        float _403 = _107 * _401;
        _393 = _403;
        _395 = _399;
    }
    _397 = false;
    float _405 = _393;
    float _407 = _395;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _129 * 2.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _405 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _405 + _419;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _425 = int(_423);
    bool _427 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_405);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(_411);
    float _441 = 1.0 / _407;
    float _443 = float(uint(_425));
    float _445 = 1.0 / _439;
    int _447 = ~_425;
    int _449 = _447 + 1;
    int _451 = ~_425;
    int _453 = _451 + 1;
    int _455 = ~_425;
    int _457 = _455 + 1;
    float _459 = 1.0 / _443;
    float _461 = _445 * _107;
    float _463 = float(_425);
    float _465 = floor(_413);
    int _467 = as_type<int>(_459) + (-2);
    float _469 = trunc(_461);
    int _471 = int(_469);
    float _473 = float(uint(_471));
    float _475 = as_type<float>(_467) * _473;
    int _477 = ~_425;
    int _479 = _477 + 1;
    float _481 = trunc(_475);
    float _483 = precise::max(_481, 0.0);
    uint _486 = uint(_483);
    float _488 = float(_471);
    int _490 = _479 * int(_486);
    int _492 = _490 + _471;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_467) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = trunc(_496);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    bool _508 = !_500;
    float _510 = _508 ? 7.345489978790283203125 : 1.0;
    float _512 = _510 * _129;
    float _514 = floor(_512);
    int _516 = int(_486) + int(_506);
    bool _518 = _488 >= _463;
    bool _520 = isnan(_488);
    bool _522 = _518 || _520;
    bool _524 = isnan(_463);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    int _530 = _449 * _516;
    int _532 = _530 + _471;
    float _534 = trunc(_528);
    int _536 = int(_534);
    bool _538 = uint(_532) >= uint(_425);
    float _540 = -_514;
    float _542 = _512 + _540;
    int _544 = _425 + (-1);
    bool _546 = !_538;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _560 = _558 != 0;
    int _562 = ~_516;
    int _564 = _562 + _548;
    int _566 = _564 + 1;
    bool _568 = _425 == 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _572 = _570 != 0;
    int _574 = _425 * _566;
    int _576 = _574 + _471;
    float _578 = _463 * _107;
    int _580 = ~_536;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _542 * _463;
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = _578 * _441;
    bool _600 = !_568;
    int _602 = _600 ? _576 : (-1);
    bool _604 = !_556;
    int _606 = _604 ? 0 : 1;
    float _608 = trunc(_586);
    int _610 = int(_608);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _614 = _612 != 0;
    int _616 = _602 * _584;
    int _618 = abs(_606);
    float _620 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _622 = !_552;
    int _624 = _622 ? 0 : 1;
    int _626 = _536 * _544;
    int _628 = _626 + _616;
    float _630 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = trunc(_598);
    int _634 = int(_632);
    int _636 = abs(_624);
    int _638 = _628 * _618;
    float _640 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = in.m_37.y;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _650 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _620);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    int _658 = abs(_646);
    float _660 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _648);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _664 = _662 != 0;
    float _666 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    bool _668 = !_560;
    int _670 = _668 ? 0 : 1;
    int _672 = _610 * _658;
    int _674 = _672 + _471;
    bool _676 = !_664;
    int _678 = _676 ? 0 : 1;
    int _680 = _634 * _636;
    int _682 = _680 + _638;
    float _684 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = abs(_670);
    float _688 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _656);
    int _690 = abs(_678);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _694 = _654 * _107;
    int _696 = _674 * _686;
    int _698 = _696 + _682;
    float _700 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = exp2(_694);
    int _704 = _610 * _690;
    int _706 = _704 + _698;
    float _708 = _642 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _712 = -_692;
    float _714 = fma(_684, 2.0, _712);
    bool _716 = _129 > 0.5;
    float _718 = _660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = float(uint(_706));
    float _722 = fma(_708, -2.0, _710);
    float _724 = -_107;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _714);
    float _728 = -_189;
    int _730 = _716 ? as_type<int>(_728) : as_type<int>(_189);
    float _732 = as_type<float>(_467) * _720;
    float _734 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _762 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _760);
    float _764 = _596 ? _748 : 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _766;
    float _770 = 1.0 / _752;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _778 = _642 > 0.5;
    bool _780 = _465 >= 0.0;
    bool _782 = isnan(_465);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[78].w, _776);
    float _792 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    float _794 = -_197;
    int _796 = _778 ? as_type<int>(_794) : as_type<int>(_197);
    float _798 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    int _800 = _453 * int(_758);
    int _802 = _800 + _706;
    float _804 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    float _806 = in.m_37.z;
    bool _808 = _465 > 0.0;
    float _810 = 1.0 / _774;
    float _812 = float(uint(_802));
    if (_744)
    {
        float _814 = _764 * _770;
        _109 = _814;
    }
    float _816 = _109;
    float _818 = -_804;
    float _820 = _818 + 1.0;
    float _822 = as_type<float>(_467) * _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _824;
    float _828 = 1.0 / _768;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    int _842 = ~_425;
    int _844 = _842 + 1;
    float _846 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = trunc(_822);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _856 = !_840;
    float _858 = _856 ? _189 : as_type<float>(_730);
    float _860 = _417 * _810;
    bool _862 = !_834;
    float _864 = _862 ? _197 : as_type<float>(_796);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _878 = _876 != 0;
    float _880 = 1.0 / _826;
    float _882 = _642 * 2.0;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _129 + _642;
    float _888 = _421 * _828;
    out.m_44.x = _884;
    out.m_44.y = _846;
    out.m_44.z = _854;
    int _890 = int(_758) + int(_852);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _894 = _405 + _892;
    float _896 = floor(_882);
    float _898 = _886 + (-1.0);
    float _900 = float(uint(_674));
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _904 = _894 * _880;
    float _906 = _806 * 2.0;
    int _908 = _844 * _890;
    int _910 = _908 + _706;
    float _912 = _129 + _806;
    int _914 = _788 ? 0 : 1;
    float _916 = floor(_906);
    float _918 = _912 + (-1.0);
    bool _920 = uint(_910) >= uint(_425);
    float _922 = _642 + _806;
    float _924 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _928 = !_920;
    int _930 = _928 ? 0 : (-1);
    float _932 = _922 + (-1.0);
    int _934 = ~_914;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _924 * _129;
    int _942 = ~_890;
    int _944 = _942 + _930;
    int _946 = _944 + 1;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _948;
    int _952 = _938;
    if (!_808)
    {
        int _954 = ~_914;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = trunc(_940);
    int _962 = int(_960);
    bool _964 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _966 = isnan(_405);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    int _976 = _425 * _946;
    int _978 = _976 + _706;
    bool _980 = _916 >= 0.0;
    bool _982 = isnan(_916);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _994 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _996 = isnan(_405);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1008 = _988 ? 0 : 1;
    float _1010 = _642 + (-0.5);
    bool _1012 = _916 > 0.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1014;
    bool _1018 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1020 = isnan(_405);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1034 = _896 >= 0.0;
    bool _1036 = isnan(_896);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = -_974;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1028;
    float _1050 = _1048 + 1.0;
    int _1052 = _1042 ? 0 : 1;
    int _1054 = _962 << 4;
    int _1056 = _1054 + 1712;
    float _1058 = _1004 * _1050;
    float _1060 = as_type<float>(_467) * _900;
    float _1062 = -_1004;
    float _1064 = _1062 + 1.0;
    float _1066 = _858 + 0.5;
    bool _1068 = _896 > 0.0;
    float _1070 = fma(_1016, _888, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1072 = _974 * _1064;
    float _1074 = trunc(_1060);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = fma(_992, _860, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1082 = fma(_1032, _860, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[80].x, _726);
    float _1086 = fma(_950, _888, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = _437 * _1046;
    uint _1090 = uint(int(uint(_1056) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[int(_1100)][_1102];
    bool _1106 = !_568;
    int _1108 = _1106 ? _978 : (-1);
    float _1110 = _864 + (-0.5);
    float _1112 = _1070 * _1088;
    float _1114 = _1086 * _1088;
    int _1116 = _1108 >> 31;
    float _1118 = -_1110;
    float _1120 = -_792;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1120);
    float _1124 = -_437;
    float _1126 = _1124 + 1.0;
    int _1128 = _1056 + 8;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = _1116 & 3;
    float _1140 = fma(_864, _820, _1122);
    int _1142 = ~_1052;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1112);
    int _1150 = _1108 + _1138;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1114);
    int _1154 = _1146;
    float _1156 = _1010;
    if (!_1068)
    {
        int _1158 = ~_1052;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    int _1164 = _457 * int(_1078);
    int _1166 = _1164 + _674;
    int _1168 = _1150 >> 2;
    float _1170 = fma(_1082, _1072, _1152);
    bool _1172 = !_874;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1166));
    int _1178 = _1168 << 4;
    int _1180 = _1178 + 368;
    int _1182 = ~_1008;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_467) * _1176;
    float _1190 = -_798;
    float _1192 = _1190 + 1.0;
    int _1194 = _1186;
    if (!_1012)
    {
        int _1196 = ~_1008;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    uint _1202 = uint(int(uint(_1180) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    bool _1218 = !_870;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -_1192;
    float _1224 = fma(_858, _1222, _1084);
    int _1226 = abs(_1174);
    float _1228 = trunc(_1188);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    int _1234 = _1108 & 3;
    bool _1236 = _1234 != 0;
    int _1238 = _1108 & 3;
    bool _1240 = _1238 != 0;
    out.m_46.x = _1224;
    out.m_46.y = _1140;
    bool _1242 = uint(_1234) > 1u;
    float _1244 = float(_958);
    float _1246 = float(_1226);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1250 = abs(_1220);
    float _1252 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1256 = _1180 + 8;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[int(_1268)][_1270];
    int _1274 = _1240 ? 0 : 1;
    float _1276 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1246 * _1244;
    int _1282 = ~_1274;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1290 = _1286;
    if (!_1242)
    {
        int _1292 = ~_1274;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _718 + _1298;
    bool _1302 = _1234 != 3;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1306 = abs(_1296);
    int _1308 = ~_425;
    int _1310 = _1308 + 1;
    out.m_48.x = _1276;
    out.m_48.y = _1278;
    out.m_48.z = _1304;
    out.m_48.w = _1248;
    int _1312 = int(_1078) + int(_1232);
    float _1314 = float(_1250);
    float _1316 = float(_1200);
    int _1318 = _1310 * _1312;
    int _1320 = _1318 + _674;
    float _1322 = _1314 * _1316;
    bool _1324 = uint(_1320) >= uint(_425);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _700 + _1326;
    bool _1330 = !_1236;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = uint(_1234) >= 2u;
    int _1336 = abs(_1332);
    int _1338 = _1334 ? 0 : 1;
    int _1340 = ~_1306;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1336;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = _1344 * as_type<int>(_1216);
    bool _1360 = _1234 != 3;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1364 = _1356;
    if (_1302)
    {
        int _1366 = ~_1338;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    int _1372 = _1350 * as_type<int>(_1208);
    int _1374 = _1372 + _1358;
    bool _1376 = !_1360;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = in.m_50.x;
    float _1382 = in.m_50.y;
    float _1384 = in.m_50.z;
    int _1386 = abs(_1370);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _734 + _1388;
    int _1392 = abs(_1378);
    float _1394 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1362);
    bool _1396 = !_1324;
    int _1398 = _1396 ? 0 : (-1);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1394);
    bool _1402 = !_614;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = ~_1312;
    int _1408 = _1406 + _1398;
    int _1410 = _1408 + 1;
    int _1412 = ~_1386;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = abs(_1404);
    int _1420 = _425 * _1410;
    int _1422 = _1420 + _674;
    float _1424 = _1328 * _1328;
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _1416 * as_type<int>(_1264);
    int _1434 = _1432 + _1374;
    float _1436 = _1280 * (-2.0);
    bool _1438 = _1400 >= 0.0;
    float _1440 = fma(_1300, _1300, _1424);
    int _1442 = _1430 * as_type<int>(_1272);
    int _1444 = _1442 + _1434;
    float _1446 = fma(_1436, _1382, _1382);
    float _1448 = fma(_1006, _1436, _1006);
    int _1450 = ~_1418;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1390, _1390, _1440);
    bool _1458 = !_568;
    int _1460 = _1458 ? _1422 : (-1);
    float _1462 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1446);
    bool _1464 = !_878;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1444 * _1454;
    float _1470 = _1322 * (-2.0);
    float _1472 = rsqrt(_1456);
    float _1474 = _1384;
    if (_1438)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1476 = _1156;
    int _1478 = _1460 * _1418;
    int _1480 = _1478 + _1468;
    int _1482 = abs(_1466);
    int _1484 = as_type<int>(_1476);
    if (_1438)
    {
        out.m_33.x = 0.0;
    }
    if (_1438)
    {
        float _1486 = _1476 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = float(_1480);
    float _1492 = fma(_902, _1470, _902);
    float _1494 = fma(_1470, _1380, _1380);
    float _1496 = fma(_1448, _816, _1462);
    if (_1438)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4201 = as_type<float>(_1488);
        out.gl_Position.z = _4201;
    }
    float _1498 = _129 + (-0.5);
    float _1500 = float(_1482);
    out.m_52.x = _1490;
    float _1502 = float(_1162);
    float _1504 = _1328 * _1472;
    float _1506 = _1300 * _1472;
    float _1508 = _1390 * _1472;
    if (_1438)
    {
        return out;
    }
    float _1510 = -_1504;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1328);
    float _1514 = -_1504;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _1518 = -_1506;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1522 = -_1506;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1526 = _1512 * _1512;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1494);
    float _1534 = _1496 * 0.15915493667125701904296875;
    float _1536 = fma(_1520, _1520, _1526);
    float _1538 = -_1508;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1542 = -_1508;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _734);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1524 + _1546;
    float _1550 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1552 = _1500 * _1502;
    float _1554 = in.m_42.x;
    float _1556 = in.m_42.y;
    float _1558 = fma(_1540, _1540, _1536);
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1544 + _1560;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1550);
    float _1566 = _1552 * (-2.0);
    float _1568 = fma(_1492, _816, _1532);
    float _1570 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1564);
    float _1572 = fma(_926, _1566, _926);
    float _1574 = fma(_1566, _1384, _1384);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1576;
    float _1580 = _806 + (-0.5);
    bool _1582 = _1570 >= 0.0;
    float _1584 = _1568 * 0.15915493667125701904296875;
    float _1586 = fma(_1578, _904, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1588 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1574);
    float _1590 = fma(_1080, _1072, _1148);
    float _1592 = fma(_1586, _1058, _1170);
    float _1594 = fma(_1572, _816, _1588);
    float _1596 = _1534 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1600;
    float _1604 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1592);
    float _1606 = _1594 * 0.15915493667125701904296875;
    if (_1582)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1608 = _1474;
    float _1610 = _1604 * _1556;
    float _1612 = fma(_1602, _904, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1614 = _1534 * 6.283185482025146484375;
    float _1616 = cos(_1614);
    int _1618 = as_type<int>(_1608);
    if (_1582)
    {
        float _1620 = _1608 * 5.0;
        _1618 = as_type<int>(_1620);
    }
    int _1622 = _1618;
    if (_1582)
    {
        out.m_33.x = 0.0;
    }
    float _1624 = fma(_1612, _1058, _1590);
    if (_1582)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4432 = as_type<float>(_1622);
        out.gl_Position.z = _4432;
    }
    float _1626 = sqrt(_1558);
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    float _1632 = _1584 * 6.283185482025146484375;
    float _1634 = cos(_1632);
    float _1636 = _1606 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    if (_1582)
    {
        return out;
    }
    float _1640 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1624);
    float _1642 = _373 * _1610;
    float _1644 = _1606 * 6.283185482025146484375;
    float _1646 = cos(_1644);
    float _1648 = _1472 * _1626;
    float _1650 = _1640 * _1554;
    float _1652 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1658 = _373 * _1650;
    float _1660 = _1648 * _1652;
    float _1662 = _1634 * _1598;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1666 = _1654 * _1660;
    float _1668 = _1630 * _1598;
    float _1670 = _1634 * _1616;
    float _1672 = _1648 * _1664;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1676 = _1674 * 0.5;
    float _1678 = _1646 * _1666;
    float _1680 = _1598 * _1646;
    float _1682 = _1656 * _1672;
    float _1684 = fma(_1638, _1670, _1668);
    float _1686 = _1634 * _1678;
    float _1688 = _1616 * _1646;
    float _1690 = _1630 * _1616;
    float _1692 = -_1666;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1684, _1682, _1686);
    float _1698 = _1630 * _1678;
    float _1700 = -_1690;
    float _1702 = fma(_1638, _1662, _1700);
    float _1704 = -_1662;
    float _1706 = fma(_1638, _1690, _1704);
    float _1708 = fma(_1688, _1682, _1694);
    float _1710 = fma(_1638, _1668, _1670);
    float _1712 = fma(_1702, _1676, _1696);
    float _1714 = fma(_1706, _1682, _1698);
    float _1716 = fma(_1680, _1676, _1708);
    bool _1718 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1720 = isnan(0.5);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1726 = _1722 || _1724;
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1730 = fma(_1710, _1676, _1714);
    float _1732 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1728);
    bool _1738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1740 = isnan(0.5);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1746 = _1742 || _1744;
    float _1748 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1750 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1734);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1764 = _734 + _1758;
    float _1766 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1760);
    float _1768 = _718 + _1762;
    float _1770 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1774 = _1764 + _1772;
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1780 = _1768 + _1778;
    float _1782 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1770);
    float _1784 = _1774 * _1774;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = 1.0 / _1786;
    float _1794 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = _700 + _1794;
    float _1800 = _1796 + _1786;
    float _1802 = sqrt(_1790);
    bool _1804 = _1802 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1734;
    float _1808 = _1796;
    float _1810 = _1770;
    if (!_1804)
    {
        _1806 = _1768;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    if (!_1804)
    {
        _1808 = _1764;
    }
    float _1816 = _1808;
    float _1818 = _1816;
    if (!_1804)
    {
        _1810 = _1798;
    }
    float _1820 = _1810;
    bool _1822 = !_1804;
    float _1824 = _1820;
    if (!_1822)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1830 = _1802 + _1828;
        float _1832 = rsqrt(_1790);
        float _1834 = _1830 * _1826;
        float _1836 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * 0.15915493667125701904296875;
        float _1840 = _1838 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = _1832 * _1848;
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1780, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1774, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1858 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = fma(_1798, _1846, _1858);
        _1814 = _1854;
        _1824 = _1860;
        _1818 = _1856;
    }
    float _1862 = _1814;
    float _1864 = _1824;
    float _1866 = _1818;
    float _1868 = -_1506;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1862);
    float _1872 = -_1504;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1864);
    float _1876 = -_1508;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _1880 = _1800 * _1792;
    float _1882 = _1880 * 0.5;
    float _1884 = _1874;
    float _1886 = _1870;
    float _1888 = _1878;
    if (!_1726)
    {
        float _1890 = _1530 * _1530;
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1894 = -_718;
        float _1896 = _1894 + _1862;
        float _1898 = -_734;
        float _1900 = _1898 + _1866;
        float _1902 = fma(_1548, _1548, _1890);
        float _1904 = fma(_1562, _1562, _1902);
        float _1906 = 1.0 / _1648;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1892;
        float _1914 = _1912 * _1906;
        float _1916 = -_700;
        float _1918 = _1916 + _1864;
        float _1920 = fma(_1896, _1914, _1524);
        float _1922 = fma(_1918, _1914, _1516);
        float _1924 = fma(_1900, _1914, _1544);
        _1884 = _1922;
        _1886 = _1920;
        _1888 = _1924;
    }
    float _1926 = _1884;
    float _1928 = _1886;
    float _1930 = _1888;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1932);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1936);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1948 = _1926;
    if (_1746)
    {
        _1948 = 1.0;
    }
    float _1950 = _1948;
    float _1952 = _1950;
    if (!_1746)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1956 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1954);
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1962 = 1.0 / _1956;
        float _1964 = 1.0 / _1960;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1970 = fma(_1962, _1966, _1968);
        float _1972 = _1970 * _1964;
        float _1974 = precise::clamp(_1972, 0.0, 1.0);
        float _1976 = -_1974;
        float _1978 = _1976 + 1.0;
        _1952 = _1978;
    }
    float _1980 = _1952;
    float _1982 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1984 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1986 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1946);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = _373 * _1988;
    float _2006 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1998);
    float _2008 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    float _2018 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2010);
    float _2022 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2024 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    bool _2028 = _1980 > 0.0;
    bool _2030 = isnan(_1980);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2042 = _2024 + _2026;
    float _2044 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float _2046 = _2004 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = _2042 * 0.5;
    out.m_33.x = _2046;
    out.gl_Position.x = _2040;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _2026;
    out.m_54.z = _2048;
    out.m_54.w = _2026;
    if (_2036)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2050 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2050;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2107 = as_type<float>(_89);
        out.gl_Position.z = _2107;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2177 = as_type<float>(_127);
        out.gl_Position.z = _2177;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = 0.0;
    float _153 = _137;
    if (!_147)
    {
        float _155 = _137 * _137;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _163 = _159;
    if (!_147)
    {
        float _165 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_135) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_135) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_175;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _181 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_179;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_171;
    float _201 = _161 + _199;
    bool _203 = _201 < 0.5;
    float _205 = float(_203);
    float _207 = fma(_193, 0.5, 0.5);
    bool _209 = !_147;
    float _211 = _167;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _153 = _265;
    }
    float _267 = _153;
    float _269 = -_201;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = -_207;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = in.m_35.x;
    float _279 = in.m_35.y;
    float _281 = in.m_35.z;
    bool _283 = !_185;
    int _285 = _283 ? 0 : 1;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = -_205;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = in.m_42.w;
    bool _307 = !_291;
    int _309 = _307 ? 0 : 1;
    float _311 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = _287 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    int _325 = abs(_309);
    float _327 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _329 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _321);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _333 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    int _339 = abs(_285);
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = fma(_267, _277, _331);
    float _347 = float(_325);
    float _349 = fma(_267, _279, _333);
    int _351 = abs(_343);
    float _353 = fma(_267, _281, _337);
    float _355 = float(_339);
    float _357 = abs(_271);
    float _359 = _347 * _357;
    float _361 = float(_351);
    float _363 = fma(_355, _275, _359);
    float _365 = fma(_345, _305, _315);
    float _367 = fma(_349, _305, _317);
    float _369 = fma(_353, _305, _319);
    float _371 = abs(_299);
    float _373 = fma(_361, _371, _363);
    bool _375 = !_335;
    float _393;
    float _395;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _383 = _381 * _377;
        float _385 = float(_73);
        float _387 = floor(_383);
        float _389 = -_387;
        float _391 = _383 + _389;
        _393 = _391;
        _395 = _385;
        _397 = true;
    }
    else
    {
        float _399 = float(_73);
        float _401 = 1.0 / _399;
        float _403 = _107 * _401;
        _393 = _403;
        _395 = _399;
    }
    _397 = false;
    float _405 = _393;
    float _407 = _395;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _411 = int(_409);
    float _413 = _129 * 2.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _405 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _405 + _419;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _425 = int(_423);
    bool _427 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_405);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = float(_411);
    float _441 = 1.0 / _407;
    float _443 = float(uint(_425));
    float _445 = 1.0 / _439;
    int _447 = ~_425;
    int _449 = _447 + 1;
    int _451 = ~_425;
    int _453 = _451 + 1;
    int _455 = ~_425;
    int _457 = _455 + 1;
    float _459 = 1.0 / _443;
    float _461 = _445 * _107;
    float _463 = float(_425);
    float _465 = floor(_413);
    int _467 = as_type<int>(_459) + (-2);
    float _469 = trunc(_461);
    int _471 = int(_469);
    float _473 = float(uint(_471));
    float _475 = as_type<float>(_467) * _473;
    int _477 = ~_425;
    int _479 = _477 + 1;
    float _481 = trunc(_475);
    float _483 = precise::max(_481, 0.0);
    uint _486 = uint(_483);
    float _488 = float(_471);
    int _490 = _479 * int(_486);
    int _492 = _490 + _471;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_467) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = trunc(_496);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    bool _508 = !_500;
    float _510 = _508 ? 7.345489978790283203125 : 1.0;
    float _512 = _510 * _129;
    float _514 = floor(_512);
    int _516 = int(_486) + int(_506);
    bool _518 = _488 >= _463;
    bool _520 = isnan(_488);
    bool _522 = _518 || _520;
    bool _524 = isnan(_463);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    int _530 = _449 * _516;
    int _532 = _530 + _471;
    float _534 = trunc(_528);
    int _536 = int(_534);
    bool _538 = uint(_532) >= uint(_425);
    float _540 = -_514;
    float _542 = _512 + _540;
    int _544 = _425 + (-1);
    bool _546 = !_538;
    int _548 = _546 ? 0 : (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _560 = _558 != 0;
    int _562 = ~_516;
    int _564 = _562 + _548;
    int _566 = _564 + 1;
    bool _568 = _425 == 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _572 = _570 != 0;
    int _574 = _425 * _566;
    int _576 = _574 + _471;
    float _578 = _463 * _107;
    int _580 = ~_536;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _542 * _463;
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = _578 * _441;
    bool _600 = !_568;
    int _602 = _600 ? _576 : (-1);
    bool _604 = !_556;
    int _606 = _604 ? 0 : 1;
    float _608 = trunc(_586);
    int _610 = int(_608);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _614 = _612 != 0;
    int _616 = _602 * _584;
    int _618 = abs(_606);
    float _620 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _622 = !_552;
    int _624 = _622 ? 0 : 1;
    int _626 = _536 * _544;
    int _628 = _626 + _616;
    float _630 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = trunc(_598);
    int _634 = int(_632);
    int _636 = abs(_624);
    int _638 = _628 * _618;
    float _640 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _642 = in.m_37.y;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _650 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _620);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _640);
    int _658 = abs(_646);
    float _660 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _648);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _664 = _662 != 0;
    float _666 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    bool _668 = !_560;
    int _670 = _668 ? 0 : 1;
    int _672 = _610 * _658;
    int _674 = _672 + _471;
    bool _676 = !_664;
    int _678 = _676 ? 0 : 1;
    int _680 = _634 * _636;
    int _682 = _680 + _638;
    float _684 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = abs(_670);
    float _688 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _656);
    int _690 = abs(_678);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _694 = _654 * _107;
    int _696 = _674 * _686;
    int _698 = _696 + _682;
    float _700 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = exp2(_694);
    int _704 = _610 * _690;
    int _706 = _704 + _698;
    float _708 = _642 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _712 = -_692;
    float _714 = fma(_684, 2.0, _712);
    bool _716 = _129 > 0.5;
    float _718 = _660 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = float(uint(_706));
    float _722 = fma(_708, -2.0, _710);
    float _724 = -_107;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _714);
    float _728 = -_189;
    int _730 = _716 ? as_type<int>(_728) : as_type<int>(_189);
    float _732 = as_type<float>(_467) * _720;
    float _734 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _762 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _760);
    float _764 = _596 ? _748 : 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _766;
    float _770 = 1.0 / _752;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _778 = _642 > 0.5;
    bool _780 = _465 >= 0.0;
    bool _782 = isnan(_465);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[78].w, _776);
    float _792 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    float _794 = -_197;
    int _796 = _778 ? as_type<int>(_794) : as_type<int>(_197);
    float _798 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    int _800 = _453 * int(_758);
    int _802 = _800 + _706;
    float _804 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    float _806 = in.m_37.z;
    bool _808 = _465 > 0.0;
    float _810 = 1.0 / _774;
    float _812 = float(uint(_802));
    if (_744)
    {
        float _814 = _764 * _770;
        _109 = _814;
    }
    float _816 = _109;
    float _818 = -_804;
    float _820 = _818 + 1.0;
    float _822 = as_type<float>(_467) * _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _824;
    float _828 = 1.0 / _768;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _840 = _838 != 0;
    int _842 = ~_425;
    int _844 = _842 + 1;
    float _846 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _848 = trunc(_822);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _856 = !_840;
    float _858 = _856 ? _189 : as_type<float>(_730);
    float _860 = _417 * _810;
    bool _862 = !_834;
    float _864 = _862 ? _197 : as_type<float>(_796);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _878 = _876 != 0;
    float _880 = 1.0 / _826;
    float _882 = _642 * 2.0;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _129 + _642;
    float _888 = _421 * _828;
    out.m_44.x = _884;
    out.m_44.y = _846;
    out.m_44.z = _854;
    int _890 = int(_758) + int(_852);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _894 = _405 + _892;
    float _896 = floor(_882);
    float _898 = _886 + (-1.0);
    float _900 = float(uint(_674));
    float _902 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _904 = _894 * _880;
    float _906 = _806 * 2.0;
    int _908 = _844 * _890;
    int _910 = _908 + _706;
    float _912 = _129 + _806;
    int _914 = _788 ? 0 : 1;
    float _916 = floor(_906);
    float _918 = _912 + (-1.0);
    bool _920 = uint(_910) >= uint(_425);
    float _922 = _642 + _806;
    float _924 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _928 = !_920;
    int _930 = _928 ? 0 : (-1);
    float _932 = _922 + (-1.0);
    int _934 = ~_914;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _924 * _129;
    int _942 = ~_890;
    int _944 = _942 + _930;
    int _946 = _944 + 1;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _948;
    int _952 = _938;
    if (!_808)
    {
        int _954 = ~_914;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    float _960 = trunc(_940);
    int _962 = int(_960);
    bool _964 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _966 = isnan(_405);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    int _976 = _425 * _946;
    int _978 = _976 + _706;
    bool _980 = _916 >= 0.0;
    bool _982 = isnan(_916);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _994 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _996 = isnan(_405);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1008 = _988 ? 0 : 1;
    float _1010 = _642 + (-0.5);
    bool _1012 = _916 > 0.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1014;
    bool _1018 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1020 = isnan(_405);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1034 = _896 >= 0.0;
    bool _1036 = isnan(_896);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = -_974;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1028;
    float _1050 = _1048 + 1.0;
    int _1052 = _1042 ? 0 : 1;
    int _1054 = _962 << 4;
    int _1056 = _1054 + 1712;
    float _1058 = _1004 * _1050;
    float _1060 = as_type<float>(_467) * _900;
    float _1062 = -_1004;
    float _1064 = _1062 + 1.0;
    float _1066 = _858 + 0.5;
    bool _1068 = _896 > 0.0;
    float _1070 = fma(_1016, _888, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1072 = _974 * _1064;
    float _1074 = trunc(_1060);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = fma(_992, _860, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1082 = fma(_1032, _860, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[80].x, _726);
    float _1086 = fma(_950, _888, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = _437 * _1046;
    uint _1090 = uint(int(uint(_1056) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[int(_1100)][_1102];
    bool _1106 = !_568;
    int _1108 = _1106 ? _978 : (-1);
    float _1110 = _864 + (-0.5);
    float _1112 = _1070 * _1088;
    float _1114 = _1086 * _1088;
    int _1116 = _1108 >> 31;
    float _1118 = -_1110;
    float _1120 = -_792;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1120);
    float _1124 = -_437;
    float _1126 = _1124 + 1.0;
    int _1128 = _1056 + 8;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = _1116 & 3;
    float _1140 = fma(_864, _820, _1122);
    int _1142 = ~_1052;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1112);
    int _1150 = _1108 + _1138;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1114);
    int _1154 = _1146;
    float _1156 = _1010;
    if (!_1068)
    {
        int _1158 = ~_1052;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    int _1164 = _457 * int(_1078);
    int _1166 = _1164 + _674;
    int _1168 = _1150 >> 2;
    float _1170 = fma(_1082, _1072, _1152);
    bool _1172 = !_874;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1166));
    int _1178 = _1168 << 4;
    int _1180 = _1178 + 368;
    int _1182 = ~_1008;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_467) * _1176;
    float _1190 = -_798;
    float _1192 = _1190 + 1.0;
    int _1194 = _1186;
    if (!_1012)
    {
        int _1196 = ~_1008;
        int _1198 = _1196 + 1;
        _1194 = _1198;
    }
    int _1200 = _1194;
    uint _1202 = uint(int(uint(_1180) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    bool _1218 = !_870;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -_1192;
    float _1224 = fma(_858, _1222, _1084);
    int _1226 = abs(_1174);
    float _1228 = trunc(_1188);
    float _1230 = precise::max(_1228, 0.0);
    uint _1232 = uint(_1230);
    int _1234 = _1108 & 3;
    bool _1236 = _1234 != 0;
    int _1238 = _1108 & 3;
    bool _1240 = _1238 != 0;
    out.m_46.x = _1224;
    out.m_46.y = _1140;
    bool _1242 = uint(_1234) > 1u;
    float _1244 = float(_958);
    float _1246 = float(_1226);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1250 = abs(_1220);
    float _1252 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1256 = _1180 + 8;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[int(_1268)][_1270];
    int _1274 = _1240 ? 0 : 1;
    float _1276 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1246 * _1244;
    int _1282 = ~_1274;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1290 = _1286;
    if (!_1242)
    {
        int _1292 = ~_1274;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _718 + _1298;
    bool _1302 = _1234 != 3;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1306 = abs(_1296);
    int _1308 = ~_425;
    int _1310 = _1308 + 1;
    out.m_48.x = _1276;
    out.m_48.y = _1278;
    out.m_48.z = _1304;
    out.m_48.w = _1248;
    int _1312 = int(_1078) + int(_1232);
    float _1314 = float(_1250);
    float _1316 = float(_1200);
    int _1318 = _1310 * _1312;
    int _1320 = _1318 + _674;
    float _1322 = _1314 * _1316;
    bool _1324 = uint(_1320) >= uint(_425);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _700 + _1326;
    bool _1330 = !_1236;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = uint(_1234) >= 2u;
    int _1336 = abs(_1332);
    int _1338 = _1334 ? 0 : 1;
    int _1340 = ~_1306;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1336;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = _1344 * as_type<int>(_1216);
    bool _1360 = _1234 != 3;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1364 = _1356;
    if (_1302)
    {
        int _1366 = ~_1338;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    int _1372 = _1350 * as_type<int>(_1208);
    int _1374 = _1372 + _1358;
    bool _1376 = !_1360;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = in.m_50.x;
    float _1382 = in.m_50.y;
    float _1384 = in.m_50.z;
    int _1386 = abs(_1370);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _734 + _1388;
    int _1392 = abs(_1378);
    float _1394 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1362);
    bool _1396 = !_1324;
    int _1398 = _1396 ? 0 : (-1);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1394);
    bool _1402 = !_614;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = ~_1312;
    int _1408 = _1406 + _1398;
    int _1410 = _1408 + 1;
    int _1412 = ~_1386;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = abs(_1404);
    int _1420 = _425 * _1410;
    int _1422 = _1420 + _674;
    float _1424 = _1328 * _1328;
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _1416 * as_type<int>(_1264);
    int _1434 = _1432 + _1374;
    float _1436 = _1280 * (-2.0);
    bool _1438 = _1400 >= 0.0;
    float _1440 = fma(_1300, _1300, _1424);
    int _1442 = _1430 * as_type<int>(_1272);
    int _1444 = _1442 + _1434;
    float _1446 = fma(_1436, _1382, _1382);
    float _1448 = fma(_1006, _1436, _1006);
    int _1450 = ~_1418;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1390, _1390, _1440);
    bool _1458 = !_568;
    int _1460 = _1458 ? _1422 : (-1);
    float _1462 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1446);
    bool _1464 = !_878;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1444 * _1454;
    float _1470 = _1322 * (-2.0);
    float _1472 = rsqrt(_1456);
    float _1474 = _1384;
    if (_1438)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1476 = _1156;
    int _1478 = _1460 * _1418;
    int _1480 = _1478 + _1468;
    int _1482 = abs(_1466);
    int _1484 = as_type<int>(_1476);
    if (_1438)
    {
        out.m_33.x = 0.0;
    }
    if (_1438)
    {
        float _1486 = _1476 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = float(_1480);
    float _1492 = fma(_902, _1470, _902);
    float _1494 = fma(_1470, _1380, _1380);
    float _1496 = fma(_1448, _816, _1462);
    if (_1438)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4201 = as_type<float>(_1488);
        out.gl_Position.z = _4201;
    }
    float _1498 = _129 + (-0.5);
    float _1500 = float(_1482);
    out.m_52.x = _1490;
    float _1502 = float(_1162);
    float _1504 = _1328 * _1472;
    float _1506 = _1300 * _1472;
    float _1508 = _1390 * _1472;
    if (_1438)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1510 = -_1504;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1328);
    float _1514 = -_1504;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _1518 = -_1506;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1522 = -_1506;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1526 = _1512 * _1512;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1516 + _1528;
    float _1532 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1494);
    float _1534 = _1496 * 0.15915493667125701904296875;
    float _1536 = fma(_1520, _1520, _1526);
    float _1538 = -_1508;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1542 = -_1508;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _734);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1524 + _1546;
    float _1550 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1552 = _1500 * _1502;
    float _1554 = in.m_42.x;
    float _1556 = in.m_42.y;
    float _1558 = fma(_1540, _1540, _1536);
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1544 + _1560;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1550);
    float _1566 = _1552 * (-2.0);
    float _1568 = fma(_1492, _816, _1532);
    float _1570 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1564);
    float _1572 = fma(_926, _1566, _926);
    float _1574 = fma(_1566, _1384, _1384);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1576;
    float _1580 = _806 + (-0.5);
    bool _1582 = _1570 >= 0.0;
    float _1584 = _1568 * 0.15915493667125701904296875;
    float _1586 = fma(_1578, _904, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1588 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1574);
    float _1590 = fma(_1080, _1072, _1148);
    float _1592 = fma(_1586, _1058, _1170);
    float _1594 = fma(_1572, _816, _1588);
    float _1596 = _1534 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1600;
    float _1604 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1592);
    float _1606 = _1594 * 0.15915493667125701904296875;
    if (_1582)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1608 = _1474;
    float _1610 = _1604 * _1556;
    float _1612 = fma(_1602, _904, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1614 = _1534 * 6.283185482025146484375;
    float _1616 = cos(_1614);
    int _1618 = as_type<int>(_1608);
    if (_1582)
    {
        float _1620 = _1608 * 5.0;
        _1618 = as_type<int>(_1620);
    }
    int _1622 = _1618;
    if (_1582)
    {
        out.m_33.x = 0.0;
    }
    float _1624 = fma(_1612, _1058, _1590);
    if (_1582)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4432 = as_type<float>(_1622);
        out.gl_Position.z = _4432;
    }
    float _1626 = sqrt(_1558);
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    float _1632 = _1584 * 6.283185482025146484375;
    float _1634 = cos(_1632);
    float _1636 = _1606 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    if (_1582)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1640 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1624);
    float _1642 = _373 * _1610;
    float _1644 = _1606 * 6.283185482025146484375;
    float _1646 = cos(_1644);
    float _1648 = _1472 * _1626;
    float _1650 = _1640 * _1554;
    float _1652 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1658 = _373 * _1650;
    float _1660 = _1648 * _1652;
    float _1662 = _1634 * _1598;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1666 = _1654 * _1660;
    float _1668 = _1630 * _1598;
    float _1670 = _1634 * _1616;
    float _1672 = _1648 * _1664;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1676 = _1674 * 0.5;
    float _1678 = _1646 * _1666;
    float _1680 = _1598 * _1646;
    float _1682 = _1656 * _1672;
    float _1684 = fma(_1638, _1670, _1668);
    float _1686 = _1634 * _1678;
    float _1688 = _1616 * _1646;
    float _1690 = _1630 * _1616;
    float _1692 = -_1666;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1684, _1682, _1686);
    float _1698 = _1630 * _1678;
    float _1700 = -_1690;
    float _1702 = fma(_1638, _1662, _1700);
    float _1704 = -_1662;
    float _1706 = fma(_1638, _1690, _1704);
    float _1708 = fma(_1688, _1682, _1694);
    float _1710 = fma(_1638, _1668, _1670);
    float _1712 = fma(_1702, _1676, _1696);
    float _1714 = fma(_1706, _1682, _1698);
    float _1716 = fma(_1680, _1676, _1708);
    bool _1718 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1720 = isnan(0.5);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1726 = _1722 || _1724;
    float _1728 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1730 = fma(_1710, _1676, _1714);
    float _1732 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1728);
    bool _1738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1740 = isnan(0.5);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1746 = _1742 || _1744;
    float _1748 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1750 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1734);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1764 = _734 + _1758;
    float _1766 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1760);
    float _1768 = _718 + _1762;
    float _1770 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1774 = _1764 + _1772;
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1780 = _1768 + _1778;
    float _1782 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1770);
    float _1784 = _1774 * _1774;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = 1.0 / _1786;
    float _1794 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = _700 + _1794;
    float _1800 = _1796 + _1786;
    float _1802 = sqrt(_1790);
    bool _1804 = _1802 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1734;
    float _1808 = _1796;
    float _1810 = _1770;
    if (!_1804)
    {
        _1806 = _1768;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    if (!_1804)
    {
        _1808 = _1764;
    }
    float _1816 = _1808;
    float _1818 = _1816;
    if (!_1804)
    {
        _1810 = _1798;
    }
    float _1820 = _1810;
    bool _1822 = !_1804;
    float _1824 = _1820;
    if (!_1822)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1830 = _1802 + _1828;
        float _1832 = rsqrt(_1790);
        float _1834 = _1830 * _1826;
        float _1836 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1838 = _1834 * 0.15915493667125701904296875;
        float _1840 = _1838 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = _1832 * _1848;
        float _1852 = _1846 + (-1.0);
        float _1854 = fma(_1780, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1774, _1850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1858 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = fma(_1798, _1846, _1858);
        _1814 = _1854;
        _1824 = _1860;
        _1818 = _1856;
    }
    float _1862 = _1814;
    float _1864 = _1824;
    float _1866 = _1818;
    float _1868 = -_1506;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1862);
    float _1872 = -_1504;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1864);
    float _1876 = -_1508;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _1880 = _1800 * _1792;
    float _1882 = _1880 * 0.5;
    float _1884 = _1874;
    float _1886 = _1870;
    float _1888 = _1878;
    if (!_1726)
    {
        float _1890 = _1530 * _1530;
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1894 = -_718;
        float _1896 = _1894 + _1862;
        float _1898 = -_734;
        float _1900 = _1898 + _1866;
        float _1902 = fma(_1548, _1548, _1890);
        float _1904 = fma(_1562, _1562, _1902);
        float _1906 = 1.0 / _1648;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1892;
        float _1914 = _1912 * _1906;
        float _1916 = -_700;
        float _1918 = _1916 + _1864;
        float _1920 = fma(_1896, _1914, _1524);
        float _1922 = fma(_1918, _1914, _1516);
        float _1924 = fma(_1900, _1914, _1544);
        _1884 = _1922;
        _1886 = _1920;
        _1888 = _1924;
    }
    float _1926 = _1884;
    float _1928 = _1886;
    float _1930 = _1888;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1932);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1936);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1948 = _1926;
    if (_1746)
    {
        _1948 = 1.0;
    }
    float _1950 = _1948;
    float _1952 = _1950;
    if (!_1746)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1956 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1954);
        float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1962 = 1.0 / _1956;
        float _1964 = 1.0 / _1960;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1970 = fma(_1962, _1966, _1968);
        float _1972 = _1970 * _1964;
        float _1974 = precise::clamp(_1972, 0.0, 1.0);
        float _1976 = -_1974;
        float _1978 = _1976 + 1.0;
        _1952 = _1978;
    }
    float _1980 = _1952;
    float _1982 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1984 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1986 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1990 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1992 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1994 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1946);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = _373 * _1988;
    float _2006 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1998);
    float _2008 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2012 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2006);
    float _2018 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2010);
    float _2022 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2024 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    bool _2028 = _1980 > 0.0;
    bool _2030 = isnan(_1980);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2042 = _2024 + _2026;
    float _2044 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float _2046 = _2004 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = _2042 * 0.5;
    out.m_33.x = _2046;
    out.gl_Position.x = _2040;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _2026;
    out.m_54.z = _2048;
    out.m_54.w = _2026;
    if (_2036)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2050 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2050;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

