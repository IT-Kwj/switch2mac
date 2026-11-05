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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_33 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1035 = as_type<float>(_117);
        out.gl_Position.z = _1035;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _173;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _179 = _177 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = 1.0 / _167;
    bool _183 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _185 = isnan(_149);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _191 = _187 || _189;
    float _193 = float(_191);
    float _195 = 1.0 / _175;
    float _197 = _159 * _97;
    float _199 = _155 * 2.0;
    float _201 = _153 + _155;
    float _203 = 1.0 / _171;
    float _205 = _155 + (-0.5);
    float _207 = _151 * 2.0;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _215 = _213 != 0;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _219 = _217 != 0;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _149 + _221;
    bool _225 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _233 = _229 || _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _237 = 1.0 + _235;
    float _239 = _153 * 2.0;
    float _241 = 1.0 / _179;
    float _243 = _155 + _151;
    float _245 = _153 + _151;
    float _247 = _223 * _195;
    float _249 = _153 + (-0.5);
    float _251 = _243 + (-1.0);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _149 + _253;
    float _257 = _245 + (-1.0);
    float _259 = floor(_199);
    float _261 = _151 + (-0.5);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = _149 + _263;
    float _267 = _255 * _203;
    bool _269 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _181;
    float _281 = exp2(_197);
    float _283 = _163 * _241;
    float _285 = _201 + (-1.0);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _237;
    bool _293 = _259 > 0.0;
    float _295 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _297 = _259 >= 0.0;
    bool _299 = isnan(_259);
    bool _301 = _297 || _299;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    int _307 = _305 ? 0 : 1;
    float _309 = 1.0 / _289;
    float _311 = -_281;
    float _313 = _311 + 1.0;
    int _315 = ~_307;
    int _317 = _315 + 1;
    int _319 = _317 + 1;
    float _321 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_207);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = _277 ? _313 : 0.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _339 = _149 + _337;
    int _341 = _319;
    if (!_293)
    {
        int _343 = ~_307;
        int _345 = _343 + 1;
        _341 = _345;
    }
    int _347 = _341;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = floor(_239);
    float _355 = _339 * _309;
    bool _357 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_149);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = fma(_327, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_149);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    if (_233)
    {
        float _383 = _329 * _291;
        _101 = _383;
    }
    float _385 = _101;
    float _387 = fma(_351, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = -_367;
    float _391 = _389 + 1.0;
    bool _393 = _323 > 0.0;
    float _395 = -_381;
    float _397 = _395 + 1.0;
    bool _399 = _323 >= 0.0;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = _381 * _391;
    bool _415 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _417 = isnan(_149);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = fma(_333, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _429 = _353 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _353 >= 0.0;
    bool _437 = isnan(_353);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 * _397;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _451 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_149);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_425;
    float _465 = _463 + 1.0;
    bool _467 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_149);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = fma(_411, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_449, _267, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_485, _267, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _497 = _461 * _465;
    bool _499 = !_211;
    int _501 = _499 ? 0 : 1;
    float _503 = in.m_35.x;
    float _505 = in.m_35.y;
    float _507 = in.m_35.z;
    float _509 = _477 * _489;
    float _511 = -_477;
    float _513 = _511 + 1.0;
    int _515 = abs(_501);
    float _517 = fma(_481, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_433, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _193 * _513;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = _369 * _521;
    float _529 = float(_515);
    float _531 = fma(_525, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _533 = float(_347);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    bool _539 = !_219;
    int _541 = _539 ? 0 : 1;
    float _543 = _387 * _521;
    float _545 = -_193;
    float _547 = _545 + 1.0;
    float _549 = _529 * _533;
    float _551 = fma(_537, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _553 = _443 ? 0 : 1;
    float _555 = _549 * (-2.0);
    int _557 = abs(_541);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    int _561 = ~_553;
    int _563 = _561 + 1;
    int _565 = _563 + 1;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    int _569 = _565;
    if (!_429)
    {
        int _571 = ~_553;
        int _573 = _571 + 1;
        _569 = _573;
    }
    int _575 = _569;
    float _577 = fma(_555, _503, _503);
    bool _579 = !_215;
    int _581 = _579 ? 0 : 1;
    float _583 = fma(_335, _555, _335);
    float _585 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _577);
    int _587 = _407 ? 0 : 1;
    float _589 = fma(_427, _509, _559);
    int _591 = abs(_581);
    float _593 = fma(_583, _385, _585);
    float _595 = float(_557);
    float _597 = fma(_491, _509, _567);
    float _599 = float(_575);
    float _601 = as_type<float>(int(gl_VertexIndex));
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = fma(_517, _497, _589);
    int _611 = _607;
    if (!_393)
    {
        int _613 = ~_587;
        int _615 = _613 + 1;
        _611 = _615;
    }
    int _617 = _611;
    float _619 = _595 * _599;
    float _621 = fma(_495, _445, _609);
    float _623 = float(_617);
    float _625 = _619 * (-2.0);
    float _627 = float(_591);
    float _629 = fma(_519, _497, _597);
    float _631 = fma(_551, _413, _621);
    float _633 = fma(_625, _507, _507);
    float _635 = fma(_295, _625, _295);
    float _637 = _627 * _623;
    float _639 = in.m_40.x;
    float _641 = in.m_40.y;
    float _643 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _633);
    float _645 = _593 * 0.15915493667125701904296875;
    float _647 = _637 * (-2.0);
    float _649 = fma(_493, _445, _629);
    float _651 = fma(_635, _385, _643);
    float _653 = _645 * 6.283185482025146484375;
    float _655 = sin(_653);
    float _657 = fma(_647, _505, _505);
    float _659 = in.m_26.x;
    float _661 = in.m_26.y;
    float _663 = in.m_26.z;
    float _665 = fma(_321, _647, _321);
    float _667 = _651 * 0.15915493667125701904296875;
    float _669 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _671 = fma(_531, _413, _649);
    int _673 = as_type<int>(_601) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_601) & 2;
    bool _679 = _677 != 0;
    float _681 = _645 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_665, _385, _669);
    float _687 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _631);
    float _689 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _671);
    float _691 = _685 * 0.15915493667125701904296875;
    bool _693 = !_675;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = _667 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _687 * _639;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = _689 * _641;
    float _709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _695);
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _667 * 6.283185482025146484375;
    float _715 = cos(_713);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _719 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _661 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _727 = _711 * _709;
    float _729 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _731 = _691 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _655 * _699;
    float _737 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _741 = _725 * _717;
    float _743 = _683 * _699;
    float _745 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _729);
    float _747 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _749 = _691 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _683 * _715;
    float _755 = _655 * _715;
    float _757 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _759 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _765 = fma(_733, _735, _753);
    float _767 = -_743;
    float _769 = fma(_733, _755, _767);
    float _771 = -_755;
    float _773 = fma(_733, _743, _771);
    float _775 = _765 * _741;
    float _777 = _769 * _741;
    float _779 = _751 * _727;
    float _781 = _655 * _751;
    float _783 = _683 * _751;
    float _785 = fma(_699, _779, _775);
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = _733 * _727;
    float _791 = fma(_733, _753, _735);
    float _793 = fma(_715, _779, _777);
    float _795 = fma(_773, _787, _785);
    float _797 = -_789;
    float _799 = fma(_781, _741, _797);
    float _801 = fma(_791, _787, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _807 = fma(_783, _787, _799);
    float _809 = _795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[9].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[8].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[10].x, _809);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[9].z, _811);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[8].z, _813);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[10].z, _815);
    float _823 = _759 + _817;
    float _825 = _761 + _819;
    float _827 = _763 + _821;
    float _829 = _823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _833 = _823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _829);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _831);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _835);
    float _845 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _839);
    float _849 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _841);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _863);
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].z, _869);
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].z, _871);
    float _881 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].z, _875);
    float _885 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _877);
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 + _891;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _903 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _905;
    out.m_42.y = _901;
    out.m_42.z = _907;
    out.m_42.w = _897;
    out.gl_Position.x = _889;
    out.gl_Position.y = _885;
    out.gl_Position.z = _887;
    out.gl_Position.w = _891;
    out.m_44.z = _909;
    out.m_44.w = _891;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1035 = as_type<float>(_117);
        out.gl_Position.z = _1035;
    }
    if (_111)
    {
        return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _173;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _179 = _177 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = 1.0 / _167;
    bool _183 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _185 = isnan(_149);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _191 = _187 || _189;
    float _193 = float(_191);
    float _195 = 1.0 / _175;
    float _197 = _159 * _97;
    float _199 = _155 * 2.0;
    float _201 = _153 + _155;
    float _203 = 1.0 / _171;
    float _205 = _155 + (-0.5);
    float _207 = _151 * 2.0;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _215 = _213 != 0;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _219 = _217 != 0;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _149 + _221;
    bool _225 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _233 = _229 || _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _237 = 1.0 + _235;
    float _239 = _153 * 2.0;
    float _241 = 1.0 / _179;
    float _243 = _155 + _151;
    float _245 = _153 + _151;
    float _247 = _223 * _195;
    float _249 = _153 + (-0.5);
    float _251 = _243 + (-1.0);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _149 + _253;
    float _257 = _245 + (-1.0);
    float _259 = floor(_199);
    float _261 = _151 + (-0.5);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = _149 + _263;
    float _267 = _255 * _203;
    bool _269 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _181;
    float _281 = exp2(_197);
    float _283 = _163 * _241;
    float _285 = _201 + (-1.0);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _237;
    bool _293 = _259 > 0.0;
    float _295 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _297 = _259 >= 0.0;
    bool _299 = isnan(_259);
    bool _301 = _297 || _299;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    int _307 = _305 ? 0 : 1;
    float _309 = 1.0 / _289;
    float _311 = -_281;
    float _313 = _311 + 1.0;
    int _315 = ~_307;
    int _317 = _315 + 1;
    int _319 = _317 + 1;
    float _321 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_207);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = _277 ? _313 : 0.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _339 = _149 + _337;
    int _341 = _319;
    if (!_293)
    {
        int _343 = ~_307;
        int _345 = _343 + 1;
        _341 = _345;
    }
    int _347 = _341;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = floor(_239);
    float _355 = _339 * _309;
    bool _357 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_149);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = fma(_327, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_149);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    if (_233)
    {
        float _383 = _329 * _291;
        _101 = _383;
    }
    float _385 = _101;
    float _387 = fma(_351, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = -_367;
    float _391 = _389 + 1.0;
    bool _393 = _323 > 0.0;
    float _395 = -_381;
    float _397 = _395 + 1.0;
    bool _399 = _323 >= 0.0;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = _381 * _391;
    bool _415 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _417 = isnan(_149);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = fma(_333, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _429 = _353 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _353 >= 0.0;
    bool _437 = isnan(_353);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 * _397;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _451 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_149);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_425;
    float _465 = _463 + 1.0;
    bool _467 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_149);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = fma(_411, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_449, _267, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_485, _267, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _497 = _461 * _465;
    bool _499 = !_211;
    int _501 = _499 ? 0 : 1;
    float _503 = in.m_35.x;
    float _505 = in.m_35.y;
    float _507 = in.m_35.z;
    float _509 = _477 * _489;
    float _511 = -_477;
    float _513 = _511 + 1.0;
    int _515 = abs(_501);
    float _517 = fma(_481, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_433, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _193 * _513;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = _369 * _521;
    float _529 = float(_515);
    float _531 = fma(_525, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _533 = float(_347);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    bool _539 = !_219;
    int _541 = _539 ? 0 : 1;
    float _543 = _387 * _521;
    float _545 = -_193;
    float _547 = _545 + 1.0;
    float _549 = _529 * _533;
    float _551 = fma(_537, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _553 = _443 ? 0 : 1;
    float _555 = _549 * (-2.0);
    int _557 = abs(_541);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    int _561 = ~_553;
    int _563 = _561 + 1;
    int _565 = _563 + 1;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    int _569 = _565;
    if (!_429)
    {
        int _571 = ~_553;
        int _573 = _571 + 1;
        _569 = _573;
    }
    int _575 = _569;
    float _577 = fma(_555, _503, _503);
    bool _579 = !_215;
    int _581 = _579 ? 0 : 1;
    float _583 = fma(_335, _555, _335);
    float _585 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _577);
    int _587 = _407 ? 0 : 1;
    float _589 = fma(_427, _509, _559);
    int _591 = abs(_581);
    float _593 = fma(_583, _385, _585);
    float _595 = float(_557);
    float _597 = fma(_491, _509, _567);
    float _599 = float(_575);
    float _601 = as_type<float>(int(gl_VertexIndex));
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = fma(_517, _497, _589);
    int _611 = _607;
    if (!_393)
    {
        int _613 = ~_587;
        int _615 = _613 + 1;
        _611 = _615;
    }
    int _617 = _611;
    float _619 = _595 * _599;
    float _621 = fma(_495, _445, _609);
    float _623 = float(_617);
    float _625 = _619 * (-2.0);
    float _627 = float(_591);
    float _629 = fma(_519, _497, _597);
    float _631 = fma(_551, _413, _621);
    float _633 = fma(_625, _507, _507);
    float _635 = fma(_295, _625, _295);
    float _637 = _627 * _623;
    float _639 = in.m_40.x;
    float _641 = in.m_40.y;
    float _643 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _633);
    float _645 = _593 * 0.15915493667125701904296875;
    float _647 = _637 * (-2.0);
    float _649 = fma(_493, _445, _629);
    float _651 = fma(_635, _385, _643);
    float _653 = _645 * 6.283185482025146484375;
    float _655 = sin(_653);
    float _657 = fma(_647, _505, _505);
    float _659 = in.m_26.x;
    float _661 = in.m_26.y;
    float _663 = in.m_26.z;
    float _665 = fma(_321, _647, _321);
    float _667 = _651 * 0.15915493667125701904296875;
    float _669 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _671 = fma(_531, _413, _649);
    int _673 = as_type<int>(_601) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_601) & 2;
    bool _679 = _677 != 0;
    float _681 = _645 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_665, _385, _669);
    float _687 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _631);
    float _689 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _671);
    float _691 = _685 * 0.15915493667125701904296875;
    bool _693 = !_675;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = _667 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _687 * _639;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = _689 * _641;
    float _709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _695);
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _667 * 6.283185482025146484375;
    float _715 = cos(_713);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _719 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _661 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _727 = _711 * _709;
    float _729 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _731 = _691 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _655 * _699;
    float _737 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _741 = _725 * _717;
    float _743 = _683 * _699;
    float _745 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _729);
    float _747 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _749 = _691 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _683 * _715;
    float _755 = _655 * _715;
    float _757 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _759 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _765 = fma(_733, _735, _753);
    float _767 = -_743;
    float _769 = fma(_733, _755, _767);
    float _771 = -_755;
    float _773 = fma(_733, _743, _771);
    float _775 = _765 * _741;
    float _777 = _769 * _741;
    float _779 = _751 * _727;
    float _781 = _655 * _751;
    float _783 = _683 * _751;
    float _785 = fma(_699, _779, _775);
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = _733 * _727;
    float _791 = fma(_733, _753, _735);
    float _793 = fma(_715, _779, _777);
    float _795 = fma(_773, _787, _785);
    float _797 = -_789;
    float _799 = fma(_781, _741, _797);
    float _801 = fma(_791, _787, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _807 = fma(_783, _787, _799);
    float _809 = _795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[9].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[8].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[10].x, _809);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[9].z, _811);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[8].z, _813);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[10].z, _815);
    float _823 = _759 + _817;
    float _825 = _761 + _819;
    float _827 = _763 + _821;
    float _829 = _823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _833 = _823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _829);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _831);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _835);
    float _845 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _839);
    float _849 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _841);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _863);
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].z, _869);
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].z, _871);
    float _881 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].z, _875);
    float _885 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _877);
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 + _891;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _903 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _905;
    out.m_42.y = _901;
    out.m_42.z = _907;
    out.m_42.w = _897;
    out.gl_Position.x = _889;
    out.gl_Position.y = _885;
    out.gl_Position.z = _887;
    out.gl_Position.w = _891;
    out.m_44.z = _909;
    out.m_44.w = _891;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1035 = as_type<float>(_117);
        out.gl_Position.z = _1035;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _173;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _179 = _177 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = 1.0 / _167;
    bool _183 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _185 = isnan(_149);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _191 = _187 || _189;
    float _193 = float(_191);
    float _195 = 1.0 / _175;
    float _197 = _159 * _97;
    float _199 = _155 * 2.0;
    float _201 = _153 + _155;
    float _203 = 1.0 / _171;
    float _205 = _155 + (-0.5);
    float _207 = _151 * 2.0;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _215 = _213 != 0;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _219 = _217 != 0;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _149 + _221;
    bool _225 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _233 = _229 || _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _237 = 1.0 + _235;
    float _239 = _153 * 2.0;
    float _241 = 1.0 / _179;
    float _243 = _155 + _151;
    float _245 = _153 + _151;
    float _247 = _223 * _195;
    float _249 = _153 + (-0.5);
    float _251 = _243 + (-1.0);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _255 = _149 + _253;
    float _257 = _245 + (-1.0);
    float _259 = floor(_199);
    float _261 = _151 + (-0.5);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = _149 + _263;
    float _267 = _255 * _203;
    bool _269 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _181;
    float _281 = exp2(_197);
    float _283 = _163 * _241;
    float _285 = _201 + (-1.0);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _237;
    bool _293 = _259 > 0.0;
    float _295 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _297 = _259 >= 0.0;
    bool _299 = isnan(_259);
    bool _301 = _297 || _299;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    int _307 = _305 ? 0 : 1;
    float _309 = 1.0 / _289;
    float _311 = -_281;
    float _313 = _311 + 1.0;
    int _315 = ~_307;
    int _317 = _315 + 1;
    int _319 = _317 + 1;
    float _321 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_207);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = _277 ? _313 : 0.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _339 = _149 + _337;
    int _341 = _319;
    if (!_293)
    {
        int _343 = ~_307;
        int _345 = _343 + 1;
        _341 = _345;
    }
    int _347 = _341;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = floor(_239);
    float _355 = _339 * _309;
    bool _357 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_149);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = fma(_327, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_149);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    if (_233)
    {
        float _383 = _329 * _291;
        _101 = _383;
    }
    float _385 = _101;
    float _387 = fma(_351, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = -_367;
    float _391 = _389 + 1.0;
    bool _393 = _323 > 0.0;
    float _395 = -_381;
    float _397 = _395 + 1.0;
    bool _399 = _323 >= 0.0;
    bool _401 = isnan(_323);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = _381 * _391;
    bool _415 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _417 = isnan(_149);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = fma(_333, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _429 = _353 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _353 >= 0.0;
    bool _437 = isnan(_353);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = _425 * _397;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _451 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_149);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_425;
    float _465 = _463 + 1.0;
    bool _467 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_149);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = fma(_411, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_449, _267, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_485, _267, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _497 = _461 * _465;
    bool _499 = !_211;
    int _501 = _499 ? 0 : 1;
    float _503 = in.m_35.x;
    float _505 = in.m_35.y;
    float _507 = in.m_35.z;
    float _509 = _477 * _489;
    float _511 = -_477;
    float _513 = _511 + 1.0;
    int _515 = abs(_501);
    float _517 = fma(_481, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_433, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _193 * _513;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = _369 * _521;
    float _529 = float(_515);
    float _531 = fma(_525, _355, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _533 = float(_347);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _535;
    bool _539 = !_219;
    int _541 = _539 ? 0 : 1;
    float _543 = _387 * _521;
    float _545 = -_193;
    float _547 = _545 + 1.0;
    float _549 = _529 * _533;
    float _551 = fma(_537, _355, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _553 = _443 ? 0 : 1;
    float _555 = _549 * (-2.0);
    int _557 = abs(_541);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    int _561 = ~_553;
    int _563 = _561 + 1;
    int _565 = _563 + 1;
    float _567 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    int _569 = _565;
    if (!_429)
    {
        int _571 = ~_553;
        int _573 = _571 + 1;
        _569 = _573;
    }
    int _575 = _569;
    float _577 = fma(_555, _503, _503);
    bool _579 = !_215;
    int _581 = _579 ? 0 : 1;
    float _583 = fma(_335, _555, _335);
    float _585 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[196].x, _577);
    int _587 = _407 ? 0 : 1;
    float _589 = fma(_427, _509, _559);
    int _591 = abs(_581);
    float _593 = fma(_583, _385, _585);
    float _595 = float(_557);
    float _597 = fma(_491, _509, _567);
    float _599 = float(_575);
    float _601 = as_type<float>(int(gl_VertexIndex));
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = fma(_517, _497, _589);
    int _611 = _607;
    if (!_393)
    {
        int _613 = ~_587;
        int _615 = _613 + 1;
        _611 = _615;
    }
    int _617 = _611;
    float _619 = _595 * _599;
    float _621 = fma(_495, _445, _609);
    float _623 = float(_617);
    float _625 = _619 * (-2.0);
    float _627 = float(_591);
    float _629 = fma(_519, _497, _597);
    float _631 = fma(_551, _413, _621);
    float _633 = fma(_625, _507, _507);
    float _635 = fma(_295, _625, _295);
    float _637 = _627 * _623;
    float _639 = in.m_40.x;
    float _641 = in.m_40.y;
    float _643 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _633);
    float _645 = _593 * 0.15915493667125701904296875;
    float _647 = _637 * (-2.0);
    float _649 = fma(_493, _445, _629);
    float _651 = fma(_635, _385, _643);
    float _653 = _645 * 6.283185482025146484375;
    float _655 = sin(_653);
    float _657 = fma(_647, _505, _505);
    float _659 = in.m_26.x;
    float _661 = in.m_26.y;
    float _663 = in.m_26.z;
    float _665 = fma(_321, _647, _321);
    float _667 = _651 * 0.15915493667125701904296875;
    float _669 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _671 = fma(_531, _413, _649);
    int _673 = as_type<int>(_601) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_601) & 2;
    bool _679 = _677 != 0;
    float _681 = _645 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_665, _385, _669);
    float _687 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _631);
    float _689 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _671);
    float _691 = _685 * 0.15915493667125701904296875;
    bool _693 = !_675;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = _667 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = _687 * _639;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = _689 * _641;
    float _709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _695);
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = _667 * 6.283185482025146484375;
    float _715 = cos(_713);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _719 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _661 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _727 = _711 * _709;
    float _729 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _731 = _691 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _655 * _699;
    float _737 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _741 = _725 * _717;
    float _743 = _683 * _699;
    float _745 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _729);
    float _747 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _749 = _691 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _683 * _715;
    float _755 = _655 * _715;
    float _757 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _739);
    float _759 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _765 = fma(_733, _735, _753);
    float _767 = -_743;
    float _769 = fma(_733, _755, _767);
    float _771 = -_755;
    float _773 = fma(_733, _743, _771);
    float _775 = _765 * _741;
    float _777 = _769 * _741;
    float _779 = _751 * _727;
    float _781 = _655 * _751;
    float _783 = _683 * _751;
    float _785 = fma(_699, _779, _775);
    float _787 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _789 = _733 * _727;
    float _791 = fma(_733, _753, _735);
    float _793 = fma(_715, _779, _777);
    float _795 = fma(_773, _787, _785);
    float _797 = -_789;
    float _799 = fma(_781, _741, _797);
    float _801 = fma(_791, _787, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _807 = fma(_783, _787, _799);
    float _809 = _795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[9].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[8].x, _805);
    float _815 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[10].x, _809);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[9].z, _811);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[8].z, _813);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[10].z, _815);
    float _823 = _759 + _817;
    float _825 = _761 + _819;
    float _827 = _763 + _821;
    float _829 = _823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _833 = _823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _829);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _831);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _833);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _835);
    float _845 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _839);
    float _849 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _841);
    float _851 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _863);
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].z, _869);
    float _879 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].z, _871);
    float _881 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].z, _875);
    float _885 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _877);
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _883);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _887 + _891;
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _903 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _905;
    out.m_42.y = _901;
    out.m_42.z = _907;
    out.m_42.w = _897;
    out.gl_Position.x = _889;
    out.gl_Position.y = _885;
    out.gl_Position.z = _887;
    out.gl_Position.w = _891;
    out.m_44.z = _909;
    out.m_44.w = _891;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

