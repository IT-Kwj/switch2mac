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
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1408 = as_type<float>(_85);
        out.gl_Position.z = _1408;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1477 = as_type<float>(_121);
        out.gl_Position.z = _1477;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _127 * _125;
    float _145 = 0.0;
    float _147 = _131;
    if (!_141)
    {
        float _149 = _131 * _131;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    float _157 = _153;
    if (!_141)
    {
        float _159 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _159;
    }
    float _161 = _157;
    float _163 = in.m_35.x;
    float _165 = in.m_35.y;
    float _167 = in.m_35.z;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _181 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_175;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_141;
    float _205 = _161;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _131 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _131);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_141;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _131 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _147 = _259;
    }
    float _261 = _147;
    float _263 = in.m_42.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = fma(_189, 0.5, 0.5);
    bool _275 = _197 < 0.5;
    float _277 = float(_275);
    float _279 = -_197;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = in.m_30.x;
    float _285 = in.m_30.y;
    float _287 = in.m_30.z;
    bool _289 = !_267;
    int _291 = _289 ? 0 : 1;
    float _293 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _295 = !_185;
    int _297 = _295 ? 0 : 1;
    float _299 = -_277;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_273;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_291);
    float _309 = fma(_261, _163, _293);
    int _311 = abs(_297);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _165, _313);
    float _327 = float(_307);
    float _329 = fma(_261, _167, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_325, _263, _285);
    float _339 = fma(_329, _263, _287);
    float _341 = float(_323);
    float _343 = fma(_331, _305, _335);
    float _345 = fma(_309, _263, _283);
    float _347 = abs(_301);
    float _349 = fma(_341, _347, _343);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_69);
        float _373 = 1.0 / _371;
        float _375 = _103 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = 1.0 / _381;
    float _397 = 1.0 / _389;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = 1.0 / _385;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _377 + _413;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _419 = 1.0 / _393;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _377 + _423;
    float _427 = _425 * _395;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = _377 + _429;
    out.m_44.x = _421;
    out.m_44.y = _407;
    out.m_44.z = _411;
    out.m_44.w = _405;
    float _433 = _415 * _409;
    float _435 = _431 * _397;
    bool _437 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _439 = isnan(_377);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _377 + _449;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = _451 * _419;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    bool _463 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_377);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    bool _479 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _481 = isnan(_377);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_461, _427, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = fma(_477, _427, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = _473 * _455;
    bool _497 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _519 = isnan(_377);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -_473;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = _507 * _515;
    float _539 = -_507;
    float _541 = _539 + 1.0;
    float _543 = _489 * _531;
    float _545 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_535, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = _527 * _541;
    float _551 = in.m_42.x;
    float _553 = in.m_42.y;
    float _555 = -_527;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = _491 * _549;
    float _565 = _493 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_561, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _577 = fma(_569, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_545, _537, _573);
    float _589 = fma(_547, _537, _575);
    float _591 = fma(_581, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_585, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _595 = fma(_571, _543, _587);
    float _597 = fma(_577, _543, _589);
    float _599 = fma(_591, _495, _595);
    float _601 = fma(_593, _495, _597);
    float _603 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _551;
    float _609 = _605 * _553;
    bool _611 = !_417;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _615 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_69);
        float _633 = 1.0 / _631;
        float _635 = _103 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = in.m_37.y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _649 = _123 > 0.5;
    float _651 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = 1.0 / _643;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _669 = 1.0 / _647;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _671;
    float _675 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _677 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _637 + _679;
    float _683 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    bool _685 = _639 > 0.5;
    float _687 = 1.0 / _673;
    float _689 = _681 * _653;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _637 + _691;
    float _695 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _667);
    float _697 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _701 = _637 + _699;
    float _703 = _693 * _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _713;
    float _717 = _683 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _719 = fma(_707, _689, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _729 = _701 * _687;
    float _731 = fma(_711, _689, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _733 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _735 = isnan(_637);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _749 = fma(_715, _689, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _751 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_637);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_723, _703, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _765 = -_743;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, _703, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _771 = fma(_747, _703, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _773 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_637);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _761 * _767;
    float _787 = -_761;
    float _789 = _787 + 1.0;
    bool _791 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_637);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _697 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = _783 * _789;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _811;
    float _815 = _801 * _807;
    float _817 = -_801;
    float _819 = _817 + 1.0;
    float _821 = _731 * _815;
    float _823 = _719 * _815;
    float _825 = _749 * _815;
    float _827 = _695 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _831;
    float _835 = fma(_813, _729, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _825);
    float _845 = fma(_763, _809, _829);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _849 = _717 + _847;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _853;
    float _857 = fma(_769, _809, _841);
    float _859 = fma(_771, _809, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = _803 + _861;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _867 = -_201;
    int _869 = _649 ? as_type<int>(_867) : as_type<int>(_201);
    float _871 = fma(_855, _729, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _875 = fma(_833, _729, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    bool _879 = !_657;
    float _881 = _879 ? _201 : as_type<float>(_869);
    float _883 = fma(_871, _785, _845);
    float _885 = -_193;
    int _887 = _685 ? as_type<int>(_885) : as_type<int>(_193);
    float _889 = _839 * _839;
    bool _891 = _877 >= 0.0;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _895 = !_661;
    float _897 = _895 ? _193 : as_type<float>(_887);
    float _899 = _881 + 0.5;
    float _901 = fma(_835, _785, _857);
    float _903 = fma(_875, _785, _859);
    float _905 = fma(_849, _849, _889);
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _909 = -_897;
    float _911 = _909 + 0.5;
    float _913 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].x, _883);
    float _915 = fma(_863, _863, _905);
    float _917 = _907 * _873;
    float _919 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _921 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].y, _901);
    float _923 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].z, _903);
    float _925 = rsqrt(_915);
    float _927 = _889;
    float _929 = _827;
    if (_891)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _927;
    float _933 = _919 * _893;
    float _935 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _937 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _941 = as_type<int>(_931);
    if (_891)
    {
        float _943 = _931 * 5.0;
        _941 = as_type<int>(_943);
    }
    int _945 = _941;
    float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _917;
    out.m_46.y = _933;
    if (_891)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_945);
        out.gl_Position.z = _2832;
    }
    float _953 = _839 * _925;
    float _955 = _849 * _925;
    out.m_48.x = _947;
    out.m_48.y = _949;
    out.m_48.z = _951;
    if (_891)
    {
        out.m_33.x = 0.0;
    }
    if (_891)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _961 = _863 * _925;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _967 = -_953;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _959 + _971;
    float _975 = -_961;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _965 + _979;
    float _983 = -_955;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = _969 * _969;
    float _995 = -_961;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _1001 = _349 * _607;
    float _1003 = fma(_985, _985, _993);
    float _1005 = _349 * _609;
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].z, _999);
    float _1009 = fma(_997, _997, _1003);
    bool _1011 = _1007 >= 0.0;
    float _1013 = sqrt(_1009);
    float _1015 = _991;
    if (_1011)
    {
        _1015 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1017 = _1015;
    int _1019 = as_type<int>(_1017);
    if (_1011)
    {
        out.m_33.x = 0.0;
    }
    float _1021 = _925 * _1013;
    if (_1011)
    {
        float _1023 = _1017 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_1025);
        out.gl_Position.z = _2982;
    }
    if (_1011)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1027 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1029 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1035 = _1021 * _1027;
    float _1037 = _1021 * _1029;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _1031 * _1035;
    float _1045 = _1033 * _1037;
    bool _1047 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1057);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1061);
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1071 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1073 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1067);
    float _1075 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _803 + _1075;
    float _1083 = _717 + _1077;
    float _1085 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1087 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1083 + _1093;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1085);
    float _1099 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1087);
    float _1101 = _1091 * _1091;
    float _1103 = _827 + _1079;
    float _1105 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1097);
    float _1107 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1099);
    float _1109 = fma(_1095, _1095, _1101);
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1115 = sqrt(_1109);
    float _1117 = _1113 + _1111;
    float _1119 = 1.0 / _1111;
    bool _1121 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1085;
    float _1125 = _1073;
    float _1127 = _1079;
    if (!_1121)
    {
        _1123 = _1083;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1121)
    {
        _1125 = _1081;
    }
    float _1133 = _1125;
    float _1135 = _1133;
    if (!_1121)
    {
        _929 = _1103;
    }
    float _1137 = _929;
    bool _1139 = !_1121;
    float _1141 = _1137;
    if (!_1139)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1147 = _1115 + _1145;
        float _1149 = rsqrt(_1109);
        float _1151 = _1147 * _1143;
        float _1153 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1151 * 0.15915493667125701904296875;
        float _1157 = _1155 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = fma(_1159, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = _1149 * _1165;
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1095, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1091, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1175 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = fma(_1103, _1163, _1175);
        _1141 = _1177;
        _1131 = _1171;
        _1135 = _1173;
        _1127 = _1159;
    }
    float _1179 = _1141;
    float _1181 = _1131;
    float _1183 = _1135;
    float _1185 = _1127;
    float _1187 = -_953;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1191 = _1117 * _1119;
    float _1193 = _1191 * 0.5;
    float _1195 = -_955;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1199 = -_961;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1205 = _1185;
    if (_1055)
    {
        _1205 = 1.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1055)
    {
        float _1211 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1221 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1219);
        float _1223 = _1215 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = _1215 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1225;
        float _1233 = _1217 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1217 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1243;
        float _1247 = _1235 * _1237;
        float _1249 = 1.0 / _1221;
        float _1251 = 1.0 / _1247;
        float _1253 = 1.0 / _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1257 = _1249 * _1255;
        float _1259 = _1241 * _1251;
        float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1263 = fma(_1259, _1257, _1261);
        float _1265 = _1263 * _1253;
        float _1267 = precise::clamp(_1265, 0.0, 1.0);
        _1209 = _1267;
    }
    float _1269 = _1209;
    float _1271 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1273 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1203);
    float _1275 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1277 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1271);
    float _1281 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1273);
    float _1283 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1275);
    float _1285 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1291 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1283);
    float _1293 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1301);
    float _1313 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1311);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1325 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1317);
    bool _1327 = _1269 > 0.0;
    bool _1329 = isnan(_1269);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1339 = _1269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1341 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1343 = _1323 + _1325;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1343 * 0.5;
    out.m_33.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1345;
    out.gl_Position.z = _1323;
    out.gl_Position.w = _1325;
    out.m_50.z = _1349;
    out.m_50.w = _1325;
    if (_1335)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1408 = as_type<float>(_85);
        out.gl_Position.z = _1408;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1477 = as_type<float>(_121);
        out.gl_Position.z = _1477;
    }
    if (_113)
    {
        return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _127 * _125;
    float _145 = 0.0;
    float _147 = _131;
    if (!_141)
    {
        float _149 = _131 * _131;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    float _157 = _153;
    if (!_141)
    {
        float _159 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _159;
    }
    float _161 = _157;
    float _163 = in.m_35.x;
    float _165 = in.m_35.y;
    float _167 = in.m_35.z;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _181 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_175;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_141;
    float _205 = _161;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _131 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _131);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_141;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _131 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _147 = _259;
    }
    float _261 = _147;
    float _263 = in.m_42.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = fma(_189, 0.5, 0.5);
    bool _275 = _197 < 0.5;
    float _277 = float(_275);
    float _279 = -_197;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = in.m_30.x;
    float _285 = in.m_30.y;
    float _287 = in.m_30.z;
    bool _289 = !_267;
    int _291 = _289 ? 0 : 1;
    float _293 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _295 = !_185;
    int _297 = _295 ? 0 : 1;
    float _299 = -_277;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_273;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_291);
    float _309 = fma(_261, _163, _293);
    int _311 = abs(_297);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _165, _313);
    float _327 = float(_307);
    float _329 = fma(_261, _167, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_325, _263, _285);
    float _339 = fma(_329, _263, _287);
    float _341 = float(_323);
    float _343 = fma(_331, _305, _335);
    float _345 = fma(_309, _263, _283);
    float _347 = abs(_301);
    float _349 = fma(_341, _347, _343);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_69);
        float _373 = 1.0 / _371;
        float _375 = _103 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = 1.0 / _381;
    float _397 = 1.0 / _389;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = 1.0 / _385;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _377 + _413;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _419 = 1.0 / _393;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _377 + _423;
    float _427 = _425 * _395;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = _377 + _429;
    out.m_44.x = _421;
    out.m_44.y = _407;
    out.m_44.z = _411;
    out.m_44.w = _405;
    float _433 = _415 * _409;
    float _435 = _431 * _397;
    bool _437 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _439 = isnan(_377);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _377 + _449;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = _451 * _419;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    bool _463 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_377);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    bool _479 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _481 = isnan(_377);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_461, _427, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = fma(_477, _427, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = _473 * _455;
    bool _497 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _519 = isnan(_377);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -_473;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = _507 * _515;
    float _539 = -_507;
    float _541 = _539 + 1.0;
    float _543 = _489 * _531;
    float _545 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_535, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = _527 * _541;
    float _551 = in.m_42.x;
    float _553 = in.m_42.y;
    float _555 = -_527;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = _491 * _549;
    float _565 = _493 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_561, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _577 = fma(_569, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_545, _537, _573);
    float _589 = fma(_547, _537, _575);
    float _591 = fma(_581, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_585, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _595 = fma(_571, _543, _587);
    float _597 = fma(_577, _543, _589);
    float _599 = fma(_591, _495, _595);
    float _601 = fma(_593, _495, _597);
    float _603 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _551;
    float _609 = _605 * _553;
    bool _611 = !_417;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _615 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_69);
        float _633 = 1.0 / _631;
        float _635 = _103 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = in.m_37.y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _649 = _123 > 0.5;
    float _651 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = 1.0 / _643;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _669 = 1.0 / _647;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _671;
    float _675 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _677 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _637 + _679;
    float _683 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    bool _685 = _639 > 0.5;
    float _687 = 1.0 / _673;
    float _689 = _681 * _653;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _637 + _691;
    float _695 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _667);
    float _697 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _701 = _637 + _699;
    float _703 = _693 * _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _713;
    float _717 = _683 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _719 = fma(_707, _689, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _729 = _701 * _687;
    float _731 = fma(_711, _689, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _733 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _735 = isnan(_637);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _749 = fma(_715, _689, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _751 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_637);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_723, _703, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _765 = -_743;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, _703, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _771 = fma(_747, _703, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _773 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_637);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _761 * _767;
    float _787 = -_761;
    float _789 = _787 + 1.0;
    bool _791 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_637);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _697 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = _783 * _789;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _811;
    float _815 = _801 * _807;
    float _817 = -_801;
    float _819 = _817 + 1.0;
    float _821 = _731 * _815;
    float _823 = _719 * _815;
    float _825 = _749 * _815;
    float _827 = _695 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _831;
    float _835 = fma(_813, _729, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _825);
    float _845 = fma(_763, _809, _829);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _849 = _717 + _847;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _853;
    float _857 = fma(_769, _809, _841);
    float _859 = fma(_771, _809, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = _803 + _861;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _867 = -_201;
    int _869 = _649 ? as_type<int>(_867) : as_type<int>(_201);
    float _871 = fma(_855, _729, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _875 = fma(_833, _729, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    bool _879 = !_657;
    float _881 = _879 ? _201 : as_type<float>(_869);
    float _883 = fma(_871, _785, _845);
    float _885 = -_193;
    int _887 = _685 ? as_type<int>(_885) : as_type<int>(_193);
    float _889 = _839 * _839;
    bool _891 = _877 >= 0.0;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _895 = !_661;
    float _897 = _895 ? _193 : as_type<float>(_887);
    float _899 = _881 + 0.5;
    float _901 = fma(_835, _785, _857);
    float _903 = fma(_875, _785, _859);
    float _905 = fma(_849, _849, _889);
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _909 = -_897;
    float _911 = _909 + 0.5;
    float _913 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].x, _883);
    float _915 = fma(_863, _863, _905);
    float _917 = _907 * _873;
    float _919 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _921 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].y, _901);
    float _923 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].z, _903);
    float _925 = rsqrt(_915);
    float _927 = _889;
    float _929 = _827;
    if (_891)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _927;
    float _933 = _919 * _893;
    float _935 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _937 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _941 = as_type<int>(_931);
    if (_891)
    {
        float _943 = _931 * 5.0;
        _941 = as_type<int>(_943);
    }
    int _945 = _941;
    float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _917;
    out.m_46.y = _933;
    if (_891)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_945);
        out.gl_Position.z = _2832;
    }
    float _953 = _839 * _925;
    float _955 = _849 * _925;
    out.m_48.x = _947;
    out.m_48.y = _949;
    out.m_48.z = _951;
    if (_891)
    {
        out.m_33.x = 0.0;
    }
    if (_891)
    {
        return out;
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _961 = _863 * _925;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _967 = -_953;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _959 + _971;
    float _975 = -_961;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _965 + _979;
    float _983 = -_955;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = _969 * _969;
    float _995 = -_961;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _1001 = _349 * _607;
    float _1003 = fma(_985, _985, _993);
    float _1005 = _349 * _609;
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].z, _999);
    float _1009 = fma(_997, _997, _1003);
    bool _1011 = _1007 >= 0.0;
    float _1013 = sqrt(_1009);
    float _1015 = _991;
    if (_1011)
    {
        _1015 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1017 = _1015;
    int _1019 = as_type<int>(_1017);
    if (_1011)
    {
        out.m_33.x = 0.0;
    }
    float _1021 = _925 * _1013;
    if (_1011)
    {
        float _1023 = _1017 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_1025);
        out.gl_Position.z = _2982;
    }
    if (_1011)
    {
        return out;
    }
    float _1027 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1029 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1035 = _1021 * _1027;
    float _1037 = _1021 * _1029;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _1031 * _1035;
    float _1045 = _1033 * _1037;
    bool _1047 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1057);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1061);
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1071 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1073 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1067);
    float _1075 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _803 + _1075;
    float _1083 = _717 + _1077;
    float _1085 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1087 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1083 + _1093;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1085);
    float _1099 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1087);
    float _1101 = _1091 * _1091;
    float _1103 = _827 + _1079;
    float _1105 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1097);
    float _1107 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1099);
    float _1109 = fma(_1095, _1095, _1101);
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1115 = sqrt(_1109);
    float _1117 = _1113 + _1111;
    float _1119 = 1.0 / _1111;
    bool _1121 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1085;
    float _1125 = _1073;
    float _1127 = _1079;
    if (!_1121)
    {
        _1123 = _1083;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1121)
    {
        _1125 = _1081;
    }
    float _1133 = _1125;
    float _1135 = _1133;
    if (!_1121)
    {
        _929 = _1103;
    }
    float _1137 = _929;
    bool _1139 = !_1121;
    float _1141 = _1137;
    if (!_1139)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1147 = _1115 + _1145;
        float _1149 = rsqrt(_1109);
        float _1151 = _1147 * _1143;
        float _1153 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1151 * 0.15915493667125701904296875;
        float _1157 = _1155 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = fma(_1159, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = _1149 * _1165;
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1095, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1091, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1175 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = fma(_1103, _1163, _1175);
        _1141 = _1177;
        _1131 = _1171;
        _1135 = _1173;
        _1127 = _1159;
    }
    float _1179 = _1141;
    float _1181 = _1131;
    float _1183 = _1135;
    float _1185 = _1127;
    float _1187 = -_953;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1191 = _1117 * _1119;
    float _1193 = _1191 * 0.5;
    float _1195 = -_955;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1199 = -_961;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1205 = _1185;
    if (_1055)
    {
        _1205 = 1.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1055)
    {
        float _1211 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1221 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1219);
        float _1223 = _1215 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = _1215 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1225;
        float _1233 = _1217 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1217 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1243;
        float _1247 = _1235 * _1237;
        float _1249 = 1.0 / _1221;
        float _1251 = 1.0 / _1247;
        float _1253 = 1.0 / _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1257 = _1249 * _1255;
        float _1259 = _1241 * _1251;
        float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1263 = fma(_1259, _1257, _1261);
        float _1265 = _1263 * _1253;
        float _1267 = precise::clamp(_1265, 0.0, 1.0);
        _1209 = _1267;
    }
    float _1269 = _1209;
    float _1271 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1273 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1203);
    float _1275 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1277 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1271);
    float _1281 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1273);
    float _1283 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1275);
    float _1285 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1291 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1283);
    float _1293 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1301);
    float _1313 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1311);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1325 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1317);
    bool _1327 = _1269 > 0.0;
    bool _1329 = isnan(_1269);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1339 = _1269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1341 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1343 = _1323 + _1325;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1343 * 0.5;
    out.m_33.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1345;
    out.gl_Position.z = _1323;
    out.gl_Position.w = _1325;
    out.m_50.z = _1349;
    out.m_50.w = _1325;
    if (_1335)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1351;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1408 = as_type<float>(_85);
        out.gl_Position.z = _1408;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1477 = as_type<float>(_121);
        out.gl_Position.z = _1477;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _127 * _125;
    float _145 = 0.0;
    float _147 = _131;
    if (!_141)
    {
        float _149 = _131 * _131;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    float _157 = _153;
    if (!_141)
    {
        float _159 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _159;
    }
    float _161 = _157;
    float _163 = in.m_35.x;
    float _165 = in.m_35.y;
    float _167 = in.m_35.z;
    float _169 = _155 * 6.283185482025146484375;
    float _171 = floor(_155);
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _181 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_171;
    float _197 = _155 + _195;
    bool _199 = !_175;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_141;
    float _205 = _161;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _131 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _131);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_141;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _131 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _147 = _259;
    }
    float _261 = _147;
    float _263 = in.m_42.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = fma(_189, 0.5, 0.5);
    bool _275 = _197 < 0.5;
    float _277 = float(_275);
    float _279 = -_197;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = in.m_30.x;
    float _285 = in.m_30.y;
    float _287 = in.m_30.z;
    bool _289 = !_267;
    int _291 = _289 ? 0 : 1;
    float _293 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _295 = !_185;
    int _297 = _295 ? 0 : 1;
    float _299 = -_277;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_273;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_291);
    float _309 = fma(_261, _163, _293);
    int _311 = abs(_297);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _165, _313);
    float _327 = float(_307);
    float _329 = fma(_261, _167, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_325, _263, _285);
    float _339 = fma(_329, _263, _287);
    float _341 = float(_323);
    float _343 = fma(_331, _305, _335);
    float _345 = fma(_309, _263, _283);
    float _347 = abs(_301);
    float _349 = fma(_341, _347, _343);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_69);
        float _373 = 1.0 / _371;
        float _375 = _103 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = 1.0 / _381;
    float _397 = 1.0 / _389;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _407 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = 1.0 / _385;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _377 + _413;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _419 = 1.0 / _393;
    float _421 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _377 + _423;
    float _427 = _425 * _395;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _431 = _377 + _429;
    out.m_44.x = _421;
    out.m_44.y = _407;
    out.m_44.z = _411;
    out.m_44.w = _405;
    float _433 = _415 * _409;
    float _435 = _431 * _397;
    bool _437 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _439 = isnan(_377);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _377 + _449;
    float _453 = -_447;
    float _455 = _453 + 1.0;
    float _457 = _451 * _419;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    bool _463 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_377);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    bool _479 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _481 = isnan(_377);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_461, _427, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = fma(_477, _427, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = _473 * _455;
    bool _497 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _519 = isnan(_377);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -_473;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = _507 * _515;
    float _539 = -_507;
    float _541 = _539 + 1.0;
    float _543 = _489 * _531;
    float _545 = fma(_511, _433, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = fma(_535, _433, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = _527 * _541;
    float _551 = in.m_42.x;
    float _553 = in.m_42.y;
    float _555 = -_527;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _559;
    float _563 = _491 * _549;
    float _565 = _493 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_561, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _563);
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _565);
    float _577 = fma(_569, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_545, _537, _573);
    float _589 = fma(_547, _537, _575);
    float _591 = fma(_581, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_585, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _595 = fma(_571, _543, _587);
    float _597 = fma(_577, _543, _589);
    float _599 = fma(_591, _495, _595);
    float _601 = fma(_593, _495, _597);
    float _603 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _551;
    float _609 = _605 * _553;
    bool _611 = !_417;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _615 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_69);
        float _633 = 1.0 / _631;
        float _635 = _103 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = in.m_37.y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _649 = _123 > 0.5;
    float _651 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = 1.0 / _643;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _669 = 1.0 / _647;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _671;
    float _675 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _677 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _637 + _679;
    float _683 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    bool _685 = _639 > 0.5;
    float _687 = 1.0 / _673;
    float _689 = _681 * _653;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _637 + _691;
    float _695 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _667);
    float _697 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _701 = _637 + _699;
    float _703 = _693 * _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _713;
    float _717 = _683 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _719 = fma(_707, _689, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _729 = _701 * _687;
    float _731 = fma(_711, _689, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _733 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _735 = isnan(_637);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _749 = fma(_715, _689, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _751 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_637);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_723, _703, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _765 = -_743;
    float _767 = _765 + 1.0;
    float _769 = fma(_727, _703, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _771 = fma(_747, _703, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _773 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_637);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _761 * _767;
    float _787 = -_761;
    float _789 = _787 + 1.0;
    bool _791 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _793 = isnan(_637);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _697 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -_783;
    float _807 = _805 + 1.0;
    float _809 = _783 * _789;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _811;
    float _815 = _801 * _807;
    float _817 = -_801;
    float _819 = _817 + 1.0;
    float _821 = _731 * _815;
    float _823 = _719 * _815;
    float _825 = _749 * _815;
    float _827 = _695 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _829 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _821);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _831;
    float _835 = fma(_813, _729, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _843 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _825);
    float _845 = fma(_763, _809, _829);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _849 = _717 + _847;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _853;
    float _857 = fma(_769, _809, _841);
    float _859 = fma(_771, _809, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _863 = _803 + _861;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _867 = -_201;
    int _869 = _649 ? as_type<int>(_867) : as_type<int>(_201);
    float _871 = fma(_855, _729, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _875 = fma(_833, _729, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    bool _879 = !_657;
    float _881 = _879 ? _201 : as_type<float>(_869);
    float _883 = fma(_871, _785, _845);
    float _885 = -_193;
    int _887 = _685 ? as_type<int>(_885) : as_type<int>(_193);
    float _889 = _839 * _839;
    bool _891 = _877 >= 0.0;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _895 = !_661;
    float _897 = _895 ? _193 : as_type<float>(_887);
    float _899 = _881 + 0.5;
    float _901 = fma(_835, _785, _857);
    float _903 = fma(_875, _785, _859);
    float _905 = fma(_849, _849, _889);
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _909 = -_897;
    float _911 = _909 + 0.5;
    float _913 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].x, _883);
    float _915 = fma(_863, _863, _905);
    float _917 = _907 * _873;
    float _919 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _921 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].y, _901);
    float _923 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[126].z, _903);
    float _925 = rsqrt(_915);
    float _927 = _889;
    float _929 = _827;
    if (_891)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _927;
    float _933 = _919 * _893;
    float _935 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _937 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _941 = as_type<int>(_931);
    if (_891)
    {
        float _943 = _931 * 5.0;
        _941 = as_type<int>(_943);
    }
    int _945 = _941;
    float _947 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _917;
    out.m_46.y = _933;
    if (_891)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_945);
        out.gl_Position.z = _2832;
    }
    float _953 = _839 * _925;
    float _955 = _849 * _925;
    out.m_48.x = _947;
    out.m_48.y = _949;
    out.m_48.z = _951;
    if (_891)
    {
        out.m_33.x = 0.0;
    }
    if (_891)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _957 = -_953;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _961 = _863 * _925;
    float _963 = -_955;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _717);
    float _967 = -_953;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _959 + _971;
    float _975 = -_961;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _965 + _979;
    float _983 = -_955;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _987 = _973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = _969 * _969;
    float _995 = -_961;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _1001 = _349 * _607;
    float _1003 = fma(_985, _985, _993);
    float _1005 = _349 * _609;
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].z, _999);
    float _1009 = fma(_997, _997, _1003);
    bool _1011 = _1007 >= 0.0;
    float _1013 = sqrt(_1009);
    float _1015 = _991;
    if (_1011)
    {
        _1015 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1017 = _1015;
    int _1019 = as_type<int>(_1017);
    if (_1011)
    {
        out.m_33.x = 0.0;
    }
    float _1021 = _925 * _1013;
    if (_1011)
    {
        float _1023 = _1017 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_1025);
        out.gl_Position.z = _2982;
    }
    if (_1011)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1027 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1029 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1035 = _1021 * _1027;
    float _1037 = _1021 * _1029;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = _1031 * _1035;
    float _1045 = _1033 * _1037;
    bool _1047 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1055 = _1051 || _1053;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1063 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1057);
    float _1065 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1061);
    float _1069 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1063);
    float _1071 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1073 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1067);
    float _1075 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1081 = _803 + _1075;
    float _1083 = _717 + _1077;
    float _1085 = _959 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1087 = _959 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1095 = _1083 + _1093;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1085);
    float _1099 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1087);
    float _1101 = _1091 * _1091;
    float _1103 = _827 + _1079;
    float _1105 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1097);
    float _1107 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1099);
    float _1109 = fma(_1095, _1095, _1101);
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1115 = sqrt(_1109);
    float _1117 = _1113 + _1111;
    float _1119 = 1.0 / _1111;
    bool _1121 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1085;
    float _1125 = _1073;
    float _1127 = _1079;
    if (!_1121)
    {
        _1123 = _1083;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1121)
    {
        _1125 = _1081;
    }
    float _1133 = _1125;
    float _1135 = _1133;
    if (!_1121)
    {
        _929 = _1103;
    }
    float _1137 = _929;
    bool _1139 = !_1121;
    float _1141 = _1137;
    if (!_1139)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1147 = _1115 + _1145;
        float _1149 = rsqrt(_1109);
        float _1151 = _1147 * _1143;
        float _1153 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1151 * 0.15915493667125701904296875;
        float _1157 = _1155 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = fma(_1159, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = _1149 * _1165;
        float _1169 = _1163 + (-1.0);
        float _1171 = fma(_1095, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1091, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1175 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = fma(_1103, _1163, _1175);
        _1141 = _1177;
        _1131 = _1171;
        _1135 = _1173;
        _1127 = _1159;
    }
    float _1179 = _1141;
    float _1181 = _1131;
    float _1183 = _1135;
    float _1185 = _1127;
    float _1187 = -_953;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1179);
    float _1191 = _1117 * _1119;
    float _1193 = _1191 * 0.5;
    float _1195 = -_955;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1199 = -_961;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1205 = _1185;
    if (_1055)
    {
        _1205 = 1.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1055)
    {
        float _1211 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 0.15915493667125701904296875;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1221 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1219);
        float _1223 = _1215 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = _1215 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1225;
        float _1233 = _1217 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1217 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1245 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1243;
        float _1247 = _1235 * _1237;
        float _1249 = 1.0 / _1221;
        float _1251 = 1.0 / _1247;
        float _1253 = 1.0 / _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1257 = _1249 * _1255;
        float _1259 = _1241 * _1251;
        float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1263 = fma(_1259, _1257, _1261);
        float _1265 = _1263 * _1253;
        float _1267 = precise::clamp(_1265, 0.0, 1.0);
        _1209 = _1267;
    }
    float _1269 = _1209;
    float _1271 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1273 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1203);
    float _1275 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1277 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1271);
    float _1281 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1273);
    float _1283 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1275);
    float _1285 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1279);
    float _1289 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1291 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1283);
    float _1293 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1301);
    float _1313 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1305);
    float _1317 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1319 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1311);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1325 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1317);
    bool _1327 = _1269 > 0.0;
    bool _1329 = isnan(_1269);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1339 = _1269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1341 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1343 = _1323 + _1325;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1349 = _1343 * 0.5;
    out.m_33.x = _1347;
    out.gl_Position.x = _1341;
    out.gl_Position.y = _1345;
    out.gl_Position.z = _1323;
    out.gl_Position.w = _1325;
    out.m_50.z = _1349;
    out.m_50.w = _1325;
    if (_1335)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

