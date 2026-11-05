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
    float4 m_29 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_40 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_38 [[attribute(4)]];
    float4 m_36 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _531 = false;
    bool _283 = false;
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
        float _1371 = as_type<float>(_81);
        out.gl_Position.z = _1371;
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
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_65);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    int _115 = 0;
    if (_111)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_119);
        out.gl_Position.z = _1440;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_36.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_31.x;
    float _139 = in.m_31.y;
    float _141 = in.m_31.z;
    float _143 = in.m_26.x;
    float _145 = in.m_26.y;
    float _147 = in.m_26.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
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
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _139, _245);
    float _253 = fma(_239, _141, _247);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _145);
    float _259 = fma(_253, _125, _147);
    bool _261 = !_241;
    float _263 = _255;
    float _281;
    if (!_261)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_65);
        float _287 = 1.0 / _285;
        float _289 = _97 * _287;
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
    float _453 = in.m_36.x;
    float _455 = in.m_36.y;
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
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_65);
        float _535 = 1.0 / _533;
        float _537 = _97 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_38.x;
    float _543 = in.m_38.y;
    float _545 = in.m_38.z;
    float _547 = in.m_38.w;
    float _549 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _551 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _561 = _559 != 0;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _567 = _565 != 0;
    float _569 = _545 * 2.0;
    float _571 = _541 * 2.0;
    bool _573 = _547 > 0.5;
    float _575 = _543 + _545;
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    float _581 = _545 + _541;
    float _583 = _541 + (-0.5);
    float _585 = _575 + (-1.0);
    float _587 = _581 + (-1.0);
    float _589 = floor(_569);
    float _591 = floor(_571);
    float _593 = _579 * _97;
    bool _595 = _589 > 0.0;
    float _597 = exp2(_593);
    bool _599 = _589 >= 0.0;
    bool _601 = isnan(_589);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    int _609 = _607 ? 0 : 1;
    bool _611 = _591 >= 0.0;
    bool _613 = isnan(_591);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _619 ? 0 : 1;
    int _631 = _627;
    float _633 = _621;
    if (!_595)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _631 = _637;
    }
    int _639 = _631;
    float _641 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _649 = _591 > 0.0;
    float _651 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _641);
    float _653 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _647);
    float _655 = _543 * 2.0;
    float _657 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _659 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _663 = ~_629;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = floor(_655);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = fma(_657, -2.0, _661);
    int _681 = _667;
    float _683 = _659;
    if (!_649)
    {
        int _685 = ~_629;
        int _687 = _685 + 1;
        _681 = _687;
    }
    int _689 = _681;
    float _691 = -_621;
    float _693 = fma(_659, 2.0, _691);
    bool _695 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _703 = _699 || _701;
    float _705 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _707 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _651);
    if (!_645)
    {
        _683 = _543;
    }
    float _709 = _683;
    float _711 = _709;
    if (!_645)
    {
        _263 = _545;
    }
    float _713 = _263;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _713;
    if (!_645)
    {
        _633 = _545;
    }
    float _719 = _633;
    float _721 = _719;
    if (_645)
    {
        _711 = _541;
    }
    float _723 = _711;
    if (_645)
    {
        _717 = _543;
    }
    float _725 = _717;
    if (_645)
    {
        _721 = _543;
    }
    float _727 = _721;
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[83].z, _563);
    float _731 = _703 ? _671 : 0.0;
    bool _733 = _673 > 0.0;
    bool _735 = _673 >= 0.0;
    bool _737 = isnan(_673);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _747 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _749 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    int _751 = _743 ? 0 : 1;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _769 = 1.0 / _765;
    float _771 = -_767;
    float _773 = fma(_747, 2.0, _771);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _777 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _779 = ~_751;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _787 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _775);
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _791 = _783;
    if (!_733)
    {
        int _793 = ~_751;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = fma(_777, -2.0, _785);
    float _801 = -_97;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _693);
    float _805 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _789);
    float _807 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _787);
    float _809 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _811 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _749);
    float _813 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _815 = -_97;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[81].x, _773);
    float _819 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    if (_761)
    {
        float _821 = _731 * _769;
        _101 = _821;
    }
    float _823 = _101;
    float _825 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _831 = _543 + _541;
    float _833 = _551 * _827;
    float _835 = _825 * _829;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = -_179;
    int _843 = _573 ? as_type<int>(_841) : as_type<int>(_179);
    float _845 = _545 + (-0.5);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _857 = _855 != 0;
    float _859 = 1.0 / _839;
    float _861 = _543 + (-0.5);
    float _863 = _831 + (-1.0);
    bool _865 = !_849;
    int _867 = _865 ? 0 : 1;
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _871 = !_853;
    int _873 = _871 ? 0 : 1;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = !_857;
    int _881 = _879 ? 0 : 1;
    float _883 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    bool _885 = _545 > 0.5;
    float _887 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _889 = _541 > 0.5;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _895 = _543 > 0.5;
    float _897 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _899 = in.m_40.x;
    float _901 = in.m_40.y;
    float _903 = in.m_40.z;
    int _905 = abs(_867);
    float _907 = _877 * _859;
    float _909 = float(_639);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _897 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _915 = -_811;
    float _917 = _915 + 1.0;
    float _919 = float(_905);
    float _921 = -_809;
    float _923 = _921 + 1.0;
    float _925 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _927 = abs(_873);
    float _929 = _919 * _909;
    int _931 = abs(_881);
    float _933 = _929 * (-2.0);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _939 = fma(_887, _933, _887);
    float _941 = fma(_933, _899, _899);
    float _943 = float(_927);
    float _945 = float(_689);
    float _947 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _953 = _943 * _945;
    float _955 = fma(_939, _823, _947);
    float _957 = float(_797);
    float _959 = 1.0 / _951;
    float _961 = float(_931);
    float _963 = _953 * (-2.0);
    float _965 = _955 * 0.15915493667125701904296875;
    float _967 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _969 = fma(_963, _901, _901);
    float _971 = _961 * _957;
    float _973 = fma(_925, _963, _925);
    float _975 = -_179;
    int _977 = _895 ? as_type<int>(_975) : as_type<int>(_179);
    float _979 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[196].y, _969);
    float _981 = _971 * (-2.0);
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = fma(_973, _823, _979);
    float _989 = fma(_981, _903, _903);
    float _991 = _893 * _959;
    float _993 = fma(_967, _981, _967);
    bool _995 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _997 = isnan(_539);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    bool _1009 = !_561;
    float _1011 = _1009 ? _179 : as_type<float>(_977);
    float _1013 = _987 * 0.15915493667125701904296875;
    bool _1015 = !_567;
    float _1017 = _1015 ? _179 : as_type<float>(_843);
    float _1019 = fma(_993, _823, _1007);
    bool _1021 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1023 = isnan(_539);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    bool _1037 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_539);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1051 = _539 + _1049;
    float _1053 = _1019 * 0.15915493667125701904296875;
    float _1055 = _1031 * _1035;
    float _1057 = -_1031;
    float _1059 = _1057 + 1.0;
    float _1061 = _965 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_907, _1051, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1067 = -_175;
    int _1069 = _889 ? as_type<int>(_1067) : as_type<int>(_175);
    float _1071 = _1047 * _1059;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1075 = _539 + _1073;
    float _1077 = -_1047;
    float _1079 = _1077 + 1.0;
    float _1081 = _1011 + (-0.5);
    float _1083 = _1065 * _1071;
    float _1085 = _1013 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    bool _1089 = !_557;
    float _1091 = _1089 ? _175 : as_type<float>(_1069);
    float _1093 = fma(_991, _1075, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1095 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = -_175;
    int _1099 = _885 ? as_type<int>(_1097) : as_type<int>(_175);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1083);
    float _1103 = _1091 + 0.5;
    float _1105 = _1053 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    bool _1109 = !_677;
    float _1111 = _1109 ? _175 : as_type<float>(_1099);
    float _1113 = fma(_937, _1103, _803);
    float _1115 = -_1095;
    float _1117 = -_705;
    float _1119 = fma(_1115, _1081, _1117);
    float _1121 = fma(_1093, _1055, _1101);
    float _1123 = _1013 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1063 * _1087;
    float _1129 = _985 * _1087;
    float _1131 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1121);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1135 = _1053 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = _1087 * _1107;
    float _1141 = _1107 * _835;
    out.m_42.w = _1133;
    float _1143 = _1063 * _1141;
    float _1145 = _1063 * _1125;
    float _1147 = _985 * _1125;
    float _1149 = _1125 * _1107;
    float _1151 = fma(_1137, _1145, _1129);
    float _1153 = _1137 * _835;
    float _1155 = -_1127;
    float _1157 = fma(_1137, _1147, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1137, _1127, _1159);
    float _1163 = fma(_1151, _833, _1143);
    float _1165 = -_1153;
    float _1167 = fma(_1149, _833, _1165);
    float _1169 = _985 * _1141;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1173 = fma(_1161, _869, _1163);
    float _1175 = fma(_1137, _1129, _1145);
    float _1177 = fma(_1157, _833, _1169);
    float _1179 = fma(_1139, _869, _1167);
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1185 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1187 = fma(_1175, _869, _1177);
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1185);
    float _1195 = _1111 + 0.5;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1193);
    float _1203 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1211 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1213 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1215 = _1203 + _1205;
    float _1217 = fma(_1207, _1195, _817);
    float _1219 = _913 + _1211;
    float _1221 = _715 + _1213;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1017 + (-0.5);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    out.m_44.x = _1221;
    out.m_44.y = _1215;
    out.m_44.z = _1219;
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1235 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1237 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1231);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = -_1235;
    float _1245 = -_819;
    float _1247 = fma(_1243, _1227, _1245);
    float _1249 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1251 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1257 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1259 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1263 = -_807;
    float _1265 = _1263 + 1.0;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1255);
    float _1275 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1277 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1257);
    float _1279 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1281 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1261);
    float _1283 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1277);
    float _1289 = -_1265;
    float _1291 = fma(_1091, _1289, _1113);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1279);
    float _1297 = -_813;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1017, _917, _1247);
    float _1303 = -_923;
    float _1305 = fma(_1111, _1303, _1217);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1285);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1287);
    float _1313 = fma(_1011, _1299, _1119);
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1295);
    out.m_46.x = _1291;
    out.m_46.y = _1313;
    out.m_46.z = _1305;
    out.m_46.w = _1301;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1307;
    out.gl_Position.y = _1309;
    out.gl_Position.z = _1311;
    out.gl_Position.w = _1315;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _531 = false;
    bool _283 = false;
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
        float _1371 = as_type<float>(_81);
        out.gl_Position.z = _1371;
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
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_65);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    int _115 = 0;
    if (_111)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_119);
        out.gl_Position.z = _1440;
    }
    if (_111)
    {
        return out;
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_36.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_31.x;
    float _139 = in.m_31.y;
    float _141 = in.m_31.z;
    float _143 = in.m_26.x;
    float _145 = in.m_26.y;
    float _147 = in.m_26.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
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
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _139, _245);
    float _253 = fma(_239, _141, _247);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _145);
    float _259 = fma(_253, _125, _147);
    bool _261 = !_241;
    float _263 = _255;
    float _281;
    if (!_261)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_65);
        float _287 = 1.0 / _285;
        float _289 = _97 * _287;
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
    float _453 = in.m_36.x;
    float _455 = in.m_36.y;
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
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_65);
        float _535 = 1.0 / _533;
        float _537 = _97 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_38.x;
    float _543 = in.m_38.y;
    float _545 = in.m_38.z;
    float _547 = in.m_38.w;
    float _549 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _551 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _561 = _559 != 0;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _567 = _565 != 0;
    float _569 = _545 * 2.0;
    float _571 = _541 * 2.0;
    bool _573 = _547 > 0.5;
    float _575 = _543 + _545;
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    float _581 = _545 + _541;
    float _583 = _541 + (-0.5);
    float _585 = _575 + (-1.0);
    float _587 = _581 + (-1.0);
    float _589 = floor(_569);
    float _591 = floor(_571);
    float _593 = _579 * _97;
    bool _595 = _589 > 0.0;
    float _597 = exp2(_593);
    bool _599 = _589 >= 0.0;
    bool _601 = isnan(_589);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    int _609 = _607 ? 0 : 1;
    bool _611 = _591 >= 0.0;
    bool _613 = isnan(_591);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _619 ? 0 : 1;
    int _631 = _627;
    float _633 = _621;
    if (!_595)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _631 = _637;
    }
    int _639 = _631;
    float _641 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _649 = _591 > 0.0;
    float _651 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _641);
    float _653 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _647);
    float _655 = _543 * 2.0;
    float _657 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _659 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _663 = ~_629;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = floor(_655);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = fma(_657, -2.0, _661);
    int _681 = _667;
    float _683 = _659;
    if (!_649)
    {
        int _685 = ~_629;
        int _687 = _685 + 1;
        _681 = _687;
    }
    int _689 = _681;
    float _691 = -_621;
    float _693 = fma(_659, 2.0, _691);
    bool _695 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _703 = _699 || _701;
    float _705 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _707 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _651);
    if (!_645)
    {
        _683 = _543;
    }
    float _709 = _683;
    float _711 = _709;
    if (!_645)
    {
        _263 = _545;
    }
    float _713 = _263;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _713;
    if (!_645)
    {
        _633 = _545;
    }
    float _719 = _633;
    float _721 = _719;
    if (_645)
    {
        _711 = _541;
    }
    float _723 = _711;
    if (_645)
    {
        _717 = _543;
    }
    float _725 = _717;
    if (_645)
    {
        _721 = _543;
    }
    float _727 = _721;
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[83].z, _563);
    float _731 = _703 ? _671 : 0.0;
    bool _733 = _673 > 0.0;
    bool _735 = _673 >= 0.0;
    bool _737 = isnan(_673);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _747 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _749 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    int _751 = _743 ? 0 : 1;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _769 = 1.0 / _765;
    float _771 = -_767;
    float _773 = fma(_747, 2.0, _771);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _777 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _779 = ~_751;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _787 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _775);
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _791 = _783;
    if (!_733)
    {
        int _793 = ~_751;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = fma(_777, -2.0, _785);
    float _801 = -_97;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _693);
    float _805 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _789);
    float _807 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _787);
    float _809 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _811 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _749);
    float _813 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _815 = -_97;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[81].x, _773);
    float _819 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    if (_761)
    {
        float _821 = _731 * _769;
        _101 = _821;
    }
    float _823 = _101;
    float _825 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _831 = _543 + _541;
    float _833 = _551 * _827;
    float _835 = _825 * _829;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = -_179;
    int _843 = _573 ? as_type<int>(_841) : as_type<int>(_179);
    float _845 = _545 + (-0.5);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _857 = _855 != 0;
    float _859 = 1.0 / _839;
    float _861 = _543 + (-0.5);
    float _863 = _831 + (-1.0);
    bool _865 = !_849;
    int _867 = _865 ? 0 : 1;
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _871 = !_853;
    int _873 = _871 ? 0 : 1;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = !_857;
    int _881 = _879 ? 0 : 1;
    float _883 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    bool _885 = _545 > 0.5;
    float _887 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _889 = _541 > 0.5;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _895 = _543 > 0.5;
    float _897 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _899 = in.m_40.x;
    float _901 = in.m_40.y;
    float _903 = in.m_40.z;
    int _905 = abs(_867);
    float _907 = _877 * _859;
    float _909 = float(_639);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _897 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _915 = -_811;
    float _917 = _915 + 1.0;
    float _919 = float(_905);
    float _921 = -_809;
    float _923 = _921 + 1.0;
    float _925 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _927 = abs(_873);
    float _929 = _919 * _909;
    int _931 = abs(_881);
    float _933 = _929 * (-2.0);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _939 = fma(_887, _933, _887);
    float _941 = fma(_933, _899, _899);
    float _943 = float(_927);
    float _945 = float(_689);
    float _947 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _953 = _943 * _945;
    float _955 = fma(_939, _823, _947);
    float _957 = float(_797);
    float _959 = 1.0 / _951;
    float _961 = float(_931);
    float _963 = _953 * (-2.0);
    float _965 = _955 * 0.15915493667125701904296875;
    float _967 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _969 = fma(_963, _901, _901);
    float _971 = _961 * _957;
    float _973 = fma(_925, _963, _925);
    float _975 = -_179;
    int _977 = _895 ? as_type<int>(_975) : as_type<int>(_179);
    float _979 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[196].y, _969);
    float _981 = _971 * (-2.0);
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = fma(_973, _823, _979);
    float _989 = fma(_981, _903, _903);
    float _991 = _893 * _959;
    float _993 = fma(_967, _981, _967);
    bool _995 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _997 = isnan(_539);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    bool _1009 = !_561;
    float _1011 = _1009 ? _179 : as_type<float>(_977);
    float _1013 = _987 * 0.15915493667125701904296875;
    bool _1015 = !_567;
    float _1017 = _1015 ? _179 : as_type<float>(_843);
    float _1019 = fma(_993, _823, _1007);
    bool _1021 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1023 = isnan(_539);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    bool _1037 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_539);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1051 = _539 + _1049;
    float _1053 = _1019 * 0.15915493667125701904296875;
    float _1055 = _1031 * _1035;
    float _1057 = -_1031;
    float _1059 = _1057 + 1.0;
    float _1061 = _965 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_907, _1051, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1067 = -_175;
    int _1069 = _889 ? as_type<int>(_1067) : as_type<int>(_175);
    float _1071 = _1047 * _1059;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1075 = _539 + _1073;
    float _1077 = -_1047;
    float _1079 = _1077 + 1.0;
    float _1081 = _1011 + (-0.5);
    float _1083 = _1065 * _1071;
    float _1085 = _1013 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    bool _1089 = !_557;
    float _1091 = _1089 ? _175 : as_type<float>(_1069);
    float _1093 = fma(_991, _1075, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1095 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = -_175;
    int _1099 = _885 ? as_type<int>(_1097) : as_type<int>(_175);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1083);
    float _1103 = _1091 + 0.5;
    float _1105 = _1053 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    bool _1109 = !_677;
    float _1111 = _1109 ? _175 : as_type<float>(_1099);
    float _1113 = fma(_937, _1103, _803);
    float _1115 = -_1095;
    float _1117 = -_705;
    float _1119 = fma(_1115, _1081, _1117);
    float _1121 = fma(_1093, _1055, _1101);
    float _1123 = _1013 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1063 * _1087;
    float _1129 = _985 * _1087;
    float _1131 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1121);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1135 = _1053 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = _1087 * _1107;
    float _1141 = _1107 * _835;
    out.m_42.w = _1133;
    float _1143 = _1063 * _1141;
    float _1145 = _1063 * _1125;
    float _1147 = _985 * _1125;
    float _1149 = _1125 * _1107;
    float _1151 = fma(_1137, _1145, _1129);
    float _1153 = _1137 * _835;
    float _1155 = -_1127;
    float _1157 = fma(_1137, _1147, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1137, _1127, _1159);
    float _1163 = fma(_1151, _833, _1143);
    float _1165 = -_1153;
    float _1167 = fma(_1149, _833, _1165);
    float _1169 = _985 * _1141;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1173 = fma(_1161, _869, _1163);
    float _1175 = fma(_1137, _1129, _1145);
    float _1177 = fma(_1157, _833, _1169);
    float _1179 = fma(_1139, _869, _1167);
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1185 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1187 = fma(_1175, _869, _1177);
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1185);
    float _1195 = _1111 + 0.5;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1193);
    float _1203 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1211 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1213 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1215 = _1203 + _1205;
    float _1217 = fma(_1207, _1195, _817);
    float _1219 = _913 + _1211;
    float _1221 = _715 + _1213;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1017 + (-0.5);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    out.m_44.x = _1221;
    out.m_44.y = _1215;
    out.m_44.z = _1219;
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1235 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1237 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1231);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = -_1235;
    float _1245 = -_819;
    float _1247 = fma(_1243, _1227, _1245);
    float _1249 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1251 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1257 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1259 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1263 = -_807;
    float _1265 = _1263 + 1.0;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1255);
    float _1275 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1277 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1257);
    float _1279 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1281 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1261);
    float _1283 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1277);
    float _1289 = -_1265;
    float _1291 = fma(_1091, _1289, _1113);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1279);
    float _1297 = -_813;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1017, _917, _1247);
    float _1303 = -_923;
    float _1305 = fma(_1111, _1303, _1217);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1285);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1287);
    float _1313 = fma(_1011, _1299, _1119);
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1295);
    out.m_46.x = _1291;
    out.m_46.y = _1313;
    out.m_46.z = _1305;
    out.m_46.w = _1301;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1307;
    out.gl_Position.y = _1309;
    out.gl_Position.z = _1311;
    out.gl_Position.w = _1315;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _531 = false;
    bool _283 = false;
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
        float _1371 = as_type<float>(_81);
        out.gl_Position.z = _1371;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _103 = float(_65);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _75;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    int _115 = 0;
    if (_111)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_119);
        out.gl_Position.z = _1440;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = as_type<float>(int(gl_VertexIndex));
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_36.w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_31.x;
    float _139 = in.m_31.y;
    float _141 = in.m_31.z;
    float _143 = in.m_26.x;
    float _145 = in.m_26.y;
    float _147 = in.m_26.z;
    float _149 = 0.0;
    float _151 = _123;
    if (!_135)
    {
        float _153 = _123 * _123;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    int _165 = as_type<int>(_121) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_121) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_135;
    float _183 = _163;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _123 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _123);
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
        float _229 = _123 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _151 = _237;
    }
    float _239 = _151;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _137, _243);
    float _251 = fma(_239, _139, _245);
    float _253 = fma(_239, _141, _247);
    float _255 = fma(_249, _125, _143);
    float _257 = fma(_251, _125, _145);
    float _259 = fma(_253, _125, _147);
    bool _261 = !_241;
    float _263 = _255;
    float _281;
    if (!_261)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_65);
        float _287 = 1.0 / _285;
        float _289 = _97 * _287;
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
    float _453 = in.m_36.x;
    float _455 = in.m_36.y;
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
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_65);
        float _535 = 1.0 / _533;
        float _537 = _97 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_38.x;
    float _543 = in.m_38.y;
    float _545 = in.m_38.z;
    float _547 = in.m_38.w;
    float _549 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _551 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _561 = _559 != 0;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _567 = _565 != 0;
    float _569 = _545 * 2.0;
    float _571 = _541 * 2.0;
    bool _573 = _547 > 0.5;
    float _575 = _543 + _545;
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    float _581 = _545 + _541;
    float _583 = _541 + (-0.5);
    float _585 = _575 + (-1.0);
    float _587 = _581 + (-1.0);
    float _589 = floor(_569);
    float _591 = floor(_571);
    float _593 = _579 * _97;
    bool _595 = _589 > 0.0;
    float _597 = exp2(_593);
    bool _599 = _589 >= 0.0;
    bool _601 = isnan(_589);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    int _609 = _607 ? 0 : 1;
    bool _611 = _591 >= 0.0;
    bool _613 = isnan(_591);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _623 = ~_609;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _619 ? 0 : 1;
    int _631 = _627;
    float _633 = _621;
    if (!_595)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _631 = _637;
    }
    int _639 = _631;
    float _641 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _649 = _591 > 0.0;
    float _651 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _641);
    float _653 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _647);
    float _655 = _543 * 2.0;
    float _657 = _543 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _659 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _663 = ~_629;
    int _665 = _663 + 1;
    int _667 = _665 + 1;
    float _669 = -_597;
    float _671 = _669 + 1.0;
    float _673 = floor(_655);
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _677 = _675 != 0;
    float _679 = fma(_657, -2.0, _661);
    int _681 = _667;
    float _683 = _659;
    if (!_649)
    {
        int _685 = ~_629;
        int _687 = _685 + 1;
        _681 = _687;
    }
    int _689 = _681;
    float _691 = -_621;
    float _693 = fma(_659, 2.0, _691);
    bool _695 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _703 = _699 || _701;
    float _705 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _679);
    float _707 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _651);
    if (!_645)
    {
        _683 = _543;
    }
    float _709 = _683;
    float _711 = _709;
    if (!_645)
    {
        _263 = _545;
    }
    float _713 = _263;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _713;
    if (!_645)
    {
        _633 = _545;
    }
    float _719 = _633;
    float _721 = _719;
    if (_645)
    {
        _711 = _541;
    }
    float _723 = _711;
    if (_645)
    {
        _717 = _543;
    }
    float _725 = _717;
    if (_645)
    {
        _721 = _543;
    }
    float _727 = _721;
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[83].z, _563);
    float _731 = _703 ? _671 : 0.0;
    bool _733 = _673 > 0.0;
    bool _735 = _673 >= 0.0;
    bool _737 = isnan(_673);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _747 = _723 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _749 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    int _751 = _743 ? 0 : 1;
    bool _753 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(1.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _765 = 1.0 + _763;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _769 = 1.0 / _765;
    float _771 = -_767;
    float _773 = fma(_747, 2.0, _771);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _777 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _779 = ~_751;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _787 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _775);
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _791 = _783;
    if (!_733)
    {
        int _793 = ~_751;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = fma(_777, -2.0, _785);
    float _801 = -_97;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _693);
    float _805 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[78].w, _789);
    float _807 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _787);
    float _809 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _811 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _749);
    float _813 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _805);
    float _815 = -_97;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[81].x, _773);
    float _819 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    if (_761)
    {
        float _821 = _731 * _769;
        _101 = _821;
    }
    float _823 = _101;
    float _825 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _831 = _543 + _541;
    float _833 = _551 * _827;
    float _835 = _825 * _829;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _841 = -_179;
    int _843 = _573 ? as_type<int>(_841) : as_type<int>(_179);
    float _845 = _545 + (-0.5);
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _857 = _855 != 0;
    float _859 = 1.0 / _839;
    float _861 = _543 + (-0.5);
    float _863 = _831 + (-1.0);
    bool _865 = !_849;
    int _867 = _865 ? 0 : 1;
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _871 = !_853;
    int _873 = _871 ? 0 : 1;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = !_857;
    int _881 = _879 ? 0 : 1;
    float _883 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    bool _885 = _545 > 0.5;
    float _887 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _889 = _541 > 0.5;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _895 = _543 > 0.5;
    float _897 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
    float _899 = in.m_40.x;
    float _901 = in.m_40.y;
    float _903 = in.m_40.z;
    int _905 = abs(_867);
    float _907 = _877 * _859;
    float _909 = float(_639);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _897 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _915 = -_811;
    float _917 = _915 + 1.0;
    float _919 = float(_905);
    float _921 = -_809;
    float _923 = _921 + 1.0;
    float _925 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _927 = abs(_873);
    float _929 = _919 * _909;
    int _931 = abs(_881);
    float _933 = _929 * (-2.0);
    float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _937 = _911 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _939 = fma(_887, _933, _887);
    float _941 = fma(_933, _899, _899);
    float _943 = float(_927);
    float _945 = float(_689);
    float _947 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _953 = _943 * _945;
    float _955 = fma(_939, _823, _947);
    float _957 = float(_797);
    float _959 = 1.0 / _951;
    float _961 = float(_931);
    float _963 = _953 * (-2.0);
    float _965 = _955 * 0.15915493667125701904296875;
    float _967 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _969 = fma(_963, _901, _901);
    float _971 = _961 * _957;
    float _973 = fma(_925, _963, _925);
    float _975 = -_179;
    int _977 = _895 ? as_type<int>(_975) : as_type<int>(_179);
    float _979 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[196].y, _969);
    float _981 = _971 * (-2.0);
    float _983 = _965 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = fma(_973, _823, _979);
    float _989 = fma(_981, _903, _903);
    float _991 = _893 * _959;
    float _993 = fma(_967, _981, _967);
    bool _995 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _997 = isnan(_539);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    bool _1009 = !_561;
    float _1011 = _1009 ? _179 : as_type<float>(_977);
    float _1013 = _987 * 0.15915493667125701904296875;
    bool _1015 = !_567;
    float _1017 = _1015 ? _179 : as_type<float>(_843);
    float _1019 = fma(_993, _823, _1007);
    bool _1021 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1023 = isnan(_539);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    bool _1037 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_539);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1051 = _539 + _1049;
    float _1053 = _1019 * 0.15915493667125701904296875;
    float _1055 = _1031 * _1035;
    float _1057 = -_1031;
    float _1059 = _1057 + 1.0;
    float _1061 = _965 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_907, _1051, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1067 = -_175;
    int _1069 = _889 ? as_type<int>(_1067) : as_type<int>(_175);
    float _1071 = _1047 * _1059;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1075 = _539 + _1073;
    float _1077 = -_1047;
    float _1079 = _1077 + 1.0;
    float _1081 = _1011 + (-0.5);
    float _1083 = _1065 * _1071;
    float _1085 = _1013 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    bool _1089 = !_557;
    float _1091 = _1089 ? _175 : as_type<float>(_1069);
    float _1093 = fma(_991, _1075, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1095 = _935 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = -_175;
    int _1099 = _885 ? as_type<int>(_1097) : as_type<int>(_175);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1083);
    float _1103 = _1091 + 0.5;
    float _1105 = _1053 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    bool _1109 = !_677;
    float _1111 = _1109 ? _175 : as_type<float>(_1099);
    float _1113 = fma(_937, _1103, _803);
    float _1115 = -_1095;
    float _1117 = -_705;
    float _1119 = fma(_1115, _1081, _1117);
    float _1121 = fma(_1093, _1055, _1101);
    float _1123 = _1013 * 6.283185482025146484375;
    float _1125 = cos(_1123);
    float _1127 = _1063 * _1087;
    float _1129 = _985 * _1087;
    float _1131 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1121);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1135 = _1053 * 6.283185482025146484375;
    float _1137 = sin(_1135);
    float _1139 = _1087 * _1107;
    float _1141 = _1107 * _835;
    out.m_42.w = _1133;
    float _1143 = _1063 * _1141;
    float _1145 = _1063 * _1125;
    float _1147 = _985 * _1125;
    float _1149 = _1125 * _1107;
    float _1151 = fma(_1137, _1145, _1129);
    float _1153 = _1137 * _835;
    float _1155 = -_1127;
    float _1157 = fma(_1137, _1147, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1137, _1127, _1159);
    float _1163 = fma(_1151, _833, _1143);
    float _1165 = -_1153;
    float _1167 = fma(_1149, _833, _1165);
    float _1169 = _985 * _1141;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1173 = fma(_1161, _869, _1163);
    float _1175 = fma(_1137, _1129, _1145);
    float _1177 = fma(_1157, _833, _1169);
    float _1179 = fma(_1139, _869, _1167);
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1185 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1187 = fma(_1175, _869, _1177);
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1185);
    float _1195 = _1111 + 0.5;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1193);
    float _1203 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1211 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1213 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1215 = _1203 + _1205;
    float _1217 = fma(_1207, _1195, _817);
    float _1219 = _913 + _1211;
    float _1221 = _715 + _1213;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1227 = _1017 + (-0.5);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1225);
    out.m_44.x = _1221;
    out.m_44.y = _1215;
    out.m_44.z = _1219;
    float _1233 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1235 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1237 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1231);
    float _1239 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1241 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1243 = -_1235;
    float _1245 = -_819;
    float _1247 = fma(_1243, _1227, _1245);
    float _1249 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1251 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1257 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1259 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1263 = -_807;
    float _1265 = _1263 + 1.0;
    float _1267 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1255);
    float _1275 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1277 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1257);
    float _1279 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1281 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1261);
    float _1283 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1273);
    float _1287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1277);
    float _1289 = -_1265;
    float _1291 = fma(_1091, _1289, _1113);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1279);
    float _1297 = -_813;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1017, _917, _1247);
    float _1303 = -_923;
    float _1305 = fma(_1111, _1303, _1217);
    float _1307 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1281);
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1285);
    float _1311 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1287);
    float _1313 = fma(_1011, _1299, _1119);
    float _1315 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1295);
    out.m_46.x = _1291;
    out.m_46.y = _1313;
    out.m_46.z = _1305;
    out.m_46.w = _1301;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1307;
    out.gl_Position.y = _1309;
    out.gl_Position.z = _1311;
    out.gl_Position.w = _1315;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

