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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1410 = as_type<float>(_93);
        out.gl_Position.z = _1410;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1480 = as_type<float>(_131);
        out.gl_Position.z = _1480;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _137 * _135;
    float _143 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    int _145 = as_type<int>(_139) & 1;
    bool _147 = _145 != 0;
    int _149 = as_type<int>(_139) & 2;
    bool _151 = _149 != 0;
    float _153 = _143 * 6.283185482025146484375;
    float _155 = floor(_143);
    float _157 = _153 * 0.15915493667125701904296875;
    bool _159 = !_151;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_181);
    float _189 = -_155;
    float _191 = _143 + _189;
    int _193 = abs(_185);
    float _195 = -_191;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = float(_187);
    float _203 = fma(_177, 0.5, 0.5);
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    float _209 = abs(_197);
    float _211 = _201 * _209;
    int _213 = abs(_207);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = _191 < 0.5;
    float _221 = float(_219);
    float _223 = float(_193);
    float _225 = float(_213);
    float _227 = -_221;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _231 = !_147;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_223, _217, _211);
    float _237 = abs(_229);
    float _239 = fma(_225, _237, _235);
    bool _241 = !_199;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_77);
        float _263 = 1.0 / _261;
        float _265 = _111 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _271 = log2(_269);
    float _273 = in.m_30.x;
    float _275 = in.m_30.y;
    float _277 = in.m_30.z;
    float _279 = _133 * 2.0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = in.m_42.w;
    bool _301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _309 = _305 || _307;
    float _311 = floor(_279);
    float _313 = in.m_44.x;
    float _315 = in.m_44.y;
    float _317 = in.m_44.z;
    float _319 = in.m_44.w;
    float _321 = in.m_46.x;
    float _323 = in.m_46.y;
    float _325 = in.m_46.z;
    float _327 = in.m_46.w;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _331 = _329 != 0;
    float _333 = _271 * _111;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _343 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _347 = _311 > 0.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _351 = exp2(_333);
    float _353 = _275 * _295;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _357 = _275 * _315;
    float _359 = fma(_273, _293, _353);
    float _361 = in.m_37.y;
    float _363 = _275 * _323;
    float _365 = fma(_273, _313, _357);
    float _367 = fma(_277, _297, _359);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _373 = -_351;
    float _375 = _373 + 1.0;
    float _377 = fma(_273, _321, _363);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _309 ? _375 : 0.0;
    float _391 = 1.0 / _381;
    float _393 = in.m_37.z;
    bool _395 = _311 >= 0.0;
    bool _397 = isnan(_311);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _409 = _403 ? 0 : 1;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    bool _415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(1.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    float _425 = fma(_277, _317, _365);
    float _427 = _361 * 2.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _431 = 1.0 + _429;
    float _433 = 1.0 / _385;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _267 + _435;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _441 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _405;
    out.m_48.y = _343;
    out.m_48.z = _407;
    out.m_48.w = _387;
    float _447 = fma(_277, _325, _377);
    float _449 = 1.0 / _431;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _267 + _451;
    out.m_50.x = _441;
    out.m_50.y = _443;
    out.m_50.z = _445;
    out.m_50.w = _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = _267 + _455;
    float _459 = _393 * 2.0;
    float _461 = _453 * _391;
    float _463 = _133 + _361;
    float _465 = floor(_427);
    float _467 = _425 + _319;
    float _469 = _447 + _327;
    float _471 = _463 + (-1.0);
    float _473 = _437 * _433;
    float _475 = _361 + _393;
    float _477 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _479 = floor(_459);
    if (_423)
    {
        float _481 = _389 * _449;
        _113 = _481;
    }
    float _483 = _113;
    float _485 = _367 + _299;
    float _487 = 1.0 / _413;
    bool _489 = _465 >= 0.0;
    bool _491 = isnan(_465);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _511 = _497 ? 0 : 1;
    float _513 = fma(_501, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _133 + _393;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _535 = _523 ? 0 : 1;
    float _537 = _525 + (-1.0);
    float _539 = _475 + (-1.0);
    bool _541 = _479 > 0.0;
    float _543 = _457 * _487;
    float _545 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _547 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _549 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_267);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_505, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _563 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_267);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _577 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _579 = isnan(_267);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_267);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    int _601 = ~_409;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    int _607 = _605;
    if (!_347)
    {
        int _609 = ~_409;
        int _611 = _609 + 1;
        _607 = _611;
    }
    int _613 = _607;
    float _615 = -_599;
    float _617 = _615 + 1.0;
    bool _619 = _465 > 0.0;
    float _621 = -_559;
    float _623 = _621 + 1.0;
    float _625 = _587 * _617;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = _573 * _623;
    float _633 = -_573;
    float _635 = _633 + 1.0;
    float _637 = _513 * _625;
    bool _639 = !_287;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _625;
    float _645 = _599 * _635;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _647;
    float _651 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _655 = fma(_509, _473, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _657 = !_283;
    int _659 = _657 ? 0 : 1;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _469 + _661;
    int _665 = abs(_641);
    float _667 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _643);
    int _669 = ~_511;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = fma(_649, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _677 = ~_535;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _685 = _673;
    int _687 = _681;
    if (!_619)
    {
        int _689 = ~_511;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _467 + _695;
    if (!_541)
    {
        int _699 = ~_535;
        int _701 = _699 + 1;
        _687 = _701;
    }
    int _703 = _687;
    float _705 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _707 = abs(_659);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _711 = _485 + _709;
    float _713 = float(_665);
    float _715 = in.m_52.x;
    float _717 = in.m_52.y;
    float _719 = in.m_52.z;
    float _721 = float(_613);
    float _723 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _683);
    float _725 = float(_707);
    float _727 = _663 * _663;
    float _729 = float(_703);
    float _731 = _713 * _721;
    bool _733 = _133 > 0.5;
    float _735 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _723);
    bool _737 = _361 > 0.5;
    float _739 = _725 * _729;
    float _741 = -_233;
    int _743 = _733 ? as_type<int>(_741) : as_type<int>(_233);
    float _745 = _731 * (-2.0);
    bool _747 = _735 >= 0.0;
    float _749 = _361 + (-0.5);
    bool _751 = !_331;
    float _753 = _751 ? _233 : as_type<float>(_743);
    float _755 = fma(_547, _745, _547);
    float _757 = fma(_697, _697, _727);
    float _759 = -_161;
    int _761 = _737 ? as_type<int>(_759) : as_type<int>(_161);
    float _763 = _753 + 0.5;
    float _765 = fma(_711, _711, _757);
    bool _767 = !_337;
    float _769 = _767 ? _161 : as_type<float>(_761);
    float _771 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _773 = fma(_745, _717, _717);
    float _775 = _771;
    float _777 = _719;
    if (_747)
    {
        out.m_33.x = 0.0;
    }
    float _779 = -_769;
    float _781 = _779 + 0.5;
    float _783 = rsqrt(_765);
    float _785 = _771 * _341;
    if (_747)
    {
        _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _775;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _793 = _739 * (-2.0);
    float _795 = _789 * _575;
    int _797 = as_type<int>(_787);
    if (_747)
    {
        float _799 = _787 * 5.0;
        _797 = as_type<int>(_799);
    }
    int _801 = _797;
    float _803 = fma(_477, _793, _477);
    float _805 = fma(_793, _715, _715);
    float _807 = fma(_755, _483, _791);
    out.m_54.x = _785;
    out.m_54.y = _795;
    float _809 = _133 + (-0.5);
    bool _811 = !_291;
    int _813 = _811 ? 0 : 1;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_801);
        out.gl_Position.z = _2520;
    }
    float _815 = _663 * _783;
    float _817 = _697 * _783;
    if (_747)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _819 = -_815;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    float _823 = -_817;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    int _827 = abs(_813);
    float _829 = _711 * _783;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _821 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _837 = _825 + _835;
    float _839 = _807 * 0.15915493667125701904296875;
    float _841 = -_829;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = -_829;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _851 = fma(_705, _645, _667);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].x, _805);
    float _861 = float(_827);
    float _863 = _839 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = float(_693);
    float _869 = fma(_803, _483, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    float _873 = -_815;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _877 = -_817;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _881 = _861 * _867;
    float _883 = _869 * 0.15915493667125701904296875;
    bool _885 = _871 >= 0.0;
    float _887 = _875 * _875;
    float _889 = _881 * (-2.0);
    float _891 = _393 + (-0.5);
    float _893 = in.m_56.x;
    float _895 = in.m_56.y;
    float _897 = fma(_879, _879, _887);
    float _899 = fma(_545, _889, _545);
    float _901 = fma(_889, _719, _719);
    float _903 = _839 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = fma(_849, _849, _897);
    float _909 = fma(_675, _631, _851);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = fma(_655, _645, _653);
    if (_885)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _777;
    float _917 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _919 = fma(_899, _483, _911);
    float _921 = _883 * 6.283185482025146484375;
    float _923 = sin(_921);
    int _925 = as_type<int>(_915);
    if (_885)
    {
        float _927 = _915 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    float _931 = _919 * 0.15915493667125701904296875;
    if (_885)
    {
        out.m_33.x = 0.0;
    }
    float _933 = fma(_651, _631, _913);
    float _935 = _883 * 6.283185482025146484375;
    float _937 = cos(_935);
    if (_885)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_929);
        out.gl_Position.z = _2734;
    }
    float _939 = _917 * _895;
    float _941 = sqrt(_907);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    if (_885)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _947 = _239 * _939;
    float _949 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _951 = _931 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _783 * _941;
    float _957 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _959 = _949 * _893;
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _965 = _955 * _957;
    float _967 = _239 * _959;
    bool _969 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _971 = isnan(0.5);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    float _979 = _961 * _965;
    float _981 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _983 = _923 * _865;
    float _985 = _937 * _905;
    bool _987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _989 = isnan(0.5);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _995 = _991 || _993;
    float _997 = _955 * _981;
    float _999 = _953 * _979;
    float _1001 = fma(_945, _985, _983);
    float _1003 = fma(_945, _983, _985);
    float _1005 = _963 * _997;
    float _1007 = _937 * _865;
    float _1009 = _937 * _999;
    float _1011 = _865 * _953;
    float _1013 = _905 * _953;
    float _1015 = _923 * _905;
    float _1017 = fma(_1001, _1005, _1009);
    float _1019 = -_979;
    float _1021 = _945 * _1019;
    float _1023 = _955 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _1023 * 0.5;
    float _1027 = -_1015;
    float _1029 = fma(_945, _1007, _1027);
    float _1031 = -_1007;
    float _1033 = fma(_945, _1015, _1031);
    float _1035 = _923 * _999;
    float _1037 = fma(_1013, _1005, _1021);
    float _1039 = fma(_1029, _1025, _1017);
    float _1041 = fma(_1033, _1005, _1035);
    float _1043 = fma(_1011, _1025, _1037);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1003, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1059 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _485 + _1059;
    float _1065 = _821 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _467 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1075 = _1067 + _1073;
    float _1077 = _1071 * _1071;
    float _1079 = fma(_1075, _1075, _1077);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1083 = sqrt(_1079);
    float _1085 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1081);
    float _1087 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1089 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1091 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1093 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1087);
    float _1095 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1093);
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = 1.0 / _1097;
    float _1105 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _1101 + _1097;
    bool _1109 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _469 + _1105;
    float _1113 = _1101;
    float _1115 = _1067;
    float _1117 = _1063;
    if (!_1109)
    {
        _1113 = _1067;
    }
    float _1119 = _1113;
    float _1121 = _1119;
    if (!_1109)
    {
        _1115 = _1063;
    }
    float _1123 = _1115;
    float _1125 = _1123;
    if (!_1109)
    {
        _1117 = _1111;
    }
    float _1127 = _1117;
    bool _1129 = !_1109;
    float _1131 = _1127;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1083 + _1135;
        float _1139 = rsqrt(_1079);
        float _1141 = _1137 * _1133;
        float _1143 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = fma(_1149, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = _1139 * _1155;
        float _1159 = _1153 + (-1.0);
        float _1161 = fma(_1075, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1071, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1165 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = fma(_1111, _1153, _1165);
        _1121 = _1161;
        _1131 = _1167;
        _1125 = _1163;
    }
    float _1169 = _1121;
    float _1171 = _1131;
    float _1173 = _1125;
    float _1175 = -_817;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1179 = -_815;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1183 = -_829;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1187 = _1107 * _1103;
    float _1189 = _1187 * 0.5;
    float _1191 = _1181;
    float _1193 = _1177;
    float _1195 = _1185;
    if (!_977)
    {
        float _1197 = _833 * _833;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1201 = -_467;
        float _1203 = _1201 + _1169;
        float _1205 = -_469;
        float _1207 = _1205 + _1171;
        float _1209 = fma(_837, _837, _1197);
        float _1211 = fma(_855, _855, _1209);
        float _1213 = 1.0 / _955;
        float _1215 = sqrt(_1211);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1199;
        float _1221 = -_485;
        float _1223 = _1221 + _1173;
        float _1225 = _1219 * _1213;
        float _1227 = fma(_1203, _1225, _825);
        float _1229 = fma(_1207, _1225, _821);
        float _1231 = fma(_1223, _1225, _843);
        _1191 = _1229;
        _1193 = _1227;
        _1195 = _1231;
    }
    float _1233 = _1191;
    float _1235 = _1193;
    float _1237 = _1195;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = _1233;
    if (_995)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_995)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1263 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1269 = 1.0 / _1263;
        float _1271 = 1.0 / _1267;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1269, _1273, _1275);
        float _1279 = _1277 * _1271;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1249);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = _239 * _1291;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1301);
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1303);
    float _1313 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1317 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1309);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1325 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    bool _1331 = _1283 > 0.0;
    bool _1333 = isnan(_1283);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1323);
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1345 = _1327 + _1329;
    float _1347 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1349 = _1307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1351 = _1345 * 0.5;
    out.m_33.x = _1349;
    out.gl_Position.x = _1343;
    out.gl_Position.y = _1347;
    out.gl_Position.z = _1327;
    out.gl_Position.w = _1329;
    out.m_58.z = _1351;
    out.m_58.w = _1329;
    if (_1339)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1410 = as_type<float>(_93);
        out.gl_Position.z = _1410;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1480 = as_type<float>(_131);
        out.gl_Position.z = _1480;
    }
    if (_123)
    {
        return out;
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _137 * _135;
    float _143 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    int _145 = as_type<int>(_139) & 1;
    bool _147 = _145 != 0;
    int _149 = as_type<int>(_139) & 2;
    bool _151 = _149 != 0;
    float _153 = _143 * 6.283185482025146484375;
    float _155 = floor(_143);
    float _157 = _153 * 0.15915493667125701904296875;
    bool _159 = !_151;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_181);
    float _189 = -_155;
    float _191 = _143 + _189;
    int _193 = abs(_185);
    float _195 = -_191;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = float(_187);
    float _203 = fma(_177, 0.5, 0.5);
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    float _209 = abs(_197);
    float _211 = _201 * _209;
    int _213 = abs(_207);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = _191 < 0.5;
    float _221 = float(_219);
    float _223 = float(_193);
    float _225 = float(_213);
    float _227 = -_221;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _231 = !_147;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_223, _217, _211);
    float _237 = abs(_229);
    float _239 = fma(_225, _237, _235);
    bool _241 = !_199;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_77);
        float _263 = 1.0 / _261;
        float _265 = _111 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _271 = log2(_269);
    float _273 = in.m_30.x;
    float _275 = in.m_30.y;
    float _277 = in.m_30.z;
    float _279 = _133 * 2.0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = in.m_42.w;
    bool _301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _309 = _305 || _307;
    float _311 = floor(_279);
    float _313 = in.m_44.x;
    float _315 = in.m_44.y;
    float _317 = in.m_44.z;
    float _319 = in.m_44.w;
    float _321 = in.m_46.x;
    float _323 = in.m_46.y;
    float _325 = in.m_46.z;
    float _327 = in.m_46.w;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _331 = _329 != 0;
    float _333 = _271 * _111;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _343 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _347 = _311 > 0.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _351 = exp2(_333);
    float _353 = _275 * _295;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _357 = _275 * _315;
    float _359 = fma(_273, _293, _353);
    float _361 = in.m_37.y;
    float _363 = _275 * _323;
    float _365 = fma(_273, _313, _357);
    float _367 = fma(_277, _297, _359);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _373 = -_351;
    float _375 = _373 + 1.0;
    float _377 = fma(_273, _321, _363);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _309 ? _375 : 0.0;
    float _391 = 1.0 / _381;
    float _393 = in.m_37.z;
    bool _395 = _311 >= 0.0;
    bool _397 = isnan(_311);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _409 = _403 ? 0 : 1;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    bool _415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(1.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    float _425 = fma(_277, _317, _365);
    float _427 = _361 * 2.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _431 = 1.0 + _429;
    float _433 = 1.0 / _385;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _267 + _435;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _441 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _405;
    out.m_48.y = _343;
    out.m_48.z = _407;
    out.m_48.w = _387;
    float _447 = fma(_277, _325, _377);
    float _449 = 1.0 / _431;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _267 + _451;
    out.m_50.x = _441;
    out.m_50.y = _443;
    out.m_50.z = _445;
    out.m_50.w = _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = _267 + _455;
    float _459 = _393 * 2.0;
    float _461 = _453 * _391;
    float _463 = _133 + _361;
    float _465 = floor(_427);
    float _467 = _425 + _319;
    float _469 = _447 + _327;
    float _471 = _463 + (-1.0);
    float _473 = _437 * _433;
    float _475 = _361 + _393;
    float _477 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _479 = floor(_459);
    if (_423)
    {
        float _481 = _389 * _449;
        _113 = _481;
    }
    float _483 = _113;
    float _485 = _367 + _299;
    float _487 = 1.0 / _413;
    bool _489 = _465 >= 0.0;
    bool _491 = isnan(_465);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _511 = _497 ? 0 : 1;
    float _513 = fma(_501, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _133 + _393;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _535 = _523 ? 0 : 1;
    float _537 = _525 + (-1.0);
    float _539 = _475 + (-1.0);
    bool _541 = _479 > 0.0;
    float _543 = _457 * _487;
    float _545 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _547 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _549 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_267);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_505, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _563 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_267);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _577 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _579 = isnan(_267);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_267);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    int _601 = ~_409;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    int _607 = _605;
    if (!_347)
    {
        int _609 = ~_409;
        int _611 = _609 + 1;
        _607 = _611;
    }
    int _613 = _607;
    float _615 = -_599;
    float _617 = _615 + 1.0;
    bool _619 = _465 > 0.0;
    float _621 = -_559;
    float _623 = _621 + 1.0;
    float _625 = _587 * _617;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = _573 * _623;
    float _633 = -_573;
    float _635 = _633 + 1.0;
    float _637 = _513 * _625;
    bool _639 = !_287;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _625;
    float _645 = _599 * _635;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _647;
    float _651 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _655 = fma(_509, _473, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _657 = !_283;
    int _659 = _657 ? 0 : 1;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _469 + _661;
    int _665 = abs(_641);
    float _667 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _643);
    int _669 = ~_511;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = fma(_649, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _677 = ~_535;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _685 = _673;
    int _687 = _681;
    if (!_619)
    {
        int _689 = ~_511;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _467 + _695;
    if (!_541)
    {
        int _699 = ~_535;
        int _701 = _699 + 1;
        _687 = _701;
    }
    int _703 = _687;
    float _705 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _707 = abs(_659);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _711 = _485 + _709;
    float _713 = float(_665);
    float _715 = in.m_52.x;
    float _717 = in.m_52.y;
    float _719 = in.m_52.z;
    float _721 = float(_613);
    float _723 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _683);
    float _725 = float(_707);
    float _727 = _663 * _663;
    float _729 = float(_703);
    float _731 = _713 * _721;
    bool _733 = _133 > 0.5;
    float _735 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _723);
    bool _737 = _361 > 0.5;
    float _739 = _725 * _729;
    float _741 = -_233;
    int _743 = _733 ? as_type<int>(_741) : as_type<int>(_233);
    float _745 = _731 * (-2.0);
    bool _747 = _735 >= 0.0;
    float _749 = _361 + (-0.5);
    bool _751 = !_331;
    float _753 = _751 ? _233 : as_type<float>(_743);
    float _755 = fma(_547, _745, _547);
    float _757 = fma(_697, _697, _727);
    float _759 = -_161;
    int _761 = _737 ? as_type<int>(_759) : as_type<int>(_161);
    float _763 = _753 + 0.5;
    float _765 = fma(_711, _711, _757);
    bool _767 = !_337;
    float _769 = _767 ? _161 : as_type<float>(_761);
    float _771 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _773 = fma(_745, _717, _717);
    float _775 = _771;
    float _777 = _719;
    if (_747)
    {
        out.m_33.x = 0.0;
    }
    float _779 = -_769;
    float _781 = _779 + 0.5;
    float _783 = rsqrt(_765);
    float _785 = _771 * _341;
    if (_747)
    {
        _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _775;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _793 = _739 * (-2.0);
    float _795 = _789 * _575;
    int _797 = as_type<int>(_787);
    if (_747)
    {
        float _799 = _787 * 5.0;
        _797 = as_type<int>(_799);
    }
    int _801 = _797;
    float _803 = fma(_477, _793, _477);
    float _805 = fma(_793, _715, _715);
    float _807 = fma(_755, _483, _791);
    out.m_54.x = _785;
    out.m_54.y = _795;
    float _809 = _133 + (-0.5);
    bool _811 = !_291;
    int _813 = _811 ? 0 : 1;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_801);
        out.gl_Position.z = _2520;
    }
    float _815 = _663 * _783;
    float _817 = _697 * _783;
    if (_747)
    {
        return out;
    }
    float _819 = -_815;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    float _823 = -_817;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    int _827 = abs(_813);
    float _829 = _711 * _783;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _821 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _837 = _825 + _835;
    float _839 = _807 * 0.15915493667125701904296875;
    float _841 = -_829;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = -_829;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _851 = fma(_705, _645, _667);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].x, _805);
    float _861 = float(_827);
    float _863 = _839 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = float(_693);
    float _869 = fma(_803, _483, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    float _873 = -_815;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _877 = -_817;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _881 = _861 * _867;
    float _883 = _869 * 0.15915493667125701904296875;
    bool _885 = _871 >= 0.0;
    float _887 = _875 * _875;
    float _889 = _881 * (-2.0);
    float _891 = _393 + (-0.5);
    float _893 = in.m_56.x;
    float _895 = in.m_56.y;
    float _897 = fma(_879, _879, _887);
    float _899 = fma(_545, _889, _545);
    float _901 = fma(_889, _719, _719);
    float _903 = _839 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = fma(_849, _849, _897);
    float _909 = fma(_675, _631, _851);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = fma(_655, _645, _653);
    if (_885)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _777;
    float _917 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _919 = fma(_899, _483, _911);
    float _921 = _883 * 6.283185482025146484375;
    float _923 = sin(_921);
    int _925 = as_type<int>(_915);
    if (_885)
    {
        float _927 = _915 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    float _931 = _919 * 0.15915493667125701904296875;
    if (_885)
    {
        out.m_33.x = 0.0;
    }
    float _933 = fma(_651, _631, _913);
    float _935 = _883 * 6.283185482025146484375;
    float _937 = cos(_935);
    if (_885)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_929);
        out.gl_Position.z = _2734;
    }
    float _939 = _917 * _895;
    float _941 = sqrt(_907);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    if (_885)
    {
        return out;
    }
    float _947 = _239 * _939;
    float _949 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _951 = _931 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _783 * _941;
    float _957 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _959 = _949 * _893;
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _965 = _955 * _957;
    float _967 = _239 * _959;
    bool _969 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _971 = isnan(0.5);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    float _979 = _961 * _965;
    float _981 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _983 = _923 * _865;
    float _985 = _937 * _905;
    bool _987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _989 = isnan(0.5);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _995 = _991 || _993;
    float _997 = _955 * _981;
    float _999 = _953 * _979;
    float _1001 = fma(_945, _985, _983);
    float _1003 = fma(_945, _983, _985);
    float _1005 = _963 * _997;
    float _1007 = _937 * _865;
    float _1009 = _937 * _999;
    float _1011 = _865 * _953;
    float _1013 = _905 * _953;
    float _1015 = _923 * _905;
    float _1017 = fma(_1001, _1005, _1009);
    float _1019 = -_979;
    float _1021 = _945 * _1019;
    float _1023 = _955 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _1023 * 0.5;
    float _1027 = -_1015;
    float _1029 = fma(_945, _1007, _1027);
    float _1031 = -_1007;
    float _1033 = fma(_945, _1015, _1031);
    float _1035 = _923 * _999;
    float _1037 = fma(_1013, _1005, _1021);
    float _1039 = fma(_1029, _1025, _1017);
    float _1041 = fma(_1033, _1005, _1035);
    float _1043 = fma(_1011, _1025, _1037);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1003, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1059 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _485 + _1059;
    float _1065 = _821 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _467 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1075 = _1067 + _1073;
    float _1077 = _1071 * _1071;
    float _1079 = fma(_1075, _1075, _1077);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1083 = sqrt(_1079);
    float _1085 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1081);
    float _1087 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1089 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1091 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1093 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1087);
    float _1095 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1093);
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = 1.0 / _1097;
    float _1105 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _1101 + _1097;
    bool _1109 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _469 + _1105;
    float _1113 = _1101;
    float _1115 = _1067;
    float _1117 = _1063;
    if (!_1109)
    {
        _1113 = _1067;
    }
    float _1119 = _1113;
    float _1121 = _1119;
    if (!_1109)
    {
        _1115 = _1063;
    }
    float _1123 = _1115;
    float _1125 = _1123;
    if (!_1109)
    {
        _1117 = _1111;
    }
    float _1127 = _1117;
    bool _1129 = !_1109;
    float _1131 = _1127;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1083 + _1135;
        float _1139 = rsqrt(_1079);
        float _1141 = _1137 * _1133;
        float _1143 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = fma(_1149, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = _1139 * _1155;
        float _1159 = _1153 + (-1.0);
        float _1161 = fma(_1075, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1071, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1165 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = fma(_1111, _1153, _1165);
        _1121 = _1161;
        _1131 = _1167;
        _1125 = _1163;
    }
    float _1169 = _1121;
    float _1171 = _1131;
    float _1173 = _1125;
    float _1175 = -_817;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1179 = -_815;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1183 = -_829;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1187 = _1107 * _1103;
    float _1189 = _1187 * 0.5;
    float _1191 = _1181;
    float _1193 = _1177;
    float _1195 = _1185;
    if (!_977)
    {
        float _1197 = _833 * _833;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1201 = -_467;
        float _1203 = _1201 + _1169;
        float _1205 = -_469;
        float _1207 = _1205 + _1171;
        float _1209 = fma(_837, _837, _1197);
        float _1211 = fma(_855, _855, _1209);
        float _1213 = 1.0 / _955;
        float _1215 = sqrt(_1211);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1199;
        float _1221 = -_485;
        float _1223 = _1221 + _1173;
        float _1225 = _1219 * _1213;
        float _1227 = fma(_1203, _1225, _825);
        float _1229 = fma(_1207, _1225, _821);
        float _1231 = fma(_1223, _1225, _843);
        _1191 = _1229;
        _1193 = _1227;
        _1195 = _1231;
    }
    float _1233 = _1191;
    float _1235 = _1193;
    float _1237 = _1195;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = _1233;
    if (_995)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_995)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1263 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1269 = 1.0 / _1263;
        float _1271 = 1.0 / _1267;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1269, _1273, _1275);
        float _1279 = _1277 * _1271;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1249);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = _239 * _1291;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1301);
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1303);
    float _1313 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1317 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1309);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1325 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    bool _1331 = _1283 > 0.0;
    bool _1333 = isnan(_1283);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1323);
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1345 = _1327 + _1329;
    float _1347 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1349 = _1307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1351 = _1345 * 0.5;
    out.m_33.x = _1349;
    out.gl_Position.x = _1343;
    out.gl_Position.y = _1347;
    out.gl_Position.z = _1327;
    out.gl_Position.w = _1329;
    out.m_58.z = _1351;
    out.m_58.w = _1329;
    if (_1339)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1353;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1410 = as_type<float>(_93);
        out.gl_Position.z = _1410;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1480 = as_type<float>(_131);
        out.gl_Position.z = _1480;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _137 * _135;
    float _143 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    int _145 = as_type<int>(_139) & 1;
    bool _147 = _145 != 0;
    int _149 = as_type<int>(_139) & 2;
    bool _151 = _149 != 0;
    float _153 = _143 * 6.283185482025146484375;
    float _155 = floor(_143);
    float _157 = _153 * 0.15915493667125701904296875;
    bool _159 = !_151;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_173;
    int _185 = _183 ? 0 : 1;
    int _187 = abs(_181);
    float _189 = -_155;
    float _191 = _143 + _189;
    int _193 = abs(_185);
    float _195 = -_191;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = float(_187);
    float _203 = fma(_177, 0.5, 0.5);
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    float _209 = abs(_197);
    float _211 = _201 * _209;
    int _213 = abs(_207);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = _191 < 0.5;
    float _221 = float(_219);
    float _223 = float(_193);
    float _225 = float(_213);
    float _227 = -_221;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _231 = !_147;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_223, _217, _211);
    float _237 = abs(_229);
    float _239 = fma(_225, _237, _235);
    bool _241 = !_199;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_77);
        float _263 = 1.0 / _261;
        float _265 = _111 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _271 = log2(_269);
    float _273 = in.m_30.x;
    float _275 = in.m_30.y;
    float _277 = in.m_30.z;
    float _279 = _133 * 2.0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _287 = _285 != 0;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _291 = _289 != 0;
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = in.m_42.w;
    bool _301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _309 = _305 || _307;
    float _311 = floor(_279);
    float _313 = in.m_44.x;
    float _315 = in.m_44.y;
    float _317 = in.m_44.z;
    float _319 = in.m_44.w;
    float _321 = in.m_46.x;
    float _323 = in.m_46.y;
    float _325 = in.m_46.z;
    float _327 = in.m_46.w;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _331 = _329 != 0;
    float _333 = _271 * _111;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _337 = _335 != 0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _343 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _347 = _311 > 0.0;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _351 = exp2(_333);
    float _353 = _275 * _295;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _357 = _275 * _315;
    float _359 = fma(_273, _293, _353);
    float _361 = in.m_37.y;
    float _363 = _275 * _323;
    float _365 = fma(_273, _313, _357);
    float _367 = fma(_277, _297, _359);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _373 = -_351;
    float _375 = _373 + 1.0;
    float _377 = fma(_273, _321, _363);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _309 ? _375 : 0.0;
    float _391 = 1.0 / _381;
    float _393 = in.m_37.z;
    bool _395 = _311 >= 0.0;
    bool _397 = isnan(_311);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _409 = _403 ? 0 : 1;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    bool _415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(1.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    float _425 = fma(_277, _317, _365);
    float _427 = _361 * 2.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _431 = 1.0 + _429;
    float _433 = 1.0 / _385;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _267 + _435;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _441 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _443 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _445 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _405;
    out.m_48.y = _343;
    out.m_48.z = _407;
    out.m_48.w = _387;
    float _447 = fma(_277, _325, _377);
    float _449 = 1.0 / _431;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _453 = _267 + _451;
    out.m_50.x = _441;
    out.m_50.y = _443;
    out.m_50.z = _445;
    out.m_50.w = _439;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = _267 + _455;
    float _459 = _393 * 2.0;
    float _461 = _453 * _391;
    float _463 = _133 + _361;
    float _465 = floor(_427);
    float _467 = _425 + _319;
    float _469 = _447 + _327;
    float _471 = _463 + (-1.0);
    float _473 = _437 * _433;
    float _475 = _361 + _393;
    float _477 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _479 = floor(_459);
    if (_423)
    {
        float _481 = _389 * _449;
        _113 = _481;
    }
    float _483 = _113;
    float _485 = _367 + _299;
    float _487 = 1.0 / _413;
    bool _489 = _465 >= 0.0;
    bool _491 = isnan(_465);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _511 = _497 ? 0 : 1;
    float _513 = fma(_501, _461, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _133 + _393;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _535 = _523 ? 0 : 1;
    float _537 = _525 + (-1.0);
    float _539 = _475 + (-1.0);
    bool _541 = _479 > 0.0;
    float _543 = _457 * _487;
    float _545 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _547 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _549 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_267);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_505, _461, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _563 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_267);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _577 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _579 = isnan(_267);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_267);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    int _601 = ~_409;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    int _607 = _605;
    if (!_347)
    {
        int _609 = ~_409;
        int _611 = _609 + 1;
        _607 = _611;
    }
    int _613 = _607;
    float _615 = -_599;
    float _617 = _615 + 1.0;
    bool _619 = _465 > 0.0;
    float _621 = -_559;
    float _623 = _621 + 1.0;
    float _625 = _587 * _617;
    float _627 = -_587;
    float _629 = _627 + 1.0;
    float _631 = _573 * _623;
    float _633 = -_573;
    float _635 = _633 + 1.0;
    float _637 = _513 * _625;
    bool _639 = !_287;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _625;
    float _645 = _599 * _635;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _647;
    float _651 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _655 = fma(_509, _473, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _657 = !_283;
    int _659 = _657 ? 0 : 1;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _469 + _661;
    int _665 = abs(_641);
    float _667 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[143].y, _643);
    int _669 = ~_511;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = fma(_649, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _677 = ~_535;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _685 = _673;
    int _687 = _681;
    if (!_619)
    {
        int _689 = ~_511;
        int _691 = _689 + 1;
        _685 = _691;
    }
    int _693 = _685;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _467 + _695;
    if (!_541)
    {
        int _699 = ~_535;
        int _701 = _699 + 1;
        _687 = _701;
    }
    int _703 = _687;
    float _705 = fma(_533, _473, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _707 = abs(_659);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _711 = _485 + _709;
    float _713 = float(_665);
    float _715 = in.m_52.x;
    float _717 = in.m_52.y;
    float _719 = in.m_52.z;
    float _721 = float(_613);
    float _723 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _683);
    float _725 = float(_707);
    float _727 = _663 * _663;
    float _729 = float(_703);
    float _731 = _713 * _721;
    bool _733 = _133 > 0.5;
    float _735 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[28].z, _723);
    bool _737 = _361 > 0.5;
    float _739 = _725 * _729;
    float _741 = -_233;
    int _743 = _733 ? as_type<int>(_741) : as_type<int>(_233);
    float _745 = _731 * (-2.0);
    bool _747 = _735 >= 0.0;
    float _749 = _361 + (-0.5);
    bool _751 = !_331;
    float _753 = _751 ? _233 : as_type<float>(_743);
    float _755 = fma(_547, _745, _547);
    float _757 = fma(_697, _697, _727);
    float _759 = -_161;
    int _761 = _737 ? as_type<int>(_759) : as_type<int>(_161);
    float _763 = _753 + 0.5;
    float _765 = fma(_711, _711, _757);
    bool _767 = !_337;
    float _769 = _767 ? _161 : as_type<float>(_761);
    float _771 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _773 = fma(_745, _717, _717);
    float _775 = _771;
    float _777 = _719;
    if (_747)
    {
        out.m_33.x = 0.0;
    }
    float _779 = -_769;
    float _781 = _779 + 0.5;
    float _783 = rsqrt(_765);
    float _785 = _771 * _341;
    if (_747)
    {
        _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _775;
    float _789 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _793 = _739 * (-2.0);
    float _795 = _789 * _575;
    int _797 = as_type<int>(_787);
    if (_747)
    {
        float _799 = _787 * 5.0;
        _797 = as_type<int>(_799);
    }
    int _801 = _797;
    float _803 = fma(_477, _793, _477);
    float _805 = fma(_793, _715, _715);
    float _807 = fma(_755, _483, _791);
    out.m_54.x = _785;
    out.m_54.y = _795;
    float _809 = _133 + (-0.5);
    bool _811 = !_291;
    int _813 = _811 ? 0 : 1;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_801);
        out.gl_Position.z = _2520;
    }
    float _815 = _663 * _783;
    float _817 = _697 * _783;
    if (_747)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _819 = -_815;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    float _823 = -_817;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    int _827 = abs(_813);
    float _829 = _711 * _783;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _833 = _821 + _831;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _837 = _825 + _835;
    float _839 = _807 * 0.15915493667125701904296875;
    float _841 = -_829;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _845 = _833 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = -_829;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _851 = fma(_705, _645, _667);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].x, _805);
    float _861 = float(_827);
    float _863 = _839 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = float(_693);
    float _869 = fma(_803, _483, _859);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    float _873 = -_815;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _877 = -_817;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _881 = _861 * _867;
    float _883 = _869 * 0.15915493667125701904296875;
    bool _885 = _871 >= 0.0;
    float _887 = _875 * _875;
    float _889 = _881 * (-2.0);
    float _891 = _393 + (-0.5);
    float _893 = in.m_56.x;
    float _895 = in.m_56.y;
    float _897 = fma(_879, _879, _887);
    float _899 = fma(_545, _889, _545);
    float _901 = fma(_889, _719, _719);
    float _903 = _839 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = fma(_849, _849, _897);
    float _909 = fma(_675, _631, _851);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = fma(_655, _645, _653);
    if (_885)
    {
        _777 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _915 = _777;
    float _917 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _909);
    float _919 = fma(_899, _483, _911);
    float _921 = _883 * 6.283185482025146484375;
    float _923 = sin(_921);
    int _925 = as_type<int>(_915);
    if (_885)
    {
        float _927 = _915 * 5.0;
        _925 = as_type<int>(_927);
    }
    int _929 = _925;
    float _931 = _919 * 0.15915493667125701904296875;
    if (_885)
    {
        out.m_33.x = 0.0;
    }
    float _933 = fma(_651, _631, _913);
    float _935 = _883 * 6.283185482025146484375;
    float _937 = cos(_935);
    if (_885)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_929);
        out.gl_Position.z = _2734;
    }
    float _939 = _917 * _895;
    float _941 = sqrt(_907);
    float _943 = _931 * 6.283185482025146484375;
    float _945 = sin(_943);
    if (_885)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _947 = _239 * _939;
    float _949 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _951 = _931 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _783 * _941;
    float _957 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _959 = _949 * _893;
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _965 = _955 * _957;
    float _967 = _239 * _959;
    bool _969 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _971 = isnan(0.5);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    float _979 = _961 * _965;
    float _981 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _983 = _923 * _865;
    float _985 = _937 * _905;
    bool _987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _989 = isnan(0.5);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _995 = _991 || _993;
    float _997 = _955 * _981;
    float _999 = _953 * _979;
    float _1001 = fma(_945, _985, _983);
    float _1003 = fma(_945, _983, _985);
    float _1005 = _963 * _997;
    float _1007 = _937 * _865;
    float _1009 = _937 * _999;
    float _1011 = _865 * _953;
    float _1013 = _905 * _953;
    float _1015 = _923 * _905;
    float _1017 = fma(_1001, _1005, _1009);
    float _1019 = -_979;
    float _1021 = _945 * _1019;
    float _1023 = _955 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _1023 * 0.5;
    float _1027 = -_1015;
    float _1029 = fma(_945, _1007, _1027);
    float _1031 = -_1007;
    float _1033 = fma(_945, _1015, _1031);
    float _1035 = _923 * _999;
    float _1037 = fma(_1013, _1005, _1021);
    float _1039 = fma(_1029, _1025, _1017);
    float _1041 = fma(_1033, _1005, _1035);
    float _1043 = fma(_1011, _1025, _1037);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1003, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1055 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1057 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1053);
    float _1059 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _485 + _1059;
    float _1065 = _821 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _467 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1075 = _1067 + _1073;
    float _1077 = _1071 * _1071;
    float _1079 = fma(_1075, _1075, _1077);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1083 = sqrt(_1079);
    float _1085 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1081);
    float _1087 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1089 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1091 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1093 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1087);
    float _1095 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1093);
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = 1.0 / _1097;
    float _1105 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1107 = _1101 + _1097;
    bool _1109 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _469 + _1105;
    float _1113 = _1101;
    float _1115 = _1067;
    float _1117 = _1063;
    if (!_1109)
    {
        _1113 = _1067;
    }
    float _1119 = _1113;
    float _1121 = _1119;
    if (!_1109)
    {
        _1115 = _1063;
    }
    float _1123 = _1115;
    float _1125 = _1123;
    if (!_1109)
    {
        _1117 = _1111;
    }
    float _1127 = _1117;
    bool _1129 = !_1109;
    float _1131 = _1127;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1083 + _1135;
        float _1139 = rsqrt(_1079);
        float _1141 = _1137 * _1133;
        float _1143 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = fma(_1149, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = _1139 * _1155;
        float _1159 = _1153 + (-1.0);
        float _1161 = fma(_1075, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1071, _1157, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1165 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = fma(_1111, _1153, _1165);
        _1121 = _1161;
        _1131 = _1167;
        _1125 = _1163;
    }
    float _1169 = _1121;
    float _1171 = _1131;
    float _1173 = _1125;
    float _1175 = -_817;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1179 = -_815;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1171);
    float _1183 = -_829;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1187 = _1107 * _1103;
    float _1189 = _1187 * 0.5;
    float _1191 = _1181;
    float _1193 = _1177;
    float _1195 = _1185;
    if (!_977)
    {
        float _1197 = _833 * _833;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1201 = -_467;
        float _1203 = _1201 + _1169;
        float _1205 = -_469;
        float _1207 = _1205 + _1171;
        float _1209 = fma(_837, _837, _1197);
        float _1211 = fma(_855, _855, _1209);
        float _1213 = 1.0 / _955;
        float _1215 = sqrt(_1211);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1199;
        float _1221 = -_485;
        float _1223 = _1221 + _1173;
        float _1225 = _1219 * _1213;
        float _1227 = fma(_1203, _1225, _825);
        float _1229 = fma(_1207, _1225, _821);
        float _1231 = fma(_1223, _1225, _843);
        _1191 = _1229;
        _1193 = _1227;
        _1195 = _1231;
    }
    float _1233 = _1191;
    float _1235 = _1193;
    float _1237 = _1195;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = _1233;
    if (_995)
    {
        _1255 = 1.0;
    }
    float _1257 = _1255;
    float _1259 = _1257;
    if (!_995)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1263 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1261);
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1269 = 1.0 / _1263;
        float _1271 = 1.0 / _1267;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1269, _1273, _1275);
        float _1279 = _1277 * _1271;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1249);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1289 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1303 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = _239 * _1291;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1301);
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1303);
    float _1313 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1317 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1309);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1325 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1327 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1319);
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1321);
    bool _1331 = _1283 > 0.0;
    bool _1333 = isnan(_1283);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.0);
    bool _1339 = _1335 || _1337;
    float _1341 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1323);
    float _1343 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1345 = _1327 + _1329;
    float _1347 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1341);
    float _1349 = _1307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1351 = _1345 * 0.5;
    out.m_33.x = _1349;
    out.gl_Position.x = _1343;
    out.gl_Position.y = _1347;
    out.gl_Position.z = _1327;
    out.gl_Position.w = _1329;
    out.m_58.z = _1351;
    out.m_58.w = _1329;
    if (_1339)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

