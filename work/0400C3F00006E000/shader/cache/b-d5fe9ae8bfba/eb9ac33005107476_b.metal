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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_30 [[attribute(6)]];
    float4 m_32 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
    float4 m_52 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_30.w;
    float _80 = in.m_32.w;
    float _82 = trunc(_78);
    int _85 = int(_82);
    float _87 = -_80;
    float _89 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _89;
    bool _93 = _85 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_85);
    float _99 = _89;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    if (!_93)
    {
        out.m_37.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2197 = as_type<float>(_107);
        out.gl_Position.z = _2197;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _111 = _80 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_80);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = float(_85);
    bool _123 = _89 >= _121;
    bool _125 = !_119;
    bool _127 = _123 || _125;
    if (_127)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _97;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _109 = as_type<int>(_131);
    }
    int _133 = _109;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_133);
        out.gl_Position.z = _2252;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / _121;
    float _139 = in.m_42.x;
    float _141 = in.m_42.y;
    float _143 = in.m_42.z;
    float _145 = in.m_44.x;
    float _147 = in.m_44.y;
    float _149 = in.m_44.z;
    float _151 = in.m_46.x;
    float _153 = in.m_46.y;
    float _155 = in.m_46.z;
    float _157 = in.m_48.x;
    float _159 = in.m_48.y;
    float _161 = in.m_48.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _141 * _147;
    float _175 = _141 * _153;
    float _177 = fma(_139, _145, _173);
    float _179 = _141 * _159;
    float _181 = fma(_139, _151, _175);
    float _183 = fma(_143, _149, _177);
    bool _185 = !_165;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_139, _157, _179);
    float _191 = fma(_143, _155, _181);
    float _193 = _89 * _137;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_143, _161, _189);
    bool _201 = !_171;
    float _219;
    if (!_201)
    {
        float _203 = in.m_50.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _89);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _193;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_50.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _89);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _193;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = isnan(_319);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _323;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _347 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = isnan(_319);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -_339;
    float _365 = _363 + 1.0;
    bool _367 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_319);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _381 = 1.0 / _327;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _387 = _357 * _365;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = _377 * _391;
    float _395 = 1.0 / _345;
    float _397 = _361 * _341;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _319 + _399;
    float _403 = -_377;
    float _405 = _403 + 1.0;
    float _407 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _319 + _409;
    float _413 = _385 * _381;
    bool _415 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _417 = isnan(_319);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _427;
    float _431 = _407 * _393;
    float _433 = fma(_413, _411, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _319 + _435;
    float _439 = -_425;
    float _441 = _439 + 1.0;
    float _443 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[115].x, _431);
    float _445 = _429 * _395;
    float _447 = _339 * _441;
    float _449 = fma(_433, _387, _443);
    float _451 = fma(_445, _437, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = fma(_451, _447, _449);
    float _457 = in.m_52.x;
    float _459 = in.m_52.y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[118].x, _455);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _461;
    out.m_54.y = _471;
    out.m_54.z = _473;
    out.m_54.w = _469;
    float _475 = _295 * _459;
    float _477 = _293 * _457;
    bool _479 = !_379;
    float _497;
    if (!_479)
    {
        float _481 = in.m_50.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].z, _89);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _193;
    }
    _499 = false;
    float _501 = _497;
    float _503 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _505 = int(_503);
    float _507 = in.m_46.w;
    float _509 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _513 = int(_511);
    float _515 = float(_505);
    float _517 = 1.0 / _515;
    float _519 = float(uint(_513));
    int _521 = ~_513;
    int _523 = _521 + 1;
    int _525 = ~_513;
    int _527 = _525 + 1;
    float _529 = 1.0 / _519;
    float _531 = float(_513);
    bool _533 = _513 == 0;
    int _535 = ~_513;
    int _537 = _535 + 1;
    float _539 = _517 * _89;
    float _541 = trunc(_539);
    int _543 = int(_541);
    int _545 = as_type<int>(_529) + (-2);
    float _547 = float(uint(_543));
    float _549 = float(_543);
    float _551 = as_type<float>(_545) * _547;
    bool _553 = _549 >= _531;
    bool _555 = isnan(_549);
    bool _557 = _553 || _555;
    bool _559 = isnan(_531);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = trunc(_551);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    float _572 = trunc(_563);
    int _574 = int(_572);
    int _576 = _523 * int(_570);
    int _578 = _576 + _543;
    float _580 = in.m_50.x;
    float _582 = in.m_50.y;
    float _584 = float(uint(_578));
    float _586 = as_type<float>(_545) * _584;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _592 = uint(_590);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    bool _598 = !_596;
    float _600 = _598 ? 7.345489978790283203125 : 1.0;
    float _602 = _600 * _580;
    int _604 = int(_570) + int(_592);
    float _606 = floor(_602);
    int _608 = _527 * _604;
    int _610 = _608 + _543;
    bool _612 = uint(_610) >= uint(_513);
    bool _614 = !_612;
    int _616 = _614 ? 0 : (-1);
    int _618 = ~_604;
    int _620 = _618 + _616;
    int _622 = _620 + 1;
    float _624 = -_606;
    float _626 = _602 + _624;
    int _628 = _513 * _622;
    int _630 = _628 + _543;
    int _632 = ~_574;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * _531;
    float _640 = _531 * _89;
    bool _642 = !_533;
    int _644 = _642 ? _630 : (-1);
    float _646 = _640 * _137;
    float _648 = trunc(_638);
    int _650 = int(_648);
    int _652 = _644 * _636;
    int _654 = _513 + (-1);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _670 = _668 != 0;
    int _672 = _574 * _654;
    int _674 = _672 + _652;
    float _676 = trunc(_646);
    int _678 = int(_676);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_682);
    bool _690 = !_666;
    int _692 = _690 ? 0 : 1;
    bool _694 = !_670;
    int _696 = _694 ? 0 : 1;
    int _698 = _674 * _688;
    int _700 = abs(_686);
    int _702 = abs(_692);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _706 = _704 != 0;
    int _708 = abs(_696);
    bool _710 = !_706;
    int _712 = _710 ? 0 : 1;
    int _714 = _650 * _708;
    int _716 = _714 + _543;
    int _718 = _678 * _700;
    int _720 = _718 + _698;
    int _722 = abs(_712);
    float _724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _726 = log2(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _730 = _728 != 0;
    int _732 = _716 * _702;
    int _734 = _732 + _720;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _742 = _740 != 0;
    int _744 = _650 * _722;
    int _746 = _744 + _734;
    int _748 = ~_513;
    int _750 = _748 + 1;
    bool _752 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(1.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = float(uint(_746));
    bool _768 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _776 = _772 || _774;
    float _778 = 1.0 / _764;
    float _780 = as_type<float>(_545) * _766;
    float _782 = in.m_30.x;
    float _784 = in.m_30.y;
    float _786 = in.m_30.z;
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _750 * int(_792);
    int _796 = _794 + _746;
    float _798 = _147 * _784;
    float _800 = float(uint(_796));
    float _802 = _159 * _784;
    float _804 = fma(_145, _782, _798);
    float _806 = as_type<float>(_545) * _800;
    float _808 = _153 * _784;
    float _810 = _726 * _89;
    float _812 = trunc(_806);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _824 = fma(_157, _782, _802);
    float _826 = exp2(_810);
    float _828 = fma(_151, _782, _808);
    float _830 = _580 * 2.0;
    float _832 = _582 * 2.0;
    float _834 = fma(_155, _786, _828);
    int _836 = int(_792) + int(_816);
    float _838 = _582 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _840 = floor(_830);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = in.m_50.z;
    int _846 = _537 * _836;
    int _848 = _846 + _746;
    float _850 = fma(_838, -2.0, _820);
    float _852 = -_826;
    float _854 = _852 + 1.0;
    bool _856 = uint(_848) >= uint(_513);
    float _858 = -_822;
    float _860 = fma(_818, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _864 = _776 ? _854 : 0.0;
    float _866 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    bool _868 = !_856;
    int _870 = _868 ? 0 : (-1);
    float _872 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _862);
    bool _874 = _840 >= 0.0;
    bool _876 = isnan(_840);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_836;
    int _886 = _884 + _870;
    int _888 = _886 + 1;
    float _890 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    int _892 = _513 * _888;
    int _894 = _892 + _746;
    float _896 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = -_890;
    float _908 = _906 + 1.0;
    bool _910 = !_533;
    int _912 = _910 ? _894 : (-1);
    float _914 = -_89;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _918 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    if (_760)
    {
        float _920 = _864 * _778;
        _99 = _920;
    }
    float _922 = _99;
    int _924 = _912 & 3;
    bool _926 = _924 != 0;
    float _928 = 1.0 / _900;
    int _930 = _882 ? 0 : 1;
    float _932 = in.m_48.w;
    int _934 = _926 ? 0 : 1;
    int _936 = _912 & 3;
    bool _938 = _936 != 0;
    bool _940 = _840 > 0.0;
    float _942 = floor(_832);
    bool _944 = uint(_936) > 1u;
    float _946 = fma(_149, _786, _804);
    float _948 = fma(_161, _786, _824);
    int _950 = ~_934;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = _501 + _956;
    int _960 = ~_930;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _582 + _844;
    float _968 = 1.0 / _904;
    float _970 = _958 * _928;
    float _972 = _582 + _580;
    float _974 = _966 + (-1.0);
    int _976 = _964;
    int _978 = _954;
    if (!_940)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _976 = _982;
    }
    int _984 = _976;
    float _986 = _844 * 2.0;
    if (!_944)
    {
        int _988 = ~_934;
        int _990 = _988 + 1;
        _978 = _990;
    }
    int _992 = _978;
    float _994 = _972 + (-1.0);
    bool _996 = _580 > 0.5;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _998;
    bool _1002 = _942 >= 0.0;
    bool _1004 = isnan(_942);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.0);
    bool _1010 = _1006 || _1008;
    float _1012 = floor(_986);
    float _1014 = -_187;
    int _1016 = _996 ? as_type<int>(_1014) : as_type<int>(_187);
    float _1018 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1020 = _582 > 0.5;
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1024 = _1010 ? 0 : 1;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _501 + _1026;
    float _1030 = -_197;
    int _1032 = _1020 ? as_type<int>(_1030) : as_type<int>(_197);
    float _1034 = fma(_1000, _970, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1036 = _942 > 0.0;
    float _1038 = _1028 * _968;
    bool _1040 = !_738;
    float _1042 = _1040 ? _187 : as_type<float>(_1016);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1048 = !_742;
    float _1050 = _1048 ? _197 : as_type<float>(_1032);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1066 = _1064 != 0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1072 = ~_1024;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    float _1078 = fma(_1054, _970, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1080 = _948 + _932;
    bool _1082 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1084 = isnan(_501);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = _1076;
    if (!_1036)
    {
        int _1096 = ~_1024;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1102;
    bool _1106 = _1012 >= 0.0;
    bool _1108 = isnan(_1012);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_44.w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1122 = fma(_1104, _970, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = _1012 > 0.0;
    float _1128 = fma(_1120, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1130 = float(uint(_716));
    float _1132 = -_1092;
    float _1134 = _1132 + 1.0;
    int _1136 = _912 >> 31;
    float _1138 = as_type<float>(_545) * _1130;
    int _1140 = _1136 & 3;
    float _1142 = fma(_1070, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1144 = fma(_1046, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_501);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = trunc(_1138);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = _912 + _1140;
    bool _1166 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1168 = isnan(_501);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1164 >> 2;
    float _1180 = _946 + _1116;
    int _1182 = ~_513;
    int _1184 = _1182 + 1;
    float _1186 = _1176 * _1134;
    int _1188 = _1178 << 4;
    int _1190 = _1188 + 368;
    float _1192 = -_1176;
    float _1194 = _1192 + 1.0;
    uint _1196 = uint(int(uint(_1190) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[int(_1206)][_1208];
    float _1212 = _1156 * _1194;
    float _1214 = _834 + _507;
    int _1216 = _1184 * int(_1162);
    int _1218 = _1216 + _716;
    float _1220 = -_1156;
    float _1222 = _1220 + 1.0;
    float _1224 = _1078 * _1212;
    float _1226 = _1122 * _1212;
    float _1228 = _1042 + 0.5;
    float _1230 = float(uint(_1218));
    int _1232 = _1190 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    float _1250 = _1034 * _1212;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[80].x, _916);
    bool _1254 = !_938;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = as_type<float>(_545) * _1230;
    float _1260 = _1050 + (-0.5);
    bool _1262 = uint(_936) >= 2u;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1260;
    float _1274 = -_866;
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1274);
    float _1278 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1226);
    float _1280 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1250);
    int _1282 = ~_513;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1142, _1186, _1264);
    float _1288 = fma(_1128, _1186, _1278);
    int _1290 = _1262 ? 0 : 1;
    float _1292 = -_918;
    float _1294 = _1292 + 1.0;
    bool _1296 = _936 != 3;
    float _1298 = -_908;
    float _1300 = fma(_1042, _1298, _1252);
    int _1302 = abs(_992);
    float _1304 = fma(_1050, _1294, _1276);
    int _1306 = ~_1124;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1144, _1186, _1280);
    int _1314 = ~_1290;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1288);
    int _1322 = int(_1162) + int(_1270);
    out.m_56.x = _1300;
    out.m_56.y = _1304;
    int _1324 = _1310;
    int _1326 = _1318;
    if (!_1126)
    {
        int _1328 = ~_1124;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1286);
    int _1336 = abs(_1256);
    int _1338 = _1284 * _1322;
    int _1340 = _1338 + _716;
    if (_1296)
    {
        int _1342 = ~_1290;
        int _1344 = _1342 + 1;
        _1326 = _1344;
    }
    int _1346 = _1326;
    float _1348 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1312);
    bool _1350 = _936 != 3;
    bool _1352 = uint(_1340) >= uint(_513);
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1356 = ~_1302;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = abs(_1346);
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1360 * as_type<int>(_1210);
    int _1370 = ~_1336;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1366);
    int _1378 = _1374 * as_type<int>(_1202);
    int _1380 = _1378 + _1368;
    int _1382 = ~_1362;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    bool _1388 = !_1352;
    int _1390 = _1388 ? 0 : (-1);
    bool _1392 = !_1062;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1386 * as_type<int>(_1240);
    int _1398 = _1396 + _1380;
    int _1400 = ~_1322;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1394);
    int _1414 = _513 * _1404;
    int _1416 = _1414 + _716;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1214 + _1418;
    int _1422 = _1410 * as_type<int>(_1248);
    int _1424 = _1422 + _1398;
    bool _1426 = !_730;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1432 = _1080 + _1430;
    bool _1434 = !_1058;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1420 * _1420;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1180 + _1440;
    int _1444 = abs(_1428);
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1448 = abs(_1436);
    int _1450 = ~_1444;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1446);
    float _1458 = float(_1448);
    float _1460 = float(_1332);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1456);
    float _1464 = float(_984);
    int _1466 = _1424 * _1454;
    float _1468 = float(_1412);
    float _1470 = fma(_1442, _1442, _1438);
    float _1472 = _1458 * _1460;
    bool _1474 = _1462 >= 0.0;
    float _1476 = _1468 * _1464;
    float _1478 = fma(_1432, _1432, _1470);
    float _1480 = in.m_58.x;
    float _1482 = in.m_58.y;
    float _1484 = in.m_58.z;
    bool _1486 = !_533;
    int _1488 = _1486 ? _1416 : (-1);
    bool _1490 = !_1066;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = rsqrt(_1478);
    int _1496 = _1488 * _1444;
    int _1498 = _1496 + _1466;
    float _1500 = _1472 * (-2.0);
    float _1502 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1504 = _1472;
    if (_1474)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1504;
    float _1508 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = fma(_1018, _1500, _1018);
    float _1512 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1518 = as_type<int>(_1506);
    if (_1474)
    {
        float _1520 = _1506 * 5.0;
        _1518 = as_type<int>(_1520);
    }
    int _1522 = _1518;
    float _1524 = float(_1498);
    float _1526 = _509 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1474)
    {
        out.m_37.x = 0.0;
    }
    float _1528 = _1526 * _1494;
    out.m_60.x = _1514;
    out.m_60.y = _1516;
    out.m_60.z = _1512;
    float _1530 = fma(_1500, _1480, _1480);
    float _1532 = _580 + (-0.5);
    if (_1474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4328 = as_type<float>(_1522);
        out.gl_Position.z = _4328;
    }
    float _1534 = _1442 * _1528;
    float _1536 = _1420 * _1528;
    out.m_62.x = _1524;
    if (_1474)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1538 = -_1536;
    float _1540 = _1214 + _1538;
    float _1542 = _1476 * (-2.0);
    float _1544 = -_1534;
    float _1546 = _1180 + _1544;
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1530);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1552 = _1540 + _1550;
    float _1554 = fma(_1022, _1542, _1022);
    float _1556 = fma(_1542, _1482, _1482);
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1546 + _1558;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1564 = _1432 * _1528;
    int _1566 = abs(_1492);
    float _1568 = _582 + (-0.5);
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1562);
    float _1572 = -_1564;
    float _1574 = _1080 + _1572;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1556);
    float _1578 = float(_1100);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1574 + _1580;
    float _1584 = float(_1566);
    float _1586 = _844 + _580;
    float _1588 = fma(_1554, _922, _1576);
    float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1570);
    float _1592 = _1584 * _1578;
    float _1594 = _1586 + (-1.0);
    float _1596 = -_1536;
    float _1598 = _1420 + _1596;
    bool _1600 = _1590 >= 0.0;
    float _1602 = _1592 * (-2.0);
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1606 = _844 + (-0.5);
    float _1608 = -_1534;
    float _1610 = _1442 + _1608;
    float _1612 = fma(_1602, _1484, _1484);
    float _1614 = _1598 * _1598;
    float _1616 = fma(_1604, _1602, _1604);
    float _1618 = fma(_1510, _922, _1548);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1612);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = -_1564;
    float _1626 = _1432 + _1624;
    float _1628 = _1618 * 0.15915493667125701904296875;
    float _1630 = fma(_1616, _922, _1620);
    float _1632 = _1588 * 0.15915493667125701904296875;
    float _1634 = fma(_1626, _1626, _1622);
    float _1636 = _1626;
    int _1638 = as_type<int>(_1612);
    if (_1600)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1640 = _1636;
    float _1642 = _1630 * 0.15915493667125701904296875;
    float _1644 = _1628 * 6.283185482025146484375;
    float _1646 = sin(_1644);
    if (_1600)
    {
        out.m_37.x = 0.0;
    }
    if (_1600)
    {
        float _1648 = _1640 * 5.0;
        _1638 = as_type<int>(_1648);
    }
    int _1650 = _1638;
    float _1652 = _1628 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4534 = as_type<float>(_1650);
        out.gl_Position.z = _4534;
    }
    float _1656 = _1632 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = sqrt(_1634);
    float _1662 = _1632 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    if (_1600)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1666 = _1642 * 6.283185482025146484375;
    float _1668 = cos(_1666);
    float _1670 = _1494 * _1660;
    float _1672 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1676 = _1646 * _1658;
    float _1678 = _1654 * _1664;
    float _1680 = _1670 * _1672;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1684 = _1642 * 6.283185482025146484375;
    float _1686 = sin(_1684);
    float _1688 = _509 * _1670;
    float _1690 = _1674 * _1680;
    float _1692 = _1682 * _1688;
    float _1694 = _1668 * _1690;
    float _1696 = _1654 * _1658;
    float _1698 = _1658 * _1668;
    float _1700 = _1654 * _1694;
    float _1702 = _1664 * _1668;
    float _1704 = _1646 * _1664;
    float _1706 = _1646 * _1694;
    float _1708 = fma(_1686, _1678, _1676);
    float _1710 = -_1690;
    float _1712 = _1686 * _1710;
    float _1714 = -_1704;
    float _1716 = fma(_1686, _1696, _1714);
    float _1718 = -_1696;
    float _1720 = fma(_1686, _1704, _1718);
    float _1722 = fma(_1708, _1692, _1700);
    float _1724 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1726 = _1724 * 0.5;
    float _1728 = fma(_1702, _1692, _1712);
    float _1730 = fma(_1686, _1676, _1678);
    float _1732 = fma(_1720, _1692, _1706);
    float _1734 = fma(_1716, _1726, _1722);
    float _1736 = fma(_1698, _1726, _1728);
    float _1738 = fma(_1730, _1726, _1732);
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1744 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1746 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1740);
    float _1748 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1742);
    float _1750 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1746);
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1762 = _1080 + _1758;
    float _1764 = _1180 + _1760;
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1770 = _1762 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1764 + _1772;
    float _1776 = _1214 + _1766;
    float _1778 = _1770 * _1770;
    float _1780 = fma(_1774, _1774, _1778);
    float _1782 = sqrt(_1780);
    bool _1784 = _1782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1766;
    float _1788 = _1778;
    float _1790 = _1764;
    if (!_1784)
    {
        _1786 = _1762;
    }
    float _1792 = _1786;
    float _1794 = _1792;
    if (!_1784)
    {
        _1788 = _1776;
    }
    float _1796 = _1788;
    bool _1798 = !_1784;
    float _1800 = _1796;
    if (!_1798)
    {
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1806 = _1782 + _1804;
        float _1808 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = rsqrt(_1780);
        float _1812 = _1806 * _1802;
        float _1814 = _1812 * 0.15915493667125701904296875;
        float _1816 = _1814 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1814 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 + (-1.0);
        float _1826 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = fma(_1822, _1808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = fma(_1776, _1818, _1826);
        float _1832 = _1810 * _1828;
        float _1834 = fma(_1774, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1770, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1800 = _1830;
        _1790 = _1834;
        _1794 = _1836;
    }
    float _1838 = _1800;
    float _1840 = _1790;
    float _1842 = _1794;
    float _1844 = -_1214;
    float _1846 = _1844 + _1838;
    float _1848 = -_1180;
    float _1850 = _1848 + _1840;
    float _1852 = -_1080;
    float _1854 = _1852 + _1842;
    float _1856 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1858 = _1846 * _1846;
    float _1860 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1862 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1864 = isnan(0.5);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1870 = _1866 || _1868;
    float _1872 = fma(_1850, _1850, _1858);
    float _1874 = fma(_1854, _1854, _1872);
    float _1876 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1856);
    float _1878 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1860);
    float _1880 = sqrt(_1874);
    float _1882 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1878);
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1888 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1890 = 1.0 / _1886;
    bool _1892 = _1880 > 0.0;
    float _1894 = _1888 + _1886;
    bool _1896 = !_1892;
    float _1898 = _1838;
    float _1900 = _1840;
    float _1902 = _1842;
    if (!_1896)
    {
        float _1904 = _191 * _191;
        float _1906 = fma(_183, _183, _1904);
        float _1908 = fma(_199, _199, _1906);
        float _1910 = rsqrt(_1874);
        float _1912 = sqrt(_1908);
        float _1914 = _1850 * _1910;
        float _1916 = _1846 * _1910;
        float _1918 = _1854 * _1910;
        bool _1920 = _1912 > 0.0;
        bool _1922 = !_1920;
        if (!_1922)
        {
            float _1924 = rsqrt(_1908);
            float _1926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1928 = _191 * _1924;
            float _1930 = _183 * _1924;
            float _1932 = _1916 * _1928;
            float _1934 = _199 * _1924;
            float _1936 = fma(_1914, _1930, _1932);
            float _1938 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1918, _1934, _1936);
            float _1942 = _1940 * _1938;
            float _1944 = fma(_183, _1942, _1840);
            float _1946 = fma(_191, _1942, _1838);
            float _1948 = fma(_199, _1942, _1842);
            _1898 = _1946;
            _1900 = _1944;
            _1902 = _1948;
        }
    }
    float _1950 = _1898;
    float _1952 = _1900;
    float _1954 = _1902;
    float _1956 = -_1536;
    float _1958 = _1956 + _1950;
    float _1960 = _1894 * _1890;
    float _1962 = _1960 * 0.5;
    float _1964 = -_1534;
    float _1966 = _1964 + _1952;
    float _1968 = -_1564;
    float _1970 = _1968 + _1954;
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1974 = _1950;
    if (_1870)
    {
        _1974 = 1.0;
    }
    float _1976 = _1974;
    float _1978 = _1976;
    if (!_1870)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1982 * 0.15915493667125701904296875;
        float _1988 = _1984 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1994 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
        float _1996 = _1984 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = 1.0 / _1990;
        float _2002 = _1986 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = _1986 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = 1.0 / _1994;
        float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2018 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2016;
        float _2020 = 1.0 / _2012;
        float _2022 = 1.0 / _2018;
        float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2026 = _2014 * _2024;
        float _2028 = _2010 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_2028, _2026, _2030);
        float _2034 = _2032 * _2022;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _1978 = _2036;
    }
    float _2038 = _1978;
    float _2040 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1972);
    float _2044 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2052 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2054 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2056 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2062 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2066);
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2078);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2080);
    float _2092 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    bool _2094 = _2038 > 0.0;
    bool _2096 = isnan(_2038);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2116 = _2106 + _2110;
    float _2118 = _2112 + _2110;
    float _2120 = _2110 * 0.5;
    float _2122 = _2116 * 0.5;
    float _2124 = _2118 * 0.5;
    float _2126 = fma(_2108, -0.5, _2120);
    out.m_37.x = _2114;
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2112;
    out.gl_Position.w = _2110;
    out.m_64.x = _2122;
    out.m_64.y = _2126;
    out.m_64.z = _2124;
    out.m_64.w = _2110;
    if (_2102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2128;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_30.w;
    float _80 = in.m_32.w;
    float _82 = trunc(_78);
    int _85 = int(_82);
    float _87 = -_80;
    float _89 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _89;
    bool _93 = _85 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_85);
    float _99 = _89;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    if (!_93)
    {
        out.m_37.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2197 = as_type<float>(_107);
        out.gl_Position.z = _2197;
    }
    if (!_93)
    {
        return out;
    }
    bool _111 = _80 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_80);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = float(_85);
    bool _123 = _89 >= _121;
    bool _125 = !_119;
    bool _127 = _123 || _125;
    if (_127)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _97;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _109 = as_type<int>(_131);
    }
    int _133 = _109;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_133);
        out.gl_Position.z = _2252;
    }
    if (_127)
    {
        return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / _121;
    float _139 = in.m_42.x;
    float _141 = in.m_42.y;
    float _143 = in.m_42.z;
    float _145 = in.m_44.x;
    float _147 = in.m_44.y;
    float _149 = in.m_44.z;
    float _151 = in.m_46.x;
    float _153 = in.m_46.y;
    float _155 = in.m_46.z;
    float _157 = in.m_48.x;
    float _159 = in.m_48.y;
    float _161 = in.m_48.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _141 * _147;
    float _175 = _141 * _153;
    float _177 = fma(_139, _145, _173);
    float _179 = _141 * _159;
    float _181 = fma(_139, _151, _175);
    float _183 = fma(_143, _149, _177);
    bool _185 = !_165;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_139, _157, _179);
    float _191 = fma(_143, _155, _181);
    float _193 = _89 * _137;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_143, _161, _189);
    bool _201 = !_171;
    float _219;
    if (!_201)
    {
        float _203 = in.m_50.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _89);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _193;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_50.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _89);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _193;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = isnan(_319);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _323;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _347 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = isnan(_319);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -_339;
    float _365 = _363 + 1.0;
    bool _367 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_319);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _381 = 1.0 / _327;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _387 = _357 * _365;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = _377 * _391;
    float _395 = 1.0 / _345;
    float _397 = _361 * _341;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _319 + _399;
    float _403 = -_377;
    float _405 = _403 + 1.0;
    float _407 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _319 + _409;
    float _413 = _385 * _381;
    bool _415 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _417 = isnan(_319);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _427;
    float _431 = _407 * _393;
    float _433 = fma(_413, _411, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _319 + _435;
    float _439 = -_425;
    float _441 = _439 + 1.0;
    float _443 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[115].x, _431);
    float _445 = _429 * _395;
    float _447 = _339 * _441;
    float _449 = fma(_433, _387, _443);
    float _451 = fma(_445, _437, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = fma(_451, _447, _449);
    float _457 = in.m_52.x;
    float _459 = in.m_52.y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[118].x, _455);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _461;
    out.m_54.y = _471;
    out.m_54.z = _473;
    out.m_54.w = _469;
    float _475 = _295 * _459;
    float _477 = _293 * _457;
    bool _479 = !_379;
    float _497;
    if (!_479)
    {
        float _481 = in.m_50.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].z, _89);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _193;
    }
    _499 = false;
    float _501 = _497;
    float _503 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _505 = int(_503);
    float _507 = in.m_46.w;
    float _509 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _513 = int(_511);
    float _515 = float(_505);
    float _517 = 1.0 / _515;
    float _519 = float(uint(_513));
    int _521 = ~_513;
    int _523 = _521 + 1;
    int _525 = ~_513;
    int _527 = _525 + 1;
    float _529 = 1.0 / _519;
    float _531 = float(_513);
    bool _533 = _513 == 0;
    int _535 = ~_513;
    int _537 = _535 + 1;
    float _539 = _517 * _89;
    float _541 = trunc(_539);
    int _543 = int(_541);
    int _545 = as_type<int>(_529) + (-2);
    float _547 = float(uint(_543));
    float _549 = float(_543);
    float _551 = as_type<float>(_545) * _547;
    bool _553 = _549 >= _531;
    bool _555 = isnan(_549);
    bool _557 = _553 || _555;
    bool _559 = isnan(_531);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = trunc(_551);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    float _572 = trunc(_563);
    int _574 = int(_572);
    int _576 = _523 * int(_570);
    int _578 = _576 + _543;
    float _580 = in.m_50.x;
    float _582 = in.m_50.y;
    float _584 = float(uint(_578));
    float _586 = as_type<float>(_545) * _584;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _592 = uint(_590);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    bool _598 = !_596;
    float _600 = _598 ? 7.345489978790283203125 : 1.0;
    float _602 = _600 * _580;
    int _604 = int(_570) + int(_592);
    float _606 = floor(_602);
    int _608 = _527 * _604;
    int _610 = _608 + _543;
    bool _612 = uint(_610) >= uint(_513);
    bool _614 = !_612;
    int _616 = _614 ? 0 : (-1);
    int _618 = ~_604;
    int _620 = _618 + _616;
    int _622 = _620 + 1;
    float _624 = -_606;
    float _626 = _602 + _624;
    int _628 = _513 * _622;
    int _630 = _628 + _543;
    int _632 = ~_574;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * _531;
    float _640 = _531 * _89;
    bool _642 = !_533;
    int _644 = _642 ? _630 : (-1);
    float _646 = _640 * _137;
    float _648 = trunc(_638);
    int _650 = int(_648);
    int _652 = _644 * _636;
    int _654 = _513 + (-1);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _670 = _668 != 0;
    int _672 = _574 * _654;
    int _674 = _672 + _652;
    float _676 = trunc(_646);
    int _678 = int(_676);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_682);
    bool _690 = !_666;
    int _692 = _690 ? 0 : 1;
    bool _694 = !_670;
    int _696 = _694 ? 0 : 1;
    int _698 = _674 * _688;
    int _700 = abs(_686);
    int _702 = abs(_692);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _706 = _704 != 0;
    int _708 = abs(_696);
    bool _710 = !_706;
    int _712 = _710 ? 0 : 1;
    int _714 = _650 * _708;
    int _716 = _714 + _543;
    int _718 = _678 * _700;
    int _720 = _718 + _698;
    int _722 = abs(_712);
    float _724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _726 = log2(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _730 = _728 != 0;
    int _732 = _716 * _702;
    int _734 = _732 + _720;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _742 = _740 != 0;
    int _744 = _650 * _722;
    int _746 = _744 + _734;
    int _748 = ~_513;
    int _750 = _748 + 1;
    bool _752 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(1.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = float(uint(_746));
    bool _768 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _776 = _772 || _774;
    float _778 = 1.0 / _764;
    float _780 = as_type<float>(_545) * _766;
    float _782 = in.m_30.x;
    float _784 = in.m_30.y;
    float _786 = in.m_30.z;
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _750 * int(_792);
    int _796 = _794 + _746;
    float _798 = _147 * _784;
    float _800 = float(uint(_796));
    float _802 = _159 * _784;
    float _804 = fma(_145, _782, _798);
    float _806 = as_type<float>(_545) * _800;
    float _808 = _153 * _784;
    float _810 = _726 * _89;
    float _812 = trunc(_806);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _824 = fma(_157, _782, _802);
    float _826 = exp2(_810);
    float _828 = fma(_151, _782, _808);
    float _830 = _580 * 2.0;
    float _832 = _582 * 2.0;
    float _834 = fma(_155, _786, _828);
    int _836 = int(_792) + int(_816);
    float _838 = _582 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _840 = floor(_830);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = in.m_50.z;
    int _846 = _537 * _836;
    int _848 = _846 + _746;
    float _850 = fma(_838, -2.0, _820);
    float _852 = -_826;
    float _854 = _852 + 1.0;
    bool _856 = uint(_848) >= uint(_513);
    float _858 = -_822;
    float _860 = fma(_818, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _864 = _776 ? _854 : 0.0;
    float _866 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    bool _868 = !_856;
    int _870 = _868 ? 0 : (-1);
    float _872 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _862);
    bool _874 = _840 >= 0.0;
    bool _876 = isnan(_840);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_836;
    int _886 = _884 + _870;
    int _888 = _886 + 1;
    float _890 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    int _892 = _513 * _888;
    int _894 = _892 + _746;
    float _896 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = -_890;
    float _908 = _906 + 1.0;
    bool _910 = !_533;
    int _912 = _910 ? _894 : (-1);
    float _914 = -_89;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _918 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    if (_760)
    {
        float _920 = _864 * _778;
        _99 = _920;
    }
    float _922 = _99;
    int _924 = _912 & 3;
    bool _926 = _924 != 0;
    float _928 = 1.0 / _900;
    int _930 = _882 ? 0 : 1;
    float _932 = in.m_48.w;
    int _934 = _926 ? 0 : 1;
    int _936 = _912 & 3;
    bool _938 = _936 != 0;
    bool _940 = _840 > 0.0;
    float _942 = floor(_832);
    bool _944 = uint(_936) > 1u;
    float _946 = fma(_149, _786, _804);
    float _948 = fma(_161, _786, _824);
    int _950 = ~_934;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = _501 + _956;
    int _960 = ~_930;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _582 + _844;
    float _968 = 1.0 / _904;
    float _970 = _958 * _928;
    float _972 = _582 + _580;
    float _974 = _966 + (-1.0);
    int _976 = _964;
    int _978 = _954;
    if (!_940)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _976 = _982;
    }
    int _984 = _976;
    float _986 = _844 * 2.0;
    if (!_944)
    {
        int _988 = ~_934;
        int _990 = _988 + 1;
        _978 = _990;
    }
    int _992 = _978;
    float _994 = _972 + (-1.0);
    bool _996 = _580 > 0.5;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _998;
    bool _1002 = _942 >= 0.0;
    bool _1004 = isnan(_942);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.0);
    bool _1010 = _1006 || _1008;
    float _1012 = floor(_986);
    float _1014 = -_187;
    int _1016 = _996 ? as_type<int>(_1014) : as_type<int>(_187);
    float _1018 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1020 = _582 > 0.5;
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1024 = _1010 ? 0 : 1;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _501 + _1026;
    float _1030 = -_197;
    int _1032 = _1020 ? as_type<int>(_1030) : as_type<int>(_197);
    float _1034 = fma(_1000, _970, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1036 = _942 > 0.0;
    float _1038 = _1028 * _968;
    bool _1040 = !_738;
    float _1042 = _1040 ? _187 : as_type<float>(_1016);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1048 = !_742;
    float _1050 = _1048 ? _197 : as_type<float>(_1032);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1066 = _1064 != 0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1072 = ~_1024;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    float _1078 = fma(_1054, _970, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1080 = _948 + _932;
    bool _1082 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1084 = isnan(_501);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = _1076;
    if (!_1036)
    {
        int _1096 = ~_1024;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1102;
    bool _1106 = _1012 >= 0.0;
    bool _1108 = isnan(_1012);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_44.w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1122 = fma(_1104, _970, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = _1012 > 0.0;
    float _1128 = fma(_1120, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1130 = float(uint(_716));
    float _1132 = -_1092;
    float _1134 = _1132 + 1.0;
    int _1136 = _912 >> 31;
    float _1138 = as_type<float>(_545) * _1130;
    int _1140 = _1136 & 3;
    float _1142 = fma(_1070, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1144 = fma(_1046, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_501);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = trunc(_1138);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = _912 + _1140;
    bool _1166 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1168 = isnan(_501);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1164 >> 2;
    float _1180 = _946 + _1116;
    int _1182 = ~_513;
    int _1184 = _1182 + 1;
    float _1186 = _1176 * _1134;
    int _1188 = _1178 << 4;
    int _1190 = _1188 + 368;
    float _1192 = -_1176;
    float _1194 = _1192 + 1.0;
    uint _1196 = uint(int(uint(_1190) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[int(_1206)][_1208];
    float _1212 = _1156 * _1194;
    float _1214 = _834 + _507;
    int _1216 = _1184 * int(_1162);
    int _1218 = _1216 + _716;
    float _1220 = -_1156;
    float _1222 = _1220 + 1.0;
    float _1224 = _1078 * _1212;
    float _1226 = _1122 * _1212;
    float _1228 = _1042 + 0.5;
    float _1230 = float(uint(_1218));
    int _1232 = _1190 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    float _1250 = _1034 * _1212;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[80].x, _916);
    bool _1254 = !_938;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = as_type<float>(_545) * _1230;
    float _1260 = _1050 + (-0.5);
    bool _1262 = uint(_936) >= 2u;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1260;
    float _1274 = -_866;
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1274);
    float _1278 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1226);
    float _1280 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1250);
    int _1282 = ~_513;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1142, _1186, _1264);
    float _1288 = fma(_1128, _1186, _1278);
    int _1290 = _1262 ? 0 : 1;
    float _1292 = -_918;
    float _1294 = _1292 + 1.0;
    bool _1296 = _936 != 3;
    float _1298 = -_908;
    float _1300 = fma(_1042, _1298, _1252);
    int _1302 = abs(_992);
    float _1304 = fma(_1050, _1294, _1276);
    int _1306 = ~_1124;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1144, _1186, _1280);
    int _1314 = ~_1290;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1288);
    int _1322 = int(_1162) + int(_1270);
    out.m_56.x = _1300;
    out.m_56.y = _1304;
    int _1324 = _1310;
    int _1326 = _1318;
    if (!_1126)
    {
        int _1328 = ~_1124;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1286);
    int _1336 = abs(_1256);
    int _1338 = _1284 * _1322;
    int _1340 = _1338 + _716;
    if (_1296)
    {
        int _1342 = ~_1290;
        int _1344 = _1342 + 1;
        _1326 = _1344;
    }
    int _1346 = _1326;
    float _1348 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1312);
    bool _1350 = _936 != 3;
    bool _1352 = uint(_1340) >= uint(_513);
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1356 = ~_1302;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = abs(_1346);
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1360 * as_type<int>(_1210);
    int _1370 = ~_1336;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1366);
    int _1378 = _1374 * as_type<int>(_1202);
    int _1380 = _1378 + _1368;
    int _1382 = ~_1362;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    bool _1388 = !_1352;
    int _1390 = _1388 ? 0 : (-1);
    bool _1392 = !_1062;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1386 * as_type<int>(_1240);
    int _1398 = _1396 + _1380;
    int _1400 = ~_1322;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1394);
    int _1414 = _513 * _1404;
    int _1416 = _1414 + _716;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1214 + _1418;
    int _1422 = _1410 * as_type<int>(_1248);
    int _1424 = _1422 + _1398;
    bool _1426 = !_730;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1432 = _1080 + _1430;
    bool _1434 = !_1058;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1420 * _1420;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1180 + _1440;
    int _1444 = abs(_1428);
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1448 = abs(_1436);
    int _1450 = ~_1444;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1446);
    float _1458 = float(_1448);
    float _1460 = float(_1332);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1456);
    float _1464 = float(_984);
    int _1466 = _1424 * _1454;
    float _1468 = float(_1412);
    float _1470 = fma(_1442, _1442, _1438);
    float _1472 = _1458 * _1460;
    bool _1474 = _1462 >= 0.0;
    float _1476 = _1468 * _1464;
    float _1478 = fma(_1432, _1432, _1470);
    float _1480 = in.m_58.x;
    float _1482 = in.m_58.y;
    float _1484 = in.m_58.z;
    bool _1486 = !_533;
    int _1488 = _1486 ? _1416 : (-1);
    bool _1490 = !_1066;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = rsqrt(_1478);
    int _1496 = _1488 * _1444;
    int _1498 = _1496 + _1466;
    float _1500 = _1472 * (-2.0);
    float _1502 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1504 = _1472;
    if (_1474)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1504;
    float _1508 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = fma(_1018, _1500, _1018);
    float _1512 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1518 = as_type<int>(_1506);
    if (_1474)
    {
        float _1520 = _1506 * 5.0;
        _1518 = as_type<int>(_1520);
    }
    int _1522 = _1518;
    float _1524 = float(_1498);
    float _1526 = _509 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1474)
    {
        out.m_37.x = 0.0;
    }
    float _1528 = _1526 * _1494;
    out.m_60.x = _1514;
    out.m_60.y = _1516;
    out.m_60.z = _1512;
    float _1530 = fma(_1500, _1480, _1480);
    float _1532 = _580 + (-0.5);
    if (_1474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4328 = as_type<float>(_1522);
        out.gl_Position.z = _4328;
    }
    float _1534 = _1442 * _1528;
    float _1536 = _1420 * _1528;
    out.m_62.x = _1524;
    if (_1474)
    {
        return out;
    }
    float _1538 = -_1536;
    float _1540 = _1214 + _1538;
    float _1542 = _1476 * (-2.0);
    float _1544 = -_1534;
    float _1546 = _1180 + _1544;
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1530);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1552 = _1540 + _1550;
    float _1554 = fma(_1022, _1542, _1022);
    float _1556 = fma(_1542, _1482, _1482);
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1546 + _1558;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1564 = _1432 * _1528;
    int _1566 = abs(_1492);
    float _1568 = _582 + (-0.5);
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1562);
    float _1572 = -_1564;
    float _1574 = _1080 + _1572;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1556);
    float _1578 = float(_1100);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1574 + _1580;
    float _1584 = float(_1566);
    float _1586 = _844 + _580;
    float _1588 = fma(_1554, _922, _1576);
    float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1570);
    float _1592 = _1584 * _1578;
    float _1594 = _1586 + (-1.0);
    float _1596 = -_1536;
    float _1598 = _1420 + _1596;
    bool _1600 = _1590 >= 0.0;
    float _1602 = _1592 * (-2.0);
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1606 = _844 + (-0.5);
    float _1608 = -_1534;
    float _1610 = _1442 + _1608;
    float _1612 = fma(_1602, _1484, _1484);
    float _1614 = _1598 * _1598;
    float _1616 = fma(_1604, _1602, _1604);
    float _1618 = fma(_1510, _922, _1548);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1612);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = -_1564;
    float _1626 = _1432 + _1624;
    float _1628 = _1618 * 0.15915493667125701904296875;
    float _1630 = fma(_1616, _922, _1620);
    float _1632 = _1588 * 0.15915493667125701904296875;
    float _1634 = fma(_1626, _1626, _1622);
    float _1636 = _1626;
    int _1638 = as_type<int>(_1612);
    if (_1600)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1640 = _1636;
    float _1642 = _1630 * 0.15915493667125701904296875;
    float _1644 = _1628 * 6.283185482025146484375;
    float _1646 = sin(_1644);
    if (_1600)
    {
        out.m_37.x = 0.0;
    }
    if (_1600)
    {
        float _1648 = _1640 * 5.0;
        _1638 = as_type<int>(_1648);
    }
    int _1650 = _1638;
    float _1652 = _1628 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4534 = as_type<float>(_1650);
        out.gl_Position.z = _4534;
    }
    float _1656 = _1632 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = sqrt(_1634);
    float _1662 = _1632 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    if (_1600)
    {
        return out;
    }
    float _1666 = _1642 * 6.283185482025146484375;
    float _1668 = cos(_1666);
    float _1670 = _1494 * _1660;
    float _1672 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1676 = _1646 * _1658;
    float _1678 = _1654 * _1664;
    float _1680 = _1670 * _1672;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1684 = _1642 * 6.283185482025146484375;
    float _1686 = sin(_1684);
    float _1688 = _509 * _1670;
    float _1690 = _1674 * _1680;
    float _1692 = _1682 * _1688;
    float _1694 = _1668 * _1690;
    float _1696 = _1654 * _1658;
    float _1698 = _1658 * _1668;
    float _1700 = _1654 * _1694;
    float _1702 = _1664 * _1668;
    float _1704 = _1646 * _1664;
    float _1706 = _1646 * _1694;
    float _1708 = fma(_1686, _1678, _1676);
    float _1710 = -_1690;
    float _1712 = _1686 * _1710;
    float _1714 = -_1704;
    float _1716 = fma(_1686, _1696, _1714);
    float _1718 = -_1696;
    float _1720 = fma(_1686, _1704, _1718);
    float _1722 = fma(_1708, _1692, _1700);
    float _1724 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1726 = _1724 * 0.5;
    float _1728 = fma(_1702, _1692, _1712);
    float _1730 = fma(_1686, _1676, _1678);
    float _1732 = fma(_1720, _1692, _1706);
    float _1734 = fma(_1716, _1726, _1722);
    float _1736 = fma(_1698, _1726, _1728);
    float _1738 = fma(_1730, _1726, _1732);
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1744 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1746 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1740);
    float _1748 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1742);
    float _1750 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1746);
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1762 = _1080 + _1758;
    float _1764 = _1180 + _1760;
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1770 = _1762 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1764 + _1772;
    float _1776 = _1214 + _1766;
    float _1778 = _1770 * _1770;
    float _1780 = fma(_1774, _1774, _1778);
    float _1782 = sqrt(_1780);
    bool _1784 = _1782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1766;
    float _1788 = _1778;
    float _1790 = _1764;
    if (!_1784)
    {
        _1786 = _1762;
    }
    float _1792 = _1786;
    float _1794 = _1792;
    if (!_1784)
    {
        _1788 = _1776;
    }
    float _1796 = _1788;
    bool _1798 = !_1784;
    float _1800 = _1796;
    if (!_1798)
    {
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1806 = _1782 + _1804;
        float _1808 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = rsqrt(_1780);
        float _1812 = _1806 * _1802;
        float _1814 = _1812 * 0.15915493667125701904296875;
        float _1816 = _1814 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1814 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 + (-1.0);
        float _1826 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = fma(_1822, _1808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = fma(_1776, _1818, _1826);
        float _1832 = _1810 * _1828;
        float _1834 = fma(_1774, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1770, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1800 = _1830;
        _1790 = _1834;
        _1794 = _1836;
    }
    float _1838 = _1800;
    float _1840 = _1790;
    float _1842 = _1794;
    float _1844 = -_1214;
    float _1846 = _1844 + _1838;
    float _1848 = -_1180;
    float _1850 = _1848 + _1840;
    float _1852 = -_1080;
    float _1854 = _1852 + _1842;
    float _1856 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1858 = _1846 * _1846;
    float _1860 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1862 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1864 = isnan(0.5);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1870 = _1866 || _1868;
    float _1872 = fma(_1850, _1850, _1858);
    float _1874 = fma(_1854, _1854, _1872);
    float _1876 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1856);
    float _1878 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1860);
    float _1880 = sqrt(_1874);
    float _1882 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1878);
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1888 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1890 = 1.0 / _1886;
    bool _1892 = _1880 > 0.0;
    float _1894 = _1888 + _1886;
    bool _1896 = !_1892;
    float _1898 = _1838;
    float _1900 = _1840;
    float _1902 = _1842;
    if (!_1896)
    {
        float _1904 = _191 * _191;
        float _1906 = fma(_183, _183, _1904);
        float _1908 = fma(_199, _199, _1906);
        float _1910 = rsqrt(_1874);
        float _1912 = sqrt(_1908);
        float _1914 = _1850 * _1910;
        float _1916 = _1846 * _1910;
        float _1918 = _1854 * _1910;
        bool _1920 = _1912 > 0.0;
        bool _1922 = !_1920;
        if (!_1922)
        {
            float _1924 = rsqrt(_1908);
            float _1926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1928 = _191 * _1924;
            float _1930 = _183 * _1924;
            float _1932 = _1916 * _1928;
            float _1934 = _199 * _1924;
            float _1936 = fma(_1914, _1930, _1932);
            float _1938 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1918, _1934, _1936);
            float _1942 = _1940 * _1938;
            float _1944 = fma(_183, _1942, _1840);
            float _1946 = fma(_191, _1942, _1838);
            float _1948 = fma(_199, _1942, _1842);
            _1898 = _1946;
            _1900 = _1944;
            _1902 = _1948;
        }
    }
    float _1950 = _1898;
    float _1952 = _1900;
    float _1954 = _1902;
    float _1956 = -_1536;
    float _1958 = _1956 + _1950;
    float _1960 = _1894 * _1890;
    float _1962 = _1960 * 0.5;
    float _1964 = -_1534;
    float _1966 = _1964 + _1952;
    float _1968 = -_1564;
    float _1970 = _1968 + _1954;
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1974 = _1950;
    if (_1870)
    {
        _1974 = 1.0;
    }
    float _1976 = _1974;
    float _1978 = _1976;
    if (!_1870)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1982 * 0.15915493667125701904296875;
        float _1988 = _1984 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1994 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
        float _1996 = _1984 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = 1.0 / _1990;
        float _2002 = _1986 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = _1986 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = 1.0 / _1994;
        float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2018 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2016;
        float _2020 = 1.0 / _2012;
        float _2022 = 1.0 / _2018;
        float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2026 = _2014 * _2024;
        float _2028 = _2010 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_2028, _2026, _2030);
        float _2034 = _2032 * _2022;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _1978 = _2036;
    }
    float _2038 = _1978;
    float _2040 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1972);
    float _2044 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2052 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2054 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2056 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2062 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2066);
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2078);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2080);
    float _2092 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    bool _2094 = _2038 > 0.0;
    bool _2096 = isnan(_2038);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2116 = _2106 + _2110;
    float _2118 = _2112 + _2110;
    float _2120 = _2110 * 0.5;
    float _2122 = _2116 * 0.5;
    float _2124 = _2118 * 0.5;
    float _2126 = fma(_2108, -0.5, _2120);
    out.m_37.x = _2114;
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2112;
    out.gl_Position.w = _2110;
    out.m_64.x = _2122;
    out.m_64.y = _2126;
    out.m_64.z = _2124;
    out.m_64.w = _2110;
    if (_2102)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2128;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_30.w;
    float _80 = in.m_32.w;
    float _82 = trunc(_78);
    int _85 = int(_82);
    float _87 = -_80;
    float _89 = _87 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _89;
    bool _93 = _85 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_85);
    float _99 = _89;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    if (!_93)
    {
        out.m_37.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2197 = as_type<float>(_107);
        out.gl_Position.z = _2197;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _111 = _80 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_80);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = float(_85);
    bool _123 = _89 >= _121;
    bool _125 = !_119;
    bool _127 = _123 || _125;
    if (_127)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _97;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _109 = as_type<int>(_131);
    }
    int _133 = _109;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_133);
        out.gl_Position.z = _2252;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / _121;
    float _139 = in.m_42.x;
    float _141 = in.m_42.y;
    float _143 = in.m_42.z;
    float _145 = in.m_44.x;
    float _147 = in.m_44.y;
    float _149 = in.m_44.z;
    float _151 = in.m_46.x;
    float _153 = in.m_46.y;
    float _155 = in.m_46.z;
    float _157 = in.m_48.x;
    float _159 = in.m_48.y;
    float _161 = in.m_48.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _141 * _147;
    float _175 = _141 * _153;
    float _177 = fma(_139, _145, _173);
    float _179 = _141 * _159;
    float _181 = fma(_139, _151, _175);
    float _183 = fma(_143, _149, _177);
    bool _185 = !_165;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_139, _157, _179);
    float _191 = fma(_143, _155, _181);
    float _193 = _89 * _137;
    bool _195 = !_169;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_143, _161, _189);
    bool _201 = !_171;
    float _219;
    if (!_201)
    {
        float _203 = in.m_50.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _89);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _193;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_50.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _89);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _193;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _329 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = isnan(_319);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _323;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _347 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _349 = isnan(_319);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -_339;
    float _365 = _363 + 1.0;
    bool _367 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_319);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _381 = 1.0 / _327;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _387 = _357 * _365;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    float _393 = _377 * _391;
    float _395 = 1.0 / _345;
    float _397 = _361 * _341;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _319 + _399;
    float _403 = -_377;
    float _405 = _403 + 1.0;
    float _407 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _319 + _409;
    float _413 = _385 * _381;
    bool _415 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _417 = isnan(_319);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _427;
    float _431 = _407 * _393;
    float _433 = fma(_413, _411, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _319 + _435;
    float _439 = -_425;
    float _441 = _439 + 1.0;
    float _443 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[115].x, _431);
    float _445 = _429 * _395;
    float _447 = _339 * _441;
    float _449 = fma(_433, _387, _443);
    float _451 = fma(_445, _437, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = fma(_451, _447, _449);
    float _457 = in.m_52.x;
    float _459 = in.m_52.y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[118].x, _455);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _461;
    out.m_54.y = _471;
    out.m_54.z = _473;
    out.m_54.w = _469;
    float _475 = _295 * _459;
    float _477 = _293 * _457;
    bool _479 = !_379;
    float _497;
    if (!_479)
    {
        float _481 = in.m_50.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].z, _89);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _193;
    }
    _499 = false;
    float _501 = _497;
    float _503 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _505 = int(_503);
    float _507 = in.m_46.w;
    float _509 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _513 = int(_511);
    float _515 = float(_505);
    float _517 = 1.0 / _515;
    float _519 = float(uint(_513));
    int _521 = ~_513;
    int _523 = _521 + 1;
    int _525 = ~_513;
    int _527 = _525 + 1;
    float _529 = 1.0 / _519;
    float _531 = float(_513);
    bool _533 = _513 == 0;
    int _535 = ~_513;
    int _537 = _535 + 1;
    float _539 = _517 * _89;
    float _541 = trunc(_539);
    int _543 = int(_541);
    int _545 = as_type<int>(_529) + (-2);
    float _547 = float(uint(_543));
    float _549 = float(_543);
    float _551 = as_type<float>(_545) * _547;
    bool _553 = _549 >= _531;
    bool _555 = isnan(_549);
    bool _557 = _553 || _555;
    bool _559 = isnan(_531);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = trunc(_551);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    float _572 = trunc(_563);
    int _574 = int(_572);
    int _576 = _523 * int(_570);
    int _578 = _576 + _543;
    float _580 = in.m_50.x;
    float _582 = in.m_50.y;
    float _584 = float(uint(_578));
    float _586 = as_type<float>(_545) * _584;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _592 = uint(_590);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _596 = _594 != 0;
    bool _598 = !_596;
    float _600 = _598 ? 7.345489978790283203125 : 1.0;
    float _602 = _600 * _580;
    int _604 = int(_570) + int(_592);
    float _606 = floor(_602);
    int _608 = _527 * _604;
    int _610 = _608 + _543;
    bool _612 = uint(_610) >= uint(_513);
    bool _614 = !_612;
    int _616 = _614 ? 0 : (-1);
    int _618 = ~_604;
    int _620 = _618 + _616;
    int _622 = _620 + 1;
    float _624 = -_606;
    float _626 = _602 + _624;
    int _628 = _513 * _622;
    int _630 = _628 + _543;
    int _632 = ~_574;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * _531;
    float _640 = _531 * _89;
    bool _642 = !_533;
    int _644 = _642 ? _630 : (-1);
    float _646 = _640 * _137;
    float _648 = trunc(_638);
    int _650 = int(_648);
    int _652 = _644 * _636;
    int _654 = _513 + (-1);
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _670 = _668 != 0;
    int _672 = _574 * _654;
    int _674 = _672 + _652;
    float _676 = trunc(_646);
    int _678 = int(_676);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_658;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_682);
    bool _690 = !_666;
    int _692 = _690 ? 0 : 1;
    bool _694 = !_670;
    int _696 = _694 ? 0 : 1;
    int _698 = _674 * _688;
    int _700 = abs(_686);
    int _702 = abs(_692);
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _706 = _704 != 0;
    int _708 = abs(_696);
    bool _710 = !_706;
    int _712 = _710 ? 0 : 1;
    int _714 = _650 * _708;
    int _716 = _714 + _543;
    int _718 = _678 * _700;
    int _720 = _718 + _698;
    int _722 = abs(_712);
    float _724 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _726 = log2(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _730 = _728 != 0;
    int _732 = _716 * _702;
    int _734 = _732 + _720;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _742 = _740 != 0;
    int _744 = _650 * _722;
    int _746 = _744 + _734;
    int _748 = ~_513;
    int _750 = _748 + 1;
    bool _752 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(1.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = float(uint(_746));
    bool _768 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _776 = _772 || _774;
    float _778 = 1.0 / _764;
    float _780 = as_type<float>(_545) * _766;
    float _782 = in.m_30.x;
    float _784 = in.m_30.y;
    float _786 = in.m_30.z;
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _750 * int(_792);
    int _796 = _794 + _746;
    float _798 = _147 * _784;
    float _800 = float(uint(_796));
    float _802 = _159 * _784;
    float _804 = fma(_145, _782, _798);
    float _806 = as_type<float>(_545) * _800;
    float _808 = _153 * _784;
    float _810 = _726 * _89;
    float _812 = trunc(_806);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _824 = fma(_157, _782, _802);
    float _826 = exp2(_810);
    float _828 = fma(_151, _782, _808);
    float _830 = _580 * 2.0;
    float _832 = _582 * 2.0;
    float _834 = fma(_155, _786, _828);
    int _836 = int(_792) + int(_816);
    float _838 = _582 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _840 = floor(_830);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = in.m_50.z;
    int _846 = _537 * _836;
    int _848 = _846 + _746;
    float _850 = fma(_838, -2.0, _820);
    float _852 = -_826;
    float _854 = _852 + 1.0;
    bool _856 = uint(_848) >= uint(_513);
    float _858 = -_822;
    float _860 = fma(_818, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _864 = _776 ? _854 : 0.0;
    float _866 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[76].y, _850);
    bool _868 = !_856;
    int _870 = _868 ? 0 : (-1);
    float _872 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _862);
    bool _874 = _840 >= 0.0;
    bool _876 = isnan(_840);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_836;
    int _886 = _884 + _870;
    int _888 = _886 + 1;
    float _890 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    int _892 = _513 * _888;
    int _894 = _892 + _746;
    float _896 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = -_890;
    float _908 = _906 + 1.0;
    bool _910 = !_533;
    int _912 = _910 ? _894 : (-1);
    float _914 = -_89;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _918 = fma(_89, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    if (_760)
    {
        float _920 = _864 * _778;
        _99 = _920;
    }
    float _922 = _99;
    int _924 = _912 & 3;
    bool _926 = _924 != 0;
    float _928 = 1.0 / _900;
    int _930 = _882 ? 0 : 1;
    float _932 = in.m_48.w;
    int _934 = _926 ? 0 : 1;
    int _936 = _912 & 3;
    bool _938 = _936 != 0;
    bool _940 = _840 > 0.0;
    float _942 = floor(_832);
    bool _944 = uint(_936) > 1u;
    float _946 = fma(_149, _786, _804);
    float _948 = fma(_161, _786, _824);
    int _950 = ~_934;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = _501 + _956;
    int _960 = ~_930;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _582 + _844;
    float _968 = 1.0 / _904;
    float _970 = _958 * _928;
    float _972 = _582 + _580;
    float _974 = _966 + (-1.0);
    int _976 = _964;
    int _978 = _954;
    if (!_940)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _976 = _982;
    }
    int _984 = _976;
    float _986 = _844 * 2.0;
    if (!_944)
    {
        int _988 = ~_934;
        int _990 = _988 + 1;
        _978 = _990;
    }
    int _992 = _978;
    float _994 = _972 + (-1.0);
    bool _996 = _580 > 0.5;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _998;
    bool _1002 = _942 >= 0.0;
    bool _1004 = isnan(_942);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.0);
    bool _1010 = _1006 || _1008;
    float _1012 = floor(_986);
    float _1014 = -_187;
    int _1016 = _996 ? as_type<int>(_1014) : as_type<int>(_187);
    float _1018 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1020 = _582 > 0.5;
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1024 = _1010 ? 0 : 1;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _501 + _1026;
    float _1030 = -_197;
    int _1032 = _1020 ? as_type<int>(_1030) : as_type<int>(_197);
    float _1034 = fma(_1000, _970, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1036 = _942 > 0.0;
    float _1038 = _1028 * _968;
    bool _1040 = !_738;
    float _1042 = _1040 ? _187 : as_type<float>(_1016);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1048 = !_742;
    float _1050 = _1048 ? _197 : as_type<float>(_1032);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1066 = _1064 != 0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1072 = ~_1024;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    float _1078 = fma(_1054, _970, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1080 = _948 + _932;
    bool _1082 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1084 = isnan(_501);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    int _1094 = _1076;
    if (!_1036)
    {
        int _1096 = ~_1024;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1102;
    bool _1106 = _1012 >= 0.0;
    bool _1108 = isnan(_1012);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_44.w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1122 = fma(_1104, _970, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = _1012 > 0.0;
    float _1128 = fma(_1120, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1130 = float(uint(_716));
    float _1132 = -_1092;
    float _1134 = _1132 + 1.0;
    int _1136 = _912 >> 31;
    float _1138 = as_type<float>(_545) * _1130;
    int _1140 = _1136 & 3;
    float _1142 = fma(_1070, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1144 = fma(_1046, _1038, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_501);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = trunc(_1138);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = _912 + _1140;
    bool _1166 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1168 = isnan(_501);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = _1164 >> 2;
    float _1180 = _946 + _1116;
    int _1182 = ~_513;
    int _1184 = _1182 + 1;
    float _1186 = _1176 * _1134;
    int _1188 = _1178 << 4;
    int _1190 = _1188 + 368;
    float _1192 = -_1176;
    float _1194 = _1192 + 1.0;
    uint _1196 = uint(int(uint(_1190) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[int(_1206)][_1208];
    float _1212 = _1156 * _1194;
    float _1214 = _834 + _507;
    int _1216 = _1184 * int(_1162);
    int _1218 = _1216 + _716;
    float _1220 = -_1156;
    float _1222 = _1220 + 1.0;
    float _1224 = _1078 * _1212;
    float _1226 = _1122 * _1212;
    float _1228 = _1042 + 0.5;
    float _1230 = float(uint(_1218));
    int _1232 = _1190 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    float _1250 = _1034 * _1212;
    float _1252 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[80].x, _916);
    bool _1254 = !_938;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = as_type<float>(_545) * _1230;
    float _1260 = _1050 + (-0.5);
    bool _1262 = uint(_936) >= 2u;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1266 = trunc(_1258);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1260;
    float _1274 = -_866;
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1274);
    float _1278 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1226);
    float _1280 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1250);
    int _1282 = ~_513;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1142, _1186, _1264);
    float _1288 = fma(_1128, _1186, _1278);
    int _1290 = _1262 ? 0 : 1;
    float _1292 = -_918;
    float _1294 = _1292 + 1.0;
    bool _1296 = _936 != 3;
    float _1298 = -_908;
    float _1300 = fma(_1042, _1298, _1252);
    int _1302 = abs(_992);
    float _1304 = fma(_1050, _1294, _1276);
    int _1306 = ~_1124;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1144, _1186, _1280);
    int _1314 = ~_1290;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1288);
    int _1322 = int(_1162) + int(_1270);
    out.m_56.x = _1300;
    out.m_56.y = _1304;
    int _1324 = _1310;
    int _1326 = _1318;
    if (!_1126)
    {
        int _1328 = ~_1124;
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1286);
    int _1336 = abs(_1256);
    int _1338 = _1284 * _1322;
    int _1340 = _1338 + _716;
    if (_1296)
    {
        int _1342 = ~_1290;
        int _1344 = _1342 + 1;
        _1326 = _1344;
    }
    int _1346 = _1326;
    float _1348 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1312);
    bool _1350 = _936 != 3;
    bool _1352 = uint(_1340) >= uint(_513);
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1356 = ~_1302;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = abs(_1346);
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1360 * as_type<int>(_1210);
    int _1370 = ~_1336;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1366);
    int _1378 = _1374 * as_type<int>(_1202);
    int _1380 = _1378 + _1368;
    int _1382 = ~_1362;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    bool _1388 = !_1352;
    int _1390 = _1388 ? 0 : (-1);
    bool _1392 = !_1062;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1386 * as_type<int>(_1240);
    int _1398 = _1396 + _1380;
    int _1400 = ~_1322;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = abs(_1394);
    int _1414 = _513 * _1404;
    int _1416 = _1414 + _716;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1214 + _1418;
    int _1422 = _1410 * as_type<int>(_1248);
    int _1424 = _1422 + _1398;
    bool _1426 = !_730;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1432 = _1080 + _1430;
    bool _1434 = !_1058;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1420 * _1420;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1180 + _1440;
    int _1444 = abs(_1428);
    float _1446 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1448 = abs(_1436);
    int _1450 = ~_1444;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1446);
    float _1458 = float(_1448);
    float _1460 = float(_1332);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1456);
    float _1464 = float(_984);
    int _1466 = _1424 * _1454;
    float _1468 = float(_1412);
    float _1470 = fma(_1442, _1442, _1438);
    float _1472 = _1458 * _1460;
    bool _1474 = _1462 >= 0.0;
    float _1476 = _1468 * _1464;
    float _1478 = fma(_1432, _1432, _1470);
    float _1480 = in.m_58.x;
    float _1482 = in.m_58.y;
    float _1484 = in.m_58.z;
    bool _1486 = !_533;
    int _1488 = _1486 ? _1416 : (-1);
    bool _1490 = !_1066;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = rsqrt(_1478);
    int _1496 = _1488 * _1444;
    int _1498 = _1496 + _1466;
    float _1500 = _1472 * (-2.0);
    float _1502 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1504 = _1472;
    if (_1474)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1506 = _1504;
    float _1508 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = fma(_1018, _1500, _1018);
    float _1512 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1518 = as_type<int>(_1506);
    if (_1474)
    {
        float _1520 = _1506 * 5.0;
        _1518 = as_type<int>(_1520);
    }
    int _1522 = _1518;
    float _1524 = float(_1498);
    float _1526 = _509 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1474)
    {
        out.m_37.x = 0.0;
    }
    float _1528 = _1526 * _1494;
    out.m_60.x = _1514;
    out.m_60.y = _1516;
    out.m_60.z = _1512;
    float _1530 = fma(_1500, _1480, _1480);
    float _1532 = _580 + (-0.5);
    if (_1474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4328 = as_type<float>(_1522);
        out.gl_Position.z = _4328;
    }
    float _1534 = _1442 * _1528;
    float _1536 = _1420 * _1528;
    out.m_62.x = _1524;
    if (_1474)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1538 = -_1536;
    float _1540 = _1214 + _1538;
    float _1542 = _1476 * (-2.0);
    float _1544 = -_1534;
    float _1546 = _1180 + _1544;
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1530);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1552 = _1540 + _1550;
    float _1554 = fma(_1022, _1542, _1022);
    float _1556 = fma(_1542, _1482, _1482);
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1546 + _1558;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1564 = _1432 * _1528;
    int _1566 = abs(_1492);
    float _1568 = _582 + (-0.5);
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1562);
    float _1572 = -_1564;
    float _1574 = _1080 + _1572;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1556);
    float _1578 = float(_1100);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1574 + _1580;
    float _1584 = float(_1566);
    float _1586 = _844 + _580;
    float _1588 = fma(_1554, _922, _1576);
    float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1570);
    float _1592 = _1584 * _1578;
    float _1594 = _1586 + (-1.0);
    float _1596 = -_1536;
    float _1598 = _1420 + _1596;
    bool _1600 = _1590 >= 0.0;
    float _1602 = _1592 * (-2.0);
    float _1604 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1606 = _844 + (-0.5);
    float _1608 = -_1534;
    float _1610 = _1442 + _1608;
    float _1612 = fma(_1602, _1484, _1484);
    float _1614 = _1598 * _1598;
    float _1616 = fma(_1604, _1602, _1604);
    float _1618 = fma(_1510, _922, _1548);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1612);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = -_1564;
    float _1626 = _1432 + _1624;
    float _1628 = _1618 * 0.15915493667125701904296875;
    float _1630 = fma(_1616, _922, _1620);
    float _1632 = _1588 * 0.15915493667125701904296875;
    float _1634 = fma(_1626, _1626, _1622);
    float _1636 = _1626;
    int _1638 = as_type<int>(_1612);
    if (_1600)
    {
        _1636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1640 = _1636;
    float _1642 = _1630 * 0.15915493667125701904296875;
    float _1644 = _1628 * 6.283185482025146484375;
    float _1646 = sin(_1644);
    if (_1600)
    {
        out.m_37.x = 0.0;
    }
    if (_1600)
    {
        float _1648 = _1640 * 5.0;
        _1638 = as_type<int>(_1648);
    }
    int _1650 = _1638;
    float _1652 = _1628 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4534 = as_type<float>(_1650);
        out.gl_Position.z = _4534;
    }
    float _1656 = _1632 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = sqrt(_1634);
    float _1662 = _1632 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    if (_1600)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1666 = _1642 * 6.283185482025146484375;
    float _1668 = cos(_1666);
    float _1670 = _1494 * _1660;
    float _1672 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1676 = _1646 * _1658;
    float _1678 = _1654 * _1664;
    float _1680 = _1670 * _1672;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1684 = _1642 * 6.283185482025146484375;
    float _1686 = sin(_1684);
    float _1688 = _509 * _1670;
    float _1690 = _1674 * _1680;
    float _1692 = _1682 * _1688;
    float _1694 = _1668 * _1690;
    float _1696 = _1654 * _1658;
    float _1698 = _1658 * _1668;
    float _1700 = _1654 * _1694;
    float _1702 = _1664 * _1668;
    float _1704 = _1646 * _1664;
    float _1706 = _1646 * _1694;
    float _1708 = fma(_1686, _1678, _1676);
    float _1710 = -_1690;
    float _1712 = _1686 * _1710;
    float _1714 = -_1704;
    float _1716 = fma(_1686, _1696, _1714);
    float _1718 = -_1696;
    float _1720 = fma(_1686, _1704, _1718);
    float _1722 = fma(_1708, _1692, _1700);
    float _1724 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1726 = _1724 * 0.5;
    float _1728 = fma(_1702, _1692, _1712);
    float _1730 = fma(_1686, _1676, _1678);
    float _1732 = fma(_1720, _1692, _1706);
    float _1734 = fma(_1716, _1726, _1722);
    float _1736 = fma(_1698, _1726, _1728);
    float _1738 = fma(_1730, _1726, _1732);
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1744 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1746 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1740);
    float _1748 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1742);
    float _1750 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1746);
    float _1754 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1748);
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1750);
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1760 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1762 = _1080 + _1758;
    float _1764 = _1180 + _1760;
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1770 = _1762 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1764 + _1772;
    float _1776 = _1214 + _1766;
    float _1778 = _1770 * _1770;
    float _1780 = fma(_1774, _1774, _1778);
    float _1782 = sqrt(_1780);
    bool _1784 = _1782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1766;
    float _1788 = _1778;
    float _1790 = _1764;
    if (!_1784)
    {
        _1786 = _1762;
    }
    float _1792 = _1786;
    float _1794 = _1792;
    if (!_1784)
    {
        _1788 = _1776;
    }
    float _1796 = _1788;
    bool _1798 = !_1784;
    float _1800 = _1796;
    if (!_1798)
    {
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1806 = _1782 + _1804;
        float _1808 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = rsqrt(_1780);
        float _1812 = _1806 * _1802;
        float _1814 = _1812 * 0.15915493667125701904296875;
        float _1816 = _1814 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1814 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 + (-1.0);
        float _1826 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1828 = fma(_1822, _1808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = fma(_1776, _1818, _1826);
        float _1832 = _1810 * _1828;
        float _1834 = fma(_1774, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1770, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1800 = _1830;
        _1790 = _1834;
        _1794 = _1836;
    }
    float _1838 = _1800;
    float _1840 = _1790;
    float _1842 = _1794;
    float _1844 = -_1214;
    float _1846 = _1844 + _1838;
    float _1848 = -_1180;
    float _1850 = _1848 + _1840;
    float _1852 = -_1080;
    float _1854 = _1852 + _1842;
    float _1856 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1858 = _1846 * _1846;
    float _1860 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1862 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1864 = isnan(0.5);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1870 = _1866 || _1868;
    float _1872 = fma(_1850, _1850, _1858);
    float _1874 = fma(_1854, _1854, _1872);
    float _1876 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1856);
    float _1878 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1860);
    float _1880 = sqrt(_1874);
    float _1882 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    float _1884 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1878);
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1888 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1890 = 1.0 / _1886;
    bool _1892 = _1880 > 0.0;
    float _1894 = _1888 + _1886;
    bool _1896 = !_1892;
    float _1898 = _1838;
    float _1900 = _1840;
    float _1902 = _1842;
    if (!_1896)
    {
        float _1904 = _191 * _191;
        float _1906 = fma(_183, _183, _1904);
        float _1908 = fma(_199, _199, _1906);
        float _1910 = rsqrt(_1874);
        float _1912 = sqrt(_1908);
        float _1914 = _1850 * _1910;
        float _1916 = _1846 * _1910;
        float _1918 = _1854 * _1910;
        bool _1920 = _1912 > 0.0;
        bool _1922 = !_1920;
        if (!_1922)
        {
            float _1924 = rsqrt(_1908);
            float _1926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1928 = _191 * _1924;
            float _1930 = _183 * _1924;
            float _1932 = _1916 * _1928;
            float _1934 = _199 * _1924;
            float _1936 = fma(_1914, _1930, _1932);
            float _1938 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1918, _1934, _1936);
            float _1942 = _1940 * _1938;
            float _1944 = fma(_183, _1942, _1840);
            float _1946 = fma(_191, _1942, _1838);
            float _1948 = fma(_199, _1942, _1842);
            _1898 = _1946;
            _1900 = _1944;
            _1902 = _1948;
        }
    }
    float _1950 = _1898;
    float _1952 = _1900;
    float _1954 = _1902;
    float _1956 = -_1536;
    float _1958 = _1956 + _1950;
    float _1960 = _1894 * _1890;
    float _1962 = _1960 * 0.5;
    float _1964 = -_1534;
    float _1966 = _1964 + _1952;
    float _1968 = -_1564;
    float _1970 = _1968 + _1954;
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1974 = _1950;
    if (_1870)
    {
        _1974 = 1.0;
    }
    float _1976 = _1974;
    float _1978 = _1976;
    if (!_1870)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1984 = _1980 * 0.15915493667125701904296875;
        float _1986 = _1982 * 0.15915493667125701904296875;
        float _1988 = _1984 * 6.283185482025146484375;
        float _1990 = cos(_1988);
        float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1994 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
        float _1996 = _1984 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = 1.0 / _1990;
        float _2002 = _1986 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = _1986 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = 1.0 / _1994;
        float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2018 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2016;
        float _2020 = 1.0 / _2012;
        float _2022 = 1.0 / _2018;
        float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2026 = _2014 * _2024;
        float _2028 = _2010 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_2028, _2026, _2030);
        float _2034 = _2032 * _2022;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _1978 = _2036;
    }
    float _2038 = _1978;
    float _2040 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1972);
    float _2044 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2052 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2054 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2056 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2062 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2066);
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2080 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2076);
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2078);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2080);
    float _2092 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    bool _2094 = _2038 > 0.0;
    bool _2096 = isnan(_2038);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2106 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2108 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2088);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2112 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2092);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2116 = _2106 + _2110;
    float _2118 = _2112 + _2110;
    float _2120 = _2110 * 0.5;
    float _2122 = _2116 * 0.5;
    float _2124 = _2118 * 0.5;
    float _2126 = fma(_2108, -0.5, _2120);
    out.m_37.x = _2114;
    out.gl_Position.x = _2106;
    out.gl_Position.y = _2108;
    out.gl_Position.z = _2112;
    out.gl_Position.w = _2110;
    out.m_64.x = _2122;
    out.m_64.y = _2126;
    out.m_64.z = _2124;
    out.m_64.w = _2110;
    if (_2102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2128;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

