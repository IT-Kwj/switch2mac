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
    float4 m_29 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_40 [[attribute(1)]];
    float4 m_33 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _169 = false;
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
        float _1444 = as_type<float>(_83);
        out.gl_Position.z = _1444;
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
        float _1513 = as_type<float>(_121);
        out.gl_Position.z = _1513;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_33.x;
    float _125 = in.m_33.y;
    float _127 = in.m_33.z;
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _131 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _133 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _135 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _139);
    float _147 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _141);
    bool _149 = !_129;
    float _167;
    if (!_149)
    {
        float _151 = in.m_35.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_67);
        float _173 = 1.0 / _171;
        float _175 = _101 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _177 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _187 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _197 = _195 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _199;
    float _203 = 1.0 / _185;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = 1.0 / _193;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _177 + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _217 = 1.0 / _189;
    float _219 = _213 * _203;
    bool _221 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _223 = isnan(_177);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _177 + _233;
    float _237 = 1.0 / _201;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _177 + _239;
    float _243 = _181 * _209;
    bool _245 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _247 = isnan(_177);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_177);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _197;
    float _271 = _241 * _217;
    float _273 = -_231;
    float _275 = _273 + 1.0;
    float _277 = -_255;
    float _279 = _277 + 1.0;
    bool _281 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_177);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_267;
    float _295 = _293 + 1.0;
    float _297 = _255 * _275;
    float _299 = 1.0 / _207;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = _177 + _301;
    float _305 = _291 * _295;
    float _307 = -_291;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _311;
    float _315 = _303 * _237;
    bool _317 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _319 = isnan(_177);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _235 * _269;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _333 = _177 + _331;
    bool _335 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_177);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _327 * _279;
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _267 * _351;
    bool _361 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_177);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _333 * _299;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_355, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = -_371;
    float _387 = _385 + 1.0;
    float _389 = _371 * _309;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_377, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _345 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_393, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _405 = -_345;
    float _407 = _405 + 1.0;
    float _409 = _395 * _397;
    float _411 = _383 * _397;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_381, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_401, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _429 = fma(_415, _329, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _435;
    float _439 = fma(_421, _389, _425);
    float _441 = fma(_423, _389, _427);
    float _443 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _445 = fma(_437, _315, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _447 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _449 = fma(_403, _305, _439);
    float _451 = fma(_357, _305, _441);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _461 = fma(_429, _359, _449);
    float _463 = fma(_447, _359, _451);
    float _465 = fma(_455, _373, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _467 = fma(_459, _373, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _469 = fma(_443, _347, _461);
    float _471 = fma(_445, _347, _463);
    float _473 = fma(_465, _297, _469);
    float _475 = fma(_467, _297, _471);
    float _477 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].x, _473);
    float _479 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].y, _475);
    bool _481 = !_215;
    float _499;
    if (!_481)
    {
        float _483 = in.m_35.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_67);
        float _505 = 1.0 / _503;
        float _507 = _101 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = in.m_35.x;
    float _513 = in.m_35.y;
    float _515 = in.m_35.z;
    float _517 = in.m_35.w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = _515 * 2.0;
    float _523 = _511 * 2.0;
    float _525 = _513 * 2.0;
    float _527 = floor(_521);
    float _529 = floor(_523);
    float _531 = floor(_525);
    bool _533 = _527 > 0.0;
    bool _535 = _527 >= 0.0;
    bool _537 = isnan(_527);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _543 ? 0 : 1;
    int _547 = as_type<int>(_519) & 1;
    bool _549 = _547 != 0;
    int _551 = as_type<int>(_519) & 2;
    bool _553 = _551 != 0;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _557 = ~_545;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    bool _563 = _517 > 0.5;
    int _565 = _561;
    if (!_533)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _575 = _529 >= 0.0;
    bool _577 = isnan(_529);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = -_555;
    float _587 = fma(_573, 2.0, _585);
    bool _589 = _531 >= 0.0;
    bool _591 = isnan(_531);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = _513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _601 = _583 ? 0 : 1;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    int _615 = _597 ? 0 : 1;
    bool _617 = !_605;
    int _619 = _617 ? 0 : 1;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _623 = _531 > 0.0;
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    bool _629 = _529 > 0.0;
    float _631 = _513 + _515;
    int _633 = abs(_619);
    float _635 = float(_571);
    float _637 = _631 + (-1.0);
    float _639 = fma(_599, -2.0, _621);
    float _641 = _513 + _511;
    float _643 = float(_633);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = _641 + (-1.0);
    int _649 = ~_615;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = _643 * _635;
    int _657 = _653;
    if (!_623)
    {
        int _659 = ~_615;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _627 * _101;
    float _667 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = in.m_40.x;
    float _671 = in.m_40.y;
    float _673 = in.m_40.z;
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = exp2(_665);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _693 = ~_601;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    if (!_629)
    {
        int _701 = ~_601;
        int _703 = _701 + 1;
        _699 = _703;
    }
    int _705 = _699;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _711 = 1.0 / _687;
    bool _713 = !_609;
    int _715 = _713 ? 0 : 1;
    float _717 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    bool _719 = !_613;
    int _721 = _719 ? 0 : 1;
    float _723 = -_101;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _587);
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    int _739 = abs(_715);
    float _741 = -_689;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    float _747 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _749 = float(_739);
    float _751 = _735 ? _743 : 0.0;
    float _753 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _717);
    float _755 = float(_745);
    float _757 = _655 * (-2.0);
    float _759 = float(_705);
    if (_683)
    {
        float _761 = _751 * _711;
        _105 = _761;
    }
    float _763 = _105;
    float _765 = _511 + (-0.5);
    float _767 = fma(_757, _669, _669);
    float _769 = float(_663);
    float _771 = fma(_667, _757, _667);
    float _773 = _749 * _759;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    bool _777 = _513 > 0.5;
    float _779 = _755 * _769;
    float _781 = _773 * (-2.0);
    float _783 = fma(_771, _763, _775);
    float _785 = _513 + (-0.5);
    float _787 = in.m_42.x;
    float _789 = in.m_42.y;
    float _791 = fma(_781, _671, _671);
    float _793 = fma(_645, _781, _645);
    float _795 = _783 * 0.15915493667125701904296875;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _799 = in.m_26.x;
    float _801 = in.m_26.y;
    float _803 = in.m_26.z;
    float _805 = _515 + _511;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = _805 + (-1.0);
    float _817 = _779 * (-2.0);
    float _819 = 1.0 / _809;
    bool _821 = _511 > 0.5;
    float _823 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _825 = !_549;
    float _827 = _825 ? (-0.5) : 0.5;
    float _829 = _515 + (-0.5);
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _833 = _831 != 0;
    float _835 = fma(_793, _763, _797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _839 = _837 != 0;
    float _841 = 1.0 / _813;
    bool _843 = !_553;
    float _845 = _843 ? (-0.5) : 0.5;
    float _847 = _835 * 0.15915493667125701904296875;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _855 = _853 != 0;
    float _857 = fma(_817, _673, _673);
    float _859 = _795 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = -_845;
    int _865 = _563 ? as_type<int>(_863) : as_type<int>(_845);
    float _867 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].z, _857);
    bool _869 = _515 > 0.5;
    float _871 = fma(_823, _817, _823);
    float _873 = _479 * _789;
    float _875 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _477 * _787;
    float _879 = fma(_871, _763, _867);
    float _881 = _795 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _889 = _879 * 0.15915493667125701904296875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _509 + _891;
    float _895 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _897 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _887);
    float _901 = _847 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _907 = _509 + _905;
    float _909 = _893 * _819;
    float _911 = _907 * _841;
    float _913 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _915 = _847 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _921 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _931;
    float _935 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _845);
    float _939 = _889 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _947 = fma(_925, _909, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _949 = fma(_929, _909, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _951 = fma(_933, _909, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _953 = _935 * _937;
    float _955 = _943 * _945;
    float _957 = _889 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _883 * _903;
    float _963 = _861 * _917;
    float _965 = _861 * _903;
    float _967 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _969 = !_855;
    float _971 = _969 ? _845 : as_type<float>(_865);
    float _973 = _903 * _941;
    float _975 = _883 * _917;
    float _977 = _941 * _953;
    float _979 = _917 * _941;
    float _981 = -_961;
    float _983 = fma(_959, _963, _981);
    float _985 = -_963;
    float _987 = fma(_959, _961, _985);
    float _989 = _883 * _977;
    float _991 = fma(_959, _975, _965);
    float _993 = _959 * _953;
    float _995 = _861 * _977;
    float _997 = fma(_959, _965, _975);
    float _999 = fma(_991, _955, _989);
    float _1001 = -_993;
    float _1003 = fma(_979, _955, _1001);
    float _1005 = fma(_983, _955, _995);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1011 = fma(_987, _967, _999);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = fma(_973, _967, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1025 = fma(_997, _967, _1005);
    float _1027 = fma(_1015, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1029 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1023);
    float _1033 = fma(_1009, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1031);
    float _1041 = fma(_1021, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1043 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1049 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1051 = isnan(_509);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1043);
    float _1063 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1065 = _1047 * _1047;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1071 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1073 = isnan(_509);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_1063, _1063, _1065);
    float _1085 = -_1059;
    float _1087 = _1085 + 1.0;
    bool _1089 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1091 = isnan(_509);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = fma(_1069, _1069, _1083);
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = _1081 * _1087;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = -_845;
    int _1113 = _777 ? as_type<int>(_1111) : as_type<int>(_845);
    float _1115 = -_827;
    int _1117 = _821 ? as_type<int>(_1115) : as_type<int>(_827);
    float _1119 = _1099 * _1109;
    float _1121 = -_827;
    int _1123 = _869 ? as_type<int>(_1121) : as_type<int>(_827);
    float _1125 = sqrt(_1101);
    bool _1127 = !_839;
    float _1129 = _1127 ? _845 : as_type<float>(_1113);
    float _1131 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1133 = !_833;
    float _1135 = _1133 ? _827 : as_type<float>(_1117);
    float _1137 = _947 * _1119;
    bool _1139 = !_851;
    float _1141 = _1139 ? _827 : as_type<float>(_1123);
    float _1143 = _949 * _1119;
    float _1145 = _1129 + (-0.5);
    float _1147 = _1135 + 0.5;
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _951 * _1119;
    float _1153 = -_1099;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1131, _1147, _725);
    float _1159 = -_1149;
    float _1161 = -_747;
    float _1163 = fma(_1159, _1145, _1161);
    float _1165 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1167 = _919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1169 = _1125 > 0.0;
    float _1171 = _921 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1137);
    float _1175 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1143);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1151);
    float _1179 = _1165 + _1063;
    float _1181 = _1167 + _1047;
    float _1183 = _1171 + _1069;
    float _1185 = fma(_1033, _1105, _1173);
    float _1187 = fma(_1027, _1105, _1175);
    float _1189 = fma(_1041, _1105, _1177);
    float _1191 = _919;
    float _1193 = _1167;
    float _1195 = _921;
    if (!_1169)
    {
        _1191 = _1179;
    }
    float _1197 = _1191;
    float _1199 = _1197;
    if (!_1169)
    {
        _1193 = _1181;
    }
    float _1201 = _1193;
    float _1203 = _1201;
    if (!_1169)
    {
        _1195 = _1183;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    float _1211 = _1205;
    if (!_1207)
    {
        float _1213 = _145 * _145;
        float _1215 = rsqrt(_1101);
        float _1217 = fma(_143, _143, _1213);
        float _1219 = fma(_147, _147, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1063 * _1215;
        float _1225 = _1047 * _1215;
        float _1227 = _1069 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1221;
        float _1233 = _1217;
        if (!_1229)
        {
            _1231 = _1179;
        }
        float _1235 = _1231;
        _1199 = _1235;
        if (!_1229)
        {
            _1233 = _1181;
        }
        float _1237 = _1233;
        _1203 = _1237;
        if (!_1229)
        {
            _1209 = _1183;
        }
        float _1239 = _1209;
        bool _1241 = !_1229;
        _1211 = _1239;
        if (!_1241)
        {
            float _1243 = rsqrt(_1219);
            float _1245 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1247 = _145 * _1243;
            float _1249 = _143 * _1243;
            float _1251 = _1225 * _1247;
            float _1253 = _147 * _1243;
            float _1255 = fma(_1223, _1249, _1251);
            float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1259 = fma(_1227, _1253, _1255);
            float _1261 = _1259 * _1257;
            float _1263 = fma(_143, _1261, _1179);
            float _1265 = fma(_145, _1261, _1181);
            float _1267 = fma(_147, _1261, _1183);
            _1203 = _1265;
            _1199 = _1263;
            _1211 = _1267;
        }
    }
    float _1269 = _1203;
    float _1271 = _1199;
    float _1273 = _1211;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1185);
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1277);
    float _1287 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1187);
    float _1289 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1189);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1283);
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1297 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = -_971;
    float _1305 = _1303 + 0.5;
    float _1307 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1297);
    float _1309 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1329 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = _1141 + 0.5;
    float _1333 = -_753;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1327);
    float _1339 = -_737;
    float _1341 = _1339 + 1.0;
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1345 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1347 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1351 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1353 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1359 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1363 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = fma(_1129, _1335, _1163);
    float _1367 = -_1341;
    float _1369 = fma(_1135, _1367, _1157);
    float _1371 = _1343 * _1295;
    float _1373 = _1355 * _1325;
    float _1375 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1383 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1385 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1353);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1369;
    out.m_44.y = _1365;
    out.m_44.z = _1373;
    out.m_44.w = _1371;
    out.m_46.x = _1375;
    out.m_46.y = _1377;
    out.m_46.z = _1379;
    out.m_48.x = _1271;
    out.m_48.y = _1269;
    out.m_48.z = _1273;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1387;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _169 = false;
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
        float _1444 = as_type<float>(_83);
        out.gl_Position.z = _1444;
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
        float _1513 = as_type<float>(_121);
        out.gl_Position.z = _1513;
    }
    if (_115)
    {
        return out;
    }
    float _123 = in.m_33.x;
    float _125 = in.m_33.y;
    float _127 = in.m_33.z;
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _131 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _133 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _135 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _139);
    float _147 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _141);
    bool _149 = !_129;
    float _167;
    if (!_149)
    {
        float _151 = in.m_35.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_67);
        float _173 = 1.0 / _171;
        float _175 = _101 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _177 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _187 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _197 = _195 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _199;
    float _203 = 1.0 / _185;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = 1.0 / _193;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _177 + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _217 = 1.0 / _189;
    float _219 = _213 * _203;
    bool _221 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _223 = isnan(_177);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _177 + _233;
    float _237 = 1.0 / _201;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _177 + _239;
    float _243 = _181 * _209;
    bool _245 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _247 = isnan(_177);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_177);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _197;
    float _271 = _241 * _217;
    float _273 = -_231;
    float _275 = _273 + 1.0;
    float _277 = -_255;
    float _279 = _277 + 1.0;
    bool _281 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_177);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_267;
    float _295 = _293 + 1.0;
    float _297 = _255 * _275;
    float _299 = 1.0 / _207;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = _177 + _301;
    float _305 = _291 * _295;
    float _307 = -_291;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _311;
    float _315 = _303 * _237;
    bool _317 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _319 = isnan(_177);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _235 * _269;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _333 = _177 + _331;
    bool _335 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_177);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _327 * _279;
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _267 * _351;
    bool _361 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_177);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _333 * _299;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_355, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = -_371;
    float _387 = _385 + 1.0;
    float _389 = _371 * _309;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_377, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _345 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_393, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _405 = -_345;
    float _407 = _405 + 1.0;
    float _409 = _395 * _397;
    float _411 = _383 * _397;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_381, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_401, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _429 = fma(_415, _329, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _435;
    float _439 = fma(_421, _389, _425);
    float _441 = fma(_423, _389, _427);
    float _443 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _445 = fma(_437, _315, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _447 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _449 = fma(_403, _305, _439);
    float _451 = fma(_357, _305, _441);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _461 = fma(_429, _359, _449);
    float _463 = fma(_447, _359, _451);
    float _465 = fma(_455, _373, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _467 = fma(_459, _373, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _469 = fma(_443, _347, _461);
    float _471 = fma(_445, _347, _463);
    float _473 = fma(_465, _297, _469);
    float _475 = fma(_467, _297, _471);
    float _477 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].x, _473);
    float _479 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].y, _475);
    bool _481 = !_215;
    float _499;
    if (!_481)
    {
        float _483 = in.m_35.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_67);
        float _505 = 1.0 / _503;
        float _507 = _101 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = in.m_35.x;
    float _513 = in.m_35.y;
    float _515 = in.m_35.z;
    float _517 = in.m_35.w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = _515 * 2.0;
    float _523 = _511 * 2.0;
    float _525 = _513 * 2.0;
    float _527 = floor(_521);
    float _529 = floor(_523);
    float _531 = floor(_525);
    bool _533 = _527 > 0.0;
    bool _535 = _527 >= 0.0;
    bool _537 = isnan(_527);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _543 ? 0 : 1;
    int _547 = as_type<int>(_519) & 1;
    bool _549 = _547 != 0;
    int _551 = as_type<int>(_519) & 2;
    bool _553 = _551 != 0;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _557 = ~_545;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    bool _563 = _517 > 0.5;
    int _565 = _561;
    if (!_533)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _575 = _529 >= 0.0;
    bool _577 = isnan(_529);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = -_555;
    float _587 = fma(_573, 2.0, _585);
    bool _589 = _531 >= 0.0;
    bool _591 = isnan(_531);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = _513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _601 = _583 ? 0 : 1;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    int _615 = _597 ? 0 : 1;
    bool _617 = !_605;
    int _619 = _617 ? 0 : 1;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _623 = _531 > 0.0;
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    bool _629 = _529 > 0.0;
    float _631 = _513 + _515;
    int _633 = abs(_619);
    float _635 = float(_571);
    float _637 = _631 + (-1.0);
    float _639 = fma(_599, -2.0, _621);
    float _641 = _513 + _511;
    float _643 = float(_633);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = _641 + (-1.0);
    int _649 = ~_615;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = _643 * _635;
    int _657 = _653;
    if (!_623)
    {
        int _659 = ~_615;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _627 * _101;
    float _667 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = in.m_40.x;
    float _671 = in.m_40.y;
    float _673 = in.m_40.z;
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = exp2(_665);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _693 = ~_601;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    if (!_629)
    {
        int _701 = ~_601;
        int _703 = _701 + 1;
        _699 = _703;
    }
    int _705 = _699;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _711 = 1.0 / _687;
    bool _713 = !_609;
    int _715 = _713 ? 0 : 1;
    float _717 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    bool _719 = !_613;
    int _721 = _719 ? 0 : 1;
    float _723 = -_101;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _587);
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    int _739 = abs(_715);
    float _741 = -_689;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    float _747 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _749 = float(_739);
    float _751 = _735 ? _743 : 0.0;
    float _753 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _717);
    float _755 = float(_745);
    float _757 = _655 * (-2.0);
    float _759 = float(_705);
    if (_683)
    {
        float _761 = _751 * _711;
        _105 = _761;
    }
    float _763 = _105;
    float _765 = _511 + (-0.5);
    float _767 = fma(_757, _669, _669);
    float _769 = float(_663);
    float _771 = fma(_667, _757, _667);
    float _773 = _749 * _759;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    bool _777 = _513 > 0.5;
    float _779 = _755 * _769;
    float _781 = _773 * (-2.0);
    float _783 = fma(_771, _763, _775);
    float _785 = _513 + (-0.5);
    float _787 = in.m_42.x;
    float _789 = in.m_42.y;
    float _791 = fma(_781, _671, _671);
    float _793 = fma(_645, _781, _645);
    float _795 = _783 * 0.15915493667125701904296875;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _799 = in.m_26.x;
    float _801 = in.m_26.y;
    float _803 = in.m_26.z;
    float _805 = _515 + _511;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = _805 + (-1.0);
    float _817 = _779 * (-2.0);
    float _819 = 1.0 / _809;
    bool _821 = _511 > 0.5;
    float _823 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _825 = !_549;
    float _827 = _825 ? (-0.5) : 0.5;
    float _829 = _515 + (-0.5);
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _833 = _831 != 0;
    float _835 = fma(_793, _763, _797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _839 = _837 != 0;
    float _841 = 1.0 / _813;
    bool _843 = !_553;
    float _845 = _843 ? (-0.5) : 0.5;
    float _847 = _835 * 0.15915493667125701904296875;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _855 = _853 != 0;
    float _857 = fma(_817, _673, _673);
    float _859 = _795 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = -_845;
    int _865 = _563 ? as_type<int>(_863) : as_type<int>(_845);
    float _867 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].z, _857);
    bool _869 = _515 > 0.5;
    float _871 = fma(_823, _817, _823);
    float _873 = _479 * _789;
    float _875 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _477 * _787;
    float _879 = fma(_871, _763, _867);
    float _881 = _795 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _889 = _879 * 0.15915493667125701904296875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _509 + _891;
    float _895 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _897 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _887);
    float _901 = _847 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _907 = _509 + _905;
    float _909 = _893 * _819;
    float _911 = _907 * _841;
    float _913 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _915 = _847 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _921 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _931;
    float _935 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _845);
    float _939 = _889 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _947 = fma(_925, _909, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _949 = fma(_929, _909, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _951 = fma(_933, _909, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _953 = _935 * _937;
    float _955 = _943 * _945;
    float _957 = _889 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _883 * _903;
    float _963 = _861 * _917;
    float _965 = _861 * _903;
    float _967 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _969 = !_855;
    float _971 = _969 ? _845 : as_type<float>(_865);
    float _973 = _903 * _941;
    float _975 = _883 * _917;
    float _977 = _941 * _953;
    float _979 = _917 * _941;
    float _981 = -_961;
    float _983 = fma(_959, _963, _981);
    float _985 = -_963;
    float _987 = fma(_959, _961, _985);
    float _989 = _883 * _977;
    float _991 = fma(_959, _975, _965);
    float _993 = _959 * _953;
    float _995 = _861 * _977;
    float _997 = fma(_959, _965, _975);
    float _999 = fma(_991, _955, _989);
    float _1001 = -_993;
    float _1003 = fma(_979, _955, _1001);
    float _1005 = fma(_983, _955, _995);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1011 = fma(_987, _967, _999);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = fma(_973, _967, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1025 = fma(_997, _967, _1005);
    float _1027 = fma(_1015, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1029 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1023);
    float _1033 = fma(_1009, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1031);
    float _1041 = fma(_1021, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1043 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1049 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1051 = isnan(_509);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1043);
    float _1063 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1065 = _1047 * _1047;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1071 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1073 = isnan(_509);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_1063, _1063, _1065);
    float _1085 = -_1059;
    float _1087 = _1085 + 1.0;
    bool _1089 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1091 = isnan(_509);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = fma(_1069, _1069, _1083);
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = _1081 * _1087;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = -_845;
    int _1113 = _777 ? as_type<int>(_1111) : as_type<int>(_845);
    float _1115 = -_827;
    int _1117 = _821 ? as_type<int>(_1115) : as_type<int>(_827);
    float _1119 = _1099 * _1109;
    float _1121 = -_827;
    int _1123 = _869 ? as_type<int>(_1121) : as_type<int>(_827);
    float _1125 = sqrt(_1101);
    bool _1127 = !_839;
    float _1129 = _1127 ? _845 : as_type<float>(_1113);
    float _1131 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1133 = !_833;
    float _1135 = _1133 ? _827 : as_type<float>(_1117);
    float _1137 = _947 * _1119;
    bool _1139 = !_851;
    float _1141 = _1139 ? _827 : as_type<float>(_1123);
    float _1143 = _949 * _1119;
    float _1145 = _1129 + (-0.5);
    float _1147 = _1135 + 0.5;
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _951 * _1119;
    float _1153 = -_1099;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1131, _1147, _725);
    float _1159 = -_1149;
    float _1161 = -_747;
    float _1163 = fma(_1159, _1145, _1161);
    float _1165 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1167 = _919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1169 = _1125 > 0.0;
    float _1171 = _921 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1137);
    float _1175 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1143);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1151);
    float _1179 = _1165 + _1063;
    float _1181 = _1167 + _1047;
    float _1183 = _1171 + _1069;
    float _1185 = fma(_1033, _1105, _1173);
    float _1187 = fma(_1027, _1105, _1175);
    float _1189 = fma(_1041, _1105, _1177);
    float _1191 = _919;
    float _1193 = _1167;
    float _1195 = _921;
    if (!_1169)
    {
        _1191 = _1179;
    }
    float _1197 = _1191;
    float _1199 = _1197;
    if (!_1169)
    {
        _1193 = _1181;
    }
    float _1201 = _1193;
    float _1203 = _1201;
    if (!_1169)
    {
        _1195 = _1183;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    float _1211 = _1205;
    if (!_1207)
    {
        float _1213 = _145 * _145;
        float _1215 = rsqrt(_1101);
        float _1217 = fma(_143, _143, _1213);
        float _1219 = fma(_147, _147, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1063 * _1215;
        float _1225 = _1047 * _1215;
        float _1227 = _1069 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1221;
        float _1233 = _1217;
        if (!_1229)
        {
            _1231 = _1179;
        }
        float _1235 = _1231;
        _1199 = _1235;
        if (!_1229)
        {
            _1233 = _1181;
        }
        float _1237 = _1233;
        _1203 = _1237;
        if (!_1229)
        {
            _1209 = _1183;
        }
        float _1239 = _1209;
        bool _1241 = !_1229;
        _1211 = _1239;
        if (!_1241)
        {
            float _1243 = rsqrt(_1219);
            float _1245 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1247 = _145 * _1243;
            float _1249 = _143 * _1243;
            float _1251 = _1225 * _1247;
            float _1253 = _147 * _1243;
            float _1255 = fma(_1223, _1249, _1251);
            float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1259 = fma(_1227, _1253, _1255);
            float _1261 = _1259 * _1257;
            float _1263 = fma(_143, _1261, _1179);
            float _1265 = fma(_145, _1261, _1181);
            float _1267 = fma(_147, _1261, _1183);
            _1203 = _1265;
            _1199 = _1263;
            _1211 = _1267;
        }
    }
    float _1269 = _1203;
    float _1271 = _1199;
    float _1273 = _1211;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1185);
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1277);
    float _1287 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1187);
    float _1289 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1189);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1283);
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1297 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = -_971;
    float _1305 = _1303 + 0.5;
    float _1307 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1297);
    float _1309 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1329 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = _1141 + 0.5;
    float _1333 = -_753;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1327);
    float _1339 = -_737;
    float _1341 = _1339 + 1.0;
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1345 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1347 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1351 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1353 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1359 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1363 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = fma(_1129, _1335, _1163);
    float _1367 = -_1341;
    float _1369 = fma(_1135, _1367, _1157);
    float _1371 = _1343 * _1295;
    float _1373 = _1355 * _1325;
    float _1375 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1383 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1385 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1353);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1369;
    out.m_44.y = _1365;
    out.m_44.z = _1373;
    out.m_44.w = _1371;
    out.m_46.x = _1375;
    out.m_46.y = _1377;
    out.m_46.z = _1379;
    out.m_48.x = _1271;
    out.m_48.y = _1269;
    out.m_48.z = _1273;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1387;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _501 = false;
    bool _169 = false;
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
        float _1444 = as_type<float>(_83);
        out.gl_Position.z = _1444;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1513 = as_type<float>(_121);
        out.gl_Position.z = _1513;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_33.x;
    float _125 = in.m_33.y;
    float _127 = in.m_33.z;
    bool _129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _131 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _133 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _135 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _131);
    float _139 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _133);
    float _141 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _135);
    float _143 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _137);
    float _145 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _139);
    float _147 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _141);
    bool _149 = !_129;
    float _167;
    if (!_149)
    {
        float _151 = in.m_35.x;
        float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _157 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _159 = _157 * _153;
        float _161 = floor(_159);
        float _163 = -_161;
        float _165 = _159 + _163;
        _167 = _165;
        _169 = true;
    }
    else
    {
        float _171 = float(_67);
        float _173 = 1.0 / _171;
        float _175 = _101 * _173;
        _167 = _175;
    }
    _169 = false;
    float _177 = _167;
    float _179 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _181 = _177 + _179;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _187 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _197 = _195 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _199;
    float _203 = 1.0 / _185;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = 1.0 / _193;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _177 + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _217 = 1.0 / _189;
    float _219 = _213 * _203;
    bool _221 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _223 = isnan(_177);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _177 + _233;
    float _237 = 1.0 / _201;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _177 + _239;
    float _243 = _181 * _209;
    bool _245 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _247 = isnan(_177);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _259 = isnan(_177);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _197;
    float _271 = _241 * _217;
    float _273 = -_231;
    float _275 = _273 + 1.0;
    float _277 = -_255;
    float _279 = _277 + 1.0;
    bool _281 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_177);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -_267;
    float _295 = _293 + 1.0;
    float _297 = _255 * _275;
    float _299 = 1.0 / _207;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = _177 + _301;
    float _305 = _291 * _295;
    float _307 = -_291;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _311;
    float _315 = _303 * _237;
    bool _317 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _319 = isnan(_177);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _235 * _269;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _333 = _177 + _331;
    bool _335 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_177);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _327 * _279;
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _267 * _351;
    bool _361 = _177 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_177);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _333 * _299;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_355, _219, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = -_371;
    float _387 = _385 + 1.0;
    float _389 = _371 * _309;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_377, _219, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _345 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_393, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _405 = -_345;
    float _407 = _405 + 1.0;
    float _409 = _395 * _397;
    float _411 = _383 * _397;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_381, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_401, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _429 = fma(_415, _329, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _435;
    float _439 = fma(_421, _389, _425);
    float _441 = fma(_423, _389, _427);
    float _443 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _445 = fma(_437, _315, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _447 = fma(_419, _329, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _449 = fma(_403, _305, _439);
    float _451 = fma(_357, _305, _441);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _461 = fma(_429, _359, _449);
    float _463 = fma(_447, _359, _451);
    float _465 = fma(_455, _373, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _467 = fma(_459, _373, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _469 = fma(_443, _347, _461);
    float _471 = fma(_445, _347, _463);
    float _473 = fma(_465, _297, _469);
    float _475 = fma(_467, _297, _471);
    float _477 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].x, _473);
    float _479 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[149].y, _475);
    bool _481 = !_215;
    float _499;
    if (!_481)
    {
        float _483 = in.m_35.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_67);
        float _505 = 1.0 / _503;
        float _507 = _101 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = in.m_35.x;
    float _513 = in.m_35.y;
    float _515 = in.m_35.z;
    float _517 = in.m_35.w;
    float _519 = as_type<float>(int(gl_VertexIndex));
    float _521 = _515 * 2.0;
    float _523 = _511 * 2.0;
    float _525 = _513 * 2.0;
    float _527 = floor(_521);
    float _529 = floor(_523);
    float _531 = floor(_525);
    bool _533 = _527 > 0.0;
    bool _535 = _527 >= 0.0;
    bool _537 = isnan(_527);
    bool _539 = _535 || _537;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    int _545 = _543 ? 0 : 1;
    int _547 = as_type<int>(_519) & 1;
    bool _549 = _547 != 0;
    int _551 = as_type<int>(_519) & 2;
    bool _553 = _551 != 0;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _557 = ~_545;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    bool _563 = _517 > 0.5;
    int _565 = _561;
    if (!_533)
    {
        int _567 = ~_545;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _575 = _529 >= 0.0;
    bool _577 = isnan(_529);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = -_555;
    float _587 = fma(_573, 2.0, _585);
    bool _589 = _531 >= 0.0;
    bool _591 = isnan(_531);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = _513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _601 = _583 ? 0 : 1;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    int _615 = _597 ? 0 : 1;
    bool _617 = !_605;
    int _619 = _617 ? 0 : 1;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _623 = _531 > 0.0;
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    bool _629 = _529 > 0.0;
    float _631 = _513 + _515;
    int _633 = abs(_619);
    float _635 = float(_571);
    float _637 = _631 + (-1.0);
    float _639 = fma(_599, -2.0, _621);
    float _641 = _513 + _511;
    float _643 = float(_633);
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = _641 + (-1.0);
    int _649 = ~_615;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = _643 * _635;
    int _657 = _653;
    if (!_623)
    {
        int _659 = ~_615;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _627 * _101;
    float _667 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _669 = in.m_40.x;
    float _671 = in.m_40.y;
    float _673 = in.m_40.z;
    bool _675 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _677 = isnan(1.0);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _683 = _679 || _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _687 = 1.0 + _685;
    float _689 = exp2(_665);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _693 = ~_601;
    int _695 = _693 + 1;
    int _697 = _695 + 1;
    int _699 = _697;
    if (!_629)
    {
        int _701 = ~_601;
        int _703 = _701 + 1;
        _699 = _703;
    }
    int _705 = _699;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _691);
    float _711 = 1.0 / _687;
    bool _713 = !_609;
    int _715 = _713 ? 0 : 1;
    float _717 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    bool _719 = !_613;
    int _721 = _719 ? 0 : 1;
    float _723 = -_101;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _587);
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    int _739 = abs(_715);
    float _741 = -_689;
    float _743 = _741 + 1.0;
    int _745 = abs(_721);
    float _747 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _749 = float(_739);
    float _751 = _735 ? _743 : 0.0;
    float _753 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _717);
    float _755 = float(_745);
    float _757 = _655 * (-2.0);
    float _759 = float(_705);
    if (_683)
    {
        float _761 = _751 * _711;
        _105 = _761;
    }
    float _763 = _105;
    float _765 = _511 + (-0.5);
    float _767 = fma(_757, _669, _669);
    float _769 = float(_663);
    float _771 = fma(_667, _757, _667);
    float _773 = _749 * _759;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _767);
    bool _777 = _513 > 0.5;
    float _779 = _755 * _769;
    float _781 = _773 * (-2.0);
    float _783 = fma(_771, _763, _775);
    float _785 = _513 + (-0.5);
    float _787 = in.m_42.x;
    float _789 = in.m_42.y;
    float _791 = fma(_781, _671, _671);
    float _793 = fma(_645, _781, _645);
    float _795 = _783 * 0.15915493667125701904296875;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _799 = in.m_26.x;
    float _801 = in.m_26.y;
    float _803 = in.m_26.z;
    float _805 = _515 + _511;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _815 = _805 + (-1.0);
    float _817 = _779 * (-2.0);
    float _819 = 1.0 / _809;
    bool _821 = _511 > 0.5;
    float _823 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _825 = !_549;
    float _827 = _825 ? (-0.5) : 0.5;
    float _829 = _515 + (-0.5);
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _833 = _831 != 0;
    float _835 = fma(_793, _763, _797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _839 = _837 != 0;
    float _841 = 1.0 / _813;
    bool _843 = !_553;
    float _845 = _843 ? (-0.5) : 0.5;
    float _847 = _835 * 0.15915493667125701904296875;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _855 = _853 != 0;
    float _857 = fma(_817, _673, _673);
    float _859 = _795 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = -_845;
    int _865 = _563 ? as_type<int>(_863) : as_type<int>(_845);
    float _867 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[196].z, _857);
    bool _869 = _515 > 0.5;
    float _871 = fma(_823, _817, _823);
    float _873 = _479 * _789;
    float _875 = _801 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _477 * _787;
    float _879 = fma(_871, _763, _867);
    float _881 = _795 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = _801 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = _801 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _889 = _879 * 0.15915493667125701904296875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _509 + _891;
    float _895 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _897 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _899 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].x, _887);
    float _901 = _847 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _907 = _509 + _905;
    float _909 = _893 * _819;
    float _911 = _907 * _841;
    float _913 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[4].z, _895);
    float _915 = _847 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _921 = fma(_803, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _931;
    float _935 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _845);
    float _939 = _889 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _947 = fma(_925, _909, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _949 = fma(_929, _909, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _951 = fma(_933, _909, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _953 = _935 * _937;
    float _955 = _943 * _945;
    float _957 = _889 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _883 * _903;
    float _963 = _861 * _917;
    float _965 = _861 * _903;
    float _967 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _969 = !_855;
    float _971 = _969 ? _845 : as_type<float>(_865);
    float _973 = _903 * _941;
    float _975 = _883 * _917;
    float _977 = _941 * _953;
    float _979 = _917 * _941;
    float _981 = -_961;
    float _983 = fma(_959, _963, _981);
    float _985 = -_963;
    float _987 = fma(_959, _961, _985);
    float _989 = _883 * _977;
    float _991 = fma(_959, _975, _965);
    float _993 = _959 * _953;
    float _995 = _861 * _977;
    float _997 = fma(_959, _965, _975);
    float _999 = fma(_991, _955, _989);
    float _1001 = -_993;
    float _1003 = fma(_979, _955, _1001);
    float _1005 = fma(_983, _955, _995);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1011 = fma(_987, _967, _999);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = fma(_973, _967, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1023 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1025 = fma(_997, _967, _1005);
    float _1027 = fma(_1015, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1029 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1023);
    float _1033 = fma(_1009, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1035 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1031);
    float _1041 = fma(_1021, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1043 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1047 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1049 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1051 = isnan(_509);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1043);
    float _1063 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1065 = _1047 * _1047;
    float _1067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1071 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1073 = isnan(_509);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = fma(_1063, _1063, _1065);
    float _1085 = -_1059;
    float _1087 = _1085 + 1.0;
    bool _1089 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1091 = isnan(_509);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = fma(_1069, _1069, _1083);
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = _1081 * _1087;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    float _1111 = -_845;
    int _1113 = _777 ? as_type<int>(_1111) : as_type<int>(_845);
    float _1115 = -_827;
    int _1117 = _821 ? as_type<int>(_1115) : as_type<int>(_827);
    float _1119 = _1099 * _1109;
    float _1121 = -_827;
    int _1123 = _869 ? as_type<int>(_1121) : as_type<int>(_827);
    float _1125 = sqrt(_1101);
    bool _1127 = !_839;
    float _1129 = _1127 ? _845 : as_type<float>(_1113);
    float _1131 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1133 = !_833;
    float _1135 = _1133 ? _827 : as_type<float>(_1117);
    float _1137 = _947 * _1119;
    bool _1139 = !_851;
    float _1141 = _1139 ? _827 : as_type<float>(_1123);
    float _1143 = _949 * _1119;
    float _1145 = _1129 + (-0.5);
    float _1147 = _1135 + 0.5;
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1151 = _951 * _1119;
    float _1153 = -_1099;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1131, _1147, _725);
    float _1159 = -_1149;
    float _1161 = -_747;
    float _1163 = fma(_1159, _1145, _1161);
    float _1165 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1167 = _919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1169 = _1125 > 0.0;
    float _1171 = _921 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1137);
    float _1175 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1143);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1151);
    float _1179 = _1165 + _1063;
    float _1181 = _1167 + _1047;
    float _1183 = _1171 + _1069;
    float _1185 = fma(_1033, _1105, _1173);
    float _1187 = fma(_1027, _1105, _1175);
    float _1189 = fma(_1041, _1105, _1177);
    float _1191 = _919;
    float _1193 = _1167;
    float _1195 = _921;
    if (!_1169)
    {
        _1191 = _1179;
    }
    float _1197 = _1191;
    float _1199 = _1197;
    if (!_1169)
    {
        _1193 = _1181;
    }
    float _1201 = _1193;
    float _1203 = _1201;
    if (!_1169)
    {
        _1195 = _1183;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    float _1211 = _1205;
    if (!_1207)
    {
        float _1213 = _145 * _145;
        float _1215 = rsqrt(_1101);
        float _1217 = fma(_143, _143, _1213);
        float _1219 = fma(_147, _147, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1063 * _1215;
        float _1225 = _1047 * _1215;
        float _1227 = _1069 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1221;
        float _1233 = _1217;
        if (!_1229)
        {
            _1231 = _1179;
        }
        float _1235 = _1231;
        _1199 = _1235;
        if (!_1229)
        {
            _1233 = _1181;
        }
        float _1237 = _1233;
        _1203 = _1237;
        if (!_1229)
        {
            _1209 = _1183;
        }
        float _1239 = _1209;
        bool _1241 = !_1229;
        _1211 = _1239;
        if (!_1241)
        {
            float _1243 = rsqrt(_1219);
            float _1245 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1247 = _145 * _1243;
            float _1249 = _143 * _1243;
            float _1251 = _1225 * _1247;
            float _1253 = _147 * _1243;
            float _1255 = fma(_1223, _1249, _1251);
            float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1259 = fma(_1227, _1253, _1255);
            float _1261 = _1259 * _1257;
            float _1263 = fma(_143, _1261, _1179);
            float _1265 = fma(_145, _1261, _1181);
            float _1267 = fma(_147, _1261, _1183);
            _1203 = _1265;
            _1199 = _1263;
            _1211 = _1267;
        }
    }
    float _1269 = _1203;
    float _1271 = _1199;
    float _1273 = _1211;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1281 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1185);
    float _1283 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1275);
    float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1277);
    float _1287 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1187);
    float _1289 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1189);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1283);
    float _1293 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1297 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1279);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = -_971;
    float _1305 = _1303 + 0.5;
    float _1307 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1297);
    float _1309 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1327 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1329 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1331 = _1141 + 0.5;
    float _1333 = -_753;
    float _1335 = _1333 + 1.0;
    float _1337 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1327);
    float _1339 = -_737;
    float _1341 = _1339 + 1.0;
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1345 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1347 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1349 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1351 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1353 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1323);
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1359 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1363 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = fma(_1129, _1335, _1163);
    float _1367 = -_1341;
    float _1369 = fma(_1135, _1367, _1157);
    float _1371 = _1343 * _1295;
    float _1373 = _1355 * _1325;
    float _1375 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1345);
    float _1383 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float _1385 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1351);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1353);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1369;
    out.m_44.y = _1365;
    out.m_44.z = _1373;
    out.m_44.w = _1371;
    out.m_46.x = _1375;
    out.m_46.y = _1377;
    out.m_46.z = _1379;
    out.m_48.x = _1271;
    out.m_48.y = _1269;
    out.m_48.z = _1273;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1387;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

