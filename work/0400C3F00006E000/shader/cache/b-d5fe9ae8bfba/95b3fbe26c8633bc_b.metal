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
    float4 m_42 [[user(locn0)]];
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1001 = as_type<float>(_77);
        out.gl_Position.z = _1001;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1070 = as_type<float>(_115);
        out.gl_Position.z = _1070;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _397 = 1.0 / _391;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _395;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _403;
    float _407 = _387 * _397;
    bool _409 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _411 = isnan(_379);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _351 * _383;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _379 + _423;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _439;
    bool _443 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_379);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -_419;
    float _457 = _455 + 1.0;
    float _459 = fma(_405, _407, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _461 = fma(_441, _407, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _463 = _349 * _381;
    float _465 = _453 * _457;
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = _437 * _469;
    float _477 = fma(_473, _407, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = _425 * _401;
    float _481 = -_437;
    float _483 = _481 + 1.0;
    float _485 = _461 * _475;
    float _487 = _477 * _475;
    float _489 = _459 * _475;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _505 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _513 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _515 = fma(_505, _465, _503);
    float _517 = fma(_507, _465, _511);
    float _519 = fma(_509, _465, _513);
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _523 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].y, _517);
    float _525 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].z, _519);
    bool _527 = !_399;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_28.x;
    float _557 = in.m_28.y;
    float _559 = in.m_28.z;
    float _561 = _205 * _463;
    float _563 = as_type<float>(int(gl_VertexIndex));
    float _565 = _205 * _421;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _577 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = 1.0 / _569;
    float _581 = 1.0 / _573;
    float _583 = _557 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _585 = _557 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _587 = _557 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].x, _583);
    int _599 = as_type<int>(_563) & 1;
    bool _601 = _599 != 0;
    int _603 = as_type<int>(_563) & 2;
    bool _605 = _603 != 0;
    float _607 = _591 * _579;
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
    float _623 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _553 + _625;
    float _629 = _595 * _581;
    float _631 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_619;
    float _647 = _645 + 1.0;
    float _649 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].z, _623);
    float _653 = fma(_607, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _655 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_553);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _643 * _647;
    bool _669 = !_601;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _553 + _677;
    float _681 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _683 = _631 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = _665 * _675;
    float _687 = fma(_629, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    bool _691 = !_605;
    float _693 = _691 ? (-0.5) : 0.5;
    float _695 = _653 * _685;
    float _697 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _575 * _689;
    float _701 = _651 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _693);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _707 = -_665;
    float _709 = _707 + 1.0;
    float _711 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _713 = _577 * _703;
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _705);
    float _717 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _719 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _731 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _719);
    float _733 = 1.0 / _723;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _739 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _741 = fma(_687, _667, _717);
    float _743 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _745 = _737 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _739);
    float _751 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    bool _753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _755 = isnan(0.5);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _761 = _757 || _759;
    float _763 = _743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _765 = _681 + _745;
    float _767 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _763 + _723;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _775 = _683 + _767;
    float _777 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _779 = _771 * _733;
    float _781 = _779 * 0.5;
    float _783 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _785 = _701 + _769;
    float _787 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _773);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _783);
    float _793 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].x, _777);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].x, _787);
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[1].z, _789);
    float _799 = _783;
    if (_761)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    float _803 = _801;
    if (!_761)
    {
        float _805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _809 * 6.283185482025146484375;
        float _815 = cos(_813);
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _819 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _817);
        float _821 = _809 * 6.283185482025146484375;
        float _823 = sin(_821);
        float _825 = 1.0 / _815;
        float _827 = _811 * 6.283185482025146484375;
        float _829 = cos(_827);
        float _831 = _823 * _825;
        float _833 = _811 * 6.283185482025146484375;
        float _835 = sin(_833);
        float _837 = _829 * _831;
        float _839 = 1.0 / _819;
        float _841 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _843 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _841;
        float _845 = 1.0 / _837;
        float _847 = 1.0 / _843;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _851 = _839 * _849;
        float _853 = _835 * _845;
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _857 = fma(_853, _851, _855);
        float _859 = _857 * _847;
        float _861 = precise::clamp(_859, 0.0, 1.0);
        float _863 = -_861;
        float _865 = _863 + 1.0;
        _803 = _865;
    }
    float _867 = _803;
    float _869 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[0].z, _791);
    float _871 = _797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[2].z, _793);
    float _875 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[3].z, _795);
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _891);
    float _901 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _903 = _875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _895);
    float _907 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _911 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _899);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _901);
    float _919 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _905);
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _925 = _867 > 0.0;
    bool _927 = isnan(_867);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _939 = _917 + _919;
    float _941 = _867 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _943 = _939 * 0.5;
    out.m_42.x = _921;
    out.m_42.y = _923;
    out.m_42.z = _935;
    out.m_42.w = _937;
    out.m_31.x = _941;
    out.gl_Position.x = _913;
    out.gl_Position.y = _915;
    out.gl_Position.z = _917;
    out.gl_Position.w = _919;
    out.m_44.z = _943;
    out.m_44.w = _919;
    if (_933)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1001 = as_type<float>(_77);
        out.gl_Position.z = _1001;
    }
    if (!_67)
    {
        return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1070 = as_type<float>(_115);
        out.gl_Position.z = _1070;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _397 = 1.0 / _391;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _395;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _403;
    float _407 = _387 * _397;
    bool _409 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _411 = isnan(_379);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _351 * _383;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _379 + _423;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _439;
    bool _443 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_379);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -_419;
    float _457 = _455 + 1.0;
    float _459 = fma(_405, _407, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _461 = fma(_441, _407, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _463 = _349 * _381;
    float _465 = _453 * _457;
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = _437 * _469;
    float _477 = fma(_473, _407, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = _425 * _401;
    float _481 = -_437;
    float _483 = _481 + 1.0;
    float _485 = _461 * _475;
    float _487 = _477 * _475;
    float _489 = _459 * _475;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _505 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _513 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _515 = fma(_505, _465, _503);
    float _517 = fma(_507, _465, _511);
    float _519 = fma(_509, _465, _513);
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _523 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].y, _517);
    float _525 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].z, _519);
    bool _527 = !_399;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_28.x;
    float _557 = in.m_28.y;
    float _559 = in.m_28.z;
    float _561 = _205 * _463;
    float _563 = as_type<float>(int(gl_VertexIndex));
    float _565 = _205 * _421;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _577 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = 1.0 / _569;
    float _581 = 1.0 / _573;
    float _583 = _557 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _585 = _557 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _587 = _557 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].x, _583);
    int _599 = as_type<int>(_563) & 1;
    bool _601 = _599 != 0;
    int _603 = as_type<int>(_563) & 2;
    bool _605 = _603 != 0;
    float _607 = _591 * _579;
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
    float _623 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _553 + _625;
    float _629 = _595 * _581;
    float _631 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_619;
    float _647 = _645 + 1.0;
    float _649 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].z, _623);
    float _653 = fma(_607, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _655 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_553);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _643 * _647;
    bool _669 = !_601;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _553 + _677;
    float _681 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _683 = _631 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = _665 * _675;
    float _687 = fma(_629, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    bool _691 = !_605;
    float _693 = _691 ? (-0.5) : 0.5;
    float _695 = _653 * _685;
    float _697 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _575 * _689;
    float _701 = _651 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _693);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _707 = -_665;
    float _709 = _707 + 1.0;
    float _711 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _713 = _577 * _703;
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _705);
    float _717 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _719 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _731 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _719);
    float _733 = 1.0 / _723;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _739 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _741 = fma(_687, _667, _717);
    float _743 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _745 = _737 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _739);
    float _751 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    bool _753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _755 = isnan(0.5);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _761 = _757 || _759;
    float _763 = _743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _765 = _681 + _745;
    float _767 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _763 + _723;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _775 = _683 + _767;
    float _777 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _779 = _771 * _733;
    float _781 = _779 * 0.5;
    float _783 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _785 = _701 + _769;
    float _787 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _773);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _783);
    float _793 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].x, _777);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].x, _787);
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[1].z, _789);
    float _799 = _783;
    if (_761)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    float _803 = _801;
    if (!_761)
    {
        float _805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _809 * 6.283185482025146484375;
        float _815 = cos(_813);
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _819 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _817);
        float _821 = _809 * 6.283185482025146484375;
        float _823 = sin(_821);
        float _825 = 1.0 / _815;
        float _827 = _811 * 6.283185482025146484375;
        float _829 = cos(_827);
        float _831 = _823 * _825;
        float _833 = _811 * 6.283185482025146484375;
        float _835 = sin(_833);
        float _837 = _829 * _831;
        float _839 = 1.0 / _819;
        float _841 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _843 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _841;
        float _845 = 1.0 / _837;
        float _847 = 1.0 / _843;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _851 = _839 * _849;
        float _853 = _835 * _845;
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _857 = fma(_853, _851, _855);
        float _859 = _857 * _847;
        float _861 = precise::clamp(_859, 0.0, 1.0);
        float _863 = -_861;
        float _865 = _863 + 1.0;
        _803 = _865;
    }
    float _867 = _803;
    float _869 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[0].z, _791);
    float _871 = _797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[2].z, _793);
    float _875 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[3].z, _795);
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _891);
    float _901 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _903 = _875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _895);
    float _907 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _911 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _899);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _901);
    float _919 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _905);
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _925 = _867 > 0.0;
    bool _927 = isnan(_867);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _939 = _917 + _919;
    float _941 = _867 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _943 = _939 * 0.5;
    out.m_42.x = _921;
    out.m_42.y = _923;
    out.m_42.z = _935;
    out.m_42.w = _937;
    out.m_31.x = _941;
    out.gl_Position.x = _913;
    out.gl_Position.y = _915;
    out.gl_Position.z = _917;
    out.gl_Position.w = _919;
    out.m_44.z = _943;
    out.m_44.w = _919;
    if (_933)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _945;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _545 = false;
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1001 = as_type<float>(_77);
        out.gl_Position.z = _1001;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_31.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1070 = as_type<float>(_115);
        out.gl_Position.z = _1070;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = -_141;
    float _157 = _137 + _155;
    bool _159 = !_133;
    int _161 = _159 ? 0 : 1;
    bool _163 = !_129;
    int _165 = _163 ? 0 : 1;
    int _167 = abs(_161);
    int _169 = abs(_165);
    float _171 = -_157;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _175 = float(_149);
    float _177 = fma(_153, 0.5, 0.5);
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _181 = _157 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_173);
    float _187 = _175 * _185;
    float _189 = -_177;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_167);
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_169);
    float _201 = fma(_193, _191, _187);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_179;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _95 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_37.x;
    float _383 = in.m_37.y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _397 = 1.0 / _391;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _395;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _403;
    float _407 = _387 * _397;
    bool _409 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _411 = isnan(_379);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _351 * _383;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _379 + _423;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _439;
    bool _443 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_379);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -_419;
    float _457 = _455 + 1.0;
    float _459 = fma(_405, _407, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _461 = fma(_441, _407, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _463 = _349 * _381;
    float _465 = _453 * _457;
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = _437 * _469;
    float _477 = fma(_473, _407, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = _425 * _401;
    float _481 = -_437;
    float _483 = _481 + 1.0;
    float _485 = _461 * _475;
    float _487 = _477 * _475;
    float _489 = _459 * _475;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _487);
    float _505 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _507 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _509 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _511 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _485);
    float _513 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _515 = fma(_505, _465, _503);
    float _517 = fma(_507, _465, _511);
    float _519 = fma(_509, _465, _513);
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].x, _515);
    float _523 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].y, _517);
    float _525 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[109].z, _519);
    bool _527 = !_399;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_63);
        float _549 = 1.0 / _547;
        float _551 = _95 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_28.x;
    float _557 = in.m_28.y;
    float _559 = in.m_28.z;
    float _561 = _205 * _463;
    float _563 = as_type<float>(int(gl_VertexIndex));
    float _565 = _205 * _421;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _577 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = 1.0 / _569;
    float _581 = 1.0 / _573;
    float _583 = _557 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _585 = _557 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _587 = _557 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].x, _583);
    int _599 = as_type<int>(_563) & 1;
    bool _601 = _599 != 0;
    int _603 = as_type<int>(_563) & 2;
    bool _605 = _603 != 0;
    float _607 = _591 * _579;
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
    float _623 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _553 + _625;
    float _629 = _595 * _581;
    float _631 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[4].z, _597);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_619;
    float _647 = _645 + 1.0;
    float _649 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _651 = fma(_559, (*spvDescriptorSet0.vp_c10)._m0[6].z, _623);
    float _653 = fma(_607, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _655 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_553);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _643 * _647;
    bool _669 = !_601;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _553 + _677;
    float _681 = _649 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _683 = _631 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = _665 * _675;
    float _687 = fma(_629, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    bool _691 = !_605;
    float _693 = _691 ? (-0.5) : 0.5;
    float _695 = _653 * _685;
    float _697 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _699 = _575 * _689;
    float _701 = _651 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _693);
    float _705 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _697);
    float _707 = -_665;
    float _709 = _707 + 1.0;
    float _711 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _713 = _577 * _703;
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _705);
    float _717 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _719 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _723 = _715 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _721);
    float _731 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _719);
    float _733 = 1.0 / _723;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _729);
    float _739 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _741 = fma(_687, _667, _717);
    float _743 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _745 = _737 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _739);
    float _751 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    bool _753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _755 = isnan(0.5);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _761 = _757 || _759;
    float _763 = _743 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _765 = _681 + _745;
    float _767 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _763 + _723;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _775 = _683 + _767;
    float _777 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _779 = _771 * _733;
    float _781 = _779 * 0.5;
    float _783 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _785 = _701 + _769;
    float _787 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _773);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _783);
    float _793 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].x, _777);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].x, _787);
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[1].z, _789);
    float _799 = _783;
    if (_761)
    {
        _799 = 1.0;
    }
    float _801 = _799;
    float _803 = _801;
    if (!_761)
    {
        float _805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _809 = _805 * 0.15915493667125701904296875;
        float _811 = _807 * 0.15915493667125701904296875;
        float _813 = _809 * 6.283185482025146484375;
        float _815 = cos(_813);
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _819 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _817);
        float _821 = _809 * 6.283185482025146484375;
        float _823 = sin(_821);
        float _825 = 1.0 / _815;
        float _827 = _811 * 6.283185482025146484375;
        float _829 = cos(_827);
        float _831 = _823 * _825;
        float _833 = _811 * 6.283185482025146484375;
        float _835 = sin(_833);
        float _837 = _829 * _831;
        float _839 = 1.0 / _819;
        float _841 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _843 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _841;
        float _845 = 1.0 / _837;
        float _847 = 1.0 / _843;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _851 = _839 * _849;
        float _853 = _835 * _845;
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _857 = fma(_853, _851, _855);
        float _859 = _857 * _847;
        float _861 = precise::clamp(_859, 0.0, 1.0);
        float _863 = -_861;
        float _865 = _863 + 1.0;
        _803 = _865;
    }
    float _867 = _803;
    float _869 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[0].z, _791);
    float _871 = _797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[2].z, _793);
    float _875 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[3].z, _795);
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _895 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _889);
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _891);
    float _901 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _903 = _875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _895);
    float _907 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _909 = _523 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _911 = _525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _899);
    float _917 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _901);
    float _919 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _905);
    float _921 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _925 = _867 > 0.0;
    bool _927 = isnan(_867);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _939 = _917 + _919;
    float _941 = _867 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _943 = _939 * 0.5;
    out.m_42.x = _921;
    out.m_42.y = _923;
    out.m_42.z = _935;
    out.m_42.w = _937;
    out.m_31.x = _941;
    out.gl_Position.x = _913;
    out.gl_Position.y = _915;
    out.gl_Position.z = _917;
    out.gl_Position.w = _919;
    out.m_44.z = _943;
    out.m_44.w = _919;
    if (_933)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

