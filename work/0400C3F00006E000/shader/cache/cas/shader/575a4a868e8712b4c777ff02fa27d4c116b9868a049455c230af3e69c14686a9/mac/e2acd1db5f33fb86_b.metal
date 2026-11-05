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
    float4 m_44 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_40 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_36 [[attribute(4)]];
    float4 m_38 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_83);
        out.gl_Position.z = _1148;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = _101;
    if (_97)
    {
        float _107 = float(_67);
        _103 = _107;
    }
    float _109 = _103;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    if (_115)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _77;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_121);
        out.gl_Position.z = _1217;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_36.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_67);
        float _167 = 1.0 / _165;
        float _169 = _101 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -_187;
    float _195 = _193 + 1.0;
    bool _197 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _199 = isnan(_171);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _209;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _191;
    float _217 = _207 * _195;
    float _219 = -_207;
    float _221 = _219 + 1.0;
    float _223 = _175 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _225;
    float _229 = fma(_211, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = fma(_227, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _233 = _229 * _217;
    float _235 = _231 * _217;
    float _237 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].x, _233);
    float _239 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].y, _235);
    float _241 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].x, _237);
    float _243 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].y, _239);
    bool _245 = !_213;
    float _263;
    if (!_245)
    {
        float _247 = in.m_36.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_67);
        float _269 = 1.0 / _267;
        float _271 = _101 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_36.x;
    float _277 = in.m_36.y;
    float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _281 = log2(_279);
    float _283 = in.m_36.z;
    float _285 = in.m_36.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = in.m_38.x;
    float _295 = in.m_38.y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _303 = _291;
    if (!_289)
    {
        float _305 = in.m_36.z;
        _301 = _305;
    }
    float _307 = _301;
    float _309 = _281 * _101;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _311 = _275 * 2.0;
    float _313 = _277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _315 = exp2(_309);
    float _317 = _277 * 2.0;
    float _319 = _283 * 2.0;
    float _321 = fma(_313, -2.0, _299);
    float _323 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    float _325 = floor(_311);
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _329 = _243 * _295;
    float _331 = _241 * _293;
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = floor(_319);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    bool _341 = _325 > 0.0;
    float _343 = _275 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _345 = _325 >= 0.0;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = floor(_317);
    float _357 = -_291;
    float _359 = fma(_343, 2.0, _357);
    float _361 = _343;
    if (!_289)
    {
        _361 = _277;
    }
    float _363 = _361;
    float _365 = _363;
    if (_289)
    {
        _365 = _275;
    }
    float _367 = _365;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _371 = _335 > 0.0;
    float _373 = -_101;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _359);
    bool _377 = _335 >= 0.0;
    bool _379 = isnan(_335);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[83].z, _369);
    float _389 = _307;
    if (!_289)
    {
        _303 = _307;
    }
    float _391 = _303;
    float _393 = _367 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _395 = _391;
    if (_289)
    {
        _395 = _277;
    }
    float _397 = _395;
    float _399 = -_327;
    float _401 = fma(_393, 2.0, _399);
    if (_289)
    {
        _389 = _277;
    }
    float _403 = _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _407 = _385 ? 0 : 1;
    float _409 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _411 = _353 ? 0 : 1;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _297);
    float _415 = fma(_409, -2.0, _405);
    float _417 = -_101;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[81].x, _401);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _425 = isnan(1.0);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _431 = _427 || _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _435 = 1.0 + _433;
    int _437 = ~_407;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _445 = _441;
    if (!_371)
    {
        int _447 = ~_407;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _435;
    float _467 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[78].z, _443);
    bool _469 = _355 > 0.0;
    float _471 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _473 = _463 ? _339 : 0.0;
    float _475 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _477 = _355 >= 0.0;
    bool _479 = isnan(_355);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _387);
    float _489 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _413);
    float _491 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _415);
    int _493 = ~_411;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = -_471;
    float _501 = _499 + 1.0;
    int _503 = _497;
    if (!_341)
    {
        int _505 = ~_411;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    float _511 = -_489;
    float _513 = _511 + 1.0;
    bool _515 = _277 > 0.5;
    float _517 = -_475;
    float _519 = _517 + 1.0;
    if (_431)
    {
        float _521 = _473 * _465;
        _105 = _521;
    }
    float _523 = _105;
    bool _525 = _275 > 0.5;
    float _527 = in.m_26.x;
    float _529 = in.m_26.y;
    float _531 = in.m_26.z;
    bool _533 = _283 > 0.5;
    float _535 = -_137;
    int _537 = _525 ? as_type<int>(_535) : as_type<int>(_137);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _549 = _547 != 0;
    float _551 = -_137;
    int _553 = _515 ? as_type<int>(_551) : as_type<int>(_137);
    float _555 = -_141;
    int _557 = _533 ? as_type<int>(_555) : as_type<int>(_141);
    int _559 = _485 ? 0 : 1;
    bool _561 = !_545;
    float _563 = _561 ? _137 : as_type<float>(_553);
    bool _565 = !_549;
    float _567 = _565 ? _141 : as_type<float>(_557);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    float _581 = _563 + 0.5;
    int _583 = ~_559;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = -_567;
    float _591 = _589 + 0.5;
    int _593 = _587;
    if (!_469)
    {
        int _595 = ~_559;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _603 = !_571;
    int _605 = _603 ? 0 : 1;
    float _607 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _609 = _285 > 0.5;
    float _611 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[4].x, _601);
    int _613 = abs(_605);
    float _615 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[6].x, _607);
    bool _617 = !_575;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    bool _623 = !_579;
    int _625 = _623 ? 0 : 1;
    float _627 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _647 = _645 != 0;
    float _649 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _651 = float(_451);
    float _653 = 1.0 / _643;
    float _655 = float(_613);
    float _657 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[5].x, _649);
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    int _665 = abs(_619);
    float _667 = _277 + _275;
    float _669 = _655 * _651;
    float _671 = _277 + _283;
    float _673 = _277 + (-0.5);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = _667 + (-1.0);
    float _681 = float(_509);
    float _683 = _671 + (-1.0);
    float _685 = float(_665);
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _689 = _669 * (-2.0);
    float _691 = _677 * _653;
    float _693 = _685 * _681;
    float _695 = fma(_687, _689, _687);
    float _697 = _275 + _283;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _275 + (-0.5);
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _705 = _697 + (-1.0);
    float _707 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _657);
    float _709 = fma(_689, _659, _659);
    int _711 = abs(_625);
    float _713 = float(_599);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _717 = float(_711);
    float _719 = _693 * (-2.0);
    float _721 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].x, _709);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _727 = _717 * _713;
    float _729 = fma(_699, _719, _699);
    float _731 = fma(_719, _661, _661);
    float _733 = fma(_695, _523, _721);
    float _735 = _727 * (-2.0);
    float _737 = -_137;
    int _739 = _533 ? as_type<int>(_737) : as_type<int>(_137);
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = fma(_735, _663, _663);
    float _747 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _731);
    float _749 = fma(_715, _735, _715);
    bool _751 = !_633;
    float _753 = _751 ? _137 : as_type<float>(_537);
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _757 = fma(_729, _523, _747);
    float _759 = _283 + (-0.5);
    float _761 = -_141;
    int _763 = _609 ? as_type<int>(_761) : as_type<int>(_141);
    float _765 = _333 * _755;
    float _767 = _757 * 0.15915493667125701904296875;
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _273 + _771;
    bool _775 = !_647;
    float _777 = _775 ? _137 : as_type<float>(_739);
    float _779 = _743 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_749, _523, _769);
    float _785 = -_141;
    int _787 = _515 ? as_type<int>(_785) : as_type<int>(_141);
    float _789 = fma(_691, _773, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _791 = !_541;
    float _793 = _791 ? _141 : as_type<float>(_763);
    float _795 = _783 * 0.15915493667125701904296875;
    bool _797 = !_639;
    float _799 = _797 ? _141 : as_type<float>(_787);
    float _801 = _329 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = _743 * 6.283185482025146484375;
    float _805 = cos(_803);
    bool _807 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _809 = isnan(_273);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = _703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _821 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_273);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _723 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = _753 + 0.5;
    float _837 = -_817;
    float _839 = _837 + 1.0;
    float _841 = _799 + (-0.5);
    float _843 = _767 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _849 = _777 + 0.5;
    float _851 = _801 * _725;
    float _853 = _831 * _839;
    float _855 = fma(_819, _835, _375);
    float _857 = -_833;
    float _859 = -_323;
    float _861 = fma(_857, _841, _859);
    float _863 = fma(_847, _849, _419);
    float _865 = _767 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _789 * _853;
    float _871 = -_831;
    float _873 = _871 + 1.0;
    float _875 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _877 = fma(_799, _501, _861);
    float _879 = -_519;
    float _881 = fma(_753, _879, _855);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _885 = _795 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _805 * _845;
    float _891 = _781 * _845;
    float _893 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[116].x, _883);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _897 = _795 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _805 * _867;
    float _903 = _845 * _887;
    float _905 = _887 * _851;
    float _907 = _867 * _887;
    float _909 = _781 * _867;
    float _911 = _805 * _905;
    float _913 = fma(_899, _901, _891);
    float _915 = -_889;
    float _917 = fma(_899, _909, _915);
    float _919 = -_909;
    float _921 = fma(_899, _889, _919);
    float _923 = _899 * _851;
    float _925 = fma(_913, _765, _911);
    float _927 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _929 = _781 * _905;
    float _931 = -_923;
    float _933 = fma(_907, _765, _931);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _937 = fma(_921, _927, _925);
    float _939 = fma(_899, _891, _901);
    float _941 = fma(_917, _765, _929);
    float _943 = fma(_903, _927, _933);
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _949 = fma(_939, _927, _941);
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].x, _945);
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].x, _947);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].x, _951);
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, _953);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, _959);
    float _967 = _875 + _961;
    float _969 = _935 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _971 = _793 + (-0.5);
    float _973 = _629 + _963;
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _635 + _965;
    float _979 = -_969;
    float _981 = -_491;
    float _983 = fma(_979, _971, _981);
    float _985 = _967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _989 = _967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _991 = _967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _985);
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _989);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _991);
    float _1001 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1005 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _997);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1011);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1013);
    float _1023 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _999);
    float _1025 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1017);
    float _1031 = -_487;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1025);
    float _1037 = _591 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1029);
    float _1041 = -_1033;
    float _1043 = fma(_777, _1041, _863);
    float _1045 = fma(_793, _513, _983);
    float _1047 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1049 = _581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1053 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1067 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1039);
    float _1071 = _1049 * _1007;
    float _1073 = _1037 * _957;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1027);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1051);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1053);
    out.m_42.x = _1071;
    out.m_42.y = _1073;
    out.m_44.x = _1081;
    out.m_44.y = _1083;
    out.m_44.z = _1085;
    out.m_44.w = _895;
    out.m_46.x = _1075;
    out.m_46.y = _1077;
    out.m_46.z = _1079;
    out.m_46.w = _1067;
    out.m_48.x = _881;
    out.m_48.y = _877;
    out.m_48.z = _1043;
    out.m_48.w = _1045;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1069;
    out.gl_Position.z = _1089;
    out.gl_Position.w = _1091;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_83);
        out.gl_Position.z = _1148;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = _101;
    if (_97)
    {
        float _107 = float(_67);
        _103 = _107;
    }
    float _109 = _103;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    if (_115)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _77;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_121);
        out.gl_Position.z = _1217;
    }
    if (_115)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_36.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_67);
        float _167 = 1.0 / _165;
        float _169 = _101 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -_187;
    float _195 = _193 + 1.0;
    bool _197 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _199 = isnan(_171);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _209;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _191;
    float _217 = _207 * _195;
    float _219 = -_207;
    float _221 = _219 + 1.0;
    float _223 = _175 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _225;
    float _229 = fma(_211, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = fma(_227, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _233 = _229 * _217;
    float _235 = _231 * _217;
    float _237 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].x, _233);
    float _239 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].y, _235);
    float _241 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].x, _237);
    float _243 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].y, _239);
    bool _245 = !_213;
    float _263;
    if (!_245)
    {
        float _247 = in.m_36.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_67);
        float _269 = 1.0 / _267;
        float _271 = _101 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_36.x;
    float _277 = in.m_36.y;
    float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _281 = log2(_279);
    float _283 = in.m_36.z;
    float _285 = in.m_36.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = in.m_38.x;
    float _295 = in.m_38.y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _303 = _291;
    if (!_289)
    {
        float _305 = in.m_36.z;
        _301 = _305;
    }
    float _307 = _301;
    float _309 = _281 * _101;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _311 = _275 * 2.0;
    float _313 = _277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _315 = exp2(_309);
    float _317 = _277 * 2.0;
    float _319 = _283 * 2.0;
    float _321 = fma(_313, -2.0, _299);
    float _323 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    float _325 = floor(_311);
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _329 = _243 * _295;
    float _331 = _241 * _293;
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = floor(_319);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    bool _341 = _325 > 0.0;
    float _343 = _275 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _345 = _325 >= 0.0;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = floor(_317);
    float _357 = -_291;
    float _359 = fma(_343, 2.0, _357);
    float _361 = _343;
    if (!_289)
    {
        _361 = _277;
    }
    float _363 = _361;
    float _365 = _363;
    if (_289)
    {
        _365 = _275;
    }
    float _367 = _365;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _371 = _335 > 0.0;
    float _373 = -_101;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _359);
    bool _377 = _335 >= 0.0;
    bool _379 = isnan(_335);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[83].z, _369);
    float _389 = _307;
    if (!_289)
    {
        _303 = _307;
    }
    float _391 = _303;
    float _393 = _367 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _395 = _391;
    if (_289)
    {
        _395 = _277;
    }
    float _397 = _395;
    float _399 = -_327;
    float _401 = fma(_393, 2.0, _399);
    if (_289)
    {
        _389 = _277;
    }
    float _403 = _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _407 = _385 ? 0 : 1;
    float _409 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _411 = _353 ? 0 : 1;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _297);
    float _415 = fma(_409, -2.0, _405);
    float _417 = -_101;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[81].x, _401);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _425 = isnan(1.0);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _431 = _427 || _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _435 = 1.0 + _433;
    int _437 = ~_407;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _445 = _441;
    if (!_371)
    {
        int _447 = ~_407;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _435;
    float _467 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[78].z, _443);
    bool _469 = _355 > 0.0;
    float _471 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _473 = _463 ? _339 : 0.0;
    float _475 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _477 = _355 >= 0.0;
    bool _479 = isnan(_355);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _387);
    float _489 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _413);
    float _491 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _415);
    int _493 = ~_411;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = -_471;
    float _501 = _499 + 1.0;
    int _503 = _497;
    if (!_341)
    {
        int _505 = ~_411;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    float _511 = -_489;
    float _513 = _511 + 1.0;
    bool _515 = _277 > 0.5;
    float _517 = -_475;
    float _519 = _517 + 1.0;
    if (_431)
    {
        float _521 = _473 * _465;
        _105 = _521;
    }
    float _523 = _105;
    bool _525 = _275 > 0.5;
    float _527 = in.m_26.x;
    float _529 = in.m_26.y;
    float _531 = in.m_26.z;
    bool _533 = _283 > 0.5;
    float _535 = -_137;
    int _537 = _525 ? as_type<int>(_535) : as_type<int>(_137);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _549 = _547 != 0;
    float _551 = -_137;
    int _553 = _515 ? as_type<int>(_551) : as_type<int>(_137);
    float _555 = -_141;
    int _557 = _533 ? as_type<int>(_555) : as_type<int>(_141);
    int _559 = _485 ? 0 : 1;
    bool _561 = !_545;
    float _563 = _561 ? _137 : as_type<float>(_553);
    bool _565 = !_549;
    float _567 = _565 ? _141 : as_type<float>(_557);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    float _581 = _563 + 0.5;
    int _583 = ~_559;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = -_567;
    float _591 = _589 + 0.5;
    int _593 = _587;
    if (!_469)
    {
        int _595 = ~_559;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _603 = !_571;
    int _605 = _603 ? 0 : 1;
    float _607 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _609 = _285 > 0.5;
    float _611 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[4].x, _601);
    int _613 = abs(_605);
    float _615 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[6].x, _607);
    bool _617 = !_575;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    bool _623 = !_579;
    int _625 = _623 ? 0 : 1;
    float _627 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _647 = _645 != 0;
    float _649 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _651 = float(_451);
    float _653 = 1.0 / _643;
    float _655 = float(_613);
    float _657 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[5].x, _649);
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    int _665 = abs(_619);
    float _667 = _277 + _275;
    float _669 = _655 * _651;
    float _671 = _277 + _283;
    float _673 = _277 + (-0.5);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = _667 + (-1.0);
    float _681 = float(_509);
    float _683 = _671 + (-1.0);
    float _685 = float(_665);
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _689 = _669 * (-2.0);
    float _691 = _677 * _653;
    float _693 = _685 * _681;
    float _695 = fma(_687, _689, _687);
    float _697 = _275 + _283;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _275 + (-0.5);
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _705 = _697 + (-1.0);
    float _707 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _657);
    float _709 = fma(_689, _659, _659);
    int _711 = abs(_625);
    float _713 = float(_599);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _717 = float(_711);
    float _719 = _693 * (-2.0);
    float _721 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].x, _709);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _727 = _717 * _713;
    float _729 = fma(_699, _719, _699);
    float _731 = fma(_719, _661, _661);
    float _733 = fma(_695, _523, _721);
    float _735 = _727 * (-2.0);
    float _737 = -_137;
    int _739 = _533 ? as_type<int>(_737) : as_type<int>(_137);
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = fma(_735, _663, _663);
    float _747 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _731);
    float _749 = fma(_715, _735, _715);
    bool _751 = !_633;
    float _753 = _751 ? _137 : as_type<float>(_537);
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _757 = fma(_729, _523, _747);
    float _759 = _283 + (-0.5);
    float _761 = -_141;
    int _763 = _609 ? as_type<int>(_761) : as_type<int>(_141);
    float _765 = _333 * _755;
    float _767 = _757 * 0.15915493667125701904296875;
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _273 + _771;
    bool _775 = !_647;
    float _777 = _775 ? _137 : as_type<float>(_739);
    float _779 = _743 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_749, _523, _769);
    float _785 = -_141;
    int _787 = _515 ? as_type<int>(_785) : as_type<int>(_141);
    float _789 = fma(_691, _773, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _791 = !_541;
    float _793 = _791 ? _141 : as_type<float>(_763);
    float _795 = _783 * 0.15915493667125701904296875;
    bool _797 = !_639;
    float _799 = _797 ? _141 : as_type<float>(_787);
    float _801 = _329 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = _743 * 6.283185482025146484375;
    float _805 = cos(_803);
    bool _807 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _809 = isnan(_273);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = _703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _821 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_273);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _723 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = _753 + 0.5;
    float _837 = -_817;
    float _839 = _837 + 1.0;
    float _841 = _799 + (-0.5);
    float _843 = _767 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _849 = _777 + 0.5;
    float _851 = _801 * _725;
    float _853 = _831 * _839;
    float _855 = fma(_819, _835, _375);
    float _857 = -_833;
    float _859 = -_323;
    float _861 = fma(_857, _841, _859);
    float _863 = fma(_847, _849, _419);
    float _865 = _767 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _789 * _853;
    float _871 = -_831;
    float _873 = _871 + 1.0;
    float _875 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _877 = fma(_799, _501, _861);
    float _879 = -_519;
    float _881 = fma(_753, _879, _855);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _885 = _795 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _805 * _845;
    float _891 = _781 * _845;
    float _893 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[116].x, _883);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _897 = _795 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _805 * _867;
    float _903 = _845 * _887;
    float _905 = _887 * _851;
    float _907 = _867 * _887;
    float _909 = _781 * _867;
    float _911 = _805 * _905;
    float _913 = fma(_899, _901, _891);
    float _915 = -_889;
    float _917 = fma(_899, _909, _915);
    float _919 = -_909;
    float _921 = fma(_899, _889, _919);
    float _923 = _899 * _851;
    float _925 = fma(_913, _765, _911);
    float _927 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _929 = _781 * _905;
    float _931 = -_923;
    float _933 = fma(_907, _765, _931);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _937 = fma(_921, _927, _925);
    float _939 = fma(_899, _891, _901);
    float _941 = fma(_917, _765, _929);
    float _943 = fma(_903, _927, _933);
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _949 = fma(_939, _927, _941);
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].x, _945);
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].x, _947);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].x, _951);
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, _953);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, _959);
    float _967 = _875 + _961;
    float _969 = _935 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _971 = _793 + (-0.5);
    float _973 = _629 + _963;
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _635 + _965;
    float _979 = -_969;
    float _981 = -_491;
    float _983 = fma(_979, _971, _981);
    float _985 = _967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _989 = _967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _991 = _967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _985);
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _989);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _991);
    float _1001 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1005 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _997);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1011);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1013);
    float _1023 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _999);
    float _1025 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1017);
    float _1031 = -_487;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1025);
    float _1037 = _591 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1029);
    float _1041 = -_1033;
    float _1043 = fma(_777, _1041, _863);
    float _1045 = fma(_793, _513, _983);
    float _1047 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1049 = _581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1053 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1067 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1039);
    float _1071 = _1049 * _1007;
    float _1073 = _1037 * _957;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1027);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1051);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1053);
    out.m_42.x = _1071;
    out.m_42.y = _1073;
    out.m_44.x = _1081;
    out.m_44.y = _1083;
    out.m_44.z = _1085;
    out.m_44.w = _895;
    out.m_46.x = _1075;
    out.m_46.y = _1077;
    out.m_46.z = _1079;
    out.m_46.w = _1067;
    out.m_48.x = _881;
    out.m_48.y = _877;
    out.m_48.z = _1043;
    out.m_48.w = _1045;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1069;
    out.gl_Position.z = _1089;
    out.gl_Position.w = _1091;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _265 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_83);
        out.gl_Position.z = _1148;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = _101;
    if (_97)
    {
        float _107 = float(_67);
        _103 = _107;
    }
    float _109 = _103;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    if (_115)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _77;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_121);
        out.gl_Position.z = _1217;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    bool _125 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _127 = as_type<int>(_123) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_123) & 2;
    bool _133 = _131 != 0;
    bool _135 = !_129;
    float _137 = _135 ? (-0.5) : 0.5;
    bool _139 = !_133;
    float _141 = _139 ? (-0.5) : 0.5;
    bool _143 = !_125;
    float _161;
    if (!_143)
    {
        float _145 = in.m_36.x;
        float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _149 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _153 = _151 * _147;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _159;
        _163 = true;
    }
    else
    {
        float _165 = float(_67);
        float _167 = 1.0 / _165;
        float _169 = _101 * _167;
        _161 = _169;
    }
    _163 = false;
    float _171 = _161;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _175 = _171 + _173;
    bool _177 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _179 = isnan(_171);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -_187;
    float _195 = _193 + 1.0;
    bool _197 = _171 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _199 = isnan(_171);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _205 = _201 || _203;
    float _207 = float(_205);
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _209;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _215 = 1.0 / _191;
    float _217 = _207 * _195;
    float _219 = -_207;
    float _221 = _219 + 1.0;
    float _223 = _175 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _225;
    float _229 = fma(_211, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = fma(_227, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _233 = _229 * _217;
    float _235 = _231 * _217;
    float _237 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].x, _233);
    float _239 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[143].y, _235);
    float _241 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].x, _237);
    float _243 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[144].y, _239);
    bool _245 = !_213;
    float _263;
    if (!_245)
    {
        float _247 = in.m_36.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_67);
        float _269 = 1.0 / _267;
        float _271 = _101 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_36.x;
    float _277 = in.m_36.y;
    float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _281 = log2(_279);
    float _283 = in.m_36.z;
    float _285 = in.m_36.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _289 = _287 != 0;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = in.m_38.x;
    float _295 = in.m_38.y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _303 = _291;
    if (!_289)
    {
        float _305 = in.m_36.z;
        _301 = _305;
    }
    float _307 = _301;
    float _309 = _281 * _101;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _311 = _275 * 2.0;
    float _313 = _277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _315 = exp2(_309);
    float _317 = _277 * 2.0;
    float _319 = _283 * 2.0;
    float _321 = fma(_313, -2.0, _299);
    float _323 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _321);
    float _325 = floor(_311);
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _329 = _243 * _295;
    float _331 = _241 * _293;
    float _333 = _331 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _335 = floor(_319);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    bool _341 = _325 > 0.0;
    float _343 = _275 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _345 = _325 >= 0.0;
    bool _347 = isnan(_325);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = floor(_317);
    float _357 = -_291;
    float _359 = fma(_343, 2.0, _357);
    float _361 = _343;
    if (!_289)
    {
        _361 = _277;
    }
    float _363 = _361;
    float _365 = _363;
    if (_289)
    {
        _365 = _275;
    }
    float _367 = _365;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _371 = _335 > 0.0;
    float _373 = -_101;
    float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _359);
    bool _377 = _335 >= 0.0;
    bool _379 = isnan(_335);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[83].z, _369);
    float _389 = _307;
    if (!_289)
    {
        _303 = _307;
    }
    float _391 = _303;
    float _393 = _367 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _395 = _391;
    if (_289)
    {
        _395 = _277;
    }
    float _397 = _395;
    float _399 = -_327;
    float _401 = fma(_393, 2.0, _399);
    if (_289)
    {
        _389 = _277;
    }
    float _403 = _389;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _407 = _385 ? 0 : 1;
    float _409 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _411 = _353 ? 0 : 1;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _297);
    float _415 = fma(_409, -2.0, _405);
    float _417 = -_101;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[81].x, _401);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _423 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _425 = isnan(1.0);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _431 = _427 || _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _435 = 1.0 + _433;
    int _437 = ~_407;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _445 = _441;
    if (!_371)
    {
        int _447 = ~_407;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _421);
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _435;
    float _467 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[78].z, _443);
    bool _469 = _355 > 0.0;
    float _471 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    float _473 = _463 ? _339 : 0.0;
    float _475 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _477 = _355 >= 0.0;
    bool _479 = isnan(_355);
    bool _481 = _477 || _479;
    bool _483 = isnan(0.0);
    bool _485 = _481 || _483;
    float _487 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _387);
    float _489 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _413);
    float _491 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _415);
    int _493 = ~_411;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = -_471;
    float _501 = _499 + 1.0;
    int _503 = _497;
    if (!_341)
    {
        int _505 = ~_411;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    float _511 = -_489;
    float _513 = _511 + 1.0;
    bool _515 = _277 > 0.5;
    float _517 = -_475;
    float _519 = _517 + 1.0;
    if (_431)
    {
        float _521 = _473 * _465;
        _105 = _521;
    }
    float _523 = _105;
    bool _525 = _275 > 0.5;
    float _527 = in.m_26.x;
    float _529 = in.m_26.y;
    float _531 = in.m_26.z;
    bool _533 = _283 > 0.5;
    float _535 = -_137;
    int _537 = _525 ? as_type<int>(_535) : as_type<int>(_137);
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _549 = _547 != 0;
    float _551 = -_137;
    int _553 = _515 ? as_type<int>(_551) : as_type<int>(_137);
    float _555 = -_141;
    int _557 = _533 ? as_type<int>(_555) : as_type<int>(_141);
    int _559 = _485 ? 0 : 1;
    bool _561 = !_545;
    float _563 = _561 ? _137 : as_type<float>(_553);
    bool _565 = !_549;
    float _567 = _565 ? _141 : as_type<float>(_557);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    float _581 = _563 + 0.5;
    int _583 = ~_559;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = -_567;
    float _591 = _589 + 0.5;
    int _593 = _587;
    if (!_469)
    {
        int _595 = ~_559;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _529 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _603 = !_571;
    int _605 = _603 ? 0 : 1;
    float _607 = _529 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _609 = _285 > 0.5;
    float _611 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[4].x, _601);
    int _613 = abs(_605);
    float _615 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[6].x, _607);
    bool _617 = !_575;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _611);
    bool _623 = !_579;
    int _625 = _623 ? 0 : 1;
    float _627 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _647 = _645 != 0;
    float _649 = _529 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _651 = float(_451);
    float _653 = 1.0 / _643;
    float _655 = float(_613);
    float _657 = fma(_527, (*spvDescriptorSet0.vp_c10)._m0[5].x, _649);
    float _659 = in.m_40.x;
    float _661 = in.m_40.y;
    float _663 = in.m_40.z;
    int _665 = abs(_619);
    float _667 = _277 + _275;
    float _669 = _655 * _651;
    float _671 = _277 + _283;
    float _673 = _277 + (-0.5);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _675;
    float _679 = _667 + (-1.0);
    float _681 = float(_509);
    float _683 = _671 + (-1.0);
    float _685 = float(_665);
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _689 = _669 * (-2.0);
    float _691 = _677 * _653;
    float _693 = _685 * _681;
    float _695 = fma(_687, _689, _687);
    float _697 = _275 + _283;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _275 + (-0.5);
    float _703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _705 = _697 + (-1.0);
    float _707 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _657);
    float _709 = fma(_689, _659, _659);
    int _711 = abs(_625);
    float _713 = float(_599);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _717 = float(_711);
    float _719 = _693 * (-2.0);
    float _721 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].x, _709);
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _141);
    float _727 = _717 * _713;
    float _729 = fma(_699, _719, _699);
    float _731 = fma(_719, _661, _661);
    float _733 = fma(_695, _523, _721);
    float _735 = _727 * (-2.0);
    float _737 = -_137;
    int _739 = _533 ? as_type<int>(_737) : as_type<int>(_137);
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = fma(_735, _663, _663);
    float _747 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _731);
    float _749 = fma(_715, _735, _715);
    bool _751 = !_633;
    float _753 = _751 ? _137 : as_type<float>(_537);
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _137);
    float _757 = fma(_729, _523, _747);
    float _759 = _283 + (-0.5);
    float _761 = -_141;
    int _763 = _609 ? as_type<int>(_761) : as_type<int>(_141);
    float _765 = _333 * _755;
    float _767 = _757 * 0.15915493667125701904296875;
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _273 + _771;
    bool _775 = !_647;
    float _777 = _775 ? _137 : as_type<float>(_739);
    float _779 = _743 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_749, _523, _769);
    float _785 = -_141;
    int _787 = _515 ? as_type<int>(_785) : as_type<int>(_141);
    float _789 = fma(_691, _773, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _791 = !_541;
    float _793 = _791 ? _141 : as_type<float>(_763);
    float _795 = _783 * 0.15915493667125701904296875;
    bool _797 = !_639;
    float _799 = _797 ? _141 : as_type<float>(_787);
    float _801 = _329 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = _743 * 6.283185482025146484375;
    float _805 = cos(_803);
    bool _807 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _809 = isnan(_273);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = _703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _821 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_273);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _723 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = _753 + 0.5;
    float _837 = -_817;
    float _839 = _837 + 1.0;
    float _841 = _799 + (-0.5);
    float _843 = _767 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _849 = _777 + 0.5;
    float _851 = _801 * _725;
    float _853 = _831 * _839;
    float _855 = fma(_819, _835, _375);
    float _857 = -_833;
    float _859 = -_323;
    float _861 = fma(_857, _841, _859);
    float _863 = fma(_847, _849, _419);
    float _865 = _767 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _789 * _853;
    float _871 = -_831;
    float _873 = _871 + 1.0;
    float _875 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _877 = fma(_799, _501, _861);
    float _879 = -_519;
    float _881 = fma(_753, _879, _855);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _885 = _795 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _805 * _845;
    float _891 = _781 * _845;
    float _893 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[116].x, _883);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _897 = _795 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _805 * _867;
    float _903 = _845 * _887;
    float _905 = _887 * _851;
    float _907 = _867 * _887;
    float _909 = _781 * _867;
    float _911 = _805 * _905;
    float _913 = fma(_899, _901, _891);
    float _915 = -_889;
    float _917 = fma(_899, _909, _915);
    float _919 = -_909;
    float _921 = fma(_899, _889, _919);
    float _923 = _899 * _851;
    float _925 = fma(_913, _765, _911);
    float _927 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _929 = _781 * _905;
    float _931 = -_923;
    float _933 = fma(_907, _765, _931);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _937 = fma(_921, _927, _925);
    float _939 = fma(_899, _891, _901);
    float _941 = fma(_917, _765, _929);
    float _943 = fma(_903, _927, _933);
    float _945 = _937 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _947 = _937 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _949 = fma(_939, _927, _941);
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].x, _945);
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].x, _947);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].x, _951);
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, _953);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, _959);
    float _967 = _875 + _961;
    float _969 = _935 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _971 = _793 + (-0.5);
    float _973 = _629 + _963;
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _977 = _635 + _965;
    float _979 = -_969;
    float _981 = -_491;
    float _983 = fma(_979, _971, _981);
    float _985 = _967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _975);
    float _989 = _967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _991 = _967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _993 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _985);
    float _995 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _989);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _991);
    float _1001 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1005 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _997);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1013 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1011);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1013);
    float _1023 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _999);
    float _1025 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1019);
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1017);
    float _1031 = -_487;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1025);
    float _1037 = _591 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1039 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1029);
    float _1041 = -_1033;
    float _1043 = fma(_777, _1041, _863);
    float _1045 = fma(_793, _513, _983);
    float _1047 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1049 = _581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1021);
    float _1053 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1067 = _893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1069 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1039);
    float _1071 = _1049 * _1007;
    float _1073 = _1037 * _957;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1027);
    float _1089 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1051);
    float _1091 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1053);
    out.m_42.x = _1071;
    out.m_42.y = _1073;
    out.m_44.x = _1081;
    out.m_44.y = _1083;
    out.m_44.z = _1085;
    out.m_44.w = _895;
    out.m_46.x = _1075;
    out.m_46.y = _1077;
    out.m_46.z = _1079;
    out.m_46.w = _1067;
    out.m_48.x = _881;
    out.m_48.y = _877;
    out.m_48.z = _1043;
    out.m_48.w = _1045;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1069;
    out.gl_Position.z = _1089;
    out.gl_Position.w = _1091;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

