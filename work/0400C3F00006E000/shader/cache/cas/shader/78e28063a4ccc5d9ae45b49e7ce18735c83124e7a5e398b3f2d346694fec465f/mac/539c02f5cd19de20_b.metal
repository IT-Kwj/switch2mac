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
    float4 m_46 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_33 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
    float4 m_40 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _359 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _943 = as_type<float>(_81);
        out.gl_Position.z = _943;
    }
    if (!_69)
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
    if (_93)
    {
        float _99 = float(_65);
        _75 = _99;
    }
    float _101 = _75;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    int _113 = 0;
    if (_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1012 = as_type<float>(_117);
        out.gl_Position.z = _1012;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_33.x;
    float _121 = in.m_33.y;
    float _123 = in.m_33.z;
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _127 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _129 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _131 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _133 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _127);
    float _135 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _129);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _135);
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _137);
    bool _145 = !_125;
    float _163;
    if (!_145)
    {
        float _147 = in.m_35.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_65);
        float _169 = 1.0 / _167;
        float _171 = _97 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = 1.0 / _189;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _197;
    float _217 = 1.0 / _193;
    float _219 = _177 * _211;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_209;
    float _235 = _233 + 1.0;
    float _237 = _231 * _235;
    float _239 = _181 * _215;
    bool _241 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_173);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _261 = _251 * _255;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _185 * _217;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    float _285 = fma(_259, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _295 = fma(_283, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _279 * _265;
    float _299 = fma(_289, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = fma(_293, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_279;
    float _305 = _303 + 1.0;
    float _307 = _295 * _297;
    float _309 = _299 * _297;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _317;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _323 = fma(_313, _239, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _325 = fma(_285, _261, _315);
    float _327 = fma(_319, _239, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _329 = fma(_301, _261, _321);
    float _331 = fma(_323, _237, _325);
    float _333 = fma(_327, _237, _329);
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].x, _331);
    float _337 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].y, _333);
    bool _339 = !_213;
    float _357;
    if (!_339)
    {
        float _341 = in.m_35.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_65);
        float _363 = 1.0 / _361;
        float _365 = _97 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = as_type<float>(int(gl_VertexIndex));
    float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _373 = in.m_40.x;
    float _375 = in.m_40.y;
    float _377 = in.m_35.x;
    float _379 = in.m_35.y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _391 = 1.0 / _385;
    float _393 = 1.0 / _389;
    int _395 = as_type<int>(_369) & 1;
    bool _397 = _395 != 0;
    int _399 = as_type<int>(_369) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = _337 * _375;
    float _413 = in.m_26.x;
    float _415 = in.m_26.y;
    float _417 = in.m_26.z;
    float _419 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _421 = _335 * _373;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = -_381;
    float _427 = fma(_419, 2.0, _425);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _431 = _377 > 0.5;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = 1.0 / _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _449 = _379 > 0.5;
    float _451 = fma(_441, -2.0, _439);
    float _453 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _429);
    float _455 = 1.0 / _447;
    float _457 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _481;
    float _485 = _471 * _393;
    float _487 = _139 * _139;
    float _489 = _475 * _443;
    float _491 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = _479 * _455;
    float _495 = fma(_141, _141, _487);
    float _497 = _483 * _391;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _367 + _499;
    bool _503 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_367);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_143, _143, _495);
    float _517 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _437);
    bool _519 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _521 = isnan(_367);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_97;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _427);
    float _535 = fma(_497, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _537 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _539 = rsqrt(_515);
    float _541 = -_513;
    float _543 = _541 + 1.0;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _549 = _367 + _547;
    float _551 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _553 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _555 = isnan(_367);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = _529 * _543;
    float _571 = fma(_485, _549, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _367 + _573;
    bool _577 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_367);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _563 * _567;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    float _595 = fma(_489, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _599 = _367 + _597;
    bool _601 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_367);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _593;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = _143 * _539;
    float _621 = fma(_493, _599, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _623 = _141 * _539;
    float _625 = _611 * _617;
    float _627 = _139 * _539;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _631 = _619 * _629;
    float _633 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _635 = _535 * _625;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _639 = _627 * _637;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _643 = -_631;
    float _645 = fma(_623, _641, _643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _649 = _623 * _647;
    float _651 = -_611;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _657 = -_639;
    float _659 = fma(_619, _655, _657);
    float _661 = _645 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = -_649;
    float _667 = fma(_627, _663, _665);
    bool _669 = !_397;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_659, _659, _661);
    bool _677 = !_401;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _635);
    float _683 = -_671;
    int _685 = _431 ? as_type<int>(_683) : as_type<int>(_671);
    float _687 = fma(_667, _667, _675);
    float _689 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _691 = -_679;
    int _693 = _449 ? as_type<int>(_691) : as_type<int>(_679);
    float _695 = fma(_571, _613, _681);
    bool _697 = !_405;
    float _699 = _697 ? _671 : as_type<float>(_685);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    float _703 = rsqrt(_687);
    bool _705 = !_409;
    float _707 = _705 ? _679 : as_type<float>(_693);
    float _709 = fma(_595, _589, _695);
    float _711 = _689 * _701;
    float _713 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _679);
    float _717 = _371 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _719 = _707 + (-0.5);
    float _721 = fma(_621, _569, _709);
    float _723 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = _699 + 0.5;
    float _727 = _713 * _715;
    float _729 = -_717;
    float _731 = -_491;
    float _733 = fma(_729, _719, _731);
    float _735 = _551 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _737 = fma(_723, _725, _533);
    float _739 = _727 * _619;
    float _741 = _659 * _703;
    float _743 = _645 * _703;
    float _745 = _667 * _703;
    float _747 = _727 * _627;
    float _749 = _619 * _741;
    float _751 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _753 = fma(_711, _745, _739);
    float _755 = _727 * _623;
    float _757 = -_749;
    float _759 = fma(_623, _745, _757);
    float _761 = _627 * _745;
    float _763 = fma(_711, _743, _747);
    float _765 = _623 * _743;
    float _767 = fma(_711, _741, _755);
    float _769 = -_761;
    float _771 = fma(_619, _743, _769);
    float _773 = fma(_751, _759, _763);
    float _775 = -_765;
    float _777 = fma(_627, _741, _775);
    float _779 = _545 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = fma(_751, _771, _767);
    float _783 = _735 + _773;
    float _785 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _721);
    float _787 = fma(_751, _777, _753);
    float _789 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _791 = _779 + _781;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _797 = _789 + _787;
    float _799 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _801 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _793);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _795);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].z, _801);
    float _811 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].z, _805);
    float _815 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].z, _807);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].z, _811);
    float _821 = _813 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _827 = _817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _829 = _817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = -_517;
    float _833 = _831 + 1.0;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _825);
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _827);
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _835);
    float _845 = -_833;
    float _847 = fma(_699, _845, _737);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _841);
    float _853 = -_537;
    float _855 = _853 + 1.0;
    float _857 = _819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _839);
    float _861 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_707, _855, _733);
    float _871 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _851);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _843);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _859);
    float _887 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.w = _873;
    out.m_44.x = _847;
    out.m_44.y = _869;
    out.m_46.x = _875;
    out.m_46.y = _877;
    out.m_46.z = _879;
    out.m_46.w = _881;
    out.gl_Position.x = _883;
    out.gl_Position.y = _871;
    out.gl_Position.z = _885;
    out.gl_Position.w = _887;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _359 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _943 = as_type<float>(_81);
        out.gl_Position.z = _943;
    }
    if (!_69)
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
    if (_93)
    {
        float _99 = float(_65);
        _75 = _99;
    }
    float _101 = _75;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    int _113 = 0;
    if (_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1012 = as_type<float>(_117);
        out.gl_Position.z = _1012;
    }
    if (_107)
    {
        return out;
    }
    float _119 = in.m_33.x;
    float _121 = in.m_33.y;
    float _123 = in.m_33.z;
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _127 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _129 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _131 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _133 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _127);
    float _135 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _129);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _135);
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _137);
    bool _145 = !_125;
    float _163;
    if (!_145)
    {
        float _147 = in.m_35.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_65);
        float _169 = 1.0 / _167;
        float _171 = _97 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = 1.0 / _189;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _197;
    float _217 = 1.0 / _193;
    float _219 = _177 * _211;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_209;
    float _235 = _233 + 1.0;
    float _237 = _231 * _235;
    float _239 = _181 * _215;
    bool _241 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_173);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _261 = _251 * _255;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _185 * _217;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    float _285 = fma(_259, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _295 = fma(_283, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _279 * _265;
    float _299 = fma(_289, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = fma(_293, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_279;
    float _305 = _303 + 1.0;
    float _307 = _295 * _297;
    float _309 = _299 * _297;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _317;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _323 = fma(_313, _239, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _325 = fma(_285, _261, _315);
    float _327 = fma(_319, _239, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _329 = fma(_301, _261, _321);
    float _331 = fma(_323, _237, _325);
    float _333 = fma(_327, _237, _329);
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].x, _331);
    float _337 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].y, _333);
    bool _339 = !_213;
    float _357;
    if (!_339)
    {
        float _341 = in.m_35.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_65);
        float _363 = 1.0 / _361;
        float _365 = _97 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = as_type<float>(int(gl_VertexIndex));
    float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _373 = in.m_40.x;
    float _375 = in.m_40.y;
    float _377 = in.m_35.x;
    float _379 = in.m_35.y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _391 = 1.0 / _385;
    float _393 = 1.0 / _389;
    int _395 = as_type<int>(_369) & 1;
    bool _397 = _395 != 0;
    int _399 = as_type<int>(_369) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = _337 * _375;
    float _413 = in.m_26.x;
    float _415 = in.m_26.y;
    float _417 = in.m_26.z;
    float _419 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _421 = _335 * _373;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = -_381;
    float _427 = fma(_419, 2.0, _425);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _431 = _377 > 0.5;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = 1.0 / _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _449 = _379 > 0.5;
    float _451 = fma(_441, -2.0, _439);
    float _453 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _429);
    float _455 = 1.0 / _447;
    float _457 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _481;
    float _485 = _471 * _393;
    float _487 = _139 * _139;
    float _489 = _475 * _443;
    float _491 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = _479 * _455;
    float _495 = fma(_141, _141, _487);
    float _497 = _483 * _391;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _367 + _499;
    bool _503 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_367);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_143, _143, _495);
    float _517 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _437);
    bool _519 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _521 = isnan(_367);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_97;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _427);
    float _535 = fma(_497, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _537 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _539 = rsqrt(_515);
    float _541 = -_513;
    float _543 = _541 + 1.0;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _549 = _367 + _547;
    float _551 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _553 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _555 = isnan(_367);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = _529 * _543;
    float _571 = fma(_485, _549, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _367 + _573;
    bool _577 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_367);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _563 * _567;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    float _595 = fma(_489, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _599 = _367 + _597;
    bool _601 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_367);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _593;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = _143 * _539;
    float _621 = fma(_493, _599, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _623 = _141 * _539;
    float _625 = _611 * _617;
    float _627 = _139 * _539;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _631 = _619 * _629;
    float _633 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _635 = _535 * _625;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _639 = _627 * _637;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _643 = -_631;
    float _645 = fma(_623, _641, _643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _649 = _623 * _647;
    float _651 = -_611;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _657 = -_639;
    float _659 = fma(_619, _655, _657);
    float _661 = _645 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = -_649;
    float _667 = fma(_627, _663, _665);
    bool _669 = !_397;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_659, _659, _661);
    bool _677 = !_401;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _635);
    float _683 = -_671;
    int _685 = _431 ? as_type<int>(_683) : as_type<int>(_671);
    float _687 = fma(_667, _667, _675);
    float _689 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _691 = -_679;
    int _693 = _449 ? as_type<int>(_691) : as_type<int>(_679);
    float _695 = fma(_571, _613, _681);
    bool _697 = !_405;
    float _699 = _697 ? _671 : as_type<float>(_685);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    float _703 = rsqrt(_687);
    bool _705 = !_409;
    float _707 = _705 ? _679 : as_type<float>(_693);
    float _709 = fma(_595, _589, _695);
    float _711 = _689 * _701;
    float _713 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _679);
    float _717 = _371 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _719 = _707 + (-0.5);
    float _721 = fma(_621, _569, _709);
    float _723 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = _699 + 0.5;
    float _727 = _713 * _715;
    float _729 = -_717;
    float _731 = -_491;
    float _733 = fma(_729, _719, _731);
    float _735 = _551 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _737 = fma(_723, _725, _533);
    float _739 = _727 * _619;
    float _741 = _659 * _703;
    float _743 = _645 * _703;
    float _745 = _667 * _703;
    float _747 = _727 * _627;
    float _749 = _619 * _741;
    float _751 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _753 = fma(_711, _745, _739);
    float _755 = _727 * _623;
    float _757 = -_749;
    float _759 = fma(_623, _745, _757);
    float _761 = _627 * _745;
    float _763 = fma(_711, _743, _747);
    float _765 = _623 * _743;
    float _767 = fma(_711, _741, _755);
    float _769 = -_761;
    float _771 = fma(_619, _743, _769);
    float _773 = fma(_751, _759, _763);
    float _775 = -_765;
    float _777 = fma(_627, _741, _775);
    float _779 = _545 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = fma(_751, _771, _767);
    float _783 = _735 + _773;
    float _785 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _721);
    float _787 = fma(_751, _777, _753);
    float _789 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _791 = _779 + _781;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _797 = _789 + _787;
    float _799 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _801 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _793);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _795);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].z, _801);
    float _811 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].z, _805);
    float _815 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].z, _807);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].z, _811);
    float _821 = _813 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _827 = _817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _829 = _817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = -_517;
    float _833 = _831 + 1.0;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _825);
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _827);
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _835);
    float _845 = -_833;
    float _847 = fma(_699, _845, _737);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _841);
    float _853 = -_537;
    float _855 = _853 + 1.0;
    float _857 = _819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _839);
    float _861 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_707, _855, _733);
    float _871 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _851);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _843);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _859);
    float _887 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.w = _873;
    out.m_44.x = _847;
    out.m_44.y = _869;
    out.m_46.x = _875;
    out.m_46.y = _877;
    out.m_46.z = _879;
    out.m_46.w = _881;
    out.gl_Position.x = _883;
    out.gl_Position.y = _871;
    out.gl_Position.z = _885;
    out.gl_Position.w = _887;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _359 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _943 = as_type<float>(_81);
        out.gl_Position.z = _943;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_65);
        _75 = _99;
    }
    float _101 = _75;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    int _113 = 0;
    if (_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1012 = as_type<float>(_117);
        out.gl_Position.z = _1012;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_33.x;
    float _121 = in.m_33.y;
    float _123 = in.m_33.z;
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _127 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _129 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _131 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _133 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _127);
    float _135 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _129);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _135);
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _137);
    bool _145 = !_125;
    float _163;
    if (!_145)
    {
        float _147 = in.m_35.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_65);
        float _169 = 1.0 / _167;
        float _171 = _97 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _173 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _185 = _173 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = 1.0 / _189;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _197;
    float _217 = 1.0 / _193;
    float _219 = _177 * _211;
    bool _221 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _223 = isnan(_173);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -_209;
    float _235 = _233 + 1.0;
    float _237 = _231 * _235;
    float _239 = _181 * _215;
    bool _241 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_173);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _261 = _251 * _255;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _185 * _217;
    bool _269 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_173);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    float _285 = fma(_259, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _295 = fma(_283, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _279 * _265;
    float _299 = fma(_289, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = fma(_293, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _303 = -_279;
    float _305 = _303 + 1.0;
    float _307 = _295 * _297;
    float _309 = _299 * _297;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _311;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _317;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _323 = fma(_313, _239, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _325 = fma(_285, _261, _315);
    float _327 = fma(_319, _239, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _329 = fma(_301, _261, _321);
    float _331 = fma(_323, _237, _325);
    float _333 = fma(_327, _237, _329);
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].x, _331);
    float _337 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[146].y, _333);
    bool _339 = !_213;
    float _357;
    if (!_339)
    {
        float _341 = in.m_35.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_65);
        float _363 = 1.0 / _361;
        float _365 = _97 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = as_type<float>(int(gl_VertexIndex));
    float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _373 = in.m_40.x;
    float _375 = in.m_40.y;
    float _377 = in.m_35.x;
    float _379 = in.m_35.y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _391 = 1.0 / _385;
    float _393 = 1.0 / _389;
    int _395 = as_type<int>(_369) & 1;
    bool _397 = _395 != 0;
    int _399 = as_type<int>(_369) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = _337 * _375;
    float _413 = in.m_26.x;
    float _415 = in.m_26.y;
    float _417 = in.m_26.z;
    float _419 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _421 = _335 * _373;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _425 = -_381;
    float _427 = fma(_419, 2.0, _425);
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _431 = _377 > 0.5;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _437 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _423);
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = 1.0 / _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _449 = _379 > 0.5;
    float _451 = fma(_441, -2.0, _439);
    float _453 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _429);
    float _455 = 1.0 / _447;
    float _457 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _467 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _481;
    float _485 = _471 * _393;
    float _487 = _139 * _139;
    float _489 = _475 * _443;
    float _491 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = _479 * _455;
    float _495 = fma(_141, _141, _487);
    float _497 = _483 * _391;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _367 + _499;
    bool _503 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_367);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_143, _143, _495);
    float _517 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _437);
    bool _519 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _521 = isnan(_367);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_97;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _427);
    float _535 = fma(_497, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _537 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _539 = rsqrt(_515);
    float _541 = -_513;
    float _543 = _541 + 1.0;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _463);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _549 = _367 + _547;
    float _551 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _465);
    bool _553 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _555 = isnan(_367);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = _529 * _543;
    float _571 = fma(_485, _549, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _367 + _573;
    bool _577 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_367);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _563 * _567;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    float _595 = fma(_489, _575, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _599 = _367 + _597;
    bool _601 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_367);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _593;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = _143 * _539;
    float _621 = fma(_493, _599, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _623 = _141 * _539;
    float _625 = _611 * _617;
    float _627 = _139 * _539;
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _631 = _619 * _629;
    float _633 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
    float _635 = _535 * _625;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _639 = _627 * _637;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _643 = -_631;
    float _645 = fma(_623, _641, _643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _649 = _623 * _647;
    float _651 = -_611;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _657 = -_639;
    float _659 = fma(_619, _655, _657);
    float _661 = _645 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = -_649;
    float _667 = fma(_627, _663, _665);
    bool _669 = !_397;
    float _671 = _669 ? (-0.5) : 0.5;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_659, _659, _661);
    bool _677 = !_401;
    float _679 = _677 ? (-0.5) : 0.5;
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _635);
    float _683 = -_671;
    int _685 = _431 ? as_type<int>(_683) : as_type<int>(_671);
    float _687 = fma(_667, _667, _675);
    float _689 = _421 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _691 = -_679;
    int _693 = _449 ? as_type<int>(_691) : as_type<int>(_679);
    float _695 = fma(_571, _613, _681);
    bool _697 = !_405;
    float _699 = _697 ? _671 : as_type<float>(_685);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _671);
    float _703 = rsqrt(_687);
    bool _705 = !_409;
    float _707 = _705 ? _679 : as_type<float>(_693);
    float _709 = fma(_595, _589, _695);
    float _711 = _689 * _701;
    float _713 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _679);
    float _717 = _371 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _719 = _707 + (-0.5);
    float _721 = fma(_621, _569, _709);
    float _723 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = _699 + 0.5;
    float _727 = _713 * _715;
    float _729 = -_717;
    float _731 = -_491;
    float _733 = fma(_729, _719, _731);
    float _735 = _551 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _737 = fma(_723, _725, _533);
    float _739 = _727 * _619;
    float _741 = _659 * _703;
    float _743 = _645 * _703;
    float _745 = _667 * _703;
    float _747 = _727 * _627;
    float _749 = _619 * _741;
    float _751 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _753 = fma(_711, _745, _739);
    float _755 = _727 * _623;
    float _757 = -_749;
    float _759 = fma(_623, _745, _757);
    float _761 = _627 * _745;
    float _763 = fma(_711, _743, _747);
    float _765 = _623 * _743;
    float _767 = fma(_711, _741, _755);
    float _769 = -_761;
    float _771 = fma(_619, _743, _769);
    float _773 = fma(_751, _759, _763);
    float _775 = -_765;
    float _777 = fma(_627, _741, _775);
    float _779 = _545 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = fma(_751, _771, _767);
    float _783 = _735 + _773;
    float _785 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _721);
    float _787 = fma(_751, _777, _753);
    float _789 = _633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _791 = _779 + _781;
    float _793 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _795 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _797 = _789 + _787;
    float _799 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _801 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _793);
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _805 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _795);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _799);
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].z, _801);
    float _811 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _803);
    float _813 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].z, _805);
    float _815 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].z, _807);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].z, _811);
    float _821 = _813 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _827 = _817 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _829 = _817 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = -_517;
    float _833 = _831 + 1.0;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[4].x, _825);
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[6].x, _827);
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _835);
    float _845 = -_833;
    float _847 = fma(_699, _845, _737);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _841);
    float _853 = -_537;
    float _855 = _853 + 1.0;
    float _857 = _819 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _859 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _839);
    float _861 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_707, _855, _733);
    float _871 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _851);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _883 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _843);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _859);
    float _887 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.w = _873;
    out.m_44.x = _847;
    out.m_44.y = _869;
    out.m_46.x = _875;
    out.m_46.y = _877;
    out.m_46.z = _879;
    out.m_46.w = _881;
    out.gl_Position.x = _883;
    out.gl_Position.y = _871;
    out.gl_Position.z = _885;
    out.gl_Position.w = _887;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

