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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _585 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1242 = as_type<float>(_81);
        out.gl_Position.z = _1242;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1311 = as_type<float>(_117);
        out.gl_Position.z = _1311;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_35.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _123 * _121;
    float _143 = 0.0;
    float _145 = _125;
    if (!_135)
    {
        float _147 = _125 * _125;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_135)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _171 * 6.283185482025146484375;
    float _175 = cos(_173);
    float _177 = -_169;
    float _179 = _153 + _177;
    bool _181 = !_135;
    float _183 = _159;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _125 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _125);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _125 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _145 = _237;
    }
    float _239 = _145;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _247 = _245 != 0;
    float _249 = in.m_37.w;
    float _251 = in.m_28.x;
    float _253 = in.m_28.y;
    float _255 = in.m_28.z;
    bool _257 = _179 < 0.5;
    float _259 = float(_257);
    float _261 = -_179;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _265 = !_243;
    int _267 = _265 ? 0 : 1;
    float _269 = fma(_175, 0.5, 0.5);
    float _271 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = !_139;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _285 = abs(_267);
    float _287 = fma(_239, _161, _271);
    bool _289 = !_247;
    int _291 = _289 ? 0 : 1;
    float _293 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _297 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _299 = abs(_279);
    float _301 = fma(_239, _163, _293);
    int _303 = abs(_291);
    float _305 = fma(_239, _165, _297);
    float _307 = float(_285);
    float _309 = float(_299);
    float _311 = abs(_263);
    float _313 = _307 * _311;
    float _315 = fma(_301, _249, _253);
    float _317 = fma(_287, _249, _251);
    float _319 = float(_303);
    float _321 = fma(_309, _283, _313);
    float _323 = fma(_305, _249, _255);
    float _325 = abs(_275);
    float _327 = fma(_319, _325, _321);
    bool _329 = !_295;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_65);
        float _351 = 1.0 / _349;
        float _353 = _99 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _355 + _391;
    float _395 = 1.0 / _375;
    float _397 = _367 * _385;
    float _399 = 1.0 / _383;
    float _401 = _359 * _389;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_413;
    float _417 = _415 + 1.0;
    float _419 = _363 * _395;
    bool _421 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _423 = isnan(_355);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    bool _433 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -_431;
    float _447 = _445 + 1.0;
    float _449 = _431 * _417;
    float _451 = _393 * _399;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _459 = isnan(_355);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _443 * _447;
    float _471 = -_443;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _481 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_355);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_477, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _467 * _473;
    float _501 = -_467;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_491;
    float _511 = _509 + 1.0;
    float _513 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = _491 * _503;
    float _517 = fma(_507, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _523;
    float _527 = _479 * _515;
    float _529 = _497 * _515;
    float _531 = fma(_521, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _533 = fma(_525, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _547 = fma(_513, _499, _535);
    float _549 = fma(_517, _499, _537);
    float _551 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_545, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = fma(_531, _469, _547);
    float _557 = fma(_533, _469, _549);
    float _559 = fma(_551, _449, _555);
    float _561 = fma(_553, _449, _557);
    float _563 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    bool _567 = !_387;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _571 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_65);
        float _589 = 1.0 / _587;
        float _591 = _99 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_593);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _617 = isnan(_593);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _597;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    bool _637 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_593);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _651 = 1.0 / _613;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _657 = _631 * _627;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _593 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _665 = _593 + _663;
    float _667 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _625 * _635;
    float _671 = -_625;
    float _673 = _671 + 1.0;
    float _675 = _655 * _651;
    float _677 = -_647;
    float _679 = _677 + 1.0;
    float _681 = _667 * _669;
    float _683 = fma(_675, _665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _685 = _609 * _679;
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _689 = fma(_683, _685, _687);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = in.m_37.x;
    float _709 = in.m_37.y;
    out.m_39.x = _699;
    out.m_39.y = _701;
    out.m_39.z = _705;
    out.m_39.w = _703;
    float _711 = _565 * _709;
    float _713 = _563 * _707;
    bool _715 = !_649;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _719 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_65);
        float _737 = 1.0 / _735;
        float _739 = _99 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _327 * _713;
    float _747 = _327 * _711;
    float _749 = in.m_35.z;
    float _751 = _315 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = _315 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = _315 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = in.m_35.w;
    float _759 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _761 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _763 = in.m_35.y;
    float _765 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _769 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _773 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _767);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _777 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _785 = as_type<int>(_743) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_743) & 2;
    bool _791 = _789 != 0;
    float _793 = _775 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _777 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _797 = _119 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _805;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    bool _827 = _749 > 0.5;
    float _829 = -_801;
    int _831 = _797 ? as_type<int>(_829) : as_type<int>(_801);
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _835 = _757 > 0.5;
    float _837 = -_833;
    float _839 = fma(_769, 2.0, _837);
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _845 = -_99;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _849;
    float _853 = fma(_841, -2.0, _843);
    bool _855 = !_809;
    float _857 = _855 ? _801 : as_type<float>(_831);
    float _859 = _851 * _815;
    float _861 = -_801;
    int _863 = _827 ? as_type<int>(_861) : as_type<int>(_801);
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _867 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _741 + _869;
    bool _873 = _763 > 0.5;
    float _875 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _773);
    bool _877 = !_791;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _801);
    bool _883 = !_819;
    float _885 = _883 ? _801 : as_type<float>(_863);
    float _887 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _889 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _891 = isnan(_741);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = _781 * _881;
    float _903 = -_879;
    int _905 = _873 ? as_type<int>(_903) : as_type<int>(_879);
    float _907 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _909 = -_879;
    int _911 = _835 ? as_type<int>(_909) : as_type<int>(_879);
    float _913 = -_899;
    float _915 = _913 + 1.0;
    bool _917 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_741);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _931 = !_813;
    float _933 = _931 ? _879 : as_type<float>(_905);
    float _935 = _857 + 0.5;
    bool _937 = !_825;
    float _939 = _937 ? _879 : as_type<float>(_911);
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _879);
    float _943 = _927 * _915;
    float _945 = _865 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    float _957 = _929 * _941;
    float _959 = _887 * _943;
    float _961 = fma(_945, _935, _847);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _971 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _977 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[26].x, _969);
    float _979 = -_927;
    float _981 = _979 + 1.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _975);
    float _987 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _977);
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[131].x, _959);
    float _991 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _997 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _933 + (-0.5);
    float _1001 = _783 + _991;
    float _1003 = _793 + _993;
    float _1005 = _795 + _995;
    float _1007 = -_997;
    float _1009 = -_867;
    float _1011 = fma(_1007, _999, _1009);
    float _1013 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1015 = _899;
    float _1017 = _989;
    float _1019 = _999;
    if (_955)
    {
        _1015 = _1001;
    }
    float _1021 = _1015;
    float _1023 = _1021;
    if (_955)
    {
        _1017 = _1003;
    }
    float _1025 = _1017;
    float _1027 = _1025;
    if (_955)
    {
        _1019 = _1005;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (!_955)
    {
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1035 = _793 + _1033;
        float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1039 = _783 + _1037;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = _1035 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1047 = _795 + _1045;
        float _1049 = fma(_1039, _1039, _1043);
        float _1051 = fma(_1047, _1047, _1049);
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1057 = sqrt(_1051);
        float _1059 = precise::min(_1057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1053;
        float _1063 = _1055 * _1061;
        float _1065 = fma(_991, _1063, _783);
        float _1067 = fma(_993, _1063, _793);
        float _1069 = fma(_995, _1063, _795);
        _1027 = _1067;
        _1023 = _1065;
        _1031 = _1069;
    }
    float _1071 = _1027;
    float _1073 = _1023;
    float _1075 = _1031;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1077);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1091 = -_875;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1099 = -_907;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = -_1093;
    float _1109 = fma(_857, _1107, _961);
    float _1111 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1113 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1097);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1117 = fma(_933, _1101, _1011);
    float _1119 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1123 = -_939;
    float _1125 = _1123 + 0.5;
    float _1127 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1135 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1121);
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1147 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1137);
    float _1151 = _885 + 0.5;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1157 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1143);
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1145);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1149);
    float _1171 = _1141 * _1115;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1175 = _1163 * _1131;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1159);
    float _1185 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1109;
    out.m_44.y = _1117;
    out.m_44.z = _1175;
    out.m_44.w = _1171;
    out.m_46.x = _1153;
    out.m_46.y = _1177;
    out.m_46.z = _1179;
    out.m_46.w = _1181;
    out.gl_Position.x = _1169;
    out.gl_Position.y = _1173;
    out.gl_Position.z = _1183;
    out.gl_Position.w = _1185;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _585 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1242 = as_type<float>(_81);
        out.gl_Position.z = _1242;
    }
    if (!_69)
    {
        return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1311 = as_type<float>(_117);
        out.gl_Position.z = _1311;
    }
    if (_109)
    {
        return out;
    }
    float _119 = in.m_35.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _123 * _121;
    float _143 = 0.0;
    float _145 = _125;
    if (!_135)
    {
        float _147 = _125 * _125;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_135)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _171 * 6.283185482025146484375;
    float _175 = cos(_173);
    float _177 = -_169;
    float _179 = _153 + _177;
    bool _181 = !_135;
    float _183 = _159;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _125 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _125);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _125 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _145 = _237;
    }
    float _239 = _145;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _247 = _245 != 0;
    float _249 = in.m_37.w;
    float _251 = in.m_28.x;
    float _253 = in.m_28.y;
    float _255 = in.m_28.z;
    bool _257 = _179 < 0.5;
    float _259 = float(_257);
    float _261 = -_179;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _265 = !_243;
    int _267 = _265 ? 0 : 1;
    float _269 = fma(_175, 0.5, 0.5);
    float _271 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = !_139;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _285 = abs(_267);
    float _287 = fma(_239, _161, _271);
    bool _289 = !_247;
    int _291 = _289 ? 0 : 1;
    float _293 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _297 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _299 = abs(_279);
    float _301 = fma(_239, _163, _293);
    int _303 = abs(_291);
    float _305 = fma(_239, _165, _297);
    float _307 = float(_285);
    float _309 = float(_299);
    float _311 = abs(_263);
    float _313 = _307 * _311;
    float _315 = fma(_301, _249, _253);
    float _317 = fma(_287, _249, _251);
    float _319 = float(_303);
    float _321 = fma(_309, _283, _313);
    float _323 = fma(_305, _249, _255);
    float _325 = abs(_275);
    float _327 = fma(_319, _325, _321);
    bool _329 = !_295;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_65);
        float _351 = 1.0 / _349;
        float _353 = _99 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _355 + _391;
    float _395 = 1.0 / _375;
    float _397 = _367 * _385;
    float _399 = 1.0 / _383;
    float _401 = _359 * _389;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_413;
    float _417 = _415 + 1.0;
    float _419 = _363 * _395;
    bool _421 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _423 = isnan(_355);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    bool _433 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -_431;
    float _447 = _445 + 1.0;
    float _449 = _431 * _417;
    float _451 = _393 * _399;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _459 = isnan(_355);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _443 * _447;
    float _471 = -_443;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _481 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_355);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_477, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _467 * _473;
    float _501 = -_467;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_491;
    float _511 = _509 + 1.0;
    float _513 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = _491 * _503;
    float _517 = fma(_507, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _523;
    float _527 = _479 * _515;
    float _529 = _497 * _515;
    float _531 = fma(_521, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _533 = fma(_525, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _547 = fma(_513, _499, _535);
    float _549 = fma(_517, _499, _537);
    float _551 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_545, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = fma(_531, _469, _547);
    float _557 = fma(_533, _469, _549);
    float _559 = fma(_551, _449, _555);
    float _561 = fma(_553, _449, _557);
    float _563 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    bool _567 = !_387;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _571 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_65);
        float _589 = 1.0 / _587;
        float _591 = _99 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_593);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _617 = isnan(_593);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _597;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    bool _637 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_593);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _651 = 1.0 / _613;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _657 = _631 * _627;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _593 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _665 = _593 + _663;
    float _667 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _625 * _635;
    float _671 = -_625;
    float _673 = _671 + 1.0;
    float _675 = _655 * _651;
    float _677 = -_647;
    float _679 = _677 + 1.0;
    float _681 = _667 * _669;
    float _683 = fma(_675, _665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _685 = _609 * _679;
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _689 = fma(_683, _685, _687);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = in.m_37.x;
    float _709 = in.m_37.y;
    out.m_39.x = _699;
    out.m_39.y = _701;
    out.m_39.z = _705;
    out.m_39.w = _703;
    float _711 = _565 * _709;
    float _713 = _563 * _707;
    bool _715 = !_649;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _719 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_65);
        float _737 = 1.0 / _735;
        float _739 = _99 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _327 * _713;
    float _747 = _327 * _711;
    float _749 = in.m_35.z;
    float _751 = _315 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = _315 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = _315 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = in.m_35.w;
    float _759 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _761 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _763 = in.m_35.y;
    float _765 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _769 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _773 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _767);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _777 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _785 = as_type<int>(_743) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_743) & 2;
    bool _791 = _789 != 0;
    float _793 = _775 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _777 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _797 = _119 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _805;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    bool _827 = _749 > 0.5;
    float _829 = -_801;
    int _831 = _797 ? as_type<int>(_829) : as_type<int>(_801);
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _835 = _757 > 0.5;
    float _837 = -_833;
    float _839 = fma(_769, 2.0, _837);
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _845 = -_99;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _849;
    float _853 = fma(_841, -2.0, _843);
    bool _855 = !_809;
    float _857 = _855 ? _801 : as_type<float>(_831);
    float _859 = _851 * _815;
    float _861 = -_801;
    int _863 = _827 ? as_type<int>(_861) : as_type<int>(_801);
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _867 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _741 + _869;
    bool _873 = _763 > 0.5;
    float _875 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _773);
    bool _877 = !_791;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _801);
    bool _883 = !_819;
    float _885 = _883 ? _801 : as_type<float>(_863);
    float _887 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _889 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _891 = isnan(_741);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = _781 * _881;
    float _903 = -_879;
    int _905 = _873 ? as_type<int>(_903) : as_type<int>(_879);
    float _907 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _909 = -_879;
    int _911 = _835 ? as_type<int>(_909) : as_type<int>(_879);
    float _913 = -_899;
    float _915 = _913 + 1.0;
    bool _917 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_741);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _931 = !_813;
    float _933 = _931 ? _879 : as_type<float>(_905);
    float _935 = _857 + 0.5;
    bool _937 = !_825;
    float _939 = _937 ? _879 : as_type<float>(_911);
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _879);
    float _943 = _927 * _915;
    float _945 = _865 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    float _957 = _929 * _941;
    float _959 = _887 * _943;
    float _961 = fma(_945, _935, _847);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _971 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _977 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[26].x, _969);
    float _979 = -_927;
    float _981 = _979 + 1.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _975);
    float _987 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _977);
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[131].x, _959);
    float _991 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _997 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _933 + (-0.5);
    float _1001 = _783 + _991;
    float _1003 = _793 + _993;
    float _1005 = _795 + _995;
    float _1007 = -_997;
    float _1009 = -_867;
    float _1011 = fma(_1007, _999, _1009);
    float _1013 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1015 = _899;
    float _1017 = _989;
    float _1019 = _999;
    if (_955)
    {
        _1015 = _1001;
    }
    float _1021 = _1015;
    float _1023 = _1021;
    if (_955)
    {
        _1017 = _1003;
    }
    float _1025 = _1017;
    float _1027 = _1025;
    if (_955)
    {
        _1019 = _1005;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (!_955)
    {
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1035 = _793 + _1033;
        float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1039 = _783 + _1037;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = _1035 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1047 = _795 + _1045;
        float _1049 = fma(_1039, _1039, _1043);
        float _1051 = fma(_1047, _1047, _1049);
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1057 = sqrt(_1051);
        float _1059 = precise::min(_1057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1053;
        float _1063 = _1055 * _1061;
        float _1065 = fma(_991, _1063, _783);
        float _1067 = fma(_993, _1063, _793);
        float _1069 = fma(_995, _1063, _795);
        _1027 = _1067;
        _1023 = _1065;
        _1031 = _1069;
    }
    float _1071 = _1027;
    float _1073 = _1023;
    float _1075 = _1031;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1077);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1091 = -_875;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1099 = -_907;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = -_1093;
    float _1109 = fma(_857, _1107, _961);
    float _1111 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1113 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1097);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1117 = fma(_933, _1101, _1011);
    float _1119 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1123 = -_939;
    float _1125 = _1123 + 0.5;
    float _1127 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1135 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1121);
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1147 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1137);
    float _1151 = _885 + 0.5;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1157 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1143);
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1145);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1149);
    float _1171 = _1141 * _1115;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1175 = _1163 * _1131;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1159);
    float _1185 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1109;
    out.m_44.y = _1117;
    out.m_44.z = _1175;
    out.m_44.w = _1171;
    out.m_46.x = _1153;
    out.m_46.y = _1177;
    out.m_46.z = _1179;
    out.m_46.w = _1181;
    out.gl_Position.x = _1169;
    out.gl_Position.y = _1173;
    out.gl_Position.z = _1183;
    out.gl_Position.w = _1185;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _585 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1242 = as_type<float>(_81);
        out.gl_Position.z = _1242;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _75 = _101;
    }
    float _103 = _75;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1311 = as_type<float>(_117);
        out.gl_Position.z = _1311;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_35.x;
    float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _123 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _123 * _121;
    float _143 = 0.0;
    float _145 = _125;
    if (!_135)
    {
        float _147 = _125 * _125;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_135)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _171 * 6.283185482025146484375;
    float _175 = cos(_173);
    float _177 = -_169;
    float _179 = _153 + _177;
    bool _181 = !_135;
    float _183 = _159;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _125 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _125);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_135;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _125 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _145 = _237;
    }
    float _239 = _145;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _247 = _245 != 0;
    float _249 = in.m_37.w;
    float _251 = in.m_28.x;
    float _253 = in.m_28.y;
    float _255 = in.m_28.z;
    bool _257 = _179 < 0.5;
    float _259 = float(_257);
    float _261 = -_179;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _265 = !_243;
    int _267 = _265 ? 0 : 1;
    float _269 = fma(_175, 0.5, 0.5);
    float _271 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _277 = !_139;
    int _279 = _277 ? 0 : 1;
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _285 = abs(_267);
    float _287 = fma(_239, _161, _271);
    bool _289 = !_247;
    int _291 = _289 ? 0 : 1;
    float _293 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _297 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _299 = abs(_279);
    float _301 = fma(_239, _163, _293);
    int _303 = abs(_291);
    float _305 = fma(_239, _165, _297);
    float _307 = float(_285);
    float _309 = float(_299);
    float _311 = abs(_263);
    float _313 = _307 * _311;
    float _315 = fma(_301, _249, _253);
    float _317 = fma(_287, _249, _251);
    float _319 = float(_303);
    float _321 = fma(_309, _283, _313);
    float _323 = fma(_305, _249, _255);
    float _325 = abs(_275);
    float _327 = fma(_319, _325, _321);
    bool _329 = !_295;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_65);
        float _351 = 1.0 / _349;
        float _353 = _99 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _355 + _391;
    float _395 = 1.0 / _375;
    float _397 = _367 * _385;
    float _399 = 1.0 / _383;
    float _401 = _359 * _389;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_413;
    float _417 = _415 + 1.0;
    float _419 = _363 * _395;
    bool _421 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _423 = isnan(_355);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    bool _433 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_355);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -_431;
    float _447 = _445 + 1.0;
    float _449 = _431 * _417;
    float _451 = _393 * _399;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _459 = isnan(_355);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _443 * _447;
    float _471 = -_443;
    float _473 = _471 + 1.0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = fma(_455, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _481 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _483 = isnan(_355);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_477, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _467 * _473;
    float _501 = -_467;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_491;
    float _511 = _509 + 1.0;
    float _513 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _515 = _491 * _503;
    float _517 = fma(_507, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _523;
    float _527 = _479 * _515;
    float _529 = _497 * _515;
    float _531 = fma(_521, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _533 = fma(_525, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _547 = fma(_513, _499, _535);
    float _549 = fma(_517, _499, _537);
    float _551 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_545, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = fma(_531, _469, _547);
    float _557 = fma(_533, _469, _549);
    float _559 = fma(_551, _449, _555);
    float _561 = fma(_553, _449, _557);
    float _563 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    bool _567 = !_387;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _571 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_65);
        float _589 = 1.0 / _587;
        float _591 = _99 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_593);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _617 = isnan(_593);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _597;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    bool _637 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = isnan(_593);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _651 = 1.0 / _613;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _657 = _631 * _627;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _593 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _665 = _593 + _663;
    float _667 = fma(_657, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _625 * _635;
    float _671 = -_625;
    float _673 = _671 + 1.0;
    float _675 = _655 * _651;
    float _677 = -_647;
    float _679 = _677 + 1.0;
    float _681 = _667 * _669;
    float _683 = fma(_675, _665, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _685 = _609 * _679;
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _689 = fma(_683, _685, _687);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = in.m_37.x;
    float _709 = in.m_37.y;
    out.m_39.x = _699;
    out.m_39.y = _701;
    out.m_39.z = _705;
    out.m_39.w = _703;
    float _711 = _565 * _709;
    float _713 = _563 * _707;
    bool _715 = !_649;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _719 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_65);
        float _737 = 1.0 / _735;
        float _739 = _99 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _327 * _713;
    float _747 = _327 * _711;
    float _749 = in.m_35.z;
    float _751 = _315 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = _315 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = _315 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = in.m_35.w;
    float _759 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _761 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _763 = in.m_35.y;
    float _765 = fma(_317, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _769 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _771 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _759);
    float _773 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _767);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _777 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _781 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _785 = as_type<int>(_743) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_743) & 2;
    bool _791 = _789 != 0;
    float _793 = _775 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _795 = _777 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _797 = _119 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _805;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _779);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    bool _827 = _749 > 0.5;
    float _829 = -_801;
    int _831 = _797 ? as_type<int>(_829) : as_type<int>(_801);
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _835 = _757 > 0.5;
    float _837 = -_833;
    float _839 = fma(_769, 2.0, _837);
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _845 = -_99;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _849;
    float _853 = fma(_841, -2.0, _843);
    bool _855 = !_809;
    float _857 = _855 ? _801 : as_type<float>(_831);
    float _859 = _851 * _815;
    float _861 = -_801;
    int _863 = _827 ? as_type<int>(_861) : as_type<int>(_801);
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _867 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _741 + _869;
    bool _873 = _763 > 0.5;
    float _875 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _773);
    bool _877 = !_791;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _801);
    bool _883 = !_819;
    float _885 = _883 ? _801 : as_type<float>(_863);
    float _887 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _889 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _891 = isnan(_741);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    float _901 = _781 * _881;
    float _903 = -_879;
    int _905 = _873 ? as_type<int>(_903) : as_type<int>(_879);
    float _907 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _821);
    float _909 = -_879;
    int _911 = _835 ? as_type<int>(_909) : as_type<int>(_879);
    float _913 = -_899;
    float _915 = _913 + 1.0;
    bool _917 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_741);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _931 = !_813;
    float _933 = _931 ? _879 : as_type<float>(_905);
    float _935 = _857 + 0.5;
    bool _937 = !_825;
    float _939 = _937 ? _879 : as_type<float>(_911);
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _879);
    float _943 = _927 * _915;
    float _945 = _865 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    float _957 = _929 * _941;
    float _959 = _887 * _943;
    float _961 = fma(_945, _935, _847);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = _957 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = _957 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _971 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _977 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[26].x, _969);
    float _979 = -_927;
    float _981 = _979 + 1.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].z, _975);
    float _987 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].z, _977);
    float _989 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[131].x, _959);
    float _991 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _997 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = _933 + (-0.5);
    float _1001 = _783 + _991;
    float _1003 = _793 + _993;
    float _1005 = _795 + _995;
    float _1007 = -_997;
    float _1009 = -_867;
    float _1011 = fma(_1007, _999, _1009);
    float _1013 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1015 = _899;
    float _1017 = _989;
    float _1019 = _999;
    if (_955)
    {
        _1015 = _1001;
    }
    float _1021 = _1015;
    float _1023 = _1021;
    if (_955)
    {
        _1017 = _1003;
    }
    float _1025 = _1017;
    float _1027 = _1025;
    if (_955)
    {
        _1019 = _1005;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (!_955)
    {
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1035 = _793 + _1033;
        float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1039 = _783 + _1037;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = _1035 * _1035;
        float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1047 = _795 + _1045;
        float _1049 = fma(_1039, _1039, _1043);
        float _1051 = fma(_1047, _1047, _1049);
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1057 = sqrt(_1051);
        float _1059 = precise::min(_1057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1053;
        float _1063 = _1055 * _1061;
        float _1065 = fma(_991, _1063, _783);
        float _1067 = fma(_993, _1063, _793);
        float _1069 = fma(_995, _1063, _795);
        _1027 = _1067;
        _1023 = _1065;
        _1031 = _1069;
    }
    float _1071 = _1027;
    float _1073 = _1023;
    float _1075 = _1031;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1077);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1091 = -_875;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1097 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1099 = -_907;
    float _1101 = _1099 + 1.0;
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1107 = -_1093;
    float _1109 = fma(_857, _1107, _961);
    float _1111 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1113 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1097);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1117 = fma(_933, _1101, _1011);
    float _1119 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1123 = -_939;
    float _1125 = _1123 + 0.5;
    float _1127 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1129 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1135 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1121);
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1127);
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1129);
    float _1147 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1137);
    float _1151 = _885 + 0.5;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1157 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1143);
    float _1159 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1145);
    float _1161 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1149);
    float _1171 = _1141 * _1115;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1157);
    float _1175 = _1163 * _1131;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1159);
    float _1185 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1109;
    out.m_44.y = _1117;
    out.m_44.z = _1175;
    out.m_44.w = _1171;
    out.m_46.x = _1153;
    out.m_46.y = _1177;
    out.m_46.z = _1179;
    out.m_46.w = _1181;
    out.gl_Position.x = _1169;
    out.gl_Position.y = _1173;
    out.gl_Position.z = _1183;
    out.gl_Position.w = _1185;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

