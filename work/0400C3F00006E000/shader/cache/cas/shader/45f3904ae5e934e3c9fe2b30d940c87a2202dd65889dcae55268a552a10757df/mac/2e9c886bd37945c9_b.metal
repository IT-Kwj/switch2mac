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
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
    bool _531 = false;
    bool _283 = false;
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
        float _1375 = as_type<float>(_85);
        out.gl_Position.z = _1375;
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
        float _1444 = as_type<float>(_121);
        out.gl_Position.z = _1444;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _295 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = _291 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _291 + _331;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _315;
    float _349 = _329 * _321;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = _299 * _323;
    bool _369 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_291);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = fma(_365, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = -_379;
    float _389 = _387 + 1.0;
    float _391 = _333 * _347;
    float _393 = -_361;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _345 * _389;
    bool _403 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_291);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _379 * _395;
    bool _417 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_291);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -_345;
    float _435 = _433 + 1.0;
    float _437 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = fma(_385, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_431, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _427 * _435;
    float _445 = -_427;
    float _447 = _445 + 1.0;
    float _449 = -_413;
    float _451 = _449 + 1.0;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = _413 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = _381 * _457;
    float _469 = _437 * _457;
    float _471 = fma(_461, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_465, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_439, _443, _475);
    float _489 = fma(_441, _443, _477);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_471, _401, _487);
    float _497 = fma(_473, _401, _489);
    float _499 = fma(_491, _415, _495);
    float _501 = fma(_493, _415, _497);
    float _503 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _453;
    float _509 = _505 * _455;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_42.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_69);
        float _535 = 1.0 / _533;
        float _537 = _103 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _563 = isnan(_539);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _573;
    float _577 = in.m_42.x;
    float _579 = -_555;
    float _581 = _579 + 1.0;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _585 = 1.0 / _559;
    float _587 = _571 * _581;
    float _589 = -_571;
    float _591 = _589 + 1.0;
    float _593 = _575 * _585;
    float _595 = fma(_593, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _599 = _595 * _587;
    float _601 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[115].x, _599);
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _601 * _577;
    float _613 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[116].x, _607);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _619 = trunc(_611);
    int _621 = int(_619);
    float _623 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _605;
    out.m_44.y = _623;
    out.m_44.z = _609;
    out.m_44.w = _617;
    int _625 = _621 << 4;
    int _627 = _625 + 1968;
    bool _629 = !_583;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_69);
        float _651 = 1.0 / _649;
        float _653 = _103 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_42.w;
    float _659 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = in.m_42.z;
    float _663 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    float _673 = in.m_42.y;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _677 = _675 != 0;
    float _679 = 1.0 / _667;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _683 = _681 != 0;
    float _685 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _689 = _687 != 0;
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _693 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _699 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _713 = _577 > 0.5;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _719 = _657 > 0.5;
    float _721 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _725 = _661 > 0.5;
    float _727 = 1.0 / _717;
    float _729 = -_697;
    float _731 = fma(_723, 2.0, _729);
    float _733 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _735;
    bool _739 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _741 = isnan(_655);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _753 = _737 * _679;
    bool _755 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _757 = isnan(_655);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _751);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _655 + _769;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _781 = -_765;
    float _783 = _781 + 1.0;
    float _785 = fma(_753, _771, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _787 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _789 = isnan(_655);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _765 * _775;
    float _801 = 1.0 / _779;
    float _803 = -_797;
    float _805 = _803 + 1.0;
    float _807 = _797 * _783;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _749 * _805;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_811, -2.0, _809);
    float _823 = _815 * _727;
    float _825 = _785 * _817;
    float _827 = -_749;
    float _829 = _827 + 1.0;
    uint _832 = uint(int(uint(_627) >> uint(2)));
    uint _834 = uint(int(uint(int(_832)) >> uint(2)));
    int _836 = int(_832) & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[int(_834)][_836];
    int _840 = int(_832) + 1;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    int _844 = _840 & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _655 + _848;
    float _852 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _825);
    float _854 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = fma(_823, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _860;
    int _864 = _627 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = _655 + _874;
    float _878 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _733);
    float _880 = -_177;
    int _882 = _713 ? as_type<int>(_880) : as_type<int>(_177);
    float _884 = _862 * _801;
    bool _886 = _673 > 0.5;
    float _888 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _890 = fma(_858, _807, _852);
    float _892 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _894 = !_671;
    float _896 = _894 ? _177 : as_type<float>(_882);
    float _898 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _900 = -_181;
    int _902 = _886 ? as_type<int>(_900) : as_type<int>(_181);
    float _904 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _906 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _910 = _888 + _908;
    float _912 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _767);
    bool _914 = !_677;
    float _916 = _914 ? _181 : as_type<float>(_902);
    float _918 = -_103;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[76].x, _731);
    float _922 = _896 + 0.5;
    float _924 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _928 = _711 + _926;
    float _930 = _910 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = fma(_898, _799, _890);
    float _934 = fma(_904, _922, _920);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _942 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[134].x, _932);
    float _944 = -_177;
    int _946 = _725 ? as_type<int>(_944) : as_type<int>(_177);
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _950 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _940);
    float _954 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _956 = -_181;
    int _958 = _719 ? as_type<int>(_956) : as_type<int>(_181);
    float _960 = _916 + (-0.5);
    bool _962 = !_683;
    float _964 = _962 ? _177 : as_type<float>(_946);
    float _966 = _942 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _970 = !_689;
    float _972 = _970 ? _181 : as_type<float>(_958);
    float _974 = -_906;
    float _976 = -_950;
    float _978 = fma(_974, _960, _976);
    bool _980 = _952 >= 0.0;
    float _982 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _984 = _910 * _910;
    float _986 = _964 + 0.5;
    float _988 = -_972;
    float _990 = _988 + 0.5;
    float _992 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _994 = fma(_928, _928, _984);
    float _996 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = -_954;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_938, _938, _994);
    float _1006 = _996 * _948;
    float _1008 = -_912;
    float _1010 = _1008 + 1.0;
    float _1012 = _998 * _968;
    float _1014 = rsqrt(_1004);
    float _1016 = _968;
    if (_980)
    {
        _1016 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1018 = _1016;
    float _1020 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = fma(_916, _1002, _978);
    float _1024 = -_1010;
    float _1026 = fma(_896, _1024, _934);
    float _1028 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1034 = as_type<int>(_1018);
    if (_980)
    {
        float _1036 = _1018 * 5.0;
        _1034 = as_type<int>(_1036);
    }
    int _1038 = _1034;
    out.m_46.x = _1026;
    out.m_46.y = _1022;
    out.m_46.z = _1006;
    out.m_46.w = _1012;
    out.m_48.x = _1028;
    out.m_48.y = _1030;
    out.m_48.z = _1032;
    out.m_48.w = _966;
    float _1040 = _910 * _1014;
    float _1042 = _928 * _1014;
    float _1044 = as_type<float>(_1038);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_1038);
        out.gl_Position.z = _2961;
    }
    if (_980)
    {
        out.m_33.x = 0.0;
    }
    if (_980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1046 = -_1040;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _1050 = _938 * _1014;
    float _1052 = -_1042;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1056 = -_1040;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1062 = _1048 + _1060;
    float _1064 = -_1050;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1054 + _1068;
    float _1072 = -_1042;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1066 + _1078;
    float _1082 = _1058 * _1058;
    float _1084 = -_1050;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1076);
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    float _1094 = fma(_1086, _1086, _1090);
    bool _1096 = _1092 >= 0.0;
    float _1098 = sqrt(_1094);
    if (_1096)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1044;
    int _1102 = as_type<int>(_1100);
    if (_1096)
    {
        out.m_33.x = 0.0;
    }
    float _1104 = _1014 * _1098;
    if (_1096)
    {
        float _1106 = _1100 * 5.0;
        _1102 = as_type<int>(_1106);
    }
    int _1108 = _1102;
    if (_1096)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_1108);
        out.gl_Position.z = _3092;
    }
    if (_1096)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1110 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1112 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1118 = _1104 * _1110;
    float _1120 = _1104 * _1112;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1124 = _1122 * 0.5;
    float _1126 = _1114 * _1118;
    float _1128 = _1116 * _1120;
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1136 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1130);
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1132);
    float _1140 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1134);
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1154 = _924 + _1148;
    float _1156 = _711 + _1150;
    float _1158 = _888 + _1152;
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = _1162 * _1162;
    float _1170 = fma(_1166, _1166, _1168);
    float _1172 = sqrt(_1170);
    bool _1174 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1124;
    float _1178 = _1128;
    float _1180 = _1154;
    if (!_1174)
    {
        _1176 = _1154;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (!_1174)
    {
        _1178 = _1156;
    }
    float _1186 = _1178;
    float _1188 = _1186;
    if (!_1174)
    {
        _1180 = _1158;
    }
    float _1190 = _1180;
    bool _1192 = !_1174;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1172 + _1198;
        float _1202 = rsqrt(_1170);
        float _1204 = _1200 * _1196;
        float _1206 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = cos(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = sin(_1214);
        float _1218 = _1212 + (-1.0);
        float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = fma(_1216, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1224 = fma(_1158, _1212, _1220);
        float _1226 = _1202 * _1222;
        float _1228 = fma(_1166, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1230 = fma(_1162, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1224;
        _1188 = _1228;
        _1184 = _1230;
    }
    float _1232 = _1194;
    float _1234 = _1188;
    float _1236 = _1184;
    float _1238 = -_1040;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1242 = -_1042;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1246 = -_1050;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1266 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1258);
    float _1268 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1260);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1284 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1284);
    float _1294 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1286);
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1288);
    float _1298 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1300 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1292);
    float _1302 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1298);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1300);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1314 = _1306 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1318 = _1314 * 0.5;
    out.m_33.x = _1316;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1312;
    out.gl_Position.z = _1306;
    out.gl_Position.w = _1308;
    out.m_50.z = _1318;
    out.m_50.w = _1308;
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
    bool _647 = false;
    bool _531 = false;
    bool _283 = false;
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
        float _1375 = as_type<float>(_85);
        out.gl_Position.z = _1375;
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
        float _1444 = as_type<float>(_121);
        out.gl_Position.z = _1444;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _295 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = _291 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _291 + _331;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _315;
    float _349 = _329 * _321;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = _299 * _323;
    bool _369 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_291);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = fma(_365, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = -_379;
    float _389 = _387 + 1.0;
    float _391 = _333 * _347;
    float _393 = -_361;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _345 * _389;
    bool _403 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_291);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _379 * _395;
    bool _417 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_291);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -_345;
    float _435 = _433 + 1.0;
    float _437 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = fma(_385, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_431, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _427 * _435;
    float _445 = -_427;
    float _447 = _445 + 1.0;
    float _449 = -_413;
    float _451 = _449 + 1.0;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = _413 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = _381 * _457;
    float _469 = _437 * _457;
    float _471 = fma(_461, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_465, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_439, _443, _475);
    float _489 = fma(_441, _443, _477);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_471, _401, _487);
    float _497 = fma(_473, _401, _489);
    float _499 = fma(_491, _415, _495);
    float _501 = fma(_493, _415, _497);
    float _503 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _453;
    float _509 = _505 * _455;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_42.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_69);
        float _535 = 1.0 / _533;
        float _537 = _103 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _563 = isnan(_539);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _573;
    float _577 = in.m_42.x;
    float _579 = -_555;
    float _581 = _579 + 1.0;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _585 = 1.0 / _559;
    float _587 = _571 * _581;
    float _589 = -_571;
    float _591 = _589 + 1.0;
    float _593 = _575 * _585;
    float _595 = fma(_593, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _599 = _595 * _587;
    float _601 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[115].x, _599);
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _601 * _577;
    float _613 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[116].x, _607);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _619 = trunc(_611);
    int _621 = int(_619);
    float _623 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _605;
    out.m_44.y = _623;
    out.m_44.z = _609;
    out.m_44.w = _617;
    int _625 = _621 << 4;
    int _627 = _625 + 1968;
    bool _629 = !_583;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_69);
        float _651 = 1.0 / _649;
        float _653 = _103 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_42.w;
    float _659 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = in.m_42.z;
    float _663 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    float _673 = in.m_42.y;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _677 = _675 != 0;
    float _679 = 1.0 / _667;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _683 = _681 != 0;
    float _685 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _689 = _687 != 0;
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _693 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _699 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _713 = _577 > 0.5;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _719 = _657 > 0.5;
    float _721 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _725 = _661 > 0.5;
    float _727 = 1.0 / _717;
    float _729 = -_697;
    float _731 = fma(_723, 2.0, _729);
    float _733 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _735;
    bool _739 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _741 = isnan(_655);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _753 = _737 * _679;
    bool _755 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _757 = isnan(_655);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _751);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _655 + _769;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _781 = -_765;
    float _783 = _781 + 1.0;
    float _785 = fma(_753, _771, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _787 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _789 = isnan(_655);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _765 * _775;
    float _801 = 1.0 / _779;
    float _803 = -_797;
    float _805 = _803 + 1.0;
    float _807 = _797 * _783;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _749 * _805;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_811, -2.0, _809);
    float _823 = _815 * _727;
    float _825 = _785 * _817;
    float _827 = -_749;
    float _829 = _827 + 1.0;
    uint _832 = uint(int(uint(_627) >> uint(2)));
    uint _834 = uint(int(uint(int(_832)) >> uint(2)));
    int _836 = int(_832) & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[int(_834)][_836];
    int _840 = int(_832) + 1;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    int _844 = _840 & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _655 + _848;
    float _852 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _825);
    float _854 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = fma(_823, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _860;
    int _864 = _627 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = _655 + _874;
    float _878 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _733);
    float _880 = -_177;
    int _882 = _713 ? as_type<int>(_880) : as_type<int>(_177);
    float _884 = _862 * _801;
    bool _886 = _673 > 0.5;
    float _888 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _890 = fma(_858, _807, _852);
    float _892 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _894 = !_671;
    float _896 = _894 ? _177 : as_type<float>(_882);
    float _898 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _900 = -_181;
    int _902 = _886 ? as_type<int>(_900) : as_type<int>(_181);
    float _904 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _906 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _910 = _888 + _908;
    float _912 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _767);
    bool _914 = !_677;
    float _916 = _914 ? _181 : as_type<float>(_902);
    float _918 = -_103;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[76].x, _731);
    float _922 = _896 + 0.5;
    float _924 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _928 = _711 + _926;
    float _930 = _910 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = fma(_898, _799, _890);
    float _934 = fma(_904, _922, _920);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _942 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[134].x, _932);
    float _944 = -_177;
    int _946 = _725 ? as_type<int>(_944) : as_type<int>(_177);
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _950 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _940);
    float _954 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _956 = -_181;
    int _958 = _719 ? as_type<int>(_956) : as_type<int>(_181);
    float _960 = _916 + (-0.5);
    bool _962 = !_683;
    float _964 = _962 ? _177 : as_type<float>(_946);
    float _966 = _942 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _970 = !_689;
    float _972 = _970 ? _181 : as_type<float>(_958);
    float _974 = -_906;
    float _976 = -_950;
    float _978 = fma(_974, _960, _976);
    bool _980 = _952 >= 0.0;
    float _982 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _984 = _910 * _910;
    float _986 = _964 + 0.5;
    float _988 = -_972;
    float _990 = _988 + 0.5;
    float _992 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _994 = fma(_928, _928, _984);
    float _996 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = -_954;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_938, _938, _994);
    float _1006 = _996 * _948;
    float _1008 = -_912;
    float _1010 = _1008 + 1.0;
    float _1012 = _998 * _968;
    float _1014 = rsqrt(_1004);
    float _1016 = _968;
    if (_980)
    {
        _1016 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1018 = _1016;
    float _1020 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = fma(_916, _1002, _978);
    float _1024 = -_1010;
    float _1026 = fma(_896, _1024, _934);
    float _1028 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1034 = as_type<int>(_1018);
    if (_980)
    {
        float _1036 = _1018 * 5.0;
        _1034 = as_type<int>(_1036);
    }
    int _1038 = _1034;
    out.m_46.x = _1026;
    out.m_46.y = _1022;
    out.m_46.z = _1006;
    out.m_46.w = _1012;
    out.m_48.x = _1028;
    out.m_48.y = _1030;
    out.m_48.z = _1032;
    out.m_48.w = _966;
    float _1040 = _910 * _1014;
    float _1042 = _928 * _1014;
    float _1044 = as_type<float>(_1038);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_1038);
        out.gl_Position.z = _2961;
    }
    if (_980)
    {
        out.m_33.x = 0.0;
    }
    if (_980)
    {
        return out;
    }
    float _1046 = -_1040;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _1050 = _938 * _1014;
    float _1052 = -_1042;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1056 = -_1040;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1062 = _1048 + _1060;
    float _1064 = -_1050;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1054 + _1068;
    float _1072 = -_1042;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1066 + _1078;
    float _1082 = _1058 * _1058;
    float _1084 = -_1050;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1076);
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    float _1094 = fma(_1086, _1086, _1090);
    bool _1096 = _1092 >= 0.0;
    float _1098 = sqrt(_1094);
    if (_1096)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1044;
    int _1102 = as_type<int>(_1100);
    if (_1096)
    {
        out.m_33.x = 0.0;
    }
    float _1104 = _1014 * _1098;
    if (_1096)
    {
        float _1106 = _1100 * 5.0;
        _1102 = as_type<int>(_1106);
    }
    int _1108 = _1102;
    if (_1096)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_1108);
        out.gl_Position.z = _3092;
    }
    if (_1096)
    {
        return out;
    }
    float _1110 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1112 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1118 = _1104 * _1110;
    float _1120 = _1104 * _1112;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1124 = _1122 * 0.5;
    float _1126 = _1114 * _1118;
    float _1128 = _1116 * _1120;
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1136 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1130);
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1132);
    float _1140 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1134);
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1154 = _924 + _1148;
    float _1156 = _711 + _1150;
    float _1158 = _888 + _1152;
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = _1162 * _1162;
    float _1170 = fma(_1166, _1166, _1168);
    float _1172 = sqrt(_1170);
    bool _1174 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1124;
    float _1178 = _1128;
    float _1180 = _1154;
    if (!_1174)
    {
        _1176 = _1154;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (!_1174)
    {
        _1178 = _1156;
    }
    float _1186 = _1178;
    float _1188 = _1186;
    if (!_1174)
    {
        _1180 = _1158;
    }
    float _1190 = _1180;
    bool _1192 = !_1174;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1172 + _1198;
        float _1202 = rsqrt(_1170);
        float _1204 = _1200 * _1196;
        float _1206 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = cos(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = sin(_1214);
        float _1218 = _1212 + (-1.0);
        float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = fma(_1216, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1224 = fma(_1158, _1212, _1220);
        float _1226 = _1202 * _1222;
        float _1228 = fma(_1166, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1230 = fma(_1162, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1224;
        _1188 = _1228;
        _1184 = _1230;
    }
    float _1232 = _1194;
    float _1234 = _1188;
    float _1236 = _1184;
    float _1238 = -_1040;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1242 = -_1042;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1246 = -_1050;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1266 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1258);
    float _1268 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1260);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1284 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1284);
    float _1294 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1286);
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1288);
    float _1298 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1300 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1292);
    float _1302 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1298);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1300);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1314 = _1306 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1318 = _1314 * 0.5;
    out.m_33.x = _1316;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1312;
    out.gl_Position.z = _1306;
    out.gl_Position.w = _1308;
    out.m_50.z = _1318;
    out.m_50.w = _1308;
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
    bool _647 = false;
    bool _531 = false;
    bool _283 = false;
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
        float _1375 = as_type<float>(_85);
        out.gl_Position.z = _1375;
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
        float _1444 = as_type<float>(_121);
        out.gl_Position.z = _1444;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _303;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _311;
    float _323 = 1.0 / _307;
    float _325 = _295 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = _291 + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _291 + _331;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _315;
    float _349 = _329 * _321;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = _299 * _323;
    bool _369 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_291);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = fma(_365, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _387 = -_379;
    float _389 = _387 + 1.0;
    float _391 = _333 * _347;
    float _393 = -_361;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _345 * _389;
    bool _403 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_291);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _379 * _395;
    bool _417 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _419 = isnan(_291);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -_345;
    float _435 = _433 + 1.0;
    float _437 = fma(_399, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = fma(_385, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_431, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _427 * _435;
    float _445 = -_427;
    float _447 = _445 + 1.0;
    float _449 = -_413;
    float _451 = _449 + 1.0;
    float _453 = in.m_40.x;
    float _455 = in.m_40.y;
    float _457 = _413 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = _381 * _457;
    float _469 = _437 * _457;
    float _471 = fma(_461, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_465, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[143].y, _469);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_439, _443, _475);
    float _489 = fma(_441, _443, _477);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_471, _401, _487);
    float _497 = fma(_473, _401, _489);
    float _499 = fma(_491, _415, _495);
    float _501 = fma(_493, _415, _497);
    float _503 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _453;
    float _509 = _505 * _455;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_42.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_69);
        float _535 = 1.0 / _533;
        float _537 = _103 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _563 = isnan(_539);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _573;
    float _577 = in.m_42.x;
    float _579 = -_555;
    float _581 = _579 + 1.0;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _585 = 1.0 / _559;
    float _587 = _571 * _581;
    float _589 = -_571;
    float _591 = _589 + 1.0;
    float _593 = _575 * _585;
    float _595 = fma(_593, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _599 = _595 * _587;
    float _601 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[115].x, _599);
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _601 * _577;
    float _613 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[116].x, _607);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _619 = trunc(_611);
    int _621 = int(_619);
    float _623 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_44.x = _605;
    out.m_44.y = _623;
    out.m_44.z = _609;
    out.m_44.w = _617;
    int _625 = _621 << 4;
    int _627 = _625 + 1968;
    bool _629 = !_583;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_69);
        float _651 = 1.0 / _649;
        float _653 = _103 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_42.w;
    float _659 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = in.m_42.z;
    float _663 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    float _673 = in.m_42.y;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _677 = _675 != 0;
    float _679 = 1.0 / _667;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _683 = _681 != 0;
    float _685 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _689 = _687 != 0;
    float _691 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _693 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _699 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _713 = _577 > 0.5;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _719 = _657 > 0.5;
    float _721 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _725 = _661 > 0.5;
    float _727 = 1.0 / _717;
    float _729 = -_697;
    float _731 = fma(_723, 2.0, _729);
    float _733 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _735;
    bool _739 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _741 = isnan(_655);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _753 = _737 * _679;
    bool _755 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _757 = isnan(_655);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _751);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _771 = _655 + _769;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _781 = -_765;
    float _783 = _781 + 1.0;
    float _785 = fma(_753, _771, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _787 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _789 = isnan(_655);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _765 * _775;
    float _801 = 1.0 / _779;
    float _803 = -_797;
    float _805 = _803 + 1.0;
    float _807 = _797 * _783;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _749 * _805;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _821 = fma(_811, -2.0, _809);
    float _823 = _815 * _727;
    float _825 = _785 * _817;
    float _827 = -_749;
    float _829 = _827 + 1.0;
    uint _832 = uint(int(uint(_627) >> uint(2)));
    uint _834 = uint(int(uint(int(_832)) >> uint(2)));
    int _836 = int(_832) & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[int(_834)][_836];
    int _840 = int(_832) + 1;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    int _844 = _840 & 3;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[int(_842)][_844];
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _655 + _848;
    float _852 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _825);
    float _854 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = fma(_823, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _860;
    int _864 = _627 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = _655 + _874;
    float _878 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _733);
    float _880 = -_177;
    int _882 = _713 ? as_type<int>(_880) : as_type<int>(_177);
    float _884 = _862 * _801;
    bool _886 = _673 > 0.5;
    float _888 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _890 = fma(_858, _807, _852);
    float _892 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _894 = !_671;
    float _896 = _894 ? _177 : as_type<float>(_882);
    float _898 = fma(_884, _876, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _900 = -_181;
    int _902 = _886 ? as_type<int>(_900) : as_type<int>(_181);
    float _904 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _906 = _819 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _910 = _888 + _908;
    float _912 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _767);
    bool _914 = !_677;
    float _916 = _914 ? _181 : as_type<float>(_902);
    float _918 = -_103;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[76].x, _731);
    float _922 = _896 + 0.5;
    float _924 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _928 = _711 + _926;
    float _930 = _910 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _932 = fma(_898, _799, _890);
    float _934 = fma(_904, _922, _920);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _924 + _936;
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _930);
    float _942 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[134].x, _932);
    float _944 = -_177;
    int _946 = _725 ? as_type<int>(_944) : as_type<int>(_177);
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _950 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _940);
    float _954 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _892);
    float _956 = -_181;
    int _958 = _719 ? as_type<int>(_956) : as_type<int>(_181);
    float _960 = _916 + (-0.5);
    bool _962 = !_683;
    float _964 = _962 ? _177 : as_type<float>(_946);
    float _966 = _942 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _970 = !_689;
    float _972 = _970 ? _181 : as_type<float>(_958);
    float _974 = -_906;
    float _976 = -_950;
    float _978 = fma(_974, _960, _976);
    bool _980 = _952 >= 0.0;
    float _982 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _984 = _910 * _910;
    float _986 = _964 + 0.5;
    float _988 = -_972;
    float _990 = _988 + 0.5;
    float _992 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _994 = fma(_928, _928, _984);
    float _996 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = -_954;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_938, _938, _994);
    float _1006 = _996 * _948;
    float _1008 = -_912;
    float _1010 = _1008 + 1.0;
    float _1012 = _998 * _968;
    float _1014 = rsqrt(_1004);
    float _1016 = _968;
    if (_980)
    {
        _1016 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1018 = _1016;
    float _1020 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1022 = fma(_916, _1002, _978);
    float _1024 = -_1010;
    float _1026 = fma(_896, _1024, _934);
    float _1028 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1030 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1034 = as_type<int>(_1018);
    if (_980)
    {
        float _1036 = _1018 * 5.0;
        _1034 = as_type<int>(_1036);
    }
    int _1038 = _1034;
    out.m_46.x = _1026;
    out.m_46.y = _1022;
    out.m_46.z = _1006;
    out.m_46.w = _1012;
    out.m_48.x = _1028;
    out.m_48.y = _1030;
    out.m_48.z = _1032;
    out.m_48.w = _966;
    float _1040 = _910 * _1014;
    float _1042 = _928 * _1014;
    float _1044 = as_type<float>(_1038);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2961 = as_type<float>(_1038);
        out.gl_Position.z = _2961;
    }
    if (_980)
    {
        out.m_33.x = 0.0;
    }
    if (_980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1046 = -_1040;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _1050 = _938 * _1014;
    float _1052 = -_1042;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    float _1056 = -_1040;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _910);
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1062 = _1048 + _1060;
    float _1064 = -_1050;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1054 + _1068;
    float _1072 = -_1042;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1076 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = _1066 + _1078;
    float _1082 = _1058 * _1058;
    float _1084 = -_1050;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1076);
    float _1090 = fma(_1074, _1074, _1082);
    float _1092 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    float _1094 = fma(_1086, _1086, _1090);
    bool _1096 = _1092 >= 0.0;
    float _1098 = sqrt(_1094);
    if (_1096)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1044;
    int _1102 = as_type<int>(_1100);
    if (_1096)
    {
        out.m_33.x = 0.0;
    }
    float _1104 = _1014 * _1098;
    if (_1096)
    {
        float _1106 = _1100 * 5.0;
        _1102 = as_type<int>(_1106);
    }
    int _1108 = _1102;
    if (_1096)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_1108);
        out.gl_Position.z = _3092;
    }
    if (_1096)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1110 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1112 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1118 = _1104 * _1110;
    float _1120 = _1104 * _1112;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1124 = _1122 * 0.5;
    float _1126 = _1114 * _1118;
    float _1128 = _1116 * _1120;
    float _1130 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1136 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1130);
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1132);
    float _1140 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1134);
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1138);
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1154 = _924 + _1148;
    float _1156 = _711 + _1150;
    float _1158 = _888 + _1152;
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = _1162 * _1162;
    float _1170 = fma(_1166, _1166, _1168);
    float _1172 = sqrt(_1170);
    bool _1174 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1124;
    float _1178 = _1128;
    float _1180 = _1154;
    if (!_1174)
    {
        _1176 = _1154;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    if (!_1174)
    {
        _1178 = _1156;
    }
    float _1186 = _1178;
    float _1188 = _1186;
    if (!_1174)
    {
        _1180 = _1158;
    }
    float _1190 = _1180;
    bool _1192 = !_1174;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1172 + _1198;
        float _1202 = rsqrt(_1170);
        float _1204 = _1200 * _1196;
        float _1206 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = cos(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = sin(_1214);
        float _1218 = _1212 + (-1.0);
        float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = fma(_1216, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1224 = fma(_1158, _1212, _1220);
        float _1226 = _1202 * _1222;
        float _1228 = fma(_1166, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1230 = fma(_1162, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1224;
        _1188 = _1228;
        _1184 = _1230;
    }
    float _1232 = _1194;
    float _1234 = _1188;
    float _1236 = _1184;
    float _1238 = -_1040;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1242 = -_1042;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1246 = -_1050;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1266 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1258);
    float _1268 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1260);
    float _1270 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1264);
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1280 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1284 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1286 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1288 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1284);
    float _1294 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1286);
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1288);
    float _1298 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1300 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1292);
    float _1302 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1294);
    float _1304 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1298);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1300);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1302);
    float _1312 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1304);
    float _1314 = _1306 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1318 = _1314 * 0.5;
    out.m_33.x = _1316;
    out.gl_Position.x = _1310;
    out.gl_Position.y = _1312;
    out.gl_Position.z = _1306;
    out.gl_Position.w = _1308;
    out.m_50.z = _1318;
    out.m_50.w = _1308;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

