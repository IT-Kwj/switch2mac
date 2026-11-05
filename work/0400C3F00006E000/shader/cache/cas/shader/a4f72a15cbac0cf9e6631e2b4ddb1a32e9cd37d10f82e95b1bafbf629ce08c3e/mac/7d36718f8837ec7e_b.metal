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
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
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
        float _2161 = as_type<float>(_87);
        out.gl_Position.z = _2161;
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
        float _2230 = as_type<float>(_125);
        out.gl_Position.z = _2230;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.x;
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>(_133) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_133) & 2;
    bool _161 = _159 != 0;
    float _163 = _133;
    if (!_145)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _151 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _169;
    if (!_145)
    {
        float _183 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_161;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _171 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_153;
    float _197 = _149 + _195;
    float _199 = _153;
    float _201 = _185;
    if (!_145)
    {
        _199 = _135;
    }
    float _203 = _199;
    bool _205 = _197 < 0.5;
    float _207 = float(_205);
    float _209 = fma(_193, 0.5, 0.5);
    bool _211 = !_145;
    float _213 = _203;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _135 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _135);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _243;
    }
    float _245 = _201;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _135 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _213 = _267;
    }
    float _269 = _213;
    float _271 = -_197;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = -_207;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = in.m_35.x;
    float _281 = in.m_35.y;
    float _283 = in.m_35.z;
    float _285 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _287 = !_175;
    int _289 = _287 ? 0 : 1;
    float _291 = -_209;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_42.w;
    float _305 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = in.m_30.x;
    float _313 = in.m_30.y;
    float _315 = in.m_30.z;
    float _317 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _319 = !_297;
    int _321 = _319 ? 0 : 1;
    float _323 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    int _331 = abs(_289);
    int _333 = abs(_321);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _325);
    bool _337 = !_301;
    int _339 = _337 ? 0 : 1;
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    float _347 = fma(_269, _279, _335);
    int _349 = abs(_339);
    float _351 = fma(_269, _281, _341);
    float _353 = float(_333);
    float _355 = fma(_269, _283, _345);
    float _357 = float(_331);
    float _359 = abs(_273);
    float _361 = _353 * _359;
    float _363 = fma(_347, _303, _311);
    float _365 = fma(_351, _303, _313);
    float _367 = float(_349);
    float _369 = fma(_357, _293, _361);
    float _371 = fma(_355, _303, _315);
    float _373 = abs(_277);
    float _375 = fma(_367, _373, _369);
    bool _377 = !_343;
    float _395;
    float _397;
    if (!_377)
    {
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _381 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _383 = float(_71);
        float _385 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _387 = _385 * _379;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = _383;
        _399 = true;
    }
    else
    {
        float _401 = float(_71);
        float _403 = 1.0 / _401;
        float _405 = _105 * _403;
        _395 = _405;
        _397 = _401;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_37.y;
    bool _417 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_407);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _431 = int(_429);
    float _433 = -_427;
    float _435 = _433 + 1.0;
    float _437 = float(_413);
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    float _443 = float(uint(_431));
    float _445 = 1.0 / _437;
    int _447 = ~_431;
    int _449 = _447 + 1;
    float _451 = _415 * 2.0;
    int _453 = ~_431;
    int _455 = _453 + 1;
    int _457 = ~_431;
    int _459 = _457 + 1;
    float _461 = 1.0 / _443;
    float _463 = _441 * _105;
    float _465 = _445 * _105;
    float _467 = exp2(_463);
    int _469 = as_type<int>(_461) + (-2);
    float _471 = trunc(_465);
    int _473 = int(_471);
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = float(uint(_473));
    float _481 = as_type<float>(_469) * _479;
    float _483 = trunc(_481);
    float _485 = precise::max(_483, 0.0);
    uint _488 = uint(_485);
    int _490 = _449 * int(_488);
    int _492 = _490 + _473;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_469) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = float(_473);
    bool _504 = !_500;
    float _506 = _504 ? 7.345489978790283203125 : 1.0;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = float(_431);
    float _516 = _506 * _127;
    bool _518 = _502 >= _514;
    bool _520 = isnan(_502);
    bool _522 = _518 || _520;
    bool _524 = isnan(_514);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = floor(_516);
    int _532 = int(_488) + int(_512);
    float _534 = trunc(_528);
    int _536 = int(_534);
    int _538 = _455 * _532;
    int _540 = _538 + _473;
    float _542 = -_530;
    float _544 = _516 + _542;
    float _546 = 1.0 / _409;
    bool _548 = uint(_540) >= uint(_431);
    float _550 = _544 * _514;
    float _552 = _514 * _105;
    bool _554 = !_548;
    int _556 = _554 ? 0 : (-1);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    int _570 = ~_532;
    int _572 = _570 + _556;
    int _574 = _572 + 1;
    float _576 = trunc(_550);
    int _578 = int(_576);
    bool _580 = _431 == 0;
    float _582 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _584 = ~_536;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _431 * _574;
    int _592 = _590 + _473;
    bool _594 = !_564;
    int _596 = _594 ? 0 : 1;
    float _598 = _552 * _546;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _602 = _600 != 0;
    float _604 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    bool _606 = !_580;
    int _608 = _606 ? _592 : (-1);
    float _610 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _612 = _431 + (-1);
    float _614 = trunc(_598);
    int _616 = int(_614);
    int _618 = abs(_596);
    int _620 = _608 * _588;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _604);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _630 = _628 != 0;
    int _632 = _536 * _612;
    int _634 = _632 + _620;
    bool _636 = !_560;
    int _638 = _636 ? 0 : 1;
    int _640 = abs(_624);
    int _642 = _634 * _618;
    int _644 = abs(_638);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _648 = _646 != 0;
    int _650 = _578 * _640;
    int _652 = _650 + _473;
    float _654 = _127 * 2.0;
    int _656 = _616 * _644;
    int _658 = _656 + _642;
    bool _660 = !_568;
    int _662 = _660 ? 0 : 1;
    int _664 = abs(_662);
    float _666 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = floor(_654);
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _678 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _680 = !_630;
    int _682 = _680 ? 0 : 1;
    int _684 = _652 * _664;
    int _686 = _684 + _658;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    int _692 = abs(_682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _700 = _698 != 0;
    float _702 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _704 = _578 * _692;
    int _706 = _704 + _686;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _710 = _127 > 0.5;
    float _712 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _714 = float(uint(_706));
    float _716 = -_708;
    float _718 = fma(_702, 2.0, _716);
    bool _720 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _722 = isnan(1.0);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _732 = 1.0 + _730;
    float _734 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _736 = as_type<float>(_469) * _714;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _740 = 1.0 / _732;
    float _742 = _712 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_610, -2.0, _738);
    float _746 = -_179;
    int _748 = _710 ? as_type<int>(_746) : as_type<int>(_179);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _415 > 0.5;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _772 = ~_431;
    int _774 = _772 + 1;
    float _776 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -_189;
    int _780 = _768 ? as_type<int>(_778) : as_type<int>(_189);
    float _782 = _760 ? _477 : 0.0;
    float _784 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _770);
    bool _786 = _670 > 0.0;
    float _788 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _750);
    bool _790 = _670 >= 0.0;
    bool _792 = isnan(_670);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = -_105;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[76].x, _718);
    float _804 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _784);
    float _806 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _810 = _774 * int(_766);
    int _812 = _810 + _706;
    float _814 = 1.0 / _696;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _407 + _816;
    float _820 = _808 * _127;
    float _822 = float(uint(_812));
    float _824 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _744);
    if (_728)
    {
        float _826 = _782 * _740;
        _109 = _826;
    }
    float _828 = _109;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _830;
    float _834 = in.m_37.z;
    float _836 = floor(_451);
    float _838 = as_type<float>(_469) * _822;
    float _840 = _127 + _415;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _844 = _407 + _842;
    bool _846 = !_674;
    float _848 = _846 ? _179 : as_type<float>(_748);
    float _850 = -_806;
    float _852 = _850 + 1.0;
    float _854 = _840 + (-1.0);
    bool _856 = !_700;
    float _858 = _856 ? _189 : as_type<float>(_780);
    float _860 = trunc(_820);
    int _862 = int(_860);
    float _864 = _844 * _814;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _880 = ~_431;
    int _882 = _880 + 1;
    float _884 = 1.0 / _690;
    float _886 = _127 + _834;
    float _888 = trunc(_838);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    int _894 = _862 << 4;
    int _896 = _894 + 1712;
    float _898 = _834 * 2.0;
    float _900 = _127 + (-0.5);
    int _902 = _896 + 8;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / _832;
    int _914 = _798 ? 0 : 1;
    float _916 = _818 * _884;
    bool _918 = _836 >= 0.0;
    bool _920 = isnan(_836);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _930 = _407 + _928;
    int _932 = ~_914;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _926 ? 0 : 1;
    float _940 = floor(_898);
    bool _942 = _836 > 0.0;
    float _944 = _886 + (-1.0);
    int _946 = int(_766) + int(_892);
    uint _948 = uint(int(uint(_896) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[int(_958)][_960];
    int _964 = _936;
    if (!_786)
    {
        int _966 = ~_914;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    int _972 = ~_938;
    int _974 = _972 + 1;
    int _976 = _974 + 1;
    float _978 = _930 * _912;
    int _980 = _882 * _946;
    int _982 = _980 + _706;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _992 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = _415 + _834;
    bool _996 = uint(_982) >= uint(_431);
    float _998 = fma(_986, _916, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1000 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1002 = isnan(_407);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 + (-1.0);
    int _1014 = _976;
    if (!_942)
    {
        int _1016 = ~_938;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    bool _1022 = !_996;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1028 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1030 = isnan(_407);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    bool _1040 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1042 = isnan(_407);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    bool _1052 = _940 > 0.0;
    float _1054 = -_1038;
    float _1056 = _1054 + 1.0;
    bool _1058 = _940 >= 0.0;
    bool _1060 = isnan(_940);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1068;
    int _1072 = ~_946;
    int _1074 = _1072 + _1024;
    int _1076 = _1074 + 1;
    float _1078 = _1010 * _1056;
    float _1080 = -_1010;
    float _1082 = _1080 + 1.0;
    float _1084 = float(uint(_652));
    float _1086 = fma(_1070, _916, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = fma(_990, _864, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1090 = _427 * _1082;
    float _1092 = _1050 * _435;
    int _1094 = _431 * _1076;
    int _1096 = _1094 + _706;
    float _1098 = _858 + (-0.5);
    float _1100 = as_type<float>(_469) * _1084;
    float _1102 = _848 + 0.5;
    float _1104 = -_1050;
    float _1106 = _1104 + 1.0;
    float _1108 = _998 * _1092;
    float _1110 = _1086 * _1092;
    float _1112 = -_804;
    float _1114 = _1112 + 1.0;
    float _1116 = -_1098;
    float _1118 = -_824;
    float _1120 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1118);
    bool _1122 = !_580;
    int _1124 = _1122 ? _1096 : (-1);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _802);
    float _1128 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1108);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1110);
    float _1132 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1134 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1136 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = trunc(_1100);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1066 ? 0 : 1;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1148 = _1124 >> 31;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1156 = ~_1144;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    float _1162 = fma(_858, _1114, _1120);
    int _1164 = _1160;
    float _1166 = _1078;
    if (!_1052)
    {
        int _1168 = ~_1144;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -_852;
    float _1176 = fma(_848, _1174, _1126);
    int _1178 = _1148 & 3;
    out.m_44.x = _1150;
    out.m_44.y = _1152;
    out.m_44.z = _1154;
    out.m_44.w = _1146;
    int _1180 = ~_431;
    int _1182 = _1180 + 1;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1188 = !_872;
    int _1190 = _1188 ? 0 : 1;
    out.m_46.x = _1176;
    out.m_46.y = _1162;
    bool _1192 = !_876;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_1186, _864, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1198 = abs(_1190);
    float _1200 = float(_1020);
    int _1202 = _1124 & 3;
    bool _1204 = _1202 != 0;
    int _1206 = _1124 + _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _742 + _1208;
    int _1212 = _1206 >> 2;
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1194);
    int _1218 = _1182 * int(_1142);
    int _1220 = _1218 + _652;
    int _1222 = _1212 << 4;
    int _1224 = _1222 + 368;
    float _1226 = float(uint(_1220));
    uint _1228 = uint(int(uint(_1224) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = _1124 & 3;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _776 + _1248;
    float _1252 = float(_970);
    float _1254 = as_type<float>(_469) * _1226;
    bool _1256 = !_868;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1262 = uint(_1244) > 1u;
    float _1264 = trunc(_1254);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = abs(_1258);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1260 + _1272;
    int _1276 = _1224 + 8;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[int(_1288)][_1290];
    float _1294 = float(_1198);
    float _1296 = float(_1216);
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1300 = float(_1270);
    float _1302 = _1294 * _1252;
    int _1304 = _1204 ? 0 : 1;
    float _1306 = _1296 * _1200;
    float _1308 = float(_1172);
    float _1310 = in.m_48.x;
    float _1312 = in.m_48.y;
    float _1314 = in.m_48.z;
    int _1316 = ~_1304;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1298);
    int _1324 = _1320;
    if (!_1262)
    {
        int _1326 = ~_1304;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1300 * _1308;
    bool _1334 = _1244 != 3;
    bool _1336 = uint(_1244) >= 2u;
    bool _1338 = _1322 >= 0.0;
    float _1340 = _1302 * (-2.0);
    int _1342 = abs(_1330);
    int _1344 = _1336 ? 0 : 1;
    bool _1346 = !_1246;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = ~_1344;
    int _1352 = _1350 + 1;
    int _1354 = _1352 + 1;
    bool _1356 = _1244 != 3;
    float _1358 = _1210 * _1210;
    int _1360 = _1354;
    if (_1334)
    {
        int _1362 = ~_1344;
        int _1364 = _1362 + 1;
        _1360 = _1364;
    }
    int _1366 = _1360;
    float _1368 = fma(_1340, _1312, _1312);
    int _1370 = ~_1342;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = fma(_1274, _1274, _1358);
    int _1378 = abs(_1348);
    float _1380 = _1314;
    if (_1338)
    {
        out.m_33.x = 0.0;
    }
    bool _1382 = !_1356;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1242);
    int _1388 = abs(_1366);
    float _1390 = fma(_1250, _1250, _1376);
    int _1392 = int(_1142) + int(_1268);
    float _1394 = fma(_1026, _1340, _1026);
    bool _1396 = !_648;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1384);
    int _1402 = ~_1378;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1406 * as_type<int>(_1234);
    int _1410 = _1408 + _1386;
    int _1412 = abs(_1398);
    int _1414 = ~_1388;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _459 * _1392;
    int _1422 = _1420 + _652;
    int _1424 = _1418 * as_type<int>(_1284);
    int _1426 = _1424 + _1410;
    bool _1428 = uint(_1422) >= uint(_431);
    float _1430 = rsqrt(_1390);
    int _1432 = ~_1400;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1332 * (-2.0);
    bool _1440 = !_1428;
    int _1442 = _1440 ? 0 : (-1);
    int _1444 = ~_1412;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1436 * as_type<int>(_1292);
    int _1452 = _1450 + _1426;
    int _1454 = ~_1392;
    int _1456 = _1454 + _1442;
    int _1458 = _1456 + 1;
    float _1460 = fma(_878, _1438, _878);
    float _1462 = fma(_1438, _1310, _1310);
    int _1464 = _1452 * _1448;
    float _1466 = _415 + (-0.5);
    int _1468 = _431 * _1458;
    int _1470 = _1468 + _652;
    float _1472 = _1306 * (-2.0);
    float _1474 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1476 = _1210 * _1430;
    float _1478 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1480 = _1274 * _1430;
    bool _1482 = !_580;
    int _1484 = _1482 ? _1470 : (-1);
    float _1486 = -_1476;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1490 = fma(_1394, _828, _1474);
    float _1492 = -_1480;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1496 = fma(_1472, _1314, _1314);
    float _1498 = _1488 * _1488;
    int _1500 = _1484 * _1412;
    int _1502 = _1500 + _1464;
    float _1504 = fma(_1460, _828, _1478);
    if (_1338)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1380;
    float _1508 = fma(_1494, _1494, _1498);
    float _1510 = _1490 * 0.15915493667125701904296875;
    float _1512 = float(_1502);
    int _1514 = as_type<int>(_1506);
    if (_1338)
    {
        float _1516 = _1506 * 5.0;
        _1514 = as_type<int>(_1516);
    }
    int _1518 = _1514;
    float _1520 = _1510 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = fma(_992, _1472, _992);
    float _1526 = _1250 * _1430;
    out.m_50.x = _1512;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4291 = as_type<float>(_1518);
        out.gl_Position.z = _4291;
    }
    if (_1338)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1528 = -_1476;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _742);
    float _1532 = -_1480;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1536 = -_1526;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1540 = -_1526;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1530 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1534 + _1548;
    float _1552 = fma(_1538, _1538, _1508);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1542 + _1554;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1560 = _1504 * 0.15915493667125701904296875;
    float _1562 = in.m_42.x;
    float _1564 = in.m_42.y;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1558);
    float _1568 = _834 + (-0.5);
    float _1570 = fma(_1196, _1090, _1130);
    float _1572 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1566);
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1496);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1580;
    float _1584 = _1510 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    bool _1588 = _1572 >= 0.0;
    float _1590 = fma(_1524, _828, _1574);
    float _1592 = fma(_1582, _978, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1594 = fma(_1578, _978, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1596 = fma(_1088, _1090, _1128);
    float _1598 = _1590 * 0.15915493667125701904296875;
    float _1600 = fma(_1592, _1078, _1570);
    float _1602 = sqrt(_1552);
    float _1604 = fma(_1594, _1078, _1596);
    float _1606 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1604);
    float _1608 = _1592;
    if (_1588)
    {
        _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1610 = _1608;
    float _1612 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1600);
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    int _1618 = as_type<int>(_1610);
    if (_1588)
    {
        out.m_33.x = 0.0;
    }
    float _1620 = _1606 * _1562;
    if (_1588)
    {
        float _1622 = _1610 * 5.0;
        _1618 = as_type<int>(_1622);
    }
    int _1624 = _1618;
    float _1626 = _1612 * _1564;
    float _1628 = _1560 * 6.283185482025146484375;
    float _1630 = cos(_1628);
    if (_1588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4478 = as_type<float>(_1624);
        out.gl_Position.z = _4478;
    }
    float _1632 = _1430 * _1602;
    float _1634 = _1598 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    float _1638 = _1616 * _1522;
    float _1640 = _1630 * _1586;
    if (_1588)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1642 = _1598 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1648 = fma(_1636, _1640, _1638);
    float _1650 = fma(_1636, _1638, _1640);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1654 = _1632 * _1646;
    float _1656 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1658 = _1630 * _1522;
    float _1660 = _1616 * _1586;
    float _1662 = _1652 * _1654;
    float _1664 = _1632 * _1656;
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1668 = -_1658;
    float _1670 = fma(_1636, _1660, _1668);
    float _1672 = -_1660;
    float _1674 = fma(_1636, _1658, _1672);
    float _1676 = -_1662;
    float _1678 = _1636 * _1676;
    float _1680 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1682 = _1522 * _1644;
    float _1684 = _1586 * _1644;
    float _1686 = _1644 * _1662;
    float _1688 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1690 = _1666 * _1664;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1680);
    float _1694 = _1630 * _1686;
    float _1696 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1688);
    float _1698 = _1616 * _1686;
    float _1700 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1692);
    float _1702 = fma(_1648, _1690, _1694);
    float _1704 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1696);
    float _1706 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1708 = _1706 * 0.5;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = fma(_1684, _1690, _1678);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1716 = fma(_1674, _1708, _1702);
    float _1718 = fma(_1670, _1690, _1698);
    float _1720 = fma(_1682, _1708, _1712);
    float _1722 = _1714 + _1710;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = fma(_1650, _1708, _1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1730 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1732 = isnan(0.5);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = 1.0 / _1710;
    float _1744 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1746 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1750 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1752 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1754 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1766 = _1762 || _1764;
    float _1768 = _776 + _1752;
    float _1770 = _1710;
    float _1772 = _1690;
    float _1774 = _1698;
    float _1776 = _1746;
    float _1778 = _1752;
    float _1780 = _1726;
    if (!_1738)
    {
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1166;
    float _1784 = _1260 + _1756;
    if (!_1738)
    {
        _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1786 = _1770;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1790 = _1768 + _1788;
    float _1792 = _1722 * _1742;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1798 = _1784 + _1796;
    float _1800 = _1742;
    if (!_1738)
    {
        float _1802 = -_1782;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1772 = _1804;
    }
    float _1806 = _1772;
    float _1808 = _1790 * _1790;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1812 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1810);
    float _1814 = _1808;
    float _1816 = _1812;
    if (!_1738)
    {
        float _1818 = -_1786;
        float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1800 = _1820;
    }
    float _1822 = _1800;
    if (!_1738)
    {
        float _1824 = 1.0 / _1806;
        _1774 = _1824;
    }
    float _1826 = _1774;
    float _1828 = fma(_1798, _1798, _1808);
    float _1830 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    if (_1738)
    {
        _1814 = 1.0;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1738)
    {
        _1776 = 1.0;
    }
    float _1836 = _1776;
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = sqrt(_1828);
    float _1842 = 1.0 / _1812;
    float _1844 = _1822;
    float _1846 = _1836;
    if (!_1738)
    {
        float _1848 = 1.0 / _1822;
        _1844 = _1848;
    }
    float _1850 = _1844;
    bool _1852 = _1840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1842;
    if (!_1738)
    {
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1858 = -_1782;
        float _1860 = fma(_1842, _1856, _1858);
        _1778 = _1860;
    }
    float _1862 = _1778;
    float _1864 = _1862;
    if (!_1738)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1868 = -_1786;
        float _1870 = fma(_1842, _1866, _1868);
        _1854 = _1870;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (!_1738)
    {
        float _1876 = _1862 * _1826;
        float _1878 = precise::clamp(_1876, 0.0, 1.0);
        _1834 = _1878;
    }
    float _1880 = _1834;
    if (!_1852)
    {
        _1816 = _1784;
    }
    float _1882 = _1816;
    float _1884 = _1882;
    if (!_1738)
    {
        float _1886 = _1872 * _1850;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        _1874 = _1888;
    }
    float _1890 = _1874;
    float _1892 = _742 + _1838;
    if (!_1852)
    {
        _1780 = _1768;
    }
    float _1894 = _1780;
    float _1896 = _1894;
    if (!_1738)
    {
        float _1898 = -_1890;
        float _1900 = _1898 + 1.0;
        _1846 = _1900;
    }
    float _1902 = _1846;
    bool _1904 = _1880 > 0.0;
    bool _1906 = isnan(_1880);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    if (!_1852)
    {
        _1864 = _1892;
    }
    float _1914 = _1864;
    float _1916 = _1880 * _1902;
    bool _1918 = _1902 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    bool _1924 = !_1852;
    float _1926 = _1914;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1840 + _1930;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = rsqrt(_1828);
        float _1938 = _1932 * _1928;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1952 = _1936 * _1950;
        float _1954 = _1948 + (-1.0);
        float _1956 = fma(_1798, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1790, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1960 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = fma(_1892, _1948, _1960);
        _1884 = _1956;
        _1926 = _1962;
        _1896 = _1958;
    }
    float _1964 = _1884;
    float _1966 = _1926;
    float _1968 = _1896;
    float _1970 = -_1480;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1974 = -_1476;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _1978 = -_1526;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1982 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1984 = _1976;
    float _1986 = _1972;
    float _1988 = _1980;
    if (!_1766)
    {
        float _1990 = _1546 * _1546;
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1994 = -_1260;
        float _1996 = _1994 + _1964;
        float _1998 = -_776;
        float _2000 = _1998 + _1968;
        float _2002 = fma(_1550, _1550, _1990);
        float _2004 = fma(_1556, _1556, _2002);
        float _2006 = 1.0 / _1632;
        float _2008 = sqrt(_2004);
        float _2010 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1992;
        float _2014 = -_742;
        float _2016 = _2014 + _1966;
        float _2018 = _2012 * _2006;
        float _2020 = fma(_1996, _2018, _1534);
        float _2022 = fma(_2016, _2018, _1530);
        float _2024 = fma(_2000, _2018, _1542);
        _1984 = _2022;
        _1986 = _2020;
        _1988 = _2024;
    }
    float _2026 = _1984;
    float _2028 = _1986;
    float _2030 = _1988;
    float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2036 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2038 = _375 * _1982;
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2042 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2034);
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2036);
    float _2048 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2050 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2052 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2044);
    float _2054 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2046);
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2058 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2064);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2078 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2080 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2082 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2082);
    float _2092 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2084);
    float _2094 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2088 + _2090;
    float _2098 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2092);
    float _2100 = _2038 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2102 = _2096 * 0.5;
    out.m_33.x = _2100;
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2098;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _2090;
    out.m_52.z = _2102;
    out.m_52.w = _2090;
    if (!_1922)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2104;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
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
        float _2161 = as_type<float>(_87);
        out.gl_Position.z = _2161;
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
        float _2230 = as_type<float>(_125);
        out.gl_Position.z = _2230;
    }
    if (_119)
    {
        return out;
    }
    float _127 = in.m_37.x;
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>(_133) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_133) & 2;
    bool _161 = _159 != 0;
    float _163 = _133;
    if (!_145)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _151 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _169;
    if (!_145)
    {
        float _183 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_161;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _171 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_153;
    float _197 = _149 + _195;
    float _199 = _153;
    float _201 = _185;
    if (!_145)
    {
        _199 = _135;
    }
    float _203 = _199;
    bool _205 = _197 < 0.5;
    float _207 = float(_205);
    float _209 = fma(_193, 0.5, 0.5);
    bool _211 = !_145;
    float _213 = _203;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _135 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _135);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _243;
    }
    float _245 = _201;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _135 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _213 = _267;
    }
    float _269 = _213;
    float _271 = -_197;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = -_207;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = in.m_35.x;
    float _281 = in.m_35.y;
    float _283 = in.m_35.z;
    float _285 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _287 = !_175;
    int _289 = _287 ? 0 : 1;
    float _291 = -_209;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_42.w;
    float _305 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = in.m_30.x;
    float _313 = in.m_30.y;
    float _315 = in.m_30.z;
    float _317 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _319 = !_297;
    int _321 = _319 ? 0 : 1;
    float _323 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    int _331 = abs(_289);
    int _333 = abs(_321);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _325);
    bool _337 = !_301;
    int _339 = _337 ? 0 : 1;
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    float _347 = fma(_269, _279, _335);
    int _349 = abs(_339);
    float _351 = fma(_269, _281, _341);
    float _353 = float(_333);
    float _355 = fma(_269, _283, _345);
    float _357 = float(_331);
    float _359 = abs(_273);
    float _361 = _353 * _359;
    float _363 = fma(_347, _303, _311);
    float _365 = fma(_351, _303, _313);
    float _367 = float(_349);
    float _369 = fma(_357, _293, _361);
    float _371 = fma(_355, _303, _315);
    float _373 = abs(_277);
    float _375 = fma(_367, _373, _369);
    bool _377 = !_343;
    float _395;
    float _397;
    if (!_377)
    {
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _381 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _383 = float(_71);
        float _385 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _387 = _385 * _379;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = _383;
        _399 = true;
    }
    else
    {
        float _401 = float(_71);
        float _403 = 1.0 / _401;
        float _405 = _105 * _403;
        _395 = _405;
        _397 = _401;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_37.y;
    bool _417 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_407);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _431 = int(_429);
    float _433 = -_427;
    float _435 = _433 + 1.0;
    float _437 = float(_413);
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    float _443 = float(uint(_431));
    float _445 = 1.0 / _437;
    int _447 = ~_431;
    int _449 = _447 + 1;
    float _451 = _415 * 2.0;
    int _453 = ~_431;
    int _455 = _453 + 1;
    int _457 = ~_431;
    int _459 = _457 + 1;
    float _461 = 1.0 / _443;
    float _463 = _441 * _105;
    float _465 = _445 * _105;
    float _467 = exp2(_463);
    int _469 = as_type<int>(_461) + (-2);
    float _471 = trunc(_465);
    int _473 = int(_471);
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = float(uint(_473));
    float _481 = as_type<float>(_469) * _479;
    float _483 = trunc(_481);
    float _485 = precise::max(_483, 0.0);
    uint _488 = uint(_485);
    int _490 = _449 * int(_488);
    int _492 = _490 + _473;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_469) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = float(_473);
    bool _504 = !_500;
    float _506 = _504 ? 7.345489978790283203125 : 1.0;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = float(_431);
    float _516 = _506 * _127;
    bool _518 = _502 >= _514;
    bool _520 = isnan(_502);
    bool _522 = _518 || _520;
    bool _524 = isnan(_514);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = floor(_516);
    int _532 = int(_488) + int(_512);
    float _534 = trunc(_528);
    int _536 = int(_534);
    int _538 = _455 * _532;
    int _540 = _538 + _473;
    float _542 = -_530;
    float _544 = _516 + _542;
    float _546 = 1.0 / _409;
    bool _548 = uint(_540) >= uint(_431);
    float _550 = _544 * _514;
    float _552 = _514 * _105;
    bool _554 = !_548;
    int _556 = _554 ? 0 : (-1);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    int _570 = ~_532;
    int _572 = _570 + _556;
    int _574 = _572 + 1;
    float _576 = trunc(_550);
    int _578 = int(_576);
    bool _580 = _431 == 0;
    float _582 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _584 = ~_536;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _431 * _574;
    int _592 = _590 + _473;
    bool _594 = !_564;
    int _596 = _594 ? 0 : 1;
    float _598 = _552 * _546;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _602 = _600 != 0;
    float _604 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    bool _606 = !_580;
    int _608 = _606 ? _592 : (-1);
    float _610 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _612 = _431 + (-1);
    float _614 = trunc(_598);
    int _616 = int(_614);
    int _618 = abs(_596);
    int _620 = _608 * _588;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _604);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _630 = _628 != 0;
    int _632 = _536 * _612;
    int _634 = _632 + _620;
    bool _636 = !_560;
    int _638 = _636 ? 0 : 1;
    int _640 = abs(_624);
    int _642 = _634 * _618;
    int _644 = abs(_638);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _648 = _646 != 0;
    int _650 = _578 * _640;
    int _652 = _650 + _473;
    float _654 = _127 * 2.0;
    int _656 = _616 * _644;
    int _658 = _656 + _642;
    bool _660 = !_568;
    int _662 = _660 ? 0 : 1;
    int _664 = abs(_662);
    float _666 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = floor(_654);
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _678 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _680 = !_630;
    int _682 = _680 ? 0 : 1;
    int _684 = _652 * _664;
    int _686 = _684 + _658;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    int _692 = abs(_682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _700 = _698 != 0;
    float _702 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _704 = _578 * _692;
    int _706 = _704 + _686;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _710 = _127 > 0.5;
    float _712 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _714 = float(uint(_706));
    float _716 = -_708;
    float _718 = fma(_702, 2.0, _716);
    bool _720 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _722 = isnan(1.0);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _732 = 1.0 + _730;
    float _734 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _736 = as_type<float>(_469) * _714;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _740 = 1.0 / _732;
    float _742 = _712 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_610, -2.0, _738);
    float _746 = -_179;
    int _748 = _710 ? as_type<int>(_746) : as_type<int>(_179);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _415 > 0.5;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _772 = ~_431;
    int _774 = _772 + 1;
    float _776 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -_189;
    int _780 = _768 ? as_type<int>(_778) : as_type<int>(_189);
    float _782 = _760 ? _477 : 0.0;
    float _784 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _770);
    bool _786 = _670 > 0.0;
    float _788 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _750);
    bool _790 = _670 >= 0.0;
    bool _792 = isnan(_670);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = -_105;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[76].x, _718);
    float _804 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _784);
    float _806 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _810 = _774 * int(_766);
    int _812 = _810 + _706;
    float _814 = 1.0 / _696;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _407 + _816;
    float _820 = _808 * _127;
    float _822 = float(uint(_812));
    float _824 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _744);
    if (_728)
    {
        float _826 = _782 * _740;
        _109 = _826;
    }
    float _828 = _109;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _830;
    float _834 = in.m_37.z;
    float _836 = floor(_451);
    float _838 = as_type<float>(_469) * _822;
    float _840 = _127 + _415;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _844 = _407 + _842;
    bool _846 = !_674;
    float _848 = _846 ? _179 : as_type<float>(_748);
    float _850 = -_806;
    float _852 = _850 + 1.0;
    float _854 = _840 + (-1.0);
    bool _856 = !_700;
    float _858 = _856 ? _189 : as_type<float>(_780);
    float _860 = trunc(_820);
    int _862 = int(_860);
    float _864 = _844 * _814;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _880 = ~_431;
    int _882 = _880 + 1;
    float _884 = 1.0 / _690;
    float _886 = _127 + _834;
    float _888 = trunc(_838);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    int _894 = _862 << 4;
    int _896 = _894 + 1712;
    float _898 = _834 * 2.0;
    float _900 = _127 + (-0.5);
    int _902 = _896 + 8;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / _832;
    int _914 = _798 ? 0 : 1;
    float _916 = _818 * _884;
    bool _918 = _836 >= 0.0;
    bool _920 = isnan(_836);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _930 = _407 + _928;
    int _932 = ~_914;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _926 ? 0 : 1;
    float _940 = floor(_898);
    bool _942 = _836 > 0.0;
    float _944 = _886 + (-1.0);
    int _946 = int(_766) + int(_892);
    uint _948 = uint(int(uint(_896) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[int(_958)][_960];
    int _964 = _936;
    if (!_786)
    {
        int _966 = ~_914;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    int _972 = ~_938;
    int _974 = _972 + 1;
    int _976 = _974 + 1;
    float _978 = _930 * _912;
    int _980 = _882 * _946;
    int _982 = _980 + _706;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _992 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = _415 + _834;
    bool _996 = uint(_982) >= uint(_431);
    float _998 = fma(_986, _916, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1000 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1002 = isnan(_407);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 + (-1.0);
    int _1014 = _976;
    if (!_942)
    {
        int _1016 = ~_938;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    bool _1022 = !_996;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1028 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1030 = isnan(_407);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    bool _1040 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1042 = isnan(_407);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    bool _1052 = _940 > 0.0;
    float _1054 = -_1038;
    float _1056 = _1054 + 1.0;
    bool _1058 = _940 >= 0.0;
    bool _1060 = isnan(_940);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1068;
    int _1072 = ~_946;
    int _1074 = _1072 + _1024;
    int _1076 = _1074 + 1;
    float _1078 = _1010 * _1056;
    float _1080 = -_1010;
    float _1082 = _1080 + 1.0;
    float _1084 = float(uint(_652));
    float _1086 = fma(_1070, _916, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = fma(_990, _864, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1090 = _427 * _1082;
    float _1092 = _1050 * _435;
    int _1094 = _431 * _1076;
    int _1096 = _1094 + _706;
    float _1098 = _858 + (-0.5);
    float _1100 = as_type<float>(_469) * _1084;
    float _1102 = _848 + 0.5;
    float _1104 = -_1050;
    float _1106 = _1104 + 1.0;
    float _1108 = _998 * _1092;
    float _1110 = _1086 * _1092;
    float _1112 = -_804;
    float _1114 = _1112 + 1.0;
    float _1116 = -_1098;
    float _1118 = -_824;
    float _1120 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1118);
    bool _1122 = !_580;
    int _1124 = _1122 ? _1096 : (-1);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _802);
    float _1128 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1108);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1110);
    float _1132 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1134 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1136 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = trunc(_1100);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1066 ? 0 : 1;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1148 = _1124 >> 31;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1156 = ~_1144;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    float _1162 = fma(_858, _1114, _1120);
    int _1164 = _1160;
    float _1166 = _1078;
    if (!_1052)
    {
        int _1168 = ~_1144;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -_852;
    float _1176 = fma(_848, _1174, _1126);
    int _1178 = _1148 & 3;
    out.m_44.x = _1150;
    out.m_44.y = _1152;
    out.m_44.z = _1154;
    out.m_44.w = _1146;
    int _1180 = ~_431;
    int _1182 = _1180 + 1;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1188 = !_872;
    int _1190 = _1188 ? 0 : 1;
    out.m_46.x = _1176;
    out.m_46.y = _1162;
    bool _1192 = !_876;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_1186, _864, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1198 = abs(_1190);
    float _1200 = float(_1020);
    int _1202 = _1124 & 3;
    bool _1204 = _1202 != 0;
    int _1206 = _1124 + _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _742 + _1208;
    int _1212 = _1206 >> 2;
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1194);
    int _1218 = _1182 * int(_1142);
    int _1220 = _1218 + _652;
    int _1222 = _1212 << 4;
    int _1224 = _1222 + 368;
    float _1226 = float(uint(_1220));
    uint _1228 = uint(int(uint(_1224) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = _1124 & 3;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _776 + _1248;
    float _1252 = float(_970);
    float _1254 = as_type<float>(_469) * _1226;
    bool _1256 = !_868;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1262 = uint(_1244) > 1u;
    float _1264 = trunc(_1254);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = abs(_1258);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1260 + _1272;
    int _1276 = _1224 + 8;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[int(_1288)][_1290];
    float _1294 = float(_1198);
    float _1296 = float(_1216);
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1300 = float(_1270);
    float _1302 = _1294 * _1252;
    int _1304 = _1204 ? 0 : 1;
    float _1306 = _1296 * _1200;
    float _1308 = float(_1172);
    float _1310 = in.m_48.x;
    float _1312 = in.m_48.y;
    float _1314 = in.m_48.z;
    int _1316 = ~_1304;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1298);
    int _1324 = _1320;
    if (!_1262)
    {
        int _1326 = ~_1304;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1300 * _1308;
    bool _1334 = _1244 != 3;
    bool _1336 = uint(_1244) >= 2u;
    bool _1338 = _1322 >= 0.0;
    float _1340 = _1302 * (-2.0);
    int _1342 = abs(_1330);
    int _1344 = _1336 ? 0 : 1;
    bool _1346 = !_1246;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = ~_1344;
    int _1352 = _1350 + 1;
    int _1354 = _1352 + 1;
    bool _1356 = _1244 != 3;
    float _1358 = _1210 * _1210;
    int _1360 = _1354;
    if (_1334)
    {
        int _1362 = ~_1344;
        int _1364 = _1362 + 1;
        _1360 = _1364;
    }
    int _1366 = _1360;
    float _1368 = fma(_1340, _1312, _1312);
    int _1370 = ~_1342;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = fma(_1274, _1274, _1358);
    int _1378 = abs(_1348);
    float _1380 = _1314;
    if (_1338)
    {
        out.m_33.x = 0.0;
    }
    bool _1382 = !_1356;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1242);
    int _1388 = abs(_1366);
    float _1390 = fma(_1250, _1250, _1376);
    int _1392 = int(_1142) + int(_1268);
    float _1394 = fma(_1026, _1340, _1026);
    bool _1396 = !_648;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1384);
    int _1402 = ~_1378;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1406 * as_type<int>(_1234);
    int _1410 = _1408 + _1386;
    int _1412 = abs(_1398);
    int _1414 = ~_1388;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _459 * _1392;
    int _1422 = _1420 + _652;
    int _1424 = _1418 * as_type<int>(_1284);
    int _1426 = _1424 + _1410;
    bool _1428 = uint(_1422) >= uint(_431);
    float _1430 = rsqrt(_1390);
    int _1432 = ~_1400;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1332 * (-2.0);
    bool _1440 = !_1428;
    int _1442 = _1440 ? 0 : (-1);
    int _1444 = ~_1412;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1436 * as_type<int>(_1292);
    int _1452 = _1450 + _1426;
    int _1454 = ~_1392;
    int _1456 = _1454 + _1442;
    int _1458 = _1456 + 1;
    float _1460 = fma(_878, _1438, _878);
    float _1462 = fma(_1438, _1310, _1310);
    int _1464 = _1452 * _1448;
    float _1466 = _415 + (-0.5);
    int _1468 = _431 * _1458;
    int _1470 = _1468 + _652;
    float _1472 = _1306 * (-2.0);
    float _1474 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1476 = _1210 * _1430;
    float _1478 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1480 = _1274 * _1430;
    bool _1482 = !_580;
    int _1484 = _1482 ? _1470 : (-1);
    float _1486 = -_1476;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1490 = fma(_1394, _828, _1474);
    float _1492 = -_1480;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1496 = fma(_1472, _1314, _1314);
    float _1498 = _1488 * _1488;
    int _1500 = _1484 * _1412;
    int _1502 = _1500 + _1464;
    float _1504 = fma(_1460, _828, _1478);
    if (_1338)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1380;
    float _1508 = fma(_1494, _1494, _1498);
    float _1510 = _1490 * 0.15915493667125701904296875;
    float _1512 = float(_1502);
    int _1514 = as_type<int>(_1506);
    if (_1338)
    {
        float _1516 = _1506 * 5.0;
        _1514 = as_type<int>(_1516);
    }
    int _1518 = _1514;
    float _1520 = _1510 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = fma(_992, _1472, _992);
    float _1526 = _1250 * _1430;
    out.m_50.x = _1512;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4291 = as_type<float>(_1518);
        out.gl_Position.z = _4291;
    }
    if (_1338)
    {
        return out;
    }
    float _1528 = -_1476;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _742);
    float _1532 = -_1480;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1536 = -_1526;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1540 = -_1526;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1530 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1534 + _1548;
    float _1552 = fma(_1538, _1538, _1508);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1542 + _1554;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1560 = _1504 * 0.15915493667125701904296875;
    float _1562 = in.m_42.x;
    float _1564 = in.m_42.y;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1558);
    float _1568 = _834 + (-0.5);
    float _1570 = fma(_1196, _1090, _1130);
    float _1572 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1566);
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1496);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1580;
    float _1584 = _1510 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    bool _1588 = _1572 >= 0.0;
    float _1590 = fma(_1524, _828, _1574);
    float _1592 = fma(_1582, _978, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1594 = fma(_1578, _978, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1596 = fma(_1088, _1090, _1128);
    float _1598 = _1590 * 0.15915493667125701904296875;
    float _1600 = fma(_1592, _1078, _1570);
    float _1602 = sqrt(_1552);
    float _1604 = fma(_1594, _1078, _1596);
    float _1606 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1604);
    float _1608 = _1592;
    if (_1588)
    {
        _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1610 = _1608;
    float _1612 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1600);
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    int _1618 = as_type<int>(_1610);
    if (_1588)
    {
        out.m_33.x = 0.0;
    }
    float _1620 = _1606 * _1562;
    if (_1588)
    {
        float _1622 = _1610 * 5.0;
        _1618 = as_type<int>(_1622);
    }
    int _1624 = _1618;
    float _1626 = _1612 * _1564;
    float _1628 = _1560 * 6.283185482025146484375;
    float _1630 = cos(_1628);
    if (_1588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4478 = as_type<float>(_1624);
        out.gl_Position.z = _4478;
    }
    float _1632 = _1430 * _1602;
    float _1634 = _1598 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    float _1638 = _1616 * _1522;
    float _1640 = _1630 * _1586;
    if (_1588)
    {
        return out;
    }
    float _1642 = _1598 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1648 = fma(_1636, _1640, _1638);
    float _1650 = fma(_1636, _1638, _1640);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1654 = _1632 * _1646;
    float _1656 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1658 = _1630 * _1522;
    float _1660 = _1616 * _1586;
    float _1662 = _1652 * _1654;
    float _1664 = _1632 * _1656;
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1668 = -_1658;
    float _1670 = fma(_1636, _1660, _1668);
    float _1672 = -_1660;
    float _1674 = fma(_1636, _1658, _1672);
    float _1676 = -_1662;
    float _1678 = _1636 * _1676;
    float _1680 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1682 = _1522 * _1644;
    float _1684 = _1586 * _1644;
    float _1686 = _1644 * _1662;
    float _1688 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1690 = _1666 * _1664;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1680);
    float _1694 = _1630 * _1686;
    float _1696 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1688);
    float _1698 = _1616 * _1686;
    float _1700 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1692);
    float _1702 = fma(_1648, _1690, _1694);
    float _1704 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1696);
    float _1706 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1708 = _1706 * 0.5;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = fma(_1684, _1690, _1678);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1716 = fma(_1674, _1708, _1702);
    float _1718 = fma(_1670, _1690, _1698);
    float _1720 = fma(_1682, _1708, _1712);
    float _1722 = _1714 + _1710;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = fma(_1650, _1708, _1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1730 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1732 = isnan(0.5);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = 1.0 / _1710;
    float _1744 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1746 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1750 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1752 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1754 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1766 = _1762 || _1764;
    float _1768 = _776 + _1752;
    float _1770 = _1710;
    float _1772 = _1690;
    float _1774 = _1698;
    float _1776 = _1746;
    float _1778 = _1752;
    float _1780 = _1726;
    if (!_1738)
    {
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1166;
    float _1784 = _1260 + _1756;
    if (!_1738)
    {
        _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1786 = _1770;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1790 = _1768 + _1788;
    float _1792 = _1722 * _1742;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1798 = _1784 + _1796;
    float _1800 = _1742;
    if (!_1738)
    {
        float _1802 = -_1782;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1772 = _1804;
    }
    float _1806 = _1772;
    float _1808 = _1790 * _1790;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1812 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1810);
    float _1814 = _1808;
    float _1816 = _1812;
    if (!_1738)
    {
        float _1818 = -_1786;
        float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1800 = _1820;
    }
    float _1822 = _1800;
    if (!_1738)
    {
        float _1824 = 1.0 / _1806;
        _1774 = _1824;
    }
    float _1826 = _1774;
    float _1828 = fma(_1798, _1798, _1808);
    float _1830 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    if (_1738)
    {
        _1814 = 1.0;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1738)
    {
        _1776 = 1.0;
    }
    float _1836 = _1776;
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = sqrt(_1828);
    float _1842 = 1.0 / _1812;
    float _1844 = _1822;
    float _1846 = _1836;
    if (!_1738)
    {
        float _1848 = 1.0 / _1822;
        _1844 = _1848;
    }
    float _1850 = _1844;
    bool _1852 = _1840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1842;
    if (!_1738)
    {
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1858 = -_1782;
        float _1860 = fma(_1842, _1856, _1858);
        _1778 = _1860;
    }
    float _1862 = _1778;
    float _1864 = _1862;
    if (!_1738)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1868 = -_1786;
        float _1870 = fma(_1842, _1866, _1868);
        _1854 = _1870;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (!_1738)
    {
        float _1876 = _1862 * _1826;
        float _1878 = precise::clamp(_1876, 0.0, 1.0);
        _1834 = _1878;
    }
    float _1880 = _1834;
    if (!_1852)
    {
        _1816 = _1784;
    }
    float _1882 = _1816;
    float _1884 = _1882;
    if (!_1738)
    {
        float _1886 = _1872 * _1850;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        _1874 = _1888;
    }
    float _1890 = _1874;
    float _1892 = _742 + _1838;
    if (!_1852)
    {
        _1780 = _1768;
    }
    float _1894 = _1780;
    float _1896 = _1894;
    if (!_1738)
    {
        float _1898 = -_1890;
        float _1900 = _1898 + 1.0;
        _1846 = _1900;
    }
    float _1902 = _1846;
    bool _1904 = _1880 > 0.0;
    bool _1906 = isnan(_1880);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    if (!_1852)
    {
        _1864 = _1892;
    }
    float _1914 = _1864;
    float _1916 = _1880 * _1902;
    bool _1918 = _1902 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    bool _1924 = !_1852;
    float _1926 = _1914;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1840 + _1930;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = rsqrt(_1828);
        float _1938 = _1932 * _1928;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1952 = _1936 * _1950;
        float _1954 = _1948 + (-1.0);
        float _1956 = fma(_1798, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1790, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1960 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = fma(_1892, _1948, _1960);
        _1884 = _1956;
        _1926 = _1962;
        _1896 = _1958;
    }
    float _1964 = _1884;
    float _1966 = _1926;
    float _1968 = _1896;
    float _1970 = -_1480;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1974 = -_1476;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _1978 = -_1526;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1982 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1984 = _1976;
    float _1986 = _1972;
    float _1988 = _1980;
    if (!_1766)
    {
        float _1990 = _1546 * _1546;
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1994 = -_1260;
        float _1996 = _1994 + _1964;
        float _1998 = -_776;
        float _2000 = _1998 + _1968;
        float _2002 = fma(_1550, _1550, _1990);
        float _2004 = fma(_1556, _1556, _2002);
        float _2006 = 1.0 / _1632;
        float _2008 = sqrt(_2004);
        float _2010 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1992;
        float _2014 = -_742;
        float _2016 = _2014 + _1966;
        float _2018 = _2012 * _2006;
        float _2020 = fma(_1996, _2018, _1534);
        float _2022 = fma(_2016, _2018, _1530);
        float _2024 = fma(_2000, _2018, _1542);
        _1984 = _2022;
        _1986 = _2020;
        _1988 = _2024;
    }
    float _2026 = _1984;
    float _2028 = _1986;
    float _2030 = _1988;
    float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2036 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2038 = _375 * _1982;
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2042 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2034);
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2036);
    float _2048 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2050 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2052 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2044);
    float _2054 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2046);
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2058 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2064);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2078 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2080 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2082 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2082);
    float _2092 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2084);
    float _2094 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2088 + _2090;
    float _2098 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2092);
    float _2100 = _2038 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2102 = _2096 * 0.5;
    out.m_33.x = _2100;
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2098;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _2090;
    out.m_52.z = _2102;
    out.m_52.w = _2090;
    if (!_1922)
    {
        return out;
    }
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2104;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _399 = false;
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
        float _2161 = as_type<float>(_87);
        out.gl_Position.z = _2161;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2230 = as_type<float>(_125);
        out.gl_Position.z = _2230;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.x;
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>(_133) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_133) & 2;
    bool _161 = _159 != 0;
    float _163 = _133;
    if (!_145)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _151 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    bool _177 = !_157;
    float _179 = _177 ? (-0.5) : 0.5;
    float _181 = _169;
    if (!_145)
    {
        float _183 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    bool _187 = !_161;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _171 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_153;
    float _197 = _149 + _195;
    float _199 = _153;
    float _201 = _185;
    if (!_145)
    {
        _199 = _135;
    }
    float _203 = _199;
    bool _205 = _197 < 0.5;
    float _207 = float(_205);
    float _209 = fma(_193, 0.5, 0.5);
    bool _211 = !_145;
    float _213 = _203;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _135 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _135);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _243;
    }
    float _245 = _201;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _135 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _213 = _267;
    }
    float _269 = _213;
    float _271 = -_197;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = -_207;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = in.m_35.x;
    float _281 = in.m_35.y;
    float _283 = in.m_35.z;
    float _285 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _287 = !_175;
    int _289 = _287 ? 0 : 1;
    float _291 = -_209;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_42.w;
    float _305 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = in.m_30.x;
    float _313 = in.m_30.y;
    float _315 = in.m_30.z;
    float _317 = _285 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _319 = !_297;
    int _321 = _319 ? 0 : 1;
    float _323 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _329 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    int _331 = abs(_289);
    int _333 = abs(_321);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _325);
    bool _337 = !_301;
    int _339 = _337 ? 0 : 1;
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _327);
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _329);
    float _347 = fma(_269, _279, _335);
    int _349 = abs(_339);
    float _351 = fma(_269, _281, _341);
    float _353 = float(_333);
    float _355 = fma(_269, _283, _345);
    float _357 = float(_331);
    float _359 = abs(_273);
    float _361 = _353 * _359;
    float _363 = fma(_347, _303, _311);
    float _365 = fma(_351, _303, _313);
    float _367 = float(_349);
    float _369 = fma(_357, _293, _361);
    float _371 = fma(_355, _303, _315);
    float _373 = abs(_277);
    float _375 = fma(_367, _373, _369);
    bool _377 = !_343;
    float _395;
    float _397;
    if (!_377)
    {
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _381 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _383 = float(_71);
        float _385 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _387 = _385 * _379;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = _383;
        _399 = true;
    }
    else
    {
        float _401 = float(_71);
        float _403 = 1.0 / _401;
        float _405 = _105 * _403;
        _395 = _405;
        _397 = _401;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_37.y;
    bool _417 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_407);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _431 = int(_429);
    float _433 = -_427;
    float _435 = _433 + 1.0;
    float _437 = float(_413);
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    float _443 = float(uint(_431));
    float _445 = 1.0 / _437;
    int _447 = ~_431;
    int _449 = _447 + 1;
    float _451 = _415 * 2.0;
    int _453 = ~_431;
    int _455 = _453 + 1;
    int _457 = ~_431;
    int _459 = _457 + 1;
    float _461 = 1.0 / _443;
    float _463 = _441 * _105;
    float _465 = _445 * _105;
    float _467 = exp2(_463);
    int _469 = as_type<int>(_461) + (-2);
    float _471 = trunc(_465);
    int _473 = int(_471);
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = float(uint(_473));
    float _481 = as_type<float>(_469) * _479;
    float _483 = trunc(_481);
    float _485 = precise::max(_483, 0.0);
    uint _488 = uint(_485);
    int _490 = _449 * int(_488);
    int _492 = _490 + _473;
    float _494 = float(uint(_492));
    float _496 = as_type<float>(_469) * _494;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = float(_473);
    bool _504 = !_500;
    float _506 = _504 ? 7.345489978790283203125 : 1.0;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = float(_431);
    float _516 = _506 * _127;
    bool _518 = _502 >= _514;
    bool _520 = isnan(_502);
    bool _522 = _518 || _520;
    bool _524 = isnan(_514);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = floor(_516);
    int _532 = int(_488) + int(_512);
    float _534 = trunc(_528);
    int _536 = int(_534);
    int _538 = _455 * _532;
    int _540 = _538 + _473;
    float _542 = -_530;
    float _544 = _516 + _542;
    float _546 = 1.0 / _409;
    bool _548 = uint(_540) >= uint(_431);
    float _550 = _544 * _514;
    float _552 = _514 * _105;
    bool _554 = !_548;
    int _556 = _554 ? 0 : (-1);
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    int _570 = ~_532;
    int _572 = _570 + _556;
    int _574 = _572 + 1;
    float _576 = trunc(_550);
    int _578 = int(_576);
    bool _580 = _431 == 0;
    float _582 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _584 = ~_536;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _431 * _574;
    int _592 = _590 + _473;
    bool _594 = !_564;
    int _596 = _594 ? 0 : 1;
    float _598 = _552 * _546;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _602 = _600 != 0;
    float _604 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    bool _606 = !_580;
    int _608 = _606 ? _592 : (-1);
    float _610 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _612 = _431 + (-1);
    float _614 = trunc(_598);
    int _616 = int(_614);
    int _618 = abs(_596);
    int _620 = _608 * _588;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _604);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _630 = _628 != 0;
    int _632 = _536 * _612;
    int _634 = _632 + _620;
    bool _636 = !_560;
    int _638 = _636 ? 0 : 1;
    int _640 = abs(_624);
    int _642 = _634 * _618;
    int _644 = abs(_638);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _648 = _646 != 0;
    int _650 = _578 * _640;
    int _652 = _650 + _473;
    float _654 = _127 * 2.0;
    int _656 = _616 * _644;
    int _658 = _656 + _642;
    bool _660 = !_568;
    int _662 = _660 ? 0 : 1;
    int _664 = abs(_662);
    float _666 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = floor(_654);
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _678 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _680 = !_630;
    int _682 = _680 ? 0 : 1;
    int _684 = _652 * _664;
    int _686 = _684 + _658;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    int _692 = abs(_682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _700 = _698 != 0;
    float _702 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _704 = _578 * _692;
    int _706 = _704 + _686;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _710 = _127 > 0.5;
    float _712 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _714 = float(uint(_706));
    float _716 = -_708;
    float _718 = fma(_702, 2.0, _716);
    bool _720 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _722 = isnan(1.0);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _732 = 1.0 + _730;
    float _734 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _736 = as_type<float>(_469) * _714;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _740 = 1.0 / _732;
    float _742 = _712 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_610, -2.0, _738);
    float _746 = -_179;
    int _748 = _710 ? as_type<int>(_746) : as_type<int>(_179);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _415 > 0.5;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _772 = ~_431;
    int _774 = _772 + 1;
    float _776 = _734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -_189;
    int _780 = _768 ? as_type<int>(_778) : as_type<int>(_189);
    float _782 = _760 ? _477 : 0.0;
    float _784 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _770);
    bool _786 = _670 > 0.0;
    float _788 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _750);
    bool _790 = _670 >= 0.0;
    bool _792 = isnan(_670);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = -_105;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[76].x, _718);
    float _804 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _784);
    float _806 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _788);
    float _808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _810 = _774 * int(_766);
    int _812 = _810 + _706;
    float _814 = 1.0 / _696;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _407 + _816;
    float _820 = _808 * _127;
    float _822 = float(uint(_812));
    float _824 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _744);
    if (_728)
    {
        float _826 = _782 * _740;
        _109 = _826;
    }
    float _828 = _109;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _830;
    float _834 = in.m_37.z;
    float _836 = floor(_451);
    float _838 = as_type<float>(_469) * _822;
    float _840 = _127 + _415;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _844 = _407 + _842;
    bool _846 = !_674;
    float _848 = _846 ? _179 : as_type<float>(_748);
    float _850 = -_806;
    float _852 = _850 + 1.0;
    float _854 = _840 + (-1.0);
    bool _856 = !_700;
    float _858 = _856 ? _189 : as_type<float>(_780);
    float _860 = trunc(_820);
    int _862 = int(_860);
    float _864 = _844 * _814;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _876 = _874 != 0;
    float _878 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _880 = ~_431;
    int _882 = _880 + 1;
    float _884 = 1.0 / _690;
    float _886 = _127 + _834;
    float _888 = trunc(_838);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    int _894 = _862 << 4;
    int _896 = _894 + 1712;
    float _898 = _834 * 2.0;
    float _900 = _127 + (-0.5);
    int _902 = _896 + 8;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / _832;
    int _914 = _798 ? 0 : 1;
    float _916 = _818 * _884;
    bool _918 = _836 >= 0.0;
    bool _920 = isnan(_836);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _930 = _407 + _928;
    int _932 = ~_914;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _926 ? 0 : 1;
    float _940 = floor(_898);
    bool _942 = _836 > 0.0;
    float _944 = _886 + (-1.0);
    int _946 = int(_766) + int(_892);
    uint _948 = uint(int(uint(_896) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[int(_958)][_960];
    int _964 = _936;
    if (!_786)
    {
        int _966 = ~_914;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    int _972 = ~_938;
    int _974 = _972 + 1;
    int _976 = _974 + 1;
    float _978 = _930 * _912;
    int _980 = _882 * _946;
    int _982 = _980 + _706;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _992 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = _415 + _834;
    bool _996 = uint(_982) >= uint(_431);
    float _998 = fma(_986, _916, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1000 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1002 = isnan(_407);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 + (-1.0);
    int _1014 = _976;
    if (!_942)
    {
        int _1016 = ~_938;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    bool _1022 = !_996;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1028 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1030 = isnan(_407);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    bool _1040 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1042 = isnan(_407);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    bool _1052 = _940 > 0.0;
    float _1054 = -_1038;
    float _1056 = _1054 + 1.0;
    bool _1058 = _940 >= 0.0;
    bool _1060 = isnan(_940);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1068;
    int _1072 = ~_946;
    int _1074 = _1072 + _1024;
    int _1076 = _1074 + 1;
    float _1078 = _1010 * _1056;
    float _1080 = -_1010;
    float _1082 = _1080 + 1.0;
    float _1084 = float(uint(_652));
    float _1086 = fma(_1070, _916, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1088 = fma(_990, _864, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1090 = _427 * _1082;
    float _1092 = _1050 * _435;
    int _1094 = _431 * _1076;
    int _1096 = _1094 + _706;
    float _1098 = _858 + (-0.5);
    float _1100 = as_type<float>(_469) * _1084;
    float _1102 = _848 + 0.5;
    float _1104 = -_1050;
    float _1106 = _1104 + 1.0;
    float _1108 = _998 * _1092;
    float _1110 = _1086 * _1092;
    float _1112 = -_804;
    float _1114 = _1112 + 1.0;
    float _1116 = -_1098;
    float _1118 = -_824;
    float _1120 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1118);
    bool _1122 = !_580;
    int _1124 = _1122 ? _1096 : (-1);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[80].x, _802);
    float _1128 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1108);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1110);
    float _1132 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1134 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1136 = _910 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = trunc(_1100);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1066 ? 0 : 1;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1148 = _1124 >> 31;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1156 = ~_1144;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    float _1162 = fma(_858, _1114, _1120);
    int _1164 = _1160;
    float _1166 = _1078;
    if (!_1052)
    {
        int _1168 = ~_1144;
        int _1170 = _1168 + 1;
        _1164 = _1170;
    }
    int _1172 = _1164;
    float _1174 = -_852;
    float _1176 = fma(_848, _1174, _1126);
    int _1178 = _1148 & 3;
    out.m_44.x = _1150;
    out.m_44.y = _1152;
    out.m_44.z = _1154;
    out.m_44.w = _1146;
    int _1180 = ~_431;
    int _1182 = _1180 + 1;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1188 = !_872;
    int _1190 = _1188 ? 0 : 1;
    out.m_46.x = _1176;
    out.m_46.y = _1162;
    bool _1192 = !_876;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_1186, _864, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1198 = abs(_1190);
    float _1200 = float(_1020);
    int _1202 = _1124 & 3;
    bool _1204 = _1202 != 0;
    int _1206 = _1124 + _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _742 + _1208;
    int _1212 = _1206 >> 2;
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1194);
    int _1218 = _1182 * int(_1142);
    int _1220 = _1218 + _652;
    int _1222 = _1212 << 4;
    int _1224 = _1222 + 368;
    float _1226 = float(uint(_1220));
    uint _1228 = uint(int(uint(_1224) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = _1124 & 3;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _776 + _1248;
    float _1252 = float(_970);
    float _1254 = as_type<float>(_469) * _1226;
    bool _1256 = !_868;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1262 = uint(_1244) > 1u;
    float _1264 = trunc(_1254);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = abs(_1258);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1274 = _1260 + _1272;
    int _1276 = _1224 + 8;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[int(_1288)][_1290];
    float _1294 = float(_1198);
    float _1296 = float(_1216);
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    float _1300 = float(_1270);
    float _1302 = _1294 * _1252;
    int _1304 = _1204 ? 0 : 1;
    float _1306 = _1296 * _1200;
    float _1308 = float(_1172);
    float _1310 = in.m_48.x;
    float _1312 = in.m_48.y;
    float _1314 = in.m_48.z;
    int _1316 = ~_1304;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1298);
    int _1324 = _1320;
    if (!_1262)
    {
        int _1326 = ~_1304;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1300 * _1308;
    bool _1334 = _1244 != 3;
    bool _1336 = uint(_1244) >= 2u;
    bool _1338 = _1322 >= 0.0;
    float _1340 = _1302 * (-2.0);
    int _1342 = abs(_1330);
    int _1344 = _1336 ? 0 : 1;
    bool _1346 = !_1246;
    int _1348 = _1346 ? 0 : 1;
    int _1350 = ~_1344;
    int _1352 = _1350 + 1;
    int _1354 = _1352 + 1;
    bool _1356 = _1244 != 3;
    float _1358 = _1210 * _1210;
    int _1360 = _1354;
    if (_1334)
    {
        int _1362 = ~_1344;
        int _1364 = _1362 + 1;
        _1360 = _1364;
    }
    int _1366 = _1360;
    float _1368 = fma(_1340, _1312, _1312);
    int _1370 = ~_1342;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = fma(_1274, _1274, _1358);
    int _1378 = abs(_1348);
    float _1380 = _1314;
    if (_1338)
    {
        out.m_33.x = 0.0;
    }
    bool _1382 = !_1356;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1242);
    int _1388 = abs(_1366);
    float _1390 = fma(_1250, _1250, _1376);
    int _1392 = int(_1142) + int(_1268);
    float _1394 = fma(_1026, _1340, _1026);
    bool _1396 = !_648;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1384);
    int _1402 = ~_1378;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1406 * as_type<int>(_1234);
    int _1410 = _1408 + _1386;
    int _1412 = abs(_1398);
    int _1414 = ~_1388;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _459 * _1392;
    int _1422 = _1420 + _652;
    int _1424 = _1418 * as_type<int>(_1284);
    int _1426 = _1424 + _1410;
    bool _1428 = uint(_1422) >= uint(_431);
    float _1430 = rsqrt(_1390);
    int _1432 = ~_1400;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1332 * (-2.0);
    bool _1440 = !_1428;
    int _1442 = _1440 ? 0 : (-1);
    int _1444 = ~_1412;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1436 * as_type<int>(_1292);
    int _1452 = _1450 + _1426;
    int _1454 = ~_1392;
    int _1456 = _1454 + _1442;
    int _1458 = _1456 + 1;
    float _1460 = fma(_878, _1438, _878);
    float _1462 = fma(_1438, _1310, _1310);
    int _1464 = _1452 * _1448;
    float _1466 = _415 + (-0.5);
    int _1468 = _431 * _1458;
    int _1470 = _1468 + _652;
    float _1472 = _1306 * (-2.0);
    float _1474 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1476 = _1210 * _1430;
    float _1478 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1480 = _1274 * _1430;
    bool _1482 = !_580;
    int _1484 = _1482 ? _1470 : (-1);
    float _1486 = -_1476;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1490 = fma(_1394, _828, _1474);
    float _1492 = -_1480;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1496 = fma(_1472, _1314, _1314);
    float _1498 = _1488 * _1488;
    int _1500 = _1484 * _1412;
    int _1502 = _1500 + _1464;
    float _1504 = fma(_1460, _828, _1478);
    if (_1338)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1380;
    float _1508 = fma(_1494, _1494, _1498);
    float _1510 = _1490 * 0.15915493667125701904296875;
    float _1512 = float(_1502);
    int _1514 = as_type<int>(_1506);
    if (_1338)
    {
        float _1516 = _1506 * 5.0;
        _1514 = as_type<int>(_1516);
    }
    int _1518 = _1514;
    float _1520 = _1510 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = fma(_992, _1472, _992);
    float _1526 = _1250 * _1430;
    out.m_50.x = _1512;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4291 = as_type<float>(_1518);
        out.gl_Position.z = _4291;
    }
    if (_1338)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1528 = -_1476;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _742);
    float _1532 = -_1480;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1536 = -_1526;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1540 = -_1526;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1530 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1534 + _1548;
    float _1552 = fma(_1538, _1538, _1508);
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1542 + _1554;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1560 = _1504 * 0.15915493667125701904296875;
    float _1562 = in.m_42.x;
    float _1564 = in.m_42.y;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1558);
    float _1568 = _834 + (-0.5);
    float _1570 = fma(_1196, _1090, _1130);
    float _1572 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1566);
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1496);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1580;
    float _1584 = _1510 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    bool _1588 = _1572 >= 0.0;
    float _1590 = fma(_1524, _828, _1574);
    float _1592 = fma(_1582, _978, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1594 = fma(_1578, _978, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1596 = fma(_1088, _1090, _1128);
    float _1598 = _1590 * 0.15915493667125701904296875;
    float _1600 = fma(_1592, _1078, _1570);
    float _1602 = sqrt(_1552);
    float _1604 = fma(_1594, _1078, _1596);
    float _1606 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1604);
    float _1608 = _1592;
    if (_1588)
    {
        _1608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1610 = _1608;
    float _1612 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1600);
    float _1614 = _1560 * 6.283185482025146484375;
    float _1616 = sin(_1614);
    int _1618 = as_type<int>(_1610);
    if (_1588)
    {
        out.m_33.x = 0.0;
    }
    float _1620 = _1606 * _1562;
    if (_1588)
    {
        float _1622 = _1610 * 5.0;
        _1618 = as_type<int>(_1622);
    }
    int _1624 = _1618;
    float _1626 = _1612 * _1564;
    float _1628 = _1560 * 6.283185482025146484375;
    float _1630 = cos(_1628);
    if (_1588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4478 = as_type<float>(_1624);
        out.gl_Position.z = _4478;
    }
    float _1632 = _1430 * _1602;
    float _1634 = _1598 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    float _1638 = _1616 * _1522;
    float _1640 = _1630 * _1586;
    if (_1588)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1642 = _1598 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1648 = fma(_1636, _1640, _1638);
    float _1650 = fma(_1636, _1638, _1640);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1654 = _1632 * _1646;
    float _1656 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1658 = _1630 * _1522;
    float _1660 = _1616 * _1586;
    float _1662 = _1652 * _1654;
    float _1664 = _1632 * _1656;
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1668 = -_1658;
    float _1670 = fma(_1636, _1660, _1668);
    float _1672 = -_1660;
    float _1674 = fma(_1636, _1658, _1672);
    float _1676 = -_1662;
    float _1678 = _1636 * _1676;
    float _1680 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1682 = _1522 * _1644;
    float _1684 = _1586 * _1644;
    float _1686 = _1644 * _1662;
    float _1688 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1690 = _1666 * _1664;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1680);
    float _1694 = _1630 * _1686;
    float _1696 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1688);
    float _1698 = _1616 * _1686;
    float _1700 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1692);
    float _1702 = fma(_1648, _1690, _1694);
    float _1704 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1696);
    float _1706 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1708 = _1706 * 0.5;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1712 = fma(_1684, _1690, _1678);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1716 = fma(_1674, _1708, _1702);
    float _1718 = fma(_1670, _1690, _1698);
    float _1720 = fma(_1682, _1708, _1712);
    float _1722 = _1714 + _1710;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = fma(_1650, _1708, _1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1730 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1732 = isnan(0.5);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = 1.0 / _1710;
    float _1744 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1746 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1750 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1752 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1754 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1766 = _1762 || _1764;
    float _1768 = _776 + _1752;
    float _1770 = _1710;
    float _1772 = _1690;
    float _1774 = _1698;
    float _1776 = _1746;
    float _1778 = _1752;
    float _1780 = _1726;
    if (!_1738)
    {
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1166;
    float _1784 = _1260 + _1756;
    if (!_1738)
    {
        _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1786 = _1770;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1790 = _1768 + _1788;
    float _1792 = _1722 * _1742;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1798 = _1784 + _1796;
    float _1800 = _1742;
    if (!_1738)
    {
        float _1802 = -_1782;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1772 = _1804;
    }
    float _1806 = _1772;
    float _1808 = _1790 * _1790;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1812 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1810);
    float _1814 = _1808;
    float _1816 = _1812;
    if (!_1738)
    {
        float _1818 = -_1786;
        float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1800 = _1820;
    }
    float _1822 = _1800;
    if (!_1738)
    {
        float _1824 = 1.0 / _1806;
        _1774 = _1824;
    }
    float _1826 = _1774;
    float _1828 = fma(_1798, _1798, _1808);
    float _1830 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1754);
    if (_1738)
    {
        _1814 = 1.0;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1738)
    {
        _1776 = 1.0;
    }
    float _1836 = _1776;
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = sqrt(_1828);
    float _1842 = 1.0 / _1812;
    float _1844 = _1822;
    float _1846 = _1836;
    if (!_1738)
    {
        float _1848 = 1.0 / _1822;
        _1844 = _1848;
    }
    float _1850 = _1844;
    bool _1852 = _1840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1842;
    if (!_1738)
    {
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1858 = -_1782;
        float _1860 = fma(_1842, _1856, _1858);
        _1778 = _1860;
    }
    float _1862 = _1778;
    float _1864 = _1862;
    if (!_1738)
    {
        float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1868 = -_1786;
        float _1870 = fma(_1842, _1866, _1868);
        _1854 = _1870;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (!_1738)
    {
        float _1876 = _1862 * _1826;
        float _1878 = precise::clamp(_1876, 0.0, 1.0);
        _1834 = _1878;
    }
    float _1880 = _1834;
    if (!_1852)
    {
        _1816 = _1784;
    }
    float _1882 = _1816;
    float _1884 = _1882;
    if (!_1738)
    {
        float _1886 = _1872 * _1850;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        _1874 = _1888;
    }
    float _1890 = _1874;
    float _1892 = _742 + _1838;
    if (!_1852)
    {
        _1780 = _1768;
    }
    float _1894 = _1780;
    float _1896 = _1894;
    if (!_1738)
    {
        float _1898 = -_1890;
        float _1900 = _1898 + 1.0;
        _1846 = _1900;
    }
    float _1902 = _1846;
    bool _1904 = _1880 > 0.0;
    bool _1906 = isnan(_1880);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    if (!_1852)
    {
        _1864 = _1892;
    }
    float _1914 = _1864;
    float _1916 = _1880 * _1902;
    bool _1918 = _1902 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    bool _1924 = !_1852;
    float _1926 = _1914;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1840 + _1930;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = rsqrt(_1828);
        float _1938 = _1932 * _1928;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1952 = _1936 * _1950;
        float _1954 = _1948 + (-1.0);
        float _1956 = fma(_1798, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1790, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1960 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1962 = fma(_1892, _1948, _1960);
        _1884 = _1956;
        _1926 = _1962;
        _1896 = _1958;
    }
    float _1964 = _1884;
    float _1966 = _1926;
    float _1968 = _1896;
    float _1970 = -_1480;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1974 = -_1476;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1966);
    float _1978 = -_1526;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1982 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1984 = _1976;
    float _1986 = _1972;
    float _1988 = _1980;
    if (!_1766)
    {
        float _1990 = _1546 * _1546;
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1994 = -_1260;
        float _1996 = _1994 + _1964;
        float _1998 = -_776;
        float _2000 = _1998 + _1968;
        float _2002 = fma(_1550, _1550, _1990);
        float _2004 = fma(_1556, _1556, _2002);
        float _2006 = 1.0 / _1632;
        float _2008 = sqrt(_2004);
        float _2010 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1992;
        float _2014 = -_742;
        float _2016 = _2014 + _1966;
        float _2018 = _2012 * _2006;
        float _2020 = fma(_1996, _2018, _1534);
        float _2022 = fma(_2016, _2018, _1530);
        float _2024 = fma(_2000, _2018, _1542);
        _1984 = _2022;
        _1986 = _2020;
        _1988 = _2024;
    }
    float _2026 = _1984;
    float _2028 = _1986;
    float _2030 = _1988;
    float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2036 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2038 = _375 * _1982;
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2042 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2034);
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2036);
    float _2048 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2050 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2052 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2044);
    float _2054 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2046);
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2058 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2064);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2078 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2080 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2082 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2086 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2082);
    float _2092 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2084);
    float _2094 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2088 + _2090;
    float _2098 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2092);
    float _2100 = _2038 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2102 = _2096 * 0.5;
    out.m_33.x = _2100;
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2098;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _2090;
    out.m_52.z = _2102;
    out.m_52.w = _2090;
    if (!_1922)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2104;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

